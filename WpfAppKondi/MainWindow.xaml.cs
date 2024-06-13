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
using WpfAppKondi.Pages;

namespace WpfAppKondi
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            GlobalVariables.Frame = this.Frame;
            GlobalVariables.Frame.Navigate(new AuthorizePage());
        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            this.Frame.GoBack();
        }

        private void ButtonExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Frame_ContentRendered(object sender, EventArgs e)
        {
            if (Frame.CanGoBack)
            {
                ButtonBack.Visibility = Visibility.Visible;
            }
            else
            {
                ButtonBack.Visibility = Visibility.Collapsed;
            }
        }
    }
}
