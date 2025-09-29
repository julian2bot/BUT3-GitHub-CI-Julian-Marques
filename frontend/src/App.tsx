import React, { useEffect } from "react";
import { Constants } from "./constants";

interface AppProps { }

interface AppState {
  apiEnv: string,
  firstName: string,
  lastName: string
}

const App: React.FC<AppProps> = () => {
  const [state, setState] = React.useState<AppState>({
    apiEnv: "",
    firstName: "",
    lastName: ""
  });

  useEffect(() => {

    fetch(`${Constants.API_BASE_URL}/api/v1/config`)
      .then(response => {
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        return response.json();
      })
      .then(data => {
        if (data.is_success === false) {
          setState({
            firstName: "Error when loading back-end (success: false)",
            lastName: "Error when loading back-end (success: false)",
            apiEnv: "Error when loading back-end (success: false)"
          });
          throw new Error(`API error! message: ${data.message}`);
        }

        console.log(data);
        setState({
          firstName: data.data.firstName,
          lastName: data.data.lastName,
          apiEnv: data.data.environment
        });
      })
      .catch(error => {
        console.error('There was a problem with the fetch operation:', error);
        setState({
          firstName: "Error when loading back-end",
          lastName: "Error when loading back-end",
          apiEnv: "Error when loading back-end"
        });
      });

  }, []);


  function render() {
    return (
      <div className="min-h-screen">
        <header className="w-full bg-green-100">
          <div className="mx-auto px-4 py-4">
            <h1 className="text-left text-green-800 text-xl font-semibold">
              {Constants.FIRSTNAME} {Constants.LASTNAME}
            </h1>
          </div>
        </header>
        <main className="p-6">
          <div className="border-b border-gray-300 mb-4 pb-2">
            <h2 className="text-2xl font-bold text-black">Data from front-end</h2>
          </div>
          <p id="api-url" className="text-black">API: <em>{Constants.API_BASE_URL}</em></p>
          <p id="first-name-frontend" className="text-black">First Name: <em>{Constants.FIRSTNAME}</em></p>
          <p id="last-name-frontend" className="text-black">Last Name: <em>{Constants.LASTNAME}</em></p>

          <div className="border-b border-gray-300 mt-8 mb-4 pb-2">
            <h2 className="text-2xl font-bold text-black">Data from back-end</h2>
          </div>
          <p id="env-backend" className="text-black">Environment: <em>{state.apiEnv}</em></p>
          <p id="first-name-backend" className="text-black">First Name: <em>{state.firstName}</em></p>
          <p id="last-name-backend" className="text-black">Last Name: <em>{state.lastName}</em></p>
        </main>
      </div>
    )
  }
  return render();

}

export default App
