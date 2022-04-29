/*
  Warnings:

  - You are about to drop the column `orderNo` on the `ComputedOrders` table. All the data in the column will be lost.
  - The primary key for the `MenuItem` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `menuItemID` on the `MenuItem` table. All the data in the column will be lost.
  - You are about to drop the column `receiptId` on the `PaymentInvoice` table. All the data in the column will be lost.
  - You are about to drop the column `orderNo` on the `Receipt` table. All the data in the column will be lost.
  - Added the required column `orderID` to the `ComputedOrders` table without a default value. This is not possible if the table is not empty.
  - Added the required column `receiptNo` to the `PaymentInvoice` table without a default value. This is not possible if the table is not empty.
  - Added the required column `orderID` to the `Receipt` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "ComputedOrders" DROP CONSTRAINT "ComputedOrders_menuItemID_fkey";

-- DropForeignKey
ALTER TABLE "ComputedOrders" DROP CONSTRAINT "ComputedOrders_orderNo_fkey";

-- DropForeignKey
ALTER TABLE "PaymentInvoice" DROP CONSTRAINT "PaymentInvoice_receiptId_fkey";

-- DropForeignKey
ALTER TABLE "Receipt" DROP CONSTRAINT "Receipt_orderNo_fkey";

-- AlterTable
ALTER TABLE "ComputedOrders" DROP COLUMN "orderNo",
ADD COLUMN     "orderID" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "MenuItem" DROP CONSTRAINT "MenuItem_pkey",
DROP COLUMN "menuItemID",
ADD COLUMN     "menuItemNo" SERIAL NOT NULL,
ADD CONSTRAINT "MenuItem_pkey" PRIMARY KEY ("menuItemNo");

-- AlterTable
ALTER TABLE "PaymentInvoice" DROP COLUMN "receiptId",
ADD COLUMN     "receiptNo" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Receipt" DROP COLUMN "orderNo",
ADD COLUMN     "orderID" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "ComputedOrders" ADD CONSTRAINT "ComputedOrders_orderID_fkey" FOREIGN KEY ("orderID") REFERENCES "DistinctOrderList"("orderNo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ComputedOrders" ADD CONSTRAINT "ComputedOrders_menuItemID_fkey" FOREIGN KEY ("menuItemID") REFERENCES "MenuItem"("menuItemNo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Receipt" ADD CONSTRAINT "Receipt_orderID_fkey" FOREIGN KEY ("orderID") REFERENCES "DistinctOrderList"("orderNo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentInvoice" ADD CONSTRAINT "PaymentInvoice_receiptNo_fkey" FOREIGN KEY ("receiptNo") REFERENCES "Receipt"("receiptId") ON DELETE RESTRICT ON UPDATE CASCADE;
