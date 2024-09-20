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
import { TutorialService } from './tutorial.service';
import { CreateTutorialDto } from './dto/create-tutorial.dto';
import { UpdateTutorialDto } from './dto/update-tutorial.dto';
import {
  ApiBearerAuth,
  ApiBody,
  ApiExtraModels,
  ApiParam,
  ApiQuery,
  ApiTags,
} from '@nestjs/swagger';
import { TutorialEntity } from './entities/tutorial.entity';
import ApiBaseResponses from '@decorators/api-base-response.decorator';
import ApiOkBaseResponse from '@decorators/api-ok-base-response.decorator';
import { AccessGuard, Actions, UseAbility } from '@modules/casl';
import Serialize from '@decorators/serialize.decorator';
import { PaginatorTypes } from '@nodeteam/nestjs-prisma-pagination';
import { PrismaQueryBuilderPipe } from '@decorators/prismaQueryBuilder.decorator';
import { Tutorials } from '@prisma/client';

@ApiTags('Tutorials')
@ApiBearerAuth()
@ApiExtraModels(TutorialEntity)
@ApiBaseResponses()
@Controller('tutorials')
export class TutorialController {
  constructor(private readonly tutorialService: TutorialService) {}

  @Get()
  @ApiQuery({ name: 'where', required: false, type: 'string' })
  @ApiQuery({ name: 'sort', required: false, type: 'string' })
  @ApiQuery({ name: 'limit', required: false, type: 'number' })
  @ApiQuery({ name: 'page', required: false, type: 'number' })
  @ApiQuery({ name: 'fields', required: false, type: 'string' })
  @ApiOkBaseResponse({ dto: TutorialEntity, isArray: true })
  @UseGuards(AccessGuard)
  @Serialize(TutorialEntity)
  @UseAbility(Actions.read, TutorialEntity)
  @UsePipes(PrismaQueryBuilderPipe)
  async findAll(
    @Query() query: any,
  ): Promise<PaginatorTypes.PaginatedResult<Tutorials>> {
    const { where, orderBy } = query;
    return this.tutorialService.findAll(where, orderBy);
  }

  @ApiBody({ type: CreateTutorialDto })
  @Serialize(TutorialEntity)
  @UseAbility(Actions.create, TutorialEntity)
  @Post()
  create(@Body() createTutorialDto: CreateTutorialDto) {
    return this.tutorialService.create(createTutorialDto);
  }

  @ApiParam({ name: 'id', required: true, type: 'string' })
  @Serialize(TutorialEntity)
  @UseAbility(Actions.read, TutorialEntity)
  @Get(':id')
  findById(@Param('id') id: string) {
    return this.tutorialService.findById(id);
  }

  @ApiParam({ name: 'id', required: true, type: 'string' })
  @ApiBody({ type: UpdateTutorialDto })
  @Serialize(TutorialEntity)
  @UseAbility(Actions.update, TutorialEntity)
  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateTutorialDto: UpdateTutorialDto,
  ) {
    return this.tutorialService.update(id, updateTutorialDto);
  }

  @ApiParam({ name: 'id', required: true, type: 'string' })
  @Serialize(TutorialEntity)
  @UseAbility(Actions.delete, TutorialEntity)
  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.tutorialService.remove(id);
  }
}
