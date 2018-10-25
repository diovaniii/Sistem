using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace ViagemSeg.Comuns
{
    public class Message
    {
        public static void Cadastro(MasterPage page, string message)
        {
            var str = new StringBuilder();
            str.AppendLine("<div class='alert alert-info alert-dismissible' role='alert'>");
            str.AppendLine("<button class='close' data-dismiss='alert' type='button'>");
            str.AppendLine("<span aria-hidden='true'>&times;</span>");
            str.AppendLine("<span class='sr-only'>close</span>");
            str.AppendLine("</button>");

            str.AppendLine("<div>" + message + "</div>");
            str.AppendLine("</div>");

            SetAlertMessage(page, str.ToString());
        }
        public static void ShowError(MasterPage page, string message)
        {
            var str = new StringBuilder();

            str.AppendLine("<div class='alert alert-danger alert-dismissible' role='alert'>");
            str.AppendLine("<button class='close' data-dismiss='alert' type='button'>");
            str.AppendLine("<span aria-hidden='true'>&times;</span>");
            str.AppendLine("<span class='sr-only'>close</span>");
            str.AppendLine("</button>");
            str.AppendLine("<strong>Erro</strong>");
            str.AppendLine("<div>" + message + "</div>");
            str.AppendLine("</div>");

            SetAlertMessage(page, str.ToString());
        }


        public static void ShowAlert(MasterPage page, string message)
        {
            var str = new StringBuilder();
            str.AppendLine("<div class='alert alert-warning alert-dismissible' role='alert'>");
            str.AppendLine("<button class='close' data-dismiss='alert' type='button'>");
            str.AppendLine("<span aria-hidden='true'>&times;</span>");
            str.AppendLine("<span class='sr-only'>close</span>");
            str.AppendLine("</button>");
            str.AppendLine("<strong>Atenção!</strong>");
            str.AppendLine("<div>" + message + "</div>");
            str.AppendLine("</div>");

            SetAlertMessage(page, str.ToString());
        }

        public static void ShowInfo(MasterPage page, string message)
        {
            var str = new StringBuilder();
            str.AppendLine("<div class='alert alert-info alert-dismissible' role='alert'>");
            str.AppendLine("<button class='close' data-dismiss='alert' type='button'>");
            str.AppendLine("<span aria-hidden='true'>&times;</span>");
            str.AppendLine("<span class='sr-only'>close</span>");
            str.AppendLine("</button>");
            str.AppendLine("<strong>Informação</strong>");
            str.AppendLine("<div>" + message + "</div>");
            str.AppendLine("</div>");

            SetAlertMessage(page, str.ToString());
        }

        public static void ShowSuccess(MasterPage page, string message)
        {
            var str = new StringBuilder();
            str.AppendLine("<div class='navbar-bottom'>");
            str.AppendLine("<div class='alert alert-success alert-dismissible' role='alert'>");
            str.AppendLine("<button class='close' data-dismiss='alert' type='button'>");
            str.AppendLine("<span aria-hidden='true'>&times;</span>");
            str.AppendLine("<span class='sr-only'>close</span>");
            str.AppendLine("</button>");
            str.AppendLine("<strong>Sucesso</strong>");
            str.AppendLine("<div>" + message + "</div>");
            str.AppendLine("</div>");

            SetAlertMessage(page, str.ToString());
        }

        //private static void SetAlertMessage(MasterPage page, string message)
        //{
        //    switch (page.ToString())
        //    {
        //        case "ASP.masterpage_site_master":
        //            var alert = (HtmlGenericControl)page.FindControl("alert");
        //            alert.Controls.Add(new LiteralControl(message));
        //            break;
        //        case "ASP.masterpage_site_login_master":
        //            var footer = (HtmlGenericControl)page.FindControl("footer");
        //            footer.Controls.Add(new LiteralControl(message));
        //            break;
        //    }
        //}
        private static void SetAlertMessage(MasterPage page, string message)
        {
            /*switch (page.ToString())
            {
                case "ASP.masterpage_site_master":
                    var alert = (HtmlGenericControl)page.FindControl("alert");
                    alert.Controls.Add(new LiteralControl(message));
                    break;
                case "ASP.masterpage_site_login_master":
                    var footer = (HtmlGenericControl)page.FindControl("footer");
                    footer.Controls.Add(new LiteralControl(message));
                    break;
            }*/

            var alert = (HtmlGenericControl)page.FindControl("alert");
            alert.Controls.Add(new LiteralControl(message));
        }
    }
}
