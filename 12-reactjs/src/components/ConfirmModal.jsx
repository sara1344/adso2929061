export default function ConfirmModal({ message, confirmLabel, cancelLabel, onConfirm, onCancel }) {
  return (
    <div className="pets-confirm-overlay" onClick={onCancel}>
      <div className="pets-confirm-box" onClick={(e) => e.stopPropagation()}>
        <p className="pets-confirm-message">{message}</p>
        <div className="pets-confirm-actions">
          <button type="button" className="pets-btn pets-btn-cancel" onClick={onCancel}>
            {cancelLabel}
          </button>
          <button type="button" className="pets-btn pets-btn-danger" onClick={onConfirm}>
            {confirmLabel}
          </button>
        </div>
      </div>
    </div>
  );
}
