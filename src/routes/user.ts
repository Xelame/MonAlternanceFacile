import { Hono } from 'hono'
import { register, login } from '../controllers/user'

const user = new Hono()

user.get('/:id', (c) => c.json({id : c.req.param('id')}))

user.post('/register', register)

user.post('/login', login)

export default user;