import { Hono } from 'hono'
import { logger } from 'hono/logger'

import userRouter from './routes/user'


const app = new Hono()


// const secret = 'SL7k35jP%x*GAG'
// const token = await sign(payloadin, secret)

// Logger
app.use('*', logger())


// HTTP Methods
app.get('/', (c) => c.text('GET /'))
app.post('/', (c) => c.text('POST /'))
app.put('/', (c) => c.text('PUT /'))
app.delete('/', (c) => c.text('DELETE /'))

app.route('/user', userRouter);




app.notFound((c) => {
    return c.json({ message: 'Not Found' }, 404)
})

app.onError((err) => {
    throw err
})


export default {
    port: 3000,
    fetch: app.fetch,
}
