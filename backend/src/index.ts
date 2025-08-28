import { Elysia } from "elysia"
import { folderRoutes } from "./routes/folders"

const app = new Elysia()
  .onRequest(({ set }) => {
    set.headers["Access-Control-Allow-Origin"] = "http://localhost:5173"
    set.headers["Access-Control-Allow-Methods"] = "GET,POST,PUT,DELETE,OPTIONS"
    set.headers["Access-Control-Allow-Headers"] = "Content-Type, Authorization"
  })
  .use(folderRoutes)
  .listen(3000)

console.log(`🚀 Server running at http://localhost:3000`)
