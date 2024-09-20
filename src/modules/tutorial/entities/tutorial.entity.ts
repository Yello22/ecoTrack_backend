import { Tutorials } from '@prisma/client';

export class TutorialEntity implements Tutorials {
  id: string;
  testIntro: boolean;
  scoreExplanation: boolean;
  createdAt: Date;
  updatedAt: Date;
  deletedAt: Date;
}
