using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ViagemSeg;
using ViagemSeg.Dto;
using ViagemSeg.Svc;


namespace ViagemWeb
{
    public partial class PrestacaoServico : System.Web.UI.Page
    {
        private pestacaoservico _Servico
        {
            get { return (pestacaoservico)ViewState[typeof(pestacaoservico).FullName]; }
            set { ViewState[typeof(pestacaoservico).FullName] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            carregaNome();
            //very first load//
            string id = Request.QueryString["ServicoId"];
            if (!string.IsNullOrEmpty(id))
            {

                //MontarCadastroVeiculo(Convert.ToInt32(id));
            }
            else
            {

                _Servico = new pestacaoservico();
            }
        }

        protected void salvar_Click(object sender, EventArgs e)
        {
            if (_Servico.Id == 0)
            {
                _Servico.IdFornecedor = Convert.ToInt32( ddlFornecedor.SelectedValue);
                _Servico.Descricao = txtServico.Text;
                _Servico.Valor = Convert.ToDecimal(txtValor.Text);
                _Servico.Status = 0;


                SvcServico.AlteraSalvaServico(_Servico);
                Response.Redirect("ListaServico.aspx");
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Cadastrado com sucesso');", true);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Cadastrado com sucesso');", false);
            }
            else
            {
                _Servico.IdFornecedor = Convert.ToInt32(ddlFornecedor.SelectedValue);
                _Servico.Descricao = txtServico.Text;
                _Servico.Valor = Convert.ToInt32(txtValor.Text);
                _Servico.Status = 0;


                SvcServico.AlteraSalvaServico(_Servico);
                Response.Redirect("ListaServico.aspx");
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Cadastrado com sucesso');", true);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Cadastrado com sucesso');", false);
            }

            
        }

        protected void limpar_Click(object sender, EventArgs e)
        {
            Response.Redirect("CadastroServico.aspx");
        }

        protected void carregaNome()
        {
            ddlFornecedor.DataSource = SvcFornecedor.ListarFornecedor();
            ddlFornecedor.DataBind();
            UpdatePanel.Update();
        }
    }
}