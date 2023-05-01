using Prakta.DataFiles;
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

namespace Prakta.Pages
{
    /// <summary>
    /// Логика взаимодействия для RegPage.xaml
    /// </summary>
    public partial class RegPage : Page
    {
        public RegPage()
        {
            InitializeComponent();
        }
        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            FrameApp.frmObj.GoBack();
        }

        private void PsbPassword_PasswordChanged(object sender, RoutedEventArgs e)
        {
            if (TxbPassword.Text == PsbPassword.Password)
            {
                BtnCreate.IsEnabled = true;
                PsbPassword.Background = Brushes.LightGreen;
                PsbPassword.BorderBrush = Brushes.GreenYellow;
            }
            else
            { BtnCreate.IsEnabled = false; }
            PsbPassword.Background = Brushes.DarkGray;
            PsbPassword.BorderBrush = Brushes.Black;
        }

        private void BtnCreate_Click(object sender, RoutedEventArgs e)
        {
            if (OdbConnectHelper.entObj.User.Count(x => x.Login == TxbLogin.Text) > 0)
            {
                MessageBox.Show("Такой пользователь уже существует!", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
                return;
            }
            else
            {
                try
                {
                    User userObj = new User()
                    {
                        Login = TxbLogin.Text,
                        Password = PsbPassword.Password,
                        IdRole = 1
                    };

                    OdbConnectHelper.entObj.User.Add(userObj);
                    OdbConnectHelper.entObj.SaveChanges();
                    MessageBox.Show("Пользователь создан!", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Ошибка работы приложения: " + ex.Message.ToString(), "Критический сбор работы", MessageBoxButton.OK, MessageBoxImage.Warning);
                }


            }
        }
    }
}

