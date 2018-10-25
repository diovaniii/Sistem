using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ViagemSeg.Dto
{
    public class DtoFretamento
    {
        public int FretamentoId { get; set; }
        public string FretamentoNome { get; set; }
        public string FretamentoDescricao { get; set; }
        public int FretamentoKm { get; set; }
        public decimal FretamentoValor { get; set; }
        public string FretamentoCliente { get; set; }

    }
}
