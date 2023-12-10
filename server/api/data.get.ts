import { PrismaClient } from '@prisma/client'
import axios from 'axios';
import { fetchAndSaveData } from '../utils/fetchAndSaveData';
const prisma = new PrismaClient()

export default defineEventHandler(async (event) => {
  const { first_date, last_date } = getQuery(event)
  if(first_date && last_date){
    const startDate = new Date(first_date as string);
    const endDate = new Date(last_date as string);

    const dateRange = [];
    let currentDate = new Date(startDate);  

    while (currentDate < endDate) {
      dateRange.push(new Date(currentDate));
      currentDate.setDate(currentDate.getDate() + 1);
    }

    for (const date of dateRange) {
      let newDate = new Date(date);
      newDate.setDate(newDate.getDate() + 1);
      const dataExists = await prisma.bitcoin_data.findFirst({
        where: {
          date: {
            gte: date,
            lte: newDate
          }
        },
      });
      if (!dataExists) {
        try{
          await fetchAndSaveData(date);
        } catch(error) {
          console.error(error);
        }
      }
    }

    return await prisma.bitcoin_data.findMany({
      where: {
        date: {
          gte: startDate,
          lte: endDate,
        }
      },
      orderBy: {
        date: 'asc',
      },
    });
  }
})

  