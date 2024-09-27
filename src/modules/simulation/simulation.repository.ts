import { PrismaService } from '@providers/prisma';
import { Injectable } from '@nestjs/common';
import { paginator } from '@nodeteam/nestjs-prisma-pagination';
import { PaginatorTypes } from '@nodeteam/nestjs-prisma-pagination';
import { Prisma, Simulation } from '@prisma/client';

@Injectable()
export class SimulationRepository {
  private readonly paginate: PaginatorTypes.PaginateFunction;

  constructor(private prisma: PrismaService) {
    /**
     * @desc Create a paginate function
     * @param model
     * @param options
     * @returns Promise<PaginatorTypes.PaginatedResult<T>>
     */
    this.paginate = paginator({
      page: 1,
      perPage: 100,
    });
  }

  /**
   * @desc Find activity By ID
   * @param id string
   * @returns Promise<Activity>
   */
  findById(id: string): Promise<Simulation> {
    return this.prisma.simulation.findUnique({
      where: { id },
    });
  }

  /**
   * @desc Find a activity by params
   * @param params Prisma.ActivityFindFirstArgs
   * @returns Promise<Activity | null>
   *       If the activity is not found, return null
   */
  async findOne(
    params: Prisma.SimulationFindFirstArgs,
  ): Promise<Simulation | null> {
    return this.prisma.simulation.findFirst(params);
  }

  /**
   * @desc Create a new activity
   * @param data Prisma.ActivityCreateInput
   * @returns Promise<Activity>
   */
  async create(data: Prisma.SimulationCreateInput): Promise<Simulation> {
    return this.prisma.simulation.create({
      data,
    });
  }

  /**
   * @desc Update activity
   * @param id: string
   * @param data Prisma.ActivityUpdateInput
   * @returns Promise<Activity>
   */
  async update(
    id: string,
    data: Prisma.SimulationUpdateInput,
  ): Promise<Simulation> {
    return this.prisma.simulation.update({
      where: { id },
      data,
    });
  }

  /**
   * @desc Find all activity with pagination
   * @param where Prisma.ActivityWhereInput
   * @param orderBy Prisma.ActivityOrderByWithRelationInput
   * @returns Promise<PaginatorTypes.PaginatedResult<Activity>>
   */
  async findAll(
    where: Prisma.SimulationWhereInput,
    orderBy: Prisma.SimulationOrderByWithRelationInput,
    include?: Prisma.SimulationInclude,
  ): Promise<PaginatorTypes.PaginatedResult<Simulation>> {
    return this.paginate(this.prisma.simulation, {
      where,
      orderBy,
      include,
    });
  }

  /**
   * @desc Delete activity
   * @param id string
   * @returns Promise<Activity>
   */
  async delete(id: string): Promise<Simulation> {
    return this.prisma.simulation.delete({ where: { id } });
  }
}
