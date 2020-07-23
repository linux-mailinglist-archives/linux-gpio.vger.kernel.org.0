Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9141722B0F4
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 16:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728066AbgGWOGW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 10:06:22 -0400
Received: from mail-bn7nam10on2069.outbound.protection.outlook.com ([40.107.92.69]:41409
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726089AbgGWOGV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Jul 2020 10:06:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbjCQYg5C4+24TJGLo0sg2cw8jVAUepf6aoq63HLVftUqq0r9gXnqVsM2CKVqkOl1Q/8Cm/e6e3vQNMxbAxIkhx6f5me8bdMRPNUKJ4u+rz4ta5KMVngON9/G+WmHOxrncO0fZZvppgvZkA8XpMjpy4QyLTNWEzsDaNNstyErbKGDfd8b6d488NPZYkMQl0HY+Aen/fZUeF4kqaQx63rxUA/BzTXQ7gEp+efX8MSHejYOJwhoZ7jAK/NsDx/+OgSj9EWki31Cta3QnGgws/QCkPcvLsZGT3slrO4uVickdbQgHb8tNGpoDBdIi5N/eh0loQvxazBe+u2FzaCQL5dKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKx5wx31GLTD0nKRbG+gL64xdeOqQpb6ABdqTZyoYbo=;
 b=Zrww75innOFrB4CUsFexcxDtbcoAqcbNV+XmOtyOUCLw5KJky66Fxr6lh65sEEmnpHsaI135aRVO9y8aJgPAT5olpXVQOWwahozWGabda1vSchPblyI2mcn0Af5JUn4jMSCXG8S52hE22N456xbKC78Xu8bsGcoJaTr61/8FVLLKbk/2tm7xvQgANVD9h4CBvlZbQb96MieI1zamgcGPQltbMrl1YNk2shVyzi+L7e49bmLiov65vV45L09SVOmFzozgOgRAljKdlVOuubROl5kc+867fwmSErPENvXGst2Qy0PCVf9QUlo7KxanIKo1ld4TuORkkJljDoLYD7hZPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKx5wx31GLTD0nKRbG+gL64xdeOqQpb6ABdqTZyoYbo=;
 b=hxef7BvqyUcYND0pzFM5PyxA5oRntqYmfWAffDx3A5rCMVTcD6pcPlHZmzU6bZZdbcdbHveNvD33+uZ08qHXzP5itFNt7RKQLtNwP4xAXc3iRpkzi7mCNd+/bhidD7ccOAY1k7PnIihFn8xVUW28piZdy8wKMdL5sUykqoEQHb4=
Received: from MN2PR04CA0002.namprd04.prod.outlook.com (2603:10b6:208:d4::15)
 by CY4PR0201MB3586.namprd02.prod.outlook.com (2603:10b6:910:8b::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Thu, 23 Jul
 2020 14:06:19 +0000
Received: from BL2NAM02FT021.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:d4:cafe::9c) by MN2PR04CA0002.outlook.office365.com
 (2603:10b6:208:d4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20 via Frontend
 Transport; Thu, 23 Jul 2020 14:06:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT021.mail.protection.outlook.com (10.152.77.158) with Microsoft SMTP
 Server id 15.20.3216.10 via Frontend Transport; Thu, 23 Jul 2020 14:06:18
 +0000
Received: from [149.199.38.66] (port=56793 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1jybpg-0004H0-Ld; Thu, 23 Jul 2020 07:04:24 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1jybrW-0005RQ-Lo; Thu, 23 Jul 2020 07:06:18 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 06NE6E2P004452;
        Thu, 23 Jul 2020 07:06:14 -0700
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1jybrR-0005Q2-UE; Thu, 23 Jul 2020 07:06:14 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com,
        sgoud@xilinx.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com
Subject: [PATCH V2 1/3] gpio: xilinx: Add clock adaptation support
Date:   Thu, 23 Jul 2020 19:36:06 +0530
Message-Id: <1595513168-11965-2-git-send-email-srinivas.neeli@xilinx.com>
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
X-MS-Office365-Filtering-Correlation-Id: b2abba5e-6279-4067-9929-08d82f119263
X-MS-TrafficTypeDiagnostic: CY4PR0201MB3586:
X-Microsoft-Antispam-PRVS: <CY4PR0201MB3586BCB9CA5545AFD174B70AAF760@CY4PR0201MB3586.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cmvlo9RIh+GEXsubUpmM9uT/l271pLgTJym0BcsC3lp5aKvXuqFv+Mlsl1PyXAwBpoKwFHC734WUpZ2jyG1vLrOJE4YAYSZviBSY40X1Qqh8Db43XO7eVGg4qn0KfEErxwYowr3fKnOSaCtAs2GL1X/Q05tWo5cHBncVK28V9mod+5jYKrf5QlFz61e3Bfvvioi8mZbwPiGoMOLSM3jAfTFvveo/6LSYf3RIvtU4XjilC0SeVmnWFxxa/66GxoSalzXilNfykclCrUc0UsORDNRD6WH6xXFq43/W3Rmr1aSPW5y/Rh8szf2m4XcSIfQ7vvbI7aj/WvCinafufGTI5kaNGyTNJX2/nUGnixsrxffbeQOEJeVvatZIwZ4/zd0tMf3FsRhwZ47jC1/YY6snbQ==
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(396003)(39860400002)(136003)(346002)(376002)(46966005)(186003)(70586007)(9786002)(70206006)(47076004)(356005)(478600001)(26005)(81166007)(44832011)(36756003)(82740400003)(82310400002)(2906002)(83380400001)(2616005)(8676002)(107886003)(336012)(426003)(4326008)(7696005)(6666004)(316002)(6636002)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 14:06:18.9805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2abba5e-6279-4067-9929-08d82f119263
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT021.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0201MB3586
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support of clock adaptation for AXI GPIO driver.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
Changes in V2:
Add check for return value of platform_get_irq() API.
---
 drivers/gpio/gpio-xilinx.c | 111 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 109 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 67f9f82e0db0..d103613e787a 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -14,6 +14,8 @@
 #include <linux/io.h>
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
+#include <linux/pm_runtime.h>
+#include <linux/clk.h>
 
 /* Register Offset Definitions */
 #define XGPIO_DATA_OFFSET   (0x0)	/* Data register  */
@@ -38,6 +40,7 @@
  * @gpio_state: GPIO state shadow register
  * @gpio_dir: GPIO direction shadow register
  * @gpio_lock: Lock used for synchronization
+ * @clk: clock resource for this driver
  */
 struct xgpio_instance {
 	struct gpio_chip gc;
@@ -45,7 +48,8 @@ struct xgpio_instance {
 	unsigned int gpio_width[2];
 	u32 gpio_state[2];
 	u32 gpio_dir[2];
-	spinlock_t gpio_lock[2];
+	spinlock_t gpio_lock[2];	/* For serializing operations */
+	struct clk *clk;
 };
 
 static inline int xgpio_index(struct xgpio_instance *chip, int gpio)
@@ -256,6 +260,83 @@ static void xgpio_save_regs(struct xgpio_instance *chip)
 		       chip->gpio_dir[1]);
 }
 
+static int xgpio_request(struct gpio_chip *chip, unsigned int offset)
+{
+	int ret = pm_runtime_get_sync(chip->parent);
+
+	/*
+	 * If the device is already active pm_runtime_get() will return 1 on
+	 * success, but gpio_request still needs to return 0.
+	 */
+	return ret < 0 ? ret : 0;
+}
+
+static void xgpio_free(struct gpio_chip *chip, unsigned int offset)
+{
+	pm_runtime_put(chip->parent);
+}
+
+static int __maybe_unused xgpio_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct irq_data *data;
+	int irq = platform_get_irq(pdev, 0);
+
+	if (irq < 0) {
+		dev_info(&pdev->dev, "platform_get_irq returned %d\n", irq);
+		return irq;
+	}
+
+	data = irq_get_irq_data(irq);
+	if (!irqd_is_wakeup_set(data))
+		return pm_runtime_force_suspend(dev);
+
+	return 0;
+}
+
+static int __maybe_unused xgpio_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct irq_data *data;
+	int irq = platform_get_irq(pdev, 0);
+
+	if (irq < 0) {
+		dev_info(&pdev->dev, "platform_get_irq returned %d\n", irq);
+		return irq;
+	}
+
+	data = irq_get_irq_data(irq);
+
+	if (!irqd_is_wakeup_set(data))
+		return pm_runtime_force_resume(dev);
+
+	return 0;
+}
+
+static int __maybe_unused xgpio_runtime_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct xgpio_instance *gpio = platform_get_drvdata(pdev);
+
+	clk_disable(gpio->clk);
+
+	return 0;
+}
+
+static int __maybe_unused xgpio_runtime_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct xgpio_instance *gpio = platform_get_drvdata(pdev);
+
+	return clk_enable(gpio->clk);
+}
+
+static const struct dev_pm_ops xgpio_dev_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(xgpio_suspend, xgpio_resume)
+	SET_RUNTIME_PM_OPS(xgpio_runtime_suspend,
+			   xgpio_runtime_resume, NULL)
+};
+
 /**
  * xgpio_of_probe - Probe method for the GPIO device.
  * @pdev: pointer to the platform device
@@ -324,6 +405,8 @@ static int xgpio_probe(struct platform_device *pdev)
 	chip->gc.direction_output = xgpio_dir_out;
 	chip->gc.get = xgpio_get;
 	chip->gc.set = xgpio_set;
+	chip->gc.request = xgpio_request;
+	chip->gc.free = xgpio_free;
 	chip->gc.set_multiple = xgpio_set_multiple;
 
 	chip->gc.label = dev_name(&pdev->dev);
@@ -334,15 +417,38 @@ static int xgpio_probe(struct platform_device *pdev)
 		return PTR_ERR(chip->regs);
 	}
 
+	chip->clk = devm_clk_get_optional(&pdev->dev, "s_axi_aclk");
+	if (IS_ERR(chip->clk)) {
+		if (PTR_ERR(chip->clk) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Input clock not found\n");
+		return PTR_ERR(chip->clk);
+	}
+	status = clk_prepare_enable(chip->clk);
+	if (status < 0) {
+		dev_err(&pdev->dev, "Failed to prepare clk\n");
+		return status;
+	}
+	pm_runtime_enable(&pdev->dev);
+	status = pm_runtime_get_sync(&pdev->dev);
+	if (status < 0)
+		goto err_unprepare_clk;
+
 	xgpio_save_regs(chip);
 
 	status = devm_gpiochip_add_data(&pdev->dev, &chip->gc, chip);
 	if (status) {
 		dev_err(&pdev->dev, "failed to add GPIO chip\n");
-		return status;
+		goto err_pm_put;
 	}
 
+	pm_runtime_put(&pdev->dev);
 	return 0;
+err_pm_put:
+	pm_runtime_put(&pdev->dev);
+err_unprepare_clk:
+	pm_runtime_disable(&pdev->dev);
+	clk_unprepare(chip->clk);
+	return status;
 }
 
 static const struct of_device_id xgpio_of_match[] = {
@@ -357,6 +463,7 @@ static struct platform_driver xgpio_plat_driver = {
 	.driver		= {
 			.name = "gpio-xilinx",
 			.of_match_table	= xgpio_of_match,
+			.pm = &xgpio_dev_pm_ops,
 	},
 };
 
-- 
2.7.4

