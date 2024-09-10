using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PutPredkovApp.Entities
{
    partial class InventoryResult
    {
        public string ResultString => Result == true ? "Пройдена" : "Не пройдена";  
    }
}
