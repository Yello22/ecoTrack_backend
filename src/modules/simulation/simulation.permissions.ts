import { InferSubjects } from '@casl/ability';

import { Actions, Permissions } from '@modules/casl';
import { SimulationEntity } from './entities/simulation.entity';
import { Roles } from '@prisma/client';

export type Subjects = InferSubjects<typeof SimulationEntity>;

export const permissions: Permissions<Roles, Subjects, Actions> = {
  everyone({ cannot }) {
    cannot(Actions.read, SimulationEntity);
  },

  customer({ user, can }) {
    can(
      Actions.manage,
      SimulationEntity,
      [
        'situation',
        'foldedSteps',
        'actionChoices',
        'computedResults',
        'progression',
        'date',
        'updatedAt',
      ],
      { userId: user.id },
    );
  },
};
