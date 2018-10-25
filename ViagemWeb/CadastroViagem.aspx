<%@ Page Title="Cadastro de Viagem" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CadastroViagem.aspx.cs" Inherits="ViagemWeb.CadastroViagem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel runat="server">
                <p />
                <fieldset>
                    <legend>Cadastro de Viagem</legend>
                    <div class="row">
                        <div class="col-md-3">
                            <label>
                                Viagem:
                        <br>
                                <asp:TextBox ID="txtViagem" runat="server" Class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server"
                                    ValidationGroup="validador"
                                    ForeColor="Red"
                                    ControlToValidate="txtViagem"
                                    ErrorMessage="Campo obrigatório" />
                            </label>
                        </div>
                        <div class="col-md-3">
                            <label>
                                Local:
                        <br>
                                <asp:TextBox ID="txtLocal" runat="server" Class="form-control" MaxLength="15"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server"
                                    ValidationGroup="validador"
                                    ForeColor="Red"
                                    ControlToValidate="txtLocal"
                                    ErrorMessage="Campo obrigatório" />
                            </label>
                        </div>

                        <div class="col-md-3">
                            <label>
                                Estado:
                        <br>
                                <select id="txtEstado" runat="server" class="form-control" font-bold="false">
                                    <option value=""></option>
                                    <option value="IN">INTERNACIONAL</option>
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
                                <asp:RequiredFieldValidator runat="server"
                                    ValidationGroup="validador"
                                    ForeColor="Red"
                                    ControlToValidate="txtEstado"
                                    ErrorMessage="Campo obrigatório" />
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
                    <div class="row">
                        <div class="col-md-3">
                            <label>
                                Data Inicio:
                                <br>
                                <asp:TextBox ID="txtDataInicio" runat="server" Class="form-control" TextMode="Date"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server"
                                    ValidationGroup="validador"
                                    ForeColor="Red"
                                    ControlToValidate="txtDataInicio"
                                    ErrorMessage="Campo obrigatório" />
                            </label>
                        </div>

                        <div class="col-md-3">
                            <label>
                                Data Fim:
                                <br>
                                <asp:TextBox ID="txtDataFim" runat="server" Class="form-control" TextMode="Date"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server"
                                    ValidationGroup="validador"
                                    ForeColor="Red"
                                    ControlToValidate="txtDataFim"
                                    ErrorMessage="Campo obrigatório" />
                            </label>
                        </div>

                        <div class="col-md-3">
                            <label>
                                Descrição:
                        <br>
                                <asp:TextBox ID="txtDescricao" runat="server" Class="form-control descricao " Rows="8" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server"
                                    ValidationGroup="validador"
                                    ForeColor="Red"
                                    ControlToValidate="txtDescricao"
                                    ErrorMessage="Campo obrigatório" />
                            </label>
                        </div>
                        <div class="col-md-3">
                            <label>
                                Veiculo:
                        <br>
                                <asp:DropDownList ID="ddlVeiculo" runat="server" DataTextField="VeiculoIdentificacao" DataValueField="VeiculoId" Class="form-control js-example-basic-single" />
                            </label>
                        </div>
                    </div>

                </fieldset>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Button runat="server" Text="Salvar" Class=" btn btn-cadastro" Font-Bold="true" OnClick="btnSalvar_Click" ValidationGroup="validador" />
    <asp:Button ID="limpar" runat="server" Text="Limpar" Class=" btn btn-cadastro" Font-Bold="true" OnClick="btnLimpar_Click" />
</asp:Content>
