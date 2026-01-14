// vite.config.js
import { resolve } from 'path';
import { defineConfig } from 'vite';

export default defineConfig({
  root: resolve(__dirname, 'public'),
  build: {
    // outDir является относительным к "root", поэтому он создаст /app/public/dist
    outDir: '../dist',
  },
});

