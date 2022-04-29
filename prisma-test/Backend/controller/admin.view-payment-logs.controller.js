const Joi = require('joi');
//import the service
const adminViewPaymentLogsService = require("../service/admin.view-payment-logs.service");

class AdminViewPaymentController{
    
    async findSpecificPayment(req, res, next){
        
        console.log(typeof req.params.invoiceID);

        const convertedInvoiceId = parseInt(req.params.invoiceID);

        const schema = Joi.object().keys({
            invoiceID: Joi.number().required()
        });

        try{
            schema.validate({ invoiceID:convertedInvoiceId });
        }catch(error){
            res.status(400);
            return res.json({message:"Incorrect request data"})
        }

        //use the service layer
        const result = await adminViewPaymentLogsService.findSpecificPayment(convertedInvoiceId);
        res.status(result.status);

        //return the result from the service
        return res.json({data:result.data, status: result.status, message:result.message});
    }

    async findAllPayments(req, res, next){
        const result = await adminViewPaymentLogsService.findAllPayments();
        res.status(result.status);
        return res.json({data:result.data, status: result.status, message:result.message});
    }
}

module.exports = AdminViewPaymentController;