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
            _context.Configuration.ProxyCreationEnabled = false;
            _context.Configuration.AutoDetectChangesEnabled = true;
            _context.Ingredients.Load();
            IngredientsList = _context.Ingredients.Local;

            SaveCommand = new RelayCommand(
                _ => SaveChanges(),
                _ => SelectedIngredient != null && IsIngredientValid(SelectedIngredient));

            AddNewCommand = new RelayCommand(
                _ => AddNewIngredient(),
                _ => true);

            IngredientsList.CollectionChanged += (s, e) =>
            {
                if (e.NewItems != null)
                    foreach (Ingredients item in e.NewItems)
                        item.PropertyChanged += IngredientPropertyChanged;

                if (e.OldItems != null)
                    foreach (Ingredients item in e.OldItems)
                        item.PropertyChanged -= IngredientPropertyChanged;
            };
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

        private void SaveChanges()
        {
            try
            {
                _context.SaveChanges();
                MessageBox.Show("Изменения успешно сохранены в базе данных!", "Успех",
                    MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка сохранения: {ex.Message}\n\nПроверьте введенные данные.", "Ошибка",
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void AddNewIngredient()
        {
            try
            {
                var newIngredient = new Ingredients
                {
                    IngredientsName = "Новый ингредиент",
                    TypeIngredients = "Тип",
                    EdinIzmereniya = "кг",
                    KolichSklad = 0,
                    MinimKolich = 0,
                    KolichUpakovka = 1,
                    CostForOne = 0
                };

                _context.Ingredients.Add(newIngredient);
                IngredientsList.Add(newIngredient);
                SelectedIngredient = newIngredient;

                MessageBox.Show("Новый ингредиент добавлен. Не забудьте сохранить изменения!", "Добавлено",
                    MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при добавлении: {ex.Message}", "Ошибка",
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}