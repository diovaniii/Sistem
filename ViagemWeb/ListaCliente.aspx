<%@ Page Title="Lista de clientes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaCliente.aspx.cs" Inherits="ViagemWeb.ListaCliente" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <asp:Panel runat="server">
                <p />
                <fieldset>
                    <legend>Lista de clientes</legend>
                    <div class="row">
                        <div class="col-md-3">
                            <label>
                                Nome:
                        <br>
                                <asp:DropDownList ID="ddlNome" runat="server" DataTextField="ClienteNome" Class="form-control js-example-basic-single" />
                            </label>
                        </div>
                        <div class="col-md-3">
                            <label>
                                Telefone:
                        <br>
                                <asp:TextBox ID="txtTelefone" runat="server" Class="form-control" MaxLength="15"></asp:TextBox>
                            </label>
                        </div>
                        <div class="col-md-3">
                            <label>
                                Cpf:
                                <br>
                                <asp:TextBox ID="txtCpf" runat="server" Class="form-control" MaxLength="14"></asp:TextBox>
                            </label>
                        </div>
                        <div class="col-md-3">
                            <label>
                                Data de nascimento:
                                <br>
                                <asp:TextBox ID="txtDataNascimento" runat="server" Class="form-control" TextMode="Date"></asp:TextBox>
                            </label>
                        </div>
                        <div class="col-md-3">
                            <asp:LinkButton runat="server" ID="SubmitLinkButton"
                                CssClass="btn-buscar btn btn-default"
                                OnClick="btnBuscar_Click">
                                <i class="glyphicon glyphicon-search sat-icon-with-text" style="margin-right: 3px;"></i>
                                Buscar
                            </asp:LinkButton>
                        </div>
                    </div>
                </fieldset>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="uppGridView" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div>
                <p />
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="panel panel-centralizar">
                            <div>
                                <%--<asp:Button ID="btnCadastro" runat="server" Text="+ Cadastrar" Class=" btn btn-cadastro-lista" OnClick="btnCadastro_Click" />--%>
                                <asp:LinkButton runat="server" ID="btnCadastro"
                                    CssClass="btn-cadastro-lista btn btn-default"
                                    OnClick="btnCadastro_Click">
                                <i class="glyphicon glyphicon-plus sat-icon-with-text" style="margin-right: 3px;"></i>
                                Cadastrar
                                </asp:LinkButton>
                                <h3>Lista de clientes</h3>
                            </div>
                        </div>
                        <asp:GridView
                            ID="grpListaDeClientes"
                            runat="server"
                            AutoGenerateColumns="False"
                            CssClass="table table-hover"
                            GridLines="None"
                            AllowPaging="True"
                            DataKeyNames="ClienteId"
                            PageSize="10"
                            OnPageIndexChanging="grpListaDeClientes_PageIndexChanging">
                            <Columns>
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField
                                    DataField="ClienteNome"
                                    HeaderText="Nome"
                                    SortExpression="ClienteNome" />
                                <asp:BoundField
                                    DataField="ClienteTelefone"
                                    HeaderText="Telefone"
                                    SortExpression="ClienteTelefone" />
                                <asp:BoundField
                                    DataField="ClienteCpf"
                                    HeaderText="Cpf"
                                    SortExpression="ClienteCpf" />
                                <asp:BoundField
                                    DataField="ClienteDataNascimento"
                                    HeaderText="Data Nascimento"
                                    SortExpression="ClienteDataNascimento" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkExluir" runat="server" CssClass="btn btn-Lista" OnCommand="Excluir" CommandArgument='<%# Eval("ClienteId")%>' ToolTip="Excluir">
                                <i aria-hidden="true" class="glyphicon glyphicon-trash"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="LinkEditar" runat="server" CssClass="btn btn-Lista" OnCommand="Editar" CommandArgument='<%# Eval("ClienteId")%>' ToolTip="Editar">
                                <i aria-hidden="true" class="glyphicon glyphicon-edit"></i>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle HorizontalAlign="Left" />
                            <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" />
                        </asp:GridView>
                        <div>
                            <asp:Label ID="lblQuantidade" runat="server" CssClass="label label-f" />
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
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
            v = v.replace(/(\d{3})(\d)/, "$1.$2");
            v = v.replace(/(\d{3})(\d)/, "$1.$2");
            v = v.replace(/(\d{3})(\d{1,2})$/, "$1-$2");
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
    <%--<script type="text/javascript">
        /* Máscaras ER */
        function mascara(o, f) {
            v_obj = o
            v_fun = f
            setTimeout("execmascara()", 1)
        }
        function execmascara() {
            v_obj.value = v_fun(v_obj.value)
        }
        function mCpf(v) {
            v = v.replace(/\D/g, "");
            v = v.replace( /(\d{3})(\d)/ , "$1.$2");
            v = v.replace( /(\d{3})(\d)/ , "$1.$2");
            v = v.replace(/(\d{3})(\d{1,2})$/ , "$1-$2");
            return v;
        }
        function id(el) {
            return document.getElementById(el);
        }
        window.onload = function () {
            id("<%=txtCpf.ClientID%>").onkeypress = function () {
                mascara(this, mCpf);
            }
        }
    </script>--%>
</asp:Content>
