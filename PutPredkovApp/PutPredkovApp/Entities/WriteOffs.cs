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
    
    public partial class WriteOffs
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public WriteOffs()
        {
            this.Material = new HashSet<Material>();
        }
    
        public int Code { get; set; }
        public int MaterialCode { get; set; }
        public Nullable<System.DateTime> DateWriteOff { get; set; }
        public string Reason { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Material> Material { get; set; }
        public virtual Material Material1 { get; set; }
    }
}
