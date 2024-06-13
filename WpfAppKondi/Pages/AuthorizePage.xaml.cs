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
    /// Interaction logic for AuthorizePage.xaml
    /// </summary>
    public partial class AuthorizePage : Page
    {
        public AuthorizePage()
        {
            InitializeComponent();
        }

        private void ButtonLogin_Click(object sender, RoutedEventArgs e)
        {
            string login = TextBoxLogin.Text;
            string password = TextBoxPassword.Text;

            if (login == "")
            {
                MessageBox.Show("Ошибка. Логин не заполнен.");
                return;
            }

            if (password == "")
            {
                MessageBox.Show("Ошибка. Пароль не заполнен.");
                return;
            }

            User user = DbConnection.KondiEntities.Users.FirstOrDefault(u=>u.Login == login && u.Password == password);

            if (user == null)
            {
                MessageBox.Show("Ошибка. Пользователь с такоей парой логин и пароль не найден");
                return;
            }

            GlobalVariables.User = user;

            switch (user.UserTypeId)
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
    }
}
