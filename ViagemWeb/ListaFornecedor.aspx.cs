using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ViagemSeg.Svc;

namespace ViagemWeb
{
    public partial class ListaFornecedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CarregarListaFornecedor();
        }

        protected void btnCadastroFornecedor_Click(object sender, EventArgs e)
        {
            Response.Redirect("CadastroFornecedor.aspx");
        }

        private void CarregarListaFornecedor()
        {
            grpListaDeFornecedor.DataSource = SvcFornecedor.ListarFornecedor();
            grpListaDeFornecedor.DataBind();
            uppGridViewFornecedor.Update();
        }

        protected void Editar(object sender, CommandEventArgs e)
        {
            var valor = Convert.ToInt32(e.CommandArgument);
            var script = string.Format("window.open('CadastroFornecedor.aspx?VeiculoId={0}')", valor);
            ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), script, true);
        }
        protected void Excluir(object sender, CommandEventArgs e)
        {
            var valor = Convert.ToInt32(e.CommandArgument);
            SvcVeiculo.Excluir(valor);
            CarregarListaFornecedor();
        }
    }
}