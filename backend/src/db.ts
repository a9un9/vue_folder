import { Pool } from "pg";

export const pool = new Pool({
    user: "postgres",
    host: "localhost",
    database: "test_db", // Ganti dengan nama database Anda
    password: "bangsat", // Ganti dengan password database Anda
    port: 5432,
});
