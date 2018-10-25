using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ViagemSeg.Dto
{
    public class DtoServico
    {
        public int ServicoId { get; set; }
        public int ServicoIdFornecedor { get; set; }
        public string Servico { get; set; }
        public decimal ServicoValor { get; set; }
    }
}
