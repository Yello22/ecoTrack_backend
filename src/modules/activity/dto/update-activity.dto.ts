import { IsString, IsNotEmpty, IsNumber } from 'class-validator';
import { PartialType } from '@nestjs/swagger';
import { CreateActivityDto } from './create-activity.dto';

export class UpdateActivityDto extends PartialType(CreateActivityDto) {
  @IsString()
  readonly description!: string;

  @IsNumber()
  @IsNotEmpty()
  readonly carbonEmission!: number;

  @IsString()
  readonly activityCategoryId!: string;
}
