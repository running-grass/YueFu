import { useState } from "react";
import { invoke } from "@tauri-apps/api/tauri";

// 'use client'

import 'aplayer/dist/APlayer.min.css';
import { useEffect, useRef } from 'react';
// import APlayer from 'aplayer';

export default function Home() {
  const player = useRef()
  useEffect(() => {
    import('aplayer').then(({ default: APlayer }) => {
      console.log(APlayer)
      const ap = new APlayer({
        container: player.current,
        audio: [{
          name: 'name',
          artist: 'artist',
          url: 'https://cn.mugeda.com/c/user/data/56317edca3664edd200001f2/5f4789290fcad950d11bce7e.mp3',
          cover: 'cover.jpg'
        }]
      });
    });
  }, [player])
  return <main className="flex flex-col justify-between h-screen">
    <section></section>
    <div ref={player} className="w-full !m-0"></div>
  </main>
}