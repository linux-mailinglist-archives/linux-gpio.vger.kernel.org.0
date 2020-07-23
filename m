Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9059B22A4BA
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 03:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387538AbgGWBjW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 21:39:22 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:33012 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387462AbgGWBjL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 21:39:11 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id F0A498040A69;
        Thu, 23 Jul 2020 01:39:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zaFfzz5IrmEE; Thu, 23 Jul 2020 04:39:08 +0300 (MSK)
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
Subject: [PATCH 7/7] gpio: dwapb: Use resource managed GPIO-chip add data method
Date:   Thu, 23 Jul 2020 04:38:58 +0300
Message-ID: <20200723013858.10766-8-Sergey.Semin@baikalelectronics.ru>
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

Since the resource managed version of gpiochip_add_data() will handle the
GPIO-chip data automated cleanup we can freely remove the DW APB GPIO
driver code responsible for that. After doing so the DW APB GPIO driver
removal callback can be also fully discarded since there is nothing left
to be done for it. All the cleanups are now performed by means of the
device managed framework.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 37 ++-----------------------------------
 1 file changed, 2 insertions(+), 35 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 8588e45186ad..3d1767e69881 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -84,7 +84,6 @@ struct dwapb_context {
 
 struct dwapb_gpio_port {
 	struct gpio_chip	gc;
-	bool			is_registered;
 	struct dwapb_gpio	*gpio;
 #ifdef CONFIG_PM_SLEEP
 	struct dwapb_context	*ctx;
@@ -493,32 +492,16 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
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
@@ -712,23 +695,8 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
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
@@ -832,7 +800,6 @@ static struct platform_driver dwapb_gpio_driver = {
 		.acpi_match_table = dwapb_acpi_match,
 	},
 	.probe		= dwapb_gpio_probe,
-	.remove		= dwapb_gpio_remove,
 };
 
 module_platform_driver(dwapb_gpio_driver);
-- 
2.26.2

