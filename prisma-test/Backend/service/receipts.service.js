const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

//Import models for receipts and order
//commented out to use prisma tables
//const Receipt = require("../../ORM/ambrosial/receipts.model.js");
//const Order = require("../../ORM/ambrosial/order.model.js");

module.exports = {
    // Method for finding one receipt
    findOne: async(orderNo) => {
        // Define the result object that will to be sent to the client
        let result = {
            message:null,
            status: null,
            data: null
        }

        // Find order by order ID        
        const order = await prisma.DistinctOrderList.findUnique({
            where:{
                orderNo:orderNo
            }
        });

        // If order does not exist, send error message
        if(!order){
            result.message = `Order ID ${orderNo} is not found`;
            result.status = 404;
            return result;
        }

        // Find Receipts by order ID        
        const receipt = await prisma.Receipt.findUnique({
            where: {
                orderID:order.orderNo
            },
          }); 

        // If order does not exist, send error message
        if(!receipt){
            result.message = `Order ID ${orderNo} is not found`;
            result.status = 404;
            return result;
        }

        result.data = receipt;
        result.status = 200;
        result.message = `Receipts retrieval for all orders successful `;
        return result;
    },

    // Method for finding all receipts
    findMany: async() => {
        // Define the result object that will to be sent to the client
        let result = {
            message:null,
            status: null,
            data: null
        }

        // Find all receipts
        const receipts = await prisma.Receipt.findMany();

        // If receipts do not exist, send error message
        if(!receipts){
            result.message = `No receipts found`;
            result.status = 404;
            return result;
        }

        // If receipts exist, return all receipts
        result.data = receipts;
        result.status = 200;
        result.message = `Receipts retrieval for all orders successful `;
        return result;
    }
}



// async function main() {
//     const allReceipts = await prisma.user.findMany()
//     console.log(allReceipts)

//     const specificReceipt = await prisma.user.findOne({where: orderNo})
//     console.log(specificReceipt)
//   }
  
//   main()
//     .catch((e) => {
//       throw e
//     })
//     .finally(async () => {
//       await prisma.$disconnect()
//     })