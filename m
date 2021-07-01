Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93C283B8D42
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jul 2021 07:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232153AbhGAFD6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jul 2021 01:03:58 -0400
Received: from mail-dm6nam10on2040.outbound.protection.outlook.com ([40.107.93.40]:19648
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230293AbhGAFD6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 1 Jul 2021 01:03:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YbKCEWYfFUhbc/xVAOWc69rSwO2AFxdMjf/Pv17BUVW6a4dKcJcrTHhujTXmqQKiuyUZrtvwMaEI+qGlkE061UhoDFkgyO7TgupTAP9GQkqaJZDU9LYMQFesBZSZkPf6TnS0RyX6mRaxJheCqKxaYAyelFG/BcckLiYKyZ4H9zz1/UzxVydi4gYRLtbKtIuhT6SkhmNg/Xnc+tlM/z0lSYfd6E9T+2rY6aI9h1WG6A4Ab2IS01BilpX1Njb0Y0PW8GdIgb7XbNfB7wc0vGqnrwInYJPkdd6F3WzVos1KZZ4Og4DJW7Z1mxcx4n+kIAbwa7h/MVMcJ4hlTwm8vwIDBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=beafX0i79Cn9HYirrUkex7VYNyu+UAyG/Ew9n4/Hnz4=;
 b=LMtC91/Vgj+7BDgw+bvO4O3FskKvNeAkS9KRh1NZBsM63vqbX9NyO0MlEyZcKJeJdaH+bVKh2pjFZJl7jucmJnO0YrouW4pmPtsJznIoHpfUlcBpuX1h8JNftyC85qMCV/5OxILGZ5WsxrO1iEB0C3tq6njRSDRYNCw5F65uLGEM/GKQec2Lv6QukezRRh/WI5gg3j1UaRwQSIUfNexsiz9tG6C/PZsU8NFhuMyJtuTDbpInMU4AI06BHmZMpOZcpZRh/FleHEsYlpAYhTlQaGdEt5vdOwZpD72s0mFlakb2FKFlvpoLTsZYjJANT/WsQEWS2kNy5ti00PuzcH9YUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=beafX0i79Cn9HYirrUkex7VYNyu+UAyG/Ew9n4/Hnz4=;
 b=DzWB24pXO8+dnw82ErdQt2RelMpxxOBo8nXTl5KSqr1AQf2b2JZov8LkhGH6g26FsvwcZ1oETbuYVtB3R98hHrC0aDW4rSM8kgQ3rwlRayUYyYGjPAqEb9lgDIZpjYxihwvvuGiPe+MMYJLscaX59AQq5yyi1vb0gpf5Gy8sKVcYQY30vkOmSkXvD0fYpU8xngIFXgU4Mw6pBe75lRZK4HFkCEKL6GL3kZZjp/uaQXyq50uJp0tlX5Omk13mhWcIA6KQodH2u0D9kVbTNgun32ZcHqQR0zKZOgLdp8Dn3O38eBvZZ3pjaoSVOXzg8ehdRpPKu1Osvq+oN+oHZtQ2tg==
Received: from DS7PR03CA0246.namprd03.prod.outlook.com (2603:10b6:5:3b3::11)
 by SJ0PR12MB5504.namprd12.prod.outlook.com (2603:10b6:a03:3ad::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Thu, 1 Jul
 2021 05:01:27 +0000
Received: from DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::ff) by DS7PR03CA0246.outlook.office365.com
 (2603:10b6:5:3b3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend
 Transport; Thu, 1 Jul 2021 05:01:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT040.mail.protection.outlook.com (10.13.173.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4287.22 via Frontend Transport; Thu, 1 Jul 2021 05:01:26 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 30 Jun
 2021 22:01:25 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Jul
 2021 05:01:25 +0000
Received: from kyarlagadda-linux.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 22:01:21 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <andy.shevchenko@gmail.com>
CC:     <akhilrajeev@nvidia.com>, <bgolaszewski@baylibre.com>,
        <jonathanh@nvidia.com>, <kyarlagadda@nvidia.com>,
        <ldewangan@nvidia.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <mperttunen@nvidia.com>,
        <smangipudi@nvidia.com>, <thierry.reding@gmail.com>
Subject: [PATCH v4] gpio: tegra186: Add ACPI support
Date:   Thu, 1 Jul 2021 10:31:12 +0530
Message-ID: <1625115672-17932-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAHp75VfB8varyi5j=j8YaysdgofxFU1-xCKLFPrxiYz7KadGfA@mail.gmail.com>
References: <CAHp75VfB8varyi5j=j8YaysdgofxFU1-xCKLFPrxiYz7KadGfA@mail.gmail.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57e5e98e-9752-4aa6-9417-08d93c4d47d5
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5504:
X-Microsoft-Antispam-PRVS: <SJ0PR12MB5504558C184CDA295D6369CEC0009@SJ0PR12MB5504.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dbobosxtJ1TS/edRZkt/G9Mbm/Ot5Xg546Yvr3i64LE5q5iTknmpVVjnoNNVhXnw1l8c7h0XRm7VADZnF0EncXpV5MIQUBMFLAlH7YhZKc6Vz5qJv7uGyMahb8uHP1MYRJvEd+oLUzEfXn3A5Wn7hyxeZxmCI2XEUZpLsielLN+2FUvmbGEPSfd8ZuSHzGlCREAas5MhOLSL9DtyHVKqMdBd5GcU6SH2WMwsCiEs7BzXGrWCVmAdGBxk71fKz4zBWLEccwZWBhfPE+6La177imzthnL/FbYLGy4grVMsUAcoHJFwR1Fzw+0HE/o9hn1z9OcGMn8n4tJMYPlSX8SimdOfpPlj0/kMJWzhUqvNt50vt3y4AAuvgGdiwG1pxWY8U/Nw/mQ2k7RF4BgTdbnpFjx1H4P0BdHldiv8gKazCIufPgDeL7ipq9+1k1QMS3iGOTxEx8NdgreTywIA0cUWS/lb4nTeB9576tt9zTY14mD89x4FXmGaC6rh7i/H3buyje1BxFtr0jT3EHYM4tfxJnZ7++7BNhbAMp+PyTzQmVcxf4e1raGSGIcdefVOEZq1ZZ7ObM4uSsVYTrY34+T7Qe8yplSNjNOKprfnJ8EZigq+EtZnKq/J2Rl+i8EtK82yarj56L9hYgie/H2y+2FCKYFzEge/OzgxEVeXDg8QV/chnvEzt6ak+WU+R57NQCND7tzgU3iaMBHP9QNoJyVgzQ==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(36840700001)(46966006)(4326008)(36756003)(8676002)(316002)(6916009)(8936002)(26005)(47076005)(336012)(70586007)(6666004)(70206006)(2906002)(186003)(36860700001)(54906003)(86362001)(82310400003)(356005)(83380400001)(478600001)(82740400003)(7696005)(426003)(7636003)(5660300002)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 05:01:26.3984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e5e98e-9752-4aa6-9417-08d93c4d47d5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5504
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add ACPI module ID to probe the driver from the ACPI based bootloader
firmware.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/gpio/gpio-tegra186.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 1bd9e44..e0ba8cd 100644
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

