import { Activity } from '@prisma/client';

export class ActivityEntity implements Activity {
  readonly tag: string;

  readonly activityCategoryId: string;

  readonly id: string;

  readonly description!: string | null;

  readonly carbonEmission: number;

  readonly userId: string;

  readonly createdAt!: Date;

  readonly updatedAt!: Date;

  readonly deletedAt!: Date;
}
