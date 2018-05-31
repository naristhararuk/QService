using Microsoft.Owin.Security;
using Microsoft.Owin.Security.OAuth;
using QService.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace QService.Class
{
    public class SimpleAuthorizationServerProvider : OAuthAuthorizationServerProvider
    {
        public override async Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            context.Validated();
        }
        /*override response authen token for custom field*/
        public override Task TokenEndpoint(OAuthTokenEndpointContext context)
        {
            foreach (KeyValuePair<string, string> property in context.Properties.Dictionary)
            {
                context.AdditionalResponseParameters.Add(property.Key, property.Value);
            }

            return Task.FromResult<object>(null);
        }
        /* http://www.mukeshkumar.net/articles/web-api/token-based-authentication-in-web-api reference*/
        public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            var identity = new ClaimsIdentity(context.Options.AuthenticationType);
            context.OwinContext.Response.Headers.Add("Access-Control-Allow-Origin", new[] { "*" });
            using (KioskChulaiPadEntities db = new KioskChulaiPadEntities())
            {
                if (db != null)
                {
                    var userlist = db.kiosk_user.ToList();
                    if (userlist != null)
                    {
                        string encryppassword = Helper.Utility.Encrypt(context.Password, true); /*encrypt password*/
                        if (!string.IsNullOrEmpty(userlist.Where(x => x.username == context.UserName && x.password == encryppassword).FirstOrDefault().name))
                        {
                            string displayname = userlist.Where(x => x.username == context.UserName && x.password == encryppassword).FirstOrDefault().name;
                            int user_group_code = userlist.Where(x => x.username == context.UserName && x.password == encryppassword).FirstOrDefault().user_group_code;
                            identity.AddClaim(new Claim("Developer", "Naristhararuk"));
                            var props = new AuthenticationProperties(new Dictionary<string, string>
                            {
                                { "userdisplayname",context.UserName },
                                { "role",user_group_code.ToString() }
                            });
                            var ticket = new AuthenticationTicket(identity, props);
                            context.Validated(ticket);
                        }
                        else
                        {
                            context.SetError("invalid_grant", "UserName or Password is incorrect");
                            context.Rejected();
                        }
                    }
                }
                else
                {
                    context.SetError("invalid_grant", "Problem with Database User");
                    context.Rejected();
                }
                return;
            }
        }
    }
}
