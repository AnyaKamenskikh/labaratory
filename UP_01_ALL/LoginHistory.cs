//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace UP_01_ALL
{
    using System;
    using System.Collections.Generic;
    
    public partial class LoginHistory
    {
        public int ID { get; set; }
        public Nullable<int> ID_User { get; set; }
        public Nullable<System.DateTime> DateOfEntry { get; set; }
        public Nullable<int> ID_AttemptStatus { get; set; }
    
        public virtual AttemptStatus AttemptStatus { get; set; }
        public virtual Users Users { get; set; }
    }
}
