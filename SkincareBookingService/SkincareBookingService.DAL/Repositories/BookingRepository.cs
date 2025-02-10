using Microsoft.EntityFrameworkCore;
using SkincareBookingService.Core.Constants;
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

        public async Task<List<Booking>> GetBookingsByStatusAsync(BookingStatus status)
        {
            return await _context.Bookings
                                 .Where(b => b.Status == status.ToString())
                                 .ToListAsync();
        }

        public Task<bool> UpdateBookingStatusAsync(int bookingId, string status)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> UpdateBookingStatusToCheckInAsync(int bookingId)
        {
            var booking = await _context.Bookings.FindAsync(bookingId);

            if (booking == null)
            {
                return false;
            }

            if (booking.Status == BookingStatus.CheckIn.ToString())
            {
                throw new InvalidOperationException("Booking is already checked in.");
            }

            booking.Status = BookingStatus.CheckIn.ToString();
            booking.UpdateAt = DateTime.UtcNow;

            _context.Bookings.Update(booking);
            await _context.SaveChangesAsync();

            return true;
        }

        public async Task<bool> UpdateStatusToCompletedAsync(int bookingId)
        {
            var booking = await _context.Bookings.FindAsync(bookingId);

            if(booking == null)
            {  return false; }

            booking.Status = BookingStatus.Completed.ToString();
            booking.UpdateAt = DateTime.UtcNow;

            _context.Bookings.Update(booking);
            await _context.SaveChangesAsync();

            return true;
        }

        public async Task<bool> UpdateStatusToFinishedAsync(int bookingId)
        {
            var booking = await _context.Bookings.FindAsync(bookingId);

            if (booking == null)
            { return false; }

            booking.Status = BookingStatus.Finished.ToString();
            booking.UpdateAt = DateTime.UtcNow;

            _context.Bookings.Update(booking);
            await _context.SaveChangesAsync();

            return true;
        }
    }
}
