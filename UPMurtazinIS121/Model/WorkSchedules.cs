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
    
    public partial class WorkSchedules
    {
        public int ScheduleID { get; set; }
        public int EmployeeID { get; set; }
        public Nullable<System.DateTime> WorkDate { get; set; }
        public Nullable<System.TimeSpan> StartTime { get; set; }
        public Nullable<System.TimeSpan> EndTime { get; set; }
    
        public virtual Employees Employees { get; set; }
    }
}
