using SkincareBookingService.DAL.Entities;

namespace SkincareBookingService.DAL.Interfaces
{
    public interface ISkintherapistRepository
    {
        Task<List<SkinTherapist>> GetSkintherapistsAsync();
    }
}
