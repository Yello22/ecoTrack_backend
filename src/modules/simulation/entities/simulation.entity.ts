// SimulationEntity.ts
import { Prisma, Simulation } from '@prisma/client';
import { ApiProperty } from '@nestjs/swagger';

export class SimulationEntity implements Simulation {
  @ApiProperty({
    type: String,
    description: 'Unique identifier for the simulation',
  })
  id: string;

  @ApiProperty({
    type: String,
    description: 'Computed result for the simulation',
  })
  computedResults: Prisma.JsonValue;

  @ApiProperty({
    type: Object,
    description: 'Details of the simulation situation as a JSON object',
  })
  situation: Prisma.JsonValue;

  @ApiProperty({
    type: [String],
    description: 'Array of folded steps in the simulation',
  })
  foldedSteps: string[];

  @ApiProperty({ type: Object, description: 'Action choices as a JSON object' })
  actionChoices: Prisma.JsonValue;

  @ApiProperty({
    type: Number,
    description: 'Progression status of the simulation',
  })
  progression: number;

  @ApiProperty({
    type: String,
    description: 'ID of the user associated with the simulation',
  })
  userId: string;

  @ApiProperty({
    type: String,
    description: 'ID of the computed results associated with the simulation',
    required: false,
  })
  computedResultsId: string;

  @ApiProperty({
    type: Date,
    description: 'Date when the simulation was created',
  })
  date: Date;

  @ApiProperty({
    type: Date,
    description: 'Date when the simulation was last updated',
  })
  updatedAt: Date;

  @ApiProperty({
    type: Date,
    description: 'Date when the simulation was marked as deleted',
    required: false,
  })
  deletedAt: Date;
}
