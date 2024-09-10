using PutPredkovApp.Classes;
using PutPredkovApp.Entities;
using PutPredkovApp.Windows;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Hosting;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace PutPredkovApp.Pages
{
    /// <summary>
    /// Interaction logic for EmployeePage.xaml
    /// </summary>  
    public partial class EmployeePage : Page
    {
        private List<Employees> employees = new List<Employees>();
        public EmployeePage()
        {
            InitializeComponent();
            RoleCmb.ItemsSource = AppData.Context.Position.ToList();
            Update();
        }

        private void Update()
        {
            //if(AppData.CurrentEmployee != null)
            //{

            //}
            employees = AppData.Context.Employees.ToList();

            if(AppData.CurrentEmployee != null)
            {
                if(AppData.CurrentEmployee.PositionCode == 100 || AppData.CurrentEmployee.PositionCode == 101)
                {
                     employees.Insert(0, new Employees() {Address="AddItem"});
                }
            }


            EmployeeList.ItemsSource = employees;

            if(!string.IsNullOrWhiteSpace(SearchBar.Text))
               employees =  employees.Where(p=>p.Address != "AddItem" && p.Name.Trim().ToLower().Contains(SearchBar.Text.Trim().ToLower())).ToList();

            if(RoleCmb.SelectedIndex != -1 || RoleCmb.SelectedItem != null)
               employees =  employees.Where(p =>p.Position == RoleCmb.SelectedItem as Position).ToList();

            EmployeeList.ItemsSource = employees;
        }

        private void EmployeePnl_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            if(((sender as Border).DataContext as Employees).Address == "AddItem")
            {
                EmployeeAddEditWindow employeeAddEditWindow = new EmployeeAddEditWindow(null);
                employeeAddEditWindow.ShowDialog();
            }
            else
            {
                EmployeeAddEditWindow employeeAddEditWindow = new EmployeeAddEditWindow((sender as Border).DataContext as Employees);
                employeeAddEditWindow.ShowDialog();
            }
            Update();
        }

        private void SearchBar_TextChanged(object sender, TextChangedEventArgs e)
        {
            Update();
        }

        private void RoleCmb_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }

        private void ClearBtn_Click(object sender, RoutedEventArgs e)
        {
            RoleCmb.SelectedItem = null;
            SearchBar.Text = string.Empty;
        }
    }
}
