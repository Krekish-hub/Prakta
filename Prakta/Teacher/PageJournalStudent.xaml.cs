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
    /// Логика взаимодействия для PageJournalStudent.xaml
    /// </summary>
    public partial class PageJournalStudent : Page
    {
        public PageJournalStudent(Student student)
        {
            InitializeComponent();
            TxtName.Text = student.Name;
            GridEvaluation.ItemsSource = OdbConnectHelper.entObj.Journal.Where(x => x.IdStudent == student.Id).ToList();
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            FrameApp.frmObj.GoBack();
        }

        private void BtnPrint_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
