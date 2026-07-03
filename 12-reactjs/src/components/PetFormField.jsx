export default function PetFormField({ id, name, label, type = 'text', value, onChange, required = false, step }) {
  const isTextarea = type === 'textarea';

  return (
    <div className={`pets-input-box ${isTextarea ? 'pets-input-box--textarea' : ''}`}>
      <label htmlFor={id} className="pets-input-box-label">
        {label}
      </label>
      {isTextarea ? (
        <textarea
          id={id}
          name={name}
          className="pets-input-box-field"
          value={value}
          onChange={onChange}
          required={required}
        />
      ) : (
        <input
          id={id}
          name={name}
          type={type}
          className="pets-input-box-field"
          value={value}
          onChange={onChange}
          required={required}
          step={step}
        />
      )}
    </div>
  );
}
