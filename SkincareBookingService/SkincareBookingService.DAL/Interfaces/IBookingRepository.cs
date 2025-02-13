using SkincareBookingService.Core.Constants;
using SkincareBookingService.DAL.Entities;

namespace SkincareBookingService.DAL.Interfaces
{
    public interface IBookingRepository
    {
        Task<Booking> GetBookingByIdAsync(int bookingId);

        Task<bool> UpdateBookingStatusToCheckInAsync(int bookingId);

        Task<bool> UpdateStatusToCompletedAsync(int bookingId);

        Task<bool> UpdateStatusToFinishedAsync(int bookingId);

        Task<bool> UpdateStatusToDeniedAsync(int bookingId);    

        Task<bool> UpdateStatusToCancelledAsync(int bookingId);

        Task<List<Booking>> GetBookingsByStatusAsync(BookingStatus status);
    }

}
