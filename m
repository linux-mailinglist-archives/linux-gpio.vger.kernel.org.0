Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8010B1A87EE
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 19:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502659AbgDNRuA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 13:50:00 -0400
Received: from mga06.intel.com ([134.134.136.31]:42046 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502747AbgDNRt5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 13:49:57 -0400
IronPort-SDR: z7RN4BmFrRh1JnEkS4kOAKRGP5hxle8cjeHV3EUiyJfFtGaIi+Z/Px/HjGZBTIDb8aktKdaroq
 fQ8d4H5xq4dQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 10:49:03 -0700
IronPort-SDR: S44f7z6KIwS1HaI/bWLvhFfp58TPLEYBbaChkFH0f4uPX7bNxZ+ojp6LahhHNJjqSjz/GkN9An
 X9minEmRgGKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; 
   d="scan'208";a="453623129"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 14 Apr 2020 10:49:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 835F243; Tue, 14 Apr 2020 20:49:01 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/4] gpio: pch: Get rid of unneeded variable in IRQ handler
Date:   Tue, 14 Apr 2020 20:48:58 +0300
Message-Id: <20200414174900.5099-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414174900.5099-1-andriy.shevchenko@linux.intel.com>
References: <20200414174900.5099-1-andriy.shevchenko@linux.intel.com>
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
v2: no change
 drivers/gpio/gpio-pch.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index 03eeacdb04fb..708272db6baf 100644
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

