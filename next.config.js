/** @type {import('next').NextConfig} */

const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
  images: {
    unoptimized: true,
  },
  experimental: {
    // 暂时不能使用，不支持export
    appDir: false,
  }
};

module.exports = nextConfig;
