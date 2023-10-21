import 'vite/modulepreload-polyfill'; // required for vite entrypoints

import { createApp, defineComponent } from 'vue';
import DemoBlock2 from '@/js/components/DemoBlock2.vue';

const RootComponent = defineComponent({
  delimiters: ['[[', ']]'],
  components: {
    'demo-block-2': DemoBlock2
  },
});

const app = createApp(RootComponent);
app.mount('#vue-app-2');

export {};