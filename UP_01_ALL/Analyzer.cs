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
    
    public partial class Analyzer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Analyzer()
        {
            this.AnalyzerOperation = new HashSet<AnalyzerOperation>();
            this.RenderingOfServisec = new HashSet<RenderingOfServisec>();
        }
    
        public int ID { get; set; }
        public Nullable<int> ID_Biomaterial { get; set; }
        public string Name { get; set; }
    
        public virtual Biomaterial Biomaterial { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AnalyzerOperation> AnalyzerOperation { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RenderingOfServisec> RenderingOfServisec { get; set; }
    }
}
