const counter = (state = 0, action) => {
  switch (action.type) {
  case 'INCREMENT':
    return state + 1
  case 'DECREMENT':
    return state - 1
  default:
    return state
  }
}

// Create a Redux store holding the state of your app.
// Its API is { subscribe, dispatch, getState }.
const { createStore } = Redux;
const store = createStore(counter);

// You can subscribe to the updates manually, or use bindings to your view layer.
const Counter = ({
    value,
    onIncrement,
    onDecrement
}) => (
    <div>
        <h1>{value}</h1>
        <button onClick = {onIncrement}>+</button>
        <button onClick = {onDecrement}>-</button>
    </div>
);

const render = () => {
    ReactDOM.render(
        <Counter
            value = {store.getState()}
            onIncrement = {() => store.dispatch({ type: 'INCREMENT'})}
            onDecrement = {() => store.dispatch({ type: 'DECREMENT'})}
        />,
        document.getElementById('root')
    );
};

store.subscribe(render);
