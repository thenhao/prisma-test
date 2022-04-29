/*
  Warnings:

  - A unique constraint covering the columns `[orderID]` on the table `Receipt` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Receipt_orderID_key" ON "Receipt"("orderID");
