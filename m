Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4B2C17BEA4
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2020 14:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727320AbgCFNdH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Mar 2020 08:33:07 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:37268 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727180AbgCFNdE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Mar 2020 08:33:04 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 2AC268030797;
        Fri,  6 Mar 2020 13:25:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id nt9nIF6RReRP; Fri,  6 Mar 2020 16:25:18 +0300 (MSK)
From:   <Sergey.Semin@baikalelectronics.ru>
To:     Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] gpio: dwapb: Add debounce reference clock support
Date:   Fri, 6 Mar 2020 16:24:48 +0300
In-Reply-To: <20200306132448.13917-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306132448.13917-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Message-Id: <20200306132519.2AC268030797@mail.baikalelectronics.ru>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

Aside from the APB reference clock DW GPIO controller can have a
dedicated clock connected to setup a debounce time interval for
GPIO-based IRQs. Since this functionality is optional the corresponding
clock source is also optional. Due to this lets handle the debounce
clock in the same way as it was created for APB reference clock,
but using the bulk request/enable-disable methods.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
---
 drivers/gpio/gpio-dwapb.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index bfa16172f973..495b87f7c351 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -62,6 +62,8 @@
 #define GPIO_INTSTATUS_V2	0x3c
 #define GPIO_PORTA_EOI_V2	0x40
 
+#define DWAPB_NR_CLOCKS		2
+
 struct dwapb_gpio;
 
 #ifdef CONFIG_PM_SLEEP
@@ -97,7 +99,7 @@ struct dwapb_gpio {
 	struct irq_domain	*domain;
 	unsigned int		flags;
 	struct reset_control	*rst;
-	struct clk		*clk;
+	struct clk_bulk_data	clks[DWAPB_NR_CLOCKS];
 };
 
 static inline u32 gpio_reg_v2_convert(unsigned int offset)
@@ -689,16 +691,19 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(gpio->regs))
 		return PTR_ERR(gpio->regs);
 
-	/* Optional bus clock */
-	gpio->clk = devm_clk_get_optional(&pdev->dev, "bus");
-	if (IS_ERR(gpio->clk)) {
-		dev_info(&pdev->dev, "Cannot get APB clock\n");
-		return PTR_ERR(gpio->clk);
+	/* Optional bus and debounce clocks */
+	gpio->clks[0].id = "bus";
+	gpio->clks[1].id = "db";
+	err = devm_clk_bulk_get_optional(&pdev->dev, DWAPB_NR_CLOCKS,
+					 gpio->clks);
+	if (err) {
+		dev_info(&pdev->dev, "Cannot get APB/Debounce clocks\n");
+		return err;
 	}
 
-	err = clk_prepare_enable(gpio->clk);
+	err = clk_bulk_prepare_enable(DWAPB_NR_CLOCKS, gpio->clks);
 	if (err) {
-		dev_info(&pdev->dev, "Cannot enable APB clock\n");
+		dev_info(&pdev->dev, "Cannot enable APB/Debounce clocks\n");
 		return err;
 	}
 
@@ -727,7 +732,7 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 out_unregister:
 	dwapb_gpio_unregister(gpio);
 	dwapb_irq_teardown(gpio);
-	clk_disable_unprepare(gpio->clk);
+	clk_bulk_disable_unprepare(DWAPB_NR_CLOCKS, gpio->clks);
 
 	return err;
 }
@@ -739,7 +744,7 @@ static int dwapb_gpio_remove(struct platform_device *pdev)
 	dwapb_gpio_unregister(gpio);
 	dwapb_irq_teardown(gpio);
 	reset_control_assert(gpio->rst);
-	clk_disable_unprepare(gpio->clk);
+	clk_bulk_disable_unprepare(DWAPB_NR_CLOCKS, gpio->clks);
 
 	return 0;
 }
@@ -784,7 +789,7 @@ static int dwapb_gpio_suspend(struct device *dev)
 	}
 	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 
-	clk_disable_unprepare(gpio->clk);
+	clk_bulk_disable_unprepare(DWAPB_NR_CLOCKS, gpio->clks);
 
 	return 0;
 }
@@ -794,9 +799,13 @@ static int dwapb_gpio_resume(struct device *dev)
 	struct dwapb_gpio *gpio = dev_get_drvdata(dev);
 	struct gpio_chip *gc	= &gpio->ports[0].gc;
 	unsigned long flags;
-	int i;
+	int i, err;
 
-	clk_prepare_enable(gpio->clk);
+	err = clk_bulk_prepare_enable(DWAPB_NR_CLOCKS, gpio->clks);
+	if (err) {
+		dev_err(gpio->dev, "Cannot reenable APB/Debounce clocks\n");
+		return err;
+	}
 
 	spin_lock_irqsave(&gc->bgpio_lock, flags);
 	for (i = 0; i < gpio->nr_ports; i++) {
-- 
2.25.1

