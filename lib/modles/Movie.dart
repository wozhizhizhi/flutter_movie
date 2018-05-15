class Movie
{
  final String title;
  final String average;
  final int collect_count;
  final String small;
  final String directors;
  final String casts;
  final String id;

  Movie({this.title, this.average, this.collect_count, this.small,
      this.directors, this.casts, this.id});

  Movie fromMap(Map<String , dynamic> map)
  {
    List directors = map['directors'];
    List casts = map['casts'];
    var d = "";
    for (int i = 0 ; i < directors.length ; i++)
    {
      if (i == 0)
      {
        d = directors[i]['name'];
      }
      else
      {
        d = d + '/' + directors[i]['name'];
      }
    }

    var c = "";
    for (int i = 0 ; i < casts.length ; i++)
    {
      if (i == 0)
      {
        d = casts[i]['name'];
      }
      else
      {
        d = d + '/' + casts[i]['name'];
      }
    }

    return new Movie(
      title: map['title'],
      average: map['rating']['average'].toString(),
      collect_count: map['collect_count'],
      small: map['images']['small'],
      directors: d,
      casts: c,
      id: map['id']
    );
  }
}