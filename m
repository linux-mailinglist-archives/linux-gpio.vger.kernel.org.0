Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C48411CAA3
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 11:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728523AbfLLK0J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 05:26:09 -0500
Received: from mga09.intel.com ([134.134.136.24]:57202 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728492AbfLLK0J (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Dec 2019 05:26:09 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Dec 2019 02:26:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,305,1571727600"; 
   d="scan'208";a="296555537"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 12 Dec 2019 02:26:06 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 43815122; Thu, 12 Dec 2019 12:26:05 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        hdegoede@redhat.com
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/5] pinctrl: baytrail: Move IRQ valid mask initialization to a dedicated callback
Date:   Thu, 12 Dec 2019 12:25:53 +0200
Message-Id: <20191212102557.87754-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212102557.87754-1-andriy.shevchenko@linux.intel.com>
References: <20191212102557.87754-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is a logical continuation of the commit 5fbe5b5883f8 ("gpio: Initialize
the irqchip valid_mask with a callback") to split IRQ initialization to
hardware and valid mask setup parts.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index d829843314ba..ea61a19857c1 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1432,23 +1432,11 @@ static void byt_gpio_irq_handler(struct irq_desc *desc)
 static void byt_init_irq_valid_mask(struct gpio_chip *chip,
 				    unsigned long *valid_mask,
 				    unsigned int ngpios)
-{
-	/*
-	 * FIXME: currently the valid_mask is filled in as part of
-	 * initializing the irq_chip below in byt_gpio_irq_init_hw().
-	 * when converting this driver to the new way of passing the
-	 * gpio_irq_chip along when adding the gpio_chip, move the
-	 * mask initialization into this callback instead. Right now
-	 * this callback is here to make sure the mask gets allocated.
-	 */
-}
-
-static int byt_gpio_irq_init_hw(struct gpio_chip *chip)
 {
 	struct byt_gpio *vg = gpiochip_get_data(chip);
 	struct device *dev = &vg->pdev->dev;
 	void __iomem *reg;
-	u32 base, value;
+	u32 value;
 	int i;
 
 	/*
@@ -1469,13 +1457,20 @@ static int byt_gpio_irq_init_hw(struct gpio_chip *chip)
 
 		value = readl(reg);
 		if (value & BYT_DIRECT_IRQ_EN) {
-			clear_bit(i, chip->irq.valid_mask);
+			clear_bit(i, valid_mask);
 			dev_dbg(dev, "excluding GPIO %d from IRQ domain\n", i);
 		} else if ((value & BYT_PIN_MUX) == byt_get_gpio_mux(vg, i)) {
 			byt_gpio_clear_triggering(vg, i);
 			dev_dbg(dev, "disabling GPIO %d\n", i);
 		}
 	}
+}
+
+static int byt_gpio_irq_init_hw(struct gpio_chip *chip)
+{
+	struct byt_gpio *vg = gpiochip_get_data(chip);
+	void __iomem *reg;
+	u32 base, value;
 
 	/* clear interrupt status trigger registers */
 	for (base = 0; base < vg->soc_data->npins; base += 32) {
-- 
2.24.0

