import { PrismaClient } from '@prisma/client';
import axios from 'axios';

const prisma = new PrismaClient();

export const fetchAndSaveData = async (date: Date) => {
  try {
    const nextDay = new Date(date);
    nextDay.setDate(nextDay.getDate() + 1);
    let dateNum = date.getTime();
    let nextDateNum = nextDay.getTime();

    const apiUrl = `https://api.coincap.io/v2/assets/bitcoin/history?interval=h12&start=${dateNum}&end=${nextDateNum}`;
    const { data } = await axios.get(apiUrl);

    const bitcoinData = data.data;
    for(let i = 0; i < bitcoinData.length; i++)

    await prisma.bitcoin_data.createMany({
        data: (bitcoinData as any[]).map((item) => ({
          price: item.priceUsd,
          date: new Date(item.date),
        })),
      });
  } catch (error) {
    console.error('Error fetching and saving data:', error);
  }
};
