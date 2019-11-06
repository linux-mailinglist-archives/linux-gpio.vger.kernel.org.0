Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDDCEF1912
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 15:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbfKFOsd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 09:48:33 -0500
Received: from mga06.intel.com ([134.134.136.31]:46609 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729430AbfKFOsd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 Nov 2019 09:48:33 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Nov 2019 06:48:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; 
   d="scan'208";a="353498317"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 06 Nov 2019 06:48:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 29FEF300; Wed,  6 Nov 2019 16:48:30 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 4/8] pinctrl: lynxpoint: Keep pointer to struct device instead of its container
Date:   Wed,  6 Nov 2019 16:48:25 +0200
Message-Id: <20191106144829.32275-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191106144829.32275-1-andriy.shevchenko@linux.intel.com>
References: <20191106144829.32275-1-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index ebc523233df4..dbca1ff076c8 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -46,7 +46,7 @@
 
 struct lp_gpio {
 	struct gpio_chip	chip;
-	struct platform_device	*pdev;
+	struct device		*dev;
 	raw_spinlock_t		lock;
 	unsigned long		reg_base;
 };
@@ -103,11 +103,11 @@ static int lp_gpio_request(struct gpio_chip *chip, unsigned offset)
 	unsigned long conf2 = lp_gpio_reg(chip, offset, LP_CONFIG2);
 	unsigned long acpi_use = lp_gpio_reg(chip, offset, LP_ACPI_OWNED);
 
-	pm_runtime_get(&lg->pdev->dev); /* should we put if failed */
+	pm_runtime_get(lg->dev); /* should we put if failed */
 
 	/* Fail if BIOS reserved pin for ACPI use */
 	if (!(inl(acpi_use) & BIT(offset % 32))) {
-		dev_err(&lg->pdev->dev, "gpio %d reserved for ACPI\n", offset);
+		dev_err(lg->dev, "gpio %d reserved for ACPI\n", offset);
 		return -EBUSY;
 	}
 	/* Fail if pin is in alternate function mode (not GPIO mode) */
@@ -129,7 +129,7 @@ static void lp_gpio_free(struct gpio_chip *chip, unsigned offset)
 	/* disable input sensing */
 	outl(inl(conf2) | GPINDIS_BIT, conf2);
 
-	pm_runtime_put(&lg->pdev->dev);
+	pm_runtime_put(lg->dev);
 }
 
 static int lp_irq_type(struct irq_data *d, unsigned type)
@@ -325,7 +325,7 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	if (!lg)
 		return -ENOMEM;
 
-	lg->pdev = pdev;
+	lg->dev = dev;
 	platform_set_drvdata(pdev, lg);
 
 	io_rc = platform_get_resource(pdev, IORESOURCE_IO, 0);
-- 
2.24.0.rc1

