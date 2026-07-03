import { useCallback, useEffect, useState } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import { HiOutlineArrowLeft } from 'react-icons/hi';
import { FaPaw } from 'react-icons/fa';
import PetLayout from '../../components/PetLayout';
import PetPhotoChange from '../../components/PetPhotoChange';
import PetFormField from '../../components/PetFormField';
import { useAlert } from '../../context/AlertContext';
import { getPetImageUrl } from '../../config/api';
import { useApi } from '../../services/api';
import '../../styles/pets.css';

const formFields = [
  ['name', 'Nombre', 'text'],
  ['kind', 'Tipo', 'text'],
  ['weight', 'Peso (Kg)', 'number'],
  ['age', 'Edad (años)', 'number'],
  ['breed', 'Raza', 'text'],
  ['location', 'Ubicación', 'text'],
  ['description', 'Descripción', 'textarea'],
];

export default function EditarMascota() {
  const { id } = useParams();
  const [form, setForm] = useState(null);
  const [photo, setPhoto] = useState(null);
  const [preview, setPreview] = useState('');
  const [originPhoto, setOriginPhoto] = useState('no-image.png');
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const { request } = useApi();
  const { showAlert } = useAlert();
  const navigate = useNavigate();

  const loadPet = useCallback(async () => {
    setLoading(true);
    try {
      const { data, ok } = await request(`/pets/show/${id}`);
      if (!ok && data.message) showAlert(data.message);
      if (ok && data.Pet) {
        const pet = data.Pet;
        setForm({
          name: pet.name,
          kind: pet.kind,
          weight: pet.weight,
          age: pet.age,
          breed: pet.breed,
          location: pet.location,
          description: pet.description,
          active: pet.active,
          status: pet.status,
        });
        setOriginPhoto(pet.image);
        setPreview(getPetImageUrl(pet.image));
      }
    } catch {
      navigate('/dashboard');
    } finally {
      setLoading(false);
    }
  }, [id, request, showAlert, navigate]);

  useEffect(() => {
    loadPet();
  }, [loadPet]);

  const handleChange = (e) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const handlePhoto = (e) => {
    const file = e.target.files[0];
    setPhoto(file || null);
    if (file) setPreview(URL.createObjectURL(file));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setSaving(true);

    const formData = new FormData();
    Object.entries(form).forEach(([key, value]) => formData.append(key, value));
    formData.append('originphoto', originPhoto);
    if (photo) formData.append('photo', photo);

    try {
      const { data, ok } = await request(`/pets/edit/${id}`, {
        method: 'POST',
        body: formData,
      });

      if (data.message) showAlert(data.message);
      if (ok) navigate('/dashboard');
    } catch {
      // manejado por apiRequest
    } finally {
      setSaving(false);
    }
  };

  if (loading || !form) {
    return (
      <PetLayout>
        <p className="pets-loading">Cargando...</p>
      </PetLayout>
    );
  }

  return (
    <PetLayout>
      <div className="pets-header">
        <button type="button" className="pets-back-btn" onClick={() => navigate('/dashboard')} aria-label="Volver">
          <HiOutlineArrowLeft size={22} />
        </button>
        <span className="pets-header-icon">
          <FaPaw />
        </span>
        <h2>Editar una mascota</h2>
      </div>

      <form className="pets-form" onSubmit={handleSubmit}>
        <div className="pets-view-card">
          {preview && (
            <PetPhotoChange
              src={preview}
              alt={form.name}
              onChange={handlePhoto}
              inputId={`edit-photo-${id}`}
              disabled={saving}
            />
          )}

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
            <button type="submit" className="pets-btn pets-btn-success pets-btn-gradient" disabled={saving}>
              {saving ? 'Guardando...' : 'Guardar'}
            </button>
          </div>
        </div>
      </form>
    </PetLayout>
  );
}
