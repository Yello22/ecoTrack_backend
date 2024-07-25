import { PrismaService } from '@providers/prisma';
import { Injectable } from '@nestjs/common';
import { paginator } from '@nodeteam/nestjs-prisma-pagination';
import { PaginatorTypes } from '@nodeteam/nestjs-prisma-pagination';
import { Prisma, Activity, User } from '@prisma/client';

@Injectable()
export class ActivityRepository {
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
   * @desc Find activity By ID
   * @param id string
   * @returns Promise<Activity>
   */
  findById(id: string): Promise<Activity> {
    return this.prisma.activity.findUnique({
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
    params: Prisma.ActivityFindFirstArgs,
  ): Promise<Activity | null> {
    return this.prisma.activity.findFirst(params);
  }

  /**
   * @desc Create a new activity
   * @param data Prisma.ActivityCreateInput
   * @returns Promise<Activity>
   */
  async create(data: Prisma.ActivityCreateInput): Promise<Activity> {
    return this.prisma.activity.create({
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
    data: Prisma.ActivityUpdateInput,
  ): Promise<Activity> {
    return this.prisma.activity.update({
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
    where: Prisma.ActivityWhereInput,
    orderBy: Prisma.ActivityOrderByWithRelationInput,
  ): Promise<PaginatorTypes.PaginatedResult<Activity>> {
    return this.paginate(this.prisma.activity, {
      where,
      orderBy,
    });
  }

  /**
   * @desc Delete activity
   * @param id string
   * @returns Promise<Activity>
   */
  async delete(id: string): Promise<Activity> {
    return this.prisma.activity.delete({ where: { id } });
  }
}
