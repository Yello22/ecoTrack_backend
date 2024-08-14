import { ActivityCategory } from '@prisma/client';

export class ActivityCategoryEntity implements ActivityCategory {
  readonly id: string;

  readonly name: string;

  readonly createdAt: Date;

  readonly updatedAt: Date;

  readonly deletedAt: Date;
}
