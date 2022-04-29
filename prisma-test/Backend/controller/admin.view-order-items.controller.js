const Joi = require('joi');
//import the service
const adminViewOrderItemsService = require("../service/admin.view-order-items.service");
//remove next from req, res
class AdminViewOrderItemsController{
    
    async findSpecificOrder(req, res, next){
        console.log(typeof req.params.orderNo);

        const schema = Joi.object().keys({
            orderNo: Joi.number().required()
        });

        const convertedOrderNo = parseInt(req.params.orderNo)
        try{
            schema.validate({ orderNo:convertedOrderNo });
        }catch(error){
            res.status(400);
            return res.json({message:"Incorrect request data"})
        }

        //use the service layer
        const result = await adminViewOrderItemsService.findSpecificOrder(convertedOrderNo);
        res.status(result.status);

        //return the result from the service
        return res.json({data:result.data, status: result.status, message:result.message});
    }

    async findAllOrders(req, res, next){
        const result = await adminViewOrderItemsService.findAllOrders();
        res.status(result.status);
        return res.json({data:result.data, status: result.status, message:result.message});
    }
}

module.exports = AdminViewOrderItemsController;