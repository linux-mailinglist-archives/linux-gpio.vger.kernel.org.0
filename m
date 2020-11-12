Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8D72B0B01
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 18:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbgKLRM7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 12:12:59 -0500
Received: from mail-dm6nam08on2071.outbound.protection.outlook.com ([40.107.102.71]:8609
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726125AbgKLRM5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 12:12:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0oHORGDGFlERjwVZCsr5Sty8/+KaziZsIh1GeGxq4uRz51jppl0DVZec1jh7atgCeOS0kTicLx4XeO5ln0MR7VJfy9AkVnyoG3yUmfydMX54hDyMJrqyv6EZY3vc9wq4a+NKZjThszh7PLwV2qveFN0NvT7Qknto/OvbuvuNZF3mmedZemI1EuYj5JlHpGS7DvN8953YKgmlrVFP7O5ZUeaiO9ONgs8S7XRKXvhxd0y230ZoUI38tOksv5cs4V8AnmbpBVbPUQED4NL71zjZNqNRykjZtxYgEUj0jjDgp+/uDT/dm0moDlQgxVYvmWX1JmiaPX3Y/5q6XW3y1JwOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgh6iSwdiNpIusoPLH+ZQ3p/v7XncJan8IKx/WNI9fQ=;
 b=WMv76XGhy9Q7/wS9TiKV5j49JT8oy50ALtGkqCdKjfX8f7XUA3jv49/e6da3HCHbCeAdn9TuGfqQOppA4Se1/Zp5q0Nz1Enev6RCBEsZDkWzqt4mic0OHmNQ7M17snarCrOIU0IX1bugO9DE7A0Z3G+Pk4dT8UauhEqLpfQ3xX7OQHdO3SdSYXd712R4RLnpv/PNsMP+jFtme0elqh1Q5NYS5MU/tXt+1v1fXzzBlRlO/5ze49dpbM0SuBBWFiA7HN5jT3TazZ71UvQdkr7uUfN4MVrvWpgFuxuuv7XRMDIRdF003RG7wCeADrs8bYtcluUhL22hTIfonAp5IIVsKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgh6iSwdiNpIusoPLH+ZQ3p/v7XncJan8IKx/WNI9fQ=;
 b=LxfN4iT4jrfsIk8b/0GNmnYThPkSTI1GhoEpEcziTpTEQyVEh+6bf7R+WfTDzOYE+L07syKRMlm7fiCoiHEPYw8FYuvk9pj42cglmdvsSZPlw1H6n60PchVSBzfUY8CC6jSGhnsVUQ3CYIuCU7WN3m6iwQEuTrKKDPjN3gzVyDs=
Received: from DM5PR08CA0035.namprd08.prod.outlook.com (2603:10b6:4:60::24) by
 BL0PR02MB6498.namprd02.prod.outlook.com (2603:10b6:208:1cb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 12 Nov
 2020 17:12:53 +0000
Received: from CY1NAM02FT019.eop-nam02.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::fa) by DM5PR08CA0035.outlook.office365.com
 (2603:10b6:4:60::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Thu, 12 Nov 2020 17:12:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT019.mail.protection.outlook.com (10.152.75.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Thu, 12 Nov 2020 17:12:52 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 12 Nov 2020 09:12:51 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 12 Nov 2020 09:12:51 -0800
Envelope-to: git@xilinx.com,
 michal.simek@xilinx.com,
 linus.walleij@linaro.org,
 bgolaszewski@baylibre.com,
 hancock@sedsystems.ca,
 linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [10.140.6.6] (port=44844 helo=xhdappanad40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1kdG9R-0005SG-TF; Thu, 12 Nov 2020 09:12:50 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <michal.simek@xilinx.com>, <shubhrajyoti.datta@xilinx.com>,
        <sgoud@xilinx.com>, <hancock@sedsystems.ca>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [LINUX PATCH V3 5/9] gpio: gpio-xilinx: Add interrupt support
Date:   Thu, 12 Nov 2020 22:42:24 +0530
Message-ID: <1605201148-4508-6-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7f5eac8-e18c-48a9-c915-08d8872e30ca
X-MS-TrafficTypeDiagnostic: BL0PR02MB6498:
X-Microsoft-Antispam-PRVS: <BL0PR02MB6498F5BA5B82DF4AEC69303AAFE70@BL0PR02MB6498.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QkhQ78EJfG0+JYn47im6oXreHS7q0JRv2m3+K8qENBQYIfGa2eOs62KlHPhdn1jdv2Oj1aRlETY3ROEZ8mZ8SX7qSDbxqXxPQ7y75FHX/fCMYiumqh3VwayLU7NJhGlRm1N9ipfKeUbefOCL29oftp9SOh+bVyDu9NuRcnUA11nPVTKJMcfSfGWbiAI6FyBSxPRg2xBWZ9A28zJMEMFy3NnVwyLNsEMnAkQuJLEMNboyIM20PT3NzOK42V4FXgrQV2YehixSmFWHnay3WvNUg11IOMsEPPvKYiVp4xXOD6AepwBkDO1PsHTBWFsne0l2C9pcpF2i27vb//4Lh/RM1EzB+5X5WTjog2N6wJx0OmIreht52DYAt0etPvpCOxr41rinsY0oK1ygNaVICOurBgYU96onHSidl/FyDMnb/3Y=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(46966005)(44832011)(7636003)(478600001)(2616005)(8676002)(426003)(54906003)(9786002)(30864003)(6666004)(110136005)(336012)(26005)(36906005)(356005)(82310400003)(316002)(186003)(7696005)(107886003)(2906002)(70586007)(70206006)(8936002)(47076004)(36756003)(82740400003)(5660300002)(83380400001)(4326008)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 17:12:52.9127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f5eac8-e18c-48a9-c915-08d8872e30ca
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT019.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6498
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adds interrupt support to the Xilinx GPIO driver so that rising and
falling edge line events can be supported. Since interrupt support is
an optional feature in the Xilinx IP, the driver continues to support
devices which have no interrupt provided.

Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
Chnages in V3:
-Created separate patch for Clock changes and runtime resume
 and suspend.
-Updated minor review comments.

Changes in V2:
-Added check for return value of platform_get_irq() API.
-Updated code to support rising edge and falling edge.
-Added xgpio_xlate() API to support switch.
-Added MAINTAINERS fragment
---
 drivers/gpio/Kconfig       |   2 +
 drivers/gpio/gpio-xilinx.c | 242 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 240 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5d4de5cd6759..cf4959891eab 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -677,6 +677,8 @@ config GPIO_XGENE_SB
 
 config GPIO_XILINX
 	tristate "Xilinx GPIO support"
+	select GPIOLIB_IRQCHIP
+	depends on OF_GPIO
 	help
 	  Say yes here to support the Xilinx FPGA GPIO device
 
diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 69bdf1910215..855550a06ded 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -10,9 +10,12 @@
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
 #include <linux/init.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/of_gpio.h>
 #include <linux/of_platform.h>
 #include <linux/slab.h>
 
@@ -22,6 +25,11 @@
 
 #define XGPIO_CHANNEL_OFFSET	0x8
 
+#define XGPIO_GIER_OFFSET	0x11c /* Global Interrupt Enable */
+#define XGPIO_GIER_IE		BIT(31)
+#define XGPIO_IPISR_OFFSET	0x120 /* IP Interrupt Status */
+#define XGPIO_IPIER_OFFSET	0x128 /* IP Interrupt Enable */
+
 /* Read/Write access to the GPIO registers */
 #if defined(CONFIG_ARCH_ZYNQ) || defined(CONFIG_X86)
 # define xgpio_readreg(offset)		readl(offset)
@@ -36,9 +44,14 @@
  * @gc: GPIO chip
  * @regs: register block
  * @gpio_width: GPIO width for every channel
- * @gpio_state: GPIO state shadow register
+ * @gpio_state: GPIO write state shadow register
+ * @gpio_last_irq_read: GPIO read state register from last interrupt
  * @gpio_dir: GPIO direction shadow register
  * @gpio_lock: Lock used for synchronization
+ * @irq: IRQ used by GPIO device
+ * @irq_enable: GPIO IRQ enable/disable bitfield
+ * @irq_rising_edge: GPIO IRQ rising edge enable/disable bitfield
+ * @irq_falling_edge: GPIO IRQ falling edge enable/disable bitfield
  * @clk: clock resource for this driver
  */
 struct xgpio_instance {
@@ -46,8 +59,13 @@ struct xgpio_instance {
 	void __iomem *regs;
 	unsigned int gpio_width[2];
 	u32 gpio_state[2];
+	u32 gpio_last_irq_read[2];
 	u32 gpio_dir[2];
 	spinlock_t gpio_lock;	/* For serializing operations */
+	int irq;
+	u32 irq_enable[2];
+	u32 irq_rising_edge[2];
+	u32 irq_falling_edge[2];
 	struct clk *clk;
 };
 
@@ -258,6 +276,183 @@ static void xgpio_save_regs(struct xgpio_instance *chip)
 }
 
 /**
+ * xgpio_irq_ack - Acknowledge a child GPIO interrupt.
+ * @irq_data: per IRQ and chip data passed down to chip functions
+ * This currently does nothing, but irq_ack is unconditionally called by
+ * handle_edge_irq and therefore must be defined.
+ */
+static void xgpio_irq_ack(struct irq_data *irq_data)
+{
+}
+
+/**
+ * xgpio_irq_mask - Write the specified signal of the GPIO device.
+ * @irq_data: per IRQ and chip data passed down to chip functions
+ */
+static void xgpio_irq_mask(struct irq_data *irq_data)
+{
+	unsigned long flags;
+	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
+	int irq_offset = irqd_to_hwirq(irq_data);
+	int index = xgpio_index(chip, irq_offset);
+	int offset = xgpio_offset(chip, irq_offset);
+
+	spin_lock_irqsave(&chip->gpio_lock, flags);
+
+	chip->irq_enable[index] &= ~BIT(offset);
+
+	if (!chip->irq_enable[index]) {
+		/* Disable per channel interrupt */
+		u32 temp = xgpio_readreg(chip->regs + XGPIO_IPIER_OFFSET);
+
+		temp &= ~BIT(index);
+		xgpio_writereg(chip->regs + XGPIO_IPIER_OFFSET, temp);
+	}
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+}
+
+/**
+ * xgpio_irq_unmask - Write the specified signal of the GPIO device.
+ * @irq_data: per IRQ and chip data passed down to chip functions
+ */
+static void xgpio_irq_unmask(struct irq_data *irq_data)
+{
+	unsigned long flags;
+	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
+	int irq_offset = irqd_to_hwirq(irq_data);
+	int index = xgpio_index(chip, irq_offset);
+	int offset = xgpio_offset(chip, irq_offset);
+	u32 old_enable = chip->irq_enable[index];
+
+	spin_lock_irqsave(&chip->gpio_lock, flags);
+
+	chip->irq_enable[index] |= BIT(offset);
+
+	if (!old_enable) {
+		/* Clear any existing per-channel interrupts */
+		u32 val = xgpio_readreg(chip->regs + XGPIO_IPISR_OFFSET) &
+			BIT(index);
+
+		if (val)
+			xgpio_writereg(chip->regs + XGPIO_IPISR_OFFSET, val);
+
+		/* Update GPIO IRQ read data before enabling interrupt*/
+		val = xgpio_readreg(chip->regs + XGPIO_DATA_OFFSET +
+				    index * XGPIO_CHANNEL_OFFSET);
+		chip->gpio_last_irq_read[index] = val;
+
+		/* Enable per channel interrupt */
+		val = xgpio_readreg(chip->regs + XGPIO_IPIER_OFFSET);
+		val |= BIT(index);
+		xgpio_writereg(chip->regs + XGPIO_IPIER_OFFSET, val);
+	}
+
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+}
+
+/**
+ * xgpio_set_irq_type - Write the specified signal of the GPIO device.
+ * @irq_data: Per IRQ and chip data passed down to chip functions
+ * @type: Interrupt type that is to be set for the gpio pin
+ *
+ * Return:
+ * 0 if interrupt type is supported otherwise -EINVAL
+ */
+static int xgpio_set_irq_type(struct irq_data *irq_data, unsigned int type)
+{
+	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
+	int irq_offset = irqd_to_hwirq(irq_data);
+	int index = xgpio_index(chip, irq_offset);
+	int offset = xgpio_offset(chip, irq_offset);
+
+	/*
+	 * The Xilinx GPIO hardware provides a single interrupt status
+	 * indication for any state change in a given GPIO channel (bank).
+	 * Therefore, only rising edge or falling edge triggers are
+	 * supported.
+	 */
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_BOTH:
+		chip->irq_rising_edge[index] |= BIT(offset);
+		chip->irq_falling_edge[index] |= BIT(offset);
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		chip->irq_rising_edge[index] |= BIT(offset);
+		chip->irq_falling_edge[index] &= ~BIT(offset);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		chip->irq_rising_edge[index] &= ~BIT(offset);
+		chip->irq_falling_edge[index] |= BIT(offset);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	irq_set_handler_locked(irq_data, handle_edge_irq);
+	return 0;
+}
+
+static struct irq_chip xgpio_irqchip = {
+	.name		= "gpio-xilinx",
+	.irq_ack	= xgpio_irq_ack,
+	.irq_mask	= xgpio_irq_mask,
+	.irq_unmask	= xgpio_irq_unmask,
+	.irq_set_type	= xgpio_set_irq_type,
+};
+
+/**
+ * xgpio_irqhandler - Gpio interrupt service routine
+ * @desc: Pointer to interrupt description
+ */
+static void xgpio_irqhandler(struct irq_desc *desc)
+{
+	struct xgpio_instance *chip = irq_desc_get_handler_data(desc);
+	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	u32 num_channels = chip->gpio_width[1] ? 2 : 1;
+	u32 offset = 0, index;
+	u32 status = xgpio_readreg(chip->regs + XGPIO_IPISR_OFFSET);
+
+	xgpio_writereg(chip->regs + XGPIO_IPISR_OFFSET, status);
+
+	chained_irq_enter(irqchip, desc);
+	for (index = 0; index < num_channels; index++) {
+		if ((status & BIT(index))) {
+			unsigned long rising_events, falling_events, all_events;
+			unsigned long flags;
+			u32 data, bit;
+			unsigned int irq;
+
+			spin_lock_irqsave(&chip->gpio_lock, flags);
+			data = xgpio_readreg(chip->regs + XGPIO_DATA_OFFSET +
+					     index * XGPIO_CHANNEL_OFFSET);
+			rising_events = data &
+					~chip->gpio_last_irq_read[index] &
+					chip->irq_enable[index] &
+					chip->irq_rising_edge[index];
+			falling_events = ~data &
+					 chip->gpio_last_irq_read[index] &
+					 chip->irq_enable[index] &
+					 chip->irq_falling_edge[index];
+			dev_dbg(chip->gc.parent,
+				"IRQ chan %u rising 0x%lx falling 0x%lx\n",
+				index, rising_events, falling_events);
+			all_events = rising_events | falling_events;
+			chip->gpio_last_irq_read[index] = data;
+			spin_unlock_irqrestore(&chip->gpio_lock, flags);
+
+			for_each_set_bit(bit, &all_events, 32) {
+				irq = irq_find_mapping(chip->gc.irq.domain,
+						       offset + bit);
+				generic_handle_irq(irq);
+			}
+		}
+		offset += chip->gpio_width[index];
+	}
+
+	chained_irq_exit(irqchip, desc);
+}
+
+/**
  * xgpio_of_probe - Probe method for the GPIO device.
  * @pdev: pointer to the platform device
  *
@@ -270,7 +465,10 @@ static int xgpio_probe(struct platform_device *pdev)
 	struct xgpio_instance *chip;
 	int status = 0;
 	struct device_node *np = pdev->dev.of_node;
-	u32 is_dual;
+	u32 is_dual = 0;
+	u32 cells = 2;
+	struct gpio_irq_chip *girq;
+	u32 temp;
 
 	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
@@ -285,6 +483,10 @@ static int xgpio_probe(struct platform_device *pdev)
 	if (of_property_read_u32(np, "xlnx,tri-default", &chip->gpio_dir[0]))
 		chip->gpio_dir[0] = 0xFFFFFFFF;
 
+	/* Update cells with gpio-cells value */
+	if (of_property_read_u32(np, "#gpio-cells", &cells))
+		dev_dbg(&pdev->dev, "Missing gpio-cells property\n");
+
 	/*
 	 * Check device node and parent device node for device width
 	 * and assume default width of 32
@@ -321,6 +523,7 @@ static int xgpio_probe(struct platform_device *pdev)
 	chip->gc.parent = &pdev->dev;
 	chip->gc.direction_input = xgpio_dir_in;
 	chip->gc.direction_output = xgpio_dir_out;
+	chip->gc.of_gpio_n_cells = cells;
 	chip->gc.get = xgpio_get;
 	chip->gc.set = xgpio_set;
 	chip->gc.set_multiple = xgpio_set_multiple;
@@ -348,14 +551,45 @@ static int xgpio_probe(struct platform_device *pdev)
 
 	xgpio_save_regs(chip);
 
+	chip->irq = platform_get_irq_optional(pdev, 0);
+	if (chip->irq <= 0)
+		goto skip_irq;
+
+	/* Disable per-channel interrupts */
+	xgpio_writereg(chip->regs + XGPIO_IPIER_OFFSET, 0);
+	/* Clear any existing per-channel interrupts */
+	temp = xgpio_readreg(chip->regs + XGPIO_IPISR_OFFSET);
+	xgpio_writereg(chip->regs + XGPIO_IPISR_OFFSET, temp);
+	/* Enable global interrupts */
+	xgpio_writereg(chip->regs + XGPIO_GIER_OFFSET, XGPIO_GIER_IE);
+
+	girq = &chip->gc.irq;
+	girq->chip = &xgpio_irqchip;
+	girq->parent_handler = xgpio_irqhandler;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(&pdev->dev, 1,
+				     sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents) {
+		status = -ENOMEM;
+		goto err_unprepare_clk;
+	}
+	girq->parents[0] = chip->irq;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_bad_irq;
+
+skip_irq:
 	status = devm_gpiochip_add_data(&pdev->dev, &chip->gc, chip);
 	if (status) {
 		dev_err(&pdev->dev, "failed to add GPIO chip\n");
-		clk_disable_unprepare(chip->clk);
-		return status;
+		goto err_unprepare_clk;
 	}
 
 	return 0;
+
+err_unprepare_clk:
+	clk_disable_unprepare(chip->clk);
+	return status;
 }
 
 static const struct of_device_id xgpio_of_match[] = {
-- 
2.7.4

