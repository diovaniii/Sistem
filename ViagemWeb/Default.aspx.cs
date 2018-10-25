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
        //private string _antiXsrfTokenValue;
        //private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        //private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        protected void Page_Load(object sender, EventArgs e)
        {
            //var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            //Guid requestCookieGuidValue;
            //if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            //{
            //    // Use the Anti-XSRF token from the cookie
                
            //}
            CarregarListaViagem();
            CarregaResultados();
        }

        private void CarregarListaViagem()
        {
            grpListaDeViagem.DataSource = SvcViagem.ListarTodasViagens();
            grpListaDeViagem.DataBind();
            uppGridViewViagem.Update();
        }

        decimal? soma;
        decimal total;
        decimal totalDespesas;

        protected void CarregaResultados()
        {

            //var esperado = SvcVendaCliente.PesquisaViagem(id);
            var todasViagens = SvcViagem.ListarTodasViagens();
            foreach (var item in todasViagens)
            {
                var esperado = SvcViagem.BuscarViagem(item.ViagemId);
                var assento = SvcVeiculo.BuscarVeiculo(esperado.Veiculo.Value).Lugares;
                soma = esperado.Valor * assento;
                txbValorTotal.Text = Convert.ToString(soma);
                var vendas = SvcVendaCliente.PesquisaViagem(item.ViagemId);
                foreach (var item1 in vendas)
                {
                    total = total + item1.VendaValorPago;
                }
                txbValorPago.Text = total.ToString();
                var despesa = SvcContaPagarReceber.PesquisaDespesaViagem(item.ViagemId);
                foreach (var item2 in despesa)
                {
                    totalDespesas = totalDespesas + item2.Valor;
                }
            }

            txbValorDespesa.Text = totalDespesas.ToString();
            txbValorLucro.Text = (total - totalDespesas).ToString();
            ChartLucro.Value = (total - totalDespesas).ToString();
            ChartDespesa.Value = totalDespesas.ToString();
            ChartTotal.Value = soma.ToString();
        }
    }
}