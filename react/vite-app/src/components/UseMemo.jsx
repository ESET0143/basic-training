import { useState, useMemo } from 'react';

const ExpensiveCalculationComponent = () => {
  const [count, setCount] = useState(0);
  const [inputValue, setInputValue] = useState('');

  // This is an intentionally slow function to simulate expensive work
  const expensiveCalculation = (num) => {
    console.log('Calculating slowly...');
    for (let i = 0; i < 1_000_000_000; i++) {} // Artificial delay
    return num * 2;
  };

  // WITHOUT useMemo: Calculation runs on every render
  // const calculatedValue = expensiveCalculation(count);

  // WITH useMemo: Calculation only runs if 'count' changes
  const calculatedValue = useMemo(() => {
    return expensiveCalculation(count);
  }, [count]); // Dependency array

  return (
    <div>
      <h2>useMemo Example</h2>
      
      <div>
        <button onClick={() => setCount(count + 1)}>
          Increment Count: {count}
        </button>
        <p>Expensive Calculated Value: <strong>{calculatedValue}</strong></p>
      </div>

      <div>
        <input
          type="text"
          value={inputValue}
          onChange={(e) => setInputValue(e.target.value)}
          placeholder="Type here..."
        />
        <p>You typed: {inputValue}</p>
      </div>
    </div>
  );
};
export default ExpensiveCalculationComponent;