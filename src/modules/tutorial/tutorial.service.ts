import { Injectable } from '@nestjs/common';
import { CreateTutorialDto } from './dto/create-tutorial.dto';
import { UpdateTutorialDto } from './dto/update-tutorial.dto';
import { Tutorials, Prisma } from '@prisma/client';
import { PaginatorTypes } from '@nodeteam/nestjs-prisma-pagination';
import { TutorialRepository } from './tutorial.repository';

@Injectable()
export class TutorialService {
  constructor(private readonly tutorialRepository: TutorialRepository) {}

  async findById(id: string): Promise<Tutorials> {
    return this.tutorialRepository.findById(id);
  }

  async create(createTutorialDto: CreateTutorialDto): Promise<Tutorials> {
    const data: Prisma.TutorialsCreateInput = {
      ...createTutorialDto,
    };

    return this.tutorialRepository.create(data);
  }

  async findAll(
    where: Prisma.TutorialsWhereInput,
    orderBy: Prisma.TutorialsOrderByWithRelationInput,
  ): Promise<PaginatorTypes.PaginatedResult<Tutorials>> {
    return this.tutorialRepository.findAll(where, orderBy);
  }

  async findOne(
    params: Prisma.TutorialsFindFirstArgs,
  ): Promise<Tutorials | null> {
    return this.tutorialRepository.findOne(params);
  }

  async update(id: string, data: UpdateTutorialDto): Promise<Tutorials> {
    return this.tutorialRepository.update(id, data);
  }

  async remove(id: string): Promise<Tutorials> {
    return this.tutorialRepository.delete(id);
  }
}
