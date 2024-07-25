import { Injectable } from '@nestjs/common';
import { CreateEnvironmentalDatumDto } from './dto/create-environmental-datum.dto';
import { UpdateEnvironmentalDatumDto } from './dto/update-environmental-datum.dto';

@Injectable()
export class EnvironmentalDataService {
  create(createEnvironmentalDatumDto: CreateEnvironmentalDatumDto) {
    return 'This action adds a new environmentalDatum';
  }

  findAll() {
    return `This action returns all environmentalData`;
  }

  findOne(id: number) {
    return `This action returns a #${id} environmentalDatum`;
  }

  update(id: number, updateEnvironmentalDatumDto: UpdateEnvironmentalDatumDto) {
    return `This action updates a #${id} environmentalDatum`;
  }

  remove(id: number) {
    return `This action removes a #${id} environmentalDatum`;
  }
}
