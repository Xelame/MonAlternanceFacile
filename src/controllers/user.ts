import { createToken } from "../middleware/auth";
import { PrismaClient } from "@prisma/client";

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

export const ListUser = async (c: any) => {
    try {
        // count the number of users
        const count = await prisma.user.count();
        return c.json({message : `There are ${count} users in the database.`});
    }
    catch (error: any) {
        return c.json({ message: error.message})
    }
}

export const register = async (c: any) => {
    const { email, password } = await c.req.json();
    const hash = await Bun.password.hash(password);
    console.log("Slaut")
    try {
        return await prisma.user.create({
            data: {
              email: email,
              password : password
            },
        });          
    }
    catch (error: any) {
        return c.json({ message: error.message })
    }
}

export const login = async (c: any) => {
    const { email, password } = await c.req.json();
    try {
        throw new Error("User not found");
    }
    catch (error: any) {
        return c.json({ message: error.message })
    }
}