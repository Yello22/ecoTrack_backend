import { Module } from '@nestjs/common';
import { ActivityService } from './activity.service';
import { ActivityController } from './activity.controller';
import { CaslModule } from '@modules/casl';
import { permissions } from './activity.permissions';
import { ActivityRepository } from './activity.repository';

@Module({
  imports: [CaslModule.forFeature({ permissions })],
  controllers: [ActivityController],
  providers: [ActivityService, ActivityRepository],
})
export class ActivityModule {}
