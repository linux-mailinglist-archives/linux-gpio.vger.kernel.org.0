Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 000DE116D9F
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 14:09:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbfLINJc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 08:09:32 -0500
Received: from mga09.intel.com ([134.134.136.24]:48019 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727482AbfLINJc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 08:09:32 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 05:09:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="210103578"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 09 Dec 2019 05:09:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8D7577A2; Mon,  9 Dec 2019 15:09:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 09/24] pinctrl: lynxpoint: Keep pointer to struct device instead of its container
Date:   Mon,  9 Dec 2019 15:09:11 +0200
Message-Id: <20191209130926.86483-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
References: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no need to keep pointer to struct platform_device, which is container
of struct device, because the latter is what have been used everywhere outside
of ->probe() path. In any case we may derive pointer to the container when
needed.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 3ac95f9d6a7f..1d5f5053fe14 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -48,7 +48,7 @@
 
 struct lp_gpio {
 	struct gpio_chip	chip;
-	struct platform_device	*pdev;
+	struct device		*dev;
 	raw_spinlock_t		lock;
 	unsigned long		reg_base;
 };
@@ -106,11 +106,11 @@ static int lp_gpio_request(struct gpio_chip *chip, unsigned offset)
 	unsigned long acpi_use = lp_gpio_reg(chip, offset, LP_ACPI_OWNED);
 	u32 value;
 
-	pm_runtime_get(&lg->pdev->dev); /* should we put if failed */
+	pm_runtime_get(lg->dev); /* should we put if failed */
 
 	/* Fail if BIOS reserved pin for ACPI use */
 	if (!(inl(acpi_use) & BIT(offset % 32))) {
-		dev_err(&lg->pdev->dev, "gpio %d reserved for ACPI\n", offset);
+		dev_err(lg->dev, "gpio %d reserved for ACPI\n", offset);
 		return -EBUSY;
 	}
 
@@ -121,7 +121,7 @@ static int lp_gpio_request(struct gpio_chip *chip, unsigned offset)
 	value = inl(reg);
 	if ((value & USE_SEL_MASK) != USE_SEL_GPIO) {
 		outl((value & USE_SEL_MASK) | USE_SEL_GPIO, reg);
-		dev_warn(&lg->pdev->dev, FW_BUG "pin %u forcibly reconfigured as GPIO\n", offset);
+		dev_warn(lg->dev, FW_BUG "pin %u forcibly reconfigured as GPIO\n", offset);
 	}
 
 	/* enable input sensing */
@@ -139,7 +139,7 @@ static void lp_gpio_free(struct gpio_chip *chip, unsigned offset)
 	/* disable input sensing */
 	outl(inl(conf2) | GPINDIS_BIT, conf2);
 
-	pm_runtime_put(&lg->pdev->dev);
+	pm_runtime_put(lg->dev);
 }
 
 static int lp_irq_type(struct irq_data *d, unsigned type)
@@ -341,7 +341,7 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	if (!lg)
 		return -ENOMEM;
 
-	lg->pdev = pdev;
+	lg->dev = dev;
 	platform_set_drvdata(pdev, lg);
 
 	io_rc = platform_get_resource(pdev, IORESOURCE_IO, 0);
@@ -385,7 +385,7 @@ static int lp_gpio_probe(struct platform_device *pdev)
 		girq->init_hw = lp_gpio_irq_init_hw;
 		girq->parent_handler = lp_gpio_irq_handler;
 		girq->num_parents = 1;
-		girq->parents = devm_kcalloc(&pdev->dev, girq->num_parents,
+		girq->parents = devm_kcalloc(dev, girq->num_parents,
 					     sizeof(*girq->parents),
 					     GFP_KERNEL);
 		if (!girq->parents)
-- 
2.24.0

