using Microsoft.EntityFrameworkCore;
using SkincareBookingService.DAL.Entities;
using SkincareBookingService.DAL.Interfaces;

namespace SkincareBookingService.DAL.Repositories
{
    public class ServiceRepository : IServiceRepository
    {
        private readonly SkincareBookingSystemContext _context;

        public ServiceRepository(SkincareBookingSystemContext context)
        {
            _context = context;
        }
        public async Task<List<Service>> GetServicesAsync()
        {
            return await _context.Services.ToListAsync();
        }
        public async Task<Service> GetServiceByIdAsync(int serviceId)
        {
            return await _context.Services.FirstOrDefaultAsync(s => s.ServiceId == serviceId) 
                ?? throw new Exception("Service not found");
        }
    }
}
