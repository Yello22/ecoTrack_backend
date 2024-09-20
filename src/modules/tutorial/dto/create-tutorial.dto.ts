import { IsBoolean, IsNotEmpty, IsOptional, IsDate } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class CreateTutorialDto {
  @ApiProperty({
    type: Boolean,
    description: 'Indicates if the test introduction is active',
  })
  @IsBoolean()
  @IsNotEmpty()
  readonly testIntro!: boolean;

  @ApiProperty({
    type: Boolean,
    description: 'Indicates if score explanation is provided',
  })
  @IsBoolean()
  @IsNotEmpty()
  readonly scoreExplanation!: boolean;

  @ApiProperty({
    type: Date,
    description: 'Deleted at timestamp',
    required: false,
  })
  @IsDate()
  @IsOptional()
  readonly deletedAt?: Date;
}
