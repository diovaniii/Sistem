using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ViagemSeg;
using ViagemSeg.Svc;

namespace ViagemWeb
{
    public partial class ContaPagarReceber : System.Web.UI.Page
    {
        public List<contas> contaList
        {
            get { return (List<contas>)ViewState[typeof(contas).FullName]; }
            set { ViewState[typeof(contas).FullName] = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CarregarTipo();
                HabilitarTipo();
                //carregaNome();
                //CarregaFornecedor();
                CarregarViagem();

                contaList = new List<contas>();
                btnSalvar.Visible = false;
                HabilitarTipo();
            }
            
        }

        protected void ddlViagem_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Ok_Click(object sender, EventArgs e)
        {
            var parcelar = Convert.ToInt32(txtParcelar.Text);
            for (int i = 0; i < parcelar; i++)
            {
                contas conta = new contas();
                if (txtValorTotal.Text != "")
                    conta.Valor = Convert.ToInt32(txtValorTotal.Text) / parcelar;

                conta.Cliente = Convert.ToInt32(ddlCliente.SelectedValue);
                //if (ddlTípo.SelectedValue == "1")
                //{
                //    conta.Cliente = Convert.ToInt32(ddlCliente.SelectedValue);
                //}
                //else
                //{
                //    conta.Fornecedor = Convert.ToInt32(ddlFornecedor.SelectedValue);
                //}
                conta.Viagem = Convert.ToInt32(ddlViagem.SelectedValue);
                conta.Indentificador = Convert.ToInt32(ddlTípo.SelectedValue);
                conta.DataRecebimento = Convert.ToDateTime(txtDataRecebido.Text);
                conta.Parcelas = i + 1;
                conta.Status = 0;
                contaList.Add(conta);
            }
            grpConta.DataSource = contaList;
            grpConta.DataBind();
            uppGridView.Update();
            btnSalvar.Visible = true;
        }


        protected void limpar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContaPagarReceber.aspx");
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
                UpdatePanel.Update();
            }
        }
        //protected void carregaNome()
        //{
        //    ddlCliente.DataSource = SvcCliente.ListarTodosClientes();
        //    ddlCliente.DataBind();
        //    UpdatePanel.Update();
        //}
        //protected void CarregaFornecedor()
        //{
        //    ddlFornecedor.DataSource = SvcFornecedor.ListarFornecedor();
        //    ddlFornecedor.DataBind();
        //    UpdatePanel.Update();
        //}
        protected void CarregarViagem()
        {
            ddlViagem.DataSource = SvcViagem.ListarTodasViagens();
            ddlViagem.DataBind();
            UpdatePanel.Update();
        }

        protected void Salvar_Click(object sender, EventArgs e)
        {
            foreach (var item in contaList)
            {
                foreach (GridViewRow item1 in grpConta.Rows)
                {
                    var numero = item1.Cells[1];

                    if (item.Parcelas == Convert.ToInt32(numero.Text))
                    {
                        TextBox vencimento = (TextBox)item1.FindControl("txtDataVencimento");
                        item.DataVencimento = Convert.ToDateTime(vencimento.Text);
                        TextBox valor = (TextBox)item1.FindControl("txtValor");
                        item.Valor = Convert.ToDecimal(valor.Text);
                    }
                }
                SvcContaPagarReceber.AlteraSalva(item);
            }
            btnSalvar.Visible = false;
        }

        protected void grpConta_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                foreach (var item in contaList)
                {
                    TextBox ddlgrid = (e.Row.FindControl("txtValor") as TextBox);
                    ddlgrid.Text = item.Valor.ToString();
                    ddlgrid.DataBind();
                }
            }
        }
    }
}