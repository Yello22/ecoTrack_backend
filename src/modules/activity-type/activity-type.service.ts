import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateActivityTypeDto } from './dto/create-activity-type.dto';
import { UpdateActivityTypeDto } from './dto/update-activity-type.dto';
import { ActivityTypeRepository } from './activity-type.repository';
import { ActivityType, Prisma } from '@prisma/client';
import { PaginatorTypes } from '@nodeteam/nestjs-prisma-pagination';

@Injectable()
export class ActivityTypeService {
  constructor(
    private readonly activityTypeRepository: ActivityTypeRepository,
  ) {}

  async findById(id: string): Promise<ActivityType> {
    return await this.activityTypeRepository.findById(id);
  }

  create(CreateActivityTypeDto: CreateActivityTypeDto) {
    return this.activityTypeRepository.create(CreateActivityTypeDto);
  }

  findAll(
    where: Prisma.ActivityTypeWhereInput,
    orderBy: Prisma.ActivityTypeOrderByWithRelationInput,
  ): Promise<PaginatorTypes.PaginatedResult<ActivityType>> {
    return this.activityTypeRepository.findAll(where, orderBy);
  }

  async findOne(
    params: Prisma.ActivityTypeFindFirstArgs,
  ): Promise<ActivityType | null> {
    return this.activityTypeRepository.findOne(params);
  }

  async update(id: string, data: UpdateActivityTypeDto): Promise<ActivityType> {
    return this.activityTypeRepository.update(id, data);
  }

  async remove(id: string): Promise<ActivityType> {
    return this.activityTypeRepository.delete(id);
  }
}
