# Remote Application - Micro-Frontend with Vite

This is the remote application in a micro-frontend architecture using Vite Module Federation. It exposes components and state management for consumption by the host application.

## What This App Does

This remote application exposes:
1. A simple [Button](./src/Button.jsx) component
2. A [Zustand](https://github.com/pmndrs/zustand) store for state management with persistence

These modules can be consumed by other applications (like the host application in this repository) through Vite's Module Federation plugin.

## Getting Started

1. Install dependencies:

```bash
npm install
```

2. Start the development server:

```bash
npm run dev
```

The application will be available at http://localhost:5001

## Exposed Modules

This application exposes the following modules through Module Federation:

1. `./Button` - A simple button component
2. `./store` - A Zustand store with:
   - A count state variable
   - Increment and decrement functions
   - Persistence using localStorage

## Module Federation Configuration

The Module Federation configuration is in [vite.config.js](./vite.config.js):

```javascript
federation({
  name: 'remoteApp',
  filename: 'remoteEntry.js',
  exposes: {
    './Button': './src/Button',
    './store': './src/store'
  },
  shared: {
    // Shared dependencies
  }
})
```

## Shared Dependencies

This application shares the following dependencies with consuming applications:
- react
- react-dom
- zustand

This ensures that these dependencies are not duplicated when the modules are consumed by other applications.