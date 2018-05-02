using QService.Entity;
using QService.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace QService.Controllers
{
    [RoutePrefix("api/SelectKioskCom")]
    public class SelectKioskComController : ApiController
    {
        KioskChulaiPadEntities db;

        public SelectKioskComController()
        {
            db = new KioskChulaiPadEntities();
        }

        [Route("")]
        [HttpPost]
        [Authorize]
        public HttpResponseMessage SearchComCon([FromBody] SelectKioskComModel param)
        {
            try {
                using (db)
                {
                    ObjectResult<q_expr_sel_kiosk_com_cat_ipad_Result> stored;

                    if (param != null)
                    {
                        if (!string.IsNullOrEmpty(param.computer_name))
                        {
                            stored = db.q_expr_sel_kiosk_com_cat_ipad(param.computer_name);
                            return Request.CreateResponse<ObjectResult<q_expr_sel_kiosk_com_cat_ipad_Result>>(HttpStatusCode.OK, stored);
                        }
                        else
                        {
                            return Request.CreateResponse(HttpStatusCode.BadRequest, "Not complete parameter !!");
                        }
                    }
                    else
                    {
                        return Request.CreateResponse(HttpStatusCode.BadRequest, "No parameter send request !!");
                    }
                }
            }
            catch(Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
        }

    }
}
