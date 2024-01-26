import { Hono } from 'hono'

const company = new Hono()

company.get('/:id', (c) => c.json({id : c.req.param('id')}))

company.post('/register', (c) => c.json({message : "register"}))

company.post('/login', (c) => c.json({message : "login"}))

export default company;