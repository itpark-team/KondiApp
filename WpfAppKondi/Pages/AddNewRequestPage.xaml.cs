using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using WpfAppKondi.Model;
using WpfAppKondi.PagesControllers;

namespace WpfAppKondi.Pages
{
    /// <summary>
    /// Interaction logic for AddNewRequestPage.xaml
    /// </summary>
    public partial class AddNewRequestPage : Page
    {
        private AddNewRequestPageController _addNewRequestPageController;

        private CustomerMainPage _customerMainPage;

        public AddNewRequestPage(CustomerMainPage customerMainPage)
        {
            InitializeComponent();

            _customerMainPage = customerMainPage;

            _addNewRequestPageController = new AddNewRequestPageController();

            ComboboxClimateTechType.ItemsSource = _addNewRequestPageController.GetAllClimateTechTypes();

            ComboboxClimateTechType.DisplayMemberPath = "Name";
            ComboboxClimateTechType.SelectedValuePath = "Id";
            ComboboxClimateTechType.SelectedIndex = 0;
        }

        private void ButtonAddRequest_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                long climateTechTypeId = (long)ComboboxClimateTechType.SelectedValue;
                string climateTechModel = TextBoxClimateTechModel.Text;
                string problemDescryption = TextBoxProblemDescryption.Text;

                _addNewRequestPageController.AddNewRequest(climateTechTypeId, climateTechModel, problemDescryption);

                MessageBox.Show("Заявка успешно созадана", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);

                _customerMainPage.FillGridCustomerRequests();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
