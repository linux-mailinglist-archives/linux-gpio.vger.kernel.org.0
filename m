Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9332A9DE45
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2019 08:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbfH0G4z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Aug 2019 02:56:55 -0400
Received: from protonic.xs4all.nl ([83.163.252.89]:51452 "EHLO protonic.nl"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725904AbfH0G4y (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 27 Aug 2019 02:56:54 -0400
Received: from troy.prtnl (troy.prtnl [192.168.224.29])
        by sparta (Postfix) with ESMTP id 8E22944A00C5;
        Tue, 27 Aug 2019 08:49:09 +0200 (CEST)
From:   David Jander <david@protonic.nl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Jander <david@protonic.nl>
Subject: [PATCH 2/2] gpio: pca953x.c: Use pca953x_read_regs instead of regmap_bulk_read
Date:   Tue, 27 Aug 2019 06:46:29 +0000
Message-Id: <20190827064629.90214-2-david@protonic.nl>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190827064629.90214-1-david@protonic.nl>
References: <20190827064629.90214-1-david@protonic.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The register number needs to be translated for chips with more than 8
ports. This patch fixes a bug causing all chips with more than 8 GPIO pins
to not work correctly.

Signed-off-by: David Jander <david@protonic.nl>
---
 drivers/gpio/gpio-pca953x.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 30072a570bc2..48fea4c68e8d 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -606,8 +606,7 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	u8 invert_irq_mask[MAX_BANK];
 	u8 reg_direction[MAX_BANK];
 
-	regmap_bulk_read(chip->regmap, chip->regs->direction, reg_direction,
-			 NBANK(chip));
+	pca953x_read_regs(chip, chip->regs->direction, reg_direction);
 
 	if (chip->driver_data & PCA_PCAL) {
 		/* Enable latch on interrupt-enabled inputs */
@@ -710,8 +709,7 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, u8 *pending)
 		return false;
 
 	/* Remove output pins from the equation */
-	regmap_bulk_read(chip->regmap, chip->regs->direction, reg_direction,
-			 NBANK(chip));
+	pca953x_read_regs(chip, chip->regs->direction, reg_direction);
 	for (i = 0; i < NBANK(chip); i++)
 		cur_stat[i] &= reg_direction[i];
 
@@ -789,8 +787,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
 	 * interrupt.  We have to rely on the previous read for
 	 * this purpose.
 	 */
-	regmap_bulk_read(chip->regmap, chip->regs->direction, reg_direction,
-			 NBANK(chip));
+	pca953x_read_regs(chip, chip->regs->direction, reg_direction);
 	for (i = 0; i < NBANK(chip); i++)
 		chip->irq_stat[i] &= reg_direction[i];
 	mutex_init(&chip->irq_lock);
-- 
2.19.1

