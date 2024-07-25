import { InferSubjects } from '@casl/ability';

import { Actions, Permissions } from '@modules/casl';
import { ActivityTypeEntity } from './entities/activity-type.entity';
import { Roles } from '@prisma/client';

export type Subjects = InferSubjects<typeof ActivityTypeEntity>;

export const permissions: Permissions<Roles, Subjects, Actions> = {
  everyone({ can }) {
    can(Actions.read, ActivityTypeEntity, ['carbonFactor', 'name']);
  },
};
