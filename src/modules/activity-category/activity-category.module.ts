import { Module } from '@nestjs/common';
import { ActivityCategoryService } from './activity-category.service';
import { ActivityCategoryController } from './activity-category.controller';
import { CaslModule } from '@modules/casl';
import { permissions } from './activity-category.permissions';
import { ActivityCategoryRepository } from './activity-category.repository';

@Module({
  imports: [CaslModule.forFeature({ permissions })],
  controllers: [ActivityCategoryController],
  providers: [ActivityCategoryService, ActivityCategoryRepository],
})
export class ActivityCategoryModule {}
