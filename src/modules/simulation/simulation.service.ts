import { Injectable } from '@nestjs/common';
import { CreateSimulationDto } from './dto/create-simulation.dto';
import { UpdateSimulationDto } from './dto/update-simulation.dto';
import { Simulation, Prisma } from '@prisma/client';
import { PaginatorTypes } from '@nodeteam/nestjs-prisma-pagination';
import { SimulationRepository } from './simulation.repository';
import { SyncSimulationDto } from './dto/sync-simulation.dto';
import { subDays, startOfDay } from 'date-fns';

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

  async sync(
    data: Array<SyncSimulationDto>,
    userId: string,
  ): Promise<Simulation[]> {
    const ids = data.map((element) => element.id);

    const storedSimulations = await this.simulationRepository.findAll(
      { id: { in: ids } },
      { createdAt: 'desc' },
    );

    const storedSimulationsMap = new Map(
      storedSimulations.data.map((sim) => [sim.id, sim]),
    );

    await Promise.all(
      data.map(async (simulation: SyncSimulationDto) => {
        const storedSim = storedSimulationsMap.get(simulation.id);

        if (!storedSim) {
          await this.simulationRepository.create({
            ...simulation,
            user: { connect: { id: userId } },
          });
        } else if (
          new Date(simulation.updatedAt) > new Date(storedSim.updatedAt)
        ) {
          await this.simulationRepository.update(storedSim.id, {
            ...simulation,
            user: { connect: { id: userId } },
          });
        }
      }),
    );

    const sevenDaysAgo = startOfDay(subDays(new Date(), 6));

    const recentSimulations = await this.simulationRepository.findAll(
      {
        userId: userId,
        createdAt: { gte: sevenDaysAgo },
      },
      { createdAt: 'desc' },
    );

    const uniqueSimulationsByDay = new Map<string, Simulation>();

    recentSimulations.data.forEach((simulation) => {
      const dayKey = startOfDay(new Date(simulation.createdAt)).toISOString();

      if (
        !uniqueSimulationsByDay.has(dayKey) ||
        new Date(simulation.createdAt) >
          new Date(uniqueSimulationsByDay.get(dayKey)?.createdAt)
      ) {
        uniqueSimulationsByDay.set(dayKey, simulation);
      }
    });
    return Array.from(uniqueSimulationsByDay.values());
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
