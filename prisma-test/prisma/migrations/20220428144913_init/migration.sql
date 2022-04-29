-- AlterTable
CREATE SEQUENCE "computedorders_id_seq";
ALTER TABLE "ComputedOrders" ALTER COLUMN "Id" SET DEFAULT nextval('computedorders_id_seq');
ALTER SEQUENCE "computedorders_id_seq" OWNED BY "ComputedOrders"."Id";

-- AlterTable
CREATE SEQUENCE "menuitem_menuitemid_seq";
ALTER TABLE "MenuItem" ALTER COLUMN "menuItemID" SET DEFAULT nextval('menuitem_menuitemid_seq');
ALTER SEQUENCE "menuitem_menuitemid_seq" OWNED BY "MenuItem"."menuItemID";

-- AlterTable
CREATE SEQUENCE "paymentinvoice_invoiceid_seq";
ALTER TABLE "PaymentInvoice" ALTER COLUMN "invoiceId" SET DEFAULT nextval('paymentinvoice_invoiceid_seq');
ALTER SEQUENCE "paymentinvoice_invoiceid_seq" OWNED BY "PaymentInvoice"."invoiceId";

-- AlterTable
CREATE SEQUENCE "receipt_receiptid_seq";
ALTER TABLE "Receipt" ALTER COLUMN "receiptId" SET DEFAULT nextval('receipt_receiptid_seq');
ALTER SEQUENCE "receipt_receiptid_seq" OWNED BY "Receipt"."receiptId";
