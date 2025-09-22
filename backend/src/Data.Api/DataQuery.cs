using System.Text.Json.Serialization;
using Newtonsoft.Json;
using Storm.Api;
using Storm.Api.Core.CQRS;

namespace Data.Api;

public class DataQueryParameter;

public class DataResponse
{
	[JsonProperty("environment")]
	public required string Environment { get; set; }

	[JsonProperty("firstName")]
	public required string FirstName { get; set; }

	[JsonProperty("lastName")]
	public required string LastName { get; set; }
}

public class DataQuery : BaseAction<DataQueryParameter, DataResponse>
{
	public DataQuery(IServiceProvider services) : base(services)
	{
	}

	protected override Task<DataResponse> Action(DataQueryParameter parameter)
	{
		DataResponse response = new()
		{
			Environment = EnvironmentHelper.Slot.ToString("G"),
			FirstName = Environment.GetEnvironmentVariable("FIRST_NAME") ?? "<not set in API>",
			LastName = Environment.GetEnvironmentVariable("LAST_NAME") ?? "<not set in API>"
		};
		return Task.FromResult(response);
	}
}