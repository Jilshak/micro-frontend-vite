# Module Documentation

## Overview

This document describes the modules exposed by the remote application and consumed by the host application.

## Exposed Modules

### Button Component

**Location**: `remote/src/Button.jsx`

A simple button component that can be imported and used by the host application.

**Usage in Host Application**:
```jsx
import Button from "remoteApp/Button";

function App() {
  return (
    <div>
      <Button />
    </div>
  );
}
```

**Props**: None

### Zustand Store

**Location**: `remote/src/store.js`

A Zustand store with persistence that manages a counter state. This store is exposed for consumption by the host application, allowing shared state management between both applications.

**Exposed Functions**:
- `count`: Current count value
- `increment()`: Increases the count by 1
- `decrement()`: Decreases the count by 1
- `setCount(newCount)`: Sets the count to a specific value

**Usage in Host Application**:
```jsx
import useStore from 'remoteApp/store';

function App() {
  const { count, increment, decrement, setCount } = useStore();
  
  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => increment()}>Increment</button>
      <button onClick={() => decrement()}>Decrement</button>
      <button onClick={() => setCount(0)}>Reset</button>
    </div>
  );
}
```

**Persistence**: The store uses `localStorage` to persist the count value between sessions.

## Module Federation Configuration

### Remote Application

In `remote/vite.config.js`:

```javascript
federation({
  name: 'remoteApp',
  filename: 'remoteEntry.js',
  exposes: {
    './Button': './src/Button',
    './store': './src/store'
  },
  shared: {
    ...deps,
    react: {
      singleton: true,
      requiredVersion: deps.react,
    },
    'react-dom': {
      singleton: true,
      requiredVersion: deps['react-dom'],
    },
    zustand: {
      singleton: true,
      requiredVersion: deps.zustand,
    },
  },
})
```

### Host Application

In `host/vite.config.js`:

```javascript
federation({
  name: 'hostApp',
  filename: 'remoteEntry.js',
  remotes: {
    remoteApp: 'http://localhost:5001/assets/remoteEntry.js',
  },
  shared: {
    ...deps,
    react: {
      singleton: true,
      requiredVersion: deps.react,
    },
    'react-dom': {
      singleton: true,
      requiredVersion: deps['react-dom'],
    },
  },
})
```

## Adding New Modules

To add a new module to be exposed:

1. Create the module in `remote/src/`
2. Add it to the `exposes` configuration in `remote/vite.config.js`
3. Consume it in the host application using the import syntax:
   ```javascript
   import ModuleName from "remoteApp/ModuleName";
   ```

## Shared Dependencies

The following dependencies are configured as shared to prevent duplication:

- `react`: Ensures both applications use the same React instance
- `react-dom`: Ensures both applications use the same ReactDOM instance
- `zustand`: Ensures both applications use the same Zustand instance for proper state sharing

The `singleton: true` configuration ensures that only one instance of each shared dependency exists at runtime.