// src/types.ts
export type Folder = {
  id: number;
  name: string;
  parent_id: number | null;
  path: string | null;
};

export type FolderNode = Folder & { children: FolderNode[] };
