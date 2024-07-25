import { head } from 'lodash';

class PrismaQueryBuilder {
  query: any;
  queryString: any;

  constructor(queryString: any) {
    this.queryString = queryString;
    this.query = {};
  }

  filter() {
    const queryObj = { ...this.queryString };
    const excludedFields = ['page', 'sort', 'limit', 'fields'];
    excludedFields.forEach((el) => delete queryObj[el]);

    let queryStr = JSON.stringify(queryObj);
    queryStr = queryStr.replace(/\b(gte|gt|lte|lt)\b/g, (match) => `${match}`);

    this.query.where = JSON.parse(queryStr);
    return this;
  }

  sort() {
    if (this.queryString.sort) {
      const sortBy = this.queryString.sort.split(',').join(' ');
      const orderBy = sortBy.split(' ').map((field: string) => {
        if (field.startsWith('-')) {
          return { [field.substring(1)]: 'desc' };
        } else {
          return { [field]: 'asc' };
        }
      });
      this.query.orderBy = head(orderBy);
    } else {
      this.query.orderBy = { createdAt: 'desc' };
    }
    return this;
  }

  limitFields() {
    if (this.queryString.fields) {
      const fields = this.queryString.fields.split(',').join(' ');
      this.query.select = fields
        .split(' ')
        .reduce((acc: any, field: string) => {
          acc[field] = true;
          return acc;
        }, {});
    } else {
      this.query.select = { __v: false };
    }
    return this;
  }

  paginate() {
    const page = this.queryString.page * 1 || 1;
    const limit = this.queryString.limit * 1 || 10;
    const skip = (page - 1) * limit;

    this.query.skip = skip;
    this.query.take = limit;
    return this;
  }

  getQuery() {
    return this.query;
  }
}

export default PrismaQueryBuilder;
