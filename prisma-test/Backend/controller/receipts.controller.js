// Import Joi for validation
const Joi = require('joi');

// Import the service for receipts
const receiptsService = require("../service/receipts.service");

// Create class for controller for receipts
class ReceiptsController {
    // Function to find one receipt
    async findOne(req, res){
        // Define validation for req.body
        const schema = Joi.object().keys({
            orderNo: Joi.number().required()
        });

        //parsing the string as a number
        const convertedOrderNo = parseInt(req.params.orderNo)

        // Implement validation, else throw an error
        try{
            schema.validate({ orderNo:convertedOrderNo });
        }catch(error){
            res.status(400);
            return res.json({message:"Incorrect request data"})
        }

        // Use receipts service layer
        const result = await receiptsService.findOne(convertedOrderNo);
        res.status(result.status);

        // Return the result from the service
        return res.json({data:result.data, status: result.status, message:result.message});
    }

    // Function to find all receipts
    async findMany(req, res){
        // Use receipts service layer
        const result = await receiptsService.findMany();
        res.status(result.status);
        // Return the result from the service
        return res.json({data:result.data, status: result.status, message:result.message});
    }
}

module.exports = ReceiptsController;