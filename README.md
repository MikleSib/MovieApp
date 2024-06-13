<h1>Требования</h1>

<b>.NET 8.0 </b>
<b>SQLite</b>


<h1>Установите зависимости:</h1>

<b>dotnet restore</b>


<h1>Функционал</h1>

<b>Структура проекта</b>

<b>MovieAppHHRU</b>

<b>App.xaml.cs:</b> Основной файл приложения, где инициализируется база данных и устанавливается главная страница.

<b>AppDbContext.cs:</b> Контекст базы данных, определяет таблицы и отношения между ними.

<h2>Модели</h2>

<b>Actor.cs:</b> Модель актёра.

<b>Movie.cs:</b> Модель фильма.

<b>MovieActor.cs:</b> Связующая модель между фильмами и актёрами.

<b>MViewModels</b>
Модели представления, обрабатывающие логику приложения.

<b>MViews</b>
Представления для взаимодействия с пользователем.

Автоматическое создание базы данных
При первом запуске приложения база данных автоматически создаётся, если её не существует. Это реализовано в конструкторе App.xaml.cs:

```
public App()
{
    InitializeComponent();
    using (var db = new AppDbContext())
    {
        db.Database.EnsureCreated();
    }

    MainPage = new MainPage();
}
```

Поиск фильмов
Функционал поиска фильмов реализован в методе OnSearch, который фильтрует фильмы по названию, жанру или имени актёра:

```
private void OnSearch()
{
    string _dbPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "movies.db");
    using (var db = new AppDbContext(_dbPath))
    {
        var query = db.Movies.Include(m => m.MovieActors).AsQueryable();

        if (!string.IsNullOrEmpty(SearchText))
        {
            string searchTextLower = SearchText.ToLower(); 

            query = query.Where(m =>
                m.Title.ToLower().Contains(searchTextLower) ||
                m.Genre.ToLower().Contains(searchTextLower) ||
                m.MovieActors.Any(a =>
                    a.Actor.Name.ToLower().Contains(searchTextLower)
                )
            );
        }

        Movies = new ObservableCollection<Movie>(query.ToList());
    }
}
```