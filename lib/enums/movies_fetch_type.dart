enum MovieFetchType {
  topRated,
  nowPlaying,
  upComing,
  popular,
}

extension MovieFetchTypeHelper on MovieFetchType {
  String get value {
    switch (this) {
      case MovieFetchType.topRated:
        return 'top_rated';
      case MovieFetchType.nowPlaying:
        return 'now_playing';
      case MovieFetchType.upComing:
        return 'upcoming';
      case MovieFetchType.popular:
        return 'popular';
    }
  }
}
