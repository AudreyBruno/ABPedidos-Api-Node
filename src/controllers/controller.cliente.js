import modelCliente from "../models/model.cliente.js";

function Listar(req, res){
    
    modelCliente.Listar(req.query.busca, function(err, result){
        if (err)
            res.status(500).send(err)
        else
            res.status(200).json(result);
    });
};

export default {Listar};