Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD7640245A
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Sep 2021 09:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236332AbhIGHcN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Sep 2021 03:32:13 -0400
Received: from mail-bn8nam12on2073.outbound.protection.outlook.com ([40.107.237.73]:46080
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236242AbhIGHcM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Sep 2021 03:32:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZuqoaeR7fEswu7H1cZt8ml+D8kOw8uZrN+zTHUkS2XFmQ52r2Gr1Bq7FXLs6pve4nJl+4t619aV4/zdexH7FAYSMXJQTy4UQkgP9gX/SFIy/b5tBuzI0US9PiF0rzKtGy/uTYCa6devbP/fWSlBHVxME2rb+6batuUVvlYqVoZpeJBAs1m038NIATr4JZ29V86GhLvbADEV5yaFfoFLQnd29yPSys7zjosP4oS9vutsPgZYCyXRMtW1UKjizr4smjcd+WqG7+9hUb7H1MtndU5B5kSlPNH4x5obfWUg6dN/b5wBfl3n8s05ARmErVKnVooBm/JFbNpL0gxetzcSfXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=UMtereEJ/qD2wIAQN1rrkTlx/7K3K9RV02h6S6cIFQI=;
 b=I6ZfxLuAlWxLSPkTsmrW0mOhYmCVylgvYGzT1/+atRDswOtl/VHBg+5p1SnW/kqBh1LzKFXW0Y6b5WNvmS09b3FgBuhlZbsTjWI8SVDEHCqifXDxkoYv4HH0giJKQR69XM07kmgsdPp7lppuShEILiMW6yUOFtOhQceIK90/2Vw13CnUAY5Bp95nMe3nM9PEzTfl5Q2bBVKieIV1B5SI5kevwngs6A/xqlaMClPIJ2Ad6wvuu0odYwmGiGKbyTMeGwrsM+HymqJxVNcvXc6jow1oHPN/VkCbnpdsLaCr2AGay667vH6/IOKOhoBP8cQrMHqLcbzX21KUvzb0AaBuZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMtereEJ/qD2wIAQN1rrkTlx/7K3K9RV02h6S6cIFQI=;
 b=FmilMsvPJYqDN+9dwl9MdnLwC7WvkPSpvzYbBXgu3t6zaOvSNu4mPzDUNJTWVF/UdAhOJDN/Y6Q3JMg706oC7UJSDeW36C7v5endhGtP4ZV4Yae9HQ7nCsa+S6S8HvoD1yrpwd8ZnVc9kOf7LeYpcClt50voyyXjtv5ZL1fH62q9L4TkYFJufhK00aTJacDXYqpkx+9TyfsL3fjot3TvuNqKNF/rvrnukHxWnCKvw4lKi+RixLk2z71OS9xCAblRnr5wF7A1lNU8bLD9nLDEWiCrIhzYF32yoWy5+aLXkDaJa+wix7t5Tj49blULibuPUjcfiW9NPqB+au6EE3uvSA==
Received: from BN6PR1401CA0007.namprd14.prod.outlook.com
 (2603:10b6:405:4b::17) by DM6PR12MB3211.namprd12.prod.outlook.com
 (2603:10b6:5:15c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Tue, 7 Sep
 2021 07:31:04 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:4b:cafe::64) by BN6PR1401CA0007.outlook.office365.com
 (2603:10b6:405:4b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Tue, 7 Sep 2021 07:31:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 07:31:03 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 7 Sep
 2021 00:31:02 -0700
Received: from pshete-ubuntu.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 7 Sep 2021 07:30:59 +0000
From:   Prathamesh Shete <pshete@nvidia.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <smangipudi@nvidia.com>, <pshete@nvidia.com>
Subject: [PATCH v2 1/2] gpio: tegra: add multiple interrupt support
Date:   Tue, 7 Sep 2021 13:00:37 +0530
Message-ID: <20210907073038.2983-2-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210907073038.2983-1-pshete@nvidia.com>
References: <YTWeSJ7jGamxx9Uu@orome.fritz.box>
 <20210907073038.2983-1-pshete@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 804b5622-4cb6-4f60-7b02-08d971d17307
X-MS-TrafficTypeDiagnostic: DM6PR12MB3211:
X-Microsoft-Antispam-PRVS: <DM6PR12MB32117E4AFD949A70A3B1EEB7B7D39@DM6PR12MB3211.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EKYl7NTNd8T80FfOuu54XuDD7JEF0nuijdQTULrTa7AkwDaXh7SF2N68YdKwrFS1gHJrtoISprHLwaPbGCPM9JZuMh4NCvIEdR3DSWHfQshsdtGtaRVfILbKUBhjNjb5kcW2O0r99n9R6q00alQ7cKa6RR81+jwr7y2nSKirvrQ4+FKAWpebS7kLoCLXakuIon+S1JzX9M+gJqth/u5JR0UGyk0RuJ3bc/73JBf2s6rcwdDnnw78b6YoRsm1WwsJ/IWOWHrvkFnPHYEUS29Zsww93Z7vk3BUOffChZGYdA+hxOsqkgoNgudU317ZCjSvJuB7FbPX8vR8WP15F879ISK2rjsdD6Pvg7vOqGR96zMTI/F9XyKyWHAsyxyVU3ftK2ccy1rLrHoCKvaaM/L7eUrvSMP4slEWtYZDqMBUThuoQT5NAiW0HN7oV7aIS2UmO65fuTqg0Ys2HYdSVPu60nkFTkFnRpsDROc0UZ09blasVxaFRNlwFMZlihg8PQ1YoIqDoKEd22HLYtgAs9mEQaj5sI5RRoBu50g+iR3YiHhJYo1tunuKZGcJY6gUFTP2GvytNVhgXb7afBVHl7UEMj63xWor7g8IjmqZS/MRNTW11ZyzY9EhF4DjIHMjRh07hi46N7bEHhe3pkoTL+HHoVkjloOSQX01jsEQaG0pNC/4wnAJ6+kTQTZoMchTnPwgUeyuIJyM/5dKxjPR5VDqjA==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(46966006)(36840700001)(47076005)(316002)(6666004)(2906002)(110136005)(82310400003)(107886003)(7696005)(8936002)(70206006)(70586007)(8676002)(83380400001)(86362001)(5660300002)(54906003)(1076003)(478600001)(36860700001)(2616005)(186003)(36756003)(426003)(26005)(336012)(356005)(7636003)(4326008)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 07:31:03.9760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 804b5622-4cb6-4f60-7b02-08d971d17307
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3211
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: pshete <pshete@nvidia.com>

T19x GPIO controller's support multiple interrupts. The GPIO
controller is capable to route 8 interrupts per controller in
case of NON-AON GPIO's and 4 interrupts per controller in AON GPIO.
This is new feature starting T194
The interrupt route map determines which interrupt line is to be used.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index d38980b9923a..36bd8de6d401 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2016-2017 NVIDIA Corporation
+ * Copyright (c) 2016-2021 NVIDIA Corporation
  *
  * Author: Thierry Reding <treding@nvidia.com>
  */
@@ -68,6 +68,7 @@ struct tegra_gpio_soc {
 	unsigned int num_ports;
 	const char *name;
 	unsigned int instance;
+	bool multi_ints;
 
 	const struct tegra186_pin_range *pin_ranges;
 	unsigned int num_pin_ranges;
@@ -451,6 +452,7 @@ static void tegra186_gpio_irq(struct irq_desc *desc)
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int parent = irq_desc_get_irq(desc);
 	unsigned int i, offset = 0;
+	int j, flag;
 
 	chained_irq_enter(chip, desc);
 
@@ -462,9 +464,20 @@ static void tegra186_gpio_irq(struct irq_desc *desc)
 
 		base = gpio->base + port->bank * 0x1000 + port->port * 0x200;
 
-		/* skip ports that are not associated with this bank */
-		if (parent != gpio->irq[port->bank])
-			goto skip;
+		if (!gpio->soc->multi_ints) {
+			/* skip ports that are not associated with this bank */
+			if (parent != gpio->irq[port->bank])
+				goto skip;
+
+		} else {
+			flag = 0;
+			for (j = 0; j < 8; j++) {
+				if (parent != gpio->irq[(port->bank * 8) + j])
+					flag++;
+			}
+			if (!(flag & 0xF))
+				goto skip;
+		}
 
 		value = readl(base + TEGRA186_GPIO_INTERRUPT_STATUS(1));
 
@@ -772,6 +785,7 @@ static const struct tegra_gpio_soc tegra186_main_soc = {
 	.ports = tegra186_main_ports,
 	.name = "tegra186-gpio",
 	.instance = 0,
+	.multi_ints = false,
 };
 
 #define TEGRA186_AON_GPIO_PORT(_name, _bank, _port, _pins)	\
@@ -798,6 +812,7 @@ static const struct tegra_gpio_soc tegra186_aon_soc = {
 	.ports = tegra186_aon_ports,
 	.name = "tegra186-gpio-aon",
 	.instance = 1,
+	.multi_ints = false,
 };
 
 #define TEGRA194_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
@@ -852,6 +867,7 @@ static const struct tegra_gpio_soc tegra194_main_soc = {
 	.num_pin_ranges = ARRAY_SIZE(tegra194_main_pin_ranges),
 	.pin_ranges = tegra194_main_pin_ranges,
 	.pinmux = "nvidia,tegra194-pinmux",
+	.multi_ints = true,
 };
 
 #define TEGRA194_AON_GPIO_PORT(_name, _bank, _port, _pins)	\
@@ -875,6 +891,7 @@ static const struct tegra_gpio_soc tegra194_aon_soc = {
 	.ports = tegra194_aon_ports,
 	.name = "tegra194-gpio-aon",
 	.instance = 1,
+	.multi_ints = true,
 };
 
 static const struct of_device_id tegra186_gpio_of_match[] = {
-- 
2.17.1

