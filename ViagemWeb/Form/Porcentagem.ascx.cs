using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Text;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ViagemWeb.Form
{
    public partial class Porcentagem : System.Web.UI.UserControl
    {

        private string val1 = "90deg";

        public string Val1
        {
            get { return val1; }
            set { val1 = value; }
        }

        private string val2 = "90deg";

        public string Val2
        {
            get { return val2; }
            set { val2 = value; }
        }

        private string colorCode = "#ffffff";

        public string ColorCode
        {
            get { return colorCode; }
            set { colorCode = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //ProgressText.InnerText = "0%";
            //CalculateActiveUsersAngle(75);
        }

        public void CalculateActiveUsersAngle(int TotalUser)
        {
            //int TotalUser = 50;  

            if (TotalUser == 0)
            {
                Val2 = "90deg";
                Val1 = "90deg";
                ColorCode = "#ffffff";
            }
            else if (TotalUser < 50 && TotalUser > 0)
            {
                double percentageOfWholeAngle = 360 * (Convert.ToDouble(TotalUser) / 100);
                Val2 = (90 + percentageOfWholeAngle).ToString() + "deg";
                Val1 = "90deg";
                ColorCode = "#ffffff";
            }
            else if (TotalUser > 50 && TotalUser < 100)
            {
                double percentage = 360 * (Convert.ToDouble(TotalUser) / 100);
                Val1 = (percentage - 270).ToString() + "deg";
                Val2 = "270deg";
                ColorCode = "#AC2D36";
            }
            else if (TotalUser == 50)
            {
                Val1 = "-90deg";
                Val2 = "270deg";
                ColorCode = "#AC2D36";
            }
            else if (TotalUser >= 100)
            {
                Val1 = "90deg";
                Val2 = "270deg";
                ColorCode = "#AC2D36";
            }

            ProgressText.InnerText = TotalUser + "%";

        }
    }
}