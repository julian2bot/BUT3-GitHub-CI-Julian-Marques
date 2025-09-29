import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.tsx'
import { Constants } from './constants';

const root = createRoot(document.getElementById('root')!);

async function init() {
  try {
    await Constants.loadConfig(); // charger config avant de rendre App
    root.render(
      <StrictMode>
        <App />
      </StrictMode>
    );
  } catch (err) {
    console.error("Failed to load config:", err);
    // Optionnel : afficher un fallback UI
  }
}

init();