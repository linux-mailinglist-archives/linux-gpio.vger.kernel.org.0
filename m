Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4C0A3FB372
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Aug 2021 11:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235604AbhH3JzF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Aug 2021 05:55:05 -0400
Received: from mail-mw2nam12on2087.outbound.protection.outlook.com ([40.107.244.87]:36983
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233248AbhH3JzE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 30 Aug 2021 05:55:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ocp3g7UQiiP3rGyd7n3xGuwQMoO8ES0fEQziwwxvnS4b+FkSG63r/wSsTI9OIPzFmEdi8EZ8K5hH7KPS8RdZTGiqpq23eQbGMa96TU6+v0JkI0aEpqqXlkqQhyMIPXfc3I+qE1DBATlX6o9klfUxk7txv7AuaW+XoTRkBgpa85s2s64ZwZjb3PQ+Kwqz/gtysMTWh0UVxy2Hix0dVH4/mPkbwg44hUC2KhxInq2asmLejf1UGgoId7Ps7KVj0pqF55pmwtGkJpxkpJ78JORVV2bRO0WIk4p4PzDqqAORnATFAbDscs042ep9RGcuNeg4jtL607T/Nh+6lEm2wiLoIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s47QFcFmSRPiolz2fjDz2yIY91VrxZQ1u5Adv/EuPIA=;
 b=iGpzSQdBhFrjppkS95CWOG7SuKNLMnuTyIntOdYuHiYsycdJx61Es5WTankCLNgooInJpWwAud1MzkeRYt0poaqgaXcixxFi6iq8WoWMDx0Ku2o3uknrech3lzic/TabVWFtU3yTp0kkmziqZGmmbQAba8cLDlc51hg6vDEzekQlElIFOPx8/RLYTNsPBGuKmhXBzkvGhqtK7hCted0mitc5AN93NfZLuLlrYoJAw8QtSKPQbDRc7b/oSZoP2tlW3iUNNuaCDRcuyiuRFSkqD1jmdpdtJY8PlcdktLjhPL7xLHD7Ix8WAcb9TPY1zm6U5CYIF00QHUAPTyG+eQ7mVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s47QFcFmSRPiolz2fjDz2yIY91VrxZQ1u5Adv/EuPIA=;
 b=SAFz1ip4CAZZdBaB+bLB8EPfLHZWfTN5v47FcmTyWLAgZPaoO3GDyciCzJYuyaH3l88ByMVaeBNQ9mmcqnaaR4R9u6XOUL0TqP6mPDd5dauBnIVrT+UEG+m/XG8a1AT+0CG+O0tfk6uPLyaYKIASAgteB7iETQADqguK07XDrCSIz2TwDDeoafqDoet4v6VhvAB6ejTR+xYaBOTMuzbN59+TkQY/VO8ncdKByEw1UwtNlRNWALXJyDVV/ra9VnvcBtq74vluS73JW58WgD+prBcc3BZIwtHZpyqVmuysCFqmrg8VeycEIPpOBW0bNuIeYDrMzRxWZ9zIxh+5D6tRxw==
Received: from CO1PR15CA0097.namprd15.prod.outlook.com (2603:10b6:101:21::17)
 by MWHPR1201MB0271.namprd12.prod.outlook.com (2603:10b6:301:57::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 30 Aug
 2021 09:54:03 +0000
Received: from CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:21:cafe::c4) by CO1PR15CA0097.outlook.office365.com
 (2603:10b6:101:21::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21 via Frontend
 Transport; Mon, 30 Aug 2021 09:54:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT060.mail.protection.outlook.com (10.13.175.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 09:54:02 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 30 Aug
 2021 09:54:02 +0000
Received: from pshete-ubuntu.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 30 Aug 2021 09:54:01 +0000
From:   Prathamesh Shete <pshete@nvidia.com>
To:     <linux-gpio@vger.kernel.org>
Subject: [PATCH] gpio: tegra: add multiple interrupt support
Date:   Mon, 30 Aug 2021 15:23:57 +0530
Message-ID: <20210830095357.21108-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcc138f5-4175-4852-752e-08d96b9c1924
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0271:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB027156690EBE881BE0FC242FB7CB9@MWHPR1201MB0271.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HQHxIIAyJ77atvsB+fcHo0COS3EbJ4Laa3CajQSs94jMWiyl+gaEEFQApyytLCucxmgSLVMSEmh6H7YvNuhE3oDPTu0j7YPu52iNZ1l0EbYWdLU5RamzNcckwF2djvGDPKGn6uGrmKfUjRWGeKkPDzZbkYuxDz7rACpORJl8LuLAiM+fKIpKic1myqPLiQ5nzKtt3CraSGmzzt7Oou66Jf1JBFJHYUZEG7qQiWDDbTv4GG/7J7l3GlZEw7EEDJwig6a0nBnTTJ4pn1cvo2I34mLAzBNaUAUSMtgKIowoB1iQUJQg5ivE8UjBdkIi+e8L2NUnbW5xrUEU/wqEScsutSnV7wchZRlvAnBH9251BW1VYoiV9hNXHU96s+h4fri9zp6Kb6f9IijekP2cvMIV8XoNMHauPlayUOYZu3n8QLRGZy+nMgamifBZaxpb71H4+NDDtk/w4iqDkTZ+pX3mO+qZp+fryMJvb3ocGCGVgEgE0BPCglvMpXMavdWeOFTZKcIbk1EBVz0flTKAFyVE6vft3u2IS5OXc1jYYEuWuQU6XzXoIVMVuIkHLqbxwKlwzcO3+O1nwJV6qLTgaWeK/Oarn/N37rqDzxU9Qu6wFtpLwZNcuF3rsEnw82r731rh/jT9DnLng/gEm5KYYkBhLO7A4IoiJB+cT95Lw8lqVsY+zZwK2JJg3qU+D7Ctt8zikvt+PozWrp5EoPzK42ca3w==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(36840700001)(46966006)(5660300002)(82310400003)(36906005)(2906002)(186003)(86362001)(6916009)(7696005)(1076003)(336012)(36860700001)(426003)(8676002)(26005)(36756003)(6666004)(356005)(7636003)(478600001)(8936002)(47076005)(82740400003)(70206006)(70586007)(316002)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 09:54:02.9476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc138f5-4175-4852-752e-08d96b9c1924
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0271
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: pshete <pshete@nvidia.com>

T19x GPIO controller's support multiple interrupts. The GPIO
controller is capable to route 8 interrupts per controller in
case of NON-AON GPIO's and 4 interrupts per controller in AON GPIO.

Signed-off-by: pshete <pshete@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 49 +++++++++++++++++++++++-
 drivers/gpio/gpio-tegra186.c             | 25 ++++++++++--
 2 files changed, 68 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index b7d532841390..c681a79c44ec 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -34,11 +34,53 @@
 			reg = <0x2200000 0x10000>,
 			      <0x2210000 0x10000>;
 			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
 			#gpio-cells = <2>;
@@ -1273,7 +1315,10 @@
 			reg-names = "security", "gpio";
 			reg = <0xc2f0000 0x1000>,
 			      <0xc2f1000 0x1000>;
-			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
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

