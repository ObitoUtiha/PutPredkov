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
    /// Interaction logic for MaterialCheckWindow.xaml
    /// </summary>
    public partial class MaterialCheckWindow : TianXiaTech.BlurWindow
    {
        private string _inventoryReason;
        private List<Material> _materials = AppData.Context.Material.ToList();
        public MaterialCheckWindow(string Reason)
        {
            InitializeComponent();
            _inventoryReason = Reason;
            Update();
        }

        private void Update()
        {
            MaterialList.ItemsSource = _materials.GroupBy(p => new { p.Manufacturer, p.Name}).ToList();
        }

        private void MinBtn_Click(object sender, RoutedEventArgs e)
        {
            var selectedGroup = (IGrouping<object, Material>)(sender as Button).DataContext;
            var selectedMaterial = selectedGroup.First();
            if (selectedMaterial.QuantityMaterial == 0)
                return;
            selectedMaterial.QuantityMaterial = selectedMaterial.QuantityMaterial-1;
            Update();

        }

        private void PlusBtn_Click(object sender, RoutedEventArgs e)
        {
            var selectedGroup = (IGrouping<object, Material>)(sender as Button).DataContext;
            var selectedMaterial = selectedGroup.First();
            selectedMaterial.QuantityMaterial++;
            Update();
            //Material currentMaterial = AppData.Context.Material.Where(p => p.InventoryNumber == ((sender as Button).DataContext as).InventoryNumber).FirstOrDefault();
            //currentMaterial.QuantityMaterial = currentMaterial.QuantityMaterial++;
            //Update();
        }

        private void EndInventoryBtn_Click(object sender, RoutedEventArgs e)
        {
            List<Material> allMaterials = new List<Material>();
            foreach (var item in MaterialList.Items)
            {
                var group = (IGrouping<object, Material>)item;
                var items = group.First();
                allMaterials.Add(items as Material);
            }
            DateTime currentDate = DateTime.Now;

            var newInventoryResult = new InventoryResult
            {
                Reason = _inventoryReason,
                Result = true,
                DateTime = currentDate,
                Employees = AppData.CurrentEmployee
            };
            AppData.Context.InventoryResult.Add(newInventoryResult);
            AppData.Context.SaveChanges();

            List<Inventory> newInventoryList = new List<Inventory>();

            foreach (Material item in allMaterials)
            {
                Inventory newInventory = new Inventory { Material = item, DateInventory = currentDate, Quantity = item.QuantityMaterial };
                AppData.Context.Inventory.Add(newInventory);
                AppData.Context.SaveChanges();
                newInventoryList.Add(newInventory);
            }

            foreach (Material item in _materials)
                item.QuantityMaterial = AppData.Context.Material.Where(p => p.Manufacturer == item.Manufacturer && p.Name == item.Name).ToList().Count;

            List<Result> newResultList = new List<Result>();

            foreach(Material material in allMaterials)
            {
                if (material.QuantityMaterial != newInventoryList.Where(p => p.Material.Name == material.Name && p.Material.Manufacturer == material.Manufacturer).FirstOrDefault().Quantity)
                {
                    Result newResult = new Result
                    {
                        Inventory = newInventoryList.Where(p => p.Material.Name == material.Name && p.Material.Manufacturer == material.Manufacturer).FirstOrDefault(),
                        ResultName = "Не совпадает кол-во",
                        ResultDate = currentDate,
                        StatusCode = 2
                    } ;
                    AppData.Context.Result.Add(newResult);
                    AppData.Context.SaveChanges();
                    newResultList.Add(newResult);
                }
                else
                {
                    Result newResult = new Result {
                        Inventory = newInventoryList.Where(p => p.Material.Name == material.Name && p.Material.Manufacturer == material.Manufacturer).FirstOrDefault(),
                        ResultName = "Кол-во совпадает",
                        ResultDate = currentDate,
                        StatusCode = 1
                    };
                    AppData.Context.Result.Add(newResult);
                    AppData.Context.SaveChanges();
                    newResultList.Add(newResult);
                }
            }

            foreach(Result result in newResultList)
            {
                ItemsResultInventory itemsResultInventory = new ItemsResultInventory()
                {
                    Result = result,
                    InventoryResult = newInventoryResult
                };
                if(result.StatusCode == 2)
                {
                    newInventoryResult.Result = false;
                }
                AppData.Context.ItemsResultInventory.Add(itemsResultInventory);
                AppData.Context.SaveChanges();

            }
            _materials = AppData.Context.Material.ToList();
            List<ItemsResultInventory> resultInventory = AppData.Context.ItemsResultInventory.ToList();


            // Путь к шаблону документа
            string templatePath = "Templates/InventoryTemplate.docx";

            var helper = new WordHelperClass(templatePath);
            helper.currentTime = currentDate;

            string ResultStr;
            if (newInventoryResult.Result == true)
                ResultStr = "Проведена успешно";
            else
                ResultStr =  "Не проведена";
            helper.CreateInventoryDocument(newInventoryResult.InventoryResultId.ToString(), currentDate, _materials, newResultList, AppData.CurrentEmployee, _inventoryReason, ResultStr);


            foreach (Material item in _materials)
                item.QuantityMaterial = 0;
            this.Close();
        }
    }
}
