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
        Task<List<Booking>> GetBookingsByStatusAsync(BookingStatus status);

        Task<bool> UpdateBookingStatusToCheckInAsync(int bookingId);
    }
}
