import 'package:yue_fu/providers/types/ranking.dart';

abstract class Provider {
  Future<List<Ranking>> getRankingList();

  Future<RankingDetail> getRankingDetail(Ranking ranking);
}
