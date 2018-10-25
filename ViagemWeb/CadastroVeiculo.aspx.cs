using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ViagemSeg;
using ViagemSeg.Comuns;
using ViagemSeg.Enums;
using ViagemSeg.Svc;

namespace ViagemWeb
{
    public partial class CadastroVeiculo : System.Web.UI.Page
    {
        private veiculo _veiculo
        {
            get { return (veiculo)ViewState[typeof(veiculo).FullName]; }
            set { ViewState[typeof(veiculo).FullName] = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CarregarDropDown();
                //very first load//
                string id = Request.QueryString["VeiculoId"];
                if (!string.IsNullOrEmpty(id))
                {

                    MontarCadastroVeiculo(Convert.ToInt32(id));
                }
                else
                {
                    
                    _veiculo = new veiculo();
                }
            }
            else
            {
                //not first load//
            }
            
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            SalvarVeiculo();
        }

        protected void CarregarDropDown()
        {
            SortedList sl = Comun.GetEnumForBind(typeof(Enuns.tipos));
            txtTipo.DataSource = sl;
            txtTipo.DataTextField = "value";
            txtTipo.DataValueField = "key";
            txtTipo.DataBind();
        }
        
        protected void SalvarVeiculo()
        {
            if (_veiculo.Id == 0)
            {
                _veiculo.Tipo = Convert.ToInt32( txtTipo.SelectedValue);
                _veiculo.Lugares = Convert.ToInt32( txtLugares.Text);
                _veiculo.Placa = txtPlaca.Text;
                _veiculo.Identificacao = txtIdentificacao.Text;
                _veiculo.Status = 0;
                

                SvcVeiculo.AlteraSalvaVeiculo(_veiculo);
                Response.Redirect("ListaVeiculo.aspx");
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Cadastrado com sucesso');", true);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Cadastrado com sucesso');", false);
            }
            else
            {
                _veiculo.Tipo = Convert.ToInt32(txtTipo.SelectedValue);
                _veiculo.Lugares = Convert.ToInt32(txtLugares.Text);
                _veiculo.Placa = txtPlaca.Text;
                _veiculo.Identificacao = txtIdentificacao.Text;
                _veiculo.Status = 0;


                SvcVeiculo.AlteraSalvaVeiculo(_veiculo);
                Response.Redirect("ListaVeiculo.aspx");
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Cadastrado com sucesso');", true);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Cadastrado com sucesso');", false);
            }
        }

        protected void MontarCadastroVeiculo(int id)
        {
            _veiculo = SvcVeiculo.BuscarVeiculo(id);
            if (_veiculo == null)
                return;//subtituir depois por menssagem

            txtTipo.Text = _veiculo.Tipo.ToString();
            txtLugares.Text = _veiculo.Lugares.ToString();
            txtPlaca.Text = _veiculo.Placa;
            txtIdentificacao.Text = _veiculo.Identificacao;
            limpar.Visible = false;
        }

        protected void limpar_Click(object sender, EventArgs e)
        {
            Response.Redirect("CadastroVeiculo.aspx");
        }

    }
}