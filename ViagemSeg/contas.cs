//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ViagemSeg
{
    using System;
    using System.Collections.Generic;
    
    public partial class contas
    {
        public int Id { get; set; }
        public int Cliente { get; set; }
        public Nullable<int> Fornecedor { get; set; }
        public Nullable<int> Indentificador { get; set; }
        public Nullable<int> Viagem { get; set; }
        public System.DateTime DataRecebimento { get; set; }
        public System.DateTime DataVencimento { get; set; }
        public int Parcelas { get; set; }
        public decimal Valor { get; set; }
        public int Status { get; set; }
    }
}
