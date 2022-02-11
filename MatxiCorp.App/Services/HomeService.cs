using MatxiCorp.App.DataAccess;
using MatxiCorp.App.IDataAccess;
using MatxiCorp.App.IServices;
using MatxiCorp.App.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MatxiCorp.App.Services
{
    public class HomeService : IHomeService
    {
        //private
        private IHomeDataAccess _homeDA;
        private IHomeDataAccess HomeDA
        {
            get { return _homeDA ?? (_homeDA = new HomeDataAccess()); }
        }
        public IEnumerable<OrgEmpViewModel> GetListEmpOrg(string keyword)
        {
            try
            {
                var listEmp = HomeDA.GetListEmpOrg(keyword);
                return listEmp;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
