<%@ Page Title="Lista Vendas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaVendaViagem.aspx.cs" Inherits="ViagemWeb.ListaVendaViagem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel ID="uppPainelVenda" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <asp:Panel runat="server">
                <p />
                <fieldset>
                    <legend>Lista de Venda de Viagem</legend>
                    <div class="row">
                        <div class="col-md-3">
                            <label>
                                Viagem:
                        <br>
                                <asp:DropDownList ID="ddlViagem" runat="server" DataTextField="ViagemNome" DataValueField="ViagemId" Class="form-control js-example-basic-single" />
                            </label>
                        </div>
                        <div class="col-md-3">
                            <label>
                                Nome:
                        <br>
                                <asp:DropDownList ID="ddlNome" runat="server" DataTextField="ClienteNome" DataValueField="ClienteId" Class="form-control js-example-basic-single" />
                            </label>
                        </div>
                        <div class="col-md-3">
                            <asp:LinkButton runat="server" ID="btnBuscarVenda"
                                CssClass="btn-buscar btn btn-default"
                                OnClick="btnBuscarVenda_Click">
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

                        <div>
                            <asp:LinkButton runat="server" ID="btnVender"
                                CssClass="btn-cadastro-lista btn btn-default"
                                OnClick="btnVender_Click" Style="margin-bottom: 10px">
                                <i class="glyphicon glyphicon-plus sat-icon-with-text" style="margin-right: 3px;"></i>
                                Vender
                            </asp:LinkButton>

                        </div>

                        <asp:GridView
                            ID="grpListaDeVenda"
                            runat="server"
                            AutoGenerateColumns="False"
                            CssClass="table table-hover"
                            GridLines="None"
                            AllowPaging="True"
                            DataKeyNames="VendaId"
                            PageSize="10"
                            OnRowDataBound="grpListaDeVenda_RowDataBound"
                            OnPageIndexChanging="grpListaDeVenda_PageIndexChanging">
                            <Columns>
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField
                                    DataField="VendaIdCliente"
                                    HeaderText="Nome"
                                    SortExpression="VendaIdCliente" />
                                <asp:BoundField
                                    DataField="FaixaEtaria"
                                    HeaderText="Faixa etaria"
                                    SortExpression="FaixaEtaria" />
                                <asp:BoundField
                                    DataField="Assento"
                                    HeaderText="Assento"
                                    SortExpression="Assento" />
                                <asp:BoundField
                                    DataField="VendaValorPago"
                                    HeaderText="Valor pago"
                                    SortExpression="VendaValorPago" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkExluir" runat="server" CssClass="btn btn-Lista" OnCommand="Excluir" CommandArgument='<%# Eval("VendaId")%>' ToolTip="Excluir">
                                <i aria-hidden="true" class="glyphicon glyphicon-trash"></i>
                                        </asp:LinkButton>
                                        <%--<asp:LinkButton ID="LinkEditar" runat="server" CssClass="btn btn-Lista" OnCommand="Editar" CommandArgument='<%# Eval("VendaId")%>' ToolTip="Editar">
                                <i aria-hidden="true" class="glyphicon glyphicon-edit"></i>
                                        </asp:LinkButton>--%>
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
            <asp:TextBox ID="valorTotal" runat="server" class="form-control" />
            <div class="col-md-3">
                <asp:LinkButton runat="server" ID="GerarPDF"
                    CssClass="btn-buscar btn btn-default"
                    OnClick="GerarPDF_Click">
                                <i class="glyphicon glyphicon-print sat-icon-with-text" style="margin-right: 3px;"></i>
                                Gerar PDF
                </asp:LinkButton>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>


    <script type="text/javascript">


</script>

</asp:Content>
