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
    
    public partial class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            this.OrderList = new HashSet<OrderList>();
        }
    
        public int ID { get; set; }
        public Nullable<System.DateTime> DateOfCreation { get; set; }
        public Nullable<int> ID_OrderStatus { get; set; }
        public Nullable<int> Rumtime { get; set; }
        public Nullable<int> ID_User { get; set; }
        public Nullable<int> ID_Patient { get; set; }
        public Nullable<int> ID_Biomaterial { get; set; }
    
        public virtual Biomaterial Biomaterial { get; set; }
        public virtual OrderStatus OrderStatus { get; set; }
        public virtual Patient Patient { get; set; }
        public virtual Users Users { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderList> OrderList { get; set; }
    }
}
