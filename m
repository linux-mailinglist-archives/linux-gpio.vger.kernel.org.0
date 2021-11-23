Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5503645AC63
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 20:29:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240189AbhKWTcy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 14:32:54 -0500
Received: from mail-co1nam11on2074.outbound.protection.outlook.com ([40.107.220.74]:37056
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238554AbhKWTcb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Nov 2021 14:32:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+Bq1lBTKk80eiaIBCjcG5BmJk1r2UvM+uxiPJlrGlsT+C0l+1GprQ0804+3WNkqL1rMZzIBmA7PZO1VM2GFHOJiyWyU72axSo/u5D2A13dAG8Sebcr/N1GSj8LAeAWW9W6w553BZ9Q8Qt74+3eGwaYNqJg0bwjCZMAbGcVZxC+pIM1Uddq8SuDj7+yerVM1pp46J/DSsP5GHdhYKzC37Danv5yHCPT0d2g3H+eXouwTVUgHTMMlC2fZ2MWmJ+w3rCPLZjwNf8cGEgszs0l7LwR8lBUID1c6t3IhoZgb29nGPFYAlqP1dnEKGrUFWzeWVfyzS+WOHB68U/ZQZ0BpMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5VLuL+6WrE651ZpLbCRIj96MfK7LikxLtRljA2OJf8=;
 b=MFTBCPRft6hzVPY1TH2tJ5S0ftZxeKFSNBHm2oL9dx+H7XD/pqer0ZPHL245zedr/hni/U2xuDnprCFOAEMbxCEQ5Q2LADRQcZDzfyA+qv77f/VxdDxp5RFjzlxkk6bm2Kkavndhy0fdCg0o1o1rlwqh1wxfVvrLzwe6Km6tawKkTB6oR7JsPMYJF0daude/mqx8WEsa+gtLraxB7X07KWZbgqzIBk1bOYNybaxKxBT4feXALit1DjbEqjNWWw4644q8vQUWwp6KIhq1gUdoFYjRT+fCOTYCDpKD4Yaz+OkMhEmqBp8vkXr5DxwplrQoLFeWHAZw+JlDxHdwGllbew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5VLuL+6WrE651ZpLbCRIj96MfK7LikxLtRljA2OJf8=;
 b=jbu5lNiwR+Ie0ytOaf6XQPTsIpUuRkECH3slMnRprJ6CjPIaGbXSBsRg5Af/znwG2/G44fcHlPMH3N6jtY8ERNJHkHJRv8R3pVYanSK5QkwxMmSO1nezXFWJthFJEzYis3DE5SQ8RfpJc34eHdrYwvVywwjYiyFBJojEB90/TM0si8XSCMVB/qV7SxwUWrV63I55EwvAdTgujrgjtfic4/eoQGOD6nguNiw+A9CDxbUMPGrWjbDHNs0C0+zMzSToiAPbtJb3tO4hHG9FV2AFCpEcgbVWDs3AXNKu9Klmt2oB+0CTghttdNWkBxcRF///QIcM9Bf48ffuV66Dwy3sBQ==
Received: from BN0PR03CA0021.namprd03.prod.outlook.com (2603:10b6:408:e6::26)
 by BYAPR12MB2600.namprd12.prod.outlook.com (2603:10b6:a03:69::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 19:29:21 +0000
Received: from BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::87) by BN0PR03CA0021.outlook.office365.com
 (2603:10b6:408:e6::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20 via Frontend
 Transport; Tue, 23 Nov 2021 19:29:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 BN8NAM11FT047.mail.protection.outlook.com (10.13.177.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Tue, 23 Nov 2021 19:29:20 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 23 Nov
 2021 19:29:19 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 23 Nov 2021 19:29:19 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
CC:     Dipen Patel <dipenp@nvidia.com>
Subject: [RFC v3 08/12] gpio: tegra186: Add HTE in gpio-tegra186 driver
Date:   Tue, 23 Nov 2021 11:30:35 -0800
Message-ID: <20211123193039.25154-9-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123193039.25154-1-dipenp@nvidia.com>
References: <20211123193039.25154-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9b453a0-7228-4d92-e67d-08d9aeb78ca5
X-MS-TrafficTypeDiagnostic: BYAPR12MB2600:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2600AAD33191418BC8F96BC2AE609@BYAPR12MB2600.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jrfZrhI+w7EK/sJMGRpYWnhjE3P+03HwbmoGKazUDjiThucoFBNClYdMJ2tIRTtiWxO0xv2qBzo6G6KS8fO7zeD3lUMVcJGxjHJaC0kqImldB9bxsoVWSSBVVv+M+HghZbPa+bNYxfAjAQjLxn7qgwrm8Dzlrq5Ulykv+wlXEu6wsHAHoup86maKwo0JDCX8NmxPyYjaUT2Vzkr8SUG0kZu9CadI6ClSGiQVk5ayS7k1pvY7laIZNfpce5QL6APoUozKlhSAOz7QcD1abhxb3DJ8AilTzVhrRM+X8vX0Fks1i2RFGhOXLwH70uRSRnUMeEtDqBN0FtJaqt5CxcJa/i3TPXqlE3Nltvs5H9F8cHvmpstLA+4hB4F4kDV+AemdkegPLmWKm34IJv/KYaG0QKs3bMskYgVu6aJ2XpINQCqbk4M8xnC7TekCFXCkmAA9HC1+RAH8OyfTK5D3X3cZw65c8p2zAWTUxjLnONpUlI+bA6Agfgi2IobVXmS/2h0k2B922llxyqEQVXdofETkRAVma+2/i1ZdtlQcFKeXK8B3px+eBFEqCxDgFoghwL4dGIMuylS7q6H7L3QHMKyI2duhubpmK3EXK8pMWBuyVgee3fZknB4oUMS8cO7+q5N834lJ4GOqE0FRltLf3zCWLj0Lfu1eWFlukb11t3O+Sks17nL6LXmCaMYCVL0iwE8tk2kVZTWnnb0rz2x7pn/jsfAh/oDNAI07KQs1duqhh8Ksbw4LGw08Phmkyl08lnpcEEZL9YH+g1j+m6hOZjE5Ww==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(186003)(336012)(426003)(2906002)(36756003)(7696005)(508600001)(70586007)(83380400001)(107886003)(70206006)(82310400004)(356005)(7636003)(7416002)(26005)(4326008)(47076005)(110136005)(1076003)(8676002)(316002)(921005)(36860700001)(6666004)(2616005)(86362001)(5660300002)(8936002)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 19:29:20.9667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b453a0-7228-4d92-e67d-08d9aeb78ca5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2600
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tegra194 AON GPIO controller with the use of its internal hardware
timestamping engine (HTE) also known as GTE can timestamp GPIO
lines through system counter. This patch implements two callbacks
which are essential for the gpio consumers that want such HTE
functionality. The callbacks details can be found at
include/gpio/driver.h.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 89 ++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index c026e7141e4e..53b7daebb89f 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/hte.h>
 
 #include <dt-bindings/gpio/tegra186-gpio.h>
 #include <dt-bindings/gpio/tegra194-gpio.h>
@@ -34,6 +35,7 @@
 #define  TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_LEVEL BIT(4)
 #define  TEGRA186_GPIO_ENABLE_CONFIG_DEBOUNCE BIT(5)
 #define  TEGRA186_GPIO_ENABLE_CONFIG_INTERRUPT BIT(6)
+#define  TEGRA186_GPIO_ENABLE_CONFIG_TIMESTAMP_FUNC BIT(7)
 
 #define TEGRA186_GPIO_DEBOUNCE_CONTROL 0x04
 #define  TEGRA186_GPIO_DEBOUNCE_CONTROL_THRESHOLD(x) ((x) & 0xff)
@@ -81,6 +83,7 @@ struct tegra_gpio {
 	struct irq_chip intc;
 	unsigned int num_irq;
 	unsigned int *irq;
+	struct device *dev;
 
 	const struct tegra_gpio_soc *soc;
 	unsigned int num_irqs_per_bank;
@@ -192,6 +195,86 @@ static int tegra186_gpio_direction_output(struct gpio_chip *chip,
 	return 0;
 }
 
+static int tegra186_gpio_req_hw_ts(struct gpio_chip *chip, unsigned int offset,
+				   hte_ts_cb_t cb, hte_ts_threaded_cb_t tcb,
+				   struct hte_ts_desc *hdesc, void *data)
+{
+	struct tegra_gpio *gpio;
+	void __iomem *base;
+	int value, ret;
+
+	if (!chip || !hdesc)
+		return -EINVAL;
+
+	gpio = gpiochip_get_data(chip);
+	if (!gpio)
+		return -ENODEV;
+
+	base = tegra186_gpio_get_base(gpio, offset);
+	if (WARN_ON(base == NULL))
+		return -EINVAL;
+
+	/*
+	 * HTE provider of this gpio controller does not support below gpio
+	 * configs:
+	 * 1. gpio as output
+	 * 2. gpio as input
+	 *
+	 * HTE provider supports below gpio config:
+	 * a. gpio as input with irq enabled
+	 */
+
+	if (tegra186_gpio_get_direction(chip, offset) ==
+	    GPIO_LINE_DIRECTION_OUT)
+		return -ENOTSUPP;
+
+	if (!gpiochip_line_is_irq(chip, offset))
+		return -ENOTSUPP;
+
+	hdesc->con_id = offset;
+
+	ret = hte_req_ts_by_hte_name(gpio->dev, "hardware-timestamp-engine",
+				     hdesc, cb, tcb, data);
+	if (ret)
+		return ret;
+
+	value = readl(base + TEGRA186_GPIO_ENABLE_CONFIG);
+	value |= TEGRA186_GPIO_ENABLE_CONFIG_TIMESTAMP_FUNC;
+	writel(value, base + TEGRA186_GPIO_ENABLE_CONFIG);
+
+	return 0;
+}
+
+static int tegra186_gpio_rel_hw_ts(struct gpio_chip *chip,
+				   unsigned int offset,
+				   struct hte_ts_desc *hdesc)
+{
+	struct tegra_gpio *gpio;
+	void __iomem *base;
+	int value, ret;
+
+	if (!hdesc || !chip)
+		return -EINVAL;
+
+	gpio = gpiochip_get_data(chip);
+	if (!gpio)
+		return -ENODEV;
+
+	base = tegra186_gpio_get_base(gpio, offset);
+	if (WARN_ON(base == NULL))
+		return -EINVAL;
+
+	ret = hte_release_ts(hdesc);
+	if (ret)
+		return ret;
+
+	value = readl(base + TEGRA186_GPIO_ENABLE_CONFIG);
+	value &= ~TEGRA186_GPIO_ENABLE_CONFIG_TIMESTAMP_FUNC;
+	writel(value, base + TEGRA186_GPIO_ENABLE_CONFIG);
+
+	return 0;
+}
+
 static int tegra186_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct tegra_gpio *gpio = gpiochip_get_data(chip);
@@ -821,6 +904,12 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 		offset += port->pins;
 	}
 
+	gpio->dev = &pdev->dev;
+	if (device_property_present(gpio->dev, "hardware-timestamp-engine")) {
+		gpio->gpio.req_hw_timestamp = tegra186_gpio_req_hw_ts;
+		gpio->gpio.rel_hw_timestamp = tegra186_gpio_rel_hw_ts;
+	}
+
 	return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio, gpio);
 }
 
-- 
2.17.1

