import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  UseGuards,
  Query,
  UsePipes,
} from '@nestjs/common';
import { ActivityService } from './activity.service';
import { CreateActivityDto } from './dto/create-activity.dto';
import { UpdateActivityDto } from './dto/update-activity.dto';
import {
  ApiBearerAuth,
  ApiBody,
  ApiExtraModels,
  ApiParam,
  ApiQuery,
  ApiTags,
} from '@nestjs/swagger';
import { ActivityEntity } from './entities/activity.entity';
import ApiBaseResponses from '@decorators/api-base-response.decorator';
import ApiOkBaseResponse from '@decorators/api-ok-base-response.decorator';
import { AccessGuard, Actions, UseAbility } from '@modules/casl';
import Serialize from '@decorators/serialize.decorator';
import { PaginatorTypes } from '@nodeteam/nestjs-prisma-pagination';
import { PrismaQueryBuilderPipe } from '@decorators/prismaQueryBuilder.decorator';

@ApiTags('Activity')
@ApiBearerAuth()
@ApiExtraModels(ActivityEntity)
@ApiBaseResponses()
@Controller('activities')
export class ActivityController {
  constructor(private readonly activityService: ActivityService) {}

  @Get()
  @ApiQuery({ name: 'where', required: false, type: 'string' })
  @ApiQuery({ name: 'sort', required: false, type: 'string' })
  @ApiQuery({ name: 'limit', required: false, type: 'number' })
  @ApiQuery({ name: 'page', required: false, type: 'number' })
  @ApiQuery({ name: 'fields', required: false, type: 'string' })
  @ApiOkBaseResponse({ dto: ActivityEntity, isArray: true })
  @UseGuards(AccessGuard)
  @Serialize(ActivityEntity)
  @UseAbility(Actions.read, ActivityEntity)
  @UsePipes(PrismaQueryBuilderPipe)
  async findAll(
    @Query() query: any,
  ): Promise<PaginatorTypes.PaginatedResult<ActivityEntity>> {
    const { where, orderBy } = query;
    return this.activityService.findAll(where, orderBy);
  }

  @ApiBody({ type: CreateActivityDto })
  @Serialize(ActivityEntity)
  @UseAbility(Actions.create, ActivityEntity)
  @Post()
  create(@Body() createActivityDto: CreateActivityDto) {
    return this.activityService.create(createActivityDto);
  }

  @ApiParam({ name: 'id', required: true, type: 'string' })
  @Serialize(ActivityEntity)
  @UseAbility(Actions.read, ActivityEntity)
  @Get(':id')
  findById(@Param('id') id: string) {
    return this.activityService.findById(id);
  }

  @ApiParam({ name: 'id', required: true, type: 'string' })
  @ApiBody({ type: UpdateActivityDto })
  @Serialize(ActivityEntity)
  @UseAbility(Actions.update, ActivityEntity)
  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateActivityDto: UpdateActivityDto,
  ) {
    return this.activityService.update(id, updateActivityDto);
  }

  @ApiParam({ name: 'id', required: true, type: 'string' })
  @ApiBody({ type: UpdateActivityDto })
  @Serialize(ActivityEntity)
  @UseAbility(Actions.delete, ActivityEntity)
  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.activityService.remove(id);
  }
}
