using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ViagemSeg;
using ViagemSeg.Svc;

namespace ViagemWeb
{
    public partial class StatsViagem : System.Web.UI.Page
    {

        private viagem _viagem
        {
            get { return (viagem)ViewState[typeof(viagem).FullName]; }
            set { ViewState[typeof(viagem).FullName] = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string currentUserId = User.Identity.GetUserId();
            if (!IsPostBack)
            {
                carregaVeiculo(currentUserId);
                //very first load//
                string id = Request.QueryString["ViagemId"];
                if (!string.IsNullOrEmpty(id))
                {
                    PorcentagemVenda(Convert.ToInt32(id));
                    MontarCadastroViagem(Convert.ToInt32(id));
                    CarregaResultados(Convert.ToInt32(id));
                    modoVisualizacao();
                }
                else
                {
                    _viagem = new viagem();
                }
            }
            else
            {
                //not first load//
            }
        }


        protected void PorcentagemVenda(int id)
        {
            string currentUserId = User.Identity.GetUserId();
            var passagemVendida = SvcVendaCliente.PesquisaViagem(id, currentUserId);
            var quantidadePassagem = SvcViagem.BuscarViagem(id);
            //if (passagemVendida == null)
            //    return;
            var t = quantidadePassagem.Veiculo;
            var assento = SvcVeiculo.BuscarVeiculo(t);
            var r = assento.Lugares.Value;
            var y = passagemVendida.Count();
            var total = (100 / r) * y;
            Porcent.Value = total.ToString();

            string assentos = Convert.ToString(assento.Lugares.Value);
            txtAssento.Text = assentos;
        }
        protected void MontarCadastroViagem(int id)
        {
            _viagem = SvcViagem.BuscarViagem(id);
            if (_viagem == null)
                return;//subtituir depois por menssagem

            txtViagem.Text = _viagem.Nome;
            txtLocal.Text = _viagem.Local;
            txtDataInicio.Text = _viagem.DataInicio.ToString("yyyy-MM-dd");
            txtDataFim.Text = _viagem.DataFim.ToString("yyyy-MM-dd");
            txtValor.Text = _viagem.Valor.ToString();
            txtEstado.Value = _viagem.Estado;
            txtDescricao.Text = _viagem.Descricao;
            ddlVeiculo.SelectedValue = Convert.ToString(_viagem.Veiculo);

        }

        protected void carregaVeiculo(string pId)
        {
            ddlVeiculo.DataSource = SvcVeiculo.ListarTodosVeiculos(pId);
            ddlVeiculo.DataBind();

        }

        protected void modoVisualizacao()
        {
            txtViagem.ReadOnly = true;
            txtLocal.ReadOnly = true;
            txtDataInicio.ReadOnly = true;
            txtDataFim.ReadOnly = true;
            txtValor.ReadOnly = true;
            txtEstado.Disabled = true;
            txtDescricao.ReadOnly = true;
            ddlVeiculo.Enabled = false;
            txtAssento.ReadOnly = true;
            txbValorDespesa.ReadOnly = true;
            txbValorLucro.ReadOnly = true;
            txbValorPago.ReadOnly = true;
            txbValorTotal.ReadOnly = true;

               
        }


        decimal total;
        decimal? totalDespesas;
        protected void CarregaResultados(int id)
        {
            string currentUserId = User.Identity.GetUserId();
            //var esperado = SvcVendaCliente.PesquisaViagem(id);
            var esperado = SvcViagem.BuscarViagem(id);
            var assento = SvcVeiculo.BuscarVeiculo(esperado.Veiculo).Lugares;
            var soma = esperado.Valor * assento;
            txbValorTotal.Text = Convert.ToString(soma);
            var vendas = SvcVendaCliente.PesquisaViagem(id, currentUserId);
            foreach (var item in vendas)
            {
                total = total + item.VendaValorPago;
            }
            txbValorPago.Text = total.ToString();
            var despesa = SvcContaPagarReceber.PesquisaDespesaViagem(id);
            foreach (var item in despesa)
            {
                totalDespesas = totalDespesas + item.Valor;
            }
            txbValorDespesa.Text = totalDespesas.ToString();
            txbValorLucro.Text = (total - totalDespesas).ToString();
            ChartLucro.Value = (total - totalDespesas).ToString();
            ChartDespesa.Value = totalDespesas.ToString();
            ChartTotal.Value = soma.ToString();
        }
    }
}