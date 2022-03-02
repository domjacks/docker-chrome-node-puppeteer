const puppeteer = require('puppeteer');

const browserConfig = {
	ignoreHTTPSErrors: true,
	headless: !(process.env.OPEN_BROWSER === 'true'),
	args: ['--no-sandbox', '--disable-setuid-sandbox', '--autoplay-policy=no-user-gesture-required'],
	devtools: process.env.DEVTOOLS === 'true',
	executablePath: '/usr/bin/google-chrome-stable'
};

(async () => {
	const browser = await puppeteer.launch(browserConfig);
	const page = await browser.newPage();
	await page.goto('https://bbc.co.uk');
	await page.screenshot({ path: 'example.png' });

	await browser.close();
	console.log('Complete!')
})();
