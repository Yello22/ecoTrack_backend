import { Module } from '@nestjs/common';
import { SimulationService } from './simulation.service';
import { SimulationController } from './simulation.controller';
import { CaslModule } from '@modules/casl';
import { permissions } from './simulation.permissions';
import { SimulationRepository } from './simulation.repository';

@Module({
  imports: [CaslModule.forFeature({ permissions })],
  controllers: [SimulationController],
  providers: [SimulationService, SimulationRepository],
})
export class SimulationModule {}
