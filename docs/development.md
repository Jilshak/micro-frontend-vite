# Development Guide

## Prerequisites

- Node.js (v14 or higher)
- npm or yarn

## Setup Instructions

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd micro-frontend-vite
   ```

2. Install dependencies for both applications:

   ```bash
   # Install dependencies for host application
   cd host
   npm install
   cd ..
   
   # Install dependencies for remote application
   cd remote
   npm install
   cd ..
   ```

## Running the Applications

### Development Mode

To run both applications in development mode:

1. Start the remote application first:
   ```bash
   cd remote
   npm run dev
   ```
   The remote application will be available at http://localhost:5001

2. In a separate terminal, start the host application:
   ```bash
   cd host
   npm run dev
   ```
   The host application will be available at http://localhost:3000

### Production Build

To build both applications for production:

1. Build the remote application:
   ```bash
   cd remote
   npm run build
   ```

2. Build the host application:
   ```bash
   cd host
   npm run build
   ```

### Preview Production Build

To preview the production builds:

1. Preview the remote application:
   ```bash
   cd remote
   npm run preview
   ```

2. Preview the host application:
   ```bash
   cd host
   npm run preview
   ```

## Adding New Exposed Modules

To expose new modules from the remote application:

1. Create your component or module in the `remote/src` directory
2. Update `remote/vite.config.js` to expose the new module:
   ```javascript
   federation({
     // ... other config
     exposes: {
       './Button': './src/Button',
       './store': './src/store',
       './NewComponent': './src/NewComponent'  // Add this line
     }
   })
   ```
3. Import and use the module in the host application:
   ```javascript
   import NewComponent from "remoteApp/NewComponent";
   ```

## Shared Dependencies

Both applications share these dependencies to avoid duplication:
- react
- react-dom
- zustand

When adding new dependencies, consider whether they should be shared between applications. Add shared dependencies to both `vite.config.js` files.

## Troubleshooting

### Common Issues

1. **Modules not loading**: Ensure the remote application is running before starting the host application
2. **CORS errors**: The applications are configured with CORS headers, but if you encounter issues, check the server configuration in `vite.config.js`
3. **Port conflicts**: If ports 3000 or 5001 are in use, update the port configuration in the respective `vite.config.js` files

### Debugging Tips

1. Check browser developer tools for network and console errors
2. Verify that `remoteEntry.js` is accessible at http://localhost:5001/assets/remoteEntry.js
3. Ensure both applications are using compatible versions of shared dependencies