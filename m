Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 654761CFD35
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 20:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgELS0c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 14:26:32 -0400
Received: from mga18.intel.com ([134.134.136.126]:38515 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725938AbgELS0b (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 May 2020 14:26:31 -0400
IronPort-SDR: x5h0DKn6uyH/FdTjRiWO3cvJtn6XsftK9hI4PhxXp12C6BkSa8qRVWyHxZi8sBmVlM6v+q5Eka
 VjXkX8IcBj3A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2020 11:26:26 -0700
IronPort-SDR: FjQB8vbML70K7NTM8GupvnPGJuNjr5XH1JNo5pzU3ngs5eGTby4QcO2S+/xN2n9rSY31Zakf5p
 cna7gJgDWhYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,384,1583222400"; 
   d="scan'208";a="409396966"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 12 May 2020 11:26:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1AEF86A; Tue, 12 May 2020 21:26:24 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] gpio: mb86s7x: Remove superfluous test for ACPI companion
Date:   Tue, 12 May 2020 21:26:23 +0300
Message-Id: <20200512182623.54990-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512182623.54990-1-andriy.shevchenko@linux.intel.com>
References: <20200512182623.54990-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

acpi_gpiochip_request_interrupts() will check for ACPI handle of
the GPIO chip parent device and bail out if there is none defined.
Thus, has_acpi_companion() is effectively repeating above and
is not needed in the individual driver.

Assigning ->to_irq() unconditionally doesn't change anything, except
an error code, but this we fix as well by propagating it from
platform_get_irq().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-mb86s7x.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-mb86s7x.c b/drivers/gpio/gpio-mb86s7x.c
index 3be2e56f7c4321..37c5363e391ef1 100644
--- a/drivers/gpio/gpio-mb86s7x.c
+++ b/drivers/gpio/gpio-mb86s7x.c
@@ -145,7 +145,9 @@ static int mb86s70_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
 
 	for (index = 0;; index++) {
 		irq = platform_get_irq(to_platform_device(gc->parent), index);
-		if (irq <= 0)
+		if (irq < 0)
+			return irq;
+		if (irq == 0)
 			break;
 		if (irq_get_irq_data(irq)->hwirq == offset)
 			return irq;
@@ -184,15 +186,13 @@ static int mb86s70_gpio_probe(struct platform_device *pdev)
 	gchip->gc.free = mb86s70_gpio_free;
 	gchip->gc.get = mb86s70_gpio_get;
 	gchip->gc.set = mb86s70_gpio_set;
+	gchip->gc.to_irq = mb86s70_gpio_to_irq;
 	gchip->gc.label = dev_name(&pdev->dev);
 	gchip->gc.ngpio = 32;
 	gchip->gc.owner = THIS_MODULE;
 	gchip->gc.parent = &pdev->dev;
 	gchip->gc.base = -1;
 
-	if (has_acpi_companion(&pdev->dev))
-		gchip->gc.to_irq = mb86s70_gpio_to_irq;
-
 	ret = gpiochip_add_data(&gchip->gc, gchip);
 	if (ret) {
 		dev_err(&pdev->dev, "couldn't register gpio driver\n");
@@ -200,8 +200,7 @@ static int mb86s70_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (has_acpi_companion(&pdev->dev))
-		acpi_gpiochip_request_interrupts(&gchip->gc);
+	acpi_gpiochip_request_interrupts(&gchip->gc);
 
 	return 0;
 }
@@ -210,8 +209,7 @@ static int mb86s70_gpio_remove(struct platform_device *pdev)
 {
 	struct mb86s70_gpio_chip *gchip = platform_get_drvdata(pdev);
 
-	if (has_acpi_companion(&pdev->dev))
-		acpi_gpiochip_free_interrupts(&gchip->gc);
+	acpi_gpiochip_free_interrupts(&gchip->gc);
 	gpiochip_remove(&gchip->gc);
 	clk_disable_unprepare(gchip->clk);
 
-- 
2.26.2

