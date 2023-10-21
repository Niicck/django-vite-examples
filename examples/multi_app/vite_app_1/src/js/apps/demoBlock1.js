import 'vite/modulepreload-polyfill'; // required for vite entrypoints

import { createApp, defineComponent } from 'vue';
import DemoBlock1 from '@/js/components/DemoBlock1.vue';

const RootComponent = defineComponent({
  delimiters: ['[[', ']]'],
  components: {
    'demo-block-1': DemoBlock1
  },
});

const app = createApp(RootComponent);
app.mount('#vue-app-1');

export {};