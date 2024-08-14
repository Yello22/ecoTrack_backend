import { InferSubjects } from '@casl/ability';

import { Actions, Permissions } from '@modules/casl';
import { ActivityCategoryEntity } from './entities/activity-category.entity';
import { Roles } from '@prisma/client';

export type Subjects = InferSubjects<typeof ActivityCategoryEntity>;

export const permissions: Permissions<Roles, Subjects, Actions> = {
  everyone({ can, cannot }) {
    can(Actions.read, ActivityCategoryEntity);
    cannot(
      [Actions.create, Actions.delete, Actions.update],
      ActivityCategoryEntity,
    );
  },
};
