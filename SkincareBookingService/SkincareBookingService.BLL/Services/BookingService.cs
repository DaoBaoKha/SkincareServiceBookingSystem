using SkincareBookingService.BLL.DTOs;
using SkincareBookingService.BLL.Interfaces;
using SkincareBookingService.Core.Constants;
using SkincareBookingService.DAL.Entities;
using SkincareBookingService.DAL.Interfaces;

namespace SkincareBookingService.BLL.Services
{
    public class BookingService : IBookingService
    {
        private readonly IGenericRepository<Booking> _bookingRepository;

        public BookingService(IGenericRepository<Booking> bookingRepository)
        {
            _bookingRepository = bookingRepository;
        }

        public async Task<List<Booking>> GetBookingsAsync()
        {
            var bookings = await _bookingRepository.GetAllAsync();
            return bookings.ToList();
        }


        public async Task<Booking> GetBookingByIdAsync(int bookingId)
        {
            var booking = _bookingRepository.GetByIdAsync(bookingId);
            return await booking;
        }

        public async Task<List<Booking>> GetBookingsByStatusAsync(string status)
        {
            var bookings = await _bookingRepository.FindAsync(b => b.Status == status);
            return bookings.ToList();
        }

        public async Task<bool> UpdateBookingStatusToCheckInAsync(int bookingId)
        {
            return await UpdateBookingStatusAsync(bookingId, BookingStatus.CheckIn.ToString());
        }

        public async Task<bool> UpdateStatusToCompletedAsync(int bookingId)
        {
            return await UpdateBookingStatusAsync(bookingId, BookingStatus.Completed.ToString());
        }

        public async Task<bool> UpdateStatusToDeniedAsync(int bookingId)
        {
            return await UpdateBookingStatusAsync(bookingId, BookingStatus.Denied.ToString());
        }

        public async Task<bool> UpdateStatusToCancelledAsync(int bookingId)
        {
            return await UpdateBookingStatusAsync(bookingId, BookingStatus.Cancelled.ToString());
        }

        public async Task<bool> UpdateStatusToFinishedAsync(int bookingId)
        {
            return await UpdateBookingStatusAsync(bookingId, BookingStatus.Finished.ToString());
        }

        private async Task<bool> UpdateBookingStatusAsync(int bookingId, string status)
        {
            var booking = await _bookingRepository.GetByIdAsync(bookingId);
            if (booking == null) return false;

            booking.Status = status;
            await _bookingRepository.UpdateAsync(booking);
            return true;
        }

        public async Task<bool> UpdateBookingServiceNameAsync(int bookingId, string serviceName)
        {
            var booking = await _bookingRepository.GetByIdAsync(bookingId);
            if (booking == null) return false;

            booking.ServiceName = serviceName;
            await _bookingRepository.UpdateAsync(booking);
            await _bookingRepository.SaveChangesAsync();
            return true;
        }

        public async Task<bool> UpdateBookingSkintherapistAsync(int bookingId, int skintherapistId)
        {
            var booking = await _bookingRepository.GetByIdAsync(bookingId);
            if (booking == null) return false;

            booking.SkintherapistId = skintherapistId;
            await _bookingRepository.UpdateAsync(booking);
            await _bookingRepository.SaveChangesAsync();
            return true;
        }

        public async Task<bool> UpdateBookingAmountAsync(int bookingId, float amount)
        {
            var booking = await _bookingRepository.GetByIdAsync(bookingId);
            if (booking == null) return false;

            booking.Amount = (decimal?)amount;
            await _bookingRepository.UpdateAsync(booking);
            await _bookingRepository.SaveChangesAsync();
            return true;
        }

        public async Task<Booking> CreateBookingAsync(int customerId, string location, DateTime date, string status, decimal amount, int skintherapistId, string serviceName)
        {
            var booking = new Booking
            {
                CustomerId = customerId,
                Location = location,
                Date = date,
                CreateAt = DateTime.Now,
                Status = status,
                Amount = amount,
                SkintherapistId = skintherapistId,
                ServiceName = serviceName
            };

            await _bookingRepository.AddAsync(booking);
            await _bookingRepository.SaveChangesAsync();
            return booking;
        }

      
    }
}
