import { test, expect } from '@playwright/test';

test.describe('Guide Bot on the left handside', () => {
  test('should display the guide bot and allow dismissal', async ({ page }) => {
    // Navigate to the index page or any page with the bot
    await page.goto('index.html'); // replace with actual local URL if needed during runtime

    // Ensure the bot is visible
    const bot = page.locator('#guide-bot');
    await expect(bot).toBeVisible();

    // The bot is positioned on the bottom left
    const boundingBox = await bot.boundingBox();
    expect(boundingBox.x).toBeLessThan(50); // Left hand side check

    // Check if we can dismiss the bot
    const dismissButton = bot.locator('button', { hasText: 'Dismiss Bot' });
    if (await dismissButton.isVisible()) {
        await dismissButton.click();
        await expect(bot).toBeHidden();
    } else {
        const closeIcon = bot.locator('button').first();
        await closeIcon.click();
        await expect(bot).toBeHidden();
    }
  });
});
