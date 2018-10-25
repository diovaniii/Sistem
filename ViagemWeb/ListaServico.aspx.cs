using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ViagemSeg.Svc;

namespace ViagemWeb
{
    public partial class ListaServico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CarregarListaServico();
        }

        protected void btnCadastroServico_Click(object sender, EventArgs e)
        {
            Response.Redirect("PrestacaoServico.aspx");
        }

        private void CarregarListaServico()
        {
            grpListaDeServico.DataSource = SvcServico.ListarServico();
            grpListaDeServico.DataBind();
            uppGridViewServico.Update();
        }

        protected void Editar(object sender, CommandEventArgs e)
        {
            var valor = Convert.ToInt32(e.CommandArgument);
            var script = string.Format("window.open('PrestacaoServico.aspx?VeiculoId={0}')", valor);
            ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), script, true);
        }

        protected void Excluir(object sender, CommandEventArgs e)
        {
            var valor = Convert.ToInt32(e.CommandArgument);
            SvcVeiculo.Excluir(valor);
            CarregarListaServico();
        }
    }
}