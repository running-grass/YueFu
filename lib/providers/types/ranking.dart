import 'package:yue_fu/providers/types/music.dart';

class Ranking {
  /// 排行榜id
  String id;

  /// 排行榜标题
  String title;

  /// 排行榜封面图
  String? coverImg;

  Ranking({required this.id, required this.title, this.coverImg});
}

class RankingDetail extends Ranking {
  List<Song> songs;

  RankingDetail(
      {required super.id,
      required super.title,
      super.coverImg,
      required this.songs});
}
