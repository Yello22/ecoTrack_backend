import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateActivityDto } from './dto/create-activity.dto';
import { UpdateActivityDto } from './dto/update-activity.dto';
import { ActivityRepository } from './activity.repository';
import { Activity, Prisma } from '@prisma/client';
import { PaginatorTypes } from '@nodeteam/nestjs-prisma-pagination';
import { ACTIVITY_NOT_FOUND } from '@constants/errors.constants';

@Injectable()
export class ActivityService {
  constructor(private readonly activityRepository: ActivityRepository) {}

  async findById(id: string): Promise<Activity> {
    return await this.activityRepository.findById(id);
  }

  create(createActivityDto: CreateActivityDto) {
    const { userId, activityTypeId, ...rest } = createActivityDto;
    return this.activityRepository.create({
      ...rest,
      user: {
        connect: {
          id: userId,
        },
      },
      activityType: {
        connect: {
          id: activityTypeId,
        },
      },
    });
  }

  findAll(
    where: Prisma.ActivityWhereInput,
    orderBy: Prisma.ActivityOrderByWithRelationInput,
  ): Promise<PaginatorTypes.PaginatedResult<Activity>> {
    return this.activityRepository.findAll(where, orderBy);
  }

  async findOne(
    params: Prisma.ActivityFindFirstArgs,
  ): Promise<Activity | null> {
    return this.activityRepository.findOne(params);
  }

  async update(id: string, data: UpdateActivityDto): Promise<Activity> {
    const { activityTypeId, ...rest } = data;
    const updatedData: Prisma.ActivityUpdateInput = { ...rest };

    if (activityTypeId) {
      updatedData.activityType = {
        connect: {
          id: activityTypeId,
        },
      };
    }

    return this.activityRepository.update(id, updatedData);
  }

  async remove(id: string): Promise<Activity> {
    return this.activityRepository.delete(id);
  }
}
