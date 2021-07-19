Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87D23CCD30
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jul 2021 06:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbhGSEui (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jul 2021 00:50:38 -0400
Received: from mail-dm6nam11on2044.outbound.protection.outlook.com ([40.107.223.44]:12896
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229512AbhGSEuh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 19 Jul 2021 00:50:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVapaeEgP/Mb/60iea5QUbil1Ww/D4B0xuFHzNE1OifDFiKuGws8+ZfcdpjyLwiIodx/XwImbURzfW0cjPQ0FCDUwvGyKyCmVdOviLP/Fig/dqDUXn8dt4TUVoG4H8jm1UDXNhw4+VhHNwXi+Z2uICJHkiW6gzMdswAgFwGI0KQ3cNx9cdE9MDAzd/2ge7a5rszAU/w01MQDmsni1QXCh/ghnzqfAuxq2O0e7yf/ZUaNumnazk/KetdySsxLKpQPkCDHwTB8Aw31efjYGcu3jiL9TfLNNcDpVdtr77HIFFwxjSjBexuPhOzeK2CifQB9ujEhku8ZZ6ldatuF+wke1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5COegz6ZvBWIbEvm69/AZ2OY6Fr4/gAjjySbfpLvm4=;
 b=DxBwAfui1zPyi2R/lnzpNPY36inaNkfuOjUEfVIaPIiyFccDNtOV7kAYQyfXo1CWd5RgFDMgl0RCkyd4F+FfsjJNAtBUGaNhRGQgXqua1R0Yj50Z1JegkxX6sJ3N+QbNQttBIUaEs+wupIcHLRLs3cKodOHfe+qqXCcYo8IPqeTKIzNdxpk4oyeurVz9oQp5VAbrMket10yk0xMk05sOwijAeDItpgRbF1NcN106lDYQY3XGV/cDhl7balLUIkyrlbZPoaZo9O+oA11ceekUs7njOUV8E+fL8Dp5fUyWclg1DDSnkLxxAWdDz3xAp8caIHGIXImL1i3it/NblRPW6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5COegz6ZvBWIbEvm69/AZ2OY6Fr4/gAjjySbfpLvm4=;
 b=d6hhGsJ0AUMENgnEOyFFq4GouDJF1pUq3JUoxphkMF5YPU2cZwDif171B08vYfvEjC1X9oxO+vO/C3oUAKBwtNt6ocbmCtcR49UAEgio1jcdTMm5q56+6Jq3pFAS5sgMLTtutbCHmcBrIUe1I1aAsKaWmcTMJkBdwkzv93gCC+YaTLORxlEDizQCkfyVVZnaLmHenPK8JHJOR8L7V0lg61MszA+0m/VOcCi2FaRXr/YTuZPHJd+aY158+WvHIA+55XFhVTyWbcMhCcz687y23OLSOk+0WVUg7JzUntYs6MpTSr9WLStktVak/bMhT6J9F3rfsoE/extnWPDBq9a8AA==
Received: from MWHPR13CA0007.namprd13.prod.outlook.com (2603:10b6:300:16::17)
 by DM6PR12MB4337.namprd12.prod.outlook.com (2603:10b6:5:2a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Mon, 19 Jul
 2021 04:47:37 +0000
Received: from CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:16:cafe::3a) by MWHPR13CA0007.outlook.office365.com
 (2603:10b6:300:16::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.11 via Frontend
 Transport; Mon, 19 Jul 2021 04:47:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT018.mail.protection.outlook.com (10.13.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 04:47:37 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Jul
 2021 04:47:36 +0000
Received: from kyarlagadda-linux.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 19 Jul 2021 04:47:33 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <bgolaszewski@baylibre.com>
CC:     <akhilrajeev@nvidia.com>, <andy.shevchenko@gmail.com>,
        <jonathanh@nvidia.com>, <kyarlagadda@nvidia.com>,
        <ldewangan@nvidia.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <mperttunen@nvidia.com>,
        <smangipudi@nvidia.com>, <thierry.reding@gmail.com>
Subject: [PATCH v6] gpio: tegra186: Add ACPI support
Date:   Mon, 19 Jul 2021 10:16:41 +0530
Message-ID: <1626670001-22832-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAMpxmJWZm_N3yPKa2+32PNOyCUuSbjqWiDBSO3WHjKekZj8Fzg@mail.gmail.com>
References: <CAMpxmJWZm_N3yPKa2+32PNOyCUuSbjqWiDBSO3WHjKekZj8Fzg@mail.gmail.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2a2709a-51a1-4958-24a4-08d94a7054fd
X-MS-TrafficTypeDiagnostic: DM6PR12MB4337:
X-Microsoft-Antispam-PRVS: <DM6PR12MB43379BE7B044FF4004ADFB02C0E19@DM6PR12MB4337.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5NZCLkl88BnlbAllZpfKh6z+U58DWo2nPaRDosetS8VBQZn+jRq9vaCCDvUBqA/89/NRziGJKLEZlpUihvMskMcJ+b3/K2tEW3Dh9eetvquaxxQkZlvV9Y/XIZNSlB1lKiZ/rllYLeRnX80Sp+1NpIMG9o7Ld/WlgkuThX3SUKzwm+W32TaSo3rfVTIaQnlpAXkGe6QsFit5vbcFZBjh8sGt1CFG4vmEuGu2aOd1TCMxEUKLVvtXT4qhJBSSmGXPJ+lY+xDUR1JsoV/EPMqgQ1nDWDOk6XfS3VMkFHuzDng3cCDURh1Uo/gdjaKYvQxvLaa0ezkYbACZBYP6ZO2KGlNhQj8K20mU+BWXkng/RL0Z+j/0MbvVi8og+/DHLdI4PB3gKi+mqjjfgZqOtUXpg6dHjHH9zKZvHhWZChmujrAnuq893wuamwQHN2yTrpiZWO4r3SkD8b8YVz4ShvGJuRVutwKGyDaoOnTe//uAdg5Vf4JVsqLcoNUFHyh6yg1kRIJORZoQ/hGknKJU2QBPO0qVdDCw0bCxgA410TK7Frl1Y6VMn7z61kp5cKqAmYZe8DWPfi5f0DzvKdZJe7Xuy732vssiY1yLUK8ASvlQGBAiqpSfSWI4hJqVNIBnJ+r5fGlWeEhu6/odwRuJf7b8YvjHO5syUjcELakesBHxPvGjVQg5gBvdcnx/bO2XyRXA1npgBJ2/3c0gtN8/HU4V8A==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(36840700001)(46966006)(8676002)(7696005)(5660300002)(356005)(54906003)(8936002)(82310400003)(316002)(36906005)(7636003)(36860700001)(70206006)(6666004)(36756003)(6916009)(336012)(426003)(478600001)(83380400001)(186003)(86362001)(2906002)(82740400003)(47076005)(2616005)(70586007)(4326008)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 04:47:37.1135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a2709a-51a1-4958-24a4-08d94a7054fd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4337
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add ACPI module ID to probe the driver from the ACPI based bootloader
firmware.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
v6 changes:
	* Rebased on top of v5.14-rc1

 drivers/gpio/gpio-tegra186.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index d38980b..046b7c8 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -610,15 +610,21 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
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
@@ -680,11 +686,13 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 
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
@@ -896,10 +904,20 @@ static const struct of_device_id tegra186_gpio_of_match[] = {
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
 };
-- 
2.7.4

