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
    /// Логика взаимодействия для LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        public LoginPage()
        {
            InitializeComponent();
        }
        private void BtnReg_Click(object sender, RoutedEventArgs e)
        {
            FrameApp.frmObj.Navigate(new RegPage());
        }

        private void BtnLogin_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var userObj = OdbConnectHelper.entObj.User.FirstOrDefault
                    (
                        x => x.Login == TxbLogin.Text && x.Password == PsbPassword.Password
                    );
                if ( userObj == null )
                {
                    MessageBox.Show("Такой пользователь отсутсвует!!!",
                    "Уведомление",
                    MessageBoxButton.OK,
                    MessageBoxImage.Warning);

                    FrameApp.frmObj.Navigate(new RegPage());
                }
                else
                {
                    switch(userObj.IdRole) 
                    {
                        case 1:
                        /*MessageBox.Show("Здравстуйб "+userObj.Login+"!",
                            "Уведомление",
                            MessageBoxButton.OK,
                            MessageBoxImage.Warning);*/
                            FrameApp.frmObj.Navigate (new PageStudent());
                            break;
                        case 2:
                            /*MessageBox.Show("Здравстуйте, "+userObj.Login+"!",
                            "Уведомление",
                            MessageBoxButton.OK,
                            MessageBoxImage.Warning);*/
                            FrameApp.frmObj.Navigate(new PageTeacher());
                            break;
                    }
                }
            }

            catch(Exception ex)
            {
                MessageBox.Show("Критическая сбор в работе приложения:" + ex.Message.ToString(),
                    "Уведомление",
                    MessageBoxButton.OK,
                    MessageBoxImage.Warning);
            }
        }
    }
}
