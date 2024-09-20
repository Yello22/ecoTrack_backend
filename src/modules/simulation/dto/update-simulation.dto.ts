// UpdateSimulationDto.ts
import {
  IsString,
  IsOptional,
  IsNumber,
  IsArray,
  IsObject,
  IsDate,
  IsUUID,
} from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class UpdateSimulationDto {
  @ApiProperty({
    type: Object,
    description: 'The situation details as JSON object',
    required: false,
  })
  @IsObject()
  @IsOptional()
  readonly situation?: Record<string, any>;

  @ApiProperty({
    type: [String],
    description: 'List of folded steps',
    required: false,
  })
  @IsArray()
  @IsString({ each: true })
  @IsOptional()
  readonly foldedSteps?: string[];

  @ApiProperty({
    type: Object,
    description: 'Action choices as JSON object',
    required: false,
  })
  @IsObject()
  @IsOptional()
  readonly actionChoices?: Record<string, any>;

  @ApiProperty({
    type: Object,
    description: 'Computed results as JSON object',
    required: false,
  })
  @IsObject()
  @IsOptional()
  readonly computedResults?: Record<string, any>;

  @ApiProperty({
    type: Number,
    description: 'Progression of the simulation',
    required: false,
  })
  @IsNumber()
  @IsOptional()
  readonly progression?: number;

  @ApiProperty({
    type: String,
    description: 'User ID associated with the simulation',
    required: false,
  })
  @IsUUID()
  @IsOptional()
  readonly userId?: string;

  @ApiProperty({
    type: Date,
    description: 'Date of the simulation',
    required: false,
  })
  @IsDate()
  @IsOptional()
  readonly date?: Date;

  @ApiProperty({
    type: Date,
    description: 'Deleted at timestamp',
    required: false,
  })
  @IsDate()
  @IsOptional()
  readonly deletedAt?: Date;
}
