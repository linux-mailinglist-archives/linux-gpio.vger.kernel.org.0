Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 944061AA9AE
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 16:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636546AbgDOOQz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 10:16:55 -0400
Received: from mga11.intel.com ([192.55.52.93]:43694 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2636537AbgDOOPm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 10:15:42 -0400
IronPort-SDR: +7gfma0CJgHGu2/r9d5aJ9VT3uzJngmBgtjrCjJZb54sL0vP01QbtO2IEh1otBO30GK3x8Kckt
 MCeBthhseGlA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 07:15:38 -0700
IronPort-SDR: PTNzLWDxk1BxwGEo07OpEDodnzazFdtv9JuHUR97IRh12PdKmJPZMliuZVdI9Mlv9UGr1bhjLe
 cA3XdK5EVxjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; 
   d="scan'208";a="277627677"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 15 Apr 2020 07:15:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8E9B6190; Wed, 15 Apr 2020 17:15:35 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v2 01/14] gpio: dwapb: Append MODULE_ALIAS for platform driver
Date:   Wed, 15 Apr 2020 17:15:21 +0300
Message-Id: <20200415141534.31240-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The commit 3d2613c4289f
  ("GPIO: gpio-dwapb: Enable platform driver binding to MFD driver")
introduced a use of the platform driver but missed to add the following line
to it:
  MODULE_ALIAS("platform:gpio-dwapb");

Add this to get driver loaded automatically if platform device is registered.

Fixes: 3d2613c4289f ("GPIO: gpio-dwapb: Enable platform driver binding to MFD driver")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index d2ed11510f3c..c1b6d4f7307e 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -49,7 +49,9 @@
 #define GPIO_EXT_PORTC		0x58
 #define GPIO_EXT_PORTD		0x5c
 
+#define DWAPB_DRIVER_NAME	"gpio-dwapb"
 #define DWAPB_MAX_PORTS		4
+
 #define GPIO_EXT_PORT_STRIDE	0x04 /* register stride 32 bits */
 #define GPIO_SWPORT_DR_STRIDE	0x0c /* register stride 3*32 bits */
 #define GPIO_SWPORT_DDR_STRIDE	0x0c /* register stride 3*32 bits */
@@ -400,7 +402,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 		return;
 
 	err = irq_alloc_domain_generic_chips(gpio->domain, ngpio, 2,
-					     "gpio-dwapb", handle_level_irq,
+					     DWAPB_DRIVER_NAME, handle_level_irq,
 					     IRQ_NOREQUEST, 0,
 					     IRQ_GC_INIT_NESTED_LOCK);
 	if (err) {
@@ -457,7 +459,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 		 */
 		err = devm_request_irq(gpio->dev, pp->irq[0],
 				       dwapb_irq_handler_mfd,
-				       IRQF_SHARED, "gpio-dwapb-mfd", gpio);
+				       IRQF_SHARED, DWAPB_DRIVER_NAME, gpio);
 		if (err) {
 			dev_err(gpio->dev, "error requesting IRQ\n");
 			irq_domain_remove(gpio->domain);
@@ -847,7 +849,7 @@ static SIMPLE_DEV_PM_OPS(dwapb_gpio_pm_ops, dwapb_gpio_suspend,
 
 static struct platform_driver dwapb_gpio_driver = {
 	.driver		= {
-		.name	= "gpio-dwapb",
+		.name	= DWAPB_DRIVER_NAME,
 		.pm	= &dwapb_gpio_pm_ops,
 		.of_match_table = of_match_ptr(dwapb_of_match),
 		.acpi_match_table = ACPI_PTR(dwapb_acpi_match),
@@ -861,3 +863,4 @@ module_platform_driver(dwapb_gpio_driver);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Jamie Iles");
 MODULE_DESCRIPTION("Synopsys DesignWare APB GPIO driver");
+MODULE_ALIAS("platform:" DWAPB_DRIVER_NAME);
-- 
2.25.1

