using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ViagemSeg.Svc;

namespace ViagemWeb
{
    public partial class ListaVeiculo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CarregarListaVeiculo();
        }

        private void CarregarListaVeiculo()
        {
            grpListaDeVeiculo.DataSource = SvcVeiculo.ListarTodosVeiculos();
            grpListaDeVeiculo.DataBind();
            uppGridViewVeiculo.Update();
        }

        protected void btnCadastroVeiculo_Click(object sender, EventArgs e)
        {
            Response.Redirect("CadastroVeiculo.aspx");
        }

        protected void Editar(object sender, CommandEventArgs e)
        {
            var valor = Convert.ToInt32(e.CommandArgument);
            var script = string.Format("window.open('CadastroVeiculo.aspx?VeiculoId={0}')", valor);
            ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), script, true);
        }
        protected void Excluir(object sender, CommandEventArgs e)
        {
            var valor = Convert.ToInt32(e.CommandArgument);
            SvcVeiculo.Excluir(valor);
            CarregarListaVeiculo();
        }

    }
}