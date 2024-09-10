using PutPredkovApp.Classes;
using PutPredkovApp.Entities;
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

namespace PutPredkovApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : TianXiaTech.BlurWindow
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void toggleGhoust_Unchecked(object sender, RoutedEventArgs e)
        {
            NameTb.IsReadOnly = false;
            IdTb.IsReadOnly = false;
        }

        private void toggleGhoust_Checked(object sender, RoutedEventArgs e)
        {
            NameTb.Text = "";
            IdTb.Text = "";
            NameTb.IsReadOnly = true;
            IdTb.IsReadOnly = true;
        }

        private void BtnEnter_Click(object sender, RoutedEventArgs e)
        {
            if(toggleGhoust.IsChecked ==  true)
            {
                Windows.NavigationWindow navigationWindow = new Windows.NavigationWindow(null);
                navigationWindow.Show();
                this.Close();
                return;
            }
            if((string.IsNullOrWhiteSpace(IdTb.Text) || string.IsNullOrWhiteSpace(NameTb.Text)) && toggleGhoust.IsChecked == false)
            {
                MessageBox.Show("Проверьте корректность введённых данных");
                return;
            }
            Employees employees = new Employees();
            employees = null;
            try
            {
                employees = AppData.Context.Employees.Where(p => p.IDEmpioyees.ToString() == IdTb.Text && p.Name == NameTb.Text).FirstOrDefault();
            }
            catch { }

            if(employees!=null)
            {
                Windows.NavigationWindow navigationWindow = new Windows.NavigationWindow(employees);
                navigationWindow.Show();
                AppData.CurrentEmployee = employees;
                this.Close();
            }
            else
            {
                MessageBox.Show("Введён неверный индификатор пользователя, или имя");
            }
        }
    }
}
