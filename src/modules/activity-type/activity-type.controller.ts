import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  UseGuards,
  UsePipes,
  Query,
} from '@nestjs/common';
import { ActivityTypeService } from './activity-type.service';
import { CreateActivityTypeDto } from './dto/create-activity-type.dto';
import { UpdateActivityTypeDto } from './dto/update-activity-type.dto';
import {
  ApiBearerAuth,
  ApiBody,
  ApiExtraModels,
  ApiParam,
  ApiQuery,
  ApiTags,
} from '@nestjs/swagger';
import { ActivityTypeEntity } from './entities/activity-type.entity';
import ApiBaseResponses from '@decorators/api-base-response.decorator';
import ApiOkBaseResponse from '@decorators/api-ok-base-response.decorator';
import { AccessGuard, Actions, UseAbility } from '@modules/casl';
import Serialize from '@decorators/serialize.decorator';
import { PrismaQueryBuilderPipe } from '@decorators/prismaQueryBuilder.decorator';
import { PaginatorTypes } from '@nodeteam/nestjs-prisma-pagination';

@ApiTags('Activity')
@ApiBearerAuth()
@ApiExtraModels(ActivityTypeEntity)
@ApiBaseResponses()
@Controller('activity-type')
export class ActivityTypeController {
  constructor(private readonly activityTypeService: ActivityTypeService) {}

  @Get()
  @ApiQuery({ name: 'where', required: false, type: 'string' })
  @ApiQuery({ name: 'sort', required: false, type: 'string' })
  @ApiQuery({ name: 'limit', required: false, type: 'number' })
  @ApiQuery({ name: 'page', required: false, type: 'number' })
  @ApiQuery({ name: 'fields', required: false, type: 'string' })
  @ApiOkBaseResponse({ dto: ActivityTypeEntity, isArray: true })
  @UseGuards(AccessGuard)
  @Serialize(ActivityTypeEntity)
  @UseAbility(Actions.read, ActivityTypeEntity)
  @UsePipes(PrismaQueryBuilderPipe)
  async findAll(
    @Query() query: any,
  ): Promise<PaginatorTypes.PaginatedResult<ActivityTypeEntity>> {
    const { where, orderBy } = query;
    return this.activityTypeService.findAll(where, orderBy);
  }

  @ApiBody({ type: CreateActivityTypeDto })
  @Serialize(ActivityTypeEntity)
  @UseAbility(Actions.create, ActivityTypeEntity)
  @Post()
  create(@Body() CreateActivityTypeDto: CreateActivityTypeDto) {
    return this.activityTypeService.create(CreateActivityTypeDto);
  }

  @ApiParam({ name: 'id', required: true, type: 'string' })
  @Serialize(ActivityTypeEntity)
  @UseAbility(Actions.read, ActivityTypeEntity)
  @Get(':id')
  findById(@Param('id') id: string) {
    return this.activityTypeService.findById(id);
  }

  @ApiParam({ name: 'id', required: true, type: 'string' })
  @ApiBody({ type: UpdateActivityTypeDto })
  @Serialize(ActivityTypeEntity)
  @UseAbility(Actions.update, ActivityTypeEntity)
  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() UpdateActivityTypeDto: UpdateActivityTypeDto,
  ) {
    return this.activityTypeService.update(id, UpdateActivityTypeDto);
  }

  @ApiParam({ name: 'id', required: true, type: 'string' })
  @ApiBody({ type: UpdateActivityTypeDto })
  @Serialize(ActivityTypeEntity)
  @UseAbility(Actions.delete, ActivityTypeEntity)
  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.activityTypeService.remove(id);
  }
}
