// import dayjs from "dayjs";
// import relativeTime from 'dayjs/plugin/relativeTime';
// import 'dayjs/locale/zh-cn';

// dayjs.extend(relativeTime);
// dayjs.locale('zh-cn');


import type { AppProps } from "next/app";

import "../style.css";

// This default export is required in a new `pages/_app.js` file.
export default function MyApp({ Component, pageProps }: AppProps) {
  return <Component {...pageProps} />;
}
