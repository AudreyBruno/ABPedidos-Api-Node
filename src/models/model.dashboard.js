import {db} from "../config/database.js";

function DashboardClientes(callback){

    let ssql = "SELECT c.nome, sum(p.vl_total) as vl_total ";
    ssql += "FROM pedido p ";
    ssql += "JOIN cliente c on (c.id_cliente = p.id_cliente) ";
    ssql += "WHERE p.status = 'F' ";
    ssql += "GROUP BY c.nome ";
    ssql += "ORDER BY 2 DESC ";
    ssql += "LIMIT 5 ";

    db.query(ssql, function(err, result){
        if (err)
            callback(err, [])
        else{
            let json = [["Cliente", "Vendas"]];

            result.map((i) => {
                json.push([i.nome, i.vl_total]);
            });

            callback(undefined, json);
        }
    });
    
};

function DashboardVendas(callback){

    let ssql = "SELECT month(p.dt_pedido) as mes, sum(p.vl_total) as vl_total ";
    ssql += "FROM pedido p ";
    ssql += "WHERE p.status = 'F' ";
    ssql += "GROUP BY month(p.dt_pedido) ";
    ssql += "ORDER BY 1 desc ";

    db.query(ssql, function(err, result){
        if (err)
            callback(err, [])
        else{
            let json = [["Mês", "Vendas"]];

            result.map((i) => {
                json.push([i.mes, i.vl_total]);
            });

            callback(undefined, json);
        }
    });
    
};

function DashboardProdutos(callback){
   
    let ssql = "SELECT o.descricao as produto, sum(i.vl_total) as vl_total ";
    ssql += "FROM pedido p ";
    ssql += "JOIN pedido_item i on (i.id_pedido = p.id_pedido) ";
    ssql += "JOIN produto o on (o.id_produto = i.id_produto) ";
    ssql += "WHERE p.status = 'F' ";
    ssql += "GROUP BY o.descricao ";
    ssql += "ORDER BY 2 desc ";
    ssql += "LIMIT 5 ";

    db.query(ssql, function(err, result){
        if (err)
            callback(err, [])
        else{
            let json = [["Produto", "Vendas"]];

            result.map((i) => {
                json.push([i.produto, i.vl_total]);
            });

            callback(undefined, json);
        }
    });
    
};

function DashboardCidades(callback){
   
    let ssql = "SELECT c.cidade, sum(p.vl_total) as vl_total ";
    ssql += "FROM pedido p ";
    ssql += "JOIN cliente c on (c.id_cliente = p.id_cliente) ";
    ssql += "WHERE p.status = 'F' ";
    ssql += "GROUP BY c.cidade ";
    ssql += "ORDER BY 2 desc "; 

    db.query(ssql, function(err, result){
        if (err)
            callback(err, [])
        else{
            let json = [["Cidade", "Vendas"]];

            result.map((i) => {
                json.push([i.cidade, i.vl_total]);
            });

            callback(undefined, json);
        }
    });
    
};

export default {DashboardClientes, DashboardVendas, DashboardProdutos, DashboardCidades};