<%@ Application Language="C#" %>
<%@ Import Namespace="Pathway_Website" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="System.Web.Routing" %>


<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        RouteConfig.RegisterRoutes(RouteTable.Routes);
        BundleConfig.RegisterBundles(BundleTable.Bundles);
        //System.Data.Entity.Database.SetInitializer(new System.Data.Entity.DropCreateDatabaseIfModelChanges<Pathway_System.DAL.Security.ApplicationDbContext>());
        Pathway_System.BLL.Security.AppSecurity.Startup();
    }

</script>
