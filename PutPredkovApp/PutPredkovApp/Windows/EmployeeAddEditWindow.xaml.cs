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
using winForms = System.Windows.Forms;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace PutPredkovApp.Windows
{
    /// <summary>
    /// Interaction logic for EmployeeAddEditWindow.xaml
    /// </summary>
    public partial class EmployeeAddEditWindow : TianXiaTech.BlurWindow
    {
        List<Material> _userMaterials = new List<Material>();
        Employees _currentEmployee = new Employees();
        public EmployeeAddEditWindow(Employees currentEmployee)
        {
            InitializeComponent();
            _currentEmployee = currentEmployee;
            RoleCmb.ItemsSource = AppData.Context.Position.ToList();
            if(currentEmployee == null)
                MaterialPanel.Visibility = Visibility.Collapsed;
            if (currentEmployee != null)
            {
                RoleCmb.SelectedItem = currentEmployee.Position;
                AddressTb.Text = currentEmployee.Address;
                FIOTb.Text = currentEmployee.Name;
                PhoneNumberTb.Text = currentEmployee.PhoneNumber;
                DateOfAcceptDp.SelectedDate = currentEmployee.JoiningDate;
                DateOfBirthdayDp.SelectedDate = currentEmployee.Birthday;
                _userMaterials = AppData.Context.Material.Where(p => p.EmployeeId == currentEmployee.IDEmpioyees).ToList();
                UserMaterialsList.ItemsSource = _userMaterials.ToList();
            }
                PassportTb.IsReadOnly = true;
                RoleCmb.IsReadOnly = true;
                AddressTb.IsReadOnly = true;
                FIOTb.IsReadOnly = true;
                PhoneNumberTb.IsReadOnly = true;
                DateOfAcceptDp.IsHitTestVisible = false;
                DateOfAcceptDp.Focusable = false;
                DateOfBirthdayDp.Focusable = false;
                DateOfBirthdayDp.IsHitTestVisible = false;
                RoleCmb.Focusable = false;
                RoleCmb.IsHitTestVisible = false;
                SaveBtn.Visibility = Visibility.Collapsed;
                BtnAddItem.Visibility = Visibility.Collapsed;

            if (AppData.CurrentEmployee != null)
            {
                if(AppData.CurrentEmployee == currentEmployee || AppData.CurrentEmployee.PositionCode == 100 || AppData.CurrentEmployee.PositionCode == 101)
                {
                    PassportTb.IsReadOnly = false;
                    RoleCmb.IsReadOnly = false;
                     AddressTb.IsReadOnly = false;
                     FIOTb.IsReadOnly = false;
                     PhoneNumberTb.IsReadOnly = false;
                     DateOfAcceptDp.IsHitTestVisible = true;
                     DateOfAcceptDp.Focusable = true;
                     DateOfBirthdayDp.Focusable = true;
                     DateOfBirthdayDp.IsHitTestVisible = true;
                     RoleCmb.Focusable = true;
                     RoleCmb.IsHitTestVisible = true;
                     SaveBtn.Visibility= Visibility.Visible;
                     BtnAddItem.Visibility= Visibility.Visible;
                }
            }
        }

        private void MaterialPnl_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {

        }

        private void PhoneNumberTb_KeyDown(object sender, KeyEventArgs e)
        {
            if (!((e.Key >= Key.D0 && e.Key <= Key.D9) || (e.Key >= Key.NumPad0 && e.Key <= Key.NumPad9) || e.Key == Key.Back))
            {
                e.Handled = true;
            }
        }

        private void PassportTb_KeyDown(object sender, KeyEventArgs e)
        {
            if (!((e.Key >= Key.D0 && e.Key <= Key.D9) || (e.Key >= Key.NumPad0 && e.Key <= Key.NumPad9) || e.Key == Key.Back || e.Key == Key.Space))
            {
                e.Handled = true;
            }
        }

        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(AddressTb.Text) || string.IsNullOrWhiteSpace(FIOTb.Text) || string.IsNullOrWhiteSpace(PassportTb.Text) || string.IsNullOrWhiteSpace(PhoneNumberTb.Text)
                    || RoleCmb.SelectedIndex == -1 || RoleCmb.SelectedItem == null || DateOfAcceptDp.SelectedDate == null || DateOfBirthdayDp == null)
            {
                MessageBox.Show("Проверьте заполненность полей, или их корректность");
                return;
            }

            if (_currentEmployee == null)
            {
                AppData.Context.Employees.Add(new Employees()
                {
                    Address = AddressTb.Text,
                    Birthday = DateOfBirthdayDp.SelectedDate,
                    JoiningDate = DateOfAcceptDp.SelectedDate,
                    Name = FIOTb.Text,
                    PassportDetails = PassportTb.Text,
                    Position = RoleCmb.SelectedItem as Position,
                    PhoneNumber = PhoneNumberTb.Text
                });
            }
            else
            {
                _currentEmployee.Address = AddressTb.Text;
                _currentEmployee.Birthday = DateOfBirthdayDp.SelectedDate;
                _currentEmployee.JoiningDate = DateOfAcceptDp.SelectedDate;
                _currentEmployee.Name = FIOTb.Text;
                _currentEmployee.PassportDetails = PassportTb.Text;
                _currentEmployee.Position = RoleCmb.SelectedItem as Position;
                _currentEmployee.PhoneNumber = PhoneNumberTb.Text;
            }
            AppData.Context.SaveChanges();
            this.Close();
        }

        private void DateOfBirthdayDp_CalendarOpened(object sender, RoutedEventArgs e)
        {
            (sender as DatePicker).Foreground = Brushes.Black;
            Task.Delay(100);
        }

        private void DateOfBirthdayDp_CalendarClosed(object sender, RoutedEventArgs e)
        {
            (sender as DatePicker).Foreground = Brushes.White;
            Task.Delay(100);
        }

        private void DateOfAcceptDp_CalendarOpened(object sender, RoutedEventArgs e)
        {
            (sender as DatePicker).Foreground = Brushes.Black;
            Task.Delay(100);
        }

        private void DateOfAcceptDp_CalendarClosed(object sender, RoutedEventArgs e)
        {
            (sender as DatePicker).Foreground = Brushes.White;
            Task.Delay(100);
        }

        private void BtnAddItem_Click(object sender, RoutedEventArgs e)
        {
            var newMaterial = new MaterialChooseWindow(_currentEmployee);
            newMaterial.ShowDialog();
            if (newMaterial.DialogResult == true)
            {
                if (_userMaterials.Contains(AppData.newMaterial))
                {
                    MessageBox.Show("Данный предмет уже выбран");
                    AppData.newMaterial = null;
                    return;
                }
                _userMaterials.Add(AppData.newMaterial);
            }
            else
                MessageBox.Show("Вы не выбрали предмет");
            AppData.newMaterial = null;
            UserMaterialsList.ItemsSource = _userMaterials.ToList();
            UserMaterialsList.Items.Refresh();
        }

        private void BtnToStock_Click(object sender, RoutedEventArgs e)
        {
            winForms.DialogResult result = winForms.MessageBox.Show("Вы уверены, что хотите перенести предмет в общий доступ?", "Подтверждение", winForms.MessageBoxButtons.YesNoCancel);
            if (result == winForms.DialogResult.Yes)
            {
                _userMaterials.Remove(((sender as Button).DataContext as Material));
                AppData.Context.Movement.Add(new Movement() { DateMovement = DateTime.Now, Employees = _currentEmployee, Material = ((sender as Button).DataContext as Material), MovementStatus = "Перемещён в общее пользование" });
                ((sender as Button).DataContext as Material).Employees = null;
                AppData.Context.SaveChanges();
            }
            UserMaterialsList.ItemsSource = _userMaterials.ToList();
            UserMaterialsList.Items.Refresh();
        }

        private void BtnDelMaterial_Click(object sender, RoutedEventArgs e)
        {
            winForms.DialogResult result = winForms.MessageBox.Show("Вы уверены, что хотите спиать выбранный предмет?", "Подтверждение", winForms.MessageBoxButtons.YesNoCancel);
            if (result == winForms.DialogResult.Yes)
            {
                var writeOffWindow = new WriteOffWindow((sender as Button).DataContext as Material);
                writeOffWindow.ShowDialog();
                if(writeOffWindow.DialogResult == false)
                {
                    MessageBox.Show("Вы отменили действие на предыдущей странице");
                    return;
                }
                _userMaterials.Remove(((sender as Button).DataContext as Material));
                AppData.Context.Movement.Add(new Movement() { DateMovement = DateTime.Now, Employees = _currentEmployee, Material = ((sender as Button).DataContext as Material), MovementStatus="Списан"});
                ((sender as Button).DataContext as Material).Employees = null;
                AppData.Context.SaveChanges();
            }
            UserMaterialsList.ItemsSource = _userMaterials.ToList();
            UserMaterialsList.Items.Refresh();
        }
    }
}
