Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEFD060D9EE
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 05:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232691AbiJZDes (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Oct 2022 23:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbiJZDeq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Oct 2022 23:34:46 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC392A432;
        Tue, 25 Oct 2022 20:34:40 -0700 (PDT)
Received: from canpemm500004.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MxvYs3wtlzHvFM;
        Wed, 26 Oct 2022 11:34:25 +0800 (CST)
Received: from localhost (10.175.101.6) by canpemm500004.china.huawei.com
 (7.192.104.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 26 Oct
 2022 11:34:38 +0800
From:   Weilong Chen <chenweilong@huawei.com>
To:     <chenweilong@huawei.com>, <f.fangjian@huawei.com>,
        <linus.walleij@linaro.org>, <yangyicong@hisilicon.com>,
        <xuwei5@huawei.com>, <robh+dt@kernel.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCH next 1/2] gpio: hisi: Add initial device tree support
Date:   Wed, 26 Oct 2022 11:42:18 +0800
Message-ID: <20221026034219.172880-1-chenweilong@huawei.com>
X-Mailer: git-send-email 2.31.GIT
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500004.china.huawei.com (7.192.104.92)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for HiSilicon GPIO controller in embedded platform, which
boot from devicetree.

Signed-off-by: Weilong Chen <chenweilong@huawei.com>
---
 drivers/gpio/Kconfig     |  2 +-
 drivers/gpio/gpio-hisi.c | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e034f752e7ce..71a7880af59d 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -310,7 +310,7 @@ config GPIO_GRGPIO
 
 config GPIO_HISI
 	tristate "HiSilicon GPIO controller driver"
-	depends on (ARM64 && ACPI) || COMPILE_TEST
+	depends on ARM64 || COMPILE_TEST
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
index 3caabef5c7a2..813c0c1d4e49 100644
--- a/drivers/gpio/gpio-hisi.c
+++ b/drivers/gpio/gpio-hisi.c
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (c) 2020 HiSilicon Limited. */
+#include <linux/acpi.h>
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 
@@ -215,11 +217,21 @@ static void hisi_gpio_init_irq(struct hisi_gpio *hisi_gpio)
 	hisi_gpio_write_reg(chip, HISI_GPIO_INTCOMB_MASK_WX, 1);
 }
 
+#ifdef CONFIG_ACPI
 static const struct acpi_device_id hisi_gpio_acpi_match[] = {
 	{"HISI0184", 0},
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, hisi_gpio_acpi_match);
+#endif
+
+#ifdef CONFIG_OF
+static const struct of_device_id hisi_gpio_dts_match[] = {
+	{ .compatible = "hisilicon,gpio-ascend910", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, hisi_gpio_dts_match);
+#endif
 
 static void hisi_gpio_get_pdata(struct device *dev,
 				struct hisi_gpio *hisi_gpio)
@@ -310,7 +322,8 @@ static int hisi_gpio_probe(struct platform_device *pdev)
 static struct platform_driver hisi_gpio_driver = {
 	.driver		= {
 		.name	= HISI_GPIO_DRIVER_NAME,
-		.acpi_match_table = hisi_gpio_acpi_match,
+		.acpi_match_table = ACPI_PTR(hisi_gpio_acpi_match),
+		.of_match_table = of_match_ptr(hisi_gpio_dts_match),
 	},
 	.probe		= hisi_gpio_probe,
 };
-- 
2.31.GIT

