Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1690341331
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 03:47:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233354AbhCSCrM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Mar 2021 22:47:12 -0400
Received: from inva021.nxp.com ([92.121.34.21]:55074 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229736AbhCSCqk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 18 Mar 2021 22:46:40 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 65D59202418;
        Fri, 19 Mar 2021 03:46:39 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3CD5C20241E;
        Fri, 19 Mar 2021 03:46:35 +0100 (CET)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id B0F524029B;
        Fri, 19 Mar 2021 03:46:29 +0100 (CET)
From:   Ran Wang <ran.wang_1@nxp.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Walle <michael@walle.cc>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ran Wang <ran.wang_1@nxp.com>
Subject: [PATCH v2] gpio: mpc8xxx: Add ACPI support
Date:   Fri, 19 Mar 2021 10:53:32 +0800
Message-Id: <20210319025332.36659-1-ran.wang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Current implementation only supports DT, now add ACPI support.

Note that compared to device of 'fsl,qoriq-gpio', LS1028A and
LS1088A's GPIO have no extra programming, so simplify related checking.

Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
---
Change in v2:
 - Initialize devtype with NULL to fix compile warning.
 - Replace of_device_get_match_data() and acpi_match_device with device_get_match_data().
 - Replace acpi_match_device() with simpler checking logic per Andy's suggestion.

 drivers/gpio/gpio-mpc8xxx.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 6dfca83bcd90..646225fa3e73 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -9,6 +9,7 @@
  * kind, whether express or implied.
  */
 
+#include <linux/acpi.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/spinlock.h>
@@ -292,8 +293,6 @@ static const struct of_device_id mpc8xxx_gpio_ids[] = {
 	{ .compatible = "fsl,mpc5121-gpio", .data = &mpc512x_gpio_devtype, },
 	{ .compatible = "fsl,mpc5125-gpio", .data = &mpc5125_gpio_devtype, },
 	{ .compatible = "fsl,pq3-gpio",     },
-	{ .compatible = "fsl,ls1028a-gpio", },
-	{ .compatible = "fsl,ls1088a-gpio", },
 	{ .compatible = "fsl,qoriq-gpio",   },
 	{}
 };
@@ -303,8 +302,8 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc;
 	struct gpio_chip	*gc;
-	const struct mpc8xxx_gpio_devtype *devtype =
-		of_device_get_match_data(&pdev->dev);
+	const struct mpc8xxx_gpio_devtype *devtype = NULL;
+	struct fwnode_handle *fwnode;
 	int ret;
 
 	mpc8xxx_gc = devm_kzalloc(&pdev->dev, sizeof(*mpc8xxx_gc), GFP_KERNEL);
@@ -315,14 +314,14 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 
 	raw_spin_lock_init(&mpc8xxx_gc->lock);
 
-	mpc8xxx_gc->regs = of_iomap(np, 0);
+	mpc8xxx_gc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (!mpc8xxx_gc->regs)
 		return -ENOMEM;
 
 	gc = &mpc8xxx_gc->gc;
 	gc->parent = &pdev->dev;
 
-	if (of_property_read_bool(np, "little-endian")) {
+	if (device_property_read_bool(&pdev->dev, "little-endian")) {
 		ret = bgpio_init(gc, &pdev->dev, 4,
 				 mpc8xxx_gc->regs + GPIO_DAT,
 				 NULL, NULL,
@@ -345,6 +344,7 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 
 	mpc8xxx_gc->direction_output = gc->direction_output;
 
+	devtype = device_get_match_data(&pdev->dev);
 	if (!devtype)
 		devtype = &mpc8xxx_gpio_devtype_default;
 
@@ -369,9 +369,9 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	 * associated input enable must be set (GPIOxGPIE[IEn]=1) to propagate
 	 * the port value to the GPIO Data Register.
 	 */
+	fwnode = dev_fwnode(&pdev->dev);
 	if (of_device_is_compatible(np, "fsl,qoriq-gpio") ||
-	    of_device_is_compatible(np, "fsl,ls1028a-gpio") ||
-	    of_device_is_compatible(np, "fsl,ls1088a-gpio"))
+	    !(IS_ERR_OR_NULL(fwnode) || is_of_node(fwnode)))
 		gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);
 
 	ret = gpiochip_add_data(gc, mpc8xxx_gc);
@@ -381,12 +381,15 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	mpc8xxx_gc->irqn = irq_of_parse_and_map(np, 0);
+	mpc8xxx_gc->irqn = platform_get_irq(pdev, 0);
 	if (!mpc8xxx_gc->irqn)
 		return 0;
 
-	mpc8xxx_gc->irq = irq_domain_add_linear(np, MPC8XXX_GPIO_PINS,
-					&mpc8xxx_gpio_irq_ops, mpc8xxx_gc);
+	mpc8xxx_gc->irq = irq_domain_create_linear(fwnode,
+						   MPC8XXX_GPIO_PINS,
+						   &mpc8xxx_gpio_irq_ops,
+						   mpc8xxx_gc);
+
 	if (!mpc8xxx_gc->irq)
 		return 0;
 
@@ -425,12 +428,21 @@ static int mpc8xxx_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id gpio_acpi_ids[] = {
+	{"NXP0031",},
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, gpio_acpi_ids);
+#endif
+
 static struct platform_driver mpc8xxx_plat_driver = {
 	.probe		= mpc8xxx_probe,
 	.remove		= mpc8xxx_remove,
 	.driver		= {
 		.name = "gpio-mpc8xxx",
 		.of_match_table	= mpc8xxx_gpio_ids,
+		.acpi_match_table = ACPI_PTR(gpio_acpi_ids),
 	},
 };
 
-- 
2.25.1

