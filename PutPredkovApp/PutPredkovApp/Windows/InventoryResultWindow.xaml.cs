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
    /// Interaction logic for InventoryResultWindow.xaml
    /// </summary>
    public partial class InventoryResultWindow : TianXiaTech.BlurWindow
    {

        List<ItemsResultInventory> inventoryResults = new List<ItemsResultInventory>();

        public InventoryResultWindow(InventoryResult result)
        {
            InitializeComponent();
            inventoryResults = AppData.Context.ItemsResultInventory.ToList().Where(x => x.InventoryResult == result).ToList();
            ListSuccesMaterial.ItemsSource = inventoryResults.Where(p => p.Result.StatusCode == 1).ToList();
            ListUnSuccesMaterial.ItemsSource = inventoryResults.Where(p => p.Result.StatusCode == 2).ToList();

            DateTb.Text += $"{result.DateTime}";
            IdTb.Text += $"{result.InventoryResultId}";
            ReasonTb.Text += $"{result.Reason}";
            EmployeeTb.Text += $"{result.Employees.Name}, {result.Employees.Position.Title}";

            string resultStr;
            if (result.Result == true)
            {
                resultStr = "Пройдена";
                ResultTb.Foreground = Brushes.Green;
            }
            else
            {
                resultStr = "Не пройдена";
                ResultTb.Foreground = Brushes.Red;
            }

            ResultTb.Text += $"{resultStr}";

        }
    }
}
