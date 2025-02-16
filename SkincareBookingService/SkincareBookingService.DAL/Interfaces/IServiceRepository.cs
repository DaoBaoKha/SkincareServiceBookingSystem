using SkincareBookingService.DAL.Entities;

namespace SkincareBookingService.DAL.Interfaces
{
    public interface IServiceRepository
    {
        Task<List<Service>> GetServicesAsync();
        Task<Service> GetServiceByIdAsync(int serviceId);
    }
}
