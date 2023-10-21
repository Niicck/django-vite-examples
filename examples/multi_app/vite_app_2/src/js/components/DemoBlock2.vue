<template>
    <div class="relative flex items-center space-x-3 rounded-lg border-4 border-amber-600 bg-yellow-100 px-6 py-5 shadow-sm ring-amber-600 hover:ring hover:ring-offset-2">
        <div class="my-5 text-base leading-7 space-y-3">
            <p>
                This vue component was loaded from the <strong>vite_app_2</strong> app in the DJANGO_VITE settings.
            </p>
            <p>
                It is being loaded from the <strong>production build</strong> that has been collected into the <code>django_app/staticfiles/</code> directory.

                You can edit this component in:
            </p>
            <p>
                <code>examples/multi_app/vite_app_2/src/js/components/DemoBlock2.vue</code>
            </p>
            <p>
                But you won't see any changes until you re-build your vite assets with:
            </p>
            <p>
                <code>make multi-app-demo</code>
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