import { InferSubjects } from '@casl/ability';

import { Actions, Permissions } from '@modules/casl';
import { ActivityEntity } from './entities/activity.entity';
import { Roles } from '@prisma/client';

export type Subjects = InferSubjects<typeof ActivityEntity>;

export const permissions: Permissions<Roles, Subjects, Actions> = {
  everyone({ cannot }) {
    cannot(Actions.read, ActivityEntity);
  },

  customer({ user, can }) {
    can(
      Actions.manage,
      ActivityEntity,
      ['activityCategoryId', 'carbonEmission', 'description'],
      { userId: user.id },
    );
  },
};
