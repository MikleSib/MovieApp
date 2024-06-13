using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Windows.Input;
using Microsoft.EntityFrameworkCore;

namespace MovieAppHHRU.ViewModels
{
    public class MovieSearchViewModel : INotifyPropertyChanged
    {
        private string _searchText;
        private ObservableCollection<Movie> _movies;

        public string SearchText
        {
            get => _searchText;
            set
            {
                _searchText = value;
                OnPropertyChanged();
            }
        }

        public ObservableCollection<Movie> Movies
        {
            get => _movies;
            set
            {
                _movies = value;
                OnPropertyChanged();
            }
        }

        public ICommand SearchCommand { get; }

        public MovieSearchViewModel()
        {
            SearchCommand = new Command(OnSearch);
            Movies = new ObservableCollection<Movie>();
        }

        private void OnSearch()
        {
            string _dbPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "movies.db");
            using (var db = new AppDbContext(_dbPath))
            {
                var query = db.Movies.Include(m => m.MovieActors).AsQueryable();

                if (!string.IsNullOrEmpty(SearchText))
                {
                    query = query.Where(m => m.Title.Contains(SearchText) ||
                                              m.Genre.Contains(SearchText) ||
                                              m.MovieActors.Any(a => a.Actor.Name.Contains(SearchText)));
                }

                Movies = new ObservableCollection<Movie>(query.ToList());
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
