import { User } from '@prisma/client';
import { Roles } from '@modules/app/app.roles';

export default class UserEntity implements User {
  readonly state: string;

  readonly id: string;

  readonly tutorialsId: string;

  readonly deletedAt: Date;

  readonly phone!: string | null;

  readonly email!: string;

  readonly firstName!: string | null;

  readonly lastName!: string | null;

  readonly password!: string | null;

  readonly roles!: Roles[];

  readonly createdAt!: Date;

  readonly updatedAt!: Date;

  readonly isVerified!: boolean;
}
