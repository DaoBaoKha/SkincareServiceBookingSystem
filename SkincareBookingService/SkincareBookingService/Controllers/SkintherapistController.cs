using Microsoft.AspNetCore.Mvc;
using SkincareBookingService.BLL.Interfaces;

namespace SkincareBookingService.Controllers
{
    [Route("api/skintherapist")]
    [ApiController]
    public class SkintherapistController : ControllerBase
    {
        private readonly ISkintherapistService _skintherapistService;

        public SkintherapistController(ISkintherapistService skintherapistService)
        {
            _skintherapistService = skintherapistService;
        }

        [HttpGet("getAllSkintherapist")]
        public async Task<IActionResult> GetSkintherapists()
        {
            var skintherapist = await _skintherapistService.GetSkintherapistsAsync();
            if(skintherapist == null || skintherapist.Count == 0)
            {
                return NotFound("No skintherapist found");
            }

            return Ok(skintherapist);
        }
    }
}
