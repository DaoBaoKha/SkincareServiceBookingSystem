using SkincareBookingService.BLL.DTOs;
using SkincareBookingService.BLL.Interfaces;
using SkincareBookingService.DAL.Entities;
using SkincareBookingService.DAL.Interfaces;

namespace SkincareBookingService.BLL.Services
{
    public class SkintherapistService : ISkintherapistService
    {
        private readonly ISkintherapistRepository _skintherapistRepository;

        public SkintherapistService(ISkintherapistRepository skintherapistRepository)
        {
            _skintherapistRepository = skintherapistRepository;
        }

        public async Task<List<SkinTherapistDTO>> GetSkintherapistsAsync()
        {
            var therapist = await _skintherapistRepository.GetSkintherapistsAsync();

            return therapist.Select(t => new SkinTherapistDTO
            {
                SkintherapistId = t.SkintherapistId,
                Name = t.Name,
                Speciality = t.Speciality,
                Email = t.Email,
                Experience = t.Experience,
                Image = t.Image,
                AccountId = t.AccountId
            }).ToList();
        }
    }
}
