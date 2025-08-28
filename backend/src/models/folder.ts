import { pool } from "../db";
import type { Folder } from "../utils/types";

export async function getAllFolders(): Promise<Folder[]> {
    const res = await pool.query("SELECT * FROM folders ORDER BY id");
    return res.rows;
}

export async function getSubFolders(parentId: number): Promise<Folder[]> {
    const res = await pool.query("SELECT * FROM folders WHERE parent_id = $1", [parentId]);
    return res.rows;
}
