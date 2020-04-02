Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42EE719CAF1
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2020 22:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388755AbgDBUTD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Apr 2020 16:19:03 -0400
Received: from mga03.intel.com ([134.134.136.65]:23369 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388706AbgDBUTD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 2 Apr 2020 16:19:03 -0400
IronPort-SDR: 9pyz8bpCGxuh20NUejBEcWz6BYHmlVKpOgV2JUbKlM7/kbAtTfBCHNjymQTliZqNUNEePu956v
 2/mNlQM5k50w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2020 13:19:02 -0700
IronPort-SDR: 8xs7JjhSWDOyZOU8QlKbuKrGTJBPxu13Tpcel9HbxCkVvnjsAg6EPKwjoMUf5Wc1gWr7L/c/cC
 lj3z7rtbzZVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,336,1580803200"; 
   d="scan'208";a="268137694"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 02 Apr 2020 13:19:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4F26079; Thu,  2 Apr 2020 23:19:00 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] gpio: pch: Get rid of unneeded variable in IRQ handler
Date:   Thu,  2 Apr 2020 23:18:59 +0300
Message-Id: <20200402201859.35832-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200402201859.35832-1-andriy.shevchenko@linux.intel.com>
References: <20200402201859.35832-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no need to have an additional variable in IRQ handler. We may simple
rely on the fact of having non-zero register value we read from the hardware.

While here, drop repetitive messages in time critical function.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pch.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index 0b5aea0b1e8a..a0b12bc766db 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -303,14 +303,15 @@ static irqreturn_t pch_gpio_handler(int irq, void *dev_id)
 {
 	struct pch_gpio *chip = dev_id;
 	unsigned long reg_val = ioread32(&chip->reg->istatus);
-	int i, ret = IRQ_NONE;
+	int i;
 
-	for_each_set_bit(i, &reg_val, gpio_pins[chip->ioh]) {
-		dev_dbg(chip->dev, "[%d]:irq=%d  status=0x%lx\n", i, irq, reg_val);
+	dev_dbg(chip->dev, "irq=%d  status=0x%lx\n", irq, reg_val);
+
+	reg_val &= BIT(gpio_pins[chip->ioh]) - 1;
+	for_each_set_bit(i, &reg_val, gpio_pins[chip->ioh])
 		generic_handle_irq(chip->irq_base + i);
-		ret = IRQ_HANDLED;
-	}
-	return ret;
+
+	return IRQ_RETVAL(reg_val);
 }
 
 static int pch_gpio_alloc_generic_chip(struct pch_gpio *chip,
-- 
2.25.1

