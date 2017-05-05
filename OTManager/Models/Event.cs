using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OTManager.Models
{
    public class Event
    {
        [ScaffoldColumn(false), Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int EventID { get; set; }

        [Required, StringLength(150), Display(Name = "Event Name")]
        public string EventName { get; set; }

        // I need to validate these for future dates/start date after end date
        // Google says try a CompareValidator in the markup?

        [Required, DataType(DataType.DateTime), Display(Name = "Start Date/Time")]
        public DateTime StartTime { get; set; }

        [Required, DataType(DataType.DateTime), Display(Name = "End Date/Time")]
        public DateTime EndTime { get; set; }

        [Required, Display(Name = "Maximum Staffing")]
        public int MaxStaff { get; set; }

        [Required, Display(Name = "Minimum Staffing")]
        public int MinStaff { get; set; }

        [Display(Name = "Supervisor Staffing")]
        public int? SuperStaff { get; set; }

        [Required, Display(Name = "Confirmed Staff")]
        public int? ConfirmedStaff { get; set; }

        [Required, Display(Name = "Fund Center")]
        public string FundCenter { get; set; }

        [Required, Display(Name = "LocationCode")]
        public string LocationCode { get; set; }

        // Active, InActive
        [Required, Display(Name = "Status")]
        public string Status { get; set; }

        // Add Contact Information for Event point-of-contact


    }
}