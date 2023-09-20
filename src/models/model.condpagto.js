import {db} from "../config/database.js";

function Listar(callback){

    let ssql = "SELECT id_cond_pagto, cond_pagto FROM cond_pagto ORDER BY cond_pagto";

    db.query(ssql, function(err, result){
        if (err)
            callback(err, [])
        else
            callback(undefined, result);
    });
};

export default {Listar};