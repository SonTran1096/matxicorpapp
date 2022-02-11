using MatxiCorp.App.IServices;
using MatxiCorp.App.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MatxiCorp.App.Controllers
{
    public class EmployeeController : Controller
    {
        private readonly IEmployeeService _employeeService;
        private readonly IOrganizationService _organizationService;
        public EmployeeController(IEmployeeService employeeService, IOrganizationService organizationService)
        {
            _employeeService = employeeService;
            _organizationService = organizationService;
        }
        // GET: EmployeeController
        public ActionResult Index()
        {
            var listEmp = _employeeService.GetListEmp("GETLIST");
            return View(listEmp);
        }

        // GET: EmployeeController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: EmployeeController/Create
        public ActionResult Create()
        {
            var listDDL = _organizationService.GetListDropdownlist();
            if (listDDL != null)
            {
                ViewData["CboOrg"] = new SelectList(listDDL, "OrgID", "OrgName");
            }
            return View();
        }

        // POST: EmployeeController/Create
        [HttpPost]
        [Consumes("multipart/form-data")]
        [ValidateAntiForgeryToken]
        public ActionResult Create(EmployeeModel model)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return View(model);
                }
                var listEmp = _employeeService.CheckDuplicateEmp(model, "CHECK_DUPLICATE_EMP");
                if (listEmp.Count() > 0)
                {
                    TempData["result"] = "Trùng mã nhân viên";
                    var listDDL = _organizationService.GetListDropdownlist();
                    if (listDDL != null)
                    {
                        ViewData["CboOrg"] = new SelectList(listDDL, "OrgID", "OrgName");
                    }
                    return View(model);
                }

                var result = _employeeService.CRUDEmployee(model, "INSERT");
                if (result.ResponseCode == 1)
                {
                    TempData["result"] = "Thêm mới thành công";
                    return RedirectToAction("Index");
                }
                ModelState.AddModelError("", "Thêm mới thất bại");
                return View(model);
            }
            catch
            {
                return View(model);
            }
        }

        // GET: EmployeeController/Edit/5
        public ActionResult Edit(int id)
        {
            var listDDL = _organizationService.GetListDropdownlist();
            if (listDDL != null)
            {
                ViewData["CboOrg"] = new SelectList(listDDL, "OrgID", "OrgName");
            }
            var result = _employeeService.GetEmpWithId(id);
            return View(result);
        }

        // POST: EmployeeController/Edit/5
        [HttpPost]
        [Consumes("multipart/form-data")]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(EmployeeModel model)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return View(model);
                }
                var listEmp = _employeeService.CheckDuplicateEmp(model, "CHECK_DUPLICATE_EMP");
                if (listEmp.Count() > 0)
                {
                    TempData["result"] = "Trùng mã nhân viên";
                    var listDDL = _organizationService.GetListDropdownlist();
                    if (listDDL != null)
                    {
                        ViewData["CboOrg"] = new SelectList(listDDL, "OrgID", "OrgName");
                    }
                    return View(model);
                }

                var result = _employeeService.CRUDEmployee(model, "UPDATE");
                if (result.ResponseCode == 1)
                {
                    TempData["result"] = "Cập nhật thành công";
                    return RedirectToAction("Index");
                }
                ModelState.AddModelError("", "Cập nhật thất bại");
                return View(model);
            }
            catch
            {
                return View(model);
            }
        }

        // GET: EmployeeController/Delete/5
        public ActionResult Delete(int id)
        {
            var result = _employeeService.GetEmpWithId(id);
            return View(result);
        }

        // POST: EmployeeController/Delete/5
        [HttpPost]
        [Consumes("multipart/form-data")]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(EmployeeModel model)
        {
            try
            {
                var result = _employeeService.CRUDEmployee(model, "DELETE");
                if (result.ResponseCode == 1)
                {
                    TempData["result"] = "Xóa thành công";
                    return RedirectToAction("Index");
                }
                ModelState.AddModelError("", "Xóa thất bại");
                return View(model);
            }
            catch
            {
                return View(model);
            }
        }
    }
}
