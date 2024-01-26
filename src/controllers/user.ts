import { createToken } from "../middleware/auth";

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
        throw new Error("User already exists")
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