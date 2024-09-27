import { Module } from '@nestjs/common';
import { SimulationService } from './simulation.service';
import { SimulationController } from './simulation.controller';
import { CaslModule } from '@modules/casl';
import { permissions } from './simulation.permissions';
import { SimulationRepository } from './simulation.repository';
import { UserModule } from '@modules/user/user.module';

@Module({
  imports: [CaslModule.forFeature({ permissions }), UserModule],
  controllers: [SimulationController],
  providers: [SimulationService, SimulationRepository],
})
export class SimulationModule {}
