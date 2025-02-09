using Microsoft.AspNetCore.Mvc;
using SkincareBookingService.BLL.Interfaces;
using System.Threading.Tasks;

[Route("api/[controller]")]
[ApiController]
public class BookingController : ControllerBase
{
    private readonly IBookingService _bookingService;

    public BookingController(IBookingService bookingService)
    {
        _bookingService = bookingService;
    }

    [HttpPost("checkin/{bookingId}")]
    public async Task<IActionResult> CheckIn(int bookingId)
    {
        bool success = await _bookingService.CheckInCustomerAsync(bookingId);
        if (!success) return BadRequest("Check-in failed. Booking not found or already checked in.");

        return Ok("Customer checked in successfully.");
    }
}
