import { createContext, useCallback, useContext, useMemo, useState } from 'react';

const AlertContext = createContext(null);

export function AlertProvider({ children }) {
  const [alert, setAlert] = useState(null);

  const showAlert = useCallback((message) => {
    if (!message) return;

    setAlert({ message, id: Date.now() });

    setTimeout(() => {
      setAlert(null);
    }, 3000);
  }, []);

  const value = useMemo(() => ({ showAlert }), [showAlert]);

  return (
    <AlertContext.Provider value={value}>
      {children}
      {alert && (
        <div className="pets-alert" key={alert.id}>
          {alert.message}
        </div>
      )}
    </AlertContext.Provider>
  );
}

export function useAlert() {
  const context = useContext(AlertContext);
  if (!context) {
    throw new Error('useAlert debe usarse dentro de AlertProvider');
  }
  return context;
}
