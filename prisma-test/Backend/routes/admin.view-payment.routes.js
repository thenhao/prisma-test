// const {authSupervisor} = require('../../Authorization/auth'); // for JWT role auth
const express = require("express");
//to bring in the controller for supervisor under my folder
const AdminViewPaymentController = require("../controller/admin.view-payment-logs.controller");
const router = express.Router();

//Instantiate a new instance of the class
const adminViewPaymentController = new AdminViewPaymentController();

router.get("/viewpaymentlogs", adminViewPaymentController.findAllPayments);
router.get("/viewpaymentlogs/:invoiceID", adminViewPaymentController.findSpecificPayment);

module.exports = router;