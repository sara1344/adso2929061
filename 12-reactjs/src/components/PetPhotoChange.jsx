import { HiOutlinePhotograph } from 'react-icons/hi';

export default function PetPhotoChange({
  src,
  alt = 'Foto de mascota',
  onChange,
  inputId = 'pet-photo',
  disabled = false,
}) {
  return (
    <div className="pets-photo-change">
      <img src={src} alt={alt} className="pets-view-image" />

      <label
        htmlFor={inputId}
        className={`pets-view-photo-icon ${disabled ? 'pets-view-photo-icon--disabled' : ''}`}
        aria-label="Cambiar foto"
      >
        <HiOutlinePhotograph />
      </label>

      <input
        id={inputId}
        type="file"
        accept="image/*"
        className="pets-image-upload-input"
        onChange={onChange}
        disabled={disabled}
      />
    </div>
  );
}
