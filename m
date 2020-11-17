Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 486272B5DAE
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Nov 2020 11:59:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727527AbgKQK7h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 05:59:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgKQK7h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 05:59:37 -0500
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE8CBC0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 02:59:36 -0800 (PST)
Received: by mail-qt1-x841.google.com with SMTP id g17so15249542qts.5
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 02:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=n40wvJwA79bd+HmHOZ5kCA/i1c76awzmFj8c1fZftNM=;
        b=XDBOYIB7M7fojoGQXcS27DmBP4kkj6AQ/dlFPiv+D4d8W65FhG3Pdum74tCpMUUoKD
         8f+9OzYfTJcTpPnrU2wdYNwL3ppAS8z1gn47JwXx5FexjGyLJ3891bC52mrhY6YsjsQL
         p8/4EwmU4sPUF0hCrCCeVCtQbtPkHRGFTKV6tMYGXbWJzTkVMsem5opRXKa3PJVX23+Z
         YnHdj+FRIupIkKDfwddX6RuCd3hDKa8TPAAS4nEC21JNScxTP4+POKrJ4HQHhyrt8O8u
         mjac1xrieR7QF4E2oAOvt+Ak/rqANZu1VK+EIkY7ckxMc8e9GnVGuHiMDU0uuP/XRLeH
         QY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=n40wvJwA79bd+HmHOZ5kCA/i1c76awzmFj8c1fZftNM=;
        b=lHvnx5wo2wosZZH81rT9guZhv8xggngzUpvseODYGJhP4UnRX2Ek8gf5ZggjYhrpu2
         /w7dWhzMERfFWijeOKZJk77RzP0APH1nLQqFDjjDw0WGrUFdtgnFl7UzeDv6Xqm0MJrJ
         iSTxpiIYE9ErRrQ4qDi0sp2nCmpqDJQ+xCsFSAhSvfykS8McuIDieUHNvzY0fQTjubXx
         wwRCJWCpV5Thd/z7M1GD1R5QQiv3Ws39tBwRnFB9BcM2z1cWmqu29P7pj0Iua7zL9kny
         foXQXUPqH3t9MEmdmDTmIOW6OFvtmuvd4e1ZhNt2pICxKpSpeMv+R+eLG7pbKzxhPvNH
         ZR3Q==
X-Gm-Message-State: AOAM533AF2kw0Nt4RPM7FdWOYtXOX1lCGAhp7czCDFlXQMg044htAUi9
        7JLnXdZCft0TcbXhyaRF68mXHm+F9Lyvfw==
X-Google-Smtp-Source: ABdhPJyv2yhJ2Qd/LcfItfvKgli5Zu6OI8ts5dbWYXJcX2L7nyMmxDuhcwZLhAOVoaw78XNUKSBFIA==
X-Received: by 2002:aed:3223:: with SMTP id y32mr18971042qtd.239.1605610776068;
        Tue, 17 Nov 2020 02:59:36 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:997:213a:a240:fc07:36c8])
        by smtp.gmail.com with ESMTPSA id p6sm13913429qkh.105.2020.11.17.02.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 02:59:35 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de,
        andy.shevchenko@gmail.com, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4] gpio: mxc: Convert the driver to DT-only
Date:   Tue, 17 Nov 2020 07:59:17 -0300
Message-Id: <20201117105917.27591-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since 5.10-rc1 i.MX is a devicetree-only platform, so simplify the code
by removing the unused non-DT support.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
Changes since v3:
- Fix the logic to only evaluate to mx21 as the original implementation.
- Added Andy's Reviewed-by tag.

 drivers/gpio/gpio-mxc.c | 102 +++++++++-------------------------------
 1 file changed, 22 insertions(+), 80 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 643f4c557ac2..157106e1e438 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -24,13 +24,6 @@
 #include <linux/of_device.h>
 #include <linux/bug.h>
 
-enum mxc_gpio_hwtype {
-	IMX1_GPIO,	/* runs on i.mx1 */
-	IMX21_GPIO,	/* runs on i.mx21 and i.mx27 */
-	IMX31_GPIO,	/* runs on i.mx31 */
-	IMX35_GPIO,	/* runs on all other i.mx */
-};
-
 /* device type dependent stuff */
 struct mxc_gpio_hwdata {
 	unsigned dr_reg;
@@ -68,6 +61,7 @@ struct mxc_gpio_port {
 	u32 both_edges;
 	struct mxc_gpio_reg_saved gpio_saved_reg;
 	bool power_off;
+	const struct mxc_gpio_hwdata *hwdata;
 };
 
 static struct mxc_gpio_hwdata imx1_imx21_gpio_hwdata = {
@@ -115,48 +109,27 @@ static struct mxc_gpio_hwdata imx35_gpio_hwdata = {
 	.fall_edge	= 0x03,
 };
 
-static enum mxc_gpio_hwtype mxc_gpio_hwtype;
-static struct mxc_gpio_hwdata *mxc_gpio_hwdata;
-
-#define GPIO_DR			(mxc_gpio_hwdata->dr_reg)
-#define GPIO_GDIR		(mxc_gpio_hwdata->gdir_reg)
-#define GPIO_PSR		(mxc_gpio_hwdata->psr_reg)
-#define GPIO_ICR1		(mxc_gpio_hwdata->icr1_reg)
-#define GPIO_ICR2		(mxc_gpio_hwdata->icr2_reg)
-#define GPIO_IMR		(mxc_gpio_hwdata->imr_reg)
-#define GPIO_ISR		(mxc_gpio_hwdata->isr_reg)
-#define GPIO_EDGE_SEL		(mxc_gpio_hwdata->edge_sel_reg)
-
-#define GPIO_INT_LOW_LEV	(mxc_gpio_hwdata->low_level)
-#define GPIO_INT_HIGH_LEV	(mxc_gpio_hwdata->high_level)
-#define GPIO_INT_RISE_EDGE	(mxc_gpio_hwdata->rise_edge)
-#define GPIO_INT_FALL_EDGE	(mxc_gpio_hwdata->fall_edge)
+#define GPIO_DR			(port->hwdata->dr_reg)
+#define GPIO_GDIR		(port->hwdata->gdir_reg)
+#define GPIO_PSR		(port->hwdata->psr_reg)
+#define GPIO_ICR1		(port->hwdata->icr1_reg)
+#define GPIO_ICR2		(port->hwdata->icr2_reg)
+#define GPIO_IMR		(port->hwdata->imr_reg)
+#define GPIO_ISR		(port->hwdata->isr_reg)
+#define GPIO_EDGE_SEL		(port->hwdata->edge_sel_reg)
+
+#define GPIO_INT_LOW_LEV	(port->hwdata->low_level)
+#define GPIO_INT_HIGH_LEV	(port->hwdata->high_level)
+#define GPIO_INT_RISE_EDGE	(port->hwdata->rise_edge)
+#define GPIO_INT_FALL_EDGE	(port->hwdata->fall_edge)
 #define GPIO_INT_BOTH_EDGES	0x4
 
-static const struct platform_device_id mxc_gpio_devtype[] = {
-	{
-		.name = "imx1-gpio",
-		.driver_data = IMX1_GPIO,
-	}, {
-		.name = "imx21-gpio",
-		.driver_data = IMX21_GPIO,
-	}, {
-		.name = "imx31-gpio",
-		.driver_data = IMX31_GPIO,
-	}, {
-		.name = "imx35-gpio",
-		.driver_data = IMX35_GPIO,
-	}, {
-		/* sentinel */
-	}
-};
-
 static const struct of_device_id mxc_gpio_dt_ids[] = {
-	{ .compatible = "fsl,imx1-gpio", .data = &mxc_gpio_devtype[IMX1_GPIO], },
-	{ .compatible = "fsl,imx21-gpio", .data = &mxc_gpio_devtype[IMX21_GPIO], },
-	{ .compatible = "fsl,imx31-gpio", .data = &mxc_gpio_devtype[IMX31_GPIO], },
-	{ .compatible = "fsl,imx35-gpio", .data = &mxc_gpio_devtype[IMX35_GPIO], },
-	{ .compatible = "fsl,imx7d-gpio", .data = &mxc_gpio_devtype[IMX35_GPIO], },
+	{ .compatible = "fsl,imx1-gpio", .data =  &imx1_imx21_gpio_hwdata },
+	{ .compatible = "fsl,imx21-gpio", .data = &imx1_imx21_gpio_hwdata },
+	{ .compatible = "fsl,imx31-gpio", .data = &imx31_gpio_hwdata },
+	{ .compatible = "fsl,imx35-gpio", .data = &imx35_gpio_hwdata },
+	{ .compatible = "fsl,imx7d-gpio", .data = &imx35_gpio_hwdata },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mxc_gpio_dt_ids);
@@ -372,36 +345,6 @@ static int mxc_gpio_init_gc(struct mxc_gpio_port *port, int irq_base)
 	return rv;
 }
 
-static void mxc_gpio_get_hw(struct platform_device *pdev)
-{
-	const struct of_device_id *of_id =
-			of_match_device(mxc_gpio_dt_ids, &pdev->dev);
-	enum mxc_gpio_hwtype hwtype;
-
-	if (of_id)
-		pdev->id_entry = of_id->data;
-	hwtype = pdev->id_entry->driver_data;
-
-	if (mxc_gpio_hwtype) {
-		/*
-		 * The driver works with a reasonable presupposition,
-		 * that is all gpio ports must be the same type when
-		 * running on one soc.
-		 */
-		BUG_ON(mxc_gpio_hwtype != hwtype);
-		return;
-	}
-
-	if (hwtype == IMX35_GPIO)
-		mxc_gpio_hwdata = &imx35_gpio_hwdata;
-	else if (hwtype == IMX31_GPIO)
-		mxc_gpio_hwdata = &imx31_gpio_hwdata;
-	else
-		mxc_gpio_hwdata = &imx1_imx21_gpio_hwdata;
-
-	mxc_gpio_hwtype = hwtype;
-}
-
 static int mxc_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 {
 	struct mxc_gpio_port *port = gpiochip_get_data(gc);
@@ -417,14 +360,14 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	int irq_base;
 	int err;
 
-	mxc_gpio_get_hw(pdev);
-
 	port = devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
 	if (!port)
 		return -ENOMEM;
 
 	port->dev = &pdev->dev;
 
+	port->hwdata = device_get_match_data(&pdev->dev);
+
 	port->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(port->base))
 		return PTR_ERR(port->base);
@@ -461,7 +404,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	writel(0, port->base + GPIO_IMR);
 	writel(~0, port->base + GPIO_ISR);
 
-	if (mxc_gpio_hwtype == IMX21_GPIO) {
+	if (of_device_is_compatible(np, "fsl,imx21-gpio")) {
 		/*
 		 * Setup one handler for all GPIO interrupts. Actually setting
 		 * the handler is needed only once, but doing it for every port
@@ -596,7 +539,6 @@ static struct platform_driver mxc_gpio_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe		= mxc_gpio_probe,
-	.id_table	= mxc_gpio_devtype,
 };
 
 static int __init gpio_mxc_init(void)
-- 
2.17.1

