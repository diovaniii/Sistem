using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ViagemSeg.Svc;

namespace ViagemWeb
{
    public partial class ListaViagem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CarregarListaViagem();
        }

        private void CarregarListaViagem()
        {
            grpListaDeViagem.DataSource = SvcViagem.ListarTodasViagens();
            grpListaDeViagem.DataBind();
            uppGridViewViagem.Update();
        }

        protected void btnCadastroViagem_Click(object sender, EventArgs e)
        {
            Response.Redirect("CadastroViagem.aspx");
        }

        protected void Editar(object sender, CommandEventArgs e)
        {
            var valor = Convert.ToInt32(e.CommandArgument);
            var script = string.Format("window.open('CadastroViagem.aspx?ViagemId={0}')", valor);
            ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), script, true);
        }
        protected void Excluir(object sender, CommandEventArgs e)
        {
            var valor = Convert.ToInt32(e.CommandArgument);
            SvcViagem.Excluir(valor);
            CarregarListaViagem();
        }
        protected void Stats(object sender, CommandEventArgs e)
        {
            var valor = Convert.ToInt32(e.CommandArgument);
            var script = string.Format("window.open('StatsViagem.aspx?ViagemId={0}')", valor);
            ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), script, true);
        }
    }
}