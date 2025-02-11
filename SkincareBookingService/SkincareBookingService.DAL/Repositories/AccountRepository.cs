using Microsoft.EntityFrameworkCore;
using SkincareBookingService.DAL.Entities;
using SkincareBookingService.DAL.Interfaces;

namespace SkincareBookingService.DAL.Repositories
{
    public class AccountRepository : IAccountRepository
    {
        private readonly SkincareBookingSystemContext _context;

        public AccountRepository(SkincareBookingSystemContext context)
        {
            _context = context;
        }

        public async Task<Account> GetAccountByUsernameAndPasswordAsync(string accountName, string password)
        {
            return await _context.Accounts
                .FirstOrDefaultAsync(a => a.AccountName == accountName && a.Password == password);
        }
    }
}