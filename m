Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED0BD9DE42
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2019 08:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbfH0G4z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Aug 2019 02:56:55 -0400
Received: from protonic.xs4all.nl ([83.163.252.89]:51451 "EHLO protonic.nl"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725879AbfH0G4y (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 27 Aug 2019 02:56:54 -0400
X-Greylist: delayed 596 seconds by postgrey-1.27 at vger.kernel.org; Tue, 27 Aug 2019 02:56:54 EDT
Received: from troy.prtnl (troy.prtnl [192.168.224.29])
        by sparta (Postfix) with ESMTP id 336AB44A009E;
        Tue, 27 Aug 2019 08:48:54 +0200 (CEST)
From:   David Jander <david@protonic.nl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Jander <david@protonic.nl>
Subject: [PATCH 1/2] gpio: gpio-pca953x.c: Correct type of reg_direction
Date:   Tue, 27 Aug 2019 06:46:28 +0000
Message-Id: <20190827064629.90214-1-david@protonic.nl>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The type of reg_direction needs to match the type of the regmap, which is
u8.

Signed-off-by: David Jander <david@protonic.nl>
---
 drivers/gpio/gpio-pca953x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 378b206d2dc9..30072a570bc2 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -604,7 +604,7 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	u8 new_irqs;
 	int level, i;
 	u8 invert_irq_mask[MAX_BANK];
-	int reg_direction[MAX_BANK];
+	u8 reg_direction[MAX_BANK];
 
 	regmap_bulk_read(chip->regmap, chip->regs->direction, reg_direction,
 			 NBANK(chip));
@@ -679,7 +679,7 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, u8 *pending)
 	bool pending_seen = false;
 	bool trigger_seen = false;
 	u8 trigger[MAX_BANK];
-	int reg_direction[MAX_BANK];
+	u8 reg_direction[MAX_BANK];
 	int ret, i;
 
 	if (chip->driver_data & PCA_PCAL) {
@@ -768,7 +768,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
 {
 	struct i2c_client *client = chip->client;
 	struct irq_chip *irq_chip = &chip->irq_chip;
-	int reg_direction[MAX_BANK];
+	u8 reg_direction[MAX_BANK];
 	int ret, i;
 
 	if (!client->irq)
-- 
2.19.1

