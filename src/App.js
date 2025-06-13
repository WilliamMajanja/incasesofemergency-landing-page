// src/App.js
import React from 'react';
import './App.css'; // We'll add some CSS here

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <h1>In Cases Of Emergency</h1>
        <p>Your Go-To Resource for Critical Situations.</p>
        <button className="cta-button">Learn More</button>
      </header>

      <section className="features-section">
        <h2>What We Offer</h2>
        <div className="feature-grid">
          <div className="feature-item">
            <h3>Emergency Guides</h3>
            <p>Step-by-step instructions for various emergencies.</p>
          </div>
          <div className="feature-item">
            <h3>Resource Locator</h3>
            <p>Find nearby hospitals, police stations, and shelters.</p>
          </div>
          <div className="feature-item">
            <h3>Safety Tips</h3>
            <p>Proactive advice to prevent and mitigate risks.</p>
          </div>
        </div>
      </section>

      <footer className="App-footer">
        <p>&copy; {new Date().getFullYear()} In Cases Of Emergency. All rights reserved.</p>
        <div className="footer-links">
          <a href="#privacy">Privacy Policy</a> | <a href="#terms">Terms of Service</a>
        </div>
      </footer>
    </div>
  );
}

export default App;
