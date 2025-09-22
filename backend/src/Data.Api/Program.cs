using Storm.Api.Launchers;

namespace Data.Api;

public static class Program
{
	public static void Main(string[] args)
	{
		DefaultLauncher<Startup>.RunWebHost(args,
			configureConfiguration: (_, builder) => builder
				.AddJsonFile("vault.local.json", optional: true)
		);
	}
}