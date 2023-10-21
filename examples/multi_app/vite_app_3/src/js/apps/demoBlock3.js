import 'vite/modulepreload-polyfill'; // required for vite entrypoints

import { createApp, defineComponent } from 'vue';
import DemoBlock3 from '@/js/components/DemoBlock3.vue';

const RootComponent = defineComponent({
  delimiters: ['[[', ']]'],
  components: {
    'demo-block-3': DemoBlock3
  },
});

const app = createApp(RootComponent);
app.mount('#vue-app-3');

export {};