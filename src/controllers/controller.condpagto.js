import modelCondpagto from "../models/model.condpagto.js";

function Listar(req, res){
    
    modelCondpagto.Listar(function(err, result){
        if (err)
            res.status(500).send(err)
        else
            res.status(200).json(result);
    });
};

export default {Listar};