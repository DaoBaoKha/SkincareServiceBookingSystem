using SkincareBookingService.BLL.Interfaces;
using SkincareBookingService.Core.Constants;
using SkincareBookingService.DAL.Entities;
using SkincareBookingService.DAL.Interfaces;

namespace SkincareBookingService.BLL.Services
{
    public class BookingService : IBookingService
    {
        private readonly IBookingRepository _bookingRepository;

        public BookingService(IBookingRepository bookingRepository)
        {
            _bookingRepository = bookingRepository;
        }

        public async Task<List<Booking>> GetBookingsByStatusAsync(BookingStatus status)
        {
            return await _bookingRepository.GetBookingsByStatusAsync(status);
        }

        public async Task<bool> UpdateBookingStatusToCheckInAsync(int bookingId)
        {
            return await _bookingRepository.UpdateBookingStatusToCheckInAsync(bookingId);
        }

        public async Task<bool> UpdateStatusToCompletedAsync(int bookingId)
        {
            return await _bookingRepository.UpdateStatusToCompletedAsync(bookingId);
        }

        public async Task<bool> UpdateStatusToFinishedAsync(int bookingId)
        {
            return await _bookingRepository.UpdateStatusToFinishedAsync(bookingId);
        }
    }
}
