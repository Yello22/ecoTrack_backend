import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { EnvironmentalDataService } from './environmental-data.service';
import { CreateEnvironmentalDatumDto } from './dto/create-environmental-datum.dto';
import { UpdateEnvironmentalDatumDto } from './dto/update-environmental-datum.dto';

@Controller('environmental-data')
export class EnvironmentalDataController {
  constructor(private readonly environmentalDataService: EnvironmentalDataService) {}

  @Post()
  create(@Body() createEnvironmentalDatumDto: CreateEnvironmentalDatumDto) {
    return this.environmentalDataService.create(createEnvironmentalDatumDto);
  }

  @Get()
  findAll() {
    return this.environmentalDataService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.environmentalDataService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateEnvironmentalDatumDto: UpdateEnvironmentalDatumDto) {
    return this.environmentalDataService.update(+id, updateEnvironmentalDatumDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.environmentalDataService.remove(+id);
  }
}
