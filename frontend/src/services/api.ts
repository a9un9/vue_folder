import axios from "axios";

const api = axios.create({
  baseURL: "http://localhost:3000",
});

// Ambil semua folder
export const getAllFolders = async () => {
  const res = await api.get("/folders");
  return res.data; // langsung kembalikan data
};

// Ambil subfolder berdasarkan parent_id
export const getSubFolders = async (parentId: number) => {
  const res = await api.get(`/folders?parent_id=${parentId}`);
  return res.data;
};
