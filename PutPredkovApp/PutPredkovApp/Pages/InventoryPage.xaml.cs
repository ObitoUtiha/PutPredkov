using PutPredkovApp.Classes;
using PutPredkovApp.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using winForms = System.Windows.Forms;
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
using Microsoft.VisualBasic;
using PutPredkovApp.Windows;

namespace PutPredkovApp.Pages
{
    /// <summary>
    /// Interaction logic for InventoryPage.xaml
    /// </summary>
    public partial class InventoryPage : Page
    {
        List<Material> materials = new List<Material>();
        List<InventoryResult> _results = new List<InventoryResult>();
        public InventoryPage()
        {
            InitializeComponent();
            Update();
        }

        private void Update()
        {
            _results = AppData.Context.InventoryResult.ToList();
            InventoryList.ItemsSource = _results;
            if (!string.IsNullOrWhiteSpace(SearchBar.Text))
            {
                _results = _results.Where(p=>p.InventoryResultId.ToString().Trim().ToLower().Contains(SearchBar.Text.Trim().ToLower())).ToList();
            }
            if(DateCmb.SelectedDate != null)
            {
                _results = _results.Where(p => p.DateTime == DateCmb.SelectedDate).ToList();
            }
            InventoryList.ItemsSource = _results;
        }

        private void InventoryBtn_Click(object sender, RoutedEventArgs e)
        {
            int x_coordinate = -1;
            int y_coordinate = -1;
            winForms.DialogResult result = winForms.MessageBox.Show("Провести инвентаризацию?", "Подтверждение", winForms.MessageBoxButtons.YesNo);
            if (result == winForms.DialogResult.Yes)
            {
                string input = Interaction.InputBox("Введите причину проведения инвентаризации (При нажатии кнопки 'Отмена', или оставлении поля пустым - процедура инвентаризации будет завершена. Поле можно оставить пустым добавив символ '-')",
                                                    "Инвентаризаця", "Плановая инвентаризация", x_coordinate, y_coordinate);
                if(input.Length <= 0)
                    return;
                else if(input == "-")
                    input = string.Empty;
                MaterialCheckWindow materialCheckWindow = new MaterialCheckWindow(input);
                materialCheckWindow.ShowDialog();
            }
            Update();
        }

        private void ClearBtn_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            DateCmb.SelectedDate = null;
            SearchBar.Text = string.Empty;
        }

        private void DateCmb_CalendarClosed(object sender, RoutedEventArgs e)
        {
            (sender as DatePicker).Foreground = Brushes.White;
            Task.Delay(100);
        }

        private void DateCmb_CalendarOpened(object sender, RoutedEventArgs e)
        {
            (sender as DatePicker).Foreground = Brushes.Black;
            Task.Delay(100);
        }

        private void DateCmb_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }

        private void SearchBar_TextChanged(object sender, TextChangedEventArgs e)
        {
            Update();
        }

        private void InventoryPnl_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            InventoryResultWindow inventoryResultWindow = new InventoryResultWindow((sender as Border).DataContext as InventoryResult);
            inventoryResultWindow.ShowDialog();
            Update();
        }
    }
}
