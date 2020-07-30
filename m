Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA7023355A
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jul 2020 17:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729854AbgG3P2W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jul 2020 11:28:22 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:57256 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729836AbgG3P2V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jul 2020 11:28:21 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 696588040A6D;
        Thu, 30 Jul 2020 15:28:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id g363o4P2slKZ; Thu, 30 Jul 2020 18:28:17 +0300 (MSK)
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
Subject: [PATCH v3 10/10] gpio: dwapb: Use resource managed GPIO-chip add data method
Date:   Thu, 30 Jul 2020 18:28:07 +0300
Message-ID: <20200730152808.2955-11-Sergey.Semin@baikalelectronics.ru>
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

Since the resource managed version of gpiochip_add_data() will handle the
GPIO-chip data automated cleanup we can freely remove the DW APB GPIO
driver code responsible for that. After doing so the DW APB GPIO driver
removal callback can be also fully discarded since there is nothing left
to be done for it. All the cleanups are now performed by means of the
device managed framework.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 37 ++-----------------------------------
 1 file changed, 2 insertions(+), 35 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 803e1d1f4b5a..a5b326754124 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -91,7 +91,6 @@ struct dwapb_gpio_port_irqchip {
 struct dwapb_gpio_port {
 	struct gpio_chip	gc;
 	struct dwapb_gpio_port_irqchip *pirq;
-	bool			is_registered;
 	struct dwapb_gpio	*gpio;
 #ifdef CONFIG_PM_SLEEP
 	struct dwapb_context	*ctx;
@@ -519,32 +518,16 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
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
@@ -738,23 +721,8 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
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
@@ -858,7 +826,6 @@ static struct platform_driver dwapb_gpio_driver = {
 		.acpi_match_table = dwapb_acpi_match,
 	},
 	.probe		= dwapb_gpio_probe,
-	.remove		= dwapb_gpio_remove,
 };
 
 module_platform_driver(dwapb_gpio_driver);
-- 
2.27.0

