using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ViagemSeg;
using ViagemSeg.Comuns;
using ViagemSeg.Svc;
using ViagemSeg.Dto;
using Microsoft.AspNet.Identity;

namespace ViagemWeb
{
    public partial class ListaCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string currentUserId = User.Identity.GetUserId();
                carregaNome();
                CarregaListaCliente();
                lblNUmeroRegistro(SvcCliente.ListarTodosClientes(currentUserId));
            }
        }

        private void CarregaListaCliente()
        {
            string currentUserId = User.Identity.GetUserId();
            grpListaDeClientes.DataSource = SvcCliente.ListarTodosClientes(currentUserId);
            grpListaDeClientes.DataBind();
            uppGridView.Update();
        }

        protected void Editar(object sender, CommandEventArgs e)
        {
            var valor = Convert.ToInt32(e.CommandArgument);
            var script = string.Format("window.open('CadastroCliente.aspx?clienteId={0}')", valor);
            ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), script, true);
        }
        protected void Excluir(object sender, CommandEventArgs e)
        {
            var valor = Convert.ToInt32(e.CommandArgument);
            SvcCliente.Excluir(valor);
            CarregaListaCliente();
        }

        protected void grpListaDeClientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CarregaListaCliente();
            grpListaDeClientes.PageIndex = e.NewPageIndex;
            grpListaDeClientes.DataBind();
        }

        protected void lblNUmeroRegistro(List<DtoCliente> clientes)
        {
            int rowCount = clientes.Count;
            lblQuantidade.Text = "Numero de registros: " + rowCount.ToString();
        }

        protected void btnCadastro_Click(object sender, EventArgs e)
        {
            Response.Redirect("CadastroCliente.aspx");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            cliente cliente = new cliente();
            cliente.Nome = ddlNome.Text;
            cliente.Cpf = Comun.ApenasNumeros(txtCpf.Text);
            cliente.DataNascimento = Convert.ToDateTime( txtDataNascimento.Text.Equals(string.Empty) ? DateTime.MinValue.ToString(): txtDataNascimento.Text) ;
            cliente.Telefone = Comun.ApenasNumeros(txtTelefone.Text);
            var clienteEncontrados = SvcCliente.Pesquisa(cliente);

            lblNUmeroRegistro(clienteEncontrados);

            grpListaDeClientes.DataSource = clienteEncontrados;
            grpListaDeClientes.DataBind();
            uppGridView.Update();
        }

        protected void carregaNome()
        {
            string currentUserId = User.Identity.GetUserId();
            ddlNome.DataSource = SvcCliente.ListarTodosClientes(currentUserId);
            ddlNome.DataBind();
            UpdatePanel.Update();
        }

        
    }
}