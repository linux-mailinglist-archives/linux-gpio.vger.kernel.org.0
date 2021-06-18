Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5140F3ACC71
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jun 2021 15:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232298AbhFRNl4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Jun 2021 09:41:56 -0400
Received: from mail-dm6nam08on2079.outbound.protection.outlook.com ([40.107.102.79]:56801
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232089AbhFRNl4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 18 Jun 2021 09:41:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qb7VpY70ms7SkdLpYiJ/X5F9Bo9ptvOw9N8MH6HFjLcHzDHEUR/vOsthM9BsrLKP8i0SWjdIPVhUyZwar6wDLVSDodokGJ3ust6Ts1rIadxjQU8ThN3GZoxPfL9uCPNlWNSRucLKkkWYxoWI5ExyCjD0OasAyjc8yrXOO/CtcoqijDj1yWVUAb/PyMILbAKf0eZP78mZkMiquWNKKrASiHiQCzZ6erCHm70Ig+xhLiIfi5bcKKH5pigkyUqzhTNZdrqaX0NqjUQ93Mnv4S3P6xVDsIcQIHP1K8GV0RTuLUaE7AugVmJjJ74hy94up5d7j7ZQC60ozyVgecEjfyGRzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2urixiQKIGk8wdkJzjwZvnlZCA9Lh7keSKR7c17Jg0=;
 b=WsJ95dy6xezv9W73FGp0zZpsT99R0O5Wj3OBAc7ZtswbOOsx/oxQEgDwJRUabmY7DTcEqN1AefcKTVAnn0I2h30JnLSn9yC3kEeiX0mOh8//fRQPhgO7sTF4yH0idI5DPyHhTfbUZYfsfzIVpyNkahB2cNW6FfaQqugLZfnct80ehc8jKeF2ADUdEGgyr5opya5/9JOqJ/3UIE+ADWlAvMonVHGbTEUkx7c1t3GxIo5kkFRKujMKzeXFRFF2n2FwbF2FqusnuObW7oKHKiPjA0dKKwpzhoGeDrw05zRYLeCU+thruOHiSV6BPmq8qU5joEk26jwxKIlAokN8PdtRxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2urixiQKIGk8wdkJzjwZvnlZCA9Lh7keSKR7c17Jg0=;
 b=sQImgzFjuu0DAhOWbO1yyZc7p/c7QJTLm3mBlzQlO4rG4HNcHbc6H1jQdT/Z4uKh9R7OfS9wc9/MTMFkdtC33sk6bS+0kGlpDRyHeR7UPyrzFKejdbHSarRoYy7oxovuGaXS2Q4wPd/fVQF89odO+S9vsBxcNxxuSVGh1z8h4v/YVyXpZcRbi3RuPowEmKL+5X4RuzqqaZiP0Rovkb0vY7KMq14WJMy7EzhPvNWxZoX5RxS/NMz2JMbFDo7NRTVT+iYwG/P7s5kLD5nlFT43euHKlGkxYKRgMLrE9TuJhyf3oQ7xx/OrooWvGxXyGv1QJ05Lizu2RZ/cmQrvnKVVQA==
Received: from DM3PR12CA0084.namprd12.prod.outlook.com (2603:10b6:0:57::28) by
 SA0PR12MB4559.namprd12.prod.outlook.com (2603:10b6:806:9e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16; Fri, 18 Jun 2021 13:39:46 +0000
Received: from DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:57:cafe::f4) by DM3PR12CA0084.outlook.office365.com
 (2603:10b6:0:57::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15 via Frontend
 Transport; Fri, 18 Jun 2021 13:39:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT037.mail.protection.outlook.com (10.13.172.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4242.16 via Frontend Transport; Fri, 18 Jun 2021 13:39:45 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 18 Jun
 2021 13:39:45 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 18 Jun
 2021 13:39:44 +0000
Received: from kyarlagadda-linux.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Jun 2021 06:39:41 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <andy.shevchenko@gmail.com>
CC:     <akhilrajeev@nvidia.com>, <bgolaszewski@baylibre.com>,
        <jonathanh@nvidia.com>, <kyarlagadda@nvidia.com>,
        <ldewangan@nvidia.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <mperttunen@nvidia.com>,
        <smangipudi@nvidia.com>, <thierry.reding@gmail.com>
Subject: [PATCH v2] gpio: tegra186: Add ACPI support
Date:   Fri, 18 Jun 2021 19:09:47 +0530
Message-ID: <1624023587-7344-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAHp75VdBQUv+yri453KGGBz5ynd0pETxdOngCgPe3mbG22sLXQ@mail.gmail.com>
References: <CAHp75VdBQUv+yri453KGGBz5ynd0pETxdOngCgPe3mbG22sLXQ@mail.gmail.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c8415cf-d0b1-4a12-4490-08d9325e890d
X-MS-TrafficTypeDiagnostic: SA0PR12MB4559:
X-Microsoft-Antispam-PRVS: <SA0PR12MB45598E03964A27DB77891C33C00D9@SA0PR12MB4559.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Me1qXvpWpQE8OhTWKAnHXQ23LW1X3uA65sewJQg5x9F+us/LD19mRDlfSq03ZqwEIyFaZzAtXOX9lb+t0Xgyl6KwoJMX9TqNPsQ1/3RP0IG7c+9x9eXns0087i85uMXfUFYNvU8xPA1+TX4D1JQ/5JY7tMUipPG0sUNRzPVoopb1CmEnMPkwZZ/QN59+AfnPIVyqK9OK3QEmaMlBpo2WUsSugdgFn8F8Lc7TQFmX3Q6okf9V3veHGbkrhVyalGrnWFjgpfky7+MknXgOd5/sP503ij3hKE+t44GO4fYNHrCFip9Yx2q505CmEjSpooQtJd1HrHZSR5A9+oYZiwD3ltvIeufGVg0/VczHLrpSJRiEFqPNz3G0ZSg9vUqBMsbE6jF6C2M5PBxm2GiOgkCuWpE5nvLA/MQh0zZKVgqWkaAeiq9JJ3AG4VA5K+mgqp9PSYrCyopBiamEml9hjhc6djG3xboDSihtvk8xBIvdNE2HhKE1as44Cn2W91eTg0JgwxUUK6JgP33RtfsUcFcgaGqPnJeA05SAcOMkqGUHuE+tLXHsruw2Jh9vadea1z5D08A7d4ruyc5Savvgng71vEHzuKaPdXvlsomjvhvZxlFETaueOfRMvaBylILTwOjfjkXWG/tu5Ero24IBgGm2IJFCXKPsLqkel4aeoK28eEI=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(46966006)(36840700001)(478600001)(70586007)(2906002)(186003)(36906005)(4326008)(6916009)(36860700001)(336012)(70206006)(7696005)(54906003)(316002)(82310400003)(26005)(47076005)(356005)(8936002)(82740400003)(36756003)(8676002)(83380400001)(7636003)(2616005)(5660300002)(426003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 13:39:45.6199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8415cf-d0b1-4a12-4490-08d9325e890d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4559
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Akhil Rajeev <akhilrajeev@nvidia.com>

Add ACPI module ID to probe the driver from the ACPI based bootloader
firmware.

Signed-off-by: Akhil Rajeev <akhilrajeev@nvidia.com>
---
v2 changes:
	* fallback to find resource by index if name is not found to support ACPI.
	* removed #ifdef and ACPI_PTR.
	* Apparently, acpi.h is required to support changes @@ -690,11 +697,15 

 drivers/gpio/gpio-tegra186.c | 40 ++++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 1bd9e44..fa1295a 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -5,6 +5,7 @@
  * Author: Thierry Reding <treding@nvidia.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -620,15 +621,21 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	if (!gpio)
 		return -ENOMEM;
 
-	gpio->soc = of_device_get_match_data(&pdev->dev);
+	gpio->soc = device_get_match_data(&pdev->dev);
 
 	gpio->secure = devm_platform_ioremap_resource_byname(pdev, "security");
-	if (IS_ERR(gpio->secure))
-		return PTR_ERR(gpio->secure);
-
 	gpio->base = devm_platform_ioremap_resource_byname(pdev, "gpio");
-	if (IS_ERR(gpio->base))
-		return PTR_ERR(gpio->base);
+
+	if (IS_ERR(gpio->secure) || IS_ERR(gpio->base)) {
+		gpio->secure = devm_platform_ioremap_resource(pdev, 0);
+		gpio->base = devm_platform_ioremap_resource(pdev, 1);
+
+		if (IS_ERR(gpio->secure))
+			return PTR_ERR(gpio->secure);
+
+		if (IS_ERR(gpio->base))
+			return PTR_ERR(gpio->base);
+	}
 
 	err = platform_irq_count(pdev);
 	if (err < 0)
@@ -690,11 +697,15 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 
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
@@ -918,10 +929,19 @@ static const struct of_device_id tegra186_gpio_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra186_gpio_of_match);
 
+static const struct acpi_device_id  tegra186_gpio_acpi_match[] = {
+	{ .id = "NVDA0108", .driver_data = (kernel_ulong_t)&tegra186_main_soc },
+	{ .id = "NVDA0208", .driver_data = (kernel_ulong_t)&tegra186_aon_soc },
+	{ .id = "NVDA0308", .driver_data = (kernel_ulong_t)&tegra194_main_soc },
+	{ .id = "NVDA0408", .driver_data = (kernel_ulong_t)&tegra194_aon_soc },
+};
+MODULE_DEVICE_TABLE(acpi, tegra186_gpio_acpi_match);
+
 static struct platform_driver tegra186_gpio_driver = {
 	.driver = {
 		.name = "tegra186-gpio",
 		.of_match_table = tegra186_gpio_of_match,
+		.acpi_match_table = tegra186_gpio_acpi_match,
 	},
 	.probe = tegra186_gpio_probe,
 	.remove = tegra186_gpio_remove,
-- 
2.7.4

