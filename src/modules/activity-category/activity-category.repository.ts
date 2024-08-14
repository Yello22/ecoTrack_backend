import { PrismaService } from '@providers/prisma';
import { Injectable } from '@nestjs/common';
import { paginator } from '@nodeteam/nestjs-prisma-pagination';
import { PaginatorTypes } from '@nodeteam/nestjs-prisma-pagination';
import { Prisma, ActivityCategory } from '@prisma/client';

@Injectable()
export class ActivityCategoryRepository {
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
   * @desc Find ActivityCategory By ID
   * @param id string
   * @returns Promise<ActivityCategory>
   */
  findById(id: string): Promise<ActivityCategory> {
    return this.prisma.activityCategory.findUnique({
      where: { id },
    });
  }

  /**
   * @desc Find a ActivityCategory by params
   * @param params Prisma.ActivityCategoryFindFirstArgs
   * @returns Promise<ActivityCategory | null>
   *       If the ActivityCategory is not found, return null
   */
  async findOne(
    params: Prisma.ActivityCategoryFindFirstArgs,
  ): Promise<ActivityCategory | null> {
    return this.prisma.activityCategory.findFirst(params);
  }

  /**
   * @desc Create a new ActivityCategory
   * @param data Prisma.ActivityCategoryCreateInput
   * @returns Promise<ActivityCategory>
   */
  async create(
    data: Prisma.ActivityCategoryCreateInput,
  ): Promise<ActivityCategory> {
    return this.prisma.activityCategory.create({
      data,
    });
  }

  /**
   * @desc Update ActivityCategory
   * @param id: string
   * @param data Prisma.ActivityCategoryUpdateInput
   * @returns Promise<ActivityCategory>
   */
  async update(
    id: string,
    data: Prisma.ActivityCategoryUpdateInput,
  ): Promise<ActivityCategory> {
    return this.prisma.activityCategory.update({
      where: { id },
      data,
    });
  }

  /**
   * @desc Find all ActivityCategory with pagination
   * @param where Prisma.ActivityCategoryWhereInput
   * @param orderBy Prisma.ActivityCategoryOrderByWithRelationInput
   * @returns Promise<PaginatorTypes.PaginatedResult<ActivityCategory>>
   */
  async findAll(
    where: Prisma.ActivityCategoryWhereInput,
    orderBy: Prisma.ActivityCategoryOrderByWithRelationInput,
  ): Promise<PaginatorTypes.PaginatedResult<ActivityCategory>> {
    return this.paginate(this.prisma.activityCategory, {
      where,
      orderBy,
    });
  }

  /**
   * @desc Delete ActivityCategory
   * @param id string
   * @returns Promise<ActivityCategory>
   */
  async delete(id: string): Promise<ActivityCategory> {
    return this.prisma.activityCategory.delete({ where: { id } });
  }
}
