import React, { useState } from 'react';

const LoginComponent = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');

  const onLoginHandler = () => {
    console.log("Login Clicked");
    console.log("Username:", username);
    console.log("Password:", password);
  };

  return (
    <div>
      <h2>Login Form</h2>
      
      {/* Username input */}
      <div>
        Username:
        <input 
          type="text" 
          placeholder="Enter username" 
          value={username} 
          onChange={(e) => setUsername(e.target.value)} 
        />
      </div>

      {/* Password input */}
      <div>
        Password:
        <input 
          type="password" 
          placeholder="Enter password" 
          value={password} 
          onChange={(e) => setPassword(e.target.value)} 
        />
      </div>

      {/* Login button */}
      <button onClick={onLoginHandler}>
        Login
      </button>

      {/* Show current values
      <div>
        <p>Current Username: {username}</p>
        <p>Current Password: {password}</p>
      </div> */}
    </div>
  );
};

export default LoginComponent;