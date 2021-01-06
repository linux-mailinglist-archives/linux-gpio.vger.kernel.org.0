Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 228F22EBDB9
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jan 2021 13:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725803AbhAFM2x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jan 2021 07:28:53 -0500
Received: from mail-bn7nam10on2046.outbound.protection.outlook.com ([40.107.92.46]:3008
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725906AbhAFM2x (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 Jan 2021 07:28:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgTfh4qaeWhg4gyfKngyVRmZfLOKzwFKm0NSFd2BFE+oWvPhJJnCcQvlOjRhxNcscY4esx9/Mb6IJiCDIzwWx8txu+iRzhduZURMiIypEssklqoB66yBEXpeh1FxP2WfTW2to2mLQmPrsvePUePpYTRikGYpIts0U1Z7tuXVpr9fXit9IS+6X8Be9dGJv6/BmQnuu6EZVcVokIAQ+rEKcnuSjxAvkqbilx4ArtqBzCLj+aAwghAulThfJXXucz0pBPVVwcp9lxGnXJhEmWuugDLYJf5FlrH64xm+Pm+sfaVfkwbo8BALn4iY0T+ddTEo+lsYCqWiqBLuPbvdlwNaJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3a43z390rNApOelGFi85e6oLTFYheMRxMaVFWf7aieU=;
 b=hecxGmb0dBUJUJL77/A1QWTlPyTvA973jjUM9K7TceB7GKS32SxiSq0ifTinhTwurzXNksoHq9H2UakMtUitL7N6m12wgx59r0ckRqHfbgd3/P39LiY5YIdZWwzIX50QfV0bhU1s1XJUo9JaGfWTYv3SIoUMXWcK3hwPWrviNwcCX5B1rkvQxcR87T/i074QOudkOBd/tIgUKMoKd6IKmF0lhxxAXyAZB7XtDMXfBOJViMQeBfdfFCeato28TARicTQo7PjjL5afLmfU32TilarlelkAZrynJbINKxFbzfxfQ1j5tGvUPKdODUKda+6T2/QqDNFdnkl/OWTW/UCP7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3a43z390rNApOelGFi85e6oLTFYheMRxMaVFWf7aieU=;
 b=npUazSIoTORyhzpOkYkunSkULwEFKbu/h/Mp0T+CiOY/HlW1e3dFYPr84glhb+ua2w/iKd6xXZQo+G9UpQlE7KxVHeE5QoIxvIswxbI8A+vwWkcjh2a4Ejl18H27glEFexwkIgQ//NfGk3ZEVupqI1+AGSwIDJklgoR8YtD+mhY=
Received: from CY4PR18CA0069.namprd18.prod.outlook.com (2603:10b6:903:13f::31)
 by PH0PR02MB7719.namprd02.prod.outlook.com (2603:10b6:510:4e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 6 Jan
 2021 12:27:28 +0000
Received: from CY1NAM02FT003.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:13f:cafe::f4) by CY4PR18CA0069.outlook.office365.com
 (2603:10b6:903:13f::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Wed, 6 Jan 2021 12:27:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT003.mail.protection.outlook.com (10.152.74.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3742.6 via Frontend Transport; Wed, 6 Jan 2021 12:27:27 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 6 Jan 2021 04:27:06 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 6 Jan 2021 04:27:06 -0800
Envelope-to: git@xilinx.com,
 michal.simek@xilinx.com,
 linus.walleij@linaro.org,
 bgolaszewski@baylibre.com,
 hancock@sedsystems.ca,
 vilhelm.gray@gmail.com,
 syednwaris@gmail.com,
 linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [10.140.6.6] (port=49550 helo=xhdappanad40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1kx7u5-0003Ag-8v; Wed, 06 Jan 2021 04:27:05 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <michal.simek@xilinx.com>, <shubhrajyoti.datta@xilinx.com>,
        <sgoud@xilinx.com>, <hancock@sedsystems.ca>,
        <vilhelm.gray@gmail.com>, <syednwaris@gmail.com>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH V4 4/5] gpio: gpio-xilinx: Add support for suspend and resume
Date:   Wed, 6 Jan 2021 17:56:39 +0530
Message-ID: <1609936000-28378-5-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609936000-28378-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1609936000-28378-1-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0d80a5e-d279-4ed7-ce7b-08d8b23e6e34
X-MS-TrafficTypeDiagnostic: PH0PR02MB7719:
X-Microsoft-Antispam-PRVS: <PH0PR02MB7719D45B155CBC6578811E9AAFD00@PH0PR02MB7719.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rs7Jftqf/iQCyy9K9m4zbzUYQ2djQyQp5KR7id3AM4nMPe5YEozsnuu3I+1FsTinDfQevIuiqQu1JWtWpU30U1cjOW2PlXRSXYvz9Hc6e3o+ZueJbfwrFb8e7LVOoRA6WNLXEhmzBfETpTsYkYygcBJUaeoDr587jagvB9IsVYd/EZDRPdCP+i30qAGL7vTdbnQnkfy/iYHVKADOI5y6c3MxTWLLjVusPFgCAtqywSr6mKcZdECraHVravcwZUdiCKg4cfrJBmNFfFDlc2wBXa6VjNVGYyNkoaRZtRn1BW592nClNmiLoogS4w3KaX4KETG64gkpj2nth4xzjrd0tbR1iTfxWAuC7lxo4htNy2hF/TIvzFTpW95fip1NkrKo6Z41WUZVud3ITa5eXq6Z2lGVzRVkqny71Sg46QQ+3gy920dvf/qFlatvmTCezn0+lWZa/7lBQY4/yCMBCpgMspNNypQC13JNN4CJ62myrtA=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(136003)(376002)(46966006)(36756003)(4326008)(316002)(110136005)(36906005)(7636003)(82310400003)(54906003)(356005)(83380400001)(5660300002)(8936002)(2906002)(9786002)(15650500001)(47076005)(107886003)(6666004)(70586007)(336012)(70206006)(2616005)(426003)(478600001)(26005)(82740400003)(44832011)(186003)(8676002)(7696005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 12:27:27.8966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d80a5e-d279-4ed7-ce7b-08d8b23e6e34
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT003.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7719
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for suspend and resume, pm runtime suspend and resume.
Added free and request calls.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
Changes in V4:
-Adjust code to remove conflicts.
Changes in V3:
-Created new patch for suspend and resume.
---
 drivers/gpio/gpio-xilinx.c | 94 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 90 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 437c50e72aa1..e47ae08167f8 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -17,6 +17,7 @@
 #include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
 /* Register Offset Definitions */
@@ -277,6 +278,39 @@ static void xgpio_save_regs(struct xgpio_instance *chip)
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
  * xgpio_remove - Remove method for the GPIO device.
  * @pdev: pointer to the platform device
@@ -289,7 +323,10 @@ static int xgpio_remove(struct platform_device *pdev)
 {
 	struct xgpio_instance *gpio = platform_get_drvdata(pdev);
 
-	clk_disable_unprepare(gpio->clk);
+	if (!pm_runtime_suspended(&pdev->dev))
+		clk_disable_unprepare(gpio->clk);
+
+	pm_runtime_disable(&pdev->dev);
 
 	return 0;
 }
@@ -304,6 +341,46 @@ static void xgpio_irq_ack(struct irq_data *irq_data)
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
@@ -548,6 +625,8 @@ static int xgpio_probe(struct platform_device *pdev)
 	chip->gc.of_gpio_n_cells = cells;
 	chip->gc.get = xgpio_get;
 	chip->gc.set = xgpio_set;
+	chip->gc.request = xgpio_request;
+	chip->gc.free = xgpio_free;
 	chip->gc.set_multiple = xgpio_set_multiple;
 
 	chip->gc.label = dev_name(&pdev->dev);
@@ -567,6 +646,9 @@ static int xgpio_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Failed to prepare clk\n");
 		return status;
 	}
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
 
 	xgpio_save_regs(chip);
 
@@ -591,7 +673,7 @@ static int xgpio_probe(struct platform_device *pdev)
 				     GFP_KERNEL);
 	if (!girq->parents) {
 		status = -ENOMEM;
-		goto err_unprepare_clk;
+		goto err_pm_put;
 	}
 	girq->parents[0] = chip->irq;
 	girq->default_type = IRQ_TYPE_NONE;
@@ -601,12 +683,15 @@ static int xgpio_probe(struct platform_device *pdev)
 	status = devm_gpiochip_add_data(&pdev->dev, &chip->gc, chip);
 	if (status) {
 		dev_err(&pdev->dev, "failed to add GPIO chip\n");
-		goto err_unprepare_clk;
+		goto err_pm_put;
 	}
 
+	pm_runtime_put(&pdev->dev);
 	return 0;
 
-err_unprepare_clk:
+err_pm_put:
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 	clk_disable_unprepare(chip->clk);
 	return status;
 }
@@ -624,6 +709,7 @@ static struct platform_driver xgpio_plat_driver = {
 	.driver		= {
 			.name = "gpio-xilinx",
 			.of_match_table	= xgpio_of_match,
+			.pm = &xgpio_dev_pm_ops,
 	},
 };
 
-- 
2.7.4

