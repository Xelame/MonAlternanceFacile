import { PrismaClient } from "@prisma/client";
import { createToken } from "../middleware/auth";

const prisma = new PrismaClient();

// export const authentification = async (req, res, next) => {
//   const token = req.headers.authorization;
//   if (!token) {
//     return res.status(401).json({ message: "Unauthorized" });
//   }
//   const user = await prisma.user.findUnique({
//     where: {
//       token: token,
//     },
//   });
//   if (!user) {
//     return res.status(401).json({ message: "Unauthorized" });
//   }
//   req.user = user;
//   next();
// };


export const register = async (c: any) => {
    const { email, password } = await c.req.json();
    const hash = await Bun.password.hash(password);
    try {
        await prisma.user.create({
            data: {
                email: email,
                password: hash,
            }
        })
        return c.json({ message: "User created" })
    }
    catch (error: any) {
        return c.json({ message: error.message })
    }
}

export const login = async (c: any) => {
    const { email, password } = await c.req.json();
    try {
        const user = await prisma.user.findUnique({
            where: {
                email: email
            }
        })
        if (!user) {
            return c.json({ message: "User not found" })
        }

        const isMatch = await Bun.password.verify(password, user.password);

        if (!isMatch) {
            return c.json({ message: "Wrong password" })
        }

        const token = await createToken(user.id);
        return c.json({ message: "Logged in", token: token })

    } catch (error: any) {
        return c.json({ message: error.message })
    }
}