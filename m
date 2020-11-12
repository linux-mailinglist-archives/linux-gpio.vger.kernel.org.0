Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85BE02B0B0E
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 18:13:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbgKLRNk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 12:13:40 -0500
Received: from mail-dm6nam12on2084.outbound.protection.outlook.com ([40.107.243.84]:15425
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726037AbgKLRNk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 12:13:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hfy8D/AkfQuFAaR4MLMRCreZhIQn2PKpIBitRGnuZlAZAIHM+MY23BhXZrqQE5XtcyvL0w89tHeqA0LDlNmnQ2KUJ+712OS5vmqiEWlI851gBrBEDP1tV4F5KkqJF55Tck3Aaqnte7cb4Zy4GCTv8aqaL2SWSv+8MmoBhyR5UiJ6ECdMA+qOURssHlWiXIXUBT0uYcqZzUeSi2eYoi2DmQeyn3YO/P8scqLV/je3ozZjZR+oQ8Dc1GvZymutGXq+WBZNXAODv1H9aiQfng+wQ6YFW9ptCE37NhgeR01yRrUUw/G9NM/OzLufYxyS9PGVHyhWCg0tp4JD6W1Oh7GBzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FD3vj/7D9zP1NIiCqkGTBMTgHxt4w8sHGxe7oNE4zI=;
 b=KYNKMJAY6PmZc+TwIPnHrCRGZnsIsje1K2irGTffVgtYdS4WmwOI3rkfDAhHeq+M6ahNcs6tbVH6r+EOPk5Sc3Z3P/Ned/lzbYzRgQXo0WeKTnzYPUHMV1tLiSlpezMBxdDChIlY+Lf7PLbEpCE4SeX2P/gCR8Jud2rbizPyy11eqjM83nlOfx39D2zd4tRlIJHkhxOrlipwzI6hm6QiA7y5xWV2lYXdQ/yli7wohq4Il9MS+JUp8r1OFZF+Yqfsaey/3DtDuS56VviDclVh1uvrTg6GXj9HdU1R7QYNXIK4BYvMUzDdkk5bi/XdvGc5b0p5xKtEGXp6HIRQG29srg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FD3vj/7D9zP1NIiCqkGTBMTgHxt4w8sHGxe7oNE4zI=;
 b=fxax58bB1W8QFp4wo57FG1voTH6NJlvSsu26euJO03X7IDf752bin1HjTOemOB8c0o5ftyyJPipT64Ndqn2kVMEvUIIR++9982FpA+Oy6Bkeskh25tmYE0ZQEXYowX2e8fS87/zBDqIHVQihL6bQHF3YODgAqzn6DVcwK0cJRfg=
Received: from BL1PR13CA0266.namprd13.prod.outlook.com (2603:10b6:208:2ba::31)
 by SN6PR02MB4479.namprd02.prod.outlook.com (2603:10b6:805:a3::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.23; Thu, 12 Nov
 2020 17:13:36 +0000
Received: from BL2NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2ba:cafe::98) by BL1PR13CA0266.outlook.office365.com
 (2603:10b6:208:2ba::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.13 via Frontend
 Transport; Thu, 12 Nov 2020 17:13:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT008.mail.protection.outlook.com (10.152.76.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Thu, 12 Nov 2020 17:13:35 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 12 Nov 2020 09:12:57 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 12 Nov 2020 09:12:57 -0800
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
        id 1kdG9Y-0005SG-Cx; Thu, 12 Nov 2020 09:12:56 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <michal.simek@xilinx.com>, <shubhrajyoti.datta@xilinx.com>,
        <sgoud@xilinx.com>, <hancock@sedsystems.ca>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [LINUX PATCH V3 7/9] gpio: gpio-xilinx: Add support for suspend and resume
Date:   Thu, 12 Nov 2020 22:42:26 +0530
Message-ID: <1605201148-4508-8-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a6f51e1-ea0a-431c-059d-08d8872e4a7d
X-MS-TrafficTypeDiagnostic: SN6PR02MB4479:
X-Microsoft-Antispam-PRVS: <SN6PR02MB4479CD035EA5101FBC92C61BAFE70@SN6PR02MB4479.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hhss36DYD48krNzg6XDE+JHKWwYvpfL8l7LptZ2bkmGqZm8Uyf95ffq6nr3zC5Tzj2C+PZlo7gkJ/enpJFzcIusfHoGWuE9x9lkIo9Wpt6mHeJJm9dGOiV+j0w9CbDsgsnY8yP/2fj000RV5nzLvFeInogQK1O2IFo/Xrx+iG+NDOsYfeP5SqwbPGo3+3ddlyzkAC4yOoaBd7c07Nio2esiWs0TgyTg9Qbkznn+nMHM3PBMG3CJeEtQ2KUGoMGn8C7HxVeyylAwhVMFc0jot5nm8nkWBKFVKuyI44uOzaDjtIPhHOugUM752B1FHlrF8GiaKO7AnsZsZsM8orDJ74z3Kz2XcDzp95oW0RK6jiFRzZJv9orE4Xeh4z4NjqBr1RmIJhAI7z4LdvlH4lT52fGTZ7p6BTjzxR+j256wrjRI=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966005)(15650500001)(316002)(107886003)(478600001)(110136005)(186003)(336012)(6666004)(36906005)(5660300002)(54906003)(36756003)(8676002)(426003)(44832011)(356005)(4326008)(7636003)(2616005)(83380400001)(7696005)(26005)(2906002)(47076004)(82740400003)(70206006)(70586007)(9786002)(8936002)(82310400003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 17:13:35.9468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6f51e1-ea0a-431c-059d-08d8872e4a7d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT008.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4479
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for suspend and resume, pm runtime suspend and resume.
Added free and request calls.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
Changes in V3:
-Created new patch for suspend and resume.
---
 drivers/gpio/gpio-xilinx.c | 89 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 87 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 9abef56eca32..48f2a6c894f5 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -17,6 +17,7 @@
 #include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
 /* Register Offset Definitions */
@@ -275,6 +276,39 @@ static void xgpio_save_regs(struct xgpio_instance *chip)
 		       chip->gpio_dir[1]);
 }
 
+static int xgpio_request(struct gpio_chip *chip, unsigned int offset)
+{
+	int ret;
+
+	ret = pm_runtime_get_sync(chip->parent);
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
+	struct xgpio_instance *gpio = dev_get_drvdata(dev);
+	struct irq_data *data = irq_get_irq_data(gpio->irq);
+
+	if (!data) {
+		dev_err(dev, "irq_get_irq_data() failed\n");
+		return -EINVAL;
+	}
+
+	if (!irqd_is_wakeup_set(data))
+		return pm_runtime_force_suspend(dev);
+
+	return 0;
+}
+
 /**
  * xgpio_irq_ack - Acknowledge a child GPIO interrupt.
  * @irq_data: per IRQ and chip data passed down to chip functions
@@ -285,6 +319,46 @@ static void xgpio_irq_ack(struct irq_data *irq_data)
 {
 }
 
+static int __maybe_unused xgpio_resume(struct device *dev)
+{
+	struct xgpio_instance *gpio = dev_get_drvdata(dev);
+	struct irq_data *data = irq_get_irq_data(gpio->irq);
+
+	if (!data) {
+		dev_err(dev, "irq_get_irq_data() failed\n");
+		return -EINVAL;
+	}
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
  * xgpio_irq_mask - Write the specified signal of the GPIO device.
  * @irq_data: per IRQ and chip data passed down to chip functions
@@ -544,6 +618,8 @@ static int xgpio_probe(struct platform_device *pdev)
 	chip->gc.of_gpio_n_cells = cells;
 	chip->gc.get = xgpio_get;
 	chip->gc.set = xgpio_set;
+	chip->gc.request = xgpio_request;
+	chip->gc.free = xgpio_free;
 	chip->gc.set_multiple = xgpio_set_multiple;
 
 	chip->gc.label = dev_name(&pdev->dev);
@@ -566,6 +642,10 @@ static int xgpio_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Failed to prepare clk\n");
 		return status;
 	}
+	pm_runtime_enable(&pdev->dev);
+	status = pm_runtime_get_sync(&pdev->dev);
+	if (status < 0)
+		goto err_unprepare_clk;
 
 	xgpio_save_regs(chip);
 
@@ -590,7 +670,7 @@ static int xgpio_probe(struct platform_device *pdev)
 				     GFP_KERNEL);
 	if (!girq->parents) {
 		status = -ENOMEM;
-		goto err_unprepare_clk;
+		goto err_pm_put;
 	}
 	girq->parents[0] = chip->irq;
 	girq->default_type = IRQ_TYPE_NONE;
@@ -600,12 +680,16 @@ static int xgpio_probe(struct platform_device *pdev)
 	status = devm_gpiochip_add_data(&pdev->dev, &chip->gc, chip);
 	if (status) {
 		dev_err(&pdev->dev, "failed to add GPIO chip\n");
-		goto err_unprepare_clk;
+		goto err_pm_put;
 	}
 
+	pm_runtime_put(&pdev->dev);
 	return 0;
 
+err_pm_put:
+	pm_runtime_put_sync(&pdev->dev);
 err_unprepare_clk:
+	pm_runtime_disable(&pdev->dev);
 	clk_disable_unprepare(chip->clk);
 	return status;
 }
@@ -623,6 +707,7 @@ static struct platform_driver xgpio_plat_driver = {
 	.driver		= {
 			.name = "gpio-xilinx",
 			.of_match_table	= xgpio_of_match,
+			.pm = &xgpio_dev_pm_ops,
 	},
 };
 
-- 
2.7.4

