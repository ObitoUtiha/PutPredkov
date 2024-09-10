using DocumentFormat.OpenXml.Office2016.Drawing.ChartDrawing;
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
using System.Windows.Shapes;

namespace PutPredkovApp.Windows
{
    /// <summary>
    /// Interaction logic for MaterialAddEditWindow.xaml
    /// </summary>
    public partial class MaterialAddEditWindow : TianXiaTech.BlurWindow
    {
        List<Categories> categories = new List<Categories>();
        Material _currentMaterial;
        public MaterialAddEditWindow(Material currentMaterial)
        {
            InitializeComponent();
            categories = AppData.Context.Categories.ToList();
            _currentMaterial = currentMaterial;
            MaterialCategoryCmb.ItemsSource = categories;

            CostTb.IsReadOnly = true;
            MaterialName.IsReadOnly = true;
            MaterialCategoryCmb.IsReadOnly = true;
            ManufacturerTb.IsReadOnly = true;
            ReceiptNumberTb.IsReadOnly = true;
            DatePurchaseTb.IsHitTestVisible = false;
            DatePurchaseTb.Focusable = false;
            MaterialCategoryCmb.IsHitTestVisible = false;
            MaterialCategoryCmb.Focusable = false;
            SaveBtn.Visibility = Visibility.Collapsed;

            if (currentMaterial != null)
            {
                MaterialName.Text = currentMaterial.Name;
                CostTb.Text = currentMaterial.Cost.ToString();
                MaterialCategoryCmb.SelectedItem = currentMaterial.Categories as Categories;
                DatePurchaseTb.SelectedDate = currentMaterial.DatePurchase;
                ManufacturerTb.Text = currentMaterial.Manufacturer;
                ReceiptNumberTb.Text = currentMaterial.ReceiptNumber;
            }

            if (AppData.CurrentEmployee != null)
            {
                if (AppData.CurrentEmployee.PositionCode == 100 || AppData.CurrentEmployee.PositionCode == 103 || AppData.CurrentEmployee.PositionCode == 104)
                {
                    CostTb.IsReadOnly = false;
                    MaterialName.IsReadOnly = false;
                    MaterialCategoryCmb.IsReadOnly = false;
                    ManufacturerTb.IsReadOnly = false;
                    ReceiptNumberTb.IsReadOnly = false;
                    DatePurchaseTb.IsHitTestVisible = true;
                    DatePurchaseTb.Focusable = true;
                    MaterialCategoryCmb.IsHitTestVisible = true;
                    MaterialCategoryCmb.Focusable = true;
                    SaveBtn.Visibility = Visibility.Visible;
                }
            }

        }

        private void CostTb_KeyDown(object sender, KeyEventArgs e)
        {
            if (!((e.Key >= Key.D0 && e.Key <= Key.D9) || (e.Key >= Key.NumPad0 && e.Key <= Key.NumPad9) || e.Key == Key.Back || e.Key == Key.OemComma))
            {
                e.Handled = true;
            }
        }

        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(ManufacturerTb.Text) || string.IsNullOrWhiteSpace(CostTb.Text) || string.IsNullOrWhiteSpace(MaterialName.Text)|| string.IsNullOrWhiteSpace(ReceiptNumberTb.Text) || DatePurchaseTb.SelectedDate == null || MaterialCategoryCmb.SelectedIndex == -1)
            {
                MessageBox.Show("Проверьте корректность заполнения полей");
                return;
            }

            if (_currentMaterial != null)
            {
                _currentMaterial.Manufacturer = ManufacturerTb.Text;
                _currentMaterial.Name = MaterialName.Text;
                _currentMaterial.DatePurchase = DatePurchaseTb.SelectedDate;
                _currentMaterial.ReceiptNumber = ReceiptNumberTb.Text;
                _currentMaterial.Cost = float.Parse(CostTb.Text);
                _currentMaterial.Categories = MaterialCategoryCmb.SelectedItem as Categories;
            }
            else
            {
                AppData.Context.Material.Add(new Material()
                {
                    Manufacturer = ManufacturerTb.Text,
                    Name = MaterialName.Text,
                    DatePurchase = DatePurchaseTb.SelectedDate,
                    ReceiptNumber = ReceiptNumberTb.Text,
                    Cost = float.Parse(CostTb.Text),
                    Categories = MaterialCategoryCmb.SelectedItem as Categories
                });
            }
            AppData.Context.SaveChanges();
        }

        private void DatePurchaseTb_CalendarClosed(object sender, RoutedEventArgs e)
        {
            (sender as DatePicker).Foreground = Brushes.White;
            Task.Delay(100);
        }

        private void DatePurchaseTb_CalendarOpened(object sender, RoutedEventArgs e)
        {
            (sender as DatePicker).Foreground = Brushes.Black;
            Task.Delay(100);
        }
    }
}
