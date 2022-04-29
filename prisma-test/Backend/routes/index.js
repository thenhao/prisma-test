const express = require("express");
const app = express();
app.use(express.json());


const viewOrderItems = require("./admin.view-order-items.routes");
const viewPayment = require("./admin.view-payment.routes");


app.use(viewOrderItems);
app.use(viewPayment);


// Sarah
// Import route for receipts
const receipts = require("./receipts.route");
// Use route for receipts
app.use(receipts);


module.exports = app;
