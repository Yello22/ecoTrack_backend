import { ActivityType } from '@prisma/client';

export class ActivityTypeEntity implements ActivityType {
  readonly id: string;

  readonly name: string;

  readonly carbonFactor: number;

  readonly createdAt: Date;

  readonly updatedAt: Date;

  readonly deletedAt: Date;
}
