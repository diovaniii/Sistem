using Microsoft.AspNet.Identity;
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
    public partial class VendaFretamento : System.Web.UI.Page
    {
        private fretamento _Fretamento
        {
            get { return (fretamento)ViewState[typeof(fretamento).FullName]; }
            set { ViewState[typeof(fretamento).FullName] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //very first load//
                string id = Request.QueryString["FretamentoId"];
                if (!string.IsNullOrEmpty(id))
                {

                    MontarVendaFretamento(Convert.ToInt32(id));
                }
                else
                {

                    _Fretamento = new fretamento();
                }
            }
            else
            {
                //not first load//
            }
        }

        protected void salvar_Click(object sender, EventArgs e)
        {
            if (_Fretamento.Id == 0)
            {
                _Fretamento.Nome = txtNome.Text;
                _Fretamento.Km = Convert.ToDecimal(txtKm.Text);
                _Fretamento.Valor = Convert.ToDecimal(txtValor.Text);
                _Fretamento.Descricao = txtDescricao.Text;
                _Fretamento.Cliente = txtCliente.Text;
                _Fretamento.Status = 0;
                string currentUserId = User.Identity.GetUserId();
                _Fretamento.aspnetusers_Id = currentUserId;


                SvcFretamento.AlteraSalvaFretamento(_Fretamento);
                Response.Redirect("ListaFretamento.aspx");
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Cadastrado com sucesso');", true);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Cadastrado com sucesso');", false);
            }
            else
            {
                _Fretamento.Nome = txtNome.Text;
                _Fretamento.Km = Convert.ToDecimal(txtKm.Text);
                _Fretamento.Valor = Convert.ToDecimal(txtValor.Text);
                _Fretamento.Descricao = txtDescricao.Text;
                _Fretamento.Cliente = txtCliente.Text;
                _Fretamento.Status = 0;
                string currentUserId = User.Identity.GetUserId();
                _Fretamento.aspnetusers_Id = currentUserId;


                SvcFretamento.AlteraSalvaFretamento(_Fretamento);
                Response.Redirect("ListaFretamento.aspx");
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Cadastrado com sucesso');", true);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Cadastrado com sucesso');", false);
            }
        }

        protected void limpar_Click(object sender, EventArgs e)
        {
            Response.Redirect("VendaFretamento.aspx");
        }

        protected void MontarVendaFretamento(int id)
        {
            _Fretamento = SvcFretamento.BuscarFretamento(id);
            txtCliente.Text = _Fretamento.Cliente;
            txtNome.Text = _Fretamento.Nome;
            txtValor.Text = Convert.ToString( _Fretamento.Valor);
            txtKm.Text = Convert.ToString( _Fretamento.Km);
            txtDescricao.Text = _Fretamento.Descricao;


        }
    }
}