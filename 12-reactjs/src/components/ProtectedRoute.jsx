import { Navigate, useLocation } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';

const CURRENT_ROUTE_KEY = 'pets_current_route';

export function saveCurrentRoute(path) {
  sessionStorage.setItem(CURRENT_ROUTE_KEY, path);
}

export function getCurrentRoute() {
  return sessionStorage.getItem(CURRENT_ROUTE_KEY) || '/dashboard';
}

export function ProtectedRoute({ children }) {
  const { isAuthenticated } = useAuth();
  const location = useLocation();

  if (!isAuthenticated) {
    return <Navigate to="/login" replace state={{ from: location.pathname }} />;
  }

  saveCurrentRoute(location.pathname);
  return children;
}

export function GuestRoute({ children }) {
  const { isAuthenticated } = useAuth();

  if (isAuthenticated) {
    return <Navigate to={getCurrentRoute()} replace />;
  }

  return children;
}
