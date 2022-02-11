using MatxiCorp.App.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MatxiCorp.App.IDataAccess
{
    public interface IOrganizationDataAccess
    {
        IEnumerable<OrganizationModel> GetListOrg(string keyword);
        OrganizationModel GetOrgWithId(int OrgId);
        ResponseResult CRUDOrganization(OrganizationModel model, string Flag);
        IEnumerable<OrganizationModel> GetListDropdownlist();
    }
}
