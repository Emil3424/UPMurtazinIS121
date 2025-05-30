namespace UPMurtazinIS121.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.Runtime.CompilerServices;

    public partial class Ingredients : INotifyPropertyChanged
    {
        public Ingredients()
        {
            this.InventoryAlerts = new HashSet<InventoryAlerts>();
            this.InventoryTransactions = new HashSet<InventoryTransactions>();
            this.Recipes = new HashSet<Recipes>();
            this.Suppliers = new HashSet<Suppliers>();
        }

        private string _ingredientsName;
        private string _typeIngredients;
        private decimal? _kolichSklad;
        private int? _minimKolich;
        private int? _kolichUpakovka;
        private int? _costForOne;

        public string IngredientsName
        {
            get => _ingredientsName;
            set
            {
                _ingredientsName = value;
                OnPropertyChanged();
            }
        }

        public string TypeIngredients
        {
            get => _typeIngredients;
            set
            {
                _typeIngredients = value;
                OnPropertyChanged();
            }
        }
        public string EdinIzmereniya { get; set; }
        public Nullable<decimal> KolichSklad
        {
            get => _kolichSklad;
            set
            {
                _kolichSklad = value;
                OnPropertyChanged();
                OnPropertyChanged(nameof(MinOrderCost)); // Обновляем при изменении
            }
        }

        public Nullable<int> MinimKolich
        {
            get => _minimKolich;
            set
            {
                _minimKolich = value;
                OnPropertyChanged();
                OnPropertyChanged(nameof(MinOrderCost));
            }
        }
        public Nullable<int> KolichUpakovka
        {
            get => _kolichUpakovka;
            set
            {
                _kolichUpakovka = value;
                OnPropertyChanged();
                OnPropertyChanged(nameof(MinOrderCost));
            }
        }

        public Nullable<int> CostForOne
        {
            get => _costForOne;
            set
            {
                _costForOne = value;
                OnPropertyChanged();
                OnPropertyChanged(nameof(MinOrderCost));
            }
        }
        public decimal MinOrderCost
        {
            get
            {
                if (KolichSklad >= MinimKolich ||
                    !KolichSklad.HasValue ||
                    !MinimKolich.HasValue ||
                    !KolichUpakovka.HasValue ||
                    !CostForOne.HasValue)
                {
                    return 0.00m;
                }

                decimal deficit = (decimal)(MinimKolich - KolichSklad);
                int packages = (int)Math.Ceiling(deficit / (decimal)KolichUpakovka);
                decimal minOrderQuantity = packages * (decimal)KolichUpakovka;
                return minOrderQuantity * (decimal)CostForOne;
            }
        }
        public string Description { get; set; }
        public Nullable<System.DateTime> ExpirationDate { get; set; }

        public virtual EdIzmereniya EdIzmereniya { get; set; }
        public virtual TypeIngredients TypeIngredients1 { get; set; }
        public virtual ICollection<InventoryAlerts> InventoryAlerts { get; set; }
        public virtual ICollection<InventoryTransactions> InventoryTransactions { get; set; }
        public virtual ICollection<Recipes> Recipes { get; set; }
        public virtual ICollection<Suppliers> Suppliers { get; set; }

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
        public string this[string columnName]
        {
            get
            {
                return columnName switch
                {
                    nameof(IngredientsName) when string.IsNullOrWhiteSpace(IngredientsName) => "Введите название",
                    nameof(TypeIngredients) when string.IsNullOrWhiteSpace(TypeIngredients) => "Укажите тип",
                    nameof(EdinIzmereniya) when string.IsNullOrWhiteSpace(EdinIzmereniya) => "Выберите единицу измерения",
                    nameof(KolichSklad) when KolichSklad.HasValue && KolichSklad < 0 => "Количество на складе не может быть отрицательным",
                    nameof(MinimKolich) when MinimKolich.HasValue && MinimKolich < 0 => "Минимальное количество не может быть отрицательным",
                    nameof(CostForOne) when CostForOne.HasValue && CostForOne < 0 => "Цена не может быть отрицательной",
                    _ => null
                };
            }
        }
        public string Error => null;
    }
}
