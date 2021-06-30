Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37BA13B883B
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jun 2021 20:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232358AbhF3SUO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Jun 2021 14:20:14 -0400
Received: from mail-dm6nam11on2080.outbound.protection.outlook.com ([40.107.223.80]:36960
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229991AbhF3SUO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Jun 2021 14:20:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgpfuP/a7nNZOO1vFiG1sIRPPbCIHK++iimBQ0JIlUO+/Mu1pGqjDdkh03T0hsJvMDooDWReHWLThO+Qu8LbLFimKo2Ly9n+Z81jrsaiwNJxYBq9CXqoczEHdr56zZDHbDXo1ewDDvzIjdMSF/uH9lvNb9b1RnSrwzbuUksqmcIhufC+TrNQOEik0DwdrOvtXZfnOfumo+ZX7ccPOsOLn5nswiMuvjLimRhR6nIGcxA7FEKiTuWNyZ9kadx3Ji3KE2E9XplQ2ZceUBgUFvi6YM9RarOG/NZ3sY4lj2+EI2ptFioDIO1tYSYb2iZrrp675GzSEpPCcOF8YoSDFwc2hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWyIeuwj+/7BHiqfbQKoVPqaFli8/VHvo4j+ajt2Pzo=;
 b=h8KQ4M599tLP1vmrZPaKDBfJ3t9xxWy1Tfp3MN2VeTTzorCQm1tWg0wOd5byJkgZgeK/Crz/i1Mx3dHyl+RDWNlckBXrLLmPI/PVIPTPEEiwwl2pweF9XkNux7GnoQJRCdT5HTH5kVRHm1Hba+70igbCXWeCAarOtgEFvE+bUXPYxlNi0MW3kG715J5vHL96bEcdndb4AhoP/NSISoc8klkF1hvW7M30y/8pR+qxBq6iMVge8f38VFtlkEgEbtyjUzGag145l5fY3LiQvM9dW8OGZ9+MQIhMdsKTyjeI96qXGK7+TRc8sN0Vi+z9gp70Uh9ZH4+T1nhmCq653Sb1cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWyIeuwj+/7BHiqfbQKoVPqaFli8/VHvo4j+ajt2Pzo=;
 b=BZmrXlZvrOyWPe7pQwMaFY4NWCp/aw8TpCJ2i6WL6c1nAlwdVPCbVO8oLqG9BtiC2wn9OB+DJnWn+umHkGZFJjOSeuu8rK6UBEkHiNjfHwgYU/kwx0naKp2Muanm1GjWOrvIS7tCf9GPhJPg4j5d/cD2afOSZqM9grbBLhqeOAdGjTpmJo0EwdENiKeeUyFnWN4tU3lcUWraRa9GUZCuKJ9siXUW7iCw/ufhHXWUruCoLwBwIpka56neXNc9T7OPykmbDsewO4EcyJ9zr0wEnHJNVCMLOBgazwU6gT+AlKvj/F9CbNVFFTnE/3BAOFdnIMLGLCE7TkEClnRtaf0kuw==
Received: from DS7PR03CA0233.namprd03.prod.outlook.com (2603:10b6:5:3ba::28)
 by DM5PR12MB1145.namprd12.prod.outlook.com (2603:10b6:3:77::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Wed, 30 Jun
 2021 18:17:44 +0000
Received: from DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::43) by DS7PR03CA0233.outlook.office365.com
 (2603:10b6:5:3ba::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend
 Transport; Wed, 30 Jun 2021 18:17:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT064.mail.protection.outlook.com (10.13.172.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4287.22 via Frontend Transport; Wed, 30 Jun 2021 18:17:43 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 30 Jun
 2021 18:17:43 +0000
Received: from kyarlagadda-linux.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 18:17:39 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <akhilrajeev@nvidia.com>
CC:     <andy.shevchenko@gmail.com>, <bgolaszewski@baylibre.com>,
        <jonathanh@nvidia.com>, <kyarlagadda@nvidia.com>,
        <ldewangan@nvidia.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <mperttunen@nvidia.com>,
        <smangipudi@nvidia.com>, <thierry.reding@gmail.com>
Subject: [PATCH v3] gpio: tegra186: Add ACPI support
Date:   Wed, 30 Jun 2021 23:47:35 +0530
Message-ID: <1625077055-20363-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625075239-19120-1-git-send-email-akhilrajeev@nvidia.com>
References: <1625075239-19120-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: caaae74e-a2bb-409e-9928-08d93bf35b0a
X-MS-TrafficTypeDiagnostic: DM5PR12MB1145:
X-Microsoft-Antispam-PRVS: <DM5PR12MB11450868A6CE7C65863ED21AC0019@DM5PR12MB1145.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 93GE0EYXQdkg+GVd/o8FwP1JkmX8sR1LS6Y6oAVPdY+J5ne5DcsEXj8EGG0Nrz0JyUHmFR/0BlCFwaqTEzCyjVDbCFwukEk1M6LjrwhNjekzbCc12ath79v1Bx+PMBWDAVs2g8+rFcpWqLKBXXop5busSnx/fbQ4ECQC7F59K6PvaNmDWbQwU0SA7j9Ga6AWpl0H0co+sdGvqeJkJZazVNTzIwqsDT5Gy8KKRRNTgem3K203hGbzET9g/MgBllJ173jpjToCWmEAm5PggJ9z0wpQ0yuV+yKpu9zTdqa5rfvEI2qMYTds5K8i3xlqK7JO9pl0zYfhNOv81YJvGSr+eUgHk+CtcpTp6apl7pYORitYhqKySYOvYDX8mGf+kAm0qwDvHuK1E2PlnDBd+F6x403/dNZ3y7jleKI+kYoLVGM1qL+EB9Ae+JFv4viiByfYXtGfy99BxQPz/+5/z2kEwkJ4+yyZBC0Q3KIHY7+ovCHaZ8mrNYqbrj7IKJrGgwy9OSaxdD+e7CuM5HIlQcFYnWunpc4UUg6BqOBPvGZ8JRJ3suhWi6pRC8R/J+JdporuuFwUxiWXT8zsrtHbZyEcpDXxqhbNwTsdkJramQNnbhOtQGsslgsbkWI0vrzCdNbx1vsCHmpHIeOWmqN4gG7GD/QN7PkmarTJYL3eEE1CohDiydDO60OzvIp1nbsfz2/E7GyKCyLrkcjfBsIxDGutSg==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(36840700001)(46966006)(8936002)(8676002)(478600001)(2906002)(356005)(86362001)(4326008)(82740400003)(83380400001)(6862004)(36860700001)(47076005)(7636003)(7696005)(36756003)(70586007)(426003)(7049001)(26005)(336012)(186003)(82310400003)(316002)(36906005)(2616005)(37006003)(54906003)(6200100001)(6666004)(70206006)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 18:17:43.9089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: caaae74e-a2bb-409e-9928-08d93bf35b0a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1145
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add ACPI module ID to probe the driver from the ACPI based bootloader
firmware.

Change-Id: Id8e892f989e4ccc935b87aa0d84b10a3d1efd8f9
Signed-off-by: Akhil Rajeev <akhilrajeev@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 1bd9e44..3b553c2 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -620,15 +620,21 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
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
@@ -690,11 +696,13 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 
 	gpio->gpio.names = (const char * const *)names;
 
+#if defined(CONFIG_OF_GPIO)
 	gpio->gpio.of_node = pdev->dev.of_node;
 	gpio->gpio.of_gpio_n_cells = 2;
 	gpio->gpio.of_xlate = tegra186_gpio_of_xlate;
+#endif /* CONFIG_OF_GPIO */
 
-	gpio->intc.name = pdev->dev.of_node->name;
+	gpio->intc.name = dev_name(&pdev->dev);
 	gpio->intc.irq_ack = tegra186_irq_ack;
 	gpio->intc.irq_mask = tegra186_irq_mask;
 	gpio->intc.irq_unmask = tegra186_irq_unmask;
@@ -918,10 +926,20 @@ static const struct of_device_id tegra186_gpio_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra186_gpio_of_match);
 
+static const struct acpi_device_id  tegra186_gpio_acpi_match[] = {
+	{ .id = "NVDA0108", .driver_data = (kernel_ulong_t)&tegra186_main_soc },
+	{ .id = "NVDA0208", .driver_data = (kernel_ulong_t)&tegra186_aon_soc },
+	{ .id = "NVDA0308", .driver_data = (kernel_ulong_t)&tegra194_main_soc },
+	{ .id = "NVDA0408", .driver_data = (kernel_ulong_t)&tegra194_aon_soc },
+	{},
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

