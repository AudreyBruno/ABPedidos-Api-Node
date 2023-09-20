import modelProduto from "../models/model.produto.js";

function Listar(req, res){
    
    modelProduto.Listar(req.query.busca, function(err, result){
        if (err)
            res.status(500).send(err)
        else
            res.status(200).json(result);
    });
};

export default {Listar};