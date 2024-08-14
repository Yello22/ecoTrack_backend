import { IsString, IsNotEmpty, IsNumber } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class CreateActivityCategoryDto {
  @ApiProperty({ type: String })
  @IsString()
  @IsNotEmpty()
  readonly name!: string;
}
