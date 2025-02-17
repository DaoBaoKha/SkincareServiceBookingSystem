﻿using SkincareBookingService.BLL.DTOs;
using SkincareBookingService.BLL.Interfaces;
using SkincareBookingService.DAL.Entities;
using SkincareBookingService.DAL.Interfaces;

namespace SkincareBookingService.BLL.Services
{
    public class SkintherapistService : ISkintherapistService
    {
        private readonly IGenericRepository<SkinTherapist> _skintherapistRepository;

        public SkintherapistService(IGenericRepository<SkinTherapist> skintherapistRepository)
        {
            _skintherapistRepository = skintherapistRepository;
        }

        public async Task<List<SkinTherapistDTO>> GetSkintherapistsAsync()
        {
            var therapists = await _skintherapistRepository.GetAllAsync();
            return therapists.Select(t => new SkinTherapistDTO
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
