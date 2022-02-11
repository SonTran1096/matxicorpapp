using MatxiCorp.App.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MatxiCorp.App.IDataAccess
{
    public interface IHomeDataAccess
    {
        IEnumerable<OrgEmpViewModel> GetListEmpOrg(string keyword);
    }
}
