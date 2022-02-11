using MatxiCorp.App.Helpers;
using MatxiCorp.App.IDataAccess;
using MatxiCorp.App.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace MatxiCorp.App.DataAccess
{
    public class HomeDataAccess : IHomeDataAccess
    {
        public IEnumerable<OrgEmpViewModel> GetListEmpOrg(string keyword)
        {
            var listOrg = new List<OrgEmpViewModel>();

            List<SqlParameter> listParameter = new List<SqlParameter>();
            listParameter.Add(new SqlParameter("@keyword", keyword));
            listParameter.Add(new SqlParameter("@FLAG", "GET_EMPORG_WITH_KEYWORD"));

            listOrg = DBUtils.ExecuteSPList<OrgEmpViewModel>("sp_OrgEmp", listParameter);

            return listOrg;
        }
    }
}
