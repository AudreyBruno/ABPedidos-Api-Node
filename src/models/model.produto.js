import {db} from "../config/database.js";

function Listar(busca, callback){

    let filtro = [];
    let ssql = "SELECT id_produto, descricao FROM produto";

    if (busca){
        ssql += " WHERE descricao LIKE ?";
        filtro.push(busca);
    };

    db.query(ssql, "%" + filtro + "%", function(err, result){
        if (err)
            callback(err, [])
        else
            callback(undefined, result);
    });
};

export default {Listar};