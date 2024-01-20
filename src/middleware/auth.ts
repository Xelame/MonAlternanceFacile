import { sign } from 'hono/jwt' 

export const createToken = (id : number) => {
    return sign({ "id": id, "exp": 604800 }, process.env['JWT_SECRET']!)
}