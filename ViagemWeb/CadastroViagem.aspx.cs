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
    public partial class CadastroViagem : System.Web.UI.Page
    {
        private viagem _viagem
        {
            get { return (viagem)ViewState[typeof(viagem).FullName]; }
            set { ViewState[typeof(viagem).FullName] = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                carregaVeiculo();
                //very first load//
                string id = Request.QueryString["ViagemId"];
                if (!string.IsNullOrEmpty(id))
                {
                    
                    MontarCadastroViagem(Convert.ToInt32(id));
                }
                else
                {
                    _viagem = new viagem();
                }
            }
            else
            {
                //not first load//
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            SalvarViagem();
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            Response.Redirect("CadastroViagem.aspx");
        }

        protected void SalvarViagem()
        {
            if (_viagem.Id == 0)
            {
                _viagem.Nome = txtViagem.Text;
                _viagem.Local = txtLocal.Text;
                _viagem.Estado = txtEstado.Value;
                _viagem.Valor = Convert.ToDecimal(txtValor.Text);
                _viagem.DataInicio = Convert.ToDateTime(txtDataInicio.Text);
                _viagem.DataFim = Convert.ToDateTime(txtDataFim.Text);
                _viagem.Descricao = txtDescricao.Text;
                _viagem.Status = 0;
                _viagem.Veiculo = Convert.ToInt32( ddlVeiculo.SelectedValue);

                SvcViagem.AlteraSalva(_viagem);
                Response.Redirect("ListaViagem.aspx");
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Cadastrado com sucesso');", true);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Cadastrado com sucesso');", false);
            }
            else
            {
                _viagem.Nome = txtViagem.Text;
                _viagem.Local = txtLocal.Text;
                _viagem.Estado = txtEstado.Value;
                _viagem.Valor = Convert.ToDecimal(txtValor.Text);
                _viagem.DataInicio = Convert.ToDateTime(txtDataInicio.Text);
                _viagem.DataFim = Convert.ToDateTime(txtDataFim.Text);
                _viagem.Descricao = txtDescricao.Text;
                _viagem.Status = 0;
                _viagem.Veiculo = Convert.ToInt32(ddlVeiculo.SelectedValue);

                SvcViagem.AlteraSalva(_viagem);
                Response.Redirect("ListaViagem.aspx");
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Cadastrado com sucesso');", true);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Cadastrado com sucesso');", false);
            }
        }

        protected void MontarCadastroViagem(int id)
        {
            _viagem = SvcViagem.BuscarViagem(id);
            if (_viagem == null)
                return;//subtituir depois por menssagem

            txtViagem.Text = _viagem.Nome;
            txtLocal.Text = _viagem.Local;
            txtDataInicio.Text = _viagem.DataInicio?.ToString("yyyy-MM-dd");
            txtDataFim.Text = _viagem.DataFim?.ToString("yyyy-MM-dd");
            txtValor.Text = _viagem.Valor.ToString();
            txtEstado.Value = _viagem.Estado;
            txtDescricao.Text = _viagem.Descricao;
            ddlVeiculo.SelectedValue = Convert.ToString (_viagem.Veiculo);
            limpar.Visible = false;
        }

        protected void carregaVeiculo()
        {
            ddlVeiculo.DataSource = SvcVeiculo.ListarTodosVeiculos() ;
            ddlVeiculo.DataBind();
            UpdatePanel.Update();
        }
    }
}