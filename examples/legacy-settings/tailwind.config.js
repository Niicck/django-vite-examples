/**
 * This is a minimal config.
 *
 * If you need the full config, get it from here:
 * https://unpkg.com/browse/tailwindcss@latest/stubs/defaultConfig.stub.js
 */

module.exports = {
  content: [
    /**
     * HTML. Paths to Django template files that will contain Tailwind CSS classes.
     *
     * Templates in django project (BASE_DIR/<any_app_name>/templates).
     * Adjust the following line to match your project structure.
     */
    'demo/**/templates/**/*.html',

    /**
     * JS: If you use Tailwind CSS in JavaScript, uncomment the following lines and make sure
     * patterns match your project structure.
     */
    /* JS 1: Ignore any JavaScript in node_modules folder. */
    '!**/node_modules',
    /* JS 2: Process all JavaScript files in the project. */
    'demo/**/*.{js,jsx,ts,tsx,vue}',

    /**
     * Python: If you use Tailwind CSS classes in Python, uncomment the following line
     * and make sure the pattern below matches your project structure.
     */
    'demo/**/*.py',
  ],
};
