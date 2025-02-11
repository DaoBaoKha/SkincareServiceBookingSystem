using SkincareBookingService.DAL.Entities;

namespace SkincareBookingService.DAL.Interfaces
{
    public interface IAccountRepository
    {
        Task<Account> GetAccountByUsernameAndPasswordAsync(string accountName, string password);
    }
}
