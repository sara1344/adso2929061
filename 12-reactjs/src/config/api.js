export const API_URL = process.env.REACT_APP_API_URL || 'http://127.0.0.1:8000/api';
export const API_BASE = API_URL.replace('/api', '');

export const getPetImageUrl = (image) => {
  if (!image || image === 'no-image.png') {
    return `${process.env.PUBLIC_URL}/images/perroDashboard.svg`;
  }
  return `${API_BASE}/images/${image}`;
};
