import { useCallback, useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  HiOutlineBell,
  HiOutlineLogout,
  HiOutlinePencil,
  HiOutlinePlus,
  HiOutlineSearch,
  HiOutlineTrash,
} from 'react-icons/hi';
import { BsGrid3X3Gap } from 'react-icons/bs';
import { FaPaw } from 'react-icons/fa';
import PetLayout from '../../components/PetLayout';
import ConfirmModal from '../../components/ConfirmModal';
import { useAlert } from '../../context/AlertContext';
import { useAuth } from '../../context/AuthContext';
import { getPetImageUrl } from '../../config/api';
import { useApi } from '../../services/api';
import '../../styles/pets.css';

export default function Dashboard() {
  const [pets, setPets] = useState([]);
  const [loading, setLoading] = useState(true);
  const [confirmDelete, setConfirmDelete] = useState(null);
  const { request } = useApi();
  const { logout } = useAuth();
  const { showAlert } = useAlert();
  const navigate = useNavigate();

  const loadPets = useCallback(async () => {
    setLoading(true);
    try {
      const { data, ok } = await request('/pets/list');
      if (!ok && data.message) showAlert(data.message);
      if (ok) setPets(data.Pets || []);
    } catch {
      // manejado por apiRequest en 401
    } finally {
      setLoading(false);
    }
  }, [request, showAlert]);

  useEffect(() => {
    loadPets();
  }, [loadPets]);

  const handleLogout = async () => {
    try {
      const { data } = await request('/logout', { method: 'POST' });
      if (data.message) showAlert(data.message);
    } catch {
      // si el token ya expiró, igual cerramos sesión local
    } finally {
      logout();
      navigate('/login', { replace: true });
    }
  };

  const handleDeleteClick = async (id) => {
    try {
      const { data, ok } = await request(`/pets/delete-confirm/${id}`);
      if (data.message && !ok) showAlert(data.message);
      if (ok) {
        setConfirmDelete({
          id,
          message: data.message,
          confirm: data.confirm,
          cancel: data.cancel,
        });
      }
    } catch {
      // manejado por apiRequest
    }
  };

  const handleDeleteConfirm = async () => {
    const { id } = confirmDelete;
    setConfirmDelete(null);

    try {
      const { data, ok } = await request(`/pets/delete/${id}`, { method: 'DELETE' });
      if (data.message) showAlert(data.message);
      if (ok) loadPets();
    } catch {
      // manejado por apiRequest
    }
  };

  return (
    <PetLayout>
      {confirmDelete && (
        <ConfirmModal
          message={confirmDelete.message}
          confirmLabel={confirmDelete.confirm}
          cancelLabel={confirmDelete.cancel}
          onConfirm={handleDeleteConfirm}
          onCancel={() => setConfirmDelete(null)}
        />
      )}
      <div className="pets-header">
        <span className="pets-header-icon">
          <BsGrid3X3Gap />
        </span>
        <h2>Dashboard</h2>
      </div>

      <div className="pets-toolbar">
        <button type="button" className="pets-bell" aria-label="Notificaciones">
          <HiOutlineBell />
        </button>
        <div className="pets-toolbar-actions">
          <button
            type="button"
            className="pets-icon-btn add"
            onClick={() => navigate('/agregarMascota')}
          >
            <HiOutlinePlus size={16} />
            Mascota
          </button>
          <button type="button" className="pets-icon-btn logout" onClick={handleLogout}>
            <HiOutlineLogout size={16} />
            Cerrar sesión
          </button>
        </div>
      </div>

      <div className="pets-list-card">
        <h3 className="pets-list-title">
          <span className="pets-list-title-icon" aria-hidden="true">
            <FaPaw />
          </span>
          Lista de mascotas
        </h3>

        {loading ? (
          <p className="pets-loading">Cargando...</p>
        ) : pets.length === 0 ? (
          <p className="pets-empty">No hay mascotas registradas.</p>
        ) : (
          <div className="pets-list">
            {pets.map((pet) => (
              <div className="pets-list-item" key={pet.id}>
                <img src={getPetImageUrl(pet.image)} alt={pet.name} />
                <div className="pets-list-info">
                  <strong>{pet.name}</strong>
                  <span>
                    {pet.kind} - {pet.breed}
                  </span>
                </div>
                <div className="pets-list-actions">
                  <button
                    type="button"
                    className="pets-action-btn view"
                    onClick={() => navigate(`/verMascota/${pet.id}`)}
                    aria-label={`Ver ${pet.name}`}
                  >
                    <HiOutlineSearch />
                  </button>
                  <button
                    type="button"
                    className="pets-action-btn edit"
                    onClick={() => navigate(`/editarMascota/${pet.id}`)}
                    aria-label={`Editar ${pet.name}`}
                  >
                    <HiOutlinePencil />
                  </button>
                  <button
                    type="button"
                    className="pets-action-btn delete"
                    onClick={() => handleDeleteClick(pet.id)}
                    aria-label={`Eliminar ${pet.name}`}
                  >
                    <HiOutlineTrash />
                  </button>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </PetLayout>
  );
}
