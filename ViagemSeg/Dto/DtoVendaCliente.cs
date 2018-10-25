using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ViagemSeg.Dto
{
    public class DtoVendaCliente
    {
        public int VendaId { get; set; }
        public int VendaIdCliente { get; set; }
        public int VendaIdViagem { get; set; }
        public decimal VendaValorViagem { get; set; }
        public decimal VendaValorPago { get; set; }
        public decimal VendaDesconto { get; set; }
        public string FaixaEtaria { get; set; }
        public int Assento { get; set; }
        public int Status { get; set; }
    }
}
