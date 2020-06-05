Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 531401EF972
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2020 15:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726965AbgFENkk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jun 2020 09:40:40 -0400
Received: from mga18.intel.com ([134.134.136.126]:6614 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726844AbgFENkk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Jun 2020 09:40:40 -0400
IronPort-SDR: gDPgdjs3agIxW5P+Q/MNwy2PE9wzi6rQKNA3ab7NjVslPVC+U2yZ3Yke8SZEdZtaZQgPHZIIId
 0vPanXVV3QQw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2020 06:40:39 -0700
IronPort-SDR: LcfXYzroyINkoPd7ayonJCRZ+/GCSSWU39W0pCuiKJzp9YO16cps1/nJwsuT6iOFx7c6v6UZnO
 PmPknEA54w2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,476,1583222400"; 
   d="scan'208";a="269768927"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 05 Jun 2020 06:40:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2F2DD2C7; Fri,  5 Jun 2020 16:40:37 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH v1 3/4] gpio: pca953x: Fix direction setting when configure an IRQ
Date:   Fri,  5 Jun 2020 16:40:35 +0300
Message-Id: <20200605134036.9013-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200605134036.9013-1-andriy.shevchenko@linux.intel.com>
References: <20200605134036.9013-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The commit 0f25fda840a9 ("gpio: pca953x: Zap ad-hoc reg_direction cache")
seems inadvertently made a typo in pca953x_irq_bus_sync_unlock().

When the direction bit is 1 it means input, and the piece of code in question
was looking for output ones that should be turned to inputs.

Fix direction setting when configure an IRQ by injecting a bitmap complement
operation.

Fixes: 0f25fda840a9 ("gpio: pca953x: Zap ad-hoc reg_direction cache")
Depends-on: 35d13d94893f ("gpio: pca953x: convert to use bitmap API")
Cc: Marek Vasut <marek.vasut@gmail.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 4d3157d8b5cd..97c9ac31ecb5 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -696,8 +696,6 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	DECLARE_BITMAP(reg_direction, MAX_LINE);
 	int level;
 
-	pca953x_read_regs(chip, chip->regs->direction, reg_direction);
-
 	if (chip->driver_data & PCA_PCAL) {
 		/* Enable latch on interrupt-enabled inputs */
 		pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip->irq_mask);
@@ -708,7 +706,11 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 		pca953x_write_regs(chip, PCAL953X_INT_MASK, irq_mask);
 	}
 
+	/* Switch direction to input if needed */
+	pca953x_read_regs(chip, chip->regs->direction, reg_direction);
+
 	bitmap_or(irq_mask, chip->irq_trig_fall, chip->irq_trig_raise, gc->ngpio);
+	bitmap_complement(reg_direction, reg_direction, gc->ngpio);
 	bitmap_and(irq_mask, irq_mask, reg_direction, gc->ngpio);
 
 	/* Look for any newly setup interrupt */
-- 
2.27.0.rc2

