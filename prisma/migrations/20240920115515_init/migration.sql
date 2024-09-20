-- CreateEnum
CREATE TYPE "Roles" AS ENUM ('admin', 'customer');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT,
    "firstName" TEXT,
    "lastName" TEXT,
    "password" TEXT NOT NULL,
    "roles" "Roles"[] DEFAULT ARRAY['customer']::"Roles"[],
    "tutorialsId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TokenWhiteList" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "accessToken" TEXT,
    "refreshToken" TEXT,
    "refreshTokenId" TEXT,
    "expiredAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TokenWhiteList_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tutorials" (
    "id" TEXT NOT NULL,
    "testIntro" BOOLEAN NOT NULL,
    "scoreExplanation" BOOLEAN NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Tutorials_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Simulation" (
    "id" TEXT NOT NULL,
    "situation" JSONB NOT NULL,
    "foldedSteps" TEXT[],
    "actionChoices" JSONB NOT NULL,
    "computedResults" JSONB NOT NULL,
    "progression" DOUBLE PRECISION NOT NULL,
    "userId" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Simulation_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_tutorialsId_key" ON "User"("tutorialsId");

-- CreateIndex
CREATE UNIQUE INDEX "TokenWhiteList_userId_key" ON "TokenWhiteList"("userId");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_tutorialsId_fkey" FOREIGN KEY ("tutorialsId") REFERENCES "Tutorials"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TokenWhiteList" ADD CONSTRAINT "TokenWhiteList_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Simulation" ADD CONSTRAINT "Simulation_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
