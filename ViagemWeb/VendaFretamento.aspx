<%@ Page Title="Fretamento" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VendaFretamento.aspx.cs" Inherits="ViagemWeb.VendaFretamento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <asp:Panel runat="server">
        <p />
        <fieldset>
            <legend>Fretamento</legend>
            <div class="row">
                <div class="col-md-3">
                    <label>
                        Nome:
                        <br>
                        <asp:TextBox ID="txtNome" runat="server" Class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server"
                            ValidationGroup="validador"
                            ForeColor="Red"
                            ControlToValidate="txtNome"
                            ErrorMessage="Campo obrigatório" />
                    </label>
                </div>
                <div class="col-md-3">
                    <label>
                        Km:
                        <br>
                        <asp:TextBox ID="txtKm" runat="server" Class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server"
                            ValidationGroup="validador"
                            ForeColor="Red"
                            ControlToValidate="txtKm"
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
                <div class="col-md-3">
                    <label>
                        Descricao:
                        <br>
                        <asp:TextBox ID="txtDescricao" runat="server" Class="form-control" Rows="5" TextMode="MultiLine" ></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server"
                            ValidationGroup="validador"
                            ForeColor="Red"
                            ControlToValidate="txtDescricao"
                            ErrorMessage="Campo obrigatório" />
                    </label>
                </div>
                <div class="col-md-3">
                    <label>
                        Cliente:
                        <br>
                        <asp:TextBox ID="txtCliente" runat="server" Class="form-control" ></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server"
                            ValidationGroup="validador"
                            ForeColor="Red"
                            ControlToValidate="txtCliente"
                            ErrorMessage="Campo obrigatório" />
                    </label>
                </div>
            </div>
        </fieldset>
    </asp:Panel>
     <asp:Button id="salvar" runat="server" Text="Salvar" Class=" btn btn-cadastro" Font-Bold="true" OnClick="salvar_Click" ValidationGroup="validador" />
    <asp:Button ID="limpar" runat="server" Text="Limpar" Class=" btn btn-cadastro" Font-Bold="true" OnClick="limpar_Click" />

</asp:Content>
