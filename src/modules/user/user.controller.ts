import {
  Body,
  Controller,
  Get,
  Param,
  Patch,
  Query,
  Req,
  UseGuards,
} from '@nestjs/common';
import { UserService } from './user.service';
import {
  ApiBearerAuth,
  ApiExtraModels,
  ApiQuery,
  ApiTags,
} from '@nestjs/swagger';
import ApiBaseResponses from '@decorators/api-base-response.decorator';
import {
  AccessGuard,
  Actions,
  CaslConditions,
  CaslUser,
  ConditionsProxy,
  UseAbility,
  UserProxy,
} from '@modules/casl';
import UserEntity from '@modules/user/entities/user.entity';
import Serialize from '@decorators/serialize.decorator';
import { OrderByPipe, WherePipe } from '@nodeteam/nestjs-pipes';
import { Prisma, User } from '@prisma/client';
import { PaginatorTypes } from '@nodeteam/nestjs-prisma-pagination';
import UserBaseEntity from '@modules/user/entities/user-base.entity';
import { UserHook } from '@modules/user/user.hook';
import ApiOkBaseResponse from '@decorators/api-ok-base-response.decorator';
import { UpdateUserDto } from '@modules/user/entities/user-update.dto';

@ApiTags('Users')
@ApiBearerAuth()
@ApiExtraModels(UserBaseEntity)
@ApiBaseResponses()
@Controller('users')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @Get()
  @ApiQuery({ name: 'where', required: false, type: 'string' })
  @ApiQuery({ name: 'orderBy', required: false, type: 'string' })
  @ApiOkBaseResponse({ dto: UserBaseEntity, isArray: true })
  @UseGuards(AccessGuard)
  @Serialize(UserBaseEntity)
  @UseAbility(Actions.read, UserEntity)
  async findAll(
    @Query('where', WherePipe) where?: Prisma.UserWhereInput,
    @Query('orderBy', OrderByPipe)
    orderBy?: Prisma.UserOrderByWithRelationInput,
  ): Promise<PaginatorTypes.PaginatedResult<User>> {
    return this.userService.findAll(where, orderBy);
  }

  @Get('me')
  @ApiOkBaseResponse({ dto: UserBaseEntity })
  @UseGuards(AccessGuard)
  @Serialize(UserBaseEntity)
  @UseAbility(Actions.read, UserEntity)
  async me(
    @CaslUser() userProxy?: UserProxy<User>,
    @CaslConditions() conditions?: ConditionsProxy,
  ): Promise<User> {
    const tokenUser = await userProxy.get();

    return this.userService.findOne(tokenUser.id);
  }

  @Patch('me')
  @UseGuards(AccessGuard)
  @UseAbility(Actions.update, UserEntity)
  async updateUser(
    @Req() req: any,
    @Body() body: UpdateUserDto,
  ): Promise<User> {
    const filteredBody = Object.fromEntries(
      Object.entries(body).filter(([_, value]) => value !== undefined),
    );
    const { user } = req;
    return this.userService.update(user.id, filteredBody);
  }
}
