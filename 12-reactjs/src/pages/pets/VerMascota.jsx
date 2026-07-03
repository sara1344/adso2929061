import { useCallback, useEffect, useState } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import { HiOutlineArrowLeft, HiOutlineSearch } from 'react-icons/hi';
import PetLayout from '../../components/PetLayout';
import { useAlert } from '../../context/AlertContext';
import { getPetImageUrl } from '../../config/api';
import { useApi } from '../../services/api';
import '../../styles/pets.css';

export default function VerMascota() {
  const { id } = useParams();
  const [pet, setPet] = useState(null);
  const [loading, setLoading] = useState(true);
  const { request } = useApi();
  const { showAlert } = useAlert();
  const navigate = useNavigate();

  const loadPet = useCallback(async () => {
    setLoading(true);
    try {
      const { data, ok } = await request(`/pets/show/${id}`);
      if (!ok && data.message) showAlert(data.message);
      if (ok) setPet(data.Pet);
    } catch {
      navigate('/dashboard');
    } finally {
      setLoading(false);
    }
  }, [id, request, showAlert, navigate]);

  useEffect(() => {
    loadPet();
  }, [loadPet]);

  if (loading) {
    return (
      <PetLayout>
        <p className="pets-loading">Cargando...</p>
      </PetLayout>
    );
  }

  if (!pet) return null;

  const details = [
    ['Nombre', pet.name],
    ['Tipo', pet.kind],
    ['Peso (Kg)', pet.weight],
    ['Edad (años)', pet.age],
    ['Raza', pet.breed],
    ['Ubicación', pet.location],
    ['Descripción', pet.description],
  ];

  return (
    <PetLayout>
      <div className="pets-header">
        <button type="button" className="pets-back-btn" onClick={() => navigate('/dashboard')} aria-label="Volver">
          <HiOutlineArrowLeft size={22} />
        </button>
        <span className="pets-header-icon">
          <HiOutlineSearch />
        </span>
        <h2>Ver mascota</h2>
      </div>

      <div className="pets-view-card">
        <img src={getPetImageUrl(pet.image)} alt={pet.name} className="pets-view-image" />

        <div className="pets-detail-list">
          {details.map(([label, value]) => (
            <div className="pets-detail-row" key={label}>
              <span className="pets-detail-label">{label}</span>
              <span className="pets-detail-value">{value ?? '—'}</span>
            </div>
          ))}
        </div>
      </div>
    </PetLayout>
  );
}
