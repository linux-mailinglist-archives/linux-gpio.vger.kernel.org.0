Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A70953B8F52
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jul 2021 11:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235589AbhGAJDe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jul 2021 05:03:34 -0400
Received: from mail-bn7nam10on2041.outbound.protection.outlook.com ([40.107.92.41]:59392
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235088AbhGAJDe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 1 Jul 2021 05:03:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j531ySpa9MLgm8w78gH5KS6ue09KKaR77ulFSaPmvc7qLtBxczPQtHDOWzpEtx8pY7ZsH+PwgJ38xIhtDjmN9OaYgz15A3yTuQefh7Du3qH0DdLXRzbRHByBZPUdVsZWWFBvVchluTTXl3Pbqk/6q83BCMMEgqoDakxanCJna3ilVZE2APYKVFIjdHvLtpjab2sdf9J3aOhWrzHOloyfQIPHjQGEZzX6otn0+GkvTqk1qGo9ggoMCwb0ZL12JgsOGCx/qgsLUB4Cxkz6inWI0ASFJFdnK4eubjha6OTCzzK894Sa6IwYTDtf+2fCzTJh7tDaOTuRlHZ2yXfEHsdNoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmnX6lgqxG9jF6donItuhdkQWhswluwfWjc5gogAKpU=;
 b=H8gdEWqFhGJvRrjfFRCgv9qqHXOO5xRlde5YVSfpAZOYTURDQavAuunfYqkVdpRY9hhETXn6KZvzyF8Ghc+kimiKwrT7sXSagOXlCH0MOL2cpsvKNL1VgxCKIJSP99IpJYGVb9FIRUHOy0lh3nqD+7DqdsitIaxdqvozENyzZ/nfdoHhqZz/025XPLR4fUs1/JEPMfxWu7nnS7WtenNOos4f74JtW5EehXzvtsjbyqD2WMfGaXFsXm6LnOFku/CYJ8x7Ff1zl/YlcWx8Bq3pwZMZVEP6lavaMi4A6Top6muRB+RSryiMl0bzgJHgwYqHemRjlVeyxiefClkx3fe4tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmnX6lgqxG9jF6donItuhdkQWhswluwfWjc5gogAKpU=;
 b=Wt+1sKIiuZJi9PYgxTyLGcRYgWH5qlFaezFD1s1/4Nz5B35iisxv0DtJjigiHUCzt6NF2noGbXhQQgD3L0z2lVNCcIV8mE4DtDMX+uv/OpYhm2stXm324iREKtvPcgDuZxgKVoe0QqRfAYL2bK+nFjqixNUM3etQuxT8JrkNGXhn9MB+xP4ENpKprQKRGrEJOv0PrV82uLiVuG/H0PifqO7zotjqJyVRZ4QoiI/xDy3ixN4soOZPuwm8VpG/vuzKAaFrllh6wlIbmLLr+8MGaLNg+Wz85pN8W9j/c7mq77HGXCHwkXOIqy3r7Nzl3gvzAinlwlH/i5xjJljQrMmUxQ==
Received: from DM6PR08CA0062.namprd08.prod.outlook.com (2603:10b6:5:1e0::36)
 by PH0PR12MB5434.namprd12.prod.outlook.com (2603:10b6:510:d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Thu, 1 Jul
 2021 09:01:02 +0000
Received: from DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1e0:cafe::23) by DM6PR08CA0062.outlook.office365.com
 (2603:10b6:5:1e0::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Thu, 1 Jul 2021 09:01:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT041.mail.protection.outlook.com (10.13.172.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4287.22 via Frontend Transport; Thu, 1 Jul 2021 09:01:02 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Jul
 2021 02:01:01 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Jul
 2021 09:01:01 +0000
Received: from kyarlagadda-linux.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 1 Jul 2021 09:00:58 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <jonathanh@nvidia.com>
CC:     <akhilrajeev@nvidia.com>, <andy.shevchenko@gmail.com>,
        <bgolaszewski@baylibre.com>, <kyarlagadda@nvidia.com>,
        <ldewangan@nvidia.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <mperttunen@nvidia.com>,
        <smangipudi@nvidia.com>, <thierry.reding@gmail.com>
Subject: [PATCH v5] gpio: tegra186: Add ACPI support
Date:   Thu, 1 Jul 2021 14:30:54 +0530
Message-ID: <1625130054-22947-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <2a8eb285-3b71-199c-1bf4-39fb47fac77e@nvidia.com>
References: <2a8eb285-3b71-199c-1bf4-39fb47fac77e@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f194b908-b849-4386-2bb8-08d93c6ec07b
X-MS-TrafficTypeDiagnostic: PH0PR12MB5434:
X-Microsoft-Antispam-PRVS: <PH0PR12MB54348DEE7A442589DEBD9499C0009@PH0PR12MB5434.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 27SZMe+v1mQCaotArqaWNqz4sSew1LtVkJcGn+I7bniUm4juKBGzp7kyDayfIleZrvv/Rgw1Dtw0AxkrNMw2+3OBI0r6rLnjmdCl8Bpc4mIa+LI0l+/WxRdZTf1WYanTaWyv3P1ehr1AkHj/gPe1rAQqmg7QquwBTeijfbE7h64D3Tta3DmF5W0F4e3j7kaxN3xRBBfM2QzzJNvwgWHFkx4QfFMgRdG7Lk0yi3SdrbTIqaVUDfzR0utwnEUDSjgIJix0uWE40MozTarq03hMDziHHLHgUqpButPl913+k8O252cYYgn/IQg3ji2sh5PASZD6qv85974mV3VK02ikgfFO04Y8cFWoMKkkum7XcuC8LJPRcYHiopybLwBly2Ay9P+iyyM2aUK8hEQ/TIAhM/162A/3OWZ/HuVn6uA6R0MrhEjQvPX2QWIyReaEtLRcvagJo16WIQrpQqykMfJyb1T0SK/1gkq/Eu3LU8vZvFgZrizCxhv38Dcae12pxAB+GpZlsluw63GjkyG/0SsLxSXwoswkTTTJtgTlJVZfWl/l6SBq+8yuwTnATD5o72aOAFOtBJ6Pv/81jU7VVu0VmwOy5WTTd5rZGeDIizaS1SzgR6Qe7ssGSoTnzAJJrJGLGjq/ItnhWORwdx84l2+s5HpbN3JoJcHou0Boi5iKWiBPxuGuZtPcqEunoUiA3/qBT2koohb9n+ktz8wyHKVhgA==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(46966006)(36840700001)(316002)(426003)(2616005)(2906002)(6862004)(8936002)(8676002)(336012)(54906003)(37006003)(6666004)(5660300002)(478600001)(4326008)(82310400003)(36860700001)(356005)(7636003)(47076005)(86362001)(82740400003)(83380400001)(36756003)(26005)(70206006)(7696005)(70586007)(6636002)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 09:01:02.1363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f194b908-b849-4386-2bb8-08d93c6ec07b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5434
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add ACPI module ID to probe the driver from the ACPI based bootloader
firmware.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
v5 changes:
	* Updated ioremap_resource check as per Jon's comments.

 drivers/gpio/gpio-tegra186.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 1bd9e44..8a64dcb 100644
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
+	if (IS_ERR(gpio->secure)) {
+		gpio->secure = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(gpio->secure))
+			return PTR_ERR(gpio->secure);
+	}
 
 	gpio->base = devm_platform_ioremap_resource_byname(pdev, "gpio");
-	if (IS_ERR(gpio->base))
-		return PTR_ERR(gpio->base);
+	if (IS_ERR(gpio->base)) {
+		gpio->base = devm_platform_ioremap_resource(pdev, 1);
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
+	{}
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

