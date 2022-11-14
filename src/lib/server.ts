import { PrismaClient, Prisma } from '@prisma/client';

const prisma = new PrismaClient({
	log: ['query', 'info', 'warn']
});

async function main() {
	await prisma.job.create({
		data: {
			id: 1,
			jobSignups: {
				create: {
					id: 1,
					position: 'test'
				}
			}
		}
	});

	const results = await prisma.job.findMany({
		select: {
			_count: {
				select: {
					jobSignups: { where: { position: 'test' } }
				}
			}
		}
	});

	console.log(results);
}

main()
	.catch((e) => {
		throw e;
	})
	.finally(async () => {
		await prisma.$disconnect();
	});
