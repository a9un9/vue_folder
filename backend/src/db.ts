import { Pool } from "pg";

export const pool = new Pool({
    user: "postgres",
    host: "localhost",
    database: "test_db",
    password: "bangsat",
    port: 5432,
});
