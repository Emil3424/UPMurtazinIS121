using System.Windows;
using UPMurtazinIS121.ViewModel;

namespace UPMurtazinIS121
{
    public partial class MainWindow : Window
    {

        public MainWindow()
        {
            InitializeComponent();
            DataContext = new IngredientsViewModel();

            // Обработчик закрытия окна
            Closing += (s, e) =>
            {
                if (DataContext is IngredientsViewModel vm)
                {
                    if (vm.HasChanges())
                    {
                        var result = MessageBox.Show("Есть несохраненные изменения. Сохранить перед выходом?",
                            "Подтверждение",
                            MessageBoxButton.YesNoCancel,
                            MessageBoxImage.Question);

                        if (result == MessageBoxResult.Yes)
                        {
                            vm.SaveChanges();
                        }
                        else if (result == MessageBoxResult.Cancel)
                        {
                            e.Cancel = true;
                        }
                    }
                }
            };
        }
    }
}