/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./templates/**/*.html",
    "./miniCSS/**/*.html",
    "./docs/**/*.html"
  ],
  theme: {
    extend: {
      order: {
        '23': '23',
        '21': '21',
        '20': '20',
        '19': '19',
        '18': '18',
        '17': '17',
        '16': '16',
        '15': '15',
        '14': '14',
        '13': '13',
        '12': '12',
        '11': '11'
      }
    },
    screens: {
      'xs': '480px',
      'sm': '640px',
      'md': '768px',
      'lg': '1024px',
      'xl': '1280px',
      '2xl': '1536px',
    }
  },
  plugins: [],
}
