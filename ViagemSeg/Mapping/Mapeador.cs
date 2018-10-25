using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ViagemSeg.Dto;
using ViagemSeg.Comuns;
using ViagemSeg.Enums;

namespace ViagemSeg.Mapping
{
    public static class Mapeador
    {

        public static List<DtoCliente> ListaDeCliente(List<cliente> lista)
        {
            var ly = new List<DtoCliente>();
            foreach (var item in lista.ToList())
            {
                var Cliente = new DtoCliente();
                Cliente.ClienteId = item.Id;
                Cliente.ClienteCpf = Comun.FormatarCpfCnpj(item.Cpf.ToString());
                Cliente.ClienteNome = item.Nome;
                Cliente.ClienteDataNascimento = item.DataNascimento.ToShortDateString();
                Cliente.CLienteEmail = item.Email;
                Cliente.ClienteTelefone = Comun.FormatarTelefone(item.Telefone);
                ly.Add(Cliente);
            }
            return ly.ToList();
        }

        public static List<DtoViagem> ListaViagens(List<viagem> lista)
        {
            var Lv = new List<DtoViagem>();
            foreach (var item in lista.ToList())
            {
                var Viagem = new DtoViagem();
                Viagem.ViagemId = item.Id;
                Viagem.ViagemNome = item.Nome;
                Viagem.ViagemLocal = item.Local;
                Viagem.ViagemDataInicio = item.DataInicio?.ToShortDateString();
                Viagem.ViagemDataFim = item.DataFim?.ToShortDateString();
                Viagem.ViagemValor = Convert.ToString(item.Valor);
                Viagem.ViagemEstado = item.Estado;
                Viagem.ViagemDescricao = item.Descricao;
                Viagem.ViagemVeiculo = Convert.ToInt32(item.Veiculo);
                Lv.Add(Viagem);
            }
            return Lv.ToList();
        }

        public static List<DtoVeiculo> ListaVeiculos(List<veiculo> lista)
        {
            var Ve = new List<DtoVeiculo>();
            foreach(var item in lista.ToList())
            {
                var veiculo = new DtoVeiculo();
                veiculo.VeiculoId = item.Id;
                veiculo.VeiculoTipo = ((Enuns.tipos)item.Tipo.Value).ToString();
                veiculo.VeiculoLugares = item.Lugares.Value;
                veiculo.VeiculoPlaca = item.Placa;
                veiculo.VeiculoIdentificacao = item.Identificacao;
                Ve.Add(veiculo);
            }
            return Ve.ToList();
        }

        public static List<DtoVendaCliente> ListaVenda(List<vendacliente> lista)
        {
            var Vc = new List<DtoVendaCliente>();
            foreach (var item in lista.ToList())
            {
                var vendaCliente = new DtoVendaCliente();
                vendaCliente.VendaId = item.VendaId;
                vendaCliente.VendaIdCliente = item.VendaIdCliente;
                vendaCliente.VendaIdViagem = item.VendaIdViagem;
                vendaCliente.VendaValorViagem = item.VendaValorViagem;
                vendaCliente.VendaValorPago = item.VendaValorPago;
                vendaCliente.VendaDesconto = item.VendaDesconto;
                vendaCliente.FaixaEtaria = item.FaixaEtaria;
                vendaCliente.Status = item.Status;
                vendaCliente.Assento = item.Assento;
                Vc.Add(vendaCliente);
            }
            return Vc.ToList();
        }

        public static List<DtoFretamento> ListaFretamento(List<fretamento> lista)
        {
            var Fe = new List<DtoFretamento>();
            foreach (var item in lista.ToList())
            {
                var fretamento = new DtoFretamento();
                fretamento.FretamentoId = item.Id;
                fretamento.FretamentoNome = item.Nome;
                fretamento.FretamentoKm = Convert.ToInt32(item.Km);
                fretamento.FretamentoValor = Convert.ToDecimal(item.Valor);
                fretamento.FretamentoDescricao = item.Descricao;
                fretamento.FretamentoCliente = item.Cliente;
                Fe.Add(fretamento);
            }
            return Fe.ToList();
        }

        public static List<DtoFornecedor> ListaFornecedor(List<fornecedor> lista)
        {
            var Fo = new List<DtoFornecedor>();
            foreach (var item in lista.ToList())
            {
                var fornecedor = new DtoFornecedor();
                fornecedor.FornecedorId = item.Id;
                fornecedor.FornecedorNome = item.Nome;
                fornecedor.FornecedorServico = item.Servico;
                fornecedor.FornecedorTelefone = item.Telefone;
                Fo.Add(fornecedor);
            }
            return Fo.ToList();
        }

        public static List<DtoServico> ListaServico(List<pestacaoservico> lista)
        {
            var Se = new List<DtoServico>();
            foreach (var item in lista.ToList())
            {
                var servico = new DtoServico();
                servico.ServicoId = item.Id;
                servico.ServicoIdFornecedor = Convert.ToInt32( item.IdFornecedor);
                servico.Servico = item.Descricao;
                servico.ServicoValor = Convert.ToDecimal( item.Valor);
                Se.Add(servico);
          
            }
            return Se.ToList();
        }
        public static List<DtoConta> ListaConta(List<contas> lista)
        {
            var Co = new List<DtoConta>();
            foreach (var item in lista.ToList())
            {
                var Conta = new DtoConta();
                Conta.ContaId = item.Id;
                Conta.ContaCliente = item.Cliente;
                Conta.ContaFornecedor = item.Fornecedor;
                Conta.ContaIndentificador = item.Indentificador;
                Conta.ContaViagem = item.Viagem;
                Conta.ContaDataRecebimento = item.DataRecebimento.ToShortDateString();
                Conta.ContaDataVencimento = item.DataVencimento.ToShortDateString();
                Conta.ContaParcela = item.Parcelas;
                Conta.ContaValor = item.Valor;
                Conta.ContaStatus = item.Status;
                Co.Add(Conta);
            }
            return Co.ToList();
        }

    }
}
