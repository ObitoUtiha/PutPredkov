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
    
    public partial class Movement
    {
        public int Code { get; set; }
        public int MaterialCode { get; set; }
        public int EmployeesCode { get; set; }
        public Nullable<System.DateTime> DateMovement { get; set; }
        public string MovementStatus { get; set; }
    
        public virtual Employees Employees { get; set; }
        public virtual Material Material { get; set; }
    }
}
