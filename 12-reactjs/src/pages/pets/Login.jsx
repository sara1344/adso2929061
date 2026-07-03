import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { HiOutlineKey, HiOutlineMail } from 'react-icons/hi';
import PetLayout from '../../components/PetLayout';
import { HomePawIcon } from '../../components/PetIcons';
import { useAlert } from '../../context/AlertContext';
import { useAuth } from '../../context/AuthContext';
import { apiRequest } from '../../services/api';
import '../../styles/pets.css';

export default function Login() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [loading, setLoading] = useState(false);
  const { login } = useAuth();
  const { showAlert } = useAlert();
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);

    try {
      const { data, ok } = await apiRequest('/login', {
        method: 'POST',
        skipAuth: true,
        body: JSON.stringify({ email, password }),
      });

      if (data.message) {
        showAlert(data.message);
      }

      if (ok && data.token) {
        login(data.token, data.user);
        navigate('/dashboard', { replace: true });
      }
    } catch {
      // errores de red
    } finally {
      setLoading(false);
    }
  };

  return (
    <PetLayout variant="login">
      <div className="pets-login-brand">
        <div className="pets-brand-icon">
          <HomePawIcon size={52} />
        </div>
        <h1>Bienvenido</h1>
        <p className="pets-subtitle">Inicia sesión para continuar</p>
      </div>

      <form onSubmit={handleSubmit}>
        <div className="pets-field">
          <label htmlFor="email">Correo</label>
          <div className="pets-input-wrap">
            <span className="pets-input-icon">
              <HiOutlineMail />
            </span>
            <input
              id="email"
              type="email"
              placeholder="Ejemplo@mail.com"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
            />
          </div>
        </div>

        <div className="pets-field">
          <label htmlFor="password">Contraseña</label>
          <div className="pets-input-wrap">
            <span className="pets-input-icon">
              <HiOutlineKey />
            </span>
            <input
              id="password"
              type="password"
              placeholder="Asdf1234$"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
            />
          </div>
        </div>

        <button type="submit" className="pets-btn pets-btn-primary" disabled={loading}>
          {loading ? 'Ingresando...' : 'Ingresar'}
        </button>
      </form>
    </PetLayout>
  );
}
