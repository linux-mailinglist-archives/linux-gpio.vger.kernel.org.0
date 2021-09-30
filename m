Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F93D41E4DC
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 01:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350656AbhI3X2h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 19:28:37 -0400
Received: from mail-mw2nam12on2079.outbound.protection.outlook.com ([40.107.244.79]:36704
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1350162AbhI3X2Z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Sep 2021 19:28:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMjRnzPr2TZ4ptGGjFMXQ2Qim4kHpyMKqWolWGnqCt47Em/m0EgvKjDSKCvVfK23mV+lex+3fxs/LTzwHkATrX/wYLSJ9LfEtj5ciqe/rnIZ3wlQInvLNzIKTFH9fKTS4+74WehTZ5UyIvaD3dC2CoX3ZApPaK0T6M1i2uHmmyMNNttJQgdqKvCgbTGJh3/mreVkUOdHNxtwS+Uv9NSRnlcSbogj2HYgl16ebGrr2pLXaUkOTcYulfsZLNIW782CUC6MFfjgpOHP18Q4QWbuc/ebjVx7OvG2HHPHCDKzZwewUqBF+XlTCV6Is+vw5IsSE+He2kcmGMSfJR0lHSj+aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYVbDaM3XST3xIRIeWCcEC+wtxuI8Wb3cYNBgnrZZcY=;
 b=FbZDPRbKcrjrWBXwCKFPt6Z8gro1UAPp9JIG6FTrMq4qpM/Ohf0Be3GYcsmVQV2SFk38SJ5opEcsLYcUQyIYaaxUJXCqpgB/2Yly7csnPeWor/2pR8OrPkIOJv9+mDqjnZXGoxUQeHzmfrx7BQZyKIUvqD3aNhbqJbMQDkPRbICHleiz/HMFTo6Z9HHnmWrBH3+M47qJ9f6No0kwbHOI4kMd3J40MKNlz28WteI/oUpXy48whD6n5CW669HQTFG0aZjlYb706ruwzYRPpVO7SlhTPPuORR7eT4MTlFJgj4/96Rbvzxt93cuhDTzSfsSzk4sw+FxbyO2FYFciHkvqHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYVbDaM3XST3xIRIeWCcEC+wtxuI8Wb3cYNBgnrZZcY=;
 b=lXXPW60dwCvk1dshOXnEb8z/ufJvvHpcNCpqDNUaxLzkJvZzKkCc8edsHRZ22TQEo1W0NpxM7Lkcrjhc2sRp6YdHKRz6rikGj2SPqrAFLO5K5dMuu16Cr/mtfxpg1Juq8CY2/xdc6hIc+16tOdKR+fguG4Xsr3gys3RoiAltg/GCQ9mh2YMErl8MCRW9tcQevRolszhWcyEhTv+B16aUwKfXoAuexCpFM6ZVqwCBW5+wRRqTsqJS8UZ+CuBpbbcdZhnFzGa63YwonD4HC47IqtHFuvKQwJ1WFKVKqDuFmDHTJp8evMCNqaJR8QpGOlCd1ccKwFf/Yr7wGP5KMJ87AQ==
Received: from CO2PR04CA0084.namprd04.prod.outlook.com (2603:10b6:102:1::52)
 by BL0PR12MB2449.namprd12.prod.outlook.com (2603:10b6:207:40::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 30 Sep
 2021 23:26:40 +0000
Received: from CO1NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:102:1:cafe::2d) by CO2PR04CA0084.outlook.office365.com
 (2603:10b6:102:1::52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend
 Transport; Thu, 30 Sep 2021 23:26:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT064.mail.protection.outlook.com (10.13.175.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 23:26:39 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 30 Sep
 2021 23:26:38 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 30 Sep
 2021 23:26:38 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 30 Sep 2021 23:26:38 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
CC:     Dipen Patel <dipenp@nvidia.com>
Subject: [RFC v2 07/11] gpio: tegra186: Add HTE in gpio-tegra186 driver
Date:   Thu, 30 Sep 2021 16:26:13 -0700
Message-ID: <20210930232617.6396-8-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210930232617.6396-1-dipenp@nvidia.com>
References: <20210930232617.6396-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cacdcfe-4cdd-4da2-3623-08d98469c117
X-MS-TrafficTypeDiagnostic: BL0PR12MB2449:
X-Microsoft-Antispam-PRVS: <BL0PR12MB24490430481A25BF64DF8813AEAA9@BL0PR12MB2449.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xKTei/sjXXr9eJagghN4YfxkpMfdsWf4pUIkt+CgkgKwNw1eogaI/gL7CC/f6ao5ndeyfHWjn5szVPvD2IWlWbyBqMxevhQ0L7692rEWwTmdC0r7x7K430jM61uUj7sGCOX1dE7IPb/ATJLjSfdR/6Kcq3x0Ymn6nR5LRcipCdlBn/m2dGdOPqIb/JdSGYf9AFxx5+8xgDMwlEkDDXEQ2Z6FLmvIOrBejj05WoTg1yzzMtn1GPadckXafSa3pjbegKwY/G61U5BB18hnqtf3I32/sxJoh2Jx60PfxAPjGAVcXP6yVWmg7aTHGjXruND/NN3bxn9cG7sB4q/82EuM9uON7DSjzeu1AMsQGdrtwrQZE+fyjXmQoCuGu8pbK9PMsnTvaYfb2gzq8LpHzu6zDjCVYemJJYtZcnwQGeX8JQhgg2MuBonUImzjXSmRMrZAbzySkd09Ksd0EGYgjhwrpS20OvEJV8OMxuReo1gPTwlYfximDwlomx9FicDr2i0Fegx/Vqyx/YXip2JdZrjdFZTiObxImUczOA82S1Soec3WQcB/K/AszHH/e8dzwmB9foUEF5F0gkp8tDk24Y+o4ZtDuBppj7OJXSr+A3QngJrTR+zEUQSAiGQLdox9r1XPlHC1lS7RxOCFkj2Q3aTGXBUyc+4eS3YuQ9g673Mn2j5E7Jrs9mc1GPCo4Q/fyeK0biM/CJcH2+4wXUxCUYGV7UerruWNrtwG6JzX3U89M6W0NsHMfNkHxWpDHfHbHlx/v6ggIt59nDjGZEz4QAOsTA==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(26005)(6666004)(7636003)(7696005)(316002)(110136005)(426003)(5660300002)(356005)(8936002)(8676002)(83380400001)(36756003)(107886003)(86362001)(70586007)(36860700001)(1076003)(336012)(2906002)(2616005)(508600001)(921005)(186003)(82310400003)(47076005)(70206006)(4326008)(7416002)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 23:26:39.4492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cacdcfe-4cdd-4da2-3623-08d98469c117
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2449
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tegra194 AON GPIO controller with the use of its internal hardware
timestamping engine (HTE) also known as GTE can timestamp GPIO
lines through system counter. This patch implements two callbacks
which are essential for the gpio consumers that want such HTE
functionality. The callbacks details can be found at
include/gpio/driver.h.

Since AON GPIO controller depends on HTE engine, it creates hardware
dependency between controller and AON HTE provider. To express that,
the optional devicetree property is introduced for AON GPIO controller.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
---
 .../bindings/gpio/nvidia,tegra186-gpio.txt    |  7 ++
 drivers/gpio/gpio-tegra186.c                  | 89 +++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
index adff16c71d21..00a3e47ab560 100644
--- a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
@@ -127,6 +127,12 @@ Required properties:
             - 8: Active low level-sensitive.
             Valid combinations are 1, 2, 3, 4, 8.
 
+Optional properties:
+- timestamp-engine
+    AON GPIO controller has timestamp engine which can hardware timestamp
+    GPIO configured as input and IRQ. This property specifies hardware
+    timestamp engine (HTE) device-tree node.
+
 Example:
 
 #include <dt-bindings/interrupt-controller/irq.h>
@@ -162,4 +168,5 @@ gpio@c2f0000 {
 	#gpio-cells = <2>;
 	interrupt-controller;
 	#interrupt-cells = <2>;
+	timestamp-engine = <&tegra_hte_aon>;
 };
diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index c026e7141e4e..6d1f15167529 100644
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
+	ret = hte_req_ts_by_hte_name(gpio->dev, "timestamp-engine", hdesc, cb,
+				     tcb, data);
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
+	if (device_property_present(gpio->dev, "timestamp-engine")) {
+		gpio->gpio.req_hw_timestamp = tegra186_gpio_req_hw_ts;
+		gpio->gpio.rel_hw_timestamp = tegra186_gpio_rel_hw_ts;
+	}
+
 	return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio, gpio);
 }
 
-- 
2.17.1

