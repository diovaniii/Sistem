<%@ Page Title="Cadastro de Cliente" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CadastroCliente.aspx.cs" Inherits="ViagemWeb.CadastroCliente" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server">
        <p />
        <fieldset>
            <legend>Cadastro de Cliente</legend>
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
                        Cpf:
                        <br>
                        <asp:TextBox ID="txtCpf" runat="server" Class="form-control" Font-Bold="false"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server"
                            ValidationGroup="validador"
                            ForeColor="Red"
                            ControlToValidate="txtCpf"
                            ErrorMessage="Campo obrigatório" />
                    </label>
                </div>
                <div class="col-md-3">
                    <label>
                        Data de nascimento:
                        <br>
                        <asp:TextBox ID="txtDataNascimento" runat="server" Class="form-control" TextMode="Date" Font-Bold="false"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server"
                            ValidationGroup="validador"
                            ForeColor="Red"
                            ControlToValidate="txtDataNascimento"
                            ErrorMessage="Campo obrigatório" />
                    </label>
                </div>
                <div class="col-md-3">
                    <label>
                        Email:
                        <br>
                        <asp:TextBox ID="txtEmail" TextMode="Email" runat="server" Class="form-control" Font-Bold="false"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server"
                            ValidationGroup="validador"
                            ForeColor="Red"
                            ControlToValidate="txtEmail"
                            ErrorMessage="Campo obrigatório" />
                    </label>
                </div>
            </div>
        </fieldset>
    </asp:Panel>

    <asp:UpdatePanel ID="uppAddEndereco" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="pnlEndereco" runat="server">
                <fieldset>
                    <legend>Endereço do Cliente</legend>
                    <div class="row">
                        <div class="col-md-3">
                            <label>
                                Estado:
                        <br>
                                <select id="txtEstado" runat="server" class="form-control" font-bold="false">
                                    <option value=""></option>
                                    <option value="AC">Acre</option>
                                    <option value="AL">Alagoas</option>
                                    <option value="AP">Amapá</option>
                                    <option value="AM">Amazonas</option>
                                    <option value="BA">Bahia</option>
                                    <option value="CE">Ceará</option>
                                    <option value="DF">Distrito Federal</option>
                                    <option value="ES">Espírito Santo</option>
                                    <option value="GO">Goiás</option>
                                    <option value="MA">Maranhão</option>
                                    <option value="MT">Mato Grosso</option>
                                    <option value="MS">Mato Grosso do Sul</option>
                                    <option value="MG">Minas Gerais</option>
                                    <option value="PA">Pará</option>
                                    <option value="PB">Paraíba</option>
                                    <option value="PR">Paraná</option>
                                    <option value="PE">Pernambuco</option>
                                    <option value="PI">Piauí</option>
                                    <option value="RJ">Rio de Janeiro</option>
                                    <option value="RN">Rio Grande do Norte</option>
                                    <option value="RS">Rio Grande do Sul</option>
                                    <option value="RO">Rondônia</option>
                                    <option value="RR">Roraima</option>
                                    <option value="SC">Santa Catarina</option>
                                    <option value="SP">São Paulo</option>
                                    <option value="SE">Sergipe</option>
                                    <option value="TO">Tocantins</option>
                                </select>
                        </div>
                        <div class="col-md-3">
                            <label>
                                Cidade:
                        <br>
                                <asp:TextBox ID="txtCidade" runat="server" Class="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <label>
                                Bairro:
                        <br>
                                <asp:TextBox ID="txtBairro" runat="server" Class="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <label>
                                Rua:
                        <br>
                                <asp:TextBox ID="txtRua" runat="server" Class="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <label>
                                Numero:
                        <br>
                                <asp:TextBox ID="txtNumero" runat="server" Class="form-control"></asp:TextBox>
                        </div>
                    </div>
                </fieldset>
            </asp:Panel>


            <asp:Panel ID="pnlEnderecoComercial" runat="server">
                <fieldset>
                    <legend>Endereço Comercial</legend>
                    <div class="row">
                        <div class="col-md-3">
                            <label>
                                Estado:
                        <br>
                                <select id="txtEstadoC" runat="server" class="form-control">
                                    <option value=""></option>
                                    <option value="AC">Acre</option>
                                    <option value="AL">Alagoas</option>
                                    <option value="AP">Amapá</option>
                                    <option value="AM">Amazonas</option>
                                    <option value="BA">Bahia</option>
                                    <option value="CE">Ceará</option>
                                    <option value="DF">Distrito Federal</option>
                                    <option value="ES">Espírito Santo</option>
                                    <option value="GO">Goiás</option>
                                    <option value="MA">Maranhão</option>
                                    <option value="MT">Mato Grosso</option>
                                    <option value="MS">Mato Grosso do Sul</option>
                                    <option value="MG">Minas Gerais</option>
                                    <option value="PA">Pará</option>
                                    <option value="PB">Paraíba</option>
                                    <option value="PR">Paraná</option>
                                    <option value="PE">Pernambuco</option>
                                    <option value="PI">Piauí</option>
                                    <option value="RJ">Rio de Janeiro</option>
                                    <option value="RN">Rio Grande do Norte</option>
                                    <option value="RS">Rio Grande do Sul</option>
                                    <option value="RO">Rondônia</option>
                                    <option value="RR">Roraima</option>
                                    <option value="SC">Santa Catarina</option>
                                    <option value="SP">São Paulo</option>
                                    <option value="SE">Sergipe</option>
                                    <option value="TO">Tocantins</option>
                                </select>
                        </div>
                        <div class="col-md-3">
                            <label>
                                Cidade:
                        <br>
                                <asp:TextBox ID="txtCidadeC" runat="server" Class="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <label>
                                Bairro:
                        <br>
                                <asp:TextBox ID="txtBairroC" runat="server" Class="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <label>
                                Rua:
                        <br>
                                <asp:TextBox ID="txtRuaC" runat="server" Class="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <label>
                                Numero:
                        <br>
                                <asp:TextBox ID="txtNumeroC" runat="server" Class="form-control"></asp:TextBox>
                        </div>
                    </div>
                </fieldset>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Button runat="server" Text="Salvar" Class=" btn btn-cadastro" Font-Bold="true" OnClick="BtnSalvar_OnClick" ValidationGroup="validador" />
    <asp:Button ID="limpar" runat="server" Text="Limpar" Class=" btn btn-cadastro" Font-Bold="true" OnClick="BtnLimpar_OnClick" />
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
        
        function mCpf(v) {
            v = v.replace(/\D/g, "");
            v = v.replace( /(\d{3})(\d)/ , "$1.$2");
            v = v.replace( /(\d{3})(\d)/ , "$1.$2");
            v = v.replace(/(\d{3})(\d{1,2})$/ , "$1-$2");
            return v;
        }
        
        window.onload = function () {
            id("<%=txtCpf.ClientID%>").onkeypress = function () {
                mascara(this, mCpf);
            }
            id("<%=txtTelefone.ClientID%>").onkeypress = function () {
                mascara(this, mtel);
            }
        }
        
    </script>
</asp:Content>

