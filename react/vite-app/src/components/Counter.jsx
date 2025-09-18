import React, { useState, useEffect } from 'react';

function Counter() {
  const [count, setCount] = useState(0);

  // This effect runs after every render
  useEffect(() => {
    document.title = `You clicked ${count} times`;
  }); // No dependency array

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}

export default Counter;