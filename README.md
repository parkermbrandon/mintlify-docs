# Echo Test + Measurement Documentation

This repository contains the documentation for Echo Test + Measurement products, built with Mintlify.

## Products Documented

- **ATS-BT Module**: Advanced Bluetooth 5.4 module for acoustic testing with LE Audio support

## Development

### Prerequisites

- Node.js 18+
- npm or yarn

### Installation

Install the Mintlify CLI to preview documentation changes locally:

```bash
npm i -g mint
```

### Running Locally

Run the following command at the root of the documentation:

```bash
mint dev
```

View your local preview at `http://localhost:3000`.

## Structure

```
/
├── products/           # Product documentation
│   └── ats-bt/        # ATS-BT module docs
│       └── quickstart.mdx
├── images/            # Product images and diagrams
├── logo/              # Company logos
├── index.mdx          # Homepage
└── docs.json          # Site configuration
```

## Publishing Changes

Changes are deployed to production automatically after pushing to the default branch.

## Troubleshooting

- If your dev environment isn't running: Run `mint update` to ensure you have the most recent version of the CLI.
- If a page loads as a 404: Make sure you are running in a folder with a valid `docs.json`.

## Support

For technical support: support@echotm.com

## License

© 2024 Echo Test + Measurement. All rights reserved.