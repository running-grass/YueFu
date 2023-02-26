import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:yue_fu/providers/types/Provider.dart';
import 'package:yue_fu/providers/types/music.dart';
import 'package:yue_fu/providers/types/ranking.dart';

/// 5sing
/// 接口来自于 https://github.com/maotoumao/MusicFreePlugins/blob/master/plugins/5sing/index.ts
class FiveSing extends Provider {
  Dio dio = Dio();

  @override
  Future<List<Ranking>> getRankingList() async {
    return [
      Ranking(id: '/', title: '原创音乐榜'),
      Ranking(id: '/fc', title: '翻唱音乐榜'),
      Ranking(id: '/bz', title: '伴奏音乐榜'),
    ];
  }

  @override
  Future<RankingDetail> getRankingDetail(Ranking ranking) async {
    final res = await dio.get('http://5sing.kugou.com/top${ranking.id}');
    final String data = res.data;
    final Document doc = parse(data);

    //   const rawHtml = (await axios.get(`http://5sing.kugou.com/top${topListItem.id}`)).data;

    // const $ = load(rawHtml);
    final tableRows = doc.querySelectorAll('div.rank_view tbody > tr');
    List<Song> songs = tableRows.skip(1).map((ele) {
      var href =
          ele.querySelector('td.r_td_6')?.firstChild?.attributes['href'] ?? '';

      var reg = RegExp(r'http:\/\/5sing\.kugou\.com\/.+?(\d+)\.html');
      var id = reg.firstMatch(href)?[1] ?? '';

      var title = ele.querySelector('td.r_td_3')?.text.trim() ?? '';
      return Song(id: id, title: title);
    }).toList();

    return RankingDetail(id: ranking.id, title: ranking.title, songs: songs);
  }
}
