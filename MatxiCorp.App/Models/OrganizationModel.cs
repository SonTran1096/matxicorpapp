using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MatxiCorp.App.Models
{
    public class OrganizationModel
    {
        public int OrgID { get; set; }
        public string OrgCode { get; set; }
        public string OrgName { get; set; }
        public int LevelID { get; set; }
        public int ParentOrgID { get; set; }
        public int Status { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
    }
}
