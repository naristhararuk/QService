using QService.Class;
using QService.Entity;
using QService.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;

namespace QService.Controllers
{
    [RoutePrefix("api/Queue")]
    public class QueueController : ApiController
    {
        Kiosk_Chula_iPadEntities db;
        private ObjectResult<q_expr_search_kiosk_trans_ipad_Result> stored;

        public QueueController()
        {
            db = new Kiosk_Chula_iPadEntities();
        }
        [HttpGet]
        public IEnumerable<kiosk_transhead> GetQueue()
        {
            using (db)
            {
                return db.kiosk_transhead.ToList();
            }
        }
        //[Authorize]
        [Route("")]
        [HttpPost]
        [Authorize]
        public IEnumerable<kiosk_transhead> PostQueue([FromBody] SearchParamModel param)
        {
            using (db)
            {
                if (param != null)
                {
                    if (!string.IsNullOrEmpty(param.hn) && string.IsNullOrEmpty(param.queue_no))
                    {
                        var result = from x in db.kiosk_transhead
                                     where x.hn_no == param.hn
                                     select x;
                        return result.ToList();
                    }
                    else if (string.IsNullOrEmpty(param.hn) && !string.IsNullOrEmpty(param.queue_no))
                    {
                        var result = from x in db.kiosk_transhead
                                     where x.queue_no == param.queue_no
                                     select x;
                        return result.ToList();
                    }
                    else if (!string.IsNullOrEmpty(param.hn) && !string.IsNullOrEmpty(param.queue_no))
                    {
                        var result = from x in db.kiosk_transhead
                                     where x.hn_no == param.hn && x.queue_no == param.queue_no
                                     select x;
                        return result.ToList();
                    }
                    else
                    {
                        return null;
                    }
                }
                else
                {
                    return null;
                }

            }
        }

        [Route("SearchQueue")]
        [HttpPost]
        [Authorize]
        public IEnumerable<q_expr_search_kiosk_trans_ipad_Result> SearchQueue([FromBody] SearchParamModel param)
        {
            using (db)
            {
                stored = db.q_expr_search_kiosk_trans_ipad(null, null, "2018-03-20", 6);
                if (param != null)
                {
                    if (!string.IsNullOrEmpty(param.hn) && string.IsNullOrEmpty(param.queue_no))
                    {
                        var result = from x in stored
                                     where x.hn_no == param.hn
                                     select x;
                        return result.ToList();
                    }
                    else if (string.IsNullOrEmpty(param.hn) && !string.IsNullOrEmpty(param.queue_no))
                    {
                        var result = from x in stored
                                     where x.queue_no == param.queue_no
                                     select x;
                        return result.ToList();
                    }
                    else if (!string.IsNullOrEmpty(param.hn) && !string.IsNullOrEmpty(param.queue_no))
                    {
                        var result = from x in stored
                                     where x.hn_no == param.hn && x.queue_no == param.queue_no
                                     select x;
                        return result.ToList();
                    }
                    else
                    {
                        var result = from x in stored
                                     select x;
                        return result.ToList();
                    }
                }
                else
                {
                    return null;
                }

            }
        }
        public HttpResponseMessage GenQ9()
        {
            HttpResponseMessage res = Request.CreateResponse(HttpStatusCode.OK, "value");
            string q9 = CallSoap.GenQExpress("14", "1");
            res.Content = new StringContent(q9, Encoding.Unicode);
            return res;
        }
    }
}
