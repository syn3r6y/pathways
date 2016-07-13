using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Pathway_Website.Startup))]
namespace Pathway_Website
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
