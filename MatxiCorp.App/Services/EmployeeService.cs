using MatxiCorp.App.DataAccess;
using MatxiCorp.App.IDataAccess;
using MatxiCorp.App.IServices;
using MatxiCorp.App.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MatxiCorp.App.Services
{
    public class EmployeeService : IEmployeeService
    {
        //private
        private IEmployeeDataAccess _employeeDA;
        private IEmployeeDataAccess EmployeeDA
        {
            get { return _employeeDA ?? (_employeeDA = new EmployeeDataAccess()); }
        }
        public IEnumerable<EmployeeModel> GetListEmp(string Flag)
        {
            try
            {
                var listEmp = EmployeeDA.GetListEmp(Flag);
                return listEmp;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public EmployeeModel GetEmpWithId(int EmpId)
        {
            try
            {
                var model = EmployeeDA.GetEmpWithId(EmpId);
                return model;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public ResponseResult CRUDEmployee(EmployeeModel model, string Flag)
        {
            try
            {
                model.CreatedBy = "sontn";
                return EmployeeDA.CRUDEmployee(model, Flag);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public IEnumerable<EmployeeModel> GetListDropdownlist()
        {
            try
            {
                var listEmp = EmployeeDA.GetListDropdownlist();
                return listEmp;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public IEnumerable<EmployeeModel> CheckDuplicateEmp(EmployeeModel model, string Flag)
        {
            try
            {
                var listEmp = EmployeeDA.CheckDuplicateEmp(model, Flag);
                return listEmp;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
