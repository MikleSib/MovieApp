using MovieAppHHRU.ViewModels;
using MovieAppHHRU.Views;

namespace MovieAppHHRU
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();
            string _dbPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "movies.db");
            using (var db = new AppDbContext(_dbPath))
            {
                db.Database.EnsureCreated();
            }
            MainPage = new MainPage();
        }
    }
}
