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

namespace PutPredkovApp.Pages
{
    /// <summary>
    /// Interaction logic for MovementPage.xaml
    /// </summary>
    public partial class MovementPage : Page
    {
        List<Movement> movement = new List<Movement>();
        public MovementPage()
        {
            InitializeComponent();
            Update();
        }

        private void Update()
        {
            //if(AppData.CurrentEmployee != null)
            //{

            //}
            movement = AppData.Context.Movement.ToList();
            MovementList.ItemsSource = movement;
            if (!string.IsNullOrWhiteSpace(SearchBar.Text))
                movement = movement.Where(p => p.Material.Name.Trim().ToLower().Contains(SearchBar.Text.Trim().ToLower())).ToList();

            if(DateCmb.SelectedDate != null)
                movement = movement.Where(p => p.DateMovement == DateCmb.SelectedDate).ToList();

            MovementList.ItemsSource = movement;
        }

        private void SearchBar_TextChanged(object sender, TextChangedEventArgs e)
        {
            Update();
        }


        private void ClearBtn_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            DateCmb.SelectedDate = null;
            SearchBar.Text = string.Empty;
        }

        private void DateCmb_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
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
    }
}
