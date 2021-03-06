﻿using Microsoft.AspNet.Identity;
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
            if (!IsPostBack)
            {
                string currentUserId = User.Identity.GetUserId();
                carregaNome(currentUserId);
                CarregarListaViagem(currentUserId);
                //very first load//
                string id = Request.QueryString["ServicoId"];
                if (!string.IsNullOrEmpty(id))
                {

                    MontarPrestacaoServico(Convert.ToInt32(id));
                }
                else
                {

                    _Servico = new pestacaoservico();
                }
            }
            else
            {
                //not first load//
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
                _Servico.IdViagem = Convert.ToInt32( ddlViagem.SelectedItem.Value);
                string currentUserId = User.Identity.GetUserId();
                _Servico.aspnetusers_Id = currentUserId;
                

                SvcServico.AlteraSalvaServico(_Servico);
                Response.Redirect("ListaServico.aspx");
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Cadastrado com sucesso');", true);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertBox", "alert('Cadastrado com sucesso');", false);
            }
            else
            {

                _Servico.IdFornecedor = Convert.ToInt32(ddlFornecedor.SelectedValue);
                _Servico.Descricao = txtServico.Text;
                _Servico.Valor = Convert.ToDecimal(txtValor.Text);
                _Servico.Status = 0;
                _Servico.IdViagem = Convert.ToInt32(ddlViagem.SelectedItem.Value);
                string currentUserId = User.Identity.GetUserId();
                _Servico.aspnetusers_Id = currentUserId;
                _Servico.aspnetusers = null;
                

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

        protected void carregaNome(string pId)
        {
            ddlFornecedor.DataSource = SvcFornecedor.ListarFornecedor(pId);
            ddlFornecedor.DataBind();
            UpdatePanel.Update();
        }

        private void CarregarListaViagem(string pId)
        {
            ddlViagem.DataSource = SvcViagem.ListarTodasViagens(pId);
            ddlViagem.DataBind();
            UpdatePanel.Update();
        }

        protected void MontarPrestacaoServico(int id)
        {
            _Servico = SvcServico.BuscarServico(id);
            txtServico.Text = _Servico.Descricao;
            txtValor.Text = Convert.ToString( _Servico.Valor);
            ddlViagem.SelectedItem.Value = Convert.ToString(_Servico.IdViagem);
            ddlFornecedor.SelectedValue = Convert.ToString( _Servico.IdFornecedor);
        }

        
    }
}