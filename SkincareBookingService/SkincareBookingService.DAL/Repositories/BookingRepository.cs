using SkincareBookingService.DAL.Entities;
using SkincareBookingService.DAL.Interfaces;

namespace SkincareBookingService.DAL.Repositories
{
    public class BookingRepository : IBookingRepository
    {
        private readonly SkincareBookingSystemContext _context;

        public BookingRepository(SkincareBookingSystemContext context)
        {
            _context = context;
        }

        public async Task<Booking> GetBookingByIdAsync(int bookingId)
        {
            return await _context.Bookings.FindAsync(bookingId);
        }

        public async Task<bool> UpdateBookingStatusAsync(int bookingId, string status)
        {
            var booking = await _context.Bookings.FindAsync(bookingId);
            if (booking == null)
            {
                return false;
            }
            booking.Status = status;
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
