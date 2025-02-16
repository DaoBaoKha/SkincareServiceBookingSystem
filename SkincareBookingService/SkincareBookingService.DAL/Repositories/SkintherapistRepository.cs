using Microsoft.EntityFrameworkCore;
using SkincareBookingService.DAL.Entities;
using SkincareBookingService.DAL.Interfaces;

namespace SkincareBookingService.DAL.Repositories
{
    public class SkintherapistRepository : ISkintherapistRepository
    {

        private readonly SkincareBookingSystemContext _context;

        public SkintherapistRepository(SkincareBookingSystemContext context)
        {
            _context = context;
        }

        public async Task<List<SkinTherapist>> GetSkintherapistsAsync()
        {
            return await _context.SkinTherapists.ToListAsync();
        }
    }
}
