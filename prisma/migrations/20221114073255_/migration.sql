-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_JobSignup" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "jobId" INTEGER NOT NULL,
    "position" TEXT,
    CONSTRAINT "JobSignup_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "Job" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_JobSignup" ("id", "jobId", "position") SELECT "id", "jobId", "position" FROM "JobSignup";
DROP TABLE "JobSignup";
ALTER TABLE "new_JobSignup" RENAME TO "JobSignup";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
