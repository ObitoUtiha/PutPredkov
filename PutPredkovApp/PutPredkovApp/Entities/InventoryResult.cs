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
    
    public partial class InventoryResult
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public InventoryResult()
        {
            this.ItemsResultInventory = new HashSet<ItemsResultInventory>();
        }
    
        public int InventoryResultId { get; set; }
        public string Reason { get; set; }
        public Nullable<int> CommonUseQuantity { get; set; }
        public Nullable<int> PersonalUseQuantity { get; set; }
        public Nullable<double> FullPrice { get; set; }
        public Nullable<bool> Result { get; set; }
        public Nullable<int> IDEmployee { get; set; }
        public Nullable<System.DateTime> DateTime { get; set; }
    
        public virtual Employees Employees { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ItemsResultInventory> ItemsResultInventory { get; set; }
    }
}
