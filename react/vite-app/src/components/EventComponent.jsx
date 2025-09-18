import React from 'react';

// The JSX for the class-based component is returned from the render() method.
class EventComponent extends React.Component {
  constructor(props) {
    super(props);
    // Initialize the component's state in the constructor
    this.state = {
      inputValue: '',
    };
    
    // Bind the event handler to the component instance
    this.onchangeHandler = this.onchangeHandler.bind(this);
  }

  onchangeHandler(event) {
    // Update the state using this.setState()
    this.setState({
      inputValue: event.target.value,
    });
    console.log("value", event.target.value);
  }

  // The JSX for the component is inside the return statement of the render() method.
  render() {
    return (
      <div>
        <h2>EventComponents</h2>
        <input 
          type="text" 
          // Use this.state to access the current state value
          value={this.state.inputValue}
          // Pass the bound handler to the onChange prop
          onChange={this.onchangeHandler} 
        />
        <h3>Current Input Value: {this.state.inputValue}</h3>
      </div>
    );
  }
}

export default EventComponent;
