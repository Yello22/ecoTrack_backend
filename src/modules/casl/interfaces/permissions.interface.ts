import {
  Ability,
  AnyAbility,
  AbilityTuple,
  AbilityBuilder,
  Subject,
} from '@casl/ability';
import { DefaultActions, AuthorizableUser } from '@modules/casl';

export class UserAbilityBuilder<
  Subjects extends Subject = Subject,
  Actions extends string = DefaultActions,
  User extends AuthorizableUser<unknown, unknown> = AuthorizableUser,
> extends AbilityBuilder<AnyAbility> {
  constructor(
    public user: User,
    public permissions: AnyPermissions<string, Subjects, Actions, User>,
    AbilityType: Casl.AnyClass<Ability<AbilityTuple<Actions, Subjects>>>,
  ) {
    super(AbilityType);
  }

  extend = (role: string): void => {
    this.permissionsFor(role);
  };

  permissionsFor(role: string): void {
    const rolePermissions = this.permissions[role];
    if (rolePermissions) {
      rolePermissions(this);
    }
  }
}

export type DefinePermissions<
  Subjects extends Subject = Subject,
  Actions extends string = DefaultActions,
  User extends AuthorizableUser<unknown, unknown> = AuthorizableUser,
> = (builder: UserAbilityBuilder<Subjects, Actions, User>) => void;

export type Permissions<
  Roles extends string,
  Subjects extends Subject = Subject,
  Actions extends string = DefaultActions,
  User extends AuthorizableUser<unknown, unknown> = AuthorizableUser<Roles>,
> = Partial<
  Record<
    Roles | 'every' | 'everyone',
    DefinePermissions<Subjects, Actions, User>
  >
>;

export type AnyPermissions<
  Roles extends string = string,
  Subjects extends Subject = Subject,
  Actions extends string = string,
  User extends AuthorizableUser<unknown, unknown> = AuthorizableUser<Roles>,
> = Permissions<Roles, Subjects, Actions, User>;
