<%@ Page Title="Fornecedor" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PrestacaoServico.aspx.cs" Inherits="ViagemWeb.PrestacaoServico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
    <asp:Panel runat="server">
        <p />
        <fieldset>
            <legend>Fornecedor</legend>
            <div class="row">
                <div class="col-md-3">
                            <label>
                                Nome:
                        <br>
                                <asp:DropDownList ID="ddlFornecedor" runat="server" DataTextField="FornecedorNome" DataValueField="FornecedorId" Class="form-control js-example-basic-single" />
                            </label>
                        </div>
                <div class="col-md-3">
                    <label>
                        Serviço:
                        <br>
                        <asp:TextBox ID="txtServico" runat="server" Class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server"
                            ValidationGroup="validador"
                            ForeColor="Red"
                            ControlToValidate="txtServico"
                            ErrorMessage="Campo obrigatório" />
                    </label>
                </div>
                <div class="col-md-3">
                    <label>
                        Valor:
                        <br>
                        <asp:TextBox ID="txtValor" runat="server" Class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server"
                            ValidationGroup="validador"
                            ForeColor="Red"
                            ControlToValidate="txtValor"
                            ErrorMessage="Campo obrigatório" />
                    </label>
                </div>
            </div>
        </fieldset>
    </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
     <asp:Button id="salvar" runat="server" Text="Salvar" Class=" btn btn-cadastro" Font-Bold="true" OnClick="salvar_Click" ValidationGroup="validador" />
    <asp:Button ID="limpar" runat="server" Text="Limpar" Class=" btn btn-cadastro" Font-Bold="true" OnClick="limpar_Click" />

</asp:Content>
