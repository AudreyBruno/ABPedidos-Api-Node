import { Router } from "express";
import controllerCondpagto from "../controllers/controller.condpagto.js";

const routeCondpagto = Router();

routeCondpagto.get("/condpagto", controllerCondpagto.Listar);

export default routeCondpagto;