-- CreateTable
CREATE TABLE "user" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" TEXT,
    "lastName" TEXT,
    "birthDate" TIMESTAMP(3),
    "phone" TEXT,
    "externalLink" TEXT[],
    "addressId" INTEGER,
    "jobPostId" INTEGER,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "company" (
    "id" SERIAL NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "companyNumber" TEXT,
    "juridicalCode" TEXT,
    "incorporationDate" TIMESTAMP(3),
    "status" TEXT,
    "type" TEXT,
    "recruiterId" INTEGER,
    "addressId" INTEGER,

    CONSTRAINT "company_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "recruiter" (
    "id" SERIAL NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" TEXT,
    "phone" TEXT,
    "addressId" INTEGER,

    CONSTRAINT "recruiter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "address" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "country" TEXT,
    "city" TEXT,
    "street" TEXT,
    "number" TEXT,
    "zipCode" TEXT,

    CONSTRAINT "address_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "jobOffer" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "title" TEXT,
    "description" TEXT,
    "jobPostId" INTEGER,

    CONSTRAINT "jobOffer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "jobPost" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "title" TEXT,
    "description" TEXT,

    CONSTRAINT "jobPost_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "jobApplication" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT,
    "jobPostId" INTEGER,
    "userId" INTEGER,

    CONSTRAINT "jobApplication_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "jobInterview" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT,
    "jobPostId" INTEGER,
    "userId" INTEGER,

    CONSTRAINT "jobInterview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "jobOfferStatus" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT,
    "jobPostId" INTEGER,
    "userId" INTEGER,

    CONSTRAINT "jobOfferStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "jobPostStatus" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT,
    "jobPostId" INTEGER,
    "userId" INTEGER,

    CONSTRAINT "jobPostStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "jobApplicationStatus" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT,
    "jobPostId" INTEGER,
    "userId" INTEGER,

    CONSTRAINT "jobApplicationStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "jobInterviewStatus" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT,
    "jobPostId" INTEGER,
    "userId" INTEGER,

    CONSTRAINT "jobInterviewStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_companyTojobPost" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_jobPostTorecruiter" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");

-- CreateIndex
CREATE UNIQUE INDEX "_companyTojobPost_AB_unique" ON "_companyTojobPost"("A", "B");

-- CreateIndex
CREATE INDEX "_companyTojobPost_B_index" ON "_companyTojobPost"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_jobPostTorecruiter_AB_unique" ON "_jobPostTorecruiter"("A", "B");

-- CreateIndex
CREATE INDEX "_jobPostTorecruiter_B_index" ON "_jobPostTorecruiter"("B");

-- AddForeignKey
ALTER TABLE "user" ADD CONSTRAINT "user_addressId_fkey" FOREIGN KEY ("addressId") REFERENCES "address"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user" ADD CONSTRAINT "user_jobPostId_fkey" FOREIGN KEY ("jobPostId") REFERENCES "jobPost"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "company" ADD CONSTRAINT "company_addressId_fkey" FOREIGN KEY ("addressId") REFERENCES "address"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "company" ADD CONSTRAINT "company_recruiterId_fkey" FOREIGN KEY ("recruiterId") REFERENCES "recruiter"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "recruiter" ADD CONSTRAINT "recruiter_addressId_fkey" FOREIGN KEY ("addressId") REFERENCES "address"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jobOffer" ADD CONSTRAINT "jobOffer_jobPostId_fkey" FOREIGN KEY ("jobPostId") REFERENCES "jobPost"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jobApplication" ADD CONSTRAINT "jobApplication_jobPostId_fkey" FOREIGN KEY ("jobPostId") REFERENCES "jobPost"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jobApplication" ADD CONSTRAINT "jobApplication_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jobInterview" ADD CONSTRAINT "jobInterview_jobPostId_fkey" FOREIGN KEY ("jobPostId") REFERENCES "jobPost"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jobInterview" ADD CONSTRAINT "jobInterview_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jobOfferStatus" ADD CONSTRAINT "jobOfferStatus_jobPostId_fkey" FOREIGN KEY ("jobPostId") REFERENCES "jobPost"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jobOfferStatus" ADD CONSTRAINT "jobOfferStatus_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jobPostStatus" ADD CONSTRAINT "jobPostStatus_jobPostId_fkey" FOREIGN KEY ("jobPostId") REFERENCES "jobPost"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jobPostStatus" ADD CONSTRAINT "jobPostStatus_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jobApplicationStatus" ADD CONSTRAINT "jobApplicationStatus_jobPostId_fkey" FOREIGN KEY ("jobPostId") REFERENCES "jobPost"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jobApplicationStatus" ADD CONSTRAINT "jobApplicationStatus_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jobInterviewStatus" ADD CONSTRAINT "jobInterviewStatus_jobPostId_fkey" FOREIGN KEY ("jobPostId") REFERENCES "jobPost"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jobInterviewStatus" ADD CONSTRAINT "jobInterviewStatus_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_companyTojobPost" ADD CONSTRAINT "_companyTojobPost_A_fkey" FOREIGN KEY ("A") REFERENCES "company"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_companyTojobPost" ADD CONSTRAINT "_companyTojobPost_B_fkey" FOREIGN KEY ("B") REFERENCES "jobPost"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_jobPostTorecruiter" ADD CONSTRAINT "_jobPostTorecruiter_A_fkey" FOREIGN KEY ("A") REFERENCES "jobPost"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_jobPostTorecruiter" ADD CONSTRAINT "_jobPostTorecruiter_B_fkey" FOREIGN KEY ("B") REFERENCES "recruiter"("id") ON DELETE CASCADE ON UPDATE CASCADE;
