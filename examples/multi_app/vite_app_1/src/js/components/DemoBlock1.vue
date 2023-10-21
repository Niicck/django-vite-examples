<template>
    <div class="relative flex items-center space-x-3 rounded-lg border-4 border-green-600 bg-emerald-100 px-6 py-5 shadow-sm ring-green-600 hover:ring hover:ring-offset-2">
        <div class="my-5 text-base leading-7 space-y-3">
            <p>
                This vue component was loaded from <strong>vite_app_1</strong> in the DJANGO_VITE settings.
            </p>
            <p>
                It is being loaded with <strong>hot-module-reloading</strong> from vite_app_1's dev server.

                You can see your changes in real time if you edit the code in:
            </p>
            <p>
                <code>examples/multi_app/vite_app_1/src/js/components/DemoBlock1.vue</code>
            </p>
        </div>
    </div>
</template>
<style scoped>
    @import 'tailwindcss/base';
    @import 'tailwindcss/components';
    @import 'tailwindcss/utilities';

    code {
       @apply bg-gray-100; 
    }
</style>