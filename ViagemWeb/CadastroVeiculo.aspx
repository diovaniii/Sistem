<%@ Page Title="Cadastro de Veiculo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CadastroVeiculo.aspx.cs" Inherits="ViagemWeb.CadastroVeiculo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server">
        <p />
        <fieldset>
            <legend>Cadastro de Veiculo</legend>
            <div class="row">
                <div class="col-md-3">
                    <label>
                        Tipo:
                        <br>
                        <asp:DropDownList ID="txtTipo" runat="server" Class="form-control" ></asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server"
                            ValidationGroup="validador"
                            ForeColor="Red"
                            ControlToValidate="txtTipo"
                            ErrorMessage="Campo obrigatório" />
                    </label>
                </div>
                <div class="col-md-3">
                    <label>
                        Lugares:
                        <br>
                        <asp:TextBox ID="txtLugares" runat="server" Class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server"
                            ValidationGroup="validador"
                            ForeColor="Red"
                            ControlToValidate="txtLugares"
                            ErrorMessage="Campo obrigatório" />
                    </label>
                </div>
                <div class="col-md-3">
                    <label>
                        Placa:
                        <br>
                        <asp:TextBox ID="txtPlaca" runat="server" Class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server"
                            ValidationGroup="validador"
                            ForeColor="Red"
                            ControlToValidate="txtPlaca"
                            ErrorMessage="Campo obrigatório" />
                    </label>
                </div>
                <div class="col-md-3">
                    <label>
                        Indentificação:
                        <br>
                        <asp:TextBox ID="txtIdentificacao" runat="server" Class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server"
                            ValidationGroup="validador"
                            ForeColor="Red"
                            ControlToValidate="txtIdentificacao"
                            ErrorMessage="Campo obrigatório" />
                    </label>
                </div>
                
            </div>
        </fieldset>
    </asp:Panel>

        

     <asp:Button runat="server" Text="Salvar" Class=" btn btn-cadastro" OnClick="btnSalvar_Click" ValidationGroup="validador" />
    <asp:Button ID="limpar" runat="server" Text="Limpar" Class=" btn btn-cadastro" Font-Bold="true" OnClick="limpar_Click" />
</asp:Content>
