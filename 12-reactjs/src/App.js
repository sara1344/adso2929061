import { BrowserRouter, Navigate, Routes, Route } from 'react-router-dom';
import './App.css';

import { AlertProvider } from './context/AlertContext';
import { AuthProvider, useAuth } from './context/AuthContext';
import ApiBridge from './components/ApiBridge';
import { GuestRoute, ProtectedRoute, getCurrentRoute } from './components/ProtectedRoute';

import Menu from './components/Menu';
import Example1Components from './pages/Example1Components';
import Example2JSX from './pages/Example2JSX';
import Example3Props from './pages/Example3Props';
import Example4StateHooks from './pages/Example4StateHooks';
import Example5Events from './pages/Example5Events';
import Example6ConditionalLists from './pages/Example6ConditionalLists';
import Example7Routing from './pages/Example7Routing';
import Example8DataFetching from './pages/Example8DataFetching';

import Login from './pages/pets/Login';
import Dashboard from './pages/pets/Dashboard';
import AgregarMascota from './pages/pets/AgregarMascota';
import VerMascota from './pages/pets/VerMascota';
import EditarMascota from './pages/pets/EditarMascota';

function RootRedirect() {
  const { isAuthenticated } = useAuth();
  return <Navigate to={isAuthenticated ? getCurrentRoute() : '/login'} replace />;
}

function App() {
  return (
    <BrowserRouter>
      <AuthProvider>
        <AlertProvider>
          <ApiBridge />
          <div className="App">
            <Routes>
              <Route path="/" element={<RootRedirect />} />
              <Route
                path="/login"
                element={
                  <GuestRoute>
                    <Login />
                  </GuestRoute>
                }
              />
              <Route
                path="/dashboard"
                element={
                  <ProtectedRoute>
                    <Dashboard />
                  </ProtectedRoute>
                }
              />
              <Route
                path="/agregarMascota"
                element={
                  <ProtectedRoute>
                    <AgregarMascota />
                  </ProtectedRoute>
                }
              />
              <Route
                path="/verMascota/:id"
                element={
                  <ProtectedRoute>
                    <VerMascota />
                  </ProtectedRoute>
                }
              />
              <Route
                path="/editarMascota/:id"
                element={
                  <ProtectedRoute>
                    <EditarMascota />
                  </ProtectedRoute>
                }
              />

              <Route path="/examples" element={<Menu />} />
              <Route path="/example1" element={<Example1Components />} />
              <Route path="/example2" element={<Example2JSX />} />
              <Route path="/example3" element={<Example3Props />} />
              <Route path="/example4" element={<Example4StateHooks />} />
              <Route path="/example5" element={<Example5Events />} />
              <Route path="/example6" element={<Example6ConditionalLists />} />
              <Route path="/example7/*" element={<Example7Routing />} />
              <Route path="/example8" element={<Example8DataFetching />} />
            </Routes>
          </div>
        </AlertProvider>
      </AuthProvider>
    </BrowserRouter>
  );
}

export default App;
