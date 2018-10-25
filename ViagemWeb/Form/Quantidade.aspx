<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Quantidade.aspx.cs" Inherits="ViagemWeb.Form.Quantidade" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <label>
                Maior de 18 anos - Adultos:
                        <br>
                <asp:Button runat="server" ID="diminueAdulto" Text="-" OnClick="diminueAdulto_Click" Class="btn" />
                <asp:TextBox runat="server" ID="txtAdulto" Class=""></asp:TextBox>
                <asp:Button runat="server" ID="aumentaAdulto" Text="+" OnClick="aumentaAdulto_Click" Class="btn" />
            </label>

            <label>
                12 a 18 anos - Jovens:
                        <br>
                <asp:Button runat="server" ID="diminueJovem" Text="-" OnClick="diminueJovem_Click" Class="btn" />
                <asp:TextBox runat="server" ID="txtJovem" Class=""></asp:TextBox>
                <asp:Button runat="server" ID="aumentaJovem" Text="+" OnClick="aumentaJovem_Click" Class="btn" />
            </label>
            <label>
                2 a 12 anos - Crianças:
                        <br>
                <asp:Button runat="server" ID="diminueCrianca" Text="-" OnClick="diminueCrianca_Click" Class="btn" />
                <asp:TextBox runat="server" ID="txtCrianca" Class=""></asp:TextBox>
                <asp:Button runat="server" ID="aumentaCrianca" Text="+" OnClick="aumentaCrianca_Click" Class="btn" />
            </label>
            <label>
                ate 2 anos - Bebês:
                        <br>
                <asp:Button runat="server" ID="diminueBebe" Text="-" OnClick="diminueBebe_Click" Class="btn" />
                <asp:TextBox runat="server" ID="txtBebe" Class=""></asp:TextBox>
                <asp:Button runat="server" ID="aumentaBebe" Text="+" OnClick="aumentaBebe_Click" Class="btn" />
            </label>
        </div>
    </form>
</body>
</html>
