using MatxiCorp.App.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MatxiCorp.App.IServices
{
    public interface IHomeService
    {
        IEnumerable<OrgEmpViewModel> GetListEmpOrg(string keyword);
    }
}
