import { Test, TestingModule } from '@nestjs/testing';
import { EnvironmentalDataService } from './environmental-data.service';

describe('EnvironmentalDataService', () => {
  let service: EnvironmentalDataService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [EnvironmentalDataService],
    }).compile();

    service = module.get<EnvironmentalDataService>(EnvironmentalDataService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
