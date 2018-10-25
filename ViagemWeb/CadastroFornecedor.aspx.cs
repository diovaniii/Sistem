using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ViagemSeg;
using ViagemSeg.Comuns;
using ViagemSeg.Svc;

namespace ViagemWeb
{
    public partial class CadastroFornecedor : System.Web.UI.Page
    {
        private fornecedor _Fornecedor
        {
            get { return (fornecedor)ViewState[typeof(fornecedor).FullName]; }
            set { ViewState[typeof(fornecedor).FullName] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //very first load//
            string id = Request.QueryString["FornecedorId"];
            if (!string.IsNullOrEmpty(id))
            {

                //MontarCadastroVeiculo(Convert.ToInt32(id));
            }
            else
            {

                _Fornecedor = new fornecedor();
            }
        }


        protected void limpar_Click(object sender, EventArgs e)
        {
            Response.Redirect("CadastroFornecedor.aspx");
        }

        protected void salvar_Click(object sender, EventArgs e)
        {
            SalvarFornecedor();
        }

        protected void SalvarFornecedor()
        {
            if (_Fornecedor.Id == 0)
            {
                _Fornecedor.Nome = txtNome.Text;
                _Fornecedor.Servico = txtDescricao.Text;
                _Fornecedor.Telefone = Comun.ApenasNumeros(txtTelefone.Text);
                _Fornecedor.Status = 0;


                SvcFornecedor.AlteraSalvaFornecedor(_Fornecedor);
                Response.Redirect("ListaFornecedor.aspx");
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Cadastrado com sucesso');", true);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Cadastrado com sucesso');", false);
            }
            else
            {
                _Fornecedor.Nome = txtNome.Text;
                _Fornecedor.Servico = txtDescricao.Text;
                _Fornecedor.Telefone = Comun.ApenasNumeros(txtTelefone.Text);
                _Fornecedor.Status = 0;


                SvcFornecedor.AlteraSalvaFornecedor(_Fornecedor);
                Response.Redirect("ListaFornecedor.aspx");
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Cadastrado com sucesso');", true);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Cadastrado com sucesso');", false);
            }
            
        }
    }
}