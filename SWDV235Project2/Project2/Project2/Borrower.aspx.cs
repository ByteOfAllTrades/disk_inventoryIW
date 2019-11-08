using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Project2
{
    public partial class Borrower : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

        protected void borrowerSubmit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {

                borrowerFirstName.Text = "";
                borrowerLastName.Text = "";
                borrowerEmail.Text = "";
                confirm.Text = "Borrower Submission Recieved!";
            }
        }

        protected void borrowerEmail_TextChanged(object sender, EventArgs e)
        {

        }
    }
}