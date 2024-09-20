import { Injectable } from '@nestjs/common';
import { CreateSimulationDto } from './dto/create-simulation.dto';
import { UpdateSimulationDto } from './dto/update-simulation.dto';
import { Simulation, Prisma } from '@prisma/client';
import { PaginatorTypes } from '@nodeteam/nestjs-prisma-pagination';
import { SimulationRepository } from './simulation.repository';

@Injectable()
export class SimulationService {
  constructor(private readonly simulationRepository: SimulationRepository) {}

  async findById(id: string): Promise<Simulation> {
    return this.simulationRepository.findById(id);
  }

  async create(createSimulationDto: CreateSimulationDto): Promise<Simulation> {
    const { userId, ...rest } = createSimulationDto;
    const data: Prisma.SimulationCreateInput = {
      ...rest,
      user: { connect: { id: userId } },
    };

    return this.simulationRepository.create(data);
  }

  async findAll(
    where: Prisma.SimulationWhereInput,
    orderBy: Prisma.SimulationOrderByWithRelationInput,
  ): Promise<PaginatorTypes.PaginatedResult<Simulation>> {
    return this.simulationRepository.findAll(where, orderBy);
  }

  async findOne(
    params: Prisma.SimulationFindFirstArgs,
  ): Promise<Simulation | null> {
    return this.simulationRepository.findOne(params);
  }

  async update(id: string, data: UpdateSimulationDto): Promise<Simulation> {
    return this.simulationRepository.update(id, data);
  }

  async remove(id: string): Promise<Simulation> {
    return this.simulationRepository.delete(id);
  }
}
