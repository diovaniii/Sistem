using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ViagemSeg.Dto
{
    public class DtoVeiculo
    {
        public int VeiculoId { get; set; }
        public string VeiculoTipo { get; set; }
        public int VeiculoLugares { get; set; }
        public string VeiculoPlaca { get; set; }
        public string VeiculoIdentificacao { get; set; }
        public int VeiculoStatus { get; set; }
    }
}
