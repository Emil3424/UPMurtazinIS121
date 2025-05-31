using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Data.Entity;
using System.Runtime.CompilerServices;
using UPMurtazinIS121.Model;

namespace UPMurtazinIS121.ViewModel
{
    public class MainViewModel : INotifyPropertyChanged
    {
        private readonly CoffeeDBMurtazinEntities2 _context = new CoffeeDBMurtazinEntities2();

        public ObservableCollection<IngredientModel> IngredientsList { get; } = new ObservableCollection<IngredientModel>();

        public MainViewModel()
        {
            _context.Ingredients.Load();
            foreach (var ingredient in _context.Ingredients.Local)
            {
                IngredientsList.Add(new IngredientModel(ingredient));
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}