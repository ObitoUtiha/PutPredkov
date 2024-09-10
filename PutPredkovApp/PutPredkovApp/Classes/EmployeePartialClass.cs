using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PutPredkovApp.Entities
{
    partial class Employees
    {
        public string AddBackImage => Address == "AddItem" ? "../Resourses/addIco.png" : null;
        public string AddFrontImage => Address == "AddItem" ? null : "../Resourses/userIco.png";
    }
}
