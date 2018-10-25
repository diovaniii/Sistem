using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ViagemSeg.Dto
{
    public class DtoViagem
    {
        public int ViagemId { get; set; }
        public string ViagemNome { get; set; }
        public string ViagemLocal { get; set; }
        public string ViagemDataInicio { get; set; }
        public string ViagemDataFim { get; set; }
        public string ViagemValor { get; set; }
        public string ViagemEstado { get; set; }
        public string ViagemDescricao { get; set; }
        public int ViagemStatus { get; set; }
        public int ViagemVeiculo { get; set; }
    }
}
