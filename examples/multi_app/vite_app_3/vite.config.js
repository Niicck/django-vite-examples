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
  const OUTPUT_DIR = join('dist', env.APP3_STATIC_URL_PREFIX);

  return {
    plugins: [vue()],
    resolve: {
      alias: {
        '@': resolve(INPUT_DIR),
        'vue': 'vue/dist/vue.esm-bundler.js',
      },
    },
    root: resolve(INPUT_DIR),
    base: join('/static/', env.APP3_STATIC_URL_PREFIX),
    css: {
      postcss: postcssConfig,
    },
    server: {
      host: env.DEFAULT_DEV_SERVER_HOST,
      port: env.APP3_DEV_SERVER_PORT,
    },
    build: {
      manifest: true,
      emptyOutDir: true,
      target: 'es2015',
      outDir: OUTPUT_DIR,
      rollupOptions: {
        input: {
          demoBlock3: resolve(INPUT_DIR, '/js/apps/demoBlock3.js'),
        },
        output: {
          chunkFileNames: undefined,
        },
      },
    },
  };
});
