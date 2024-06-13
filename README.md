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

Модели

<b>Actor.cs:</b> Модель актёра.

<b>Movie.cs:</b> Модель фильма.

<b>MovieActor.cs:</b> Связующая модель между фильмами и актёрами.

ViewModels
Модели представления, обрабатывающие логику приложения.

Views
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
    using (var db = new AppDbContext())
    {
        var query = db.Movies.Include(m => m.MovieActors).ThenInclude(ma => ma.Actor).AsQueryable();

        if (!string.IsNullOrEmpty(SearchText))
        {
            query = query.Where(m => m.Title.ToLower().Contains(SearchText.ToLower()) ||
                                      m.Genre.ToLower().Contains(SearchText.ToLower()) ||
                                      m.MovieActors.Any(a => a.Actor.Name.ToLower().Contains(SearchText.ToLower())));
        }

        Movies = new ObservableCollection<Movie>(query.ToList());
    }
}
```