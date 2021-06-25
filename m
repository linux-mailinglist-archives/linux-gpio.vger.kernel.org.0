Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E7093B4B39
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jun 2021 01:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbhFYXuj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Jun 2021 19:50:39 -0400
Received: from mail-sn1anam02on2061.outbound.protection.outlook.com ([40.107.96.61]:57126
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229962AbhFYXug (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Jun 2021 19:50:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HsfqX7XlTNHKBL070bCGDr0NJcu3IMzay1X4OeQeS4pGBTq+QVoZ+PSf4uBiQrEtQTnhGWBufi00nZiGT87qoKcjug8kOklH1nA/JVgVfKcVI3hkLmd9ySCVK+G9yF8yrasJT5djrZ1Mxkxvsjt4aQQFfRAZvJuh9wVBjwJ5vaXhs7yp7dkAe/g4Pea94j570Ec9rSxvoKVf8LGw8TsG8YsZt/UUiKtIeumhoS0ImZOgN+T4+eUpKxi8rrqQ90pS+g7wXea9szaJC8/m75Cl2g3QUQNi3n8gzA03HPe4wx48WdJWaER8cx+N0lxolAgvoVP+aWQWWfcwsWtcBV1fMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCRGOPzla7XUUFMGzWpJ8TULjDvQOfxnmL8nyA0e/8k=;
 b=S7UvTJUZur5qi+E5z1UhAKKiXwBU0zz8Sa4A1SlTQ8zT+41Irg58TDq+3FE7OWvhSwU0yGAGLjAjoZXEDjJvlsJc8G/jOBUd9GSZ/A4YIs7yEoob2I05Di/1dFATB5wm/fCY6krhbe0nRj/5YgUKGUZBTJGWFgHbUQGhej8As4hDhaMegdgeBjqkAk+6ErGqEcbu+Z8Lddz3maskjpBGgsPlTNaNW7N+rWelohK9c6CCPNo9JaI5Pq/yHM5lKNj/RSbz/DGBBbZAu0she+eO6mWOIPjKunsnSY3IuPYjiqyb2SpKkvIuGzaIWp4HAZEOe8jIKSXC8tqtTv39Bsuppg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCRGOPzla7XUUFMGzWpJ8TULjDvQOfxnmL8nyA0e/8k=;
 b=QQ5Q0KUsZ74UhWwJnwm90QsiioxiwtHaR+emoIF6UF6zzlliuwMSoYc6HgA8wyLFX/tiON1lFgC2T0LgPTYT9wx0yuSuBmqXT9ZpPznvg0eSFovEH0JyMsoLF0zoNnK+xj2gv5U+0fk8743VzMOgnIvjQszCH8hOpUcq2RBRXboBkD5fOMhrWg2uBQwq6PReUZOXhdsfJRRE+JfNZ56wo8JkvAVlB3zLPEu11dtOyXcgrQ5yLwQhXnnYhkBDH0tc7QZJUGReqCzZq38+zCOFviHN1EEA1CLPNeMNvpGaYmPfeSWK4BgcFPZKCv4/qmZfsLrH8Bb3pItzwOYVbXEMbQ==
Received: from DS7PR03CA0238.namprd03.prod.outlook.com (2603:10b6:5:3ba::33)
 by BYAPR12MB3303.namprd12.prod.outlook.com (2603:10b6:a03:131::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Fri, 25 Jun
 2021 23:48:12 +0000
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::6) by DS7PR03CA0238.outlook.office365.com
 (2603:10b6:5:3ba::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Fri, 25 Jun 2021 23:48:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT027.mail.protection.outlook.com (10.13.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 23:48:12 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 25 Jun
 2021 16:48:11 -0700
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Jun 2021 23:48:11 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <dipenp@nvidia.com>, <robh+dt@kernel.org>
Subject: [RFC 07/11] gpio: tegra186: Add HTE in gpio-tegra186 driver
Date:   Fri, 25 Jun 2021 16:55:28 -0700
Message-ID: <20210625235532.19575-8-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625235532.19575-1-dipenp@nvidia.com>
References: <20210625235532.19575-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf25996a-0770-4607-98bc-08d93833b171
X-MS-TrafficTypeDiagnostic: BYAPR12MB3303:
X-Microsoft-Antispam-PRVS: <BYAPR12MB33037E70122580DED1549A49AE069@BYAPR12MB3303.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NhmKXoKElz/Y8qa30HzK+tB26GiyZJBS8kPKrLxwcK6wJW46UiUIA3xfIewgXBazdrzx4odzeUDZ8dwPISimmVawhyVJbmIYfbjEMRREKSzzZKeIBvGdR0SU20cbEV3Y2lzC2hpp2Q+l6K8VChgAOTOGQxve1MZA3TMqfFZkUemGA14TgCaiHWB8kX5QD8cq6zv/ai3/+f2wUfAh4vHHof+nPFCAje2l3W5h6hcKrQJrEu3V+ngnt6AgsljPMLGbwqfg3eJrV495ydm6fbSblY1ppvgM/LXQiSpByyTRxZ9BJCb6fcuVmbVip76EZ4aMEK3gRM2AM0orh68nI+7yrW+EkiKshKa+u8Sj4dF7Js/GKv7FWnMlJIcFeZCr2wijqEczmcAHCjFsG7PtdGIUH7uhMSjMYVUjb9IS5tF7SNtxIBENX49lhR7qCnVAg1P6eb3Ny3fx/N7QndHAzgVrpYmxeU8Iy+ahOrocIH5AkNmHb05c3MdOI1Ym1/IBIIn/v/qtelaSlsduv0REcsN2JqkqOwAopANw3Fa4pIOnGPSqVR3SGC9W7GNs+XUE2SibKAJxDtOFfq/tIxE6PomNbSNaX9kYjugsSUDSwXtbRpokcAZzN/KnWAhKsZwIRyZp6v8YL1RfywE0yABeK+1tNLR88XmomKbEESe5RJPu77dE69pTGMnDyjCS3H5ve3MeB967SH4i6jIGfVohjMrdkA==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(36840700001)(46966006)(478600001)(82740400003)(36756003)(2616005)(47076005)(70586007)(86362001)(70206006)(7636003)(7696005)(8676002)(110136005)(6666004)(316002)(426003)(356005)(7416002)(921005)(36860700001)(1076003)(8936002)(336012)(2906002)(83380400001)(5660300002)(26005)(186003)(82310400003)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 23:48:12.0015
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf25996a-0770-4607-98bc-08d93833b171
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3303
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tegra194 AON GPIO controller with the use of its internal hardware
timestamping engine (HTE) also known as GTE can timestamp its GPIO
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
 drivers/gpio/gpio-tegra186.c                  | 78 +++++++++++++++++++
 2 files changed, 85 insertions(+)

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
index 05974b760796..4962d7de73f1 100644
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
@@ -79,6 +81,7 @@ struct tegra_gpio {
 	struct irq_chip intc;
 	unsigned int num_irq;
 	unsigned int *irq;
+	struct device_node *hte_nd;
 
 	const struct tegra_gpio_soc *soc;
 
@@ -188,6 +191,65 @@ static int tegra186_gpio_direction_output(struct gpio_chip *chip,
 	return 0;
 }
 
+static int tegra186_gpio_timestamp_control(struct gpio_chip *chip,
+					   unsigned int offset,
+					   struct hte_ts_desc **hdesc,
+					   bool enable)
+{
+	struct tegra_gpio *gpio = gpiochip_get_data(chip);
+	void __iomem *base;
+	int value;
+	struct hte_ts_desc *desc;
+
+	if (!gpio->hte_nd)
+		return -ENOTSUPP;
+
+	base = tegra186_gpio_get_base(gpio, offset);
+	if (WARN_ON(base == NULL))
+		return -EINVAL;
+
+	value = readl(base + TEGRA186_GPIO_ENABLE_CONFIG);
+
+	if (enable) {
+		desc = hte_req_ts_by_dt_node(gpio->hte_nd, offset, NULL);
+		if (IS_ERR(desc))
+			return PTR_ERR(desc);
+
+		*hdesc = desc;
+		value |= TEGRA186_GPIO_ENABLE_CONFIG_TIMESTAMP_FUNC;
+	} else {
+		desc = *hdesc;
+		hte_release_ts(desc);
+		value &= ~TEGRA186_GPIO_ENABLE_CONFIG_TIMESTAMP_FUNC;
+	}
+
+	writel(value, base + TEGRA186_GPIO_ENABLE_CONFIG);
+	return 0;
+}
+
+static int tegra186_gpio_get_hw_timestamp(struct gpio_chip *chip, bool block,
+					  struct hte_ts_desc *hdesc, u64 *ts)
+{
+	struct hte_ts_data el;
+	int ret;
+
+	if (!hdesc || !ts)
+		return -EINVAL;
+
+	if (!block)
+		ret = hte_retrieve_ts_ns(hdesc, &el, 1);
+	else
+		/* Wait till timestamp is available */
+		ret = hte_retrieve_ts_ns_wait(hdesc, &el, 1);
+
+	if (ret)
+		return ret;
+
+	*ts = el.tsc;
+
+	return 0;
+}
+
 static int tegra186_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct tegra_gpio *gpio = gpiochip_get_data(chip);
@@ -605,6 +667,7 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	struct device_node *np;
 	char **names;
 	int err;
+	phandle hte_ph;
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
 	if (!gpio)
@@ -730,6 +793,21 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 		offset += port->pins;
 	}
 
+	err = of_property_read_u32(gpio->gpio.of_node,
+				   "timestamp-engine", &hte_ph);
+	if (!err) {
+		gpio->hte_nd = of_find_node_by_phandle(hte_ph);
+		if (!gpio->hte_nd)
+			return -ENOSYS;
+
+		gpio->gpio.timestamp_control = tegra186_gpio_timestamp_control;
+		gpio->gpio.get_hw_timestamp = tegra186_gpio_get_hw_timestamp;
+
+		of_node_put(gpio->hte_nd);
+	} else {
+		gpio->hte_nd = NULL;
+	}
+
 	platform_set_drvdata(pdev, gpio);
 
 	err = devm_gpiochip_add_data(&pdev->dev, &gpio->gpio, gpio);
-- 
2.17.1

