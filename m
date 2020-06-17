Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 841601FCC81
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 13:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgFQLho (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jun 2020 07:37:44 -0400
Received: from mail-co1nam11on2077.outbound.protection.outlook.com ([40.107.220.77]:34404
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726044AbgFQLhn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Jun 2020 07:37:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQxxERIzrmgDqVfQwZVup7ZLfNe0BVXeLKxoZcTY7dbn0Rlg8mRWg29Kl+p82xE+GDdHfza4ySgzPX5onRfQ7hwerS50bNSRuneB2++suY0KZzgM1vtgO9ccFUyKhjwHusKKHJsQxuAbVjU+1oT8DlIEkRKIuNaTY35vMNmlUt4rlsmzFMNmMx5kuiq7YwiE6RnEx2NgrYydkwmywM0SogK9IElrXZ36RELhyPM4noRZnXE8dFokBPLYrLVmmpOJrqjFcgWwq9TLP7rAZdlT2nx4yk2+QM37iKahkxmzzvlgoQyUjgoJ3C/CVp3PO6x+bwfNU7rFfSR2gAnVcxRb6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2HwNjoxgdMe6fGWHJNbzIB1f19Q/azDu2qzoRYjkyc=;
 b=oPubWJTu2FnB71W4TeExUrP/GZKXck+nYzV+J59XfszU4uFJMsuk8hCthwo0PPQnYEXXjGwUViULYK2aJIFc+X4nXC94BJDfsGVy0yQSERqNX45+s6ztgvvAlvqijHBh4zv1uWH85NtG9Iq2+ZsNwsAEDy8R8plMHatn15hezi7ClZdeyK3VOugVTj5zdNibAxZHRgOqhMetHA7U6cBG+3y9qcAJhS9IU37+ePbsvGylvOEdpTXvTg/apvj9Kc7WXIFuPY+MWMhGyzXZS0oCdGe6zxK9ND5Dk0Hc+q3Vm+zoonSQUvbhaA3riP/Yp+MgIYIV8U0h7fGXgFd/8g2GOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2HwNjoxgdMe6fGWHJNbzIB1f19Q/azDu2qzoRYjkyc=;
 b=gUxOf9zril98A1GQUfviYv8dVNr0LJvanKjArZLamZQyVRgyA8/RiCEYsmuF5vKaSUoUdzpYyRo39/ntBx15ku+rQgA5ZSH3DjDbLGVTdTOBe6bUUoPommhGMB8BS9Ft1VoHNsP/N+Xo7vII234jv5AaFX5++a7VwLSNGDnpI3o=
Received: from SA9PR11CA0008.namprd11.prod.outlook.com (2603:10b6:806:6e::13)
 by CY4PR02MB2614.namprd02.prod.outlook.com (2603:10b6:903:6a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.25; Wed, 17 Jun
 2020 11:37:40 +0000
Received: from SN1NAM02FT037.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:6e:cafe::66) by SA9PR11CA0008.outlook.office365.com
 (2603:10b6:806:6e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21 via Frontend
 Transport; Wed, 17 Jun 2020 11:37:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT037.mail.protection.outlook.com (10.152.72.89) with Microsoft SMTP
 Server id 15.20.3088.18 via Frontend Transport; Wed, 17 Jun 2020 11:37:39
 +0000
Received: from [149.199.38.66] (port=36026 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1jlWMt-0001Ha-71; Wed, 17 Jun 2020 04:36:35 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1jlWNv-0007Wp-HR; Wed, 17 Jun 2020 04:37:39 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 05HBbXEl032513;
        Wed, 17 Jun 2020 04:37:33 -0700
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1jlWNp-0007TR-8W; Wed, 17 Jun 2020 04:37:33 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com,
        sgoud@xilinx.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com
Subject: [PATCH V4 1/7] gpio: zynq: protect direction in/out with a spinlock
Date:   Wed, 17 Jun 2020 17:07:21 +0530
Message-Id: <1592393847-1415-2-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592393847-1415-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1592393847-1415-1-git-send-email-srinivas.neeli@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(136003)(376002)(39860400002)(396003)(346002)(46966005)(107886003)(36756003)(186003)(70206006)(47076004)(44832011)(8936002)(82740400003)(9786002)(26005)(70586007)(426003)(2616005)(478600001)(5660300002)(6636002)(2906002)(7696005)(4326008)(8676002)(316002)(83380400001)(6666004)(82310400002)(81166007)(356005)(336012);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f3795a91-5f3a-4554-4af8-08d812b2d74b
X-MS-TrafficTypeDiagnostic: CY4PR02MB2614:
X-Microsoft-Antispam-PRVS: <CY4PR02MB2614771FB8EF3F7643015F3AAF9A0@CY4PR02MB2614.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zXGAgVE8jAiN+82fIk2tdslsW76KPV9fGXRMlUKY7/vgNxtEcmTYVXLwgKjPNKgpH629jRNxl2TVV5wuOSwnKa5fu5jj4A3Y9DJCKZZXSX7jnoVA9Oux41k3Xpgcclx90tnSizZF92f/WcrAtidebJLyDTz2/riU7jh5+vsZaF3f1v5nOuCSB/UWuex7AE4/sKAuzO3Q/H0Kp5Nuj/FDblKl90DdVLZoGGK9e4mBY0sotc2Y5enTEbNHzotgxEipdPhYYTkop08spxjsq54KKvK8NDJ8ik6vwCSdGq0eb24ucmhY1xoqWtw5+Yf4CWfCXUXhIbAIS9dGYd/Z/IlSiJakJnTKzQPAc3NuK15AMu6VViJ3rZy/LOWHQ3bbCUXv/9Q4MG5+ncNaZ4vizmnJOg==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 11:37:39.8279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3795a91-5f3a-4554-4af8-08d812b2d74b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2614
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

