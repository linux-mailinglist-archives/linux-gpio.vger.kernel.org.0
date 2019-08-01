Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5677E136
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 19:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728964AbfHARjm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Aug 2019 13:39:42 -0400
Received: from mga01.intel.com ([192.55.52.88]:50941 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726716AbfHARjm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 1 Aug 2019 13:39:42 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Aug 2019 10:39:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,334,1559545200"; 
   d="scan'208";a="372100502"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 01 Aug 2019 10:39:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 659EEF3; Thu,  1 Aug 2019 20:39:39 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/4] gpio: pca953x: Use GENMASK() consistently
Date:   Thu,  1 Aug 2019 20:39:36 +0300
Message-Id: <20190801173938.36676-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801173938.36676-1-andriy.shevchenko@linux.intel.com>
References: <20190801173938.36676-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use GENMASK() macro for all definitions where it's appropriate.
No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 54cf01901320..aaba0b394d2f 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/bits.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
@@ -28,9 +29,9 @@
 #define PCA953X_INVERT		0x02
 #define PCA953X_DIRECTION	0x03
 
-#define REG_ADDR_MASK		0x3f
-#define REG_ADDR_EXT		0x40
-#define REG_ADDR_AI		0x80
+#define REG_ADDR_MASK		GENMASK(5, 0)
+#define REG_ADDR_EXT		BIT(6)
+#define REG_ADDR_AI		BIT(7)
 
 #define PCA957X_IN		0x00
 #define PCA957X_INVRT		0x01
@@ -55,17 +56,17 @@
 #define PCAL6524_OUT_INDCONF	0x2c
 #define PCAL6524_DEBOUNCE	0x2d
 
-#define PCA_GPIO_MASK		0x00FF
+#define PCA_GPIO_MASK		GENMASK(7, 0)
 
-#define PCAL_GPIO_MASK		0x1f
-#define PCAL_PINCTRL_MASK	0x60
+#define PCAL_GPIO_MASK		GENMASK(4, 0)
+#define PCAL_PINCTRL_MASK	GENMASK(6, 5)
 
-#define PCA_INT			0x0100
-#define PCA_PCAL		0x0200
+#define PCA_INT			BIT(8)
+#define PCA_PCAL		BIT(9)
 #define PCA_LATCH_INT		(PCA_PCAL | PCA_INT)
-#define PCA953X_TYPE		0x1000
-#define PCA957X_TYPE		0x2000
-#define PCA_TYPE_MASK		0xF000
+#define PCA953X_TYPE		BIT(12)
+#define PCA957X_TYPE		BIT(13)
+#define PCA_TYPE_MASK		GENMASK(15, 12)
 
 #define PCA_CHIP_TYPE(x)	((x) & PCA_TYPE_MASK)
 
@@ -565,7 +566,7 @@ static void pca953x_irq_mask(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 
-	chip->irq_mask[d->hwirq / BANK_SZ] &= ~(1 << (d->hwirq % BANK_SZ));
+	chip->irq_mask[d->hwirq / BANK_SZ] &= ~BIT(d->hwirq % BANK_SZ);
 }
 
 static void pca953x_irq_unmask(struct irq_data *d)
@@ -573,7 +574,7 @@ static void pca953x_irq_unmask(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 
-	chip->irq_mask[d->hwirq / BANK_SZ] |= 1 << (d->hwirq % BANK_SZ);
+	chip->irq_mask[d->hwirq / BANK_SZ] |= BIT(d->hwirq % BANK_SZ);
 }
 
 static int pca953x_irq_set_wake(struct irq_data *d, unsigned int on)
@@ -641,7 +642,7 @@ static int pca953x_irq_set_type(struct irq_data *d, unsigned int type)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	int bank_nb = d->hwirq / BANK_SZ;
-	u8 mask = 1 << (d->hwirq % BANK_SZ);
+	u8 mask = BIT(d->hwirq % BANK_SZ);
 
 	if (!(type & IRQ_TYPE_EDGE_BOTH)) {
 		dev_err(&chip->client->dev, "irq %d: unsupported type %d\n",
@@ -666,7 +667,7 @@ static void pca953x_irq_shutdown(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
-	u8 mask = 1 << (d->hwirq % BANK_SZ);
+	u8 mask = BIT(d->hwirq % BANK_SZ);
 
 	chip->irq_trig_raise[d->hwirq / BANK_SZ] &= ~mask;
 	chip->irq_trig_fall[d->hwirq / BANK_SZ] &= ~mask;
-- 
2.20.1

