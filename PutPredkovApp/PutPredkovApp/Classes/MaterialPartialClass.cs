using PutPredkovApp.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace PutPredkovApp.Entities
{
    partial class Material
    {
        public string AddBackImage => ReceiptNumber == "AddItem" ? "../Resourses/addIco.png" : null;
        public string AddFrontImage => ReceiptNumber == "AddItem" ? null : "../Resourses/materialIco.png";

        public int QuantityMaterial {  get; set; }

        public Visibility AcrtionBtnVisibility
        {
            get
            {
                if (AppData.CurrentEmployee != null)
                {
                    if (AppData.CurrentEmployee == Employees || AppData.CurrentEmployee.PositionCode == 100 || AppData.CurrentEmployee.PositionCode == 101)
                    {
                        return Visibility.Visible;
                    }
                    else
                    {
                        return Visibility.Collapsed;
                    }
                }
                else
                {
                    return Visibility.Collapsed;
                }
            }
        }     
    }
}
