using Microsoft.EntityFrameworkCore;

public class AppDbContext : DbContext
{
    public DbSet<Movie> Movies { get; set; }
    public DbSet<Actor> Actors { get; set; }
    public DbSet<MovieActor> MovieActors { get; set; }


    private string _databasePath;


    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

    public AppDbContext(string databasePath)//Добавляю путь прямо, так как бд хранится в телефоне
    {
        _databasePath = databasePath;
    }
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlite($"Data Source={_databasePath}");
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        modelBuilder.Entity<MovieActor>()
            .HasKey(ma => new { ma.MovieId, ma.ActorId });

        modelBuilder.Entity<MovieActor>()
            .HasOne(ma => ma.Movie)
            .WithMany(m => m.MovieActors)
            .HasForeignKey(ma => ma.MovieId);

        modelBuilder.Entity<MovieActor>()
            .HasOne(ma => ma.Actor)
            .WithMany(a => a.MovieActors)
            .HasForeignKey(ma => ma.ActorId);

        modelBuilder.Entity<Actor>().HasData(
            new Actor { Id = 1, Name = "Алексей Баталов" },
            new Actor { Id = 2, Name = "Татьяна Самойлова" },
            new Actor { Id = 3, Name = "Александр Кайдановский" },
            new Actor { Id = 4, Name = "Леонид Куравлев" },
            new Actor { Id = 5, Name = "Наталья Беляева" },
            new Actor { Id = 6, Name = "Юрий Никулин" },
            new Actor { Id = 7, Name = "Александр Демьяненко" },
            new Actor { Id = 8, Name = "Илья Муромец" },
            new Actor { Id = 9, Name = "Андрей Миронов" },
            new Actor { Id = 10, Name = "Георгий Вицин" }
        );

        modelBuilder.Entity<Movie>().HasData(
            new Movie { Id = 1, Title = "Москва слезам не верит", Genre = "Драма" },
            new Movie { Id = 2, Title = "Брестская крепость", Genre = "Военный" },
            new Movie { Id = 3, Title = "Ирония судьбы, или С лёгким паром!", Genre = "Комедия" },
            new Movie { Id = 4, Title = "Иван Васильевич меняет профессию", Genre = "Фантастика" },
            new Movie { Id = 5, Title = "Освобождение", Genre = "Военный" },
            new Movie { Id = 6, Title = "Семнадцать мгновений весны", Genre = "Шпионский" },
            new Movie { Id = 7, Title = "Служебный роман", Genre = "Комедия" },
            new Movie { Id = 8, Title = "Белое солнце пустыни", Genre = "Приключения" },
            new Movie { Id = 9, Title = "Иди и смотри", Genre = "Драма" },
            new Movie { Id = 10, Title = "Место встречи изменить нельзя", Genre = "Криминальный" },
            new Movie { Id = 11, Title = "Iron Man", Genre = "Gg" }
        );
        

        modelBuilder.Entity<MovieActor>().HasData(
            new MovieActor { MovieId = 1, ActorId = 1 },
            new MovieActor { MovieId = 2, ActorId = 2 },
            new MovieActor { MovieId = 3, ActorId = 1 },
            new MovieActor { MovieId = 3, ActorId = 2 },
            new MovieActor { MovieId = 3, ActorId = 3 }
        );
    }
}