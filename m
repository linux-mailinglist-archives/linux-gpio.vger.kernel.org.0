Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D39F161218
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2020 13:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728519AbgBQMds (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Feb 2020 07:33:48 -0500
Received: from mail-eopbgr680083.outbound.protection.outlook.com ([40.107.68.83]:27393
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729487AbgBQMdr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 Feb 2020 07:33:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JfvBmCdeGnTGRElkIicU7yzcEVdLv9OBYhU7NTgxQfzB+M4PvhIFiC9K+vVrb6sFE237iCBFEsKw5i+nKiVnTYYA9p9Amp4sbOGp5FOTOx6EYxyyobeSj8BbzDgCEpbbzp+iv287kSHm8SU5eRPt6dY7VY/3QE8JWrUNOyup4Bl9Z9oDKAQFmfU3XE+J7ZzA0HGrk1vlO9gGwGw4vvTMMy9PMghAy8fEVID6n0WMJ8Dwz6R2b+EMMx8b1gFuFcfqYQZBcHzK2or188kPt7v2DbHHJ9Hq8j0HSdOvDqnIUIk7EXb5l/NWeWn5VrXzNHlF9/hfZNQZ6wNTVPSJLvF1eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSLIql5MoG4i9i/mKSl1vgGEGnbfGf/ctqtXPBP8pkQ=;
 b=fjI7U6I7pkuQ6nj7IIcW5PRS7zZtgCuXA07kNiSBj/H43ux/zjJyBSYlkRIhJ66wZawaOZHgpW66+ZBUR6nypywV83tY/dBdYnYJf0a2RNM+fpQQf6b1dsSlNNPQpu7rdSL8a9M94zyB6WO+2VEGzSdh0e5sCVKATzD9myoH+hTAgAkrDBpki135XH5JVOqmpCqAvXptfCl4ty0gOnfQBWMQbzQkvlaR9ahhWDq2qQUDG8jx4OtqATyNGx6ghzdorIqZHcno6RKKd8+Hist1D5b+//XwAdJL1kgLx+6O5Z4lgufCkItyCpQBe/KZzgUT+pcpxze+yTTa0SeSBGYRDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSLIql5MoG4i9i/mKSl1vgGEGnbfGf/ctqtXPBP8pkQ=;
 b=ABX6vdfLG5ekqxhvCqETEwrfB9AiWj9pRD0sQnihsjU4aimNna3oGll/QRlrg6XrLqXqtIPX3n1SWo5aVUy9XkLvNDisTaXm76q5KSffSoOkEfWGVaCidOEYtymirnglmhOLm70EmQmLoDFNHIM6NKQGfsXMSjUul/y91GgqpIk=
Received: from DM6PR02CA0102.namprd02.prod.outlook.com (2603:10b6:5:1f4::43)
 by MWHPR0201MB3547.namprd02.prod.outlook.com (2603:10b6:301:7b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22; Mon, 17 Feb
 2020 12:33:38 +0000
Received: from BL2NAM02FT056.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::201) by DM6PR02CA0102.outlook.office365.com
 (2603:10b6:5:1f4::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.23 via Frontend
 Transport; Mon, 17 Feb 2020 12:33:38 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT056.mail.protection.outlook.com (10.152.77.221) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2729.22
 via Frontend Transport; Mon, 17 Feb 2020 12:33:37 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j3faj-0000Se-2L; Mon, 17 Feb 2020 04:33:37 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j3fad-0001wt-VW; Mon, 17 Feb 2020 04:33:32 -0800
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 01HCXRLD025885;
        Mon, 17 Feb 2020 04:33:27 -0800
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j3faY-0001uE-OO; Mon, 17 Feb 2020 04:33:27 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com
Subject: [PATCH V3 4/7] gpio: zynq: Add Versal support
Date:   Mon, 17 Feb 2020 18:03:10 +0530
Message-Id: <1581942793-19468-5-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581942793-19468-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1581942793-19468-1-git-send-email-srinivas.neeli@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(136003)(199004)(189003)(8676002)(8936002)(107886003)(70206006)(4326008)(356004)(186003)(2616005)(81156014)(26005)(81166006)(5660300002)(426003)(336012)(70586007)(6666004)(44832011)(316002)(9786002)(36756003)(6636002)(966005)(7696005)(2906002)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:MWHPR0201MB3547;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46fe1f2f-80c4-43c5-516e-08d7b3a59cd8
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3547:
X-Microsoft-Antispam-PRVS: <MWHPR0201MB35473D58818FDAFAD1B53F45AF160@MWHPR0201MB3547.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 0316567485
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TjgySyqasbVQY7sr33T1GTOh1PPsUw16974NYXgHysX9/2fIaD8AG4aWwlG6IouV2yXzplzXNdiNW/SEoCKZlNdD0riRA6gx7GZqOL8p3bbtouz8Erhw3YRqmnxw5NpA6E1L2w8v3D7sH2D/NcCX1BODfd3OWBoJFRLK8LQWXl80yW8mQSc/80QkhfW2yNRGkWDMKBPysPZB2HmZR0RLWP95NkLnxcsLEOrhq2XqFc086RWYB4VwPV7C85Lqgs6a6UVy/NAz8p0J7vJFQCk9fl7YgJZwnS8qRFnqhbXaTwTV5gge6W1z3Pk6TztqnXlOtZ8/06RE8xF4GIuOmhIGamp11gIbFoNKq5vWxMTIVCs+Nd4B/AKGOgIMVHenADBF8DrAJuJs36k4jTRhmJWxCZ/MT3TKcaWKJB9fmLC8drMgyjbFxO+oEin7U+9NPChiAW7uncWI4aXiuhwjNneIog/T5JHyPiHIpFl2/9kbL5zEN9Fk3gPWMsHvgJPbloVCvmWZEXxN49ZsX2QjB5PQ+g==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2020 12:33:37.6223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46fe1f2f-80c4-43c5-516e-08d7b3a59cd8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3547
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Add Versal support in gpio.
Only bank 0 and 3 are connected to the Multiplexed Input output pins.
Bank 0 to mio and bank3 to fabric Multiplexed input output pins.

Versal devices are the industry's first adaptive compute
acceleration platforms.
https://www.xilinx.com/support/documentation/data_sheets/ds950-versal-overview.pdf

On the Versal platform, we are using two customized GPIO controllers(IP)
which were used in Zynq/ZynqMp platform.
One of them present in the Platform Management Controller(PMC) block and
other in Processing System(PS) block.

In PMC_GPIO only Bank0,1,3 & 4 are enabled and in PS_GPIO only
Bank 0 & 3 are enabled.

You can find more details of GPIO IP in ZynqMP TRM General Purpose
I/O(Chapter-27).
https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
 drivers/gpio/gpio-zynq.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index fb93b35ab19e..9ac69144a0eb 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -22,6 +22,8 @@
 /* Maximum banks */
 #define ZYNQ_GPIO_MAX_BANK	4
 #define ZYNQMP_GPIO_MAX_BANK	6
+#define VERSAL_GPIO_MAX_BANK	4
+#define VERSAL_UNUSED_BANKS	2
 
 #define ZYNQ_GPIO_BANK0_NGPIO	32
 #define ZYNQ_GPIO_BANK1_NGPIO	22
@@ -96,6 +98,7 @@
 /* set to differentiate zynq from zynqmp, 0=zynqmp, 1=zynq */
 #define ZYNQ_GPIO_QUIRK_IS_ZYNQ	BIT(0)
 #define GPIO_QUIRK_DATA_RO_BUG	BIT(1)
+#define GPIO_QUIRK_VERSAL	BIT(2)
 
 struct gpio_regs {
 	u32 datamsw[ZYNQMP_GPIO_MAX_BANK];
@@ -199,6 +202,8 @@ static inline void zynq_gpio_get_bank_pin(unsigned int pin_num,
 					gpio->p_data->bank_min[bank];
 			return;
 		}
+		if (gpio->p_data->quirks & GPIO_QUIRK_VERSAL)
+			bank = bank + VERSAL_UNUSED_BANKS;
 	}
 
 	/* default */
@@ -656,6 +661,8 @@ static void zynq_gpio_irqhandler(struct irq_desc *desc)
 		int_enb = readl_relaxed(gpio->base_addr +
 					ZYNQ_GPIO_INTMASK_OFFSET(bank_num));
 		zynq_gpio_handle_bank_irq(gpio, bank_num, int_sts & ~int_enb);
+		if (gpio->p_data->quirks & GPIO_QUIRK_VERSAL)
+			bank_num = bank_num + VERSAL_UNUSED_BANKS;
 	}
 
 	chained_irq_exit(irqchip, desc);
@@ -685,6 +692,8 @@ static void zynq_gpio_save_context(struct zynq_gpio *gpio)
 		gpio->context.int_any[bank_num] =
 				readl_relaxed(gpio->base_addr +
 				ZYNQ_GPIO_INTANY_OFFSET(bank_num));
+		if (gpio->p_data->quirks & GPIO_QUIRK_VERSAL)
+			bank_num = bank_num + VERSAL_UNUSED_BANKS;
 	}
 }
 
@@ -716,6 +725,8 @@ static void zynq_gpio_restore_context(struct zynq_gpio *gpio)
 		writel_relaxed(~(gpio->context.int_en[bank_num]),
 			       gpio->base_addr +
 			       ZYNQ_GPIO_INTEN_OFFSET(bank_num));
+		if (gpio->p_data->quirks & GPIO_QUIRK_VERSAL)
+			bank_num = bank_num + VERSAL_UNUSED_BANKS;
 	}
 }
 
@@ -787,6 +798,17 @@ static const struct dev_pm_ops zynq_gpio_dev_pm_ops = {
 			   zynq_gpio_runtime_resume, NULL)
 };
 
+static const struct zynq_platform_data versal_gpio_def = {
+	.label = "versal_gpio",
+	.quirks = GPIO_QUIRK_VERSAL,
+	.ngpio = 58,
+	.max_bank = VERSAL_GPIO_MAX_BANK,
+	.bank_min[0] = 0,
+	.bank_max[0] = 25, /* 0 to 25 are connected to MIOs (26 pins) */
+	.bank_min[3] = 26,
+	.bank_max[3] = 57, /* Bank 3 is connected to FMIOs (32 pins) */
+};
+
 static const struct zynq_platform_data zynqmp_gpio_def = {
 	.label = "zynqmp_gpio",
 	.quirks = GPIO_QUIRK_DATA_RO_BUG,
@@ -824,6 +846,7 @@ static const struct zynq_platform_data zynq_gpio_def = {
 static const struct of_device_id zynq_gpio_of_match[] = {
 	{ .compatible = "xlnx,zynq-gpio-1.0", .data = &zynq_gpio_def },
 	{ .compatible = "xlnx,zynqmp-gpio-1.0", .data = &zynqmp_gpio_def },
+	{ .compatible = "xlnx,versal-gpio-1.0", .data = &versal_gpio_def },
 	{ /* end of table */ }
 };
 MODULE_DEVICE_TABLE(of, zynq_gpio_of_match);
@@ -903,9 +926,12 @@ static int zynq_gpio_probe(struct platform_device *pdev)
 		goto err_pm_dis;
 
 	/* disable interrupts for all banks */
-	for (bank_num = 0; bank_num < gpio->p_data->max_bank; bank_num++)
+	for (bank_num = 0; bank_num < gpio->p_data->max_bank; bank_num++) {
 		writel_relaxed(ZYNQ_GPIO_IXR_DISABLE_ALL, gpio->base_addr +
 			       ZYNQ_GPIO_INTDIS_OFFSET(bank_num));
+		if (gpio->p_data->quirks & GPIO_QUIRK_VERSAL)
+			bank_num = bank_num + VERSAL_UNUSED_BANKS;
+	}
 
 	/* Set up the GPIO irqchip */
 	girq = &chip->irq;
-- 
2.7.4

