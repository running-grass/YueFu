// import 'package:yue_fu/providers/types/Provider.dart';
// import 'package:yue_fu/providers/types/ranking.dart';

// import 'package:dio/dio.dart';

// /// 千千静听
// class QianqianProvider extends Provider {
//   static const String _baseUrl = 'https://music.91q.com';

//   static final dio = Dio(BaseOptions(
//       baseUrl: _baseUrl,
//       headers: Map.from({
//         'x-from': '123',
//         'referer': 'https://m.baidu.com/',
//         'user-agent':
//             'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'
//       })));

//   @override
//   Future<List<Ranking>> getRankingList() async {
//     try {
//       final response = await dio.get('/toplist');
//       String? s = response.statusMessage;
//     } catch (e) {
//       print(e);
//     }
//     // print(response);

//     return [];
//     //   const rawHtml = (await axios.get('https://music.91q.com/toplist', {
//     //   headers: {
//     //     referer: 'https://m.baidu.com/',
//     //     'user-agent': 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1'
//     //   }
//     // })).data;
//     // const funcString = rawHtml.match(
//     //   /<script>\s*window\.__NUXT__\s*=\s*(.+?)<\/script>/
//     // )?.[1];
//     // const result = Function(`return ${funcString};`)();
//     // return [{
//     //   title: '排行榜',
//     //   data: result.data[0].pageData.map(_ => ({
//     //     title: _.title,
//     //     id: _.bdid,
//     //     coverImg: _.pic
//     //   }))
//     // }];

//     throw UnimplementedError();
//   }
  
//   @override
//   Future<RankingDetail> getRankingDetail(Ranking ranking) {
//     // TODO: implement getRankingDetail
//     throw UnimplementedError();
//   }
// }
