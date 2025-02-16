﻿using Microsoft.AspNetCore.Mvc;
using SkincareBookingService.BLL.Interfaces;

namespace SkincareBookingService.Controllers
{
    [Route("api/service")]
    [ApiController]
    public class ServiceController : ControllerBase
    {
        private readonly IServiceService _serviceService;
        public ServiceController(IServiceService serviceService)
        {
            _serviceService = serviceService;
        }
        [HttpGet("getAllServices")]
        public async Task<IActionResult> GetServices()
        {
            var services = await _serviceService.GetServicesAsync();
            if (services == null || services.Count == 0)
            {
                return NotFound("No services found");
            }
            return Ok(services);
        }
    }
}
