Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08E381AA9A3
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 16:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636565AbgDOOQD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 10:16:03 -0400
Received: from mga01.intel.com ([192.55.52.88]:38643 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2636550AbgDOOPr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 10:15:47 -0400
IronPort-SDR: QihiVW0tlN24KztD43YgahXDW3Bmux60LCqcl+Sezko4aXYpw+zxKjgact1rneczEWGgSLjbya
 nHpURS5GJqtA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 07:15:40 -0700
IronPort-SDR: VaPiu0KCl8F+RwuqmKydP8DCpfMpebjikUO74MI60BtaT0MeRk/+KIHYo3YQSHFsMZnLHsaR5e
 y/G4ur9USMNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; 
   d="scan'208";a="454924079"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 15 Apr 2020 07:15:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D46AADD7; Wed, 15 Apr 2020 17:15:35 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v2 08/14] gpio: dwapb: Convert to use IRQ core provided macros
Date:   Wed, 15 Apr 2020 17:15:28 +0300
Message-Id: <20200415141534.31240-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

IRQ core provides macros such as IRQ_RETVAL().
Convert code to use them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 8b30ded9322a..4edac592c253 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -258,8 +258,7 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
 	irq_hw_number_t bit = irqd_to_hwirq(d);
 	unsigned long level, polarity, flags;
 
-	if (type & ~(IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING |
-		     IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
+	if (type & ~IRQ_TYPE_SENSE_MASK)
 		return -EINVAL;
 
 	spin_lock_irqsave(&gc->bgpio_lock, flags);
@@ -351,12 +350,7 @@ static int dwapb_gpio_set_config(struct gpio_chip *gc, unsigned offset,
 
 static irqreturn_t dwapb_irq_handler_mfd(int irq, void *dev_id)
 {
-	u32 worked;
-	struct dwapb_gpio *gpio = dev_id;
-
-	worked = dwapb_do_irq(gpio);
-
-	return worked ? IRQ_HANDLED : IRQ_NONE;
+	return IRQ_RETVAL(dwapb_do_irq(dev_id));
 }
 
 static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
-- 
2.25.1

