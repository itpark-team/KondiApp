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

namespace WpfAppKondi.Pages
{
    /// <summary>
    /// Interaction logic for CustomerMainPage.xaml
    /// </summary>
    public partial class CustomerMainPage : Page
    {
        public CustomerMainPage()
        {
            InitializeComponent();

            FillGridCustomerRequests();

            EventPagesAggregator.GridCustomerDataUpdated += FillGridCustomerRequests;
        }

        public void FillGridCustomerRequests()
        {
            this.GridCustomerRequests.ItemsSource = DbConnector.KondiEntities.Requests.Where(r => r.ClientId == GlobalVariables.User.Id).ToList();
        }

        private void ButtonAddNewRequest_Click(object sender, RoutedEventArgs e)
        {
            //GlobalVariables.Frame.Navigate(new AddNewRequestPage(this));
            GlobalVariables.Frame.Navigate(new AddNewRequestPage());
        }
    }
}
