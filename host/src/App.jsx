import './App.css';
import Button from "remoteApp/Button";
import useStore from 'remoteApp/store';

function App() {

  const { count, increment } = useStore()

  return (
    <>
      <h1>This is the Host Application</h1>
      <h1>This is the count from the remote: {count}</h1>
      <Button /> <br />
      <button style={{ margin: "20px" }} onClick={() => increment(1)}>button From host application but increment method from remote</button>
    </>
  )
}

export default App
