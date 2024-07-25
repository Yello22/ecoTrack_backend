import { IsString, IsNotEmpty, IsNumber } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class CreateActivityDto {
  @ApiProperty({ type: String })
  @IsString()
  readonly description!: string;

  @ApiProperty({ type: Number })
  @IsNumber()
  @IsNotEmpty()
  readonly carbonEmission!: number;

  @ApiProperty({ type: String })
  @IsString()
  @IsNotEmpty()
  readonly userId!: string;

  @ApiProperty({ type: String })
  @IsString()
  @IsNotEmpty()
  readonly activityTypeId!: string;
}
