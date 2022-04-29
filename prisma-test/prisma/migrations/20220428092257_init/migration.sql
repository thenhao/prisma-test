-- CreateTable
CREATE TABLE "User" (
    "Id" INTEGER NOT NULL,
    "username" VARCHAR(20) NOT NULL,
    "password" VARCHAR(20) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("Id")
);

-- CreateTable
CREATE TABLE "DistinctOrderList" (
    "orderNo" INTEGER NOT NULL,

    CONSTRAINT "DistinctOrderList_pkey" PRIMARY KEY ("orderNo")
);

-- CreateTable
CREATE TABLE "MenuItem" (
    "menuItemID" INTEGER NOT NULL,
    "src" VARCHAR(50) NOT NULL,
    "alt" VARCHAR(50) NOT NULL,
    "type" VARCHAR(20) NOT NULL,
    "category" VARCHAR(20) NOT NULL,
    "chefRecommendation" BOOLEAN NOT NULL,
    "price" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MenuItem_pkey" PRIMARY KEY ("menuItemID")
);

-- CreateTable
CREATE TABLE "ComputedOrders" (
    "Id" INTEGER NOT NULL,
    "orderNo" INTEGER NOT NULL,
    "menuItemID" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    "totalItemPrice" INTEGER NOT NULL,
    "tableNo" INTEGER NOT NULL,
    "orderStatus" VARCHAR(50) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ComputedOrders_pkey" PRIMARY KEY ("Id")
);

-- CreateTable
CREATE TABLE "Receipt" (
    "receiptId" INTEGER NOT NULL,
    "orderNo" INTEGER NOT NULL,
    "totalPrice" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Receipt_pkey" PRIMARY KEY ("receiptId")
);

-- CreateTable
CREATE TABLE "PaymentInvoice" (
    "invoiceId" INTEGER NOT NULL,
    "receiptId" INTEGER NOT NULL,
    "paymentType" VARCHAR(20) NOT NULL,
    "paymentStatus" VARCHAR(20) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PaymentInvoice_pkey" PRIMARY KEY ("invoiceId")
);

-- AddForeignKey
ALTER TABLE "ComputedOrders" ADD CONSTRAINT "ComputedOrders_orderNo_fkey" FOREIGN KEY ("orderNo") REFERENCES "DistinctOrderList"("orderNo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ComputedOrders" ADD CONSTRAINT "ComputedOrders_menuItemID_fkey" FOREIGN KEY ("menuItemID") REFERENCES "MenuItem"("menuItemID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Receipt" ADD CONSTRAINT "Receipt_orderNo_fkey" FOREIGN KEY ("orderNo") REFERENCES "DistinctOrderList"("orderNo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentInvoice" ADD CONSTRAINT "PaymentInvoice_receiptId_fkey" FOREIGN KEY ("receiptId") REFERENCES "Receipt"("receiptId") ON DELETE RESTRICT ON UPDATE CASCADE;
