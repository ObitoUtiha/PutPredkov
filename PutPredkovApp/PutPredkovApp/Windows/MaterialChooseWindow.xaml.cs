using PutPredkovApp.Classes;
using PutPredkovApp.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using winForms = System.Windows.Forms;
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
    /// Interaction logic for MaterialChooseWindow.xaml
    /// </summary>
    public partial class MaterialChooseWindow : TianXiaTech.BlurWindow
    {
        private List<Material> materials = new List<Material>();

        Employees _currentEmployee = new Employees();
        public MaterialChooseWindow(Employees employees)
        {
            InitializeComponent();
            _currentEmployee = employees;
            CategoriesCmb.ItemsSource = AppData.Context.Categories.ToList();
            Update();
        }

        private void Update()
        {
            //if(AppData.CurrentEmployee != null)
            //{

            //}
            materials = AppData.Context.Material.Where(p => p.WriteOffs == null && p.Employees == null).ToList();
            MaterialList.ItemsSource = materials;
            if (!string.IsNullOrWhiteSpace(SearchBar.Text))
                materials = materials.Where(p => p.Name.Trim().ToLower().Contains(SearchBar.Text.Trim().ToLower())).ToList();

            if (CategoriesCmb.SelectedIndex != -1 || CategoriesCmb.SelectedItem != null)
                materials = materials.Where(p => p.Categories == CategoriesCmb.SelectedItem as Categories).ToList();

            MaterialList.ItemsSource = materials;
        }

        private void MaterialPnl_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {

        }

        private void ClearBtn_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            CategoriesCmb.SelectedItem = null;
            SearchBar.Text = string.Empty;
        }

        private void CategoriesCmb_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }

        private void SearchBar_TextChanged(object sender, TextChangedEventArgs e)
        {
            Update();

        }

        private void ChooseBtn_Click(object sender, RoutedEventArgs e)
        {
            AppData.newMaterial = (sender as Button).DataContext as Material;
            ((sender as Button).DataContext as Material).Employees = _currentEmployee;
            AppData.Context.Movement.Add(new Movement() { DateMovement = DateTime.Now, Employees = _currentEmployee, Material = ((sender as Button).DataContext as Material), MovementStatus="Перемещён в личное пользование"});
            AppData.Context.SaveChanges();
            this.DialogResult = true;
            this.Close();
        }
    }
}
