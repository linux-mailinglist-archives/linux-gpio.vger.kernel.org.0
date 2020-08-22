Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF6524E561
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Aug 2020 06:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgHVE2q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 22 Aug 2020 00:28:46 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:46810 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726475AbgHVE2l (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 22 Aug 2020 00:28:41 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 65C68F7596F323BC7664;
        Sat, 22 Aug 2020 12:28:38 +0800 (CST)
Received: from huawei.com (10.175.112.70) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Sat, 22 Aug 2020
 12:28:28 +0800
From:   Ding Tianhong <dingtianhong@huawei.com>
To:     <dingtianhong@huawei.com>, <hoan@os.amperecomputing.com>,
        <fancer.lancer@gmail.com>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel.openeuler@huawei.com>
Subject: [PATCH] gpio: dwapb: add support for new hisilicon ascend soc
Date:   Sat, 22 Aug 2020 12:27:53 +0800
Message-ID: <1598070473-46624-1-git-send-email-dingtianhong@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.70]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The hisilicon ascend soc's gpio is based on the synopsys DW gpio,
and expand the register to support for INTCOMB_MASK, the new
register is used to enable/disable the interrupt combine features.

Both support for ACPI and Device Tree.

Signed-off-by: Ding Tianhong <dingtianhong@huawei.com>
---
 drivers/gpio/gpio-dwapb.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 1d8d55b..923b381 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -49,6 +49,8 @@
 #define GPIO_EXT_PORTC		0x58
 #define GPIO_EXT_PORTD		0x5c
 
+#define GPIO_INTCOMB_MASK	0xffc
+
 #define DWAPB_DRIVER_NAME	"gpio-dwapb"
 #define DWAPB_MAX_PORTS		4
 
@@ -58,6 +60,10 @@
 
 #define GPIO_REG_OFFSET_V2	1
 
+#define GPIO_REG_INT_COMB	2
+#define ENABLE_INT_COMB		1
+#define DISABLE_INT_COMB	0
+
 #define GPIO_INTMASK_V2		0x44
 #define GPIO_INTTYPE_LEVEL_V2	0x34
 #define GPIO_INT_POLARITY_V2	0x38
@@ -354,6 +360,20 @@ static irqreturn_t dwapb_irq_handler_mfd(int irq, void *dev_id)
 	return IRQ_RETVAL(dwapb_do_irq(dev_id));
 }
 
+static void dwapb_enable_inq_combine(struct dwapb_gpio *gpio, unsigned int enable)
+{
+	u32 val;
+
+	if (gpio->flags & GPIO_REG_INT_COMB) {
+		val = dwapb_read(gpio, GPIO_INTCOMB_MASK);
+		if (enable)
+			val |= BIT(0);
+		else
+			val &= BIT(0);
+		dwapb_write(gpio, GPIO_INTCOMB_MASK, val);
+	}
+}
+
 static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 				 struct dwapb_gpio_port *port,
 				 struct dwapb_port_property *pp)
@@ -446,6 +466,8 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 		irq_create_mapping(gpio->domain, hwirq);
 
 	port->gc.to_irq = dwapb_gpio_to_irq;
+
+	dwapb_enable_inq_combine(gpio, ENABLE_INT_COMB);
 }
 
 static void dwapb_irq_teardown(struct dwapb_gpio *gpio)
@@ -618,6 +640,7 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
 static const struct of_device_id dwapb_of_match[] = {
 	{ .compatible = "snps,dw-apb-gpio", .data = (void *)0},
 	{ .compatible = "apm,xgene-gpio-v2", .data = (void *)GPIO_REG_OFFSET_V2},
+	{ .compatible = "hisi,ascend-gpio", .data = (void *)GPIO_REG_INT_COMB},
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dwapb_of_match);
@@ -626,6 +649,7 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
 	{"HISI0181", 0},
 	{"APMC0D07", 0},
 	{"APMC0D81", GPIO_REG_OFFSET_V2},
+	{"HISI19XX", GPIO_REG_INT_COMB},
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, dwapb_acpi_match);
@@ -713,6 +737,8 @@ static int dwapb_gpio_remove(struct platform_device *pdev)
 	reset_control_assert(gpio->rst);
 	clk_bulk_disable_unprepare(DWAPB_NR_CLOCKS, gpio->clks);
 
+	dwapb_enable_inq_combine(gpio, DISABLE_INT_COMB);
+
 	return 0;
 }
 
@@ -794,6 +820,8 @@ static int dwapb_gpio_resume(struct device *dev)
 			dwapb_write(gpio, GPIO_INTEN, ctx->int_en);
 			dwapb_write(gpio, GPIO_INTMASK, ctx->int_mask);
 
+			dwapb_enable_inq_combine(gpio, ENABLE_INT_COMB);
+
 			/* Clear out spurious interrupts */
 			dwapb_write(gpio, GPIO_PORTA_EOI, 0xffffffff);
 		}
-- 
1.8.3.1

