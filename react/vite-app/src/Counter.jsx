import { useState } from "react";

function Counter() {
    const [count, setCount] = useState(0);

    const increment = () => {
        setCount(count + 1);
    };
    return (
        <div>
            <h1 id="c1">{count}</h1>
            <button onClick={increment}>INC</button>
        </div>
    );
}

export default Counter;