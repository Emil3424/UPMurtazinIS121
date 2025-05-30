using System;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Data.Entity;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Windows;
using System.Windows.Input;
using UPMurtazinIS121.Model;

namespace UPMurtazinIS121.ViewModel
{
    public class IngredientsViewModel : INotifyPropertyChanged
    {
        private readonly CoffeeDBMurtazinEntities1 _context;
        private Ingredients _selectedIngredient;

        public ObservableCollection<Ingredients> IngredientsList { get; }

        public Ingredients SelectedIngredient
        {
            get => _selectedIngredient;
            set
            {
                if (_selectedIngredient == value) return;
                _selectedIngredient = value;
                OnPropertyChanged();
                ((RelayCommand)SaveCommand).RaiseCanExecuteChanged();
            }
        }

        public ICommand SaveCommand { get; }
        public ICommand AddNewCommand { get; }

        public IngredientsViewModel()
        {
            _context = new CoffeeDBMurtazinEntities1();
            ConfigureContext();
            LoadData();

            SaveCommand = new RelayCommand(
                SaveChanges,
                () => SelectedIngredient != null && IsIngredientValid(SelectedIngredient));

            AddNewCommand = new RelayCommand(AddNewIngredient);
        }

        private void ConfigureContext()
        {
            _context.Configuration.ProxyCreationEnabled = false;
            _context.Configuration.AutoDetectChangesEnabled = true;
            _context.Configuration.ValidateOnSaveEnabled = true;
        }

        private void LoadData()
        {
            try
            {
                _context.Ingredients.Load();
                IngredientsList = _context.Ingredients.Local;
                IngredientsList.CollectionChanged += IngredientsCollectionChanged;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка загрузки данных: {ex.Message}", "Ошибка",
                    MessageBoxButton.OK, MessageBoxImage.Error);
                IngredientsList = new ObservableCollection<Ingredients>();
            }
        }

        private void IngredientsCollectionChanged(object sender, System.Collections.Specialized.NotifyCollectionChangedEventArgs e)
        {
            if (e.NewItems != null)
            {
                foreach (Ingredients item in e.NewItems)
                {
                    item.PropertyChanged += IngredientPropertyChanged;
                    if (item.IngredientsID == 0) // Новый элемент
                    {
                        _context.Ingredients.Add(item);
                    }
                }
            }

            if (e.OldItems != null)
            {
                foreach (Ingredients item in e.OldItems)
                {
                    item.PropertyChanged -= IngredientPropertyChanged;
                    _context.Ingredients.Remove(item);
                }
            }
        }

        private void IngredientPropertyChanged(object sender, PropertyChangedEventArgs e)
        {
            ((RelayCommand)SaveCommand).RaiseCanExecuteChanged();
        }

        private bool IsIngredientValid(Ingredients ingredient)
        {
            return !string.IsNullOrWhiteSpace(ingredient.IngredientsName) &&
                   ingredient.KolichSklad >= 0 &&
                   ingredient.MinimKolich >= 0 &&
                   ingredient.CostForOne >= 0;
        }
        public bool HasChanges()
        {
            return _context.ChangeTracker.Entries()
                .Any(e => e.State == EntityState.Added ||
                         e.State == EntityState.Modified ||
                         e.State == EntityState.Deleted);
        }

        private void SaveChanges()
        {
            try
            {
                var changes = _context.ChangeTracker.Entries()
                    .Count(e => e.State != EntityState.Unchanged);

                if (changes > 0)
                {
                    _context.SaveChanges();
                    MessageBox.Show($"Успешно сохранено {changes} изменений!", "Сохранено",
                        MessageBoxButton.OK, MessageBoxImage.Information);
                }
                else
                {
                    MessageBox.Show("Нет изменений для сохранения", "Информация",
                        MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch (Exception ex)
            {
                string errorDetails = ex.InnerException != null
                    ? $"\nДетали: {ex.InnerException.Message}"
                    : "";

                MessageBox.Show($"Ошибка сохранения: {ex.Message}{errorDetails}", "Ошибка",
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void AddNewIngredient()
        {
            var newIngredient = new Ingredients
            {
                IngredientsName = "Новый ингредиент",
                TypeIngredients = "Тип",
                EdinIzmereniya = "кг",
                KolichSklad = 0,
                MinimKolich = 0,
                KolichUpakovka = 1,
                CostForOne = 0,
                ExpirationDate = DateTime.Now.AddMonths(6)
            };

            IngredientsList.Add(newIngredient);
            SelectedIngredient = newIngredient;

            MessageBox.Show("Новый ингредиент добавлен!\nНе забудьте сохранить изменения.", "Добавлено",
                MessageBoxButton.OK, MessageBoxImage.Information);
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}