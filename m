Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94AAF4361B6
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Oct 2021 14:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbhJUMdy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Oct 2021 08:33:54 -0400
Received: from mail-dm6nam12on2085.outbound.protection.outlook.com ([40.107.243.85]:3274
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230190AbhJUMdx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Oct 2021 08:33:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUJabTsB10HZlPdRTXgu6TFBi9cWiLMJTdl1oJsC1/GBUFn+ZWTGgmj8p7iNwoQ0Bd8ZxE0Dl7hzTOEN5QxqWgmfhQvSCL1PbZiq7+Zm72Zim46XBeBCUNfQrlVj2cZ4fpkCBAKgKIjp0EECmYxaq1nyVZmZHTlkLuBx2xoRK48qVVEZ6bcwu6C9To8IAGay9SXPZZ60Sa7NGuAcbVr3cem/m3Y8zIDXGpG7X5BOwybvK5OXDTn3IV17GGQbDeWcBLIcMxKBe858ppsehJH/AuAcGhtWQptYhc0IfMHjC+fjj0OIk7hqwFLyGSLTXPXgRCcDIPYp7ezS0k7msYeEoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcX3ENn/ezgXNW98CnfVxoGsM/4inTlt+JZl780Hzmk=;
 b=WoTVK6xB5w2jJr8MTqcool5YAMxt0fJCRL0Jqj1UcTMzZPMgEeORiOjJyP7OhHdVQIH3qEWfLMaoeTncokgzxC1vBZJD/11E1BGVy3SSYoSabtupQybvAR6do5VWUAXIKRkmw/8tfoKy6Im8T9Xat4Mk+x/3amTwPCoYiJUzXYTnJP+xKi24B2707nSwzbXQ7GRUNWhvDNPxxG+1vFX4f8j2J0YlF4yX14NoNryfjK0VKXWUWd47/0h9dsi/duLFcgrE6ttZIPM/aSJRzJsTXZVSn1oDfYF4XCu3hiHonp8iVJL+vSqW/rA1wqu+9WGOmbPriY/eWsGZNfhicXsr8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcX3ENn/ezgXNW98CnfVxoGsM/4inTlt+JZl780Hzmk=;
 b=D/6u0Tkhdm/MfNFZB0Gou6gQd8xWAuCCGOzP3Qhul4JC8gEnDDTj4FQMcjqdrWnKJqx44zW4mwRSru7QEc5p6vDYIkZAzTqLF1nGnt/bNv+Y3t3YWAD/BafIvVFhEdAo2hPE2NGXQNjIP3R/BTajEc6aLv4am29h0C2MgvBDRQnElxdpzz5toOMkipJa3rt/G1Br7/+jk/KwN4y+T+VG9h0nnBMrrGZAbgNAftf2rr8Srn0hVQ9IM/U/XeQ/qRAqnPccilwZeDQn0muKn2R1if7IvxelUoKJfVK3EFeYTA/xm5vLe+/DtLOJ0jZk2KKYeKU/46vejVt2nm9IEaT2sg==
Received: from DM5PR21CA0039.namprd21.prod.outlook.com (2603:10b6:3:ed::25) by
 MWHPR1201MB2542.namprd12.prod.outlook.com (2603:10b6:300:e8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Thu, 21 Oct
 2021 12:31:35 +0000
Received: from DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ed:cafe::eb) by DM5PR21CA0039.outlook.office365.com
 (2603:10b6:3:ed::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.1 via Frontend
 Transport; Thu, 21 Oct 2021 12:31:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT019.mail.protection.outlook.com (10.13.172.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4628.16 via Frontend Transport; Thu, 21 Oct 2021 12:31:32 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 21 Oct
 2021 05:31:19 -0700
Received: from pshete-ubuntu.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 21 Oct 2021 05:31:17 -0700
From:   Prathamesh Shete <pshete@nvidia.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <smangipudi@nvidia.com>, <pshete@nvidia.com>
Subject: [PATCH 2/2] gpio: tegra186: Add support for Tegra234 gpio
Date:   Thu, 21 Oct 2021 18:00:21 +0530
Message-ID: <20211021123021.9602-2-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211021123021.9602-1-pshete@nvidia.com>
References: <20211021123021.9602-1-pshete@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6514bc4e-2812-41eb-78ce-08d9948eb725
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2542:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB2542851B8627764966431CAFB7BF9@MWHPR1201MB2542.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4dZVnkrF/aO6kjgScWsojD5wrl8VL4MxzbaEiUezJQitvtMZICLSf+vGuYqvl3aqPMXDDAW23zU7Dl97OridEd9imXpmUxuSR2Avj1Ov77hWgiPifLx/n5PJexpEv9ShglQd4WGMpFIjg61hF2oEPcQDOhFopG6yO/zPOvsxi/TlP58E8vKXfcK1it/2M4JT4geGar9OcSibJo9m45vqfbrt9a4EVbidsZ3w66R1uCe5wt/GBqDF2Gn8TByX7FYjudNDxo1Um528d0fkqj9wHU98dXMolEH9CWeDWBj7f9ety9oH5lu9VrDvBnXuaNYCUZMxH3GYqT52Wwl4kUkF+xFkPhnOMWtu0AFjLaJvFlEYMutGLewMuk35V4h/CLBbtW7uxZU+RLpqbRSyanjN5e3gbekOo6gpUb+zdHTrv3M73r4TOFc6sKlmTqFb92RPGdhlH34znO3oC8XtdgPK8Nwh8pclGprX8yAulOBBvI8o1fcDriL7qVCJRK+altjc4jUMM9VbzBtBY0fYfpJ3ZkIbx0qfYext1fzJPmW1UeSwSUcgXE+FZ17T9Cbdp+50t8UEpJgH24XiRbk9U6aJPiFjzazr5uYwZUDiitfa4Zuirc4xeA7z5QI3nFOKhBsUTsIdgwciR3fh7q5PYlVuldFzOVRXUw7H+gP/o3A1UrBSEY9PlMU/NpFtm93d1t1LC94gLUFl8x39BJ9UCmir1A==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(2616005)(7636003)(110136005)(7696005)(336012)(54906003)(36860700001)(83380400001)(186003)(4326008)(70206006)(107886003)(426003)(70586007)(8936002)(86362001)(47076005)(508600001)(2906002)(1076003)(36756003)(316002)(82310400003)(356005)(26005)(8676002)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 12:31:32.7439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6514bc4e-2812-41eb-78ce-08d9948eb725
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2542
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the Tegra234 GPIO bank configuration.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 74 ++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index d38980b9923a..edcc91b35e1e 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -14,6 +14,7 @@
 
 #include <dt-bindings/gpio/tegra186-gpio.h>
 #include <dt-bindings/gpio/tegra194-gpio.h>
+#include <dt-bindings/gpio/tegra234-gpio.h>
 
 /* security registers */
 #define TEGRA186_GPIO_CTL_SCR 0x0c
@@ -877,6 +878,73 @@ static const struct tegra_gpio_soc tegra194_aon_soc = {
 	.instance = 1,
 };
 
+#define TEGRA234_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
+	[TEGRA234_MAIN_GPIO_PORT_##_name] = {			\
+		.name = #_name,					\
+		.bank = _bank,					\
+		.port = _port,					\
+		.pins = _pins,					\
+	}
+
+static const struct tegra_gpio_port tegra234_main_ports[] = {
+	TEGRA234_MAIN_GPIO_PORT(A, 0, 0, 8),
+	TEGRA234_MAIN_GPIO_PORT(B, 0, 3, 1),
+	TEGRA234_MAIN_GPIO_PORT(C, 5, 1, 8),
+	TEGRA234_MAIN_GPIO_PORT(D, 5, 2, 4),
+	TEGRA234_MAIN_GPIO_PORT(E, 5, 3, 8),
+	TEGRA234_MAIN_GPIO_PORT(F, 5, 4, 6),
+	TEGRA234_MAIN_GPIO_PORT(G, 4, 0, 8),
+	TEGRA234_MAIN_GPIO_PORT(H, 4, 1, 8),
+	TEGRA234_MAIN_GPIO_PORT(I, 4, 2, 7),
+	TEGRA234_MAIN_GPIO_PORT(J, 5, 0, 6),
+	TEGRA234_MAIN_GPIO_PORT(K, 3, 0, 8),
+	TEGRA234_MAIN_GPIO_PORT(L, 3, 1, 4),
+	TEGRA234_MAIN_GPIO_PORT(M, 2, 0, 8),
+	TEGRA234_MAIN_GPIO_PORT(N, 2, 1, 8),
+	TEGRA234_MAIN_GPIO_PORT(P, 2, 2, 8),
+	TEGRA234_MAIN_GPIO_PORT(Q, 2, 3, 8),
+	TEGRA234_MAIN_GPIO_PORT(R, 2, 4, 6),
+	TEGRA234_MAIN_GPIO_PORT(X, 1, 0, 8),
+	TEGRA234_MAIN_GPIO_PORT(Y, 1, 1, 8),
+	TEGRA234_MAIN_GPIO_PORT(Z, 1, 2, 8),
+	TEGRA234_MAIN_GPIO_PORT(AC, 0, 1, 8),
+	TEGRA234_MAIN_GPIO_PORT(AD, 0, 2, 4),
+	TEGRA234_MAIN_GPIO_PORT(AE, 3, 3, 2),
+	TEGRA234_MAIN_GPIO_PORT(AF, 3, 4, 4),
+	TEGRA234_MAIN_GPIO_PORT(AG, 3, 2, 8)
+};
+
+static const struct tegra_gpio_soc tegra234_main_soc = {
+	.num_ports = ARRAY_SIZE(tegra234_main_ports),
+	.ports = tegra234_main_ports,
+	.name = "tegra234-gpio",
+	.instance = 0,
+};
+
+#define TEGRA234_AON_GPIO_PORT(_name, _bank, _port, _pins)	\
+	[TEGRA234_AON_GPIO_PORT_##_name] = {			\
+		.name = #_name,					\
+		.bank = _bank,					\
+		.port = _port,					\
+		.pins = _pins,					\
+	}
+
+static const struct tegra_gpio_port tegra234_aon_ports[] = {
+	TEGRA234_AON_GPIO_PORT(AA, 0, 4, 8),
+	TEGRA234_AON_GPIO_PORT(BB, 0, 5, 4),
+	TEGRA234_AON_GPIO_PORT(CC, 0, 2, 8),
+	TEGRA234_AON_GPIO_PORT(DD, 0, 3, 3),
+	TEGRA234_AON_GPIO_PORT(EE, 0, 0, 8),
+	TEGRA234_AON_GPIO_PORT(GG, 0, 1, 1)
+};
+
+static const struct tegra_gpio_soc tegra234_aon_soc = {
+	.num_ports = ARRAY_SIZE(tegra234_aon_ports),
+	.ports = tegra234_aon_ports,
+	.name = "tegra234-gpio-aon",
+	.instance = 1,
+};
+
 static const struct of_device_id tegra186_gpio_of_match[] = {
 	{
 		.compatible = "nvidia,tegra186-gpio",
@@ -890,6 +958,12 @@ static const struct of_device_id tegra186_gpio_of_match[] = {
 	}, {
 		.compatible = "nvidia,tegra194-gpio-aon",
 		.data = &tegra194_aon_soc
+	}, {
+		.compatible = "nvidia,tegra234-gpio",
+		.data = &tegra234_main_soc
+	}, {
+		.compatible = "nvidia,tegra234-gpio-aon",
+		.data = &tegra234_aon_soc
 	}, {
 		/* sentinel */
 	}
-- 
2.17.1

