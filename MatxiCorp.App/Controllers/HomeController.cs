using MatxiCorp.App.IServices;
using MatxiCorp.App.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace MatxiCorp.App.Controllers
{
    public class HomeController : Controller
    {
        private readonly IHomeService _homeService;
        private readonly IOrganizationService _organizationService;
        private readonly IEmployeeService _employeeService;
        
        public HomeController(IHomeService homeService, IOrganizationService organizationService, IEmployeeService employeeService)
        {
            _homeService = homeService;
            _organizationService = organizationService;
            _employeeService = employeeService;
        }

        public IActionResult Index(string keyword)
        {
            if (keyword == null)
            {
                keyword = "";
            }
            else
            {
                ViewBag.Keyword = keyword;
            }
            var listEmp = _homeService.GetListEmpOrg(keyword);
            return View(listEmp);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
