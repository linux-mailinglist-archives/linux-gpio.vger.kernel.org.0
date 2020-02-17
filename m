Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8CA16107B
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2020 11:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbgBQK5n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Feb 2020 05:57:43 -0500
Received: from mail-bn8nam12on2082.outbound.protection.outlook.com ([40.107.237.82]:31841
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728482AbgBQK5m (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 Feb 2020 05:57:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Usm1AVzAUtILIL4Pl8FS/YMIMW7cOZ3oEAxBZJuvscHZSX2fvdPkeBqmEE47xDgtxNw+k2MRV/v+CKTn14d+D82Va/aVZyicMAK2ejeaVOCVaLT/+n+ZHJoOuu0sUxcoy/stdO77y+EHpvZmWyZNbxScLFWMoFlQdAhPmIpaZOVKCaZDxvfUgWdfSkK5cmcVPtVPHWRR5JU3bVjhyFbNTifGCjUm4wlUvXYNQliToX7accGbxn7XfoQeGqO4vZZd50gYxbrom+7PNGNeNzqVVyDfLTLmmel7Vp/JlhRuv6bOVK246+CFWzsLAAzY83bfQrhA2IsMhhCx2W/CaxgwPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rK9Xx0KNeikiAV719Gt1x1s9zPkk9K1i8A40AQCs03c=;
 b=IVaOYZn6G41O9RnstPCC6qhG4pPY3XkAMtTQd1gYFQoK4uUKY/XKGVxRRiQEPfbiVU3dW5INKZve7nSvHvFVpVqGGGCTt4BlzgNV5bCDi+x/iuOJcWPpCslq0c1CrmmHGlcegE8dIsFz3bqX6R97ubhG1DeJQYs1hNxQem0m+l1HJ8XVu6ttU/BurOYic+45cQYGpxSCynH3tmzdyTpaqYL+NI53QFj+kx8yFycUKv5iweMXlsXkkJnqDMxk3xTuUxUspJ9yxV+hwxSLhX2RIU1xkDfvFDhSf0sxA4zCtAaUSaHDwln0Vg5tEDzBlhpo/je12gKPpaNM22mVxKcyrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rK9Xx0KNeikiAV719Gt1x1s9zPkk9K1i8A40AQCs03c=;
 b=AnrJDGXRROZdiCmVJFNHWVWAz8YtGj6VSAnaqrrLiJx2cKz/6n8DQNlpRyXf9Cv+zK519PbMz169TUTl80/mJn1c/5YNkamEloWkVygbxAGsyZxw3u7AYpkzbUlHQwvMSpWf0dGDQC/KfXTbpaxJbhiF5eyNexNlr2UMli1efO4=
Received: from SN4PR0201CA0048.namprd02.prod.outlook.com
 (2603:10b6:803:2e::34) by SN6PR02MB5389.namprd02.prod.outlook.com
 (2603:10b6:805:e1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25; Mon, 17 Feb
 2020 10:57:35 +0000
Received: from BL2NAM02FT051.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::209) by SN4PR0201CA0048.outlook.office365.com
 (2603:10b6:803:2e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25 via Frontend
 Transport; Mon, 17 Feb 2020 10:57:35 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT051.mail.protection.outlook.com (10.152.76.181) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2729.22
 via Frontend Transport; Mon, 17 Feb 2020 10:57:35 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j3e5m-0007sL-Np; Mon, 17 Feb 2020 02:57:34 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j3e5h-0000pT-KZ; Mon, 17 Feb 2020 02:57:29 -0800
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 01HAvPbx009867;
        Mon, 17 Feb 2020 02:57:25 -0800
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j3e5c-0000oP-PD; Mon, 17 Feb 2020 02:57:25 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     bgolaszewski@baylibre.com, michal.simek@xilinx.com,
        shubhrajyoti.datta@xilinx.com, sgoud@xilinx.com
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        git@xilinx.com
Subject: [PATCH 2/2] gpio: xilinx: Add irq support to the driver
Date:   Mon, 17 Feb 2020 16:27:19 +0530
Message-Id: <1581937039-12964-2-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581937039-12964-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1581937039-12964-1-git-send-email-srinivas.neeli@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(199004)(189003)(6636002)(107886003)(4326008)(9786002)(7696005)(2616005)(44832011)(36756003)(5660300002)(26005)(8936002)(316002)(426003)(186003)(356004)(70206006)(478600001)(81166006)(8676002)(81156014)(70586007)(336012)(2906002)(6666004);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR02MB5389;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0cd010e-cd70-4b3d-0d9b-08d7b3983242
X-MS-TrafficTypeDiagnostic: SN6PR02MB5389:
X-Microsoft-Antispam-PRVS: <SN6PR02MB5389B1ADDDA4FF5B3652C4F9AF160@SN6PR02MB5389.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-Forefront-PRVS: 0316567485
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4ryFegQsTCPzv7ZqckdE+rom0r+iKPXlbiSYbDIK5zkErfjFzlgzJ4qCYnjVBwbqoc8zXf3UWVjcNXX6rbUmSG+G+CzymaVXv09jEB7cI3W0CupuG6E5oH/Y17EWYIWE7Esb2hYYRRJFH8xJRXJA/GKEBs7cp74pryZpoCYAlRvsNJTgWGSpq8X3dKD2yH2E4mGmwdIKMDxTqg02H3k6E/pL4GGWkMseDv2f/FaiiGyEnrSA0m3zg0XnD8pMKFUGw1K9jOo8xSXnU11xJ7TMa672vDU70OmanAeBkUwi7GY0ktZ0rk6U5VW+HBESTXHYRdLicAoNoMzBHFqBiDbe9qMLkKFplL27FtfD7bH/rl0wob4gnUx4s6T154OLxnczwWZZGl4YqpKfRDXG/TnSyFx/YxwHGc+93lfQpY+QoXEPLq3gq7d7S1D7GXEmS1vN
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2020 10:57:35.3002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0cd010e-cd70-4b3d-0d9b-08d7b3983242
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5389
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allocate single chip for both channels.
Add irq support to the driver.
Supporting rising edge interrupts and in cascade mode supporting
first channel for interrupts on 32bit machines.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
 drivers/gpio/gpio-xilinx.c | 233 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 232 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 26753ae58295..f6dd316b2c62 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -16,6 +16,11 @@
 #include <linux/slab.h>
 #include <linux/pm_runtime.h>
 #include <linux/clk.h>
+#include <linux/of_irq.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
 
 /* Register Offset Definitions */
 #define XGPIO_DATA_OFFSET   (0x0)	/* Data register  */
@@ -23,8 +28,13 @@
 
 #define XGPIO_CHANNEL_OFFSET	0x8
 
+#define XGPIO_GIER_OFFSET      0x11c /* Global Interrupt Enable */
+#define XGPIO_GIER_IE          BIT(31)
+#define XGPIO_IPISR_OFFSET     0x120 /* IP Interrupt Status */
+#define XGPIO_IPIER_OFFSET     0x128 /* IP Interrupt Enable */
+
 /* Read/Write access to the GPIO registers */
-#if defined(CONFIG_ARCH_ZYNQ) || defined(CONFIG_X86)
+#if defined(CONFIG_ARCH_ZYNQ) || defined(CONFIG_X86) || defined(CONFIG_ARM64)
 # define xgpio_readreg(offset)		readl(offset)
 # define xgpio_writereg(offset, val)	writel(val, offset)
 #else
@@ -41,7 +51,11 @@
  * @gpio_dir: GPIO direction shadow register
  * @gpio_lock: Lock used for synchronization
  * @clk: clock resource for this driver
+ * @irq_base: GPIO channel irq base address
+ * @irq_enable: GPIO irq enable/disable bitfield
+ * @irq_domain: irq_domain of the controller
  */
+
 struct xgpio_instance {
 	struct gpio_chip gc;
 	void __iomem *regs;
@@ -50,6 +64,9 @@ struct xgpio_instance {
 	u32 gpio_dir[2];
 	spinlock_t gpio_lock[2];	/* For serializing operations */
 	struct clk *clk;
+	int irq_base;
+	u32 irq_enable;
+	struct irq_domain *irq_domain;
 };
 
 static inline int xgpio_index(struct xgpio_instance *chip, int gpio)
@@ -324,6 +341,211 @@ static const struct dev_pm_ops xgpio_dev_pm_ops = {
 };
 
 /**
+ * xgpiops_irq_mask - Write the specified signal of the GPIO device.
+ * @irq_data: per irq and chip data passed down to chip functions
+ */
+static void xgpio_irq_mask(struct irq_data *irq_data)
+{
+	unsigned long flags;
+	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
+	u32 offset = irq_data->irq - chip->irq_base;
+	u32 temp;
+	s32 val;
+	int index = xgpio_index(chip, 0);
+
+	pr_debug("%s: Disable %d irq, irq_enable_mask 0x%x\n",
+		 __func__, offset, chip->irq_enable);
+
+	spin_lock_irqsave(&chip->gpio_lock[index], flags);
+
+	chip->irq_enable &= ~BIT(offset);
+
+	if (!chip->irq_enable) {
+		/* Enable per channel interrupt */
+		temp = xgpio_readreg(chip->regs + XGPIO_IPIER_OFFSET);
+		val = offset - chip->gpio_width[0] + 1;
+		if (val > 0)
+			temp &= 1;
+		else
+			temp &= 2;
+		xgpio_writereg(chip->regs + XGPIO_IPIER_OFFSET, temp);
+
+		/* Disable global interrupt if channel interrupts are unused */
+		temp = xgpio_readreg(chip->regs + XGPIO_IPIER_OFFSET);
+		if (!temp)
+			xgpio_writereg(chip->regs + XGPIO_GIER_OFFSET,
+				       ~XGPIO_GIER_IE);
+	}
+	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
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
+	u32 offset = irq_data->irq - chip->irq_base;
+	u32 temp;
+	s32 val;
+	int index = xgpio_index(chip, 0);
+
+	pr_debug("%s: Enable %d irq, irq_enable_mask 0x%x\n",
+		 __func__, offset, chip->irq_enable);
+
+	/* Setup pin as input */
+	xgpio_dir_in(&chip->gc, offset);
+
+	spin_lock_irqsave(&chip->gpio_lock[index], flags);
+
+	chip->irq_enable |= BIT(offset);
+
+	if (chip->irq_enable) {
+		/* Enable per channel interrupt */
+		temp = xgpio_readreg(chip->regs + XGPIO_IPIER_OFFSET);
+		val = offset - (chip->gpio_width[0] - 1);
+		if (val > 0)
+			temp |= 2;
+		else
+			temp |= 1;
+		xgpio_writereg(chip->regs + XGPIO_IPIER_OFFSET, temp);
+
+		/* Enable global interrupts */
+		xgpio_writereg(chip->regs + XGPIO_GIER_OFFSET, XGPIO_GIER_IE);
+	}
+
+	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
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
+	/* Only rising edge case is supported now */
+	if (type & IRQ_TYPE_EDGE_RISING)
+		return 0;
+
+	return -EINVAL;
+}
+
+/* irq chip descriptor */
+static struct irq_chip xgpio_irqchip = {
+	.name           = "xgpio",
+	.irq_mask       = xgpio_irq_mask,
+	.irq_unmask     = xgpio_irq_unmask,
+	.irq_set_type   = xgpio_set_irq_type,
+};
+
+/**
+ * xgpio_to_irq - Find out gpio to Linux irq mapping
+ * @gc: Pointer to gpio_chip device structure.
+ * @offset: Gpio pin offset
+ *
+ * Return:
+ * irq number otherwise -EINVAL
+ */
+static int xgpio_to_irq(struct gpio_chip *gc, unsigned int offset)
+{
+	struct xgpio_instance *chip = gpiochip_get_data(gc);
+
+	return irq_find_mapping(chip->irq_domain, offset);
+}
+
+/**
+ * xgpio_irqhandler - Gpio interrupt service routine
+ * @desc: Pointer to interrupt description
+ */
+static void xgpio_irqhandler(struct irq_desc *desc)
+{
+	unsigned int irq = irq_desc_get_irq(desc);
+	struct xgpio_instance *chip = (struct xgpio_instance *)
+		irq_get_handler_data(irq);
+	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	u32 offset, status, channel = 1;
+	unsigned long val;
+
+	chained_irq_enter(irqchip, desc);
+
+	val = xgpio_readreg(chip->regs);
+	if (!val) {
+		channel = 2;
+		val = xgpio_readreg(chip->regs + XGPIO_CHANNEL_OFFSET);
+		val = val << chip->gpio_width[0];
+	}
+
+	/* Only rising edge is supported */
+	val &= chip->irq_enable;
+	for_each_set_bit(offset, &val, chip->gc.ngpio) {
+		generic_handle_irq(chip->irq_base + offset);
+	}
+
+	status = xgpio_readreg(chip->regs + XGPIO_IPISR_OFFSET);
+	xgpio_writereg(chip->regs + XGPIO_IPISR_OFFSET, channel);
+
+	chained_irq_exit(irqchip, desc);
+}
+
+static struct lock_class_key gpio_lock_class;
+static struct lock_class_key gpio_request_class;
+
+/**
+ * xgpio_irq_setup - Allocate irq for gpio and setup appropriate functions
+ * @np: Device node of the GPIO chip
+ * @chip: Pointer to private gpio channel structure
+ *
+ * Return:
+ * 0 if success, otherwise -1
+ */
+static int xgpio_irq_setup(struct device_node *np, struct xgpio_instance *chip)
+{
+	u32 pin_num;
+	struct resource res;
+	int ret = of_irq_to_resource(np, 0, &res);
+
+	if (ret <= 0) {
+		pr_info("GPIO IRQ not connected\n");
+		return 0;
+	}
+
+	chip->gc.to_irq = xgpio_to_irq;
+	chip->irq_base = irq_alloc_descs(-1, 0, chip->gc.ngpio, 0);
+	if (chip->irq_base < 0) {
+		pr_err("Couldn't allocate IRQ numbers\n");
+		return -1;
+	}
+	chip->irq_domain = irq_domain_add_legacy(np, chip->gc.ngpio,
+						 chip->irq_base, 0,
+						 &irq_domain_simple_ops, NULL);
+	/*
+	 * set the irq chip, handler and irq chip data for callbacks for
+	 * each pin
+	 */
+	for (pin_num = 0; pin_num < chip->gc.ngpio; pin_num++) {
+		u32 gpio_irq = irq_find_mapping(chip->irq_domain, pin_num);
+
+		irq_set_lockdep_class(gpio_irq, &gpio_lock_class,
+				      &gpio_request_class);
+		pr_debug("IRQ Base: %d, Pin %d = IRQ %d\n",
+			 chip->irq_base, pin_num, gpio_irq);
+		irq_set_chip_and_handler(gpio_irq, &xgpio_irqchip,
+					 handle_simple_irq);
+		irq_set_chip_data(gpio_irq, (void *)chip);
+	}
+	irq_set_handler_data(res.start, (void *)chip);
+	irq_set_chained_handler(res.start, xgpio_irqhandler);
+
+	return 0;
+}
+
+/**
  * xgpio_of_probe - Probe method for the GPIO device.
  * @pdev: pointer to the platform device
  *
@@ -434,6 +656,15 @@ static int xgpio_probe(struct platform_device *pdev)
 		goto err_pm_put;
 	}
 
+	status = xgpio_irq_setup(np, chip);
+	if (status) {
+		pr_err("%s: GPIO IRQ initialization failed %d\n",
+		       np->full_name, status);
+		goto err_pm_put;
+	}
+	pr_info("XGpio: %s: registered, base is %d\n", np->full_name,
+		chip->gc.base);
+
 	pm_runtime_put(&pdev->dev);
 	return 0;
 err_pm_put:
-- 
2.7.4

