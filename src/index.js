import express, { response } from "express";
import cors from "cors";
import basicauth from "express-basic-auth";
import dotenv from "dotenv";
import routeCliente from "./routes/route.cliente.js";
import routeProduto from "./routes/route.produto.js";
import routeCondpagto from "./routes/route.condpagto.js";
import routeDashboard from "./routes/route.dashboard.js";
import routePedido from "./routes/route.pedido.js";

dotenv.config();

const app = express();

const apiUser = process.env.API_USER;
const apiPassword = process.env.API_PASSWORD;

app.use(express.json());

app.use(cors());

app.use(basicauth({
    authorizer: function(usuario, senha){
        return basicauth.safeCompare(usuario, apiUser) && basicauth.safeCompare(senha, apiPassword);
    }
}));

app.use(routeCliente);
app.use(routeProduto);
app.use(routeCondpagto);
app.use(routeDashboard);
app.use(routePedido);

app.listen(3001, function(){
    console.log("Servidor rodando com sucesso");
});