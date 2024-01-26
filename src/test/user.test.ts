import { expect, test, describe } from "bun:test";

describe("Authentification", () => {
    test("Get a User", async () => {
        const res = await fetch("http://localhost:3000/user/1");
        const data = await res.json();
        expect(res.status).toBe(200);
        expect(data).toEqual({ id: "1" });
    });
});