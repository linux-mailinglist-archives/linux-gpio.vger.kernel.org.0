Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0813423356C
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jul 2020 17:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729832AbgG3P2g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jul 2020 11:28:36 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:57214 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729829AbgG3P2S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jul 2020 11:28:18 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 1F36F8030866;
        Thu, 30 Jul 2020 15:28:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id c5PLTp3Bwkav; Thu, 30 Jul 2020 18:28:16 +0300 (MSK)
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
Subject: [PATCH v3 08/10] gpio: dwapb: Get reset control by means of resource managed interface
Date:   Thu, 30 Jul 2020 18:28:05 +0300
Message-ID: <20200730152808.2955-9-Sergey.Semin@baikalelectronics.ru>
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

The reset control interface provides the resource managed version of
the reset_control_get() method. The only thing which needs to be also
automated is the reset lane assertion on the device removal. It can be
implemented by means of the custom action definition. After that the reset
control will be purely managed by the device resources interface.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 707e9087ca59..faac594287b3 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -621,6 +621,32 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
 	return pdata;
 }
 
+static void dwapb_assert_reset(void *data)
+{
+	struct dwapb_gpio *gpio = data;
+
+	reset_control_assert(gpio->rst);
+}
+
+static int dwapb_get_reset(struct dwapb_gpio *gpio)
+{
+	int err;
+
+	gpio->rst = devm_reset_control_get_optional_shared(gpio->dev, NULL);
+	if (IS_ERR(gpio->rst)) {
+		dev_err(gpio->dev, "Cannot get reset descriptor\n");
+		return PTR_ERR(gpio->rst);
+	}
+
+	err = reset_control_deassert(gpio->rst);
+	if (err) {
+		dev_err(gpio->dev, "Cannot deassert reset lane\n");
+		return err;
+	}
+
+	return devm_add_action_or_reset(gpio->dev, dwapb_assert_reset, gpio);
+}
+
 static const struct of_device_id dwapb_of_match[] = {
 	{ .compatible = "snps,dw-apb-gpio", .data = (void *)0},
 	{ .compatible = "apm,xgene-gpio-v2", .data = (void *)GPIO_REG_OFFSET_V2},
@@ -660,11 +686,9 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 	gpio->dev = &pdev->dev;
 	gpio->nr_ports = pdata->nports;
 
-	gpio->rst = devm_reset_control_get_optional_shared(dev, NULL);
-	if (IS_ERR(gpio->rst))
-		return PTR_ERR(gpio->rst);
-
-	reset_control_deassert(gpio->rst);
+	err = dwapb_get_reset(gpio);
+	if (err)
+		return err;
 
 	gpio->ports = devm_kcalloc(&pdev->dev, gpio->nr_ports,
 				   sizeof(*gpio->ports), GFP_KERNEL);
@@ -714,7 +738,6 @@ static int dwapb_gpio_remove(struct platform_device *pdev)
 	struct dwapb_gpio *gpio = platform_get_drvdata(pdev);
 
 	dwapb_gpio_unregister(gpio);
-	reset_control_assert(gpio->rst);
 	clk_bulk_disable_unprepare(DWAPB_NR_CLOCKS, gpio->clks);
 
 	return 0;
-- 
2.27.0

