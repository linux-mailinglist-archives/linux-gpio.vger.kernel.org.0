Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5012422A4B5
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 03:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387624AbgGWBjM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 21:39:12 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:32994 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387575AbgGWBjL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 21:39:11 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 59EC68040A68;
        Thu, 23 Jul 2020 01:39:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id A-NGUt0q2C7j; Thu, 23 Jul 2020 04:39:07 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Serge Semin <fancer.lancer@gmail.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 6/7] gpio: dwapb: Get clocks by means of resource managed interface
Date:   Thu, 23 Jul 2020 04:38:57 +0300
Message-ID: <20200723013858.10766-7-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru>
References: <20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The kernel clock framework provides the resource managed version of
the clk_bulk_get() method. The only thing which needs to be also automated
is the clocks disable/unprepare procedure executed on the device removal.
It can be implemented by means of the custom action definition. After that
the clocks acquisition and release will be purely managed by the device
resources interface.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 48 ++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 693cbd896f08..8588e45186ad 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -621,6 +621,36 @@ static int dwapb_get_reset(struct dwapb_gpio *gpio)
 	return devm_add_action_or_reset(gpio->dev, dwapb_assert_reset, gpio);
 }
 
+static void dwapb_disable_clks(void *data)
+{
+	struct dwapb_gpio *gpio = data;
+
+	clk_bulk_disable_unprepare(DWAPB_NR_CLOCKS, gpio->clks);
+}
+
+static int dwapb_get_clks(struct dwapb_gpio *gpio)
+{
+	int err;
+
+	/* Optional bus and debounce clocks */
+	gpio->clks[0].id = "bus";
+	gpio->clks[1].id = "db";
+	err = devm_clk_bulk_get_optional(gpio->dev, DWAPB_NR_CLOCKS,
+					 gpio->clks);
+	if (err) {
+		dev_err(gpio->dev, "Cannot get APB/Debounce clocks\n");
+		return err;
+	}
+
+	err = clk_bulk_prepare_enable(DWAPB_NR_CLOCKS, gpio->clks);
+	if (err) {
+		dev_err(gpio->dev, "Cannot enable APB/Debounce clocks\n");
+		return err;
+	}
+
+	return devm_add_action_or_reset(gpio->dev, dwapb_disable_clks, gpio);
+}
+
 static const struct of_device_id dwapb_of_match[] = {
 	{ .compatible = "snps,dw-apb-gpio", .data = (void *)0},
 	{ .compatible = "apm,xgene-gpio-v2", .data = (void *)GPIO_REG_OFFSET_V2},
@@ -673,21 +703,9 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(gpio->regs))
 		return PTR_ERR(gpio->regs);
 
-	/* Optional bus and debounce clocks */
-	gpio->clks[0].id = "bus";
-	gpio->clks[1].id = "db";
-	err = devm_clk_bulk_get_optional(&pdev->dev, DWAPB_NR_CLOCKS,
-					 gpio->clks);
-	if (err) {
-		dev_err(&pdev->dev, "Cannot get APB/Debounce clocks\n");
-		return err;
-	}
-
-	err = clk_bulk_prepare_enable(DWAPB_NR_CLOCKS, gpio->clks);
-	if (err) {
-		dev_err(&pdev->dev, "Cannot enable APB/Debounce clocks\n");
+	err = dwapb_get_clks(gpio);
+	if (err)
 		return err;
-	}
 
 	gpio->flags = (uintptr_t)device_get_match_data(dev);
 
@@ -702,7 +720,6 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 
 out_unregister:
 	dwapb_gpio_unregister(gpio);
-	clk_bulk_disable_unprepare(DWAPB_NR_CLOCKS, gpio->clks);
 
 	return err;
 }
@@ -712,7 +729,6 @@ static int dwapb_gpio_remove(struct platform_device *pdev)
 	struct dwapb_gpio *gpio = platform_get_drvdata(pdev);
 
 	dwapb_gpio_unregister(gpio);
-	clk_bulk_disable_unprepare(DWAPB_NR_CLOCKS, gpio->clks);
 
 	return 0;
 }
-- 
2.26.2

