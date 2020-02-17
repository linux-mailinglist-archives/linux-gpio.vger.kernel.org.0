Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0A6161079
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2020 11:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727503AbgBQK5k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Feb 2020 05:57:40 -0500
Received: from mail-bn8nam11on2056.outbound.protection.outlook.com ([40.107.236.56]:23521
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728483AbgBQK5k (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 Feb 2020 05:57:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGVQK8PGVE5J/8YYCgpEoTHw5yxcTdWiTHhWYIJIcSVOfPFH1xo/2MV3JdVcwE7hVMqKAb4ot5/sR4ILafF1PWeG1Nn3NoDdYtQ9ELjPc/njR0tmfXfgb1PsjmUbTnTgkT3mFelqHSqA4LaECKwvsJ81sAzpfpfY2rMoclUqW3td9rEgplCpXvlR2Uh+eNlk9vtL9YdfSEsWvuc0b4IzFPuZd4fHHH5wKmC9lkbgLzqh2a/K6sBu9eOhsfI1Yz84t6azzk3YkQxULlid4oSI440/JU20uGXEHBSvLJwvh+nt4C5AjeYgy3pp/jI4953KMA7cNNQ2Gd8mw82Dk+E2Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tk3yVsQBsnFHfK+lPLe1x0LU3dcCu+pYoqlAKp4CdoE=;
 b=e9wghSQH7ajJ/l3dbJhig3i2yc/reDWNFyn1rFpT9L1rgzPZ73XvFV5USTi/0wq+qRgjhtmiQ2CNLdDfIxlRZW0eqKmgdULwJY0P474UBOL6jgfIdEzt3PVaO+CsiN5FW+TUVfBx/N1GaYq6LdocIoGInbv0sgNp6+CWglBf4O6FNBng0vKoGu1cnhUeHQDGhiAR5EexPk2sZEfMcX6Mvg8Bwshkm/lsa+hM4ceyavg9wOA7oY1xAa6I6CcVEbGkYOoLc1MW+eO2u1ETLx5j/1kd2LmKBY4wlPT8atG3kVQKimlYgMyAZnBYRAk1xQiFq8JzD1XPxU0nUZy8a45xTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tk3yVsQBsnFHfK+lPLe1x0LU3dcCu+pYoqlAKp4CdoE=;
 b=kSHe2PDaNUzZt0kJto399I1cYU6ugUIikCsu1UUaqMMmWFTOE2PQcj/EM33YkpCih+xDbVlJ1WjfZigwcRb2oVRLBVYXf9C/Hzelf3JrrKFGPvQA7uJiZl08XNmpXvD5bjjEz93jhsDzE36rXULj8TnfJElCJHgwDxnkpDBL9X4=
Received: from CH2PR02CA0030.namprd02.prod.outlook.com (2603:10b6:610:4e::40)
 by DM5PR02MB3862.namprd02.prod.outlook.com (2603:10b6:4:b1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.29; Mon, 17 Feb
 2020 10:57:35 +0000
Received: from BL2NAM02FT012.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::204) by CH2PR02CA0030.outlook.office365.com
 (2603:10b6:610:4e::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.24 via Frontend
 Transport; Mon, 17 Feb 2020 10:57:35 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT012.mail.protection.outlook.com (10.152.77.27) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2729.22
 via Frontend Transport; Mon, 17 Feb 2020 10:57:35 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j3e5m-0007sK-MC; Mon, 17 Feb 2020 02:57:34 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j3e5h-0000pT-J6; Mon, 17 Feb 2020 02:57:29 -0800
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 01HAvMlE025973;
        Mon, 17 Feb 2020 02:57:22 -0800
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1j3e5a-0000oP-1A; Mon, 17 Feb 2020 02:57:22 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     bgolaszewski@baylibre.com, michal.simek@xilinx.com,
        shubhrajyoti.datta@xilinx.com, sgoud@xilinx.com
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        git@xilinx.com
Subject: [PATCH 1/2] gpio: xilinx: Add clock adaptation support
Date:   Mon, 17 Feb 2020 16:27:18 +0530
Message-Id: <1581937039-12964-1-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(136003)(346002)(39850400004)(189003)(199004)(44832011)(9786002)(5660300002)(6666004)(8936002)(81166006)(6636002)(336012)(8676002)(356004)(81156014)(426003)(2906002)(186003)(26005)(36756003)(478600001)(7696005)(70586007)(316002)(2616005)(107886003)(4326008)(70206006);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR02MB3862;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 239b1cfe-89c4-4fab-7d3e-08d7b3983233
X-MS-TrafficTypeDiagnostic: DM5PR02MB3862:
X-Microsoft-Antispam-PRVS: <DM5PR02MB3862003C847D0EBCF2CCB420AF160@DM5PR02MB3862.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0316567485
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wURzcLxoZCinmwUdbhx1C0EQ0UEgaCQPyG2VA75C/PpN6FapsDF/pge4Od/ML1MNybPKEJkdsLvTWrXBfMjygK4fZZ8SoO2XvvgA5YYWujZEtzQeIJv1g+6jEe9yZumzAS6xnpLOBQIfkah8jJiuM+xb8iEstabvrBgLfCg9PfDiaCJbuHPKT1r7fGj3BNLkctmiOr/2bwBU9VLPyCpNR6vQMxX0Jk5C8f+Eu5tN9NapvC0kO9DtstTCYWtM8qB7ogFMUzKKpLoS7dPUmYJC1f3tdA5Ozg7s2wOrRa8BjlonZfZIjIuEdj4AfnPcZFKfWoStZIbqvR+uo9wMUM6jnULwYJeVewK20/B1PxQBzJF6OIv7nSUnzh93SWGF9lrIgfUUdOvEPkqHoA5wGH41jNqVAyx+6bGbd+KTPzTaMUxTmi8sGaHRYmGN0ss/8gh4
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2020 10:57:35.2448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 239b1cfe-89c4-4fab-7d3e-08d7b3983233
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3862
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support of clock adaptation for AXI GPIO driver.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
 drivers/gpio/gpio-xilinx.c | 105 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 103 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index a9748b5198e6..26753ae58295 100644
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
@@ -255,6 +259,70 @@ static void xgpio_save_regs(struct xgpio_instance *chip)
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
+	int irq = platform_get_irq(pdev, 0);
+	struct irq_data *data = irq_get_irq_data(irq);
+
+	if (!irqd_is_wakeup_set(data))
+		return pm_runtime_force_suspend(dev);
+
+	return 0;
+}
+
+static int __maybe_unused xgpio_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	int irq = platform_get_irq(pdev, 0);
+	struct irq_data *data = irq_get_irq_data(irq);
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
@@ -323,6 +391,8 @@ static int xgpio_probe(struct platform_device *pdev)
 	chip->gc.direction_output = xgpio_dir_out;
 	chip->gc.get = xgpio_get;
 	chip->gc.set = xgpio_set;
+	chip->gc.request = xgpio_request;
+	chip->gc.free = xgpio_free;
 	chip->gc.set_multiple = xgpio_set_multiple;
 
 	chip->gc.label = dev_name(&pdev->dev);
@@ -333,15 +403,45 @@ static int xgpio_probe(struct platform_device *pdev)
 		return PTR_ERR(chip->regs);
 	}
 
+	chip->clk = devm_clk_get(&pdev->dev, "s_axi_aclk");
+	if (IS_ERR(chip->clk)) {
+		if (PTR_ERR(chip->clk) != -ENOENT) {
+			if (PTR_ERR(chip->clk) != -EPROBE_DEFER)
+				dev_err(&pdev->dev, "Input clock not found\n");
+			return PTR_ERR(chip->clk);
+		}
+		/*
+		 * Clock framework support is optional, continue on
+		 * anyways if we don't find a matching clock.
+		 */
+		chip->clk = NULL;
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
@@ -356,6 +456,7 @@ static struct platform_driver xgpio_plat_driver = {
 	.driver		= {
 			.name = "gpio-xilinx",
 			.of_match_table	= xgpio_of_match,
+			.pm = &xgpio_dev_pm_ops,
 	},
 };
 
-- 
2.7.4

