using PutPredkovApp.Classes;
using PutPredkovApp.Entities;
using PutPredkovApp.Pages;
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
    /// Interaction logic for NavigationWindow.xaml
    /// </summary>
    public partial class NavigationWindow : TianXiaTech.BlurWindow
    {
        public NavigationWindow(Employees currentEmployee)
        {
            InitializeComponent();

            MovementBtn.Visibility = Visibility.Collapsed;
            InventorizationBtn.Visibility = Visibility.Collapsed;


            if (currentEmployee == null)
            {
                InventorizationBtn.Visibility = Visibility.Collapsed;
                MovementBtn.Visibility = Visibility.Collapsed;
            }
            else if(currentEmployee.PositionCode == 100 || currentEmployee.PositionCode == 103)
            {
                InventorizationBtn.Visibility = Visibility.Visible;
                MovementBtn.Visibility = Visibility.Visible;
            }
            else if( currentEmployee.PositionCode == 101 || currentEmployee.PositionCode == 104 || currentEmployee.PositionCode == 105)
            {
                MovementBtn.Visibility = Visibility.Visible;
            }
            MainFrame.Navigate(new EmployeePage());
        }

        private async void animationBtn(object sender)
        {
            foreach (Border items in NavigationPnl.Children.OfType<Border>())
            {
                items.IsHitTestVisible = false;
                if (items.Width == 90)
                {
                    while (items.Width != 70)
                    {   
                        items.Width--;
                        await Task.Delay(1);
                    }

                }
            }
            while ((sender as Border).Width != 90)
            {
                (sender as Border).Width++;
                await Task.Delay(1);
            }
            foreach (Border items in NavigationPnl.Children.OfType<Border>())
            {
                items.IsHitTestVisible = true;
            }
        }

        private  void EmployeeBtn_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            MainFrame.Navigate(new EmployeePage());
            (sender as Border).IsHitTestVisible = false;
            animationBtn(sender);
            (sender as Border).IsHitTestVisible = true;


        }

        private void ItemsBtn_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            MainFrame.Navigate(new MaterialPage());
            (sender as Border).IsHitTestVisible = false;
            animationBtn(sender);
            (sender as Border).IsHitTestVisible = true;

        }

        private void MainFrame_ContentRendered(object sender, EventArgs e)
        {
            if(MainFrame.Content is  EmployeePage)
                this.Title = "Путь предков: Сотрудники";
            else if(MainFrame.Content is MaterialPage)
                this.Title = "Путь предков: Материалы";
            else if (MainFrame.Content is MovementPage)
                this.Title = "Путь предков: Перемещения";
            else if (MainFrame.Content is InventoryPage)
                this.Title = "Путь предков: Инвентаризация";
        }

        private void MovementBtn_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            MainFrame.Navigate(new MovementPage());
            (sender as Border).IsHitTestVisible = false;
            animationBtn(sender);
            (sender as Border).IsHitTestVisible = true;
        }

        private void InventorizationBtn_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            MainFrame.Navigate(new InventoryPage());
            (sender as Border).IsHitTestVisible = false;
            animationBtn(sender);
            (sender as Border).IsHitTestVisible = true;
        }

        private void ExitBtn_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            AppData.CurrentEmployee = null;
            this.Close();
        }
    }
}
