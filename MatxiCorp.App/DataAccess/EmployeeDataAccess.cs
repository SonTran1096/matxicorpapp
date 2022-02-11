using MatxiCorp.App.Helpers;
using MatxiCorp.App.IDataAccess;
using MatxiCorp.App.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace MatxiCorp.App.DataAccess
{
    public class EmployeeDataAccess : IEmployeeDataAccess
    {
        public IEnumerable<EmployeeModel> GetListEmp(string Flag)
        {
            var listOrg = new List<EmployeeModel>();

            List<SqlParameter> listParameter = new List<SqlParameter>();
            listParameter.Add(new SqlParameter("@FLAG", Flag));

            listOrg = DBUtils.ExecuteSPList<EmployeeModel>("sp_Employee", listParameter);

            return listOrg;
        }
        public EmployeeModel GetEmpWithId(int EmpId)
        {
            EmployeeModel model = null;
            try
            {
                var parameters = new List<SqlParameter> {
                    new SqlParameter("@EmpID", EmpId),
                    new SqlParameter("@FLAG", "GETWITHID")
                };
                model = DBUtils.ExecuteSP<EmployeeModel>("sp_Employee", parameters);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return model;
        }
        public ResponseResult CRUDEmployee(EmployeeModel model, string Flag)
        {
            ResponseResult result = null;
            try
            {
                List<SqlParameter> listParameter = new List<SqlParameter>();
                listParameter.Add(new SqlParameter("@EmpID", model.EmpID));
                listParameter.Add(new SqlParameter("@EmpCode", model.EmpCode));
                listParameter.Add(new SqlParameter("@EmpName", model.EmpName));
                listParameter.Add(new SqlParameter("@OrgId", model.OrgId));
                listParameter.Add(new SqlParameter("@CreatedBy", model.CreatedBy));
                listParameter.Add(new SqlParameter("@UpdatedBy", model.CreatedBy));
                listParameter.Add(new SqlParameter("@FLAG", Flag));

                result = DBUtils.ExecuteSP<ResponseResult>("sp_Employee", listParameter);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }
        public IEnumerable<EmployeeModel> GetListDropdownlist()
        {
            var listOrg = new List<EmployeeModel>();

            List<SqlParameter> listParameter = new List<SqlParameter>();
            listParameter.Add(new SqlParameter("@FLAG", "DDL_EMP"));

            listOrg = DBUtils.ExecuteSPList<EmployeeModel>("sp_LoadDropdownlist", listParameter);

            return listOrg;
        }
        public IEnumerable<EmployeeModel> CheckDuplicateEmp(EmployeeModel model, string Flag)
        {
            var listOrg = new List<EmployeeModel>();

            List<SqlParameter> listParameter = new List<SqlParameter>();
            listParameter.Add(new SqlParameter("@EmpID", model.EmpID));
            listParameter.Add(new SqlParameter("@EmpCode", model.EmpCode));
            listParameter.Add(new SqlParameter("@FLAG", Flag));

            listOrg = DBUtils.ExecuteSPList<EmployeeModel>("sp_Employee", listParameter);

            return listOrg;
        }
    }
    
}
