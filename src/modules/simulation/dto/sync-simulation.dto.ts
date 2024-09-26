import {
  IsString,
  IsOptional,
  IsNumber,
  IsArray,
  IsObject,
  IsUUID,
} from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class SyncSimulationDto {
  @ApiProperty({
    type: String,
    description: 'The situation ID',
    required: false,
  })
  readonly id?: string;

  @ApiProperty({
    type: Object,
    description: 'The situation details as JSON object',
    required: false,
  })
  @IsObject()
  @IsOptional()
  readonly situation: Record<string, any>;

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
  readonly actionChoices: Record<string, any>;

  @ApiProperty({
    type: Object,
    description: 'Computed results as JSON object',
    required: false,
  })
  @IsObject()
  @IsOptional()
  readonly computedResults: Record<string, any>;

  @ApiProperty({
    type: Number,
    description: 'Progression of the simulation',
    required: false,
  })
  @IsNumber()
  @IsOptional()
  readonly progression: number;

  @ApiProperty({
    type: String,
    description: 'User ID associated with the simulation',
    required: false,
  })
  @IsUUID()
  @IsOptional()
  readonly userId: string;

  @ApiProperty({
    type: String,
    description: 'Date of the simulation',
    required: false,
  })
  @IsOptional()
  readonly date: string;

  @ApiProperty({
    type: String,
    description: 'Create date of the simulation',
    required: false,
  })
  @IsOptional()
  readonly createdAt: string;

  @ApiProperty({
    type: String,
    description: 'Update Date of the simulation',
    required: false,
  })
  @IsOptional()
  readonly updatedAt?: string;
}
