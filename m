Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8D96233563
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jul 2020 17:28:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728412AbgG3P2a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jul 2020 11:28:30 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:57242 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729832AbgG3P2U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jul 2020 11:28:20 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id BC18C8040A6C;
        Thu, 30 Jul 2020 15:28:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id DcZ2WhE0PUis; Thu, 30 Jul 2020 18:28:17 +0300 (MSK)
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
Subject: [PATCH v3 09/10] gpio: dwapb: Get clocks by means of resource managed interface
Date:   Thu, 30 Jul 2020 18:28:06 +0300
Message-ID: <20200730152808.2955-10-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200730152808.2955-1-Sergey.Semin@baikalelectronics.ru>
References: <20200730152808.2955-1-Sergey.Semin@baikalelectronics.ru>
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

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 48 ++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index faac594287b3..803e1d1f4b5a 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -647,6 +647,36 @@ static int dwapb_get_reset(struct dwapb_gpio *gpio)
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
@@ -699,21 +729,9 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
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
 
@@ -728,7 +746,6 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 
 out_unregister:
 	dwapb_gpio_unregister(gpio);
-	clk_bulk_disable_unprepare(DWAPB_NR_CLOCKS, gpio->clks);
 
 	return err;
 }
@@ -738,7 +755,6 @@ static int dwapb_gpio_remove(struct platform_device *pdev)
 	struct dwapb_gpio *gpio = platform_get_drvdata(pdev);
 
 	dwapb_gpio_unregister(gpio);
-	clk_bulk_disable_unprepare(DWAPB_NR_CLOCKS, gpio->clks);
 
 	return 0;
 }
-- 
2.27.0

