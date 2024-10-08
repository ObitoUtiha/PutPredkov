//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PutPredkovApp.Entities
{
    using System;
    using System.Collections.Generic;
    
    public partial class Inventory
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Inventory()
        {
            this.Result = new HashSet<Result>();
        }
    
        public int OrderNumber { get; set; }
        public int InventoriNumberEquipment { get; set; }
        public Nullable<int> IDEmployee { get; set; }
        public Nullable<System.DateTime> DateInventory { get; set; }
        public Nullable<decimal> BookValue { get; set; }
        public Nullable<int> Quantity { get; set; }
    
        public virtual Employees Employees { get; set; }
        public virtual Material Material { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Result> Result { get; set; }
    }
}
