Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C349B3FFE0D
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Sep 2021 12:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349092AbhICKQU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Sep 2021 06:16:20 -0400
Received: from mail-dm6nam08on2075.outbound.protection.outlook.com ([40.107.102.75]:60288
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1348987AbhICKQT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 3 Sep 2021 06:16:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEymaLeEutA0dB2ITzdV7cy+XBznz+9sCgwKOiMroGvcUnTYDtBTkkfL0YxMJx2SVSTykYTUp/ezwTTBwPhju7E6vKIsQ+qL1mHg5s3QQ9yEXNy+fA7XAexS5Kps0uTx/vFQ4UyzTD9wMbkOsIROL5I83ktgnUm9I1aqewcUNaacUUPFjh3L1WyhU2uJhFIhAnM7F6rnd/IUI2a7LkhpNN/xzjgatuV1GsTsaIgGb1LdJK+7GPo/neSOEmqFilyA3jJ8Lzt3FUIJNFQTlxPL/W42Q9VEfP02nqQsdY61SRhtjxhyWY7ZQh6uH0oIZK/VpyYKwj/ec97CTF+NeMDm2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=UMtereEJ/qD2wIAQN1rrkTlx/7K3K9RV02h6S6cIFQI=;
 b=SI0r3l/EagUqPUj9iX3+dOEs4hTrri2DK2gTq5AT1LZNrxL86jF3uwErwWCFcVXzWHAwk05bOirD+F7PYR/KqzKfTdFw1cvWFgLN8CUTQObu0wbbLITrVioi2mxWY2e/6VeTIcQ38gdZggQh1zVfh0Kks5w2/TiGD2OleKWExfqJTN4krtPavfFWGHTYZqlvgKBR44BHuY4pBt/2D+h/O/AJ6hBplIU1qdR0fCcXae/deCl/sVtzCfJEjXO/IVi+PYdTUv3wG4IY8LRUu8G8kqELk8zfOztc/Q/mPuHqWUTyzvaWwzexEHnSdd5BOyYLGg5obRW7OXuuBC8p5YWk0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=baylibre.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMtereEJ/qD2wIAQN1rrkTlx/7K3K9RV02h6S6cIFQI=;
 b=mVZ8T1h9PCEUa9aeXivG+5arCwLr1ntHqFIgE7tYEHwEYow7qkUl1s1pDtb2P74lg6w5PY/MWAdBD/Tv4hAWlzj1op8lgaDqW8zYpes4bsMvA2AYMVIjHTiH11jHnpmkEqMfURNWO4vTgmWjPbdqLmTzfh9+Tuzh5IptDsaomqCUFdU16l6Dm9qLeAIv9vjOArGDMe54y6bxaLOZVsMl/8ct34nCiU5zH2FeWnq8ms/mdc20pH/Zaz5HAn5Zk25vc34FjQxS8Mb29bMw/es658LHdjlu05G6spHVdsn2F/xHgteLWe5ZaUfCMOUm3CyrUZ6751PsZJGe2aQUIduRDA==
Received: from CO2PR04CA0104.namprd04.prod.outlook.com (2603:10b6:104:6::30)
 by CY4PR12MB1655.namprd12.prod.outlook.com (2603:10b6:910:11::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Fri, 3 Sep
 2021 10:15:18 +0000
Received: from CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:6:cafe::cc) by CO2PR04CA0104.outlook.office365.com
 (2603:10b6:104:6::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Fri, 3 Sep 2021 10:15:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 CO1NAM11FT007.mail.protection.outlook.com (10.13.174.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 10:15:17 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 3 Sep
 2021 10:15:17 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 3 Sep
 2021 10:15:16 +0000
Received: from pshete-ubuntu.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Fri, 3 Sep 2021 10:15:14 +0000
From:   Prathamesh Shete <pshete@nvidia.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <smangipudi@nvidia.com>, <pshete@nvidia.com>
Subject: [PATCH v2 1/2] gpio: tegra: add multiple interrupt support
Date:   Fri, 3 Sep 2021 15:45:11 +0530
Message-ID: <20210903101512.32430-2-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210903101512.32430-1-pshete@nvidia.com>
References: <20210903101512.32430-1-pshete@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c188020d-6bfc-4238-3236-08d96ec3ba97
X-MS-TrafficTypeDiagnostic: CY4PR12MB1655:
X-Microsoft-Antispam-PRVS: <CY4PR12MB16557A16B01C828EE5152A3BB7CF9@CY4PR12MB1655.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2cdqUTFN9Q7U7oYnpqnScm0D2O1uAx+FPRbE+1rDU1yBigmugSRzqICfobSOcjUS4j2WLgjcPDmyYZmhBzkUsP8frK2W5N+zB7wurINrhmtmFOLOZrch0SidDTScAkRbVmC2PrhWZGy7nMykOpL4JhwWbbEHvgzMaeCo0QBYo5udl4A8dQE5nvMxYI7/G0AE+aF05m3mKhopQFKRl3W9eGkDW4DCx4CF7DUF0/iZpaptqrFEXj0/VXRz3cizSvwDF7c3xHCofSvoaxLYep9nIx3DSYr38so9kTmFewRFctAao92jTWsSn1bDBMscr0dhlEOVzzHfUEJ4DkHxyIofy76mMrq1u2DG9xoUn2T5Yi8Wmr/f9rN3wfxbZZlOnNEn6dC+rtDsEQTl5KwnUvXOHWMOiddl2uJTeB24uzN/oTHLFPe9g0C30KemGgcYHLW2T+yVrOp9o4aEml6qOjujYmGhAc1ZOZEmtK+0qsZcp2wjYNwPzjfJ2OJtzO0OZX2lhiO1ki4Z4yn6blr4h5dvy3Zi4ioBSTTvbYmdmCHNkH4NIwXo2d1sciS2dyC0JM1cLReWsAON8Orryeof2m6bYkoW6K3TeUlHZhuEF6WkQ2i7hcGWRGZZ3F0ZoF6i+oy9toK1un74hgzqAfO5gBnoH7jIEKTTsVIKGlMeAPFYi/WjJg6pIedDerp/5w0pMiehAxcWnAakwL+maGdClG1lbA==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(36840700001)(46966006)(26005)(47076005)(186003)(2616005)(6666004)(86362001)(2906002)(82310400003)(4326008)(426003)(336012)(110136005)(1076003)(107886003)(54906003)(70586007)(7636003)(8936002)(83380400001)(316002)(36756003)(70206006)(8676002)(7696005)(5660300002)(36860700001)(478600001)(82740400003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 10:15:17.6815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c188020d-6bfc-4238-3236-08d96ec3ba97
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1655
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

