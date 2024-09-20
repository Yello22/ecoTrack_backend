import { IsBoolean, IsOptional, IsDate } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class UpdateTutorialDto {
  @ApiProperty({
    type: Boolean,
    description: 'Indicates if the test introduction is active',
    required: false,
  })
  @IsBoolean()
  @IsOptional()
  readonly testIntro?: boolean;

  @ApiProperty({
    type: Boolean,
    description: 'Indicates if score explanation is provided',
    required: false,
  })
  @IsBoolean()
  @IsOptional()
  readonly scoreExplanation?: boolean;

  @ApiProperty({
    type: Date,
    description: 'Deleted at timestamp',
    required: false,
  })
  @IsDate()
  @IsOptional()
  readonly deletedAt?: Date;
}
