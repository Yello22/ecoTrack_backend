import { Activity } from '@prisma/client';

export class ActivityEntity implements Activity {
  readonly id: string;

  readonly description!: string | null;

  readonly carbonEmission: number;

  readonly userId: string;

  readonly activityTypeId: string;

  readonly createdAt!: Date;

  readonly updatedAt!: Date;

  readonly deletedAt!: Date;
}
