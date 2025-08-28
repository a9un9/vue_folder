import { Elysia } from 'elysia'
import { getAllFolders, getSubFolders } from '../models/folder'

export const folderRoutes = (app: Elysia) =>
  app.group('/folders', app =>
    app
      .get('/', async () => {
        try {
          return await getAllFolders()
        } catch (err) {
          console.error('Error /folders:', err)
          return { error: 'Internal Server Error' }
        }
      })
      .get('/:id', async ({ params }) => {
        try {
          const id = Number(params.id)
          if (isNaN(id)) return { error: 'Invalid folder id' }

          return await getSubFolders(id)
        } catch (err) {
          console.error('Error /folders/:id:', err)
          return { error: 'Internal Server Error' }
        }
      })
  )
