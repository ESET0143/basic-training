import React, { useState } from 'react';

const LoginComponent = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');

  const onLoginHandler = (e) => {
    e.preventDefault(); // Prevent form submission
    console.log("Login Clicked");
    console.log("Username:", username);
    console.log("Password:", password);
  };
  

  return (
    <div>
      <h2>Login Form</h2>
      
      {/* Wrap inputs in a form with onSubmit handler */}
      <form onSubmit={onLoginHandler}>
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

        {/* Login button - now of type submit */}
        <button type="submit">
          submit
        </button>
      </form>
    </div>
  );
};

export default LoginComponent;