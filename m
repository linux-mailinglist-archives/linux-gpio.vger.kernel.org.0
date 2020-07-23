Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F45122B0F8
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 16:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729072AbgGWOG1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 10:06:27 -0400
Received: from mail-dm6nam10on2088.outbound.protection.outlook.com ([40.107.93.88]:22640
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727111AbgGWOGX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Jul 2020 10:06:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YVAuYZ8vFfHXWMxKULlBCqNZW6nFEE4suluA0fRuj6bQGnQg+jiXzGXq3oIRFFnozY8zRadF40ZV7c+ms+uP/Vv4rEUdqX6IdafO7hOfLqZu5UEGktjE195JlCmwm5kSS+wCJ7pPwUaE3TFaB5kGnHEoTLRcquHMg1RLaY16Z4qsC9OxI1ww0xDqf798ATYeiNs3tMQ9MIXFF6eIjbNky+X3TnxA+cPM17w0Tx7ehx2xAwr+jbIpuKXNusZeV+K3FquSFFI+jRkDTvYJ65mgMbv22GKw+qu9YORIpSS5ChhCi/st6FtlIEpMsUgL/sXLq+Vnb2D1HX1ARWk92vgxTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26BrNPLQDVRxPyqG4SbXzSjiLN/MzxCXQ6FN/JNp2WU=;
 b=kFBuKhOmIEwh2EibEtvHYXVaQAFu35hrrLKTkoUH7XMPyRpNko80AZF7PTQo635JdnOOShpp1s26spxGrtXCLWR0UQO34Th1DctZ672210cYgt2ESFPVX+YHZ9MQI1qJwqhpuKfkm3ZuUpl+g/VNHl4fr40bqo3/WSMrIvdQ0U6GEWfVfjkjhknWrZWfirx1B5/DZdJhi7Adaq3NmyA54cVMvgllCJxKOkiO3ENLsT3aOA2spjAYd4qGZnhmGPy2W0roJQwdtTG43uHYVK3kFAh74rdx5CTtrm4FZJwmZtLK4GTzpYQq7AY58u5n32Ygnt1aKHpCLNMoNqYi7mC7Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26BrNPLQDVRxPyqG4SbXzSjiLN/MzxCXQ6FN/JNp2WU=;
 b=qIBll1AE0FcYbWZPf4yA4faFhDT5KR1j9wZZsIYfYij6SYEEcJDmUUrua6jNaDIi3Spo6Js+REQ3u34GM5PPyeigQp8+T6WB41EfC6NYBfJUQ3TOinrUsop9Er1D5Nj/NnYLds8kUerWDiGEH5cw/RRXn+IhS7ojQY/Rv3t4rjE=
Received: from CY4PR19CA0037.namprd19.prod.outlook.com (2603:10b6:903:103::23)
 by SN6PR02MB4382.namprd02.prod.outlook.com (2603:10b6:805:aa::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Thu, 23 Jul
 2020 14:06:19 +0000
Received: from CY1NAM02FT055.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:103:cafe::ec) by CY4PR19CA0037.outlook.office365.com
 (2603:10b6:903:103::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend
 Transport; Thu, 23 Jul 2020 14:06:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT055.mail.protection.outlook.com (10.152.74.80) with Microsoft SMTP
 Server id 15.20.3216.10 via Frontend Transport; Thu, 23 Jul 2020 14:06:19
 +0000
Received: from [149.199.38.66] (port=56799 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1jybpg-0004H3-Q4; Thu, 23 Jul 2020 07:04:24 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1jybrW-0005RQ-QC; Thu, 23 Jul 2020 07:06:18 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 06NE6HS0004468;
        Thu, 23 Jul 2020 07:06:17 -0700
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1jybrU-0005Q2-Na; Thu, 23 Jul 2020 07:06:17 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com,
        sgoud@xilinx.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com
Subject: [PATCH V2 2/3] gpio: xilinx: Add interrupt support
Date:   Thu, 23 Jul 2020 19:36:07 +0530
Message-Id: <1595513168-11965-3-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595513168-11965-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1595513168-11965-1-git-send-email-srinivas.neeli@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a94913b7-25cb-4f84-357a-08d82f11926b
X-MS-TrafficTypeDiagnostic: SN6PR02MB4382:
X-Microsoft-Antispam-PRVS: <SN6PR02MB4382CA3C7FD5D528CC17BA70AF760@SN6PR02MB4382.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a11w/U+gDISswNY7sSl6X4qUeVnJ3KseCJnAqFfunzS9RbTjmWl6JdWzUEoNmrvBh17l25g3Efo5U4VIcdMqYQzSwHiAwN+iMWyLBCoQgVYTkY0Otx1VUA/0CmM23R2F9bg3V7MiWbJ2HEyR5Phqzg7TSxLeG/RWDp1Un4xhyrvPl2atVimtO2wvt4IusNajvj0DZ/q9jcNdepTiBiCnManSahof0uCxFdmj/PwNfYXYL2RRecITTkfS3Fv/m5tMKXm0DjE59fHDIWB7IxS6VMrGlVH/5Gm5WB3z5q3TvtzxxeQ8fPdezDjY6Q9HsK0CdkCW7qVWU7wr6KmSLcf4fe+og8JjayKW8/NL1EVdTgAVDOKdBsw2Zq06ojOMZiwYc8QqPDOeGntHMUnzLglM/Q==
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(136003)(346002)(39860400002)(396003)(376002)(46966005)(47076004)(316002)(44832011)(82740400003)(6666004)(2616005)(356005)(81166007)(478600001)(2906002)(30864003)(82310400002)(70206006)(5660300002)(426003)(70586007)(7696005)(6636002)(8936002)(8676002)(336012)(9786002)(107886003)(26005)(83380400001)(36756003)(186003)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 14:06:19.0304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a94913b7-25cb-4f84-357a-08d82f11926b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT055.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4382
Sender: linux-gpio-owner@vger.kernel.org
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
Changes in V2:
Updated code to support rising edge and falling edge.
Added xgpio_xlate() API to support gpio-keys.
Updated code to check return value of of_property_read_u32.
---
 drivers/gpio/Kconfig       |   1 +
 drivers/gpio/gpio-xilinx.c | 295 ++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 277 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 05e0801c6a78..239f8eb7a8eb 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -652,6 +652,7 @@ config GPIO_XGENE_SB
 
 config GPIO_XILINX
 	tristate "Xilinx GPIO support"
+	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support the Xilinx FPGA GPIO device
 
diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index d103613e787a..509606e92a1c 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -16,6 +16,9 @@
 #include <linux/slab.h>
 #include <linux/pm_runtime.h>
 #include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
 
 /* Register Offset Definitions */
 #define XGPIO_DATA_OFFSET   (0x0)	/* Data register  */
@@ -23,6 +26,11 @@
 
 #define XGPIO_CHANNEL_OFFSET	0x8
 
+#define XGPIO_GIER_OFFSET      0x11c /* Global Interrupt Enable */
+#define XGPIO_GIER_IE          BIT(31)
+#define XGPIO_IPISR_OFFSET     0x120 /* IP Interrupt Status */
+#define XGPIO_IPIER_OFFSET     0x128 /* IP Interrupt Enable */
+
 /* Read/Write access to the GPIO registers */
 #if defined(CONFIG_ARCH_ZYNQ) || defined(CONFIG_X86)
 # define xgpio_readreg(offset)		readl(offset)
@@ -37,9 +45,14 @@
  * @gc: GPIO chip
  * @regs: register block
  * @gpio_width: GPIO width for every channel
- * @gpio_state: GPIO state shadow register
+ * @gpio_state: GPIO write state shadow register
+ * @gpio_last_irq_read: GPIO read state register from last interrupt
  * @gpio_dir: GPIO direction shadow register
  * @gpio_lock: Lock used for synchronization
+ * @irq: IRQ used by GPIO device
+ * @irq_enable: GPIO irq enable/disable bitfield
+ * @irq_rising_edge: GPIO irq rising edge enable/disable bitfield
+ * @irq_falling_edge: GPIO irq falling edge enable/disable bitfield
  * @clk: clock resource for this driver
  */
 struct xgpio_instance {
@@ -47,8 +60,13 @@ struct xgpio_instance {
 	void __iomem *regs;
 	unsigned int gpio_width[2];
 	u32 gpio_state[2];
+	u32 gpio_last_irq_read[2];
 	u32 gpio_dir[2];
-	spinlock_t gpio_lock[2];	/* For serializing operations */
+	spinlock_t gpio_lock;	/* For serializing operations */
+	int irq;
+	u32 irq_enable[2];
+	u32 irq_rising_edge[2];
+	u32 irq_falling_edge[2];
 	struct clk *clk;
 };
 
@@ -114,7 +132,7 @@ static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	int index =  xgpio_index(chip, gpio);
 	int offset =  xgpio_offset(chip, gpio);
 
-	spin_lock_irqsave(&chip->gpio_lock[index], flags);
+	spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	/* Write to GPIO signal and set its direction to output */
 	if (val)
@@ -125,7 +143,7 @@ static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
 		       xgpio_regoffset(chip, gpio), chip->gpio_state[index]);
 
-	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
 }
 
 /**
@@ -145,7 +163,7 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 	int index = xgpio_index(chip, 0);
 	int offset, i;
 
-	spin_lock_irqsave(&chip->gpio_lock[index], flags);
+	spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	/* Write to GPIO signals */
 	for (i = 0; i < gc->ngpio; i++) {
@@ -156,9 +174,7 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 			xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
 				       index * XGPIO_CHANNEL_OFFSET,
 				       chip->gpio_state[index]);
-			spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
 			index =  xgpio_index(chip, i);
-			spin_lock_irqsave(&chip->gpio_lock[index], flags);
 		}
 		if (__test_and_clear_bit(i, mask)) {
 			offset =  xgpio_offset(chip, i);
@@ -172,7 +188,7 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
 		       index * XGPIO_CHANNEL_OFFSET, chip->gpio_state[index]);
 
-	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
 }
 
 /**
@@ -191,14 +207,14 @@ static int xgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 	int index =  xgpio_index(chip, gpio);
 	int offset =  xgpio_offset(chip, gpio);
 
-	spin_lock_irqsave(&chip->gpio_lock[index], flags);
+	spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	/* Set the GPIO bit in shadow register and set direction as input */
 	chip->gpio_dir[index] |= BIT(offset);
 	xgpio_writereg(chip->regs + XGPIO_TRI_OFFSET +
 		       xgpio_regoffset(chip, gpio), chip->gpio_dir[index]);
 
-	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
 
 	return 0;
 }
@@ -222,7 +238,7 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	int index =  xgpio_index(chip, gpio);
 	int offset =  xgpio_offset(chip, gpio);
 
-	spin_lock_irqsave(&chip->gpio_lock[index], flags);
+	spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	/* Write state of GPIO signal */
 	if (val)
@@ -237,7 +253,7 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	xgpio_writereg(chip->regs + XGPIO_TRI_OFFSET +
 			xgpio_regoffset(chip, gpio), chip->gpio_dir[index]);
 
-	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
 
 	return 0;
 }
@@ -294,6 +310,45 @@ static int __maybe_unused xgpio_suspend(struct device *dev)
 	return 0;
 }
 
+/**
+ * xgpio_xlate - Translate gpio_spec to the GPIO number and flags
+ * @gc: Pointer to gpio_chip device structure.
+ * @gpiospec:  gpio specifier as found in the device tree
+ * @flags: A flags pointer based on binding
+ *
+ * Return:
+ * irq number otherwise -EINVAL
+ */
+static int xgpio_xlate(struct gpio_chip *gc,
+		       const struct of_phandle_args *gpiospec, u32 *flags)
+{
+	if (gc->of_gpio_n_cells < 2) {
+		WARN_ON(1);
+		return -EINVAL;
+	}
+
+	if (WARN_ON(gpiospec->args_count < gc->of_gpio_n_cells))
+		return -EINVAL;
+
+	if (gpiospec->args[0] >= gc->ngpio)
+		return -EINVAL;
+
+	if (flags)
+		*flags = gpiospec->args[1];
+
+	return gpiospec->args[0];
+}
+
+/**
+ * xgpio_irq_ack - Acknowledge a child GPIO interrupt.
+ * This currently does nothing, but irq_ack is unconditionally called by
+ * handle_edge_irq and therefore must be defined.
+ * @irq_data: per irq and chip data passed down to chip functions
+ */
+static void xgpio_irq_ack(struct irq_data *irq_data)
+{
+}
+
 static int __maybe_unused xgpio_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -338,6 +393,176 @@ static const struct dev_pm_ops xgpio_dev_pm_ops = {
 };
 
 /**
+ * xgpio_irq_mask - Write the specified signal of the GPIO device.
+ * @irq_data: per irq and chip data passed down to chip functions
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
+	dev_dbg(chip->gc.parent, "Disable %d irq, irq_enable_mask 0x%x\n",
+		irq_offset, chip->irq_enable[index]);
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
+ * @irq_data: per irq and chip data passed down to chip functions
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
+	dev_dbg(chip->gc.parent, "Enable %d irq, irq_enable_mask 0x%x\n",
+		irq_offset, chip->irq_enable[index]);
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
+ * @irq_data: Per irq and chip data passed down to chip functions
+ * @type: Interrupt type that is to be set for the gpio pin
+ *
+ * Return:
+ * 0 if interrupt type is supported otherwise otherwise -EINVAL
+ */
+static int xgpio_set_irq_type(struct irq_data *irq_data, unsigned int type)
+{
+	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
+	int irq_offset = irqd_to_hwirq(irq_data);
+	int index = xgpio_index(chip, irq_offset);
+	int offset = xgpio_offset(chip, irq_offset);
+
+	/* The Xilinx GPIO hardware provides a single interrupt status
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
+	.name           = "gpio-xilinx",
+	.irq_ack	= xgpio_irq_ack,
+	.irq_mask       = xgpio_irq_mask,
+	.irq_unmask     = xgpio_irq_unmask,
+	.irq_set_type   = xgpio_set_irq_type,
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
+				generic_handle_irq(irq_find_mapping
+					(chip->gc.irq.domain, offset + bit));
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
@@ -350,7 +575,8 @@ static int xgpio_probe(struct platform_device *pdev)
 	struct xgpio_instance *chip;
 	int status = 0;
 	struct device_node *np = pdev->dev.of_node;
-	u32 is_dual;
+	u32 is_dual = 0;
+	u32 cells = 2;
 
 	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
@@ -359,12 +585,18 @@ static int xgpio_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, chip);
 
 	/* Update GPIO state shadow register with default value */
-	of_property_read_u32(np, "xlnx,dout-default", &chip->gpio_state[0]);
+	if (of_property_read_u32(np, "xlnx,dout-default",
+				 &chip->gpio_state[0]))
+		dev_info(&pdev->dev, "Missing xlnx,dout-default property\n");
 
 	/* Update GPIO direction shadow register with default value */
 	if (of_property_read_u32(np, "xlnx,tri-default", &chip->gpio_dir[0]))
 		chip->gpio_dir[0] = 0xFFFFFFFF;
 
+	/* Update cells with gpio-cells value */
+	if (of_property_read_u32(np, "#gpio-cells", &cells))
+		dev_info(&pdev->dev, "Missing gpio-cells property\n");
+
 	/*
 	 * Check device node and parent device node for device width
 	 * and assume default width of 32
@@ -372,15 +604,17 @@ static int xgpio_probe(struct platform_device *pdev)
 	if (of_property_read_u32(np, "xlnx,gpio-width", &chip->gpio_width[0]))
 		chip->gpio_width[0] = 32;
 
-	spin_lock_init(&chip->gpio_lock[0]);
+	spin_lock_init(&chip->gpio_lock);
 
 	if (of_property_read_u32(np, "xlnx,is-dual", &is_dual))
 		is_dual = 0;
 
 	if (is_dual) {
 		/* Update GPIO state shadow register with default value */
-		of_property_read_u32(np, "xlnx,dout-default-2",
-				     &chip->gpio_state[1]);
+		if (of_property_read_u32(np, "xlnx,dout-default-2",
+					 &chip->gpio_state[1]))
+			dev_info(&pdev->dev,
+				 "Missing xlnx,dout-default-2 property\n");
 
 		/* Update GPIO direction shadow register with default value */
 		if (of_property_read_u32(np, "xlnx,tri-default-2",
@@ -394,8 +628,6 @@ static int xgpio_probe(struct platform_device *pdev)
 		if (of_property_read_u32(np, "xlnx,gpio2-width",
 					 &chip->gpio_width[1]))
 			chip->gpio_width[1] = 32;
-
-		spin_lock_init(&chip->gpio_lock[1]);
 	}
 
 	chip->gc.base = -1;
@@ -403,6 +635,8 @@ static int xgpio_probe(struct platform_device *pdev)
 	chip->gc.parent = &pdev->dev;
 	chip->gc.direction_input = xgpio_dir_in;
 	chip->gc.direction_output = xgpio_dir_out;
+	chip->gc.of_gpio_n_cells = cells;
+	chip->gc.of_xlate = xgpio_xlate;
 	chip->gc.get = xgpio_get;
 	chip->gc.set = xgpio_set;
 	chip->gc.request = xgpio_request;
@@ -435,6 +669,29 @@ static int xgpio_probe(struct platform_device *pdev)
 
 	xgpio_save_regs(chip);
 
+	chip->irq = platform_get_irq_optional(pdev, 0);
+	if (chip->irq <= 0) {
+		dev_info(&pdev->dev, "GPIO IRQ not set\n");
+	} else {
+		u32 temp;
+
+		/* Disable per-channel interrupts */
+		xgpio_writereg(chip->regs + XGPIO_IPIER_OFFSET, 0);
+		/* Clear any existing per-channel interrupts */
+		temp = xgpio_readreg(chip->regs + XGPIO_IPISR_OFFSET);
+		xgpio_writereg(chip->regs + XGPIO_IPISR_OFFSET, temp);
+		/* Enable global interrupts */
+		xgpio_writereg(chip->regs + XGPIO_GIER_OFFSET, XGPIO_GIER_IE);
+
+		chip->gc.irq.chip = &xgpio_irqchip;
+		chip->gc.irq.handler = handle_bad_irq;
+		chip->gc.irq.default_type = IRQ_TYPE_NONE;
+		chip->gc.irq.parent_handler = xgpio_irqhandler;
+		chip->gc.irq.parent_handler_data = chip;
+		chip->gc.irq.parents = (unsigned int *)&chip->irq;
+		chip->gc.irq.num_parents = 1;
+	}
+
 	status = devm_gpiochip_add_data(&pdev->dev, &chip->gc, chip);
 	if (status) {
 		dev_err(&pdev->dev, "failed to add GPIO chip\n");
-- 
2.7.4

