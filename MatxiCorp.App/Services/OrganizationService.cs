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
    public class OrganizationService : IOrganizationService
    {
        //private
        private IOrganizationDataAccess _organizationDA;
        private IOrganizationDataAccess OrganizationDA
        {
            get { return _organizationDA ?? (_organizationDA = new OrganizationDataAccess()); }
        }
        public IEnumerable<OrganizationModel> GetListOrg(string keyword)
        {
            try
            {
                var listOrg = OrganizationDA.GetListOrg(keyword);
                return listOrg;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public OrganizationModel GetOrgWithId(int OrgId)
        {
            try
            {
                var model = OrganizationDA.GetOrgWithId(OrgId);
                return model;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public ResponseResult CRUDOrganization(OrganizationModel model, string Flag)
        {
            try
            {
                model.CreatedBy = "sontn";
                return OrganizationDA.CRUDOrganization(model, Flag);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public IEnumerable<OrganizationModel> GetListDropdownlist()
        {
            try
            {
                var listOrg = OrganizationDA.GetListDropdownlist();
                return listOrg;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
