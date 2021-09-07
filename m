Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D0FB402466
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Sep 2021 09:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbhIGHd6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Sep 2021 03:33:58 -0400
Received: from mail-bn8nam11on2044.outbound.protection.outlook.com ([40.107.236.44]:42820
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232056AbhIGHd5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Sep 2021 03:33:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1cx8JAGqjqe/2Y2tNKc7ZmT8TyHSHFPVwSbeHRtiodSG7CeevVm43EZX1DN5+P6LkJOftHakvwdeZO1ydSiJR5Qgc6mdfTKfEL25Wtmz/a/pv2oa7UFOrvntrspDPO1iJ81jnMThKpnC6VQPJ8qtACMEYlnrv1hm8N8Ohxw8ZOSZ9mWEP2IqY+yjaXwJYwoou+cBg5J+n8Ax7sRNFquc1MTUwuQg6N1GMyyAPJ1GgzCvf3bUrEsWgqa2dt/vLt5FToNKrA7u6Kp9nV1hT4kVNIV6SAqE4gAyejAxmHAaXbMglt9yd7yBV98VbsHdW5dUPuNkZokUgDa9WqrURjaOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=IX9P3V5YEsGxgqjxY+cm3JlMA7tO8xfsdFbQ9vWlIMA=;
 b=i8V+t+0JagKfy7ZrnXT/4DKMlJVcb6hbNhBXW8fFMHrUeJIpBKUc3m/OAv5dS3LIE1pd3Tm9r0MGmjC5ro+Ypgr8qnGVup5+kdT6A2D9B3nLHzrXuAlV4adWQdstt0/pJkT6zXPzwtqcE3CaLAAltorGlON7B4ErVlgUWgqU/4agF7YXnLSVuGBNWeoaRH44lPJeht8695aNJpG4csYLR++CZE9UwNK+wEAegCzcAHYo2cHAyOsnSAIbntSusgGjQ+MsJsGaCjquh81BHPkanVJxtmCGoCtR+MHZJRHjWtMQkTD3+UrSnQXzfyqhQ/fx0/395hHQIuGvpn9+Plk5Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IX9P3V5YEsGxgqjxY+cm3JlMA7tO8xfsdFbQ9vWlIMA=;
 b=i8fZW+j5lGL2rTSpxR4K4r+hBF8liTbjKoiPffZpQD/9rRbiJ8ZquPzCO1j4H970Wn1oyAyVAkBN7Am/YaP1IzY7S/ACxinXZvDXPeYnNeoFtv1hFmbXfQacmHDv96+EeJkFs/16cdSi0ylolypmOrYdM8YcFzQ/LZQubNH3kOY6/a///LF24DOSD5e2I7a7kZbdM1Rs3F29btXu3jL4VQHVFZjFvGvgHl70cJiPG9s2CebGgaH7xoNyO9K0PMxwZXRbEFIchdYMsOWAmeiDR32RRF//Dg+tYf336CAUE5Ms5IDixX8uLqJHJhueBRbFECiAflghqCMxS9w4H6+DeA==
Received: from BN9PR03CA0889.namprd03.prod.outlook.com (2603:10b6:408:13c::24)
 by BN8PR12MB2866.namprd12.prod.outlook.com (2603:10b6:408:68::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Tue, 7 Sep
 2021 07:32:48 +0000
Received: from BN8NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13c:cafe::87) by BN9PR03CA0889.outlook.office365.com
 (2603:10b6:408:13c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Tue, 7 Sep 2021 07:32:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT035.mail.protection.outlook.com (10.13.177.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 07:32:48 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 7 Sep
 2021 00:32:47 -0700
Received: from pshete-ubuntu.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 7 Sep 2021 07:32:45 +0000
From:   Prathamesh Shete <pshete@nvidia.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <smangipudi@nvidia.com>, <pshete@nvidia.com>
Subject: [PATCH v3 1/2] gpio: tegra: add multiple interrupt support
Date:   Tue, 7 Sep 2021 13:02:23 +0530
Message-ID: <20210907073224.3070-2-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210907073224.3070-1-pshete@nvidia.com>
References: <YTWeSJ7jGamxx9Uu@orome.fritz.box>
 <20210907073224.3070-1-pshete@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6a69b2f-abc4-42af-fc31-08d971d1b160
X-MS-TrafficTypeDiagnostic: BN8PR12MB2866:
X-Microsoft-Antispam-PRVS: <BN8PR12MB2866D20326B8B486A1EC3AB9B7D39@BN8PR12MB2866.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B58wf8+5S558DcCTVByKzkKAkyFrkjw9A4W41j5dQE1TJLWHR4N+3u/yPDZv0+guVwgDsGLY6QuiuuH5A3yc544tHvThXLl29Zh0aHB5ZHL4BqU5p9kQuIIpJ0OwdS4O2QQqMN6PmlmtQrbxnwvPbBICzbp9mouIqZQfYPVQV3KsXhIQbDlLBOi1DOdIuDv0/jUTU/+/yMIwv2O5kH2m1y2B57GrmhRcpIbDtwDI/QMeC8BVkZhu6cNtoLhnvuFyWAO1kWXlaPCwxHLhRpp3pXjQUGVSQIZb9SbZl5Bxwp0AQ4qSuQLhn0p2ePvU8R+0/jnaaL63UXxPJPzgFxAesY+BsRg+tj4KWp3gINXOTOKgTKjHL1GP6PxDJe/TMdQYwiY90gfx6au43y6zQJcLS11LxZybrcPn60T1npvWMGoPBKK9OjTwWqpS/2sL8htzoQvThCXmRJS7g8iJB22lqb/WkZmL9OLmCqAi/hyb8WqTu6u/7TOidkyvF7Q2NVHozNiW3Tx8W0DZn5Vk97ZxPeCpBi+BRZS5K6wSv8RFi/9N7Nw/m3FuhzwY0G1wv3mGHBTn1TooVSJPsD3HseehFuRr14tDCTqsJxQUCvh3ezCKLZrseyMwBpObTxRtE1V9IW/4HZIoo5njVsLi1YL/3sQFpaH0hqpViE3zglGThpBh5jLJu+KN447qX+i0a1p1DqaBhhtDOsNAJrG6wb+/gg==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(46966006)(36840700001)(316002)(186003)(86362001)(26005)(5660300002)(426003)(110136005)(70586007)(36860700001)(70206006)(2906002)(83380400001)(107886003)(1076003)(82310400003)(8936002)(4326008)(478600001)(47076005)(54906003)(8676002)(82740400003)(36756003)(7696005)(6666004)(336012)(7636003)(356005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 07:32:48.6083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6a69b2f-abc4-42af-fc31-08d971d1b160
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2866
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: pshete <pshete@nvidia.com>

T19x GPIO controller's support multiple interrupts. The GPIO
controller is capable to route 8 interrupts per controller in
case of NON-AON GPIO's and 4 interrupts per controller in AON GPIO.
This is new feature starting Tegra194
The interrupt route map determines which interrupt line is to be used.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index d38980b9923a..c1172da9aebf 100644
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
@@ -450,7 +451,8 @@ static void tegra186_gpio_irq(struct irq_desc *desc)
 	struct irq_domain *domain = gpio->gpio.irq.domain;
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int parent = irq_desc_get_irq(desc);
-	unsigned int i, offset = 0;
+	unsigned int i, j, offset = 0;
+	int intr_cntr;
 
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
+			intr_cntr = 0;
+			for (j = 0; j < 8; j++) {
+				if (parent != gpio->irq[(port->bank * 8) + j])
+					intr_cntr++;
+			}
+			if (!(intr_cntr & 0xF))
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

