using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CRUDMVC_SP.Startup))]
namespace CRUDMVC_SP
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
