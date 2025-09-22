using Storm.Api.Launchers;

namespace Data.Api;

public class Startup : BaseStartup
{
	protected override string LogsProjectName { get; } = "Data.Api";

	public Startup(IConfiguration configuration, IHostEnvironment environment) : base(configuration, environment)
	{
	}

	public override void ConfigureServices(IServiceCollection services)
	{
		base.ConfigureServices(services);
		RegisterConsoleLogger(services);
	}
}