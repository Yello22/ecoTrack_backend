import { InferSubjects } from '@casl/ability';

import { Actions, Permissions } from '@modules/casl';
import { TutorialEntity } from './entities/tutorial.entity';
import { Roles } from '@prisma/client';

export type Subjects = InferSubjects<typeof TutorialEntity>;

export const permissions: Permissions<Roles, Subjects, Actions> = {
  everyone({ cannot }) {
    cannot(Actions.read, TutorialEntity);
  },

  customer({ user, can }) {
    can(
      Actions.manage,
      TutorialEntity,
      ['testIntro', 'scoreExplanation', 'createdAt', 'updatedAt'],
      { userId: user.id },
    );
  },
};
