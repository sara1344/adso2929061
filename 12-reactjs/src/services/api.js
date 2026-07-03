import { useCallback } from 'react';
import { API_URL } from '../config/api';
import { useAuth } from '../context/AuthContext';

let alertHandler = null;
let logoutHandler = null;

export function registerApiHandlers({ showAlert, logout }) {
  alertHandler = showAlert;
  logoutHandler = logout;
}

async function parseResponse(response) {
  const data = await response.json().catch(() => ({}));
  return { data, ok: response.ok, status: response.status };
}

export async function apiRequest(endpoint, options = {}) {
  const { token, skipAuth = false } = options;
  const headers = { ...(options.headers || {}) };
  const isFormData = options.body instanceof FormData;

  if (!isFormData) {
    headers['Content-Type'] = 'application/json';
    headers.Accept = 'application/json';
  } else {
    headers.Accept = 'application/json';
  }

  if (!skipAuth && token) {
    headers.Authorization = `Bearer ${token}`;
  }

  const response = await fetch(`${API_URL}${endpoint}`, {
    ...options,
    headers,
  });

  const { data, ok, status } = await parseResponse(response);

  if (status === 401 && !skipAuth) {
    if (alertHandler && data.message) {
      alertHandler(data.message);
    }
    if (logoutHandler) {
      logoutHandler();
    }
    const error = new Error(data.message || 'Unauthorized');
    error.status = 401;
    throw error;
  }

  return { data, ok, status };
}

export function useApi() {
  const { token } = useAuth();

  const request = useCallback(
    (endpoint, options = {}) => apiRequest(endpoint, { ...options, token }),
    [token]
  );

  return { request, token };
}
