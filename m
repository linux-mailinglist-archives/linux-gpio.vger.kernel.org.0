Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEAA01A3581
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 16:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727235AbgDIOMl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Apr 2020 10:12:41 -0400
Received: from mga14.intel.com ([192.55.52.115]:57753 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727181AbgDIOMl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Apr 2020 10:12:41 -0400
IronPort-SDR: D+56rQ0N3O1rMeKRy+VGaTKcN/mBK/47vCDhU9CSp+dm6brL5eJs49jrCcZaKZOGuHs6hN30Xg
 KwOQemxzUA/g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 07:12:34 -0700
IronPort-SDR: L7r7ecLa6gTmQr9TqFjXz4pLJmn+Y5itRCh54g9TFk1OvcYzo5BJ2be4YgPXDt6GoJbVYnnleD
 +TN2b8GQIaQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="297532032"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Apr 2020 07:12:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A4564A0D; Thu,  9 Apr 2020 17:12:29 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 07/13] gpio: dwapb: Convert to use IRQ core provided macros
Date:   Thu,  9 Apr 2020 17:12:22 +0300
Message-Id: <20200409141228.49561-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

IRQ core provides macros such as IRQ_RETVAL().
Convert code to use them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-dwapb.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index a0a0288bb73e..916a42fea456 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -258,8 +258,7 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
 	unsigned long level, polarity, flags;
 	u32 bit = irqd_to_hwirq(d);
 
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

