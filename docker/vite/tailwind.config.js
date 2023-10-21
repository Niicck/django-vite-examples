/**
 * This is a minimal config.
 *
 * If you need the full config, get it from here:
 * https://unpkg.com/browse/tailwindcss@latest/stubs/defaultConfig.stub.js
 */

module.exports = {
  content: [
    /* Process all JavaScript files in django_app. */
    'django_app/**/*.{js,jsx,ts,tsx,vue}',
    'django_app/**/templates/**/*.html',
    'django_app/**/*.py',

    /* Ignore any JavaScript in node_modules folder. */
    '!**/node_modules',

    /* Process all JavaScript files in vite_app src. */
    'src/**/*.{js,jsx,ts,tsx,vue}',
  ],
};
