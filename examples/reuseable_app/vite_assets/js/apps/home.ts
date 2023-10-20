import 'vite/modulepreload-polyfill'; // required for vite entrypoints

import { createApp, defineComponent } from 'vue';
import Home from '@/js/components/Home.vue';

const RootComponent = defineComponent({
  delimiters: ['[[', ']]'],
  components: {
    'home': Home,
  },
});

const app = createApp(RootComponent);
app.mount('#home-vue-app');

export {};