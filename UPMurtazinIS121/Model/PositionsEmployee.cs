//------------------------------------------------------------------------------
// <auto-generated>
//    Этот код был создан из шаблона.
//
//    Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//    Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace UPMurtazinIS121.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class PositionsEmployee
    {
        public PositionsEmployee()
        {
            this.Employees = new HashSet<Employees>();
        }
    
        public int PositionID { get; set; }
        public string PositionName { get; set; }
        public string Description { get; set; }
    
        public virtual ICollection<Employees> Employees { get; set; }
    }
}
