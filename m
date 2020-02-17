Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46417161212
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2020 13:33:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728671AbgBQMdc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Feb 2020 07:33:32 -0500
Received: from mail-dm6nam10on2070.outbound.protection.outlook.com ([40.107.93.70]:45505
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726414AbgBQMdc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 Feb 2020 07:33:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AY2IAaGh627RJfIMFreg3aR7jAkrReBmZ4m5i/W4WtEKGl/+6eYft3KHFy8ujjgXcm9K8L6NcWw1BdGAiTIXj7Hu0em/xBe8NVRBhho3Hf63BWtOHaXS+YYIFDV88UcBO9LMKgQm0lI0lDNxN+nFPmbVl6FuZlwcTgNaq2skwbHRuF3B3SuBvf4ANMyEf9Pwn7FBLiyNxDvbiY0wYgWp6gYnfaVQd+ZWwFRCNVEvxgV5xjxwYcMM6c/Fl+In80Ao/Hw9Sv+gtEZ8U2fGRCX0PtFZQWl759zfEpE24Yov09xuwzO5T5SSBquMYdEK/4mwbE9LJxMI2qV6qaPRW2TSsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2HwNjoxgdMe6fGWHJNbzIB1f19Q/azDu2qzoRYjkyc=;
 b=eU8h+tC53l0RAdNCGOJ49UuXI9P1eMUw1hhAjVfPiKgpPKbFnAGinELAE5xszUpi81Lre2Zf9RfPDLUSAP6Ufh9SZ6R0+W5EnIn/XzQ81x5+/4vqt+DXIRCic3mX5wN1pL2Bj5qpCWIW0js01znRDn4q4FMq+rY7fPWh4F/5KOaZ470IO+2npBQc9eM4Ei8iByu/j5x3k2y497Mu4ERO2FZzPt43s7S1nJHuD1HwiDqLmbmhXKXpbHErwNjDs5UXLhgckhrH72DOpVOQu5oc2CA6fOfimm6dtFBxuGPY3gMrfX034wNwHCKh8A0vX7oUFzJXuA2W3xJnmpx5EEyZYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2HwNjoxgdMe6fGWHJNbzIB1f19Q/azDu2qzoRYjkyc=;
 b=GpjYaiwuYBIOMLJKptG4mqANIHmeIl/sT4DkGQnBUyJq/48eA/0i+MEouNxlAfFZR/AGFbp6J5Xx+w5CfTvr9uLytmYgH+YTiSXgEVwJiBI20AjwMQ9Mo23fw6Tr4nnvojNgQaIR0/Ho7ci5ty30C6A1YjYhjuaXrnEgu280T6M=
Received: from BYAPR02CA0065.namprd02.prod.outlook.com (2603:10b6:a03:54::42)
 by MWHPR02MB2269.namprd02.prod.outlook.com (2603:10b6:300:5a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22; Mon, 17 Feb
 2020 12:33:28 +0000
Received: from BL2NAM02FT013.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::204) by BYAPR02CA0065.outlook.office365.com
 (2603:10b6:a03:54::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25 via Frontend
 Transport; Mon, 17 Feb 2020 12:33:27 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT013.mail.protection.outlook.com (10.152.77.19) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2729.22
 via Frontend Transport; Mon, 17 Feb 2020 12:33:27 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j3faY-0000SE-Pc; Mon, 17 Feb 2020 04:33:26 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j3faT-0001vY-MU; Mon, 17 Feb 2020 04:33:21 -0800
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 01HCXJ7f025834;
        Mon, 17 Feb 2020 04:33:19 -0800
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j3faR-0001uE-2X; Mon, 17 Feb 2020 04:33:19 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com
Subject: [PATCH V3 1/7] gpio: zynq: protect direction in/out with a spinlock
Date:   Mon, 17 Feb 2020 18:03:07 +0530
Message-Id: <1581942793-19468-2-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581942793-19468-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1581942793-19468-1-git-send-email-srinivas.neeli@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(199004)(189003)(26005)(6636002)(9786002)(36756003)(2906002)(356004)(6666004)(7696005)(4326008)(70586007)(70206006)(478600001)(336012)(186003)(81156014)(81166006)(8936002)(8676002)(5660300002)(44832011)(426003)(2616005)(316002)(107886003);DIR:OUT;SFP:1101;SCL:1;SRVR:MWHPR02MB2269;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ec54fe7-46ae-4162-3535-08d7b3a596b8
X-MS-TrafficTypeDiagnostic: MWHPR02MB2269:
X-Microsoft-Antispam-PRVS: <MWHPR02MB226913949CE68A22056F2E43AF160@MWHPR02MB2269.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0316567485
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jy6IYm8vwEvo8Hw3oYtwOFFUpy7HO4FmdS3LlSRwLnGW3l6zYF1WQFy1vxJqZXDlwxpz9p1z2S+DnM3BklbfqaHjbPJCN89K5GHEJfiv8TEPitMJ0mp3b4pAulO3o2LhLse7es7PoXOkhdZzqrIFMCtylKlb3Ep/x6B5s51DmlPIQgBM97Id4/hSbDAblCFKLrlgINsGMMXM21uXmKTiquiUS4fYxEC5Fetve49uRkW4oAzeHPKEvLlfu4zmXrDShZHTrOEGax7wcBKjfOrhDxYiYNW9ZEEQif9pMu5uEg7ceZ8S3a+gxqDeJ2tTpo9unBf8BZomGJYl90hMHkYkEyKiR33jjpoLi/ch+hX5auEFLqjbJ217QPkXj3qN6N3LCLhLtuZ/jKwiwO3NfL1gE9C+j5ChcsVjv8ktjI8W1gmBZRjy8C7AKIAzPWziDMDN
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2020 12:33:27.3463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec54fe7-46ae-4162-3535-08d7b3a596b8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2269
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

