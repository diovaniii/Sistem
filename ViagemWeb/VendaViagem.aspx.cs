using PdfSharp.Pdf;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ViagemSeg;
using ViagemSeg.Svc;

namespace ViagemWeb
{
    public partial class VendaViagem : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                carregaNome();
                CarregarListaViagem();
                CarregarListaAssento();
            }

        }


        protected void salvarQuantidade_Click(object sender, EventArgs e)
        {
            if (quantidadeAdulto.Value == "")
                quantidadeAdulto.Value = "0";
            if (quantidadeAdolecente.Value == "")
                quantidadeAdolecente.Value = "0";
            if (quantidadeCrianca.Value == "")
                quantidadeCrianca.Value = "0";
            if (quantidadeBebe.Value == "")
                quantidadeBebe.Value = "0";

            var palavras = Convert.ToInt32(quantidadeAdulto.Value) + Convert.ToInt32(quantidadeAdolecente.Value) +
                           Convert.ToInt32(quantidadeCrianca.Value) + Convert.ToInt32(quantidadeBebe.Value);
            lblTeste.Text = palavras.ToString();
            lblTeste.Visible = true;
            uppPanel.Update();

            List<viagem> viagems = SvcVendaCliente.ListarViagem();
            viagem viagem = viagems.Where(a => a.Id == Convert.ToInt32(ddlViagem.SelectedValue)).FirstOrDefault();
            List<vendacliente> listaVendaClientes = new List<vendacliente>();
            cliente cliente = new cliente();
            
            for (int i = 0; i < Convert.ToInt32(quantidadeAdulto.Value); i++)
            {
                vendacliente vendaCliente = new vendacliente();
                cliente.Nome = ddlCliente.SelectedItem.Text;
                vendaCliente.viagem = viagem;
                vendaCliente.cliente = cliente;
                vendaCliente.FaixaEtaria = "Adulto";
                listaVendaClientes.Add(vendaCliente);
            }
            for (int i = 0; i < Convert.ToInt32(quantidadeAdolecente.Value); i++)
            {
                vendacliente vendaCliente = new vendacliente();
                cliente.Nome = ddlCliente.SelectedItem.Text;
                vendaCliente.cliente = cliente;
                vendaCliente.FaixaEtaria = "Adolecente";
                listaVendaClientes.Add(vendaCliente);
            }
            for (int i = 0; i < Convert.ToInt32(quantidadeCrianca.Value); i++)
            {
                vendacliente vendaCliente = new vendacliente();
                cliente.Nome = ddlCliente.SelectedItem.Text;
                vendaCliente.cliente = cliente;
                vendaCliente.FaixaEtaria = "Crianca";
                listaVendaClientes.Add(vendaCliente);
            }
            for (int i = 0; i < Convert.ToInt32(quantidadeBebe.Value); i++)
            {
                vendacliente vendaCliente = new vendacliente();
                cliente.Nome = ddlCliente.SelectedItem.Text;
                vendaCliente.cliente = cliente;
                vendaCliente.FaixaEtaria = "Bebe";
                listaVendaClientes.Add(vendaCliente);
            }

            
            grpVendaCliente.DataSource = listaVendaClientes;
            grpVendaCliente.DataBind();
            CarregarListaAssento();
            uppGridView.Update();

            quantidadeAdulto.Value = "0";
            quantidadeAdolecente.Value = "0";
            quantidadeCrianca.Value = "0";
            quantidadeBebe.Value = "0";
        }

        protected void carregaNome()
        {
            ddlCliente.DataSource = SvcCliente.ListarTodosClientes();
            ddlCliente.DataBind();
            UpdatePanel.Update();
        }

        private void CarregarListaViagem()
        {
            ddlViagem.DataSource = SvcViagem.ListarTodasViagens();
            ddlViagem.DataBind();
            UpdatePanel.Update();
        }

        private void CarregarListaAssento()
        {
            List<viagem> viagems = SvcVendaCliente.ListarViagem();
            viagem viagem = viagems.Where(a => a.Id == Convert.ToInt32(ddlViagem.SelectedValue)).FirstOrDefault();

            List<vendacliente> vendaClientes = new List<vendacliente>();
            vendaClientes = SvcVendaCliente.PesquisaViagem(viagem.Id);
            int[] assento = new int[0];
            foreach (var item in vendaClientes)
            {
                int lugar = item.Assento;
                assento = assento.Concat(new int[] { lugar }).ToArray();
            }
            ListaAssento.Value = string.Join(", ", assento);
            veiculo QuantAssento = new veiculo();
            QuantAssento = SvcVeiculo.BuscarVeiculo(Convert.ToInt32( viagem.Veiculo));
            int t = QuantAssento.Lugares.Value;
            int f = 4;
            var valor = 0;
            var total = 0;
            int[] limpa = new int[0];
            if (t % 4 == 0)
            {
                valor = t / f;
            }else if((t + 1) % 4 == 0)
            {
                valor = (t + 1)/ f;
                total = (t + 1);
            }
            else if ((t + 2) % 4 == 0)
            {
                valor = (t + 2) / f;
                total = (t + 2);
            }
            else if ((t + 3) % 4 == 0)
            {
                valor = (t + 3) / f;
                total = (t + 3);
            }

            for (int i = t + 1; i <= total; i++)
            {
                limpa = limpa.Concat(new int[] { i }).ToArray();
            }
            Diferenca.Value = string.Join(", ", limpa);
            QuantidadeAssento.Value = valor.ToString();
        }

        protected void grpVendaCliente_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddlgrid = (e.Row.FindControl("ddlCliente1") as DropDownList);
                ddlgrid.DataSource = SvcCliente.ListarTodosClientes();
                ddlgrid.DataTextField = "ClienteNome";
                ddlgrid.DataValueField = "ClienteId";
                ddlgrid.DataBind();
            }
        }

        protected void btnAdicionarCliente_Click(object sender, EventArgs e)
        {
            Response.Redirect("CadastroCliente.aspx");
        }

        protected void salvarVenda_Click(object sender, EventArgs e)
        {
            List<vendacliente> listaVendaCliente = new List<vendacliente>();
            foreach (GridViewRow item in grpVendaCliente.Rows)
            {

                vendacliente vendaCliente = new vendacliente();
                //SALVA ID DO CLIENTE
                TextBox nome = (TextBox)item.FindControl("txtNome");
                if (nome.Text == "")
                {
                    DropDownList idCliente = (DropDownList)item.FindControl("ddlCliente1");
                    string selectvalueCliente = idCliente.SelectedValue;
                    vendaCliente.VendaIdCliente = Convert.ToInt32(selectvalueCliente);
                }
                else
                {
                    cliente cliente = new cliente();
                    cliente.Nome = nome.Text;
                    TextBox cpf = (TextBox)item.FindControl("txtCpf");
                    cliente.Cpf = cpf.Text;
                    TextBox data = (TextBox)item.FindControl("txtDataNascimento");
                    cliente.DataNascimento = Convert.ToDateTime(data.Text);
                    endereco enderecoPessoal = new endereco();
                    endereco enderecoComercial = new endereco();
                    cliente.Status = 0;
                    cliente.Email = "semEmail@semEmail.com";
                    cliente.Telefone = "00000000000";
                    cliente = SvcCliente.AlteraSalva(cliente, enderecoPessoal, enderecoComercial);
                    vendaCliente.VendaIdCliente = cliente.Id;
                    
                }
                

                vendaCliente.VendaIdViagem = Convert.ToInt32(ddlViagem.SelectedValue);


                string faixaEtaria = item.Cells[2].Text;
                vendaCliente.FaixaEtaria = faixaEtaria.ToString();

                string valor = item.Cells[3].Text;
                vendaCliente.VendaValorViagem = Convert.ToDecimal(valor);

                TextBox desconto = (TextBox)item.FindControl("ValorDesconto");
                string valorDesconto = desconto.Text;
                if(valorDesconto != "")
                vendaCliente.VendaDesconto = Convert.ToDecimal(valorDesconto);

                TextBox pago = (TextBox)item.FindControl("ValorPago");
                if (pago.Text != "")
                {
                    vendaCliente.VendaValorPago = Convert.ToDecimal(pago.Text);
                }
                else
                {
                    return;
                }

                TextBox poltrona = (TextBox)item.FindControl("poltrona");
                if(poltrona.Text != "")
                {
                    vendaCliente.Assento = Convert.ToInt32(poltrona.Text);
                }
                else
                {
                    return;
                }
                vendaCliente.Status = 0;
                listaVendaCliente.Add(vendaCliente);
 
            }
            foreach (var item in listaVendaCliente)
            {
                SvcVendaCliente.AlteraSalva(item);
            }
            voucherPDF(listaVendaCliente);
            Response.Redirect("ListaVendaViagem.aspx");
        }

        protected void ddlViagem_SelectedIndexChanged(object sender, EventArgs e)
        {
            CarregarListaAssento();
        }

        protected void voucherPDF(List<vendacliente> pVendaCliente)
        {
            

            var document = new PdfDocument();
            var page = document.AddPage();
            var graphics = PdfSharp.Drawing.XGraphics.FromPdfPage(page);
            var textFormatter = new PdfSharp.Drawing.Layout.XTextFormatter(graphics);
            var font = new PdfSharp.Drawing.XFont("Calibri", 12);
            var fontColuna = new PdfSharp.Drawing.XFont("Calibri", 14);


            int y = 55;
            textFormatter.Alignment = PdfSharp.Drawing.Layout.XParagraphAlignment.Left;
            textFormatter.DrawString("Voucher ", font, PdfSharp.Drawing.XBrushes.Black, new PdfSharp.Drawing.XRect(30, y, page.Width - 60, page.Height - 60));
            textFormatter.DrawString("Destino: " + ddlViagem.SelectedItem.ToString(), font, PdfSharp.Drawing.XBrushes.Black, new PdfSharp.Drawing.XRect(200, y, page.Width - 60, page.Height - 60));

            y = y + 40;
            textFormatter.DrawString("Cliente", fontColuna, PdfSharp.Drawing.XBrushes.Black, new PdfSharp.Drawing.XRect(30, y, page.Width - 60, page.Height - 60));
            textFormatter.DrawString("Faixa Etaria", fontColuna, PdfSharp.Drawing.XBrushes.Black, new PdfSharp.Drawing.XRect(200, y, page.Width - 60, page.Height - 60));
            textFormatter.DrawString("Assento", fontColuna, PdfSharp.Drawing.XBrushes.Black, new PdfSharp.Drawing.XRect(300, y, page.Width - 60, page.Height - 60));
            textFormatter.DrawString("Valor Pago", fontColuna, PdfSharp.Drawing.XBrushes.Black, new PdfSharp.Drawing.XRect(370, y, page.Width - 60, page.Height - 60));
            y = y + 5;
            decimal ValorTotal = 0;
            foreach (var item in pVendaCliente)
            {
                ValorTotal += item.VendaValorPago;
                y = y + 30;
                textFormatter.DrawString(SvcCliente.BuscarCliente(item.VendaIdCliente).Nome, font, PdfSharp.Drawing.XBrushes.Black, new PdfSharp.Drawing.XRect(30, y, page.Width - 60, page.Height - 60));
                textFormatter.DrawString(item.FaixaEtaria, font, PdfSharp.Drawing.XBrushes.Black, new PdfSharp.Drawing.XRect(200, y, page.Width - 60, page.Height - 60));
                textFormatter.DrawString(item.Assento.ToString(), font, PdfSharp.Drawing.XBrushes.Black, new PdfSharp.Drawing.XRect(300, y, page.Width - 60, page.Height - 60));
                textFormatter.DrawString(item.VendaValorPago.ToString(), font, PdfSharp.Drawing.XBrushes.Black, new PdfSharp.Drawing.XRect(370, y, page.Width - 60, page.Height - 60));
            }
            textFormatter.DrawString("Valor Total: " + ValorTotal.ToString(), font, PdfSharp.Drawing.XBrushes.Black, new PdfSharp.Drawing.XRect(100, 50 + y, page.Width - 60, page.Height - 60));
            textFormatter.DrawString("Autorizado por: ____________________________________ ", font, PdfSharp.Drawing.XBrushes.Black, new PdfSharp.Drawing.XRect(100, 100 + y, page.Width - 60, page.Height - 60));

            PdfSharp.Drawing.XRect layoutRectangle = new PdfSharp.Drawing.XRect(0/*X*/, page.Height - font.Height/*Y*/, page.Width/*Width*/, font.Height/*Height*/);
            PdfSharp.Drawing.XBrush brush = PdfSharp.Drawing.XBrushes.Black;
            string noPages = document.Pages.Count.ToString();
            for (int i = 0; i < document.Pages.Count; ++i)
            {
                graphics.DrawString(
               "Page " + (i + 1).ToString() + " of " + noPages,
            font,
            brush,
            layoutRectangle,
            PdfSharp.Drawing.XStringFormats.Center);

                graphics.DrawString(
               "Data: " + DateTime.Now,
            font,
            brush,
            layoutRectangle,
            PdfSharp.Drawing.XStringFormats.TopLeft);
            }

            document.Save("Vendas.pdf");
            System.Diagnostics.Process.Start("chrome.exe", "Vendas.pdf");
        }
    }
}