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
  const env = loadEnv(mode, process.cwd(), '');

  const INPUT_DIR = './demo/vite_assets';
  const OUTPUT_DIR = env.BUILD_VITE_OUTPUT_DIR;

  return {
    plugins: [vue()],
    resolve: {
      alias: {
        '@': resolve(INPUT_DIR),
        'vue': 'vue/dist/vue.esm-bundler.js',
      },
    },
    root: resolve(INPUT_DIR),
    base: '/static/',
    css: {
      postcss: postcssConfig,
    },
    server: {
      host: env.DJANGO_VITE_DEV_SERVER_HOST,
      port: env.DJANGO_VITE_DEV_SERVER_PORT,
    },
    build: {
      manifest: true,
      emptyOutDir: true,
      target: 'es2015',
      outDir: resolve(OUTPUT_DIR),
      rollupOptions: {
        input: {
          home: join(INPUT_DIR, '/js/apps/home.js'),
          css: join(INPUT_DIR, '/css/main.css.js'),
        },
        output: {
          chunkFileNames: undefined,
        },
      },
    },
  };
});
