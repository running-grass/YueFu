import useSWR, { Fetcher } from "swr";
import { fetch } from '@tauri-apps/api/http';

const getFetcher : Fetcher<any, string> = url => fetch(url, {
  method: "GET",
  timeout: 30,
}).then(res => {
  console.log(res)
  return res.data;
});

// const getFetcher = (url: string) => axiosService.get(url).then(console.log).catch(console.error)
export function useMusicList() {
  //.then(data => data)
  
  // const fetcher = uel => {}

  const url = 'http://u.y.qq.com/cgi-bin/musicu.fcg?_=1577086820633&data=%7B%22comm%22%3A%7B%22g_tk%22%3A5381%2C%22uin%22%3A123456%2C%22format%22%3A%22json%22%2C%22inCharset%22%3A%22utf-8%22%2C%22outCharset%22%3A%22utf-8%22%2C%22notice%22%3A0%2C%22platform%22%3A%22h5%22%2C%22needNewCode%22%3A1%2C%22ct%22%3A23%2C%22cv%22%3A0%7D%2C%22topList%22%3A%7B%22module%22%3A%22musicToplist.ToplistInfoServer%22%2C%22method%22%3A%22GetAll%22%2C%22param%22%3A%7B%7D%7D%7D'
  // console.log(url);
  return useSWR(url, url => getFetcher(url).then(data => data?.topList?.data?.group));
}

export function useTopDetail(topId: string, period: string = '') {
  const url = `https://u.y.qq.com/cgi-bin/musicu.fcg?g_tk=5381&data=%7B%22detail%22%3A%7B%22module%22%3A%22musicToplist.ToplistInfoServer%22%2C%22method%22%3A%22GetDetail%22%2C%22param%22%3A%7B%22topId%22%3A${topId}%2C%22offset%22%3A0%2C%22num%22%3A100%2C%22period%22%3A%22${period}%22%7D%7D%2C%22comm%22%3A%7B%22ct%22%3A24%2C%22cv%22%3A0%7D%7D`

  return useSWR(url, url => getFetcher(url).then(data => data?.detail?.data?.data?.song));
}
const typeMap = {
  m4a: {
      s: "C400",
      e: ".m4a",
  },
  128: {
      s: "M500",
      e: ".mp3",
  },
  320: {
      s: "M800",
      e: ".mp3",
  },
  ape: {
      s: "A000",
      e: ".ape",
  },
  flac: {
      s: "F000",
      e: ".flac",
  },
};

export function useGetSourceUrl(id, type = "128") {
  console.log('id', id)
  const mediaId = id;
  let uin = "";
  const guid = (Math.random() * 10000000).toFixed(0);
  const typeObj = typeMap[type];
  const file = `${typeObj.s}${id}${mediaId}${typeObj.e}`;
  const query = new URLSearchParams({
      "-": "getplaysongvkey",
      g_tk: '5381',
      loginUin: uin,
      hostUin: '0',
      format: "json",
      inCharset: "utf8",
      outCharset: "utf-8¬ice=0",
      platform: "yqq.json",
      needNewCode: '0',
      data: JSON.stringify({
          req_0: {
              module: "vkey.GetVkeyServer",
              method: "CgiGetVkey",
              param: {
                  filename: [file],
                  guid: guid,
                  songmid: [id],
                  songtype: [0],
                  uin: uin,
                  loginflag: 1,
                  platform: "20",
              },
          },
          comm: {
              uin: uin,
              format: "json",
              ct: 19,
              cv: 0,
              authst: "",
              
          },
      }),
  });
  const url = `https://u.y.qq.com/cgi-bin/musicu.fcg?${query}`
  return useSWR(url, getFetcher, {
    errorRetryInterval: 15000
  });
}