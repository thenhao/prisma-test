const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();

module.exports = {
    findSpecificPayment: async(invoiceId) =>{
        //The result object is where we will put the result to be sent to the client
        let result = {
            message:null,
            status: null,
            data: null
        }

        //What we want:
        //1. check if orderNo exists in the order list

        const paymentLogs = await prisma.PaymentInvoice.findUnique({
            where: {
                invoiceId: invoiceId,
            },
          });
        
        if(!paymentLogs){
            result.message = `Order ID ${invoiceId} is not found`;
            result.status = 404;
            return result;
        }

        const receiptLogs = await prisma.Receipt.findUnique({
            where: {
                receiptId: paymentLogs.receiptId
            },
          });
        

        if(!receiptLogs){
            result.message = `No such receipt ${paymentLogs.receiptID} found`;
            result.status = 404;
            return result;
        }

        const orderLogs = await prisma.DistinctOrderList.findUnique({
            where: {
                orderNo: receiptLogs.orderNo,
            },
          });

        

        if(!orderLogs){
            result.message = `No such order with id ${receiptLogs.orderNo} found`;
            result.status = 404;
            return result;
        }

        result.data = paymentLogs;
        result.status = 200;
        result.message = `Data retrieval for orderRecords with ID:${invoiceId} successful `;
        return result;
    },

    findAllPayments: async()=>{
        let result = {
            message:null,
            status: null,
            data: null
        }
        
        const paymentLogs = await prisma.PaymentInvoice.findMany({
            include: {
                receiptId:true
            }
        });

        //What we want:
        //1. check all orders exists
        //2. Include the menu item data inside the check
        //3. If no, return error message.
        
        //check if order exists
        if(!paymentLogs){
            result.message = `No payment records found`;
            result.status = 404;
            return result;
        }

        result.data = paymentLogs;
        result.status = 200;
        result.message = `Data retrieval for all payments successful `;
        return result;
    }
}