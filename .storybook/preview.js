/** @type { import('@storybook/server').Preview } */
const preview = {
  parameters: {
    server: {
      url: "https://d9.ddev.site",
    },
    actions: { argTypesRegex: "^on[A-Z].*" },
    controls: {
      matchers: {
        color: /(background|color)$/i,
        date: /Date$/i,
      },
    },
  },
};

export default preview;
