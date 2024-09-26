// UpdateUserDto.ts
import { IsString, IsOptional, IsEmail, IsEnum, Length } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';
import { Roles } from '@prisma/client';

export class UpdateUserDto {
  @ApiProperty({
    type: String,
    description: 'User email address',
    required: false,
  })
  @IsEmail()
  @IsOptional()
  readonly email?: string;

  @ApiProperty({
    type: String,
    description: 'User phone number',
    required: false,
  })
  @IsString()
  @IsOptional()
  @Length(10, 15)
  readonly phone?: string;

  @ApiProperty({
    type: String,
    description: 'User first name',
    required: false,
  })
  @IsString()
  @IsOptional()
  readonly firstName?: string;

  @ApiProperty({
    type: String,
    description: 'User last name',
    required: false,
  })
  @IsString()
  @IsOptional()
  readonly lastName?: string;

  @ApiProperty({
    type: String,
    description: 'User password',
    required: false,
  })
  @IsString()
  @IsOptional()
  @Length(6, 50)
  readonly password?: string;

  @ApiProperty({
    type: String,
    description: 'State of the user',
    required: false,
  })
  @IsString()
  @IsOptional()
  @Length(0, 100)
  readonly state?: string;
}
