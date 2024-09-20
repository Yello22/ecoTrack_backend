import { PrismaService } from '@providers/prisma';
import { Injectable } from '@nestjs/common';
import { paginator } from '@nodeteam/nestjs-prisma-pagination';
import { PaginatorTypes } from '@nodeteam/nestjs-prisma-pagination';
import { Prisma, Tutorials } from '@prisma/client';

@Injectable()
export class TutorialRepository {
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
   * @desc Find tutorial by ID
   * @param id string
   * @returns Promise<Tutorials>
   */
  findById(id: string): Promise<Tutorials> {
    return this.prisma.tutorials.findUnique({
      where: { id },
    });
  }

  /**
   * @desc Find a tutorial by params
   * @param params Prisma.TutorialsFindFirstArgs
   * @returns Promise<Tutorials | null>
   *       If the tutorial is not found, return null
   */
  async findOne(
    params: Prisma.TutorialsFindFirstArgs,
  ): Promise<Tutorials | null> {
    return this.prisma.tutorials.findFirst(params);
  }

  /**
   * @desc Create a new tutorial
   * @param data Prisma.TutorialsCreateInput
   * @returns Promise<Tutorials>
   */
  async create(data: Prisma.TutorialsCreateInput): Promise<Tutorials> {
    return this.prisma.tutorials.create({
      data,
    });
  }

  /**
   * @desc Update tutorial
   * @param id: string
   * @param data Prisma.TutorialsUpdateInput
   * @returns Promise<Tutorials>
   */
  async update(
    id: string,
    data: Prisma.TutorialsUpdateInput,
  ): Promise<Tutorials> {
    return this.prisma.tutorials.update({
      where: { id },
      data,
    });
  }

  /**
   * @desc Find all tutorials with pagination
   * @param where Prisma.TutorialsWhereInput
   * @param orderBy Prisma.TutorialsOrderByWithRelationInput
   * @returns Promise<PaginatorTypes.PaginatedResult<Tutorials>>
   */
  async findAll(
    where: Prisma.TutorialsWhereInput,
    orderBy: Prisma.TutorialsOrderByWithRelationInput,
  ): Promise<PaginatorTypes.PaginatedResult<Tutorials>> {
    return this.paginate(this.prisma.tutorials, {
      where,
      orderBy,
    });
  }

  /**
   * @desc Delete tutorial
   * @param id string
   * @returns Promise<Tutorials>
   */
  async delete(id: string): Promise<Tutorials> {
    return this.prisma.tutorials.delete({ where: { id } });
  }
}
