Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1813C233388
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jul 2020 15:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729075AbgG3N4I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jul 2020 09:56:08 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:56574 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729090AbgG3Nzx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jul 2020 09:55:53 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id B881E8040A7E;
        Thu, 30 Jul 2020 13:55:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4JKM5HhNRWZ7; Thu, 30 Jul 2020 16:55:47 +0300 (MSK)
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
Subject: [PATCH v2 10/10] gpio: dwapb: Use resource managed GPIO-chip add data method
Date:   Thu, 30 Jul 2020 16:55:36 +0300
Message-ID: <20200730135536.19747-11-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200730135536.19747-1-Sergey.Semin@baikalelectronics.ru>
References: <20200730135536.19747-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since the resource managed version of gpiochip_add_data() will handle the
GPIO-chip data automated cleanup we can freely remove the DW APB GPIO
driver code responsible for that. After doing so the DW APB GPIO driver
removal callback can be also fully discarded since there is nothing left
to be done for it. All the cleanups are now performed by means of the
device managed framework.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 37 ++-----------------------------------
 1 file changed, 2 insertions(+), 35 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 9b3065812de2..d3d555b3d492 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -87,7 +87,6 @@ struct dwapb_gpio_port {
 	unsigned int		nr_irqs;
 	unsigned int		irq[DWAPB_MAX_GPIOS];
 	struct irq_chip		irqchip;
-	bool			is_registered;
 	struct dwapb_gpio	*gpio;
 #ifdef CONFIG_PM_SLEEP
 	struct dwapb_context	*ctx;
@@ -505,32 +504,16 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 	if (pp->idx == 0)
 		dwapb_configure_irqs(gpio, port, pp);
 
-	err = gpiochip_add_data(&port->gc, port);
+	err = devm_gpiochip_add_data(gpio->dev, &port->gc, port);
 	if (err) {
 		dev_err(gpio->dev, "failed to register gpiochip for port%d\n",
 			port->idx);
 		return err;
 	}
 
-	port->is_registered = true;
-
 	return 0;
 }
 
-static void dwapb_gpio_unregister(struct dwapb_gpio *gpio)
-{
-	unsigned int m;
-
-	for (m = 0; m < gpio->nr_ports; ++m) {
-		struct dwapb_gpio_port *port = &gpio->ports[m];
-
-		if (!port->is_registered)
-			continue;
-
-		gpiochip_remove(&port->gc);
-	}
-}
-
 static void dwapb_get_irq(struct device *dev, struct fwnode_handle *fwnode,
 			  struct dwapb_port_property *pp)
 {
@@ -724,23 +707,8 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 	for (i = 0; i < gpio->nr_ports; i++) {
 		err = dwapb_gpio_add_port(gpio, &pdata->properties[i], i);
 		if (err)
-			goto out_unregister;
+			return err;
 	}
-	platform_set_drvdata(pdev, gpio);
-
-	return 0;
-
-out_unregister:
-	dwapb_gpio_unregister(gpio);
-
-	return err;
-}
-
-static int dwapb_gpio_remove(struct platform_device *pdev)
-{
-	struct dwapb_gpio *gpio = platform_get_drvdata(pdev);
-
-	dwapb_gpio_unregister(gpio);
 
 	return 0;
 }
@@ -844,7 +812,6 @@ static struct platform_driver dwapb_gpio_driver = {
 		.acpi_match_table = dwapb_acpi_match,
 	},
 	.probe		= dwapb_gpio_probe,
-	.remove		= dwapb_gpio_remove,
 };
 
 module_platform_driver(dwapb_gpio_driver);
-- 
2.27.0

