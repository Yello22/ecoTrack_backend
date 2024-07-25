import { Module } from '@nestjs/common';
import { ActivityTypeService } from './activity-type.service';
import { ActivityTypeController } from './activity-type.controller';
import { CaslModule } from '@modules/casl';
import { permissions } from './activity-type.permissions';
import { ActivityTypeRepository } from './activity-type.repository';

@Module({
  imports: [CaslModule.forFeature({ permissions })],
  controllers: [ActivityTypeController],
  providers: [ActivityTypeService, ActivityTypeRepository],
})
export class ActivityTypeModule {}
