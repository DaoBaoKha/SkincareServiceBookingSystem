using SkincareBookingService.BLL.DTOs;
using SkincareBookingService.BLL.Interfaces;
using SkincareBookingService.DAL.Interfaces;

namespace SkincareBookingService.BLL.Services
{
    public class ServiceService : IServiceService
    {
        private readonly IServiceRepository _serviceRepository;

        public ServiceService(IServiceRepository serviceRepository)
        {
            _serviceRepository = serviceRepository;
        }

        public async Task<List<ServiceDTO>> GetServicesAsync()
        {
           var service = await _serviceRepository.GetServicesAsync();
            return service.Select(s => new ServiceDTO
            {
                ServiceId = s.ServiceId,
                Name = s.Name,
                Description = s.Description,
                Price = s.Price,
                Image = s.Image
            }).ToList();
        }
    }
}
