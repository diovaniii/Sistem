
namespace ViagemSeg.Dto
{
    public class DtoConta
    {
        public int ContaId { get; set; }
        public int? ContaCliente { get; set; }
        public int? ContaFornecedor { get; set; }
        public int? ContaIndentificador { get; set; }
        public int? ContaViagem { get; set; }
        public string ContaDataRecebimento { get; set; }
        public string ContaDataVencimento { get; set; }
        public int ContaParcela { get; set; }
        public decimal ContaValor { get; set; }
        public int ContaStatus { get; set; }
    }
}
