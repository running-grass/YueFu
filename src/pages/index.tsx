import { useEffect, useRef } from 'react';

import 'vidstack/styles/base.css';

import { MediaOutlet, MediaPlayer } from '@vidstack/react';
import { MediaPlayerElement } from 'vidstack';
import { useGetSourceUrl, useMusicList, useTopDetail } from '../lib/api';

export default function Home() {
  const player = useRef<MediaPlayerElement>(null);
  // player.current
  const { data } = useMusicList();
  console.log('data', data);

  const one = data?.[0]?.toplist?.[0];
  const { data: data2 } = useTopDetail(one?.topId, one?.period);
  console.log('data2', data2);

  // const {data: data3} = useGetSourceUrl(data2?.[2]?.mid || data2?.[2]?.songmid);
  // console.log('data3', data3);
  
  return <main className="flex flex-col justify-between h-screen">
    <section></section>
    <MediaPlayer src="https://media-files.vidstack.io/audio.mp3" controls ref={player}>
      {/* ^ remove `controls` attribute if you're designing a custom UI */}
      <MediaOutlet />
    </MediaPlayer>
  </main>
}