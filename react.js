import React, { useState } from "react";

function Counter() {
  // Declare a state variable for count and its corresponding setter function
  const [count, setCount] = useState(0);

  // Function to increment count
  const increment = () => {
    setCount(count + 1);
  };

  // Function to decrement count
  const decrement = () => {
    setCount(count - 1);
  };

  return (
    <div>
      <h1>Counter: {count}</h1>
      <button onClick={increment}>Add 1</button>
      <button onClick={decrement}>Minus 1</button>
    </div>
  );
}

export default Counter;
