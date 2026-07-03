import { HiOutlinePhotograph } from 'react-icons/hi';

export default function PetImageUpload({ preview, onChange, inputId = 'photo', required = false }) {
  return (
    <div className="pets-image-upload-wrap">
      <label htmlFor={inputId} className="pets-image-upload">
        {preview ? (
          <img src={preview} alt="Vista previa" className="pets-image-upload-preview" />
        ) : (
          <HiOutlinePhotograph className="pets-image-upload-icon" aria-hidden="true" />
        )}
      </label>
      <input
        id={inputId}
        type="file"
        accept="image/*"
        className="pets-image-upload-input"
        onChange={onChange}
        required={required}
      />
    </div>
  );
}
