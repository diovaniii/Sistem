using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ViagemSeg;
using ViagemSeg.Comuns;
using ViagemSeg.Svc;

namespace ViagemWeb
{
    public partial class CadastroCliente : System.Web.UI.Page
    {
        private cliente _cliente
        {
            get { return (cliente)ViewState[typeof(cliente).FullName]; }
            set { ViewState[typeof(cliente).FullName] = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //very first load//
                string id = Request.QueryString["clienteId"];
                if (!string.IsNullOrEmpty(id))
                {
                    MontarCadastro(Convert.ToInt32(id));
                }
                else
                {
                    _cliente = new cliente();
                }
            }
            else
            {
                //not first load//
            }
        }

        protected void BtnSalvar_OnClick(object sender, EventArgs e)
        {
            Salvar();
        }

        protected void BtnLimpar_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("CadastroCliente.aspx");
        }

        protected void MontarCadastro(int id)
        {
            _cliente = SvcCliente.BuscarCliente(id);
            if (_cliente == null)
                return;//subtituir depois por menssagem
            txtNome.Text = _cliente.Nome;
            txtTelefone.Text = Comun.FormatarTelefone( _cliente.Telefone);
            txtCpf.Text = Comun.FormatarCpfCnpj( _cliente.Cpf);
            txtDataNascimento.Text = _cliente.DataNascimento.ToString("yyyy-MM-dd");
            txtEmail.Text = _cliente.Email;
            limpar.Visible = false;

            var enderecoPessoal = _cliente.endereco.Where(x => x.Origem == 0).FirstOrDefault();
            if (enderecoPessoal != null)
            {
                txtEstado.Value = enderecoPessoal.Estado;
                txtCidade.Text = enderecoPessoal.Cidade;
                txtBairro.Text = enderecoPessoal.Bairro;
                txtRua.Text = enderecoPessoal.Rua;
                txtNumero.Text = enderecoPessoal.Numero;
            }

            var enderecoComercial = _cliente.endereco.Where(x => x.Origem == 1).FirstOrDefault();
            if (enderecoComercial == null)
                return;
            txtEstadoC.Value = enderecoComercial.Estado;
            txtCidadeC.Text = enderecoComercial.Cidade;
            txtBairroC.Text = enderecoComercial.Bairro;
            txtRuaC.Text = enderecoComercial.Rua;
            txtNumeroC.Text = enderecoComercial.Numero;
        }

        protected void Salvar()
        {
            if (_cliente.Id == 0)
            {
                _cliente.Nome = txtNome.Text;
                _cliente.Cpf = Comun.ApenasNumeros(txtCpf.Text);
                _cliente.Telefone = Comun.ApenasNumeros( txtTelefone.Text);
                _cliente.DataNascimento = Convert.ToDateTime(txtDataNascimento.Text);
                _cliente.Email = txtEmail.Text;
                _cliente.Status = 0;

                endereco enderecoPessoal = new endereco();
                enderecoPessoal.Estado = txtEstado.Value;
                enderecoPessoal.Cidade = txtCidade.Text;
                enderecoPessoal.Bairro = txtBairro.Text;
                enderecoPessoal.Rua = txtRua.Text;
                enderecoPessoal.Numero = txtNumero.Text;
                if (enderecoPessoal.IsEmpty == false)
                {
                    enderecoPessoal.Origem = 0;
                }

                endereco enderecoComercial = new endereco();
                enderecoComercial.Estado = txtEstadoC.Value;
                enderecoComercial.Cidade = txtCidadeC.Text;
                enderecoComercial.Bairro = txtBairroC.Text;
                enderecoComercial.Rua = txtRuaC.Text;
                enderecoComercial.Numero = txtNumeroC.Text;
                if (enderecoComercial.IsEmpty == false)
                {
                    enderecoComercial.Origem = 1;
                }

                SvcCliente.AlteraSalva(_cliente, enderecoPessoal, enderecoComercial);
                Response.Redirect("ListaCliente.aspx");
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Cadastrado com sucesso');", true);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Cadastrado com sucesso');", false);
            }
            else
            {
                _cliente.Nome = txtNome.Text;
                _cliente.Cpf = Comun.ApenasNumeros(txtCpf.Text);
                _cliente.Telefone = Comun.ApenasNumeros(txtTelefone.Text);
                _cliente.Email = txtEmail.Text;
                _cliente.DataNascimento = Convert.ToDateTime(txtDataNascimento.Text);
                _cliente.Status = 0;

                endereco enderecoPessoal = new endereco();
                enderecoPessoal.ClienteIdEndereco = _cliente.Id;
                enderecoPessoal.Estado = txtEstado.Value;
                enderecoPessoal.Cidade = txtCidade.Text;
                enderecoPessoal.Bairro = txtBairro.Text;
                enderecoPessoal.Rua = txtRua.Text;
                enderecoPessoal.Numero = txtNumero.Text;
                if (enderecoPessoal.IsEmpty == false)
                {
                    enderecoPessoal.Origem = 0;
                }

                endereco enderecoComercial = new endereco();
                enderecoComercial.ClienteIdEndereco = _cliente.Id;
                enderecoComercial.Estado = txtEstadoC.Value;
                enderecoComercial.Cidade = txtCidadeC.Text;
                enderecoComercial.Bairro = txtBairroC.Text;
                enderecoComercial.Rua = txtRuaC.Text;
                enderecoComercial.Numero = txtNumeroC.Text;
                if (enderecoComercial.IsEmpty == false)
                {
                    enderecoComercial.Origem = 1;
                }

                SvcCliente.AlteraSalva(_cliente, enderecoPessoal, enderecoComercial);

                Response.Redirect("ListaCliente.aspx");
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Cadastrado alterado com sucesso');", true);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Erro ao cadastrar');", false);
            }
        }
    }
}