Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF36230AB5
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jul 2020 14:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728604AbgG1MzI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jul 2020 08:55:08 -0400
Received: from mga02.intel.com ([134.134.136.20]:5650 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729565AbgG1MzH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Jul 2020 08:55:07 -0400
IronPort-SDR: cF6z9FBrdzsc5RYvEAd6UeAijbWwMH53/vcB2iwwLdpor3Rsm3XFig2QsiJN3rNBG1jaAPYXH1
 b2S0cH8hMhsA==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="139231659"
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
   d="scan'208";a="139231659"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 05:55:07 -0700
IronPort-SDR: wR5dF91NPFTc+6+PeYvCWo4Y6K+8WVecuwUJALfb0cThdPh+BK/XBLgS/iFEKK93TgImCYLbSM
 4CTrLhN7ac6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
   d="scan'208";a="273560745"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 28 Jul 2020 05:55:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id EB6CA95; Tue, 28 Jul 2020 15:55:04 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/3] gpio: pca953x: Request IRQ after all initialisation done
Date:   Tue, 28 Jul 2020 15:55:02 +0300
Message-Id: <20200728125504.27786-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is logically better to request IRQ when we initialise all structures.
Align the driver with the rest on the same matter.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index ab22152bf3e8..bd2e96c34f82 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -865,17 +865,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
 	bitmap_and(chip->irq_stat, irq_stat, reg_direction, chip->gpio_chip.ngpio);
 	mutex_init(&chip->irq_lock);
 
-	ret = devm_request_threaded_irq(&client->dev, client->irq,
-					NULL, pca953x_irq_handler,
-					IRQF_ONESHOT | IRQF_SHARED,
-					dev_name(&client->dev), chip);
-	if (ret) {
-		dev_err(&client->dev, "failed to request irq %d\n",
-			client->irq);
-		return ret;
-	}
-
-	irq_chip->name = dev_name(&chip->client->dev);
+	irq_chip->name = dev_name(&client->dev);
 	irq_chip->irq_mask = pca953x_irq_mask;
 	irq_chip->irq_unmask = pca953x_irq_unmask;
 	irq_chip->irq_set_wake = pca953x_irq_set_wake;
@@ -895,6 +885,16 @@ static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
 	girq->threaded = true;
 	girq->first = irq_base; /* FIXME: get rid of this */
 
+	ret = devm_request_threaded_irq(&client->dev, client->irq,
+					NULL, pca953x_irq_handler,
+					IRQF_ONESHOT | IRQF_SHARED,
+					dev_name(&client->dev), chip);
+	if (ret) {
+		dev_err(&client->dev, "failed to request irq %d\n",
+			client->irq);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.27.0

