Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0E8116DA5
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 14:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727650AbfLINJf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 08:09:35 -0500
Received: from mga12.intel.com ([192.55.52.136]:48128 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727638AbfLINJe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 08:09:34 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 05:09:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="414065109"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 09 Dec 2019 05:09:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2E116B8A; Mon,  9 Dec 2019 15:09:28 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 23/24] pinctrl: lynxpoint: Switch to pin control API
Date:   Mon,  9 Dec 2019 15:09:25 +0200
Message-Id: <20191209130926.86483-24-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
References: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When all preparations are done, we may switch to pin control API.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/Kconfig             |  3 +
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 67 ++++-------------------
 2 files changed, 13 insertions(+), 57 deletions(-)

diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
index c2e6bc9e3e04..ee440ec4c94c 100644
--- a/drivers/pinctrl/intel/Kconfig
+++ b/drivers/pinctrl/intel/Kconfig
@@ -34,6 +34,9 @@ config PINCTRL_CHERRYVIEW
 config PINCTRL_LYNXPOINT
 	tristate "Intel Lynxpoint pinctrl and GPIO driver"
 	depends on ACPI
+	select PINMUX
+	select PINCONF
+	select GENERIC_PINCONF
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	help
diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 795a9c7054ca..774b226f3a4d 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -577,43 +577,6 @@ static const struct pinctrl_desc lptlp_pinctrl_desc = {
 	.owner		= THIS_MODULE,
 };
 
-static int lp_gpio_request(struct gpio_chip *chip, unsigned int offset)
-{
-	struct intel_pinctrl *lg = gpiochip_get_data(chip);
-	void __iomem *reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
-	void __iomem *conf2 = lp_gpio_reg(chip, offset, LP_CONFIG2);
-	u32 value;
-
-	pm_runtime_get(lg->dev); /* should we put if failed */
-
-	/*
-	 * Reconfigure pin to GPIO mode if needed and issue a warning,
-	 * since we expect firmware to configure it properly.
-	 */
-	value = ioread32(reg);
-	if ((value & USE_SEL_MASK) != USE_SEL_GPIO) {
-		iowrite32((value & USE_SEL_MASK) | USE_SEL_GPIO, reg);
-		dev_warn(lg->dev, FW_BUG "pin %u forcibly reconfigured as GPIO\n", offset);
-	}
-
-	/* enable input sensing */
-	iowrite32(ioread32(conf2) & ~GPINDIS_BIT, conf2);
-
-
-	return 0;
-}
-
-static void lp_gpio_free(struct gpio_chip *chip, unsigned int offset)
-{
-	struct intel_pinctrl *lg = gpiochip_get_data(chip);
-	void __iomem *conf2 = lp_gpio_reg(chip, offset, LP_CONFIG2);
-
-	/* disable input sensing */
-	iowrite32(ioread32(conf2) | GPINDIS_BIT, conf2);
-
-	pm_runtime_put(lg->dev);
-}
-
 static int lp_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	void __iomem *reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
@@ -638,31 +601,15 @@ static void lp_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 
 static int lp_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
-	struct intel_pinctrl *lg = gpiochip_get_data(chip);
-	void __iomem *reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
-	unsigned long flags;
-
-	raw_spin_lock_irqsave(&lg->lock, flags);
-	iowrite32(ioread32(reg) | DIR_BIT, reg);
-	raw_spin_unlock_irqrestore(&lg->lock, flags);
-
-	return 0;
+	return pinctrl_gpio_direction_input(chip->base + offset);
 }
 
 static int lp_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
 				    int value)
 {
-	struct intel_pinctrl *lg = gpiochip_get_data(chip);
-	void __iomem *reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
-	unsigned long flags;
-
 	lp_gpio_set(chip, offset, value);
 
-	raw_spin_lock_irqsave(&lg->lock, flags);
-	iowrite32(ioread32(reg) & ~DIR_BIT, reg);
-	raw_spin_unlock_irqrestore(&lg->lock, flags);
-
-	return 0;
+	return pinctrl_gpio_direction_output(chip->base + offset);
 }
 
 static int lp_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
@@ -874,6 +821,12 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	lg->pctldesc.pins      = lg->soc->pins;
 	lg->pctldesc.npins     = lg->soc->npins;
 
+	lg->pctldev = devm_pinctrl_register(dev, &lg->pctldesc, lg);
+	if (IS_ERR(lg->pctldev)) {
+		dev_err(dev, "failed to register pinctrl driver\n");
+		return PTR_ERR(lg->pctldev);
+	}
+
 	platform_set_drvdata(pdev, lg);
 
 	io_rc = platform_get_resource(pdev, IORESOURCE_IO, 0);
@@ -902,8 +855,8 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	gc = &lg->chip;
 	gc->label = dev_name(dev);
 	gc->owner = THIS_MODULE;
-	gc->request = lp_gpio_request;
-	gc->free = lp_gpio_free;
+	gc->request = gpiochip_generic_request;
+	gc->free = gpiochip_generic_free;
 	gc->direction_input = lp_gpio_direction_input;
 	gc->direction_output = lp_gpio_direction_output;
 	gc->get = lp_gpio_get;
-- 
2.24.0

