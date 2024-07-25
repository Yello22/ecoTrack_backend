import { Test, TestingModule } from '@nestjs/testing';
import { EnvironmentalDataController } from './environmental-data.controller';
import { EnvironmentalDataService } from './environmental-data.service';

describe('EnvironmentalDataController', () => {
  let controller: EnvironmentalDataController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [EnvironmentalDataController],
      providers: [EnvironmentalDataService],
    }).compile();

    controller = module.get<EnvironmentalDataController>(EnvironmentalDataController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
