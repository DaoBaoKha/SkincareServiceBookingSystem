using Microsoft.AspNetCore.Mvc;
using SkincareBookingService.BLL.Interfaces;
using SkincareBookingService.Core.Constants;
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

    [HttpGet("booked")]
    public async Task<IActionResult> GetBookingsWithStatusBooked()
    {
        var bookings = await _bookingService.GetBookingsByStatusAsync(BookingStatus.Booked);
        if (bookings == null || bookings.Count == 0)
        {
            return NotFound("No bookings found with status 'Booked'.");
        }

        return Ok(bookings);
    }

    [HttpPut("checkin/{bookingId}")]
    public async Task<IActionResult> UpdateBookingStatusToCheckIn(int bookingId)
    {
        var result = await _bookingService.UpdateBookingStatusToCheckInAsync(bookingId);

        if (result)
        {
            return Ok(new { message = "Booking status updated to 'CheckIn' successfully." });
        }
        else
        {
            return NotFound(new { message = "Booking not found." });
        }
    }

    [HttpPut("completed/{bookingId}")]
    public async Task<IActionResult> UpdateBookingStatusToCompleted(int bookingId)
    {
        var result = await _bookingService.UpdateStatusToCompletedAsync(bookingId);

        if (result)
        {
            return Ok(new { message = "Booking status updated to 'Completed' successfully." });
        }
        else
        {
            return NotFound(new { message = "Booking not found." });
        }
    }
}



