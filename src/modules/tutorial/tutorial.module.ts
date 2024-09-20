import { Module } from '@nestjs/common';
import { TutorialService } from './tutorial.service';
import { TutorialController } from './tutorial.controller';
import { TutorialRepository } from './tutorial.repository';
import { permissions } from './tutorial.permissions';
import { CaslModule } from '@modules/casl';

@Module({
  imports: [CaslModule.forFeature({ permissions })],
  controllers: [TutorialController],
  providers: [TutorialService, TutorialRepository],
})
export class TutorialModule {}
