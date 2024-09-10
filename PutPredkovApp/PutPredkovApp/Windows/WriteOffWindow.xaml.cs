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
    /// Interaction logic for WriteOffWindow.xaml
    /// </summary>
    public partial class WriteOffWindow : TianXiaTech.BlurWindow
    {
        Material curentMaterial = new Material();
        public WriteOffWindow(Material material)
        {
            InitializeComponent();
            curentMaterial = material;
        }

        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            AppData.Context.WriteOffs.Add(new WriteOffs()
            {
                DateWriteOff = DateTime.Now,
                Material1 = curentMaterial,
                Reason = ReasonTb.Text
            });
            AppData.Context.SaveChanges();
            this.DialogResult = true;
            this.Close();
        }

        private void CancelBtn_Click(object sender, RoutedEventArgs e)
        {
            this.DialogResult = false;
            this.Close();
        }
    }
}
