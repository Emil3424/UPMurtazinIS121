using System;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Data;
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
        private readonly CoffeeDBMurtazinEntities2 _context;
        private Ingredients _selectedIngredient;

        public ObservableCollection<Ingredients> IngredientsList { get; } = [];

        public Ingredients SelectedIngredient
        {
            get => _selectedIngredient;
            set
            {
                _selectedIngredient = value;
                OnPropertyChanged();
            }
        }

        public ICommand SaveCommand { get; }
        public ICommand AddNewCommand { get; }
        public ICommand DeleteCommand { get; }

        public IngredientsViewModel()
        {
            _context = new CoffeeDBMurtazinEntities2();
            _context.Configuration.ProxyCreationEnabled = false;
            LoadData();

            SaveCommand = new RelayCommand(SaveChanges);
            AddNewCommand = new RelayCommand(AddNewIngredient);
            DeleteCommand = new RelayCommand(DeleteIngredient);
        }

        private void LoadData()
        {
            try
            {
                _context.Ingredients.Load();
                foreach (var ingredient in _context.Ingredients.Local)
                {
                    IngredientsList.Add(ingredient);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка загрузки: {ex.Message}", "Ошибка",
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        public bool HasChanges()
        {
            return _context.ChangeTracker.Entries()
                .Any(e => e.State != EntityState.Unchanged);
        }

        private void SaveChanges(object parameter)
        {
            try
            {
                if (HasChanges())
                {
                    _context.SaveChanges();
                    MessageBox.Show("Изменения сохранены!", "Успех",
                        MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка сохранения: {ex.Message}", "Ошибка",
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void AddNewIngredient(object parameter)
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
            _context.Ingredients.Add(newIngredient);
        }

        private void DeleteIngredient(object parameter)
        {
            if (SelectedIngredient == null) return;

            if (MessageBox.Show($"Удалить {SelectedIngredient.IngredientsName}?",
                "Подтверждение",
                MessageBoxButton.YesNo,
                MessageBoxImage.Question) != MessageBoxResult.Yes) return;

            try
            {
                if (_context.Entry(SelectedIngredient).State == EntityState.Detached)
                {
                    var ingredientToDelete = _context.Ingredients.Find(SelectedIngredient.IngredientID);
                    if (ingredientToDelete != null)
                    {
                        _context.Ingredients.Remove(ingredientToDelete);
                    }
                }
                else
                {
                    _context.Ingredients.Remove(SelectedIngredient);
                }

                _context.SaveChanges();

                IngredientsList.Remove(SelectedIngredient);

                SelectedIngredient = IngredientsList.FirstOrDefault();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка удаления: {ex.Message}", "Ошибка",
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