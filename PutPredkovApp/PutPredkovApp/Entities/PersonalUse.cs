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
    
    public partial class PersonalUse
    {
        public string Name { get; set; }
        public int ProductCode { get; set; }
        public string Quantity { get; set; }
        public int PersonslUse { get; set; }
    
        public virtual Material Material { get; set; }
    }
}
