# Scripts and Tools Documentation

This document explains the various scripts and tools available in this micro-frontend project.

## Root Level Scripts

The root [package.json](../package.json) contains convenience scripts for managing both applications:

### Installation Scripts

- `npm install` - Installs dependencies for both host and remote applications using the postinstall hook
- `npm run install:host` - Installs dependencies for the host application only
- `npm run install:remote` - Installs dependencies for the remote application only

### Development Scripts

- `npm run dev` - Starts both applications concurrently using [concurrently](https://www.npmjs.com/package/concurrently)
- `npm run dev:host` - Starts only the host application
- `npm run dev:remote` - Starts only the remote application

### Documentation Scripts

- `npm run docs` - Displays information about where to find documentation

## Application Level Scripts

Each application (host and remote) has its own set of scripts defined in their respective package.json files.

### Common Scripts

- `npm run dev` - Starts the development server with hot module replacement
- `npm run build` - Creates a production build
- `npm run preview` - Previews the production build locally
- `npm run lint` - Runs ESLint to check for code quality issues

### Remote Specific Scripts

- `npm run serve` - Serves the production build using [serve](https://www.npmjs.com/package/serve)

## Convenience Scripts

### PowerShell Script (Windows)

[start-all.ps1](../start-all.ps1) - A PowerShell script that starts both applications in separate terminals:

```powershell
.\start-all.ps1
```

### Bash Script (Linux/Mac)

[start-all.sh](../start-all.sh) - A bash script that starts both applications:

```bash
./start-all.sh
```

## Package Management

This project uses npm for package management. The dependency structure is:

1. Root level: Contains only development dependencies needed for managing both projects
2. Host application: Contains dependencies specific to the host application
3. Remote application: Contains dependencies specific to the remote application

Shared dependencies (react, react-dom, zustand) are declared in both applications and configured as shared in the Module Federation configuration.

## Development Tools

### Vite

Both applications use [Vite](https://vitejs.dev/) as their build tool and development server. Vite provides:

- Fast cold start
- Instant hot module replacement (HMR)
- Rich built-in features
- Highly extensible plugin system

### Module Federation

The [@originjs/vite-plugin-federation](https://github.com/originjs/vite-plugin-federation) plugin enables Module Federation in Vite applications, allowing:

- Sharing of components between applications
- Sharing of state management stores
- Runtime integration of separately built applications

### Zustand

[Zustand](https://github.com/pmndrs/zustand) is used for state management in the remote application. It provides:

- Simple and lightweight state management
- Persistence middleware for localStorage integration
- Easy sharing of state between applications

### ESLint

Both applications are configured with [ESLint](https://eslint.org/) for code quality enforcement. The configuration includes:

- React-specific rules
- React Hooks rules
- Code formatting guidelines