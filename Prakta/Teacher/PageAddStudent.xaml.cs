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

namespace Prakta.Teacher
{
    /// <summary>
    /// Логика взаимодействия для PageAddStudent.xaml
    /// </summary>
    public partial class PageAddStudent : Page
    {
        public PageAddStudent()
        {
            InitializeComponent();
            CmbSpecial.SelectedValuePath = "Id";
            CmbSpecial.DisplayMemberPath = "Name";
            CmbSpecial.ItemsSource = OdbConnectHelper.entObj.Special.ToList();

            CmbYear.SelectedValuePath = "Id";
            CmbYear.DisplayMemberPath = "Year";
            CmbYear.ItemsSource = OdbConnectHelper.entObj.YearAdd.ToList();

            CmbFormTime.SelectedValuePath = "Id";
            CmbFormTime.DisplayMemberPath = "Time";
            CmbFormTime.ItemsSource = OdbConnectHelper.entObj.FormTime.ToList();

            CmbNameGroup.SelectedValuePath = "Id";
            CmbNameGroup.DisplayMemberPath = "Name";
            CmbNameGroup.ItemsSource = OdbConnectHelper.entObj.NameGroup.ToList();
        }

        private void BtnAddStudent_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Student stdObj = new Student()
                {
                    Name = TxbNameStudent.Text,
                    NameGroup = CmbNameGroup.SelectedItem as NameGroup,
                    Special = CmbSpecial.SelectedItem as Special,
                    FormTime = CmbFormTime.SelectedItem as FormTime,
                    YearAdd = CmbYear.SelectedItem as YearAdd,
                };
                OdbConnectHelper.entObj.Student.Add(stdObj);
                OdbConnectHelper.entObj.SaveChanges();
                MessageBox.Show("Студент "+ stdObj.Name +" успешно добавлен!",
                                "Уведомление",
                                MessageBoxButton.OK,
                                MessageBoxImage.Information);
                FrameApp.frmObj.GoBack();
            } 
            catch (Exception)
            {
                MessageBox.Show
                    ("Критическая работа с приложением",
                    "Уведомление",
                    MessageBoxButton.OK,
                    MessageBoxImage.Warning);
            }
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            FrameApp.frmObj.GoBack();
        }
    }
}
