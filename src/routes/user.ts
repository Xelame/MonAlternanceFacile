import { Hono } from 'hono'
import { register, login, ListUser } from '../controllers/user'

const user = new Hono()

user.get('/', ListUser)

user.post('/register', register)

user.post('/login', login)

export default user;