using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MatxiCorp.App.Models
{
    public class EmployeeModel
    {
        public int EmpID { get; set; }
        public string EmpCode { get; set; }
        public string EmpName { get; set; }
        public int OrgId { get; set; }
        public int Status { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
    }
}
