using MatxiCorp.App.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MatxiCorp.App.IDataAccess
{
    public interface IEmployeeDataAccess
    {
        IEnumerable<EmployeeModel> GetListEmp(string Flag);
        EmployeeModel GetEmpWithId(int EmpId);
        ResponseResult CRUDEmployee(EmployeeModel model, string Flag);
        IEnumerable<EmployeeModel> GetListDropdownlist();
        IEnumerable<EmployeeModel> CheckDuplicateEmp(EmployeeModel model, string Flag);
    }
}
