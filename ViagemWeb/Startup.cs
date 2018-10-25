using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ViagemWeb.Startup))]
namespace ViagemWeb
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
