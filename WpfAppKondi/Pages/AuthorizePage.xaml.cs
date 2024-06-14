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
    /// Interaction logic for AuthorizePage.xaml
    /// </summary>
    public partial class AuthorizePage : Page
    {
        private AuthorizePageController _authorizePageController;

        public AuthorizePage()
        {
            InitializeComponent();

            _authorizePageController = new AuthorizePageController();
        }

        private void ButtonLogin_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                string login = TextBoxLogin.Text;
                string password = TextBoxPassword.Text;

                GlobalVariables.User = _authorizePageController.FindUserByLoginAndPassword(login, password);

                switch (GlobalVariables.User.UserTypeId)
                {
                    case 2:
                        GlobalVariables.Frame.Navigate(new SpecialistMainPage());
                        break;
                    case 3:
                        GlobalVariables.Frame.Navigate(new CustomerMainPage());
                        break;
                    case 4:
                        GlobalVariables.Frame.Navigate(new CustomerMainPage());
                        break;

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }

        }
    }
}
