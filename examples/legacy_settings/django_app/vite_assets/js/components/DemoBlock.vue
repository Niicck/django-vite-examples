<template>
    <div class="relative flex items-center space-x-3 rounded-lg border-4 border-green-600 bg-emerald-100 px-6 py-5 shadow-sm ring-green-600 hover:ring hover:ring-offset-2">
        <div class="my-5 text-base leading-7 space-y-3">
            <p>
                This vue component was loaded using <strong>legacy</strong> DJANGO_VITE_* settings.
            </p>
            <p>
                It is being loaded with <strong>hot-module-reloading</strong> from the default vite dev server.

                You can see your changes in real time if you edit the code in:
            </p>
            <p>
                <code>examples/legacy_settings/django_app/vite_assets/js/components/DemoBlock.vue</code>
            </p>
        </div>
    </div>
</template>
<style scoped>
    code {
       @apply bg-gray-100; 
    }
</style>