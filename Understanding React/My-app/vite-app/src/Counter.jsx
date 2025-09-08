import { useState } from "react";

function Counter() {
    const [count, setCount] = useState(0);

    const increment = () => {
        setCount(count + 1);
    };

    // // Example object destructuring
    // const user = {
    //     name: "surendra",
    //     info: {
    //         city: "guntur",
    //         age: 21,
    //     }
    // };

    // const { name: userName = 'aron', info: { city } } = user;
    // console.log(userName);

    // let a=10;
    // let b=20;
    //  [a, b] = [b, a];
    // console.log(a, b);
    const prev ={name:"suru",age:21};
    const next = { ...prev, city: "guntur" };
    console.log(prev);
    console.log(next);



    return (
        <div>
            <h1 id="c1">{count}</h1>
            <button onClick={increment}>INC</button>
        </div>
    );
}

export default Counter;