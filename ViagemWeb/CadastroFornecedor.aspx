<%@ Page Title="Cadastro Fornecedor" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CadastroFornecedor.aspx.cs" Inherits="ViagemWeb.CadastroFornecedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <asp:Panel runat="server">
        <p />
        <fieldset>
            <legend>Cadastro Fornecedor</legend>
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
                        Telefone:
                        <br>
                        <asp:TextBox ID="txtTelefone" runat="server" Class="form-control" Font-Bold="false"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server"
                            ValidationGroup="validador"
                            ForeColor="Red"
                            ControlToValidate="txtTelefone"
                            ErrorMessage="Campo obrigatório" />
                    </label>
                </div>
                <div class="col-md-3">
                    <label>
                        Descrição:
                        <br>
                        <asp:TextBox ID="txtDescricao" runat="server" Class="form-control" Rows="5" TextMode="MultiLine" ></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server"
                            ValidationGroup="validador"
                            ForeColor="Red"
                            ControlToValidate="txtDescricao"
                            ErrorMessage="Campo obrigatório" />
                    </label>
                </div>
            </div>
        </fieldset>
    </asp:Panel>
     <asp:Button id="salvar" runat="server" Text="Salvar" Class=" btn btn-cadastro" Font-Bold="true" OnClick="salvar_Click" ValidationGroup="validador" />
    <asp:Button ID="limpar" runat="server" Text="Limpar" Class=" btn btn-cadastro" Font-Bold="true" OnClick="limpar_Click" />
    <script type="text/javascript">
        /* Máscaras ER */
        function mascara(o, f) {
            v_obj = o
            v_fun = f
            setTimeout("execmascara()", 1)
        }
        function execmascara() {
            v_obj.value = v_fun(v_obj.value)
        }
        function mtel(v) {
            v = v.replace(/\D/g, "");             //Remove tudo o que não é dígito
            v = v.replace(/^(\d{2})(\d)/g, "($1) $2"); //Coloca parênteses em volta dos dois primeiros dígitos
            v = v.replace(/(\d)(\d{4})$/, "$1-$2");    //Coloca hífen entre o quarto e o quinto dígitos
            return v;
        }
        function id(el) {
            return document.getElementById(el);
        }

        window.onload = function () {
            id("<%=txtTelefone.ClientID%>").onkeypress = function () {
                mascara(this, mtel);
            }
        }
        
    </script>
</asp:Content>
