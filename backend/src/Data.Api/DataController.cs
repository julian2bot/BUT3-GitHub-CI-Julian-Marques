using Microsoft.AspNetCore.Mvc;
using Storm.Api.Controllers;

namespace Data.Api;

public class DataController(IServiceProvider services) : BaseController(services)
{
	[HttpGet("api/v1/config")]
	public async Task<IActionResult> GetData()
	{
		return await Action<DataQuery, DataQueryParameter, DataResponse>(new());
	}
}