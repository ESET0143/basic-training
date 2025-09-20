// Parent Component
import React, { useState } from 'react';

const ParentComponent = () => {
  const [count, setCount] = useState(0);

  const increment = () => {
    setCount(count + 1);
  };

  const decrement = () => {
    setCount(count - 1);
  };

  return (
    <div>
      <h2>Parent Component</h2>
      <p>Current Count: {count}</p>
      
      {/* Prop drilling - passing count and functions down to children */}
      <ChildComponentA 
        count={count} 
        onIncrement={increment} 
        onDecrement={decrement} 
      />
      
      <ChildComponentB count={count} />
    </div>
  );
};

// Child Component A (Sibling 1)
const ChildComponentA = ({ count, onIncrement, onDecrement }) => {
  return (
    <div>
      <h3>Child Component A</h3>
      <p>Received count from parent: {count}</p>
      <button onClick={onIncrement}>+</button>
      <button onClick={onDecrement}>-</button>
    </div>
  );
};

// Child Component B (Sibling 2)
const ChildComponentB = ({ count }) => {
  return (
    <div>
      <h3>Child Component B</h3>
      <p>Also received count from parent: {count}</p>
      <p>Count squared: {count * count}</p>
    </div>
  );
};

export default ParentComponent;