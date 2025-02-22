using SkincareBookingService.BLL.DTOs;
using SkincareBookingService.Core.Constants;
using SkincareBookingService.DAL.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SkincareBookingService.BLL.Interfaces
{
    public interface IBookingService
    {
        Task<List<Booking>> GetBookingsAsync();

        Task<List<Booking>> GetBookingsByStatusAsync(string status);

        Task<Booking> GetBookingByIdAsync(int bookingId);

        Task<bool> UpdateBookingStatusToCheckInAsync(int bookingId);

        Task<bool> UpdateStatusToCompletedAsync(int bookingId);

        Task<bool> UpdateStatusToDeniedAsync(int bookingId);

        Task<bool> UpdateStatusToCancelledAsync(int bookingId);


        Task<bool> UpdateStatusToFinishedAsync(int bookingId);

        Task<bool > UpdateBookingServiceNameAsync(int bookingId, string serviceName);

        Task<bool> UpdateBookingSkintherapistAsync(int bookingId, int skintherapistId);

        Task<bool> UpdateBookingAmountAsync(int bookingId, float amount);

        Task<Booking> CreateBookingAsync(int customerId, string location, DateTime date, string status, decimal amount, int skintherapistId, string serviceName);

    }
}
