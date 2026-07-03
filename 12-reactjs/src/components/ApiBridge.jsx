import { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { registerApiHandlers } from '../services/api';
import { useAlert } from '../context/AlertContext';
import { useAuth } from '../context/AuthContext';

export default function ApiBridge() {
  const { showAlert } = useAlert();
  const { logout } = useAuth();
  const navigate = useNavigate();

  useEffect(() => {
    registerApiHandlers({
      showAlert,
      logout: () => {
        logout();
        navigate('/login', { replace: true });
      },
    });
  }, [showAlert, logout, navigate]);

  return null;
}
