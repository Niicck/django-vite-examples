import 'vite/modulepreload-polyfill'; // required for vite entrypoints

import { createApp, defineComponent } from 'vue';
import DemoBlock from '@/js/components/DemoBlock.vue';

const RootComponent = defineComponent({
  delimiters: ['[[', ']]'],
  components: {
    'demo-block': DemoBlock,
  },
});

const app = createApp(RootComponent);
app.mount('#home-vue-app');

export {};