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
    public class OrganizationDataAccess : IOrganizationDataAccess
    {
        public IEnumerable<OrganizationModel> GetListOrg(string keyword)
        {
            var listOrg = new List<OrganizationModel>();

            List<SqlParameter> listParameter = new List<SqlParameter>();
            listParameter.Add(new SqlParameter("@keyword", keyword));
            listParameter.Add(new SqlParameter("@FLAG", "GETLIST"));

            listOrg = DBUtils.ExecuteSPList<OrganizationModel>("sp_Organization", listParameter);

            return listOrg;
        }
        public OrganizationModel GetOrgWithId(int OrgId)
        {
            OrganizationModel model = null;
            try
            {
                var parameters = new List<SqlParameter> {
                    new SqlParameter("@OrgID", OrgId),
                    new SqlParameter("@FLAG", "GETWITHID")
                };
                model = DBUtils.ExecuteSP<OrganizationModel>("sp_Organization", parameters);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return model;
        }
        public ResponseResult CRUDOrganization(OrganizationModel model, string Flag)
        {
            ResponseResult result = null;
            try
            {
                List<SqlParameter> listParameter = new List<SqlParameter>();
                listParameter.Add(new SqlParameter("@OrgID", model.OrgID));
                listParameter.Add(new SqlParameter("@OrgCode", model.OrgCode));
                listParameter.Add(new SqlParameter("@OrgName", model.OrgName));
                listParameter.Add(new SqlParameter("@ParentOrgID", model.ParentOrgID));
                listParameter.Add(new SqlParameter("@CreatedBy", model.CreatedBy));
                listParameter.Add(new SqlParameter("@UpdatedBy", model.CreatedBy));
                listParameter.Add(new SqlParameter("@FLAG", Flag));

                result = DBUtils.ExecuteSP<ResponseResult>("sp_Organization", listParameter);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }
        public IEnumerable<OrganizationModel> GetListDropdownlist()
        {
            var listOrg = new List<OrganizationModel>();

            List<SqlParameter> listParameter = new List<SqlParameter>();
            listParameter.Add(new SqlParameter("@FLAG", "DDL_ORG"));

            listOrg = DBUtils.ExecuteSPList<OrganizationModel>("sp_LoadDropdownlist", listParameter);

            return listOrg;
        }

    }
}
