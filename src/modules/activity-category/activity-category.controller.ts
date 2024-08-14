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
import { ActivityCategoryService } from './activity-category.service';
import { UpdateActivityCategoryDto } from './dto/update-activity-category.dto';
import {
  ApiBearerAuth,
  ApiBody,
  ApiExtraModels,
  ApiParam,
  ApiQuery,
  ApiTags,
} from '@nestjs/swagger';
import { ActivityCategoryEntity } from './entities/activity-category.entity';
import ApiBaseResponses from '@decorators/api-base-response.decorator';
import ApiOkBaseResponse from '@decorators/api-ok-base-response.decorator';
import { AccessGuard, Actions, UseAbility } from '@modules/casl';
import Serialize from '@decorators/serialize.decorator';
import { PrismaQueryBuilderPipe } from '@decorators/prismaQueryBuilder.decorator';
import { PaginatorTypes } from '@nodeteam/nestjs-prisma-pagination';
import { CreateActivityCategoryDto } from './dto/create-activity-category.dto';

@ApiTags('Activity')
@ApiBearerAuth()
@ApiExtraModels(ActivityCategoryEntity)
@ApiBaseResponses()
@Controller('activity-category')
export class ActivityCategoryController {
  constructor(private readonly activityTypeService: ActivityCategoryService) {}

  @Get()
  @ApiQuery({ name: 'where', required: false, type: 'string' })
  @ApiQuery({ name: 'sort', required: false, type: 'string' })
  @ApiQuery({ name: 'limit', required: false, type: 'number' })
  @ApiQuery({ name: 'page', required: false, type: 'number' })
  @ApiQuery({ name: 'fields', required: false, type: 'string' })
  @ApiOkBaseResponse({ dto: ActivityCategoryEntity, isArray: true })
  @UseGuards(AccessGuard)
  @Serialize(ActivityCategoryEntity)
  @UseAbility(Actions.read, ActivityCategoryEntity)
  @UsePipes(PrismaQueryBuilderPipe)
  async findAll(
    @Query() query: any,
  ): Promise<PaginatorTypes.PaginatedResult<ActivityCategoryEntity>> {
    const { where, orderBy } = query;
    return this.activityTypeService.findAll(where, orderBy);
  }

  @ApiBody({ type: CreateActivityCategoryDto })
  @Serialize(ActivityCategoryEntity)
  @UseAbility(Actions.create, ActivityCategoryEntity)
  @Post()
  create(@Body() CreateActivityTypeDto: CreateActivityCategoryDto) {
    return this.activityTypeService.create(CreateActivityTypeDto);
  }

  @ApiParam({ name: 'id', required: true, type: 'string' })
  @Serialize(ActivityCategoryEntity)
  @UseAbility(Actions.read, ActivityCategoryEntity)
  @Get(':id')
  findById(@Param('id') id: string) {
    return this.activityTypeService.findById(id);
  }

  @ApiParam({ name: 'id', required: true, type: 'string' })
  @ApiBody({ type: UpdateActivityCategoryDto })
  @Serialize(ActivityCategoryEntity)
  @UseAbility(Actions.update, ActivityCategoryEntity)
  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() UpdateActivityTypeDto: UpdateActivityCategoryDto,
  ) {
    return this.activityTypeService.update(id, UpdateActivityTypeDto);
  }

  @ApiParam({ name: 'id', required: true, type: 'string' })
  @ApiBody({ type: UpdateActivityCategoryDto })
  @Serialize(ActivityCategoryEntity)
  @UseAbility(Actions.delete, ActivityCategoryEntity)
  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.activityTypeService.remove(id);
  }
}
