using PutPredkovApp.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace PutPredkovApp.Classes
{
     class AppData
    {
        public static DiplomEntities Context = new DiplomEntities();
        public static Frame MainFrame = new Frame();
        public static Employees CurrentEmployee;
        public static Material newMaterial = new Material();
    }
}
