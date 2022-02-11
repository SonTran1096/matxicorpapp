using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MatxiCorp.App.Models.ViewModels
{
    public class OrgEmpViewModel
    {
        public int OrgID { get; set; }
        public string OrgCode { get; set; }
        public string OrgName { get; set; }
        public int LevelID { get; set; }
        public int ParentOrgID { get; set; }
        public int EmpID { get; set; }
        public string EmpCode { get; set; }
        public string EmpName { get; set; }
        public int OrgId { get; set; }
    }
}
