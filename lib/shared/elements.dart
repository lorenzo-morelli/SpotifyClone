class Song {
  int number;
  String songName;
  Album album;
  Artist artist;
  String filePath;

  Song(this.number, this.songName, this.album, this.artist, this.filePath);
}

class Album {
  String albumName;
  String urlAlbum;
  Artist artist;

  Album(this.albumName, this.urlAlbum, this.artist);
}

class Artist {
  String artistName;

  Artist(this.artistName);
}