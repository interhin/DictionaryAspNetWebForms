using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestDictionary.Classes;
using TestDictionary.Models;
using ContactsEntity = TestDictionary.Models.Contacts;

namespace TestDictionary.Pages.Contacts
{
    public partial class Default : System.Web.UI.Page
    {
        TestDatabaseEntities db;
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new TestDatabaseEntities();
            if (!IsPostBack)
            {
                PopulateData();
            }
        }

        void PopulateData()
        {
            ContactsGridView.DataSource = db.Contacts.ToList();
            ContactsGridView.DataBind();
        }

        protected void ContactsGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ContactsGridView.EditIndex = e.NewEditIndex;
            PopulateData();
        }

        protected void ContactsGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            ContactsGridView.EditIndex = -1;
            PopulateData();
        }

        protected void ContactsGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var contact = GetContactByRowIndex(e.RowIndex);
            if (contact != null)
            {
                db.Contacts.Remove(contact);
                db.SaveChanges();
                PopulateData();
            }
        }

        protected void ContactsGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var contact = GetContactByRowIndex(e.RowIndex);
            if (contact != null)
            {
                contact.Email = e.NewValues["Email"].ToString();
                contact.Phone = e.NewValues["Phone"].ToString();
                contact.Fio = e.NewValues["Fio"].ToString();
                db.SaveChanges();
                ContactsGridView.EditIndex = -1;
                PopulateData();
            }
        }

        ContactsEntity GetContactByRowIndex(int rowIndex)
        {
            var contactId = Convert.ToInt32(ContactsGridView.DataKeys[rowIndex]["Id"]);
            var contact = db.Contacts.FirstOrDefault(x => x.Id == contactId);
            return contact;
        }

        protected void addBut_Click(object sender, EventArgs e)
        {
            var fio = fioTextBox.Text;
            var phone = phoneTextBox.Text;
            var email = emailTextBox.Text;

            ContactsEntity contact = new ContactsEntity();
            contact.Fio = fio;
            contact.Email = email;
            contact.Phone = phone;
            db.Contacts.Add(contact);
            db.SaveChanges();
            PopulateData();
            
        }
    }
}