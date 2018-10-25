<%@ Page Title="Lista de Veiculos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaVeiculo.aspx.cs" Inherits="ViagemWeb.ListaVeiculo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server">
        <p />
        <fieldset>
            <legend>Lista de Veiculos</legend>
            <asp:UpdatePanel ID="uppGridViewVeiculo" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div>
                        <p />
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div>
                                    <%--<asp:Button ID="btnCadastro" runat="server" Text="+ Cadastrar" Class=" btn btn-cadastro-lista" OnClick="btnCadastro_Click" />--%>
                                    <asp:LinkButton runat="server" ID="btnCadastroVeiculo"
                                        CssClass="btn-cadastro-lista btn btn-default"
                                        OnClick="btnCadastroVeiculo_Click">
                                <i class="glyphicon glyphicon-plus sat-icon-with-text" style="margin-right: 3px;"></i>
                                Cadastrar
                                    </asp:LinkButton>
                                </div>
                                <asp:GridView
                                    ID="grpListaDeVeiculo"
                                    runat="server"
                                    AutoGenerateColumns="False"
                                    CssClass="table table-hover"
                                    GridLines="None"
                                    AllowPaging="True"
                                    DataKeyNames="VeiculoId"
                                    PageSize="10">
                                    <Columns>
                                        <asp:TemplateField HeaderText="">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField
                                            DataField="VeiculoTipo"
                                            HeaderText="Tipo"
                                            SortExpression="VeiculoTipo" />
                                        <asp:BoundField
                                            DataField="VeiculoLugares"
                                            HeaderText="Lugares"
                                            SortExpression="VeiculoLugares" />
                                        <asp:BoundField
                                            DataField="VeiculoPlaca"
                                            HeaderText="Placa"
                                            SortExpression="VeiculoPlaca" />
                                        <asp:BoundField
                                            DataField="VeiculoIdentificacao"
                                            HeaderText="Indentificação"
                                            SortExpression="VeiculoIdentificacao" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkExluir" runat="server" CssClass="btn btn-Lista" OnCommand="Excluir" CommandArgument='<%# Eval("VeiculoId")%>' ToolTip="Excluir">
                                <i aria-hidden="true" class="glyphicon glyphicon-trash"></i>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="LinkEditar" runat="server" CssClass="btn btn-Lista" OnCommand="Editar" CommandArgument='<%# Eval("VeiculoId")%>' ToolTip="Editar">
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
        </fieldset>
    </asp:Panel>
</asp:Content>
