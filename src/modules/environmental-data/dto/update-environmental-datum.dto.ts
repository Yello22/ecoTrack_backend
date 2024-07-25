import { PartialType } from '@nestjs/swagger';
import { CreateEnvironmentalDatumDto } from './create-environmental-datum.dto';

export class UpdateEnvironmentalDatumDto extends PartialType(CreateEnvironmentalDatumDto) {}
