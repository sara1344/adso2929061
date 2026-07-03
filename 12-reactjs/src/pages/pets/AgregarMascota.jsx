import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { HiOutlineArrowLeft } from 'react-icons/hi';
import { FaPaw } from 'react-icons/fa';
import PetLayout from '../../components/PetLayout';
import PetImageUpload from '../../components/PetImageUpload';
import PetFormField from '../../components/PetFormField';
import { useAlert } from '../../context/AlertContext';
import { useApi } from '../../services/api';
import '../../styles/pets.css';

const initialForm = {
  name: '',
  kind: '',
  weight: '',
  age: '',
  breed: '',
  location: '',
  description: '',
};

const formFields = [
  ['name', 'Nombre', 'text'],
  ['kind', 'Tipo', 'text'],
  ['weight', 'Peso (Kg)', 'number'],
  ['age', 'Edad (años)', 'number'],
  ['breed', 'Raza', 'text'],
  ['location', 'Ubicación', 'text'],
  ['description', 'Descripción', 'textarea'],
];

export default function AgregarMascota() {
  const [form, setForm] = useState(initialForm);
  const [photo, setPhoto] = useState(null);
  const [preview, setPreview] = useState('');
  const [loading, setLoading] = useState(false);
  const { request } = useApi();
  const { showAlert } = useAlert();
  const navigate = useNavigate();

  const handleChange = (e) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const handlePhoto = (e) => {
    const file = e.target.files[0];
    setPhoto(file || null);
    setPreview(file ? URL.createObjectURL(file) : '');
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    if (!e.target.checkValidity()) {
      e.target.reportValidity();
      return;
    }

    if (!photo) {
      return;
    }

    setLoading(true);

    const formData = new FormData();
    Object.entries(form).forEach(([key, value]) => formData.append(key, value));
    formData.append('active', '1');
    formData.append('status', '0');
    formData.append('photo', photo);

    try {
      const { data, ok } = await request('/pets/store', {
        method: 'POST',
        body: formData,
      });

      if (data.message) showAlert(data.message);
      if (ok) navigate('/dashboard');
    } catch {
      // manejado por apiRequest
    } finally {
      setLoading(false);
    }
  };

  return (
    <PetLayout>
      <div className="pets-header">
        <button type="button" className="pets-back-btn" onClick={() => navigate('/dashboard')} aria-label="Volver">
          <HiOutlineArrowLeft size={22} />
        </button>
        <span className="pets-header-icon">
          <FaPaw />
        </span>
        <h2>Agregar una mascota</h2>
      </div>

      <form className="pets-form" onSubmit={handleSubmit}>
        <div className="pets-form-card">
          <PetImageUpload preview={preview} onChange={handlePhoto} required />

          {formFields.map(([name, label, type]) => (
            <PetFormField
              key={name}
              id={name}
              name={name}
              label={label}
              type={type}
              value={form[name]}
              onChange={handleChange}
              required
              step={name === 'weight' ? '0.1' : undefined}
            />
          ))}

          <div className="pets-btn-group">
            <button type="button" className="pets-btn pets-btn-cancel" onClick={() => navigate('/dashboard')}>
              Cancelar
            </button>
            <button type="submit" className="pets-btn pets-btn-success pets-btn-gradient" disabled={loading}>
              {loading ? 'Guardando...' : 'Agregar'}
            </button>
          </div>
        </div>
      </form>
    </PetLayout>
  );
}
