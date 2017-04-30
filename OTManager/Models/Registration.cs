using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OTManager.Models
{
    public class Registration
    {
        [ScaffoldColumn(false), Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int RegistrationID { get; set; }

        [Required]
        public uint EventID { get; set;}

        [Required]
        public int UserID { get; set; }

        [Required, DataType(DataType.DateTime)]
        public DateTime TimeStamp { get; set; }

        public virtual Event Event { get; set; }

        public virtual WebUser WebUser { get; set; }

    }
}