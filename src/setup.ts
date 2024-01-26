import { drizzle } from 'drizzle-orm/postgres-js';
import postgres from 'postgres';
import 'dotenv/config';

// for query purposes
const queryClient = postgres(process.env.DATABASE_URL!);

console.log(queryClient.name)
const db = drizzle(queryClient);