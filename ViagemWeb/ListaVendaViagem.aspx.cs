using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ViagemSeg;
using ViagemSeg.Comuns;
using ViagemSeg.Svc;
using ViagemSeg.Dto;
using PdfSharp.Drawing;
using PdfSharp.Pdf;
using PdfSharp.Pdf.IO;

namespace ViagemWeb
{
    public partial class ListaVendaViagem : System.Web.UI.Page
    {
        



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var vendaEncontrada = SvcVendaCliente.ListarVendaCliente();
                decimal ValorTotal = 0;
                foreach (var item in vendaEncontrada)
                {
                    ValorTotal += item.VendaValorPago;
                }
                valorTotal.Text = ValorTotal.ToString();
                carregaNome();
                carregaViagem();
                CarregaListaViagem();
                lblNUmeroRegistro(SvcVendaCliente.ListarVendaCliente());
            }
        }

        protected void carregaNome()
        {
            ddlNome.DataSource = SvcCliente.ListarTodosClientes();
            ddlNome.DataBind();
            ddlNome.Items.Insert(0, new ListItem("--Select--", "0"));
            uppPainelVenda.Update();
        }

        protected void carregaViagem()
        {
            ddlViagem.DataSource = SvcViagem.ListarTodasViagens();
            ddlViagem.DataBind();
            ddlViagem.Items.Insert(0, new ListItem("--Select--", "0"));
            uppPainelVenda.Update();
        }

        private void CarregaListaViagem()
        {
            grpListaDeVenda.DataSource = SvcVendaCliente.ListarVendaCliente();
            grpListaDeVenda.DataBind();
            uppGridView.Update();
        }

        protected void lblNUmeroRegistro(List<DtoVendaCliente> viagem)
        {
            int rowCount = viagem.Count;
            lblQuantidade.Text = "Numero de registros: " + rowCount.ToString();
        }

        protected void CarregarValorTotal()
        {
            vendacliente vendaCliente = new vendacliente();
            vendaCliente.VendaIdCliente = Convert.ToInt32(ddlNome.SelectedValue);
            vendaCliente.VendaIdViagem = Convert.ToInt32(ddlViagem.SelectedValue);

            var vendaEncontrada = SvcVendaCliente.Pesquisa(vendaCliente);
            decimal ValorTotal = 0;
            foreach (var item in vendaEncontrada)
            {
                ValorTotal += item.VendaValorPago;
            }
            valorTotal.Text = ValorTotal.ToString();
        }

        protected void btnBuscarVenda_Click(object sender, EventArgs e)
        {
            vendacliente vendaCliente = new vendacliente();
            vendaCliente.VendaIdCliente = Convert.ToInt32(ddlNome.SelectedValue);
            vendaCliente.VendaIdViagem = Convert.ToInt32(ddlViagem.SelectedValue);

            var vendaEncontrada = SvcVendaCliente.Pesquisa(vendaCliente);
            lblNUmeroRegistro(vendaEncontrada);

            grpListaDeVenda.DataSource = vendaEncontrada;
            grpListaDeVenda.DataBind();
            CarregarValorTotal();
            uppGridView.Update();
        }

        protected void btnVender_Click(object sender, EventArgs e)
        {
            Response.Redirect("VendaViagem.aspx");
        }

        protected void CarregaListaTransicao()
        {
            vendacliente vendaCliente = new vendacliente();
            vendaCliente.VendaIdCliente = Convert.ToInt32(ddlNome.SelectedValue);
            vendaCliente.VendaIdViagem = Convert.ToInt32(ddlViagem.SelectedValue);

            grpListaDeVenda.DataSource = SvcVendaCliente.Pesquisa(vendaCliente);
            grpListaDeVenda.DataBind();
            CarregarValorTotal();
            uppGridView.Update();
        }

        protected void grpListaDeVenda_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            CarregaListaTransicao();
            grpListaDeVenda.PageIndex = e.NewPageIndex;
            grpListaDeVenda.DataBind();
        }

        protected void Excluir(object sender, CommandEventArgs e)
        {
            var valor = Convert.ToInt32(e.CommandArgument);
            SvcVendaCliente.Excluir(valor);
            CarregarValorTotal();
            CarregaListaTransicao();
        }


        protected void grpListaDeVenda_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int VendaIdCliente = Convert.ToInt32(e.Row.Cells[1].Text);
                cliente cliente = new cliente();
                cliente = SvcCliente.BuscarCliente(VendaIdCliente);
                e.Row.Cells[1].Text = cliente.Nome;
            }
        }

        protected void GerarPDF_Click(object sender, EventArgs e)
        {
            vendacliente vendaCliente = new vendacliente();
            vendaCliente.VendaIdCliente = Convert.ToInt32(ddlNome.SelectedValue);
            vendaCliente.VendaIdViagem = Convert.ToInt32(ddlViagem.SelectedValue);

            var vendaEncontrada = SvcVendaCliente.Pesquisa(vendaCliente);

            var document = new PdfDocument();
            var page = document.AddPage();
            var graphics = XGraphics.FromPdfPage(page);
            var textFormatter = new PdfSharp.Drawing.Layout.XTextFormatter(graphics);
            var font = new XFont("Calibri", 12);
            var fontColuna = new XFont("Calibri", 14);

            int y = 55;
            textFormatter.Alignment = PdfSharp.Drawing.Layout.XParagraphAlignment.Left;
            textFormatter.DrawString("Destino: " + ddlViagem.SelectedItem.ToString(), font, XBrushes.Black, new XRect(30, y, page.Width - 60, page.Height - 60));
            textFormatter.DrawString("Cliente: " + ddlNome.SelectedItem.ToString(), font, XBrushes.Black, new XRect(200, y, page.Width - 60, page.Height - 60));
            y = y + 40;
            textFormatter.DrawString("Cliente", fontColuna, XBrushes.Black, new XRect(30, y, page.Width - 60, page.Height - 60));
            textFormatter.DrawString("Faixa Etaria", fontColuna, XBrushes.Black, new XRect(200, y, page.Width - 60, page.Height - 60));
            textFormatter.DrawString("Assento", fontColuna, XBrushes.Black, new XRect(300, y, page.Width - 60, page.Height - 60));
            textFormatter.DrawString("Valor Pago", fontColuna, XBrushes.Black, new XRect(370, y, page.Width - 60, page.Height - 60));
            y = y + 5;
            decimal ValorTotal = 0;
            XRect layoutRectangle = new XRect(0/*X*/, page.Height - font.Height/*Y*/, page.Width/*Width*/, font.Height/*Height*/);
            XBrush brush = XBrushes.Black;
            string noPages;
            int i = 0;
            foreach (var item in vendaEncontrada)
            {
                if (y >= 760)
                {
                    page = document.AddPage();
                    graphics = XGraphics.FromPdfPage(page);
                    textFormatter = new PdfSharp.Drawing.Layout.XTextFormatter(graphics);
                    y = 45;
                }
                ValorTotal += item.VendaValorPago;
                y = y + 30;
                textFormatter.DrawString(SvcCliente.BuscarCliente(item.VendaIdCliente).Nome, font, XBrushes.Black, new XRect(30, y, page.Width - 60, page.Height - 60));
                textFormatter.DrawString(item.FaixaEtaria, font, XBrushes.Black, new XRect(200, y, page.Width - 60, page.Height - 60));
                textFormatter.DrawString(item.Assento.ToString(), font, XBrushes.Black, new XRect(300, y, page.Width - 60, page.Height - 60));
                textFormatter.DrawString(item.VendaValorPago.ToString(), font, XBrushes.Black, new XRect(370, y, page.Width - 60, page.Height - 60));
            }
            textFormatter.DrawString("Valor Total: " + ValorTotal.ToString(), font, XBrushes.Black, new XRect(100, 50 + y, page.Width - 60, page.Height - 60));
            document.Save("Vendas.pdf");

            PdfDocument pdfDocument = PdfReader.Open("Vendas.pdf", PdfDocumentOpenMode.Modify);
            noPages = pdfDocument.Pages.Count.ToString();
            for (i = 0; i < pdfDocument.Pages.Count; ++i)
            {
                PdfPage page1 = pdfDocument.Pages[i];
                using (XGraphics gfx = XGraphics.FromPdfPage(page1))
                {
                    gfx.DrawString(
                        "Page " + (i + 1).ToString() + " of " + noPages,
                        font,
                        brush,
                        layoutRectangle,
                        XStringFormats.Center);

                    gfx.DrawString(
                        "Data: " + DateTime.Now,
                        font,
                        brush,
                        layoutRectangle,
                        XStringFormats.TopLeft);
                }
            }
            pdfDocument.Save("Vendas.pdf");
            System.Diagnostics.Process.Start("chrome.exe", "Vendas.pdf");
        }
    }
}