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
    public class OrganizationController : Controller
    {
        private readonly IOrganizationService _organizationService;
        public OrganizationController(IOrganizationService organizationService)
        {
            _organizationService = organizationService;
        }
        // GET: OrganizationController
        public ActionResult Index(string keyword)
        {
            if (keyword == null)
            {
                keyword = "";
            }
            else
            {
                ViewBag.Keyword = keyword;
            }
            var listOrg = _organizationService.GetListOrg(keyword);
            return View(listOrg);
        }

        // GET: OrganizationController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: OrganizationController/Create
        public ActionResult Create()
        {
            var listDDL = _organizationService.GetListDropdownlist();
            if(listDDL != null)
            {
                ViewData["CboOrg"] = new SelectList(listDDL, "OrgID", "OrgName");
            }
            return View();
        }

        // POST: OrganizationController/Create
        [HttpPost]
        [Consumes("multipart/form-data")]
        [ValidateAntiForgeryToken]
        public ActionResult Create(OrganizationModel model)
        {
            try
            {
                if (!ModelState.IsValid)
                    return View(model);

                var result = _organizationService.CRUDOrganization(model, "INSERT");
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

        // GET: OrganizationController/Edit/5
        public ActionResult Edit(int id)
        {
            var listDDL = _organizationService.GetListDropdownlist();
            if (listDDL != null)
            {
                ViewData["CboOrg"] = new SelectList(listDDL, "OrgID", "OrgName");
            }
            var result = _organizationService.GetOrgWithId(id);
            return View(result);
        }

        // POST: OrganizationController/Edit/5
        [HttpPost]
        [Consumes("multipart/form-data")]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(OrganizationModel model)
        {
            try
            {
                if (!ModelState.IsValid)
                    return View(model);

                var result = _organizationService.CRUDOrganization(model, "UPDATE");
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

        // GET: OrganizationController/Delete/5
        public ActionResult Delete(int id)
        {
            var result = _organizationService.GetOrgWithId(id);
            return View(result);
        }

        // POST: OrganizationController/Delete/5
        [HttpPost]
        [Consumes("multipart/form-data")]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(OrganizationModel model)
        {
            try
            {
                var result = _organizationService.CRUDOrganization(model, "DELETE");
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
