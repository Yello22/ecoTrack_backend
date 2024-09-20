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
import { SimulationService } from './simulation.service';
import { CreateSimulationDto } from './dto/create-simulation.dto';
import { UpdateSimulationDto } from './dto/update-simulation.dto';
import {
  ApiBearerAuth,
  ApiBody,
  ApiExtraModels,
  ApiParam,
  ApiQuery,
  ApiTags,
} from '@nestjs/swagger';
import { SimulationEntity } from './entities/simulation.entity';
import ApiBaseResponses from '@decorators/api-base-response.decorator';
import ApiOkBaseResponse from '@decorators/api-ok-base-response.decorator';
import { AccessGuard, Actions, UseAbility } from '@modules/casl';
import Serialize from '@decorators/serialize.decorator';
import { PaginatorTypes } from '@nodeteam/nestjs-prisma-pagination';
import { PrismaQueryBuilderPipe } from '@decorators/prismaQueryBuilder.decorator';
import { Simulation } from '@prisma/client';

@ApiTags('Simulations')
@ApiBearerAuth()
@ApiExtraModels(SimulationEntity)
@ApiBaseResponses()
@Controller('simulations')
export class SimulationController {
  constructor(private readonly simulationService: SimulationService) {}

  @Get()
  @ApiQuery({ name: 'where', required: false, type: 'string' })
  @ApiQuery({ name: 'sort', required: false, type: 'string' })
  @ApiQuery({ name: 'limit', required: false, type: 'number' })
  @ApiQuery({ name: 'page', required: false, type: 'number' })
  @ApiQuery({ name: 'fields', required: false, type: 'string' })
  @ApiOkBaseResponse({ dto: SimulationEntity, isArray: true })
  @UseGuards(AccessGuard)
  @Serialize(SimulationEntity)
  @UseAbility(Actions.read, SimulationEntity)
  @UsePipes(PrismaQueryBuilderPipe)
  async findAll(
    @Query() query: any,
  ): Promise<PaginatorTypes.PaginatedResult<Simulation>> {
    const { where, orderBy } = query;
    return this.simulationService.findAll(where, orderBy);
  }

  @ApiBody({ type: CreateSimulationDto })
  @Serialize(SimulationEntity)
  @UseAbility(Actions.create, SimulationEntity)
  @Post()
  create(@Body() createSimulationDto: CreateSimulationDto) {
    return this.simulationService.create(createSimulationDto);
  }

  @ApiParam({ name: 'id', required: true, type: 'string' })
  @Serialize(SimulationEntity)
  @UseAbility(Actions.read, SimulationEntity)
  @Get(':id')
  findById(@Param('id') id: string) {
    return this.simulationService.findById(id);
  }

  @ApiParam({ name: 'id', required: true, type: 'string' })
  @ApiBody({ type: UpdateSimulationDto })
  @Serialize(SimulationEntity)
  @UseAbility(Actions.update, SimulationEntity)
  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateSimulationDto: UpdateSimulationDto,
  ) {
    return this.simulationService.update(id, updateSimulationDto);
  }

  @ApiParam({ name: 'id', required: true, type: 'string' })
  @Serialize(SimulationEntity)
  @UseAbility(Actions.delete, SimulationEntity)
  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.simulationService.remove(id);
  }
}
