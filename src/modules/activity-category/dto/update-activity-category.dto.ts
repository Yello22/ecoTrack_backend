import { PartialType } from '@nestjs/swagger';
import { CreateActivityCategoryDto } from './create-activity-category.dto';

export class UpdateActivityCategoryDto extends PartialType(
  CreateActivityCategoryDto,
) {}
