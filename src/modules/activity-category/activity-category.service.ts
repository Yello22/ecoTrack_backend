import { Injectable } from '@nestjs/common';
import { CreateActivityCategoryDto } from './dto/create-activity-category.dto';
import { UpdateActivityCategoryDto } from './dto/update-activity-category.dto';
import { ActivityCategoryRepository } from './activity-category.repository';

import { ActivityCategory, Prisma } from '@prisma/client';
import { PaginatorTypes } from '@nodeteam/nestjs-prisma-pagination';

@Injectable()
export class ActivityCategoryService {
  constructor(
    private readonly activityCategoryRepository: ActivityCategoryRepository,
  ) {}

  async findById(id: string): Promise<ActivityCategory> {
    return await this.activityCategoryRepository.findById(id);
  }

  create(CreateActivityTypeDto: CreateActivityCategoryDto) {
    return this.activityCategoryRepository.create(CreateActivityTypeDto);
  }

  findAll(
    where: Prisma.ActivityCategoryWhereInput,
    orderBy: Prisma.ActivityOrderByWithRelationInput,
  ): Promise<PaginatorTypes.PaginatedResult<ActivityCategory>> {
    return this.activityCategoryRepository.findAll(where, orderBy);
  }

  async findOne(
    params: Prisma.ActivityCategoryFindFirstArgs,
  ): Promise<ActivityCategory | null> {
    return this.activityCategoryRepository.findOne(params);
  }

  async update(
    id: string,
    data: UpdateActivityCategoryDto,
  ): Promise<ActivityCategory> {
    return this.activityCategoryRepository.update(id, data);
  }

  async remove(id: string): Promise<ActivityCategory> {
    return this.activityCategoryRepository.delete(id);
  }
}
