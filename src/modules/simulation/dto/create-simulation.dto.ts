// CreateSimulationDto.ts
import {
  IsString,
  IsNotEmpty,
  IsNumber,
  IsOptional,
  IsArray,
  IsObject,
  IsDate,
  IsUUID,
} from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class CreateSimulationDto {
  @ApiProperty({
    type: Object,
    description: 'The situation details as JSON object',
  })
  @IsObject()
  @IsNotEmpty()
  readonly situation!: object;

  @ApiProperty({ type: [String], description: 'List of folded steps' })
  @IsArray()
  @IsString({ each: true })
  @IsNotEmpty()
  readonly foldedSteps!: string[];

  @ApiProperty({ type: Object, description: 'Action choices as JSON object' })
  @IsObject()
  @IsNotEmpty()
  readonly actionChoices!: object;

  @ApiProperty({ type: Number, description: 'Progression of the simulation' })
  @IsNumber()
  @IsNotEmpty()
  readonly progression!: number;

  @ApiProperty({
    type: String,
    description: 'User ID associated with the simulation',
  })
  @IsUUID()
  @IsNotEmpty()
  readonly userId!: string;

  @ApiProperty({
    type: Object,
    description: 'The computed results details as JSON object',
  })
  @IsObject()
  @IsNotEmpty()
  readonly computedResults: object;

  @ApiProperty({ type: Date, description: 'Date of the simulation' })
  @IsDate()
  @IsNotEmpty()
  readonly date!: Date;

  @ApiProperty({
    type: Date,
    description: 'Deleted at timestamp',
    required: false,
  })
  @IsDate()
  @IsOptional()
  readonly deletedAt?: Date;
}
