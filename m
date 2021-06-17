Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 782383AB0E0
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jun 2021 12:05:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231818AbhFQKHe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Jun 2021 06:07:34 -0400
Received: from mail-dm6nam11on2045.outbound.protection.outlook.com ([40.107.223.45]:2463
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229901AbhFQKHd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Jun 2021 06:07:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCSnBdremj+nLcn3ZayYFwYDd0/Br63iwpUcp3s6LkNUhdXOJsMvizqFONs9/DMKUeSh4eg4GvjWjDZrpCG1VQI2oGUuuZ/q1dqTasM4nF4URAgYezNcnuULcRssafLrIPuMXZ7fU0fSd8spbF2jJ/+SHyYGb7YcrErE5qCePAEGBM2HTXPYDPFFQKq4zA2ZQE9phavEAGbUGd34RIJ6M+UR9eIjFXmEYfX6jxTWfk9XdSZLZD53U26dtRaon3HxbqSz9DOK0Pa4+bATCmnIBw2wzLwcqhBFvcHkUw6Z9xJwCBsQYo6GtuJlbk9FfjGF26O9Hi4brmrAQglDixW1yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvR/MUuGXc54WehSPmrasOmMvjphij/wReQWb98tung=;
 b=NeBh0yINjWsu63E//JlnMCDAJg7zBQPZ+Sbivr8TorJv/gNKFjOxEegJs7LNih17VbAGPjbZLJTcF5ASyU/UU5iAXUNkImEhK/JkpQOn7YBTJSIdCuQ1cZHFkavs4PG/nZsu3pDLWaXEvTorrcqxv/0103I/m7swONQ+zx/rlS/n/pX5IfMd7ZXdSaQsFTx5RikJIXLBbWiKsPPhIxsJg4CZTAvzs/OHndDRB+VhTAR9Ux6tnl/pAR2uqPbyBhkhHPHqLYeM/KiZ+PdwomXAnu8ltO2QCT1FpeuzBFoOfq0I+EmNT7HTWpBEa/8XCNRZeaZZxWYbbk1S6n2TmO0gzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvR/MUuGXc54WehSPmrasOmMvjphij/wReQWb98tung=;
 b=r2SzAluLiJX9E0j2xaFVxX/V847Ut76Lbh1vJgafOLlHb+Lam99e+mnUHkNzJ13txO2oTm8cDNrIX1Yn/8FD3mY5lb9Z9URLXkJUPwkzIClXLd+KsGqxN4h7s+ePQzjwW/QcKRy0riSKKIdwI+Us0Vp/WKuzj4IAc6ikbQbeam14JyHR1dlsYdQGpVH3FX9LcbQmpB/puWcfkAJpym4UsmoNCMnKU0ftDXGoVaXH0zYBORZvGWhnomijscB/Pd88J8xD8lk/WdxKeazzq+ZEPoTCA8/L4ZbOIg7iiGscBHcf+rEj8jcBSoo+vZJkhGwJUppRLkwB7YW6MxrGzdbjUA==
Received: from MWHPR21CA0040.namprd21.prod.outlook.com (2603:10b6:300:129::26)
 by BYAPR12MB3287.namprd12.prod.outlook.com (2603:10b6:a03:131::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Thu, 17 Jun
 2021 10:05:24 +0000
Received: from CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:129:cafe::bd) by MWHPR21CA0040.outlook.office365.com
 (2603:10b6:300:129::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.0 via Frontend
 Transport; Thu, 17 Jun 2021 10:05:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT004.mail.protection.outlook.com (10.13.175.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4242.16 via Frontend Transport; Thu, 17 Jun 2021 10:05:24 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 17 Jun
 2021 10:05:23 +0000
Received: from kyarlagadda-linux.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Jun 2021 03:05:20 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <akhilrajeev@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Suresh Mangipudi <smangipudi@nvidia.com>,
        Krishna Yarlagadda <kyarlagadda@nvidia.com>
Subject: [PATCH] gpio: tegra186: Add ACPI support
Date:   Thu, 17 Jun 2021 15:35:51 +0530
Message-ID: <1623924351-22489-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22a8c65d-bc49-4d90-ee4b-08d931776cc8
X-MS-TrafficTypeDiagnostic: BYAPR12MB3287:
X-Microsoft-Antispam-PRVS: <BYAPR12MB328700AE9818408639F18397C00E9@BYAPR12MB3287.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZlDT2lRBiVt0fR8V91KDtCePof6ju1S2oN2+wQzmTVmgOLCIemOXFpY7COPaKsPCQyogdJ6jnnX2Z7ZgIGGi5huj5Dy4Y9Y/fCdgXqi+VrOh3zGsCSn4ltyQreUe8hSgbvQLrMiWzs3TwkEhyDleaPVgXpPhTBs3DxZgFkXmQmRiIFyBJKC8AR+zoS/xQAkoIgUiQMSzkgEd4cuv0kfKs7N93N8FjlmTta2z3dxhPsv2yh7ajfl2Mw33WS3Vj6evGrA22F1sklfZE0+fkk1dImPfze20LUGPy3iM+UHsr+Vnm7pmT+xz4RxMaO40NjR0r3zpa7jumx7G68cg6J5W4rpW9PjY9OZu0mUFIGE/7HNmQ0pRe0YqjzA2eJGPkeKOSNqv93RQu6aY46kGGC+Yn94FbgEVI78jcdHG4XE6S8eTbuo0Q3JjpNZSaVIoaQww1BJJrUQdKCx8arkGjecNCTfk3zymWJEkT8fKWfdn8Vnlil5v159xCNM0LepEEpAVtcvsrWyeyqTr2wuK1X7OY9WhdW1wpcvt3EKRAJPqC+/HPJhLXtUbTLOJfEpkt7S0CJ5Ksabw7sktZLZ8MKMNYkQ3p5K+FZ3dsoTY1zrEgqZyZsqssSmQcx5UxdYaXHn7zQ0POtmAOXU8LBs0VEuJmzMM0C2RZ47VRLxldatQOi0=
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(36840700001)(46966006)(82740400003)(5660300002)(478600001)(70586007)(36756003)(356005)(8936002)(110136005)(47076005)(4326008)(36860700001)(70206006)(7696005)(86362001)(54906003)(2616005)(83380400001)(26005)(7636003)(6666004)(336012)(426003)(8676002)(6636002)(36906005)(316002)(2906002)(186003)(107886003)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 10:05:24.4583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a8c65d-bc49-4d90-ee4b-08d931776cc8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3287
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Akhil Rajeev <akhilrajeev@nvidia.com>

Add ACPI module ID to probe the driver from the ACPI based bootloader
firmware.

Signed-off-by: Akhil Rajeev <akhilrajeev@nvidia.com>
---

 drivers/gpio/gpio-tegra186.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 1bd9e44..c8051be 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -5,6 +5,7 @@
  * Author: Thierry Reding <treding@nvidia.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -620,13 +621,18 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	if (!gpio)
 		return -ENOMEM;
 
-	gpio->soc = of_device_get_match_data(&pdev->dev);
+	gpio->soc = device_get_match_data(&pdev->dev);
+	if (has_acpi_companion(&pdev->dev)) {
+		gpio->secure = devm_platform_ioremap_resource(pdev, 0);
+		gpio->base = devm_platform_ioremap_resource(pdev, 1);
+	} else {
+		gpio->secure = devm_platform_ioremap_resource_byname(pdev, "security");
+		gpio->base = devm_platform_ioremap_resource_byname(pdev, "gpio");
+	}
 
-	gpio->secure = devm_platform_ioremap_resource_byname(pdev, "security");
 	if (IS_ERR(gpio->secure))
 		return PTR_ERR(gpio->secure);
 
-	gpio->base = devm_platform_ioremap_resource_byname(pdev, "gpio");
 	if (IS_ERR(gpio->base))
 		return PTR_ERR(gpio->base);
 
@@ -690,11 +696,15 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 
 	gpio->gpio.names = (const char * const *)names;
 
-	gpio->gpio.of_node = pdev->dev.of_node;
-	gpio->gpio.of_gpio_n_cells = 2;
-	gpio->gpio.of_xlate = tegra186_gpio_of_xlate;
 
-	gpio->intc.name = pdev->dev.of_node->name;
+	if (!has_acpi_companion(&pdev->dev)) {
+		gpio->gpio.of_node = pdev->dev.of_node;
+		gpio->gpio.of_gpio_n_cells = 2;
+		gpio->gpio.of_xlate = tegra186_gpio_of_xlate;
+		gpio->intc.name = pdev->dev.of_node->name;
+	} else {
+		gpio->intc.name = gpio->soc->name;
+	}
 	gpio->intc.irq_ack = tegra186_irq_ack;
 	gpio->intc.irq_mask = tegra186_irq_mask;
 	gpio->intc.irq_unmask = tegra186_irq_unmask;
@@ -918,10 +928,21 @@ static const struct of_device_id tegra186_gpio_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra186_gpio_of_match);
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id tegra186_gpio_acpi_match[] = {
+	{ .id = "NVDA0108", .driver_data = (kernel_ulong_t)&tegra186_main_soc },
+	{ .id = "NVDA0208", .driver_data = (kernel_ulong_t)&tegra186_aon_soc },
+	{ .id = "NVDA0308", .driver_data = (kernel_ulong_t)&tegra194_main_soc },
+	{ .id = "NVDA0408", .driver_data = (kernel_ulong_t)&tegra194_aon_soc },
+};
+MODULE_DEVICE_TABLE(acpi, tegra186_gpio_acpi_match);
+#endif
+
 static struct platform_driver tegra186_gpio_driver = {
 	.driver = {
 		.name = "tegra186-gpio",
 		.of_match_table = tegra186_gpio_of_match,
+		.acpi_match_table = ACPI_PTR(tegra186_gpio_acpi_match),
 	},
 	.probe = tegra186_gpio_probe,
 	.remove = tegra186_gpio_remove,
-- 
2.7.4

