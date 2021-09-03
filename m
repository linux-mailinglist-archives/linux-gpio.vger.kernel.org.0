Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 922E23FFE12
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Sep 2021 12:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349091AbhICKQa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Sep 2021 06:16:30 -0400
Received: from mail-sn1anam02on2050.outbound.protection.outlook.com ([40.107.96.50]:6855
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1348987AbhICKQY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 3 Sep 2021 06:16:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1dnrPSriomCuJ8LfYO6nQdngSqU6HclpgbGmItjr9Cw2kUL45ufn47BVdjqKlD0WeET3oBKXVi6AN+YQj+5oxGbob8AZJ6IwKn5UX6oiQLfdW+Uk1JTWdnRE1DNtY6pcf4BxPW3A0Z7yvB7HiE3qYJzsPn8mJGT3J067T1TaJUjOnHZZJp1cHZqclVa1gyIdAUH06EcAkq/RrXupb49v5dgD/PLHxQV6mq0fHMfwYWnXmuBvdBePS8Jg7ZWvuJ3ge7WybZ7ZiCsayjOy21A6DUXC3Cc0Uj2hUHf+hewygbVSLMEYTxM0Yqhvfkb5crbFUDQ95Sz5B9OiVMwUEGVvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=FzaeHkjeR+l2hq6r9CccmsWRGKLdEzi++JN3uu1F14s=;
 b=JrhI7B6WjbUojtIQGQhxpI9MVZ2u/eElCnc2omiPDijnycMaN4MnLUuslhvl0gn4+Ub6PerEbmxqE9zcxun7z3lWk8rvW3EOUV4bqoL+c9vQmUzLrIuAngpBiuDzoA7wGJ4TUAWS+5bGLtQAcZ3KObK/YiOsN5PYLUGTeXRWHWbBeRUU10c83TXxC28csyMP/xNoKIYQ9vLpb2BlxUzaPphZ+0BSgsvu7A1MjzSxkNJMAC3BTBwJUJAgfmuCU4v7GxrwaN2LSQIbTWscCw1QLHS2lmsJargaH1FW/w7kv9y/H0GQvE0GW/x5m9KcPmouY3D0d7ITIV5ISQb+X5wyWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzaeHkjeR+l2hq6r9CccmsWRGKLdEzi++JN3uu1F14s=;
 b=WgFMelBxFrV3sON2HFgmBafRfIWaoo6BQ0W7DY+WBG4XdLzvqxWGPAJU9yHtm2hGtEZtLzHtpWYCythA3X4MHPSaudGiAJBYH84UYSxlezzCxD5iD+uqDWLYeLdUl91PQBTNQ7A2+yHayq4TNS0h0wx2E+G/NfckOYBDOnAFONV9cFIYm3rgsMwP3kM0Pvza1JaIJuEobclpO6ZfCqJt3jaGfDFeUzHo1spASZqYV+JVvhkuXPKX7GFI6sdQCYzHzO5LYGIXGKWhFp6qMqPQ9j5Wo1/wvgLKKIwy4qW2GgMi2yCmBVfm8zRMPa46jXZ9pp+Ck8JpUqc0BxHSTgzm1g==
Received: from CO2PR04CA0075.namprd04.prod.outlook.com (2603:10b6:102:1::43)
 by BN9PR12MB5130.namprd12.prod.outlook.com (2603:10b6:408:137::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Fri, 3 Sep
 2021 10:15:23 +0000
Received: from CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:102:1:cafe::5b) by CO2PR04CA0075.outlook.office365.com
 (2603:10b6:102:1::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20 via Frontend
 Transport; Fri, 3 Sep 2021 10:15:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT028.mail.protection.outlook.com (10.13.175.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 10:15:22 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 3 Sep
 2021 10:15:21 +0000
Received: from pshete-ubuntu.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Fri, 3 Sep 2021 10:15:18 +0000
From:   Prathamesh Shete <pshete@nvidia.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <smangipudi@nvidia.com>, <pshete@nvidia.com>
Subject: [PATCH v2 2/2] arm64: tegra: GPIO Interrupt entries
Date:   Fri, 3 Sep 2021 15:45:12 +0530
Message-ID: <20210903101512.32430-3-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210903101512.32430-1-pshete@nvidia.com>
References: <20210903101512.32430-1-pshete@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b49fbc8-35f7-4c17-8f2e-08d96ec3bd92
X-MS-TrafficTypeDiagnostic: BN9PR12MB5130:
X-Microsoft-Antispam-PRVS: <BN9PR12MB5130DB76FB49528CEA1BCA67B7CF9@BN9PR12MB5130.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cu3//M8OXFzOYj3AsC6F3KKn6fadRKf5HNw/rL2C/ZqrjBpagH30QvXr4E+8Ubd5IjBuA35WqsLBuuNwFZywKNOvHdabZFQPfm6nJv5EgKVUwsi6bBKNVn31msAfzM38oXTvnDvIhDapdcfg3FZ2sEdz3kopk0G3sJujJvCZyfoCFRI7jRfxpKEySb8pMHOn4jrHyvD1ndStPwqQj0WjmiJ0SsZhkBrPNMikP1spQXSb1qgScdecw8yopkfQ0qUMroQTjt+nsLa0q08yXL0gJ3Zi2blUrX1S6qRpY39bMjHSdSKIluRWeXf08F8lpW3BxaqYV7CyDA4CFA+2Bm5NtR2mBnk/I2i1PhdqFqurFSgN31E0XKUwclLTVf67b0cLznuJhffGBsnvZ0O3olM6LHLTOGfSm/GdRBlIp9dVcxSMQWm40zoHIrWzqRg1QycCUCnTsSsDEiL1M4qi+AyNqP6uPdWHZ7v2OozgsPskNZoXqbOlzcRJe+QFzU86pkkBcE81M2uvwxl5B37C24Z7lwNZRIrDJfotMRHfwuO1AWI4NCRI9qRV6eSCb2pBFwdljrSwywrIRYvDD4FpnCFSDARWNLq6V7jFvdyv/pjtlZyH7nZWzfGtHUyqKzP2Ap+WNKCwaUKN8heAKZ1gvNWwHnAS7NzISUaSoYp3OISe77AeAYVQVe5gBX4Bm+Vnl4ayO/Zvk1+z+xhvvjmgHseqtg==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966006)(36840700001)(86362001)(6666004)(47076005)(356005)(8676002)(8936002)(2906002)(70206006)(4326008)(26005)(186003)(1076003)(36860700001)(82310400003)(478600001)(36756003)(83380400001)(36906005)(54906003)(5660300002)(110136005)(7636003)(316002)(7696005)(336012)(107886003)(2616005)(70586007)(82740400003)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 10:15:22.6703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b49fbc8-35f7-4c17-8f2e-08d96ec3bd92
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5130
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: pshete <pshete@nvidia.com>

T19x supports 8 entries for GPIO controller.
This change adds the required interrupt entires for all GPIO controllers.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 49 +++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 2 deletions(-)

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
-- 
2.17.1

