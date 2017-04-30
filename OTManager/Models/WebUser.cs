using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using System.Web.ModelBinding;
using OTManager.Models;
using System.Diagnostics;

namespace OTManager.Models
{
    public class WebUser
    {
        [ScaffoldColumn(false), Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int WebUserID { get; set; }

        [Required, StringLength(20)]
        public string LDAPName { get; set; }

        [Required, StringLength(20)]
        public string FirstName { get; set; }

        [Required, StringLength(20)]
        public string LastName { get; set; }

        [Required, StringLength(50), DataType(DataType.EmailAddress, ErrorMessage = "Please enter a valid email address.")]
        public string Email { get; set; }

        [Required, DataType(DataType.PhoneNumber, ErrorMessage = "Please enter a valid phone number")]
        public string Phone { get; set; }

        [Required]
        public int BadgeNumber { get; set; }

    }
}