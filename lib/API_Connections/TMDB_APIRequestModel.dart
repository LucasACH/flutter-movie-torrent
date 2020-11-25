import 'dart:convert';

GetPopularMoviesModel welcomeFromJson(String str) => GetPopularMoviesModel.fromJson(json.decode(str));

String welcomeToJson(GetPopularMoviesModel data) => json.encode(data.toJson());

class GetPopularMoviesModel {
    GetPopularMoviesModel({
        this.page,
        this.totalResults,
        this.totalPages,
        this.results,
    });

    int page;
    int totalResults;
    int totalPages;
    List<ResultPopular> results;

    factory GetPopularMoviesModel.fromJson(Map<String, dynamic> json) => GetPopularMoviesModel(
        page: json["page"],
        totalResults: json["total_results"],
        totalPages: json["total_pages"],
        results: List<ResultPopular>.from(json["results"].map((x) => ResultPopular.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "total_results": totalResults,
        "total_pages": totalPages,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class ResultPopular {
    ResultPopular({
        this.popularity,
        this.voteCount,
        this.video,
        this.posterPath,
        this.id,
        this.adult,
        this.backdropPath,
        this.originalLanguage,
        this.originalTitle,
        this.genreIds,
        this.title,
        this.voteAverage,
        this.overview,
        this.releaseDate,
    });

    double popularity;
    int voteCount;
    bool video;
    String posterPath;
    int id;
    bool adult;
    String backdropPath;
    String originalLanguage;
    String originalTitle;
    List<int> genreIds;
    String title;
    double voteAverage;
    String overview;
    DateTime releaseDate;

    factory ResultPopular.fromJson(Map<String, dynamic> json) => ResultPopular(
        popularity: json["popularity"].toDouble(),
        voteCount: json["vote_count"],
        video: json["video"],
        posterPath: json["poster_path"],
        id: json["id"],
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        releaseDate: DateTime.parse(json["release_date"]),
    );

    Map<String, dynamic> toJson() => {
        "popularity": popularity,
        "vote_count": voteCount,
        "video": video,
        "poster_path": posterPath,
        "id": id,
        "adult": adult,
        "backdrop_path": backdropPath,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "title": title,
        "vote_average": voteAverage,
        "overview": overview,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    };
    
}


GetMovieDetailsModel getMovieDetailsModelFromJson(String str) => GetMovieDetailsModel.fromJson(json.decode(str));

String getMovieDetailsModelToJson(GetMovieDetailsModel data) => json.encode(data.toJson());

class GetMovieDetailsModel {
    GetMovieDetailsModel({
        this.adult,
        this.backdropPath,
        this.belongsToCollection,
        this.budget,
        this.genres,
        this.homepage,
        this.id,
        this.imdbId,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.productionCompanies,
        this.productionCountries,
        this.releaseDate,
        this.revenue,
        this.runtime,
        this.spokenLanguages,
        this.status,
        this.tagline,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
        this.videos,
    });

    bool adult;
    String backdropPath;
    dynamic belongsToCollection;
    int budget;
    List<Genre> genres;
    String homepage;
    int id;
    String imdbId;
    String originalLanguage;
    String originalTitle;
    String overview;
    double popularity;
    String posterPath;
    List<ProductionCompany> productionCompanies;
    List<ProductionCountry> productionCountries;
    DateTime releaseDate;
    int revenue;
    int runtime;
    List<SpokenLanguage> spokenLanguages;
    String status;
    String tagline;
    String title;
    bool video;
    double voteAverage;
    int voteCount;
    Videos videos;

    factory GetMovieDetailsModel.fromJson(Map<String, dynamic> json) => GetMovieDetailsModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        belongsToCollection: json["belongs_to_collection"],
        budget: json["budget"],
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: List<ProductionCompany>.from(json["production_companies"].map((x) => ProductionCompany.fromJson(x))),
        productionCountries: List<ProductionCountry>.from(json["production_countries"].map((x) => ProductionCountry.fromJson(x))),
        releaseDate: DateTime.parse(json["release_date"]),
        revenue: json["revenue"],
        runtime: json["runtime"],
        spokenLanguages: List<SpokenLanguage>.from(json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x))),
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        videos: Videos.fromJson(json["videos"]),
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "belongs_to_collection": belongsToCollection,
        "budget": budget,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies": List<dynamic>.from(productionCompanies.map((x) => x.toJson())),
        "production_countries": List<dynamic>.from(productionCountries.map((x) => x.toJson())),
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages": List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "videos": videos.toJson(),
    };
}

class Genre {
    Genre({
        this.id,
        this.name,
    });

    int id;
    String name;

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class ProductionCompany {
    ProductionCompany({
        this.id,
        this.logoPath,
        this.name,
        this.originCountry,
    });

    int id;
    String logoPath;
    String name;
    String originCountry;

    factory ProductionCompany.fromJson(Map<String, dynamic> json) => ProductionCompany(
        id: json["id"],
        logoPath: json["logo_path"] == null ? null : json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath == null ? null : logoPath,
        "name": name,
        "origin_country": originCountry,
    };
}

class ProductionCountry {
    ProductionCountry({
        this.iso31661,
        this.name,
    });

    String iso31661;
    String name;

    factory ProductionCountry.fromJson(Map<String, dynamic> json) => ProductionCountry(
        iso31661: json["iso_3166_1"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "name": name,
    };
}

class SpokenLanguage {
    SpokenLanguage({
        this.iso6391,
        this.name,
    });

    String iso6391;
    String name;

    factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
        iso6391: json["iso_639_1"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "iso_639_1": iso6391,
        "name": name,
    };
}

class Videos {
    Videos({
        this.results,
    });

    List<Result> results;

    factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.id,
        this.iso6391,
        this.iso31661,
        this.key,
        this.name,
        this.site,
        this.size,
        this.type,
    });

    String id;
    String iso6391;
    String iso31661;
    String key;
    String name;
    String site;
    int size;
    String type;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        key: json["key"],
        name: json["name"],
        site: json["site"],
        size: json["size"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "iso_639_1": iso6391,
        "iso_3166_1": iso31661,
        "key": key,
        "name": name,
        "site": site,
        "size": size,
        "type": type,
    };

}