//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QService.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class kiosk_computer
    {
        public int computer_code { get; set; }
        public string com_name { get; set; }
        public string com_asset_no { get; set; }
        public string com_mac_addr { get; set; }
        public string com_serial_no { get; set; }
        public string active_flag { get; set; }
        public System.DateTime crtd_dttm { get; set; }
        public string crtd_by { get; set; }
        public Nullable<System.DateTime> last_chg_dttm { get; set; }
        public string last_chg_by { get; set; }
        public string kiosk_group_code { get; set; }
    }
}