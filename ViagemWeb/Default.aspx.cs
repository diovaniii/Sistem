using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ViagemSeg.Svc;

namespace ViagemWeb
{
    public partial class _Default : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            string currentUserId = User.Identity.GetUserId();

            if (currentUserId != null)
            {
                CarregarListaViagem(currentUserId);
                CarregaResultados(currentUserId);
            }
            else
            {
                Response.Redirect("Account/Login.aspx");
            }
            
            
        }

        private void CarregarListaViagem(string pId)
        {
            grpListaDeViagem.DataSource = SvcViagem.ListarTodasViagens(pId);
            grpListaDeViagem.DataBind();
            uppGridViewViagem.Update();
        }

        decimal? soma;
        decimal total;
        decimal totalDespesas;

        protected void CarregaResultados(string pId)
        {
            //var esperado = SvcVendaCliente.PesquisaViagem(id);
            var todasViagens = SvcViagem.ListarTodasViagens(pId);
            foreach (var item in todasViagens)
            {
                var esperado = SvcViagem.BuscarViagem(item.ViagemId);
                var assento = SvcVeiculo.BuscarVeiculo(esperado.Veiculo).Lugares;
                if (soma == null)
                {
                    soma = esperado.Valor * assento;
                }
                else
                {
                    soma = soma + (esperado.Valor * assento);
                }
                var vendas = SvcVendaCliente.PesquisaViagem(item.ViagemId);
                foreach (var item1 in vendas)
                {
                    total = total + item1.VendaValorPago;
                }

                var despesa = SvcContaPagarReceber.PesquisaDespesaViagem(item.ViagemId);
                foreach (var item2 in despesa)
                {
                    totalDespesas = totalDespesas + item2.Valor;
                }
            }
            txbValorPago.Text = total.ToString();
            txbValorTotal.Text = Convert.ToString(soma);
            txbValorDespesa.Text = totalDespesas.ToString();
            txbValorLucro.Text = (total - totalDespesas).ToString();
            ChartLucro.Value = (total - totalDespesas).ToString();
            ChartDespesa.Value = totalDespesas.ToString();
            ChartTotal.Value = soma.ToString();
        }
    }
}