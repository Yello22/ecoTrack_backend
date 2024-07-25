import { PrismaService } from '@providers/prisma';
import { Injectable } from '@nestjs/common';
import { paginator } from '@nodeteam/nestjs-prisma-pagination';
import { PaginatorTypes } from '@nodeteam/nestjs-prisma-pagination';
import { Prisma, ActivityType } from '@prisma/client';

@Injectable()
export class ActivityTypeRepository {
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
      perPage: 10,
    });
  }

  /**
   * @desc Find ActivityType By ID
   * @param id string
   * @returns Promise<ActivityType>
   */
  findById(id: string): Promise<ActivityType> {
    return this.prisma.activityType.findUnique({
      where: { id },
    });
  }

  /**
   * @desc Find a ActivityType by params
   * @param params Prisma.ActivityTypeFindFirstArgs
   * @returns Promise<ActivityType | null>
   *       If the ActivityType is not found, return null
   */
  async findOne(
    params: Prisma.ActivityTypeFindFirstArgs,
  ): Promise<ActivityType | null> {
    return this.prisma.activityType.findFirst(params);
  }

  /**
   * @desc Create a new ActivityType
   * @param data Prisma.ActivityTypeCreateInput
   * @returns Promise<ActivityType>
   */
  async create(data: Prisma.ActivityTypeCreateInput): Promise<ActivityType> {
    return this.prisma.activityType.create({
      data,
    });
  }

  /**
   * @desc Update ActivityType
   * @param id: string
   * @param data Prisma.ActivityTypeUpdateInput
   * @returns Promise<ActivityType>
   */
  async update(
    id: string,
    data: Prisma.ActivityTypeUpdateInput,
  ): Promise<ActivityType> {
    return this.prisma.activityType.update({
      where: { id },
      data,
    });
  }

  /**
   * @desc Find all ActivityType with pagination
   * @param where Prisma.ActivityTypeWhereInput
   * @param orderBy Prisma.ActivityTypeOrderByWithRelationInput
   * @returns Promise<PaginatorTypes.PaginatedResult<ActivityType>>
   */
  async findAll(
    where: Prisma.ActivityTypeWhereInput,
    orderBy: Prisma.ActivityTypeOrderByWithRelationInput,
  ): Promise<PaginatorTypes.PaginatedResult<ActivityType>> {
    return this.paginate(this.prisma.activityType, {
      where,
      orderBy,
    });
  }

  /**
   * @desc Delete ActivityType
   * @param id string
   * @returns Promise<ActivityType>
   */
  async delete(id: string): Promise<ActivityType> {
    return this.prisma.activityType.delete({ where: { id } });
  }
}
