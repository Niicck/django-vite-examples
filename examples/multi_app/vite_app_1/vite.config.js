import { defineConfig, loadEnv } from 'vite';
import { resolve, join } from 'path';
import vue from '@vitejs/plugin-vue';

const postcssConfig = {
  plugins: [
    require('postcss-import')(),
    require('postcss-simple-vars')(),
    require('tailwindcss/nesting')(),
    require('tailwindcss')(),
    require('autoprefixer')(),
  ],
};

export default defineConfig((mode) => {
  const env = loadEnv(mode, '..', '');

  const INPUT_DIR = 'src';
  const OUTPUT_DIR = join('dist', env.APP1_STATIC_URL_PREFIX);

  return {
    plugins: [vue()],
    resolve: {
      alias: {
        '@': resolve(INPUT_DIR),
        'vue': 'vue/dist/vue.esm-bundler.js',
      },
    },
    root: resolve(INPUT_DIR),
    base: join('/static/', env.APP1_STATIC_URL_PREFIX),
    css: {
      postcss: postcssConfig,
    },
    server: {
      host: env.DEV_SERVER_HOST,
      port: env.APP1_DEV_SERVER_PORT,
    },
    build: {
      manifest: true,
      emptyOutDir: true,
      outDir: resolve(OUTPUT_DIR),
      rollupOptions: {
        input: {
          demoBlock1: join(INPUT_DIR, '/js/apps/demoBlock1.js'),
        },
      },
    },
  };
});
