Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C72215D2A4
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2020 08:16:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728803AbgBNHP7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Feb 2020 02:15:59 -0500
Received: from mail-dm6nam11on2089.outbound.protection.outlook.com ([40.107.223.89]:21222
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728779AbgBNHP7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 14 Feb 2020 02:15:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWl1dRGYfA1Hi1e0/rPDoSEcKhG2C7vH1IOjuueVw/JUxm/HhozoqzbotW98fHPujln3J0T7a5354fzH9kMNKZdpa08wvVCpKJYgp45zckwEzVGD/Fxv148eyRBwOqLWzg4ScMQ1oYQCBT5Gw5J30yuYvTrO5ES0IT1YTIJVRKc8kIwOTE+JFItsLk6zx4JhCgZeUgtrIETdYbHe1CI82yUBbgYw0Hds5KenyHBfg+gUmKgrLVPFlxk3azgjAdeGhPZOhYd881gmjD0qS+kxawYpecrOHXPCUeyCG3SaSpcDJvXhOGJs5PZcEwcqyXQjZrLkpop36jsQxke2xctJ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlkvPKLZlVCp1T3bT2AIP17AbdcbrKF5ADlDc8Id6WM=;
 b=luRsiszxws+1w7P57BM9/7KIcsBeXI2iibkZqyeW/iOgMKQ567Up2MlrdnSnMMPXrFE/uW2b4mTBJ/msH4wRfXEejUAw+l+fAggHjsJQHEse9cYjNgRXAhUVnt16C0gWnJTxfL6m/dNcwRcK1uzdIzNHtjUdckN/5OwH0UenOIS49nDAVGGb9EYJKVg4aL1LSDyf+XcE8FQ35JGZncIzW2O17jF5nChZ9klCwc6w4EwtHoFsBZkT0di6PH+uk0jQRsN1p1+JWDmBDUuo9aPhJGcXgXk5m7lDSdILblIDy1RzZVd6a17zLdVHvJHeY99AzTtFF77+ypToFmAr6+/kSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlkvPKLZlVCp1T3bT2AIP17AbdcbrKF5ADlDc8Id6WM=;
 b=ctMxd94Pmf39pEePIL9DLRy9YTOiVQ9AZD1YqebceBbQVeoM9tgXt8ZazHUMQt8FDHWWwa7sKg+WuHWvYNQNu6CyGQg7HxazwO8wQZknMdD4WA3yab909HMGhtixgLFufwZEjErYfh8Lh4GL6oDQJITiXxA38w+IukGt6oZj9lQ=
Received: from SN4PR0201CA0009.namprd02.prod.outlook.com
 (2603:10b6:803:2b::19) by BYAPR02MB5494.namprd02.prod.outlook.com
 (2603:10b6:a03:99::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.23; Fri, 14 Feb
 2020 07:15:55 +0000
Received: from CY1NAM02FT010.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::209) by SN4PR0201CA0009.outlook.office365.com
 (2603:10b6:803:2b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.23 via Frontend
 Transport; Fri, 14 Feb 2020 07:15:54 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT010.mail.protection.outlook.com (10.152.75.50) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2729.22
 via Frontend Transport; Fri, 14 Feb 2020 07:15:54 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j2VCb-0006Em-G0; Thu, 13 Feb 2020 23:15:53 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j2VCW-0000Q7-CV; Thu, 13 Feb 2020 23:15:48 -0800
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 01E7FhRW015532;
        Thu, 13 Feb 2020 23:15:44 -0800
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j2VCR-0000OQ-9h; Thu, 13 Feb 2020 23:15:43 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com
Subject: [PATCH V2 1/7] gpio: zynq: protect direction in/out with a spinlock
Date:   Fri, 14 Feb 2020 12:45:31 +0530
Message-Id: <1581664537-14386-2-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581664537-14386-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1581664537-14386-1-git-send-email-srinivas.neeli@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(376002)(39850400004)(136003)(346002)(396003)(189003)(199004)(478600001)(356004)(2906002)(336012)(4326008)(6666004)(316002)(44832011)(36756003)(6636002)(70586007)(5660300002)(7696005)(2616005)(9786002)(426003)(8676002)(81166006)(26005)(70206006)(107886003)(8936002)(81156014)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR02MB5494;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12b25dff-19ed-415c-c530-08d7b11dbae6
X-MS-TrafficTypeDiagnostic: BYAPR02MB5494:
X-Microsoft-Antispam-PRVS: <BYAPR02MB54942AABE8383DE4B7027658AF150@BYAPR02MB5494.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 03137AC81E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Ru+vUIDh4eABMSf2GqOuqfF6mT+Xyrb3/veywOcBarSZta/NC27wsZO+v4HDtxR2wtC+Y2rPovuoUj/pYEU6D1nlrAiLowIfmNYOkXjOJv4LlrvARLKZ8BEFuUpAxxmygYHMkzbTGNqbPAtn1MddLYjT5YdVc8CDoaNf8M3B1w/rHQ6hV90aqLuftM7gziIjqaUR2lgMpiIkSOREsO+vlFT2ZtjU8ERjmad+J4X8xcv1PExhxV/yu+0tUqWP/4A219uJfhbDVc5e3JhOorvHDlBe9SltPRgA2/Ri290ltcOhLWWUhqM7gL5lTRNxFwbvtGl6Bur6+v8mj5+W9QWSR+w893P5gKml8iMN0BMAQDF9JxioE+OxSzzovI8WMa1NNOp79Th2zVl0yrm5dbRmxvxg0DywZaiVFbslHK6hwTL4LukHzXVrKN3Mq8PGlkm
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 07:15:54.2337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b25dff-19ed-415c-c530-08d7b11dbae6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5494
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Glenn Langedock <Glenn.Langedock@barco.com>

Fix race condition when changing the direction (in/out) of the GPIO pin.
The read-modify-write sequence (as coded in the driver) isn't atomic and
requires synchronization (spinlock).

Signed-off-by: Glenn Langedock <Glenn.Langedock@barco.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
Changes in V2:
-Updated spinlock comment message.
---
 drivers/gpio/gpio-zynq.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 05ba16fffdad..fb93b35ab19e 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -10,6 +10,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/spinlock.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -116,6 +117,7 @@ struct gpio_regs {
  * @irq:	interrupt for the GPIO device
  * @p_data:	pointer to platform data
  * @context:	context registers
+ * @dirlock:	lock used for direction in/out synchronization
  */
 struct zynq_gpio {
 	struct gpio_chip chip;
@@ -124,6 +126,7 @@ struct zynq_gpio {
 	int irq;
 	const struct zynq_platform_data *p_data;
 	struct gpio_regs context;
+	spinlock_t dirlock; /* lock */
 };
 
 /**
@@ -297,6 +300,7 @@ static int zynq_gpio_dir_in(struct gpio_chip *chip, unsigned int pin)
 {
 	u32 reg;
 	unsigned int bank_num, bank_pin_num;
+	unsigned long flags;
 	struct zynq_gpio *gpio = gpiochip_get_data(chip);
 
 	zynq_gpio_get_bank_pin(pin, &bank_num, &bank_pin_num, gpio);
@@ -310,9 +314,11 @@ static int zynq_gpio_dir_in(struct gpio_chip *chip, unsigned int pin)
 		return -EINVAL;
 
 	/* clear the bit in direction mode reg to set the pin as input */
+	spin_lock_irqsave(&gpio->dirlock, flags);
 	reg = readl_relaxed(gpio->base_addr + ZYNQ_GPIO_DIRM_OFFSET(bank_num));
 	reg &= ~BIT(bank_pin_num);
 	writel_relaxed(reg, gpio->base_addr + ZYNQ_GPIO_DIRM_OFFSET(bank_num));
+	spin_unlock_irqrestore(&gpio->dirlock, flags);
 
 	return 0;
 }
@@ -334,11 +340,13 @@ static int zynq_gpio_dir_out(struct gpio_chip *chip, unsigned int pin,
 {
 	u32 reg;
 	unsigned int bank_num, bank_pin_num;
+	unsigned long flags;
 	struct zynq_gpio *gpio = gpiochip_get_data(chip);
 
 	zynq_gpio_get_bank_pin(pin, &bank_num, &bank_pin_num, gpio);
 
 	/* set the GPIO pin as output */
+	spin_lock_irqsave(&gpio->dirlock, flags);
 	reg = readl_relaxed(gpio->base_addr + ZYNQ_GPIO_DIRM_OFFSET(bank_num));
 	reg |= BIT(bank_pin_num);
 	writel_relaxed(reg, gpio->base_addr + ZYNQ_GPIO_DIRM_OFFSET(bank_num));
@@ -347,6 +355,7 @@ static int zynq_gpio_dir_out(struct gpio_chip *chip, unsigned int pin,
 	reg = readl_relaxed(gpio->base_addr + ZYNQ_GPIO_OUTEN_OFFSET(bank_num));
 	reg |= BIT(bank_pin_num);
 	writel_relaxed(reg, gpio->base_addr + ZYNQ_GPIO_OUTEN_OFFSET(bank_num));
+	spin_unlock_irqrestore(&gpio->dirlock, flags);
 
 	/* set the state of the pin */
 	zynq_gpio_set_value(chip, pin, state);
@@ -885,6 +894,8 @@ static int zynq_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	spin_lock_init(&gpio->dirlock);
+
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	ret = pm_runtime_get_sync(&pdev->dev);
-- 
2.7.4

