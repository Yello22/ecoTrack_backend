import { IsString, IsNotEmpty, IsNumber } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class CreateActivityTypeDto {
  @ApiProperty({ type: String })
  @IsString()
  @IsNotEmpty()
  readonly name!: string;

  @ApiProperty({ type: Number })
  @IsNumber()
  @IsNotEmpty()
  readonly carbonFactor!: number;
}
