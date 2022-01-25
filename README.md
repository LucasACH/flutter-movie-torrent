<br />
<p align="center">
  <a href="https://github.com/LucasACH">
    <img src="https://avatars3.githubusercontent.com/u/73149577?s=460&u=1baa1defb9904624d7aad76ec37dc76d2b230c0a&v=4" alt="Logo" width="100" height="100">
  </a>

  <h3 align="center">Raspberry Pi</h3>

  <p align="center">
    Raspberry Pi home media server.
    <br />
    <a href="https://github.com/LucasACH/flutter-movie-torrent"><strong>Explore the docs »</strong></a>
  </p>
</p>

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Movie Torrent | Flutter

Desktop App that provides movies torrent magnet. It contains a "Popular" and a "Favorites" section. Searching a movie is also possible!

![alt text](https://github.com/LucasACH/flutter-movie-torrent/blob/master/screenshots/movie_torrent_1.PNG?raw=true)

The main idea of this desktop aplication is to provide a torrent magnet of the selected movie, so that you can watch it on your favorite torrent client. The HomePage contains a gridViewList of the popular movies. It has *infinite scroll* integrated, which will load more movies when scrolling down the page. When selecting a movie, the details page pops out. It contains the complete movie information, such as genre, directors and rating.

![alt text](https://github.com/LucasACH/flutter-movie-torrent/blob/master/screenshots/movie_torrent_3.PNG?raw=true)

You can add or remove a movie to favorites by clicking on the heart next to the title. Below, you will find two buttons. One is for watching the movie trailer and the other shows a list of magnets that you can copy and paste it on your favorite torrent client. If the magnet does not exists, a message will replace the button by saying that the movie is unavailable.

![alt text](https://github.com/LucasACH/flutter-movie-torrent/blob/master/screenshots/movie_torrent_4.PNG?raw=true)

A search engine is also integrated. It will display the movie only if the magnet exists.

![alt text](https://github.com/LucasACH/flutter-movie-torrent/blob/master/screenshots/movie_torrent_2.PNG?raw=true)


## API Documentation

- Get movie torrent magent: https://yts.mx/api
- Get movie information: https://developers.themoviedb.org/3/getting-started/introduction and http://www.omdbapi.com/



