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
    public partial class ListaContaPagarReceber : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListaConta();
                CarregarTipo();
                HabilitarTipo();
            }
        }

        protected void btnCadastro_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContaPagarReceber.aspx");
        }

        protected void grpListaContas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void Editar(object sender, CommandEventArgs e)
        {
            //var valor = Convert.ToInt32(e.CommandArgument);
            //var script = string.Format("window.open('CadastroCliente.aspx?clienteId={0}')", valor);
            //ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), script, true);
        }
        protected void Excluir(object sender, CommandEventArgs e)
        {
            //var valor = Convert.ToInt32(e.CommandArgument);
            //SvcCliente.Excluir(valor);
            //CarregaListaCliente();
        }

        protected void ListaConta()
        {
            grpListaContas.DataSource = SvcContaPagarReceber.ListarContas();
            grpListaContas.DataBind();
            uppGridView.Update();
        }
        protected void ddlTípo_SelectedIndexChanged(object sender, EventArgs e)
        {
            HabilitarTipo();
            UpdatePanel.Update();
        }

        protected void CarregarTipo()
        {
            ddlTípo.Items.Add(new ListItem("Pagar", "0"));
            ddlTípo.Items.Add(new ListItem("Receber", "1"));
        }

        protected void HabilitarTipo()
        {
            if (ddlTípo.SelectedValue == "0")
            {
                ddlCliente.Visible = true;
                //ddlFornecedor.Visible = true;
                //ddlFornecedor.Visible = false;
                ddlCliente.DataSource = SvcFornecedor.ListarFornecedor();
                ddlCliente.DataTextField = "FornecedorNome";
                ddlCliente.DataValueField = "FornecedorId";
                ddlCliente.DataBind();
                ddlCliente.Items.Insert(0, new ListItem("--Select--", "0"));
                UpdatePanel.Update();
            }
            else
            {
                //ddlFornecedor.Visible = false;
                ddlCliente.Visible = true;
                ddlCliente.DataSource = SvcCliente.ListarTodosClientes();
                ddlCliente.DataTextField = "ClienteNome";
                ddlCliente.DataValueField = "ClienteId";
                ddlCliente.DataBind();
                ddlCliente.Items.Insert(0, new ListItem("--Select--", "0"));
                UpdatePanel.Update();
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            contas conta = new contas();
            conta.Indentificador = Convert.ToInt32(ddlTípo.Text);
            conta.Cliente = Convert.ToInt32(ddlCliente.Text);
            //cliente.Nome = ddlNome.Text;
            //cliente.Cpf = Comun.ApenasNumeros(txtCpf.Text);
            //cliente.DataNascimento = Convert.ToDateTime(txtDataNascimento.Text.Equals(string.Empty) ? DateTime.MinValue.ToString() : txtDataNascimento.Text);
            //cliente.Telefone = Comun.ApenasNumeros(txtTelefone.Text);
            var contasEncontrados = SvcContaPagarReceber.Pesquisa(conta);

            //lblNUmeroRegistro(contasEncontrados);

            grpListaContas.DataSource = contasEncontrados;
            grpListaContas.DataBind();
            uppGridView.Update();
        }
    }
}