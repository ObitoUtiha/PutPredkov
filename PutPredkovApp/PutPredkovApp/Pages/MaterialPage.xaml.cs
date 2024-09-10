using PutPredkovApp.Classes;
using PutPredkovApp.Entities;
using PutPredkovApp.Windows;
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
    /// Interaction logic for MaterialPage.xaml
    /// </summary>
    public partial class MaterialPage : Page
    {
        private List<Material> materials = new List<Material>();
        public MaterialPage()
        {
            InitializeComponent();
            CategoriesCmb.ItemsSource = AppData.Context.Categories.ToList();
            Update();
        }

        private void Update()
        {
            //if(AppData.CurrentEmployee != null)
            //{

            //}
            materials = AppData.Context.Material.Where(p=>p.WriteOffs == null).ToList();

            if(AppData.CurrentEmployee != null)
            {
                if (AppData.CurrentEmployee.PositionCode == 100 || AppData.CurrentEmployee.PositionCode == 103 || AppData.CurrentEmployee.PositionCode == 104)
                {
                    materials.Insert(0, new Material() { ReceiptNumber = "AddItem" });
                }
            }

            MaterialList.ItemsSource = materials;
            if (!string.IsNullOrWhiteSpace(SearchBar.Text))
                materials = materials.Where(p => p.ReceiptNumber != "AddItem" && p.Name.Trim().ToLower().Contains(SearchBar.Text.Trim().ToLower())).ToList();

            if (CategoriesCmb.SelectedIndex != -1 || CategoriesCmb.SelectedItem != null)
                materials = materials.Where(p => p.Categories == CategoriesCmb.SelectedItem as Categories).ToList();

            if(UsingCmb.SelectedIndex != -1)
            {
                switch (UsingCmb.SelectedIndex) 
                {
                    case 0:
                        materials = materials.ToList();
                        break;
                    case 1:
                        materials = materials.Where(p => p.Employees == null).ToList();
                        break;
                    case 2:
                        materials = materials.Where(p => p.Employees != null).ToList();
                        break;
                    default:
                        materials = materials.ToList();
                        break;
                }
            }

            MaterialList.ItemsSource = materials;
        }

        private void CategoriesCmb_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }

        private void SearchBar_TextChanged(object sender, TextChangedEventArgs e)
        {
            Update();
        }

        private void MaterialPnl_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            if (((sender as Border).DataContext as Material).ReceiptNumber == "AddItem")
            {
                MaterialAddEditWindow materialAddEditWindow = new MaterialAddEditWindow(null);
                materialAddEditWindow.ShowDialog();
            }
            else
            {
                MaterialAddEditWindow materialAddEditWindow = new MaterialAddEditWindow((sender as Border).DataContext as Material);
                materialAddEditWindow.ShowDialog();
            }
            Update();
        }

        private void ClearBtn_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            CategoriesCmb.SelectedItem= null;
            SearchBar.Text = string.Empty;
            UsingCmb.SelectedItem = null;
        }

        private void UsingCmb_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }
    }
}
