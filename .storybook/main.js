/** @type { import('@storybook/server-webpack5').StorybookConfig } */
const config = {
  stories: [
    "../stories/**/*.mdx",
    "../stories/**/*.stories.@(json|yaml|yml)",
    '../web/themes/**/*.stories.mdx',
    '../web/themes/**/*.stories.@(json|yml)',
    '../web/modules/**/*.stories.mdx',
    '../web/modules/**/*.stories.@(json|yml)',
  ],
  addons: [
    "@storybook/addon-links",
    "@storybook/addon-essentials",
    '@lullabot/storybook-drupal-addon',
  ],
  framework: {
    name: "@storybook/server-webpack5",
    options: {
      builder: {
        useSWC: true,
      },
    },
  },
  docs: {
    autodocs: "tag",
  },
};
export default config;
