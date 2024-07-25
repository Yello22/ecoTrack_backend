import { Module } from '@nestjs/common';
import { EnvironmentalDataService } from './environmental-data.service';
import { EnvironmentalDataController } from './environmental-data.controller';

@Module({
  controllers: [EnvironmentalDataController],
  providers: [EnvironmentalDataService]
})
export class EnvironmentalDataModule {}
