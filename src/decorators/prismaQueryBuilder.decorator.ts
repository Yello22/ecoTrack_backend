import {
  PipeTransform,
  Injectable,
  ArgumentMetadata,
  BadRequestException,
} from '@nestjs/common';
import PrismaQueryBuilder from 'src/utils/prismaQueryBuilder.utils';

@Injectable()
export class PrismaQueryBuilderPipe implements PipeTransform {
  transform(value: any, metadata: ArgumentMetadata) {
    try {
      const prismaQueryBuilder = new PrismaQueryBuilder(value);
      prismaQueryBuilder.filter().sort().limitFields().paginate();
      return prismaQueryBuilder.getQuery();
    } catch (error) {
      throw new BadRequestException('Invalid query parameters');
    }
  }
}
