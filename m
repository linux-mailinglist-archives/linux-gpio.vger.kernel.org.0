Return-Path: <linux-gpio+bounces-27057-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2632CBD706D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 03:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C3A84E0282
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 01:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D396B28751B;
	Tue, 14 Oct 2025 01:57:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022096.outbound.protection.outlook.com [52.101.126.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2630520E03F;
	Tue, 14 Oct 2025 01:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760407042; cv=fail; b=aI74nL2ZHPLMba0ICRguQcCR89pQrt5YAdEvnaFUZzAIDoUzzLuKnkRv36gPywiL5074fQXPIpSrlHQgci5sfA5XBxSI+Guw0MCkGOwe5qHwQSD9Y9/d8X5Kjpg7IBHlYsANflDTP0HukKAMqGCr8BnWu4ByS+ifYBVDZKfeKw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760407042; c=relaxed/simple;
	bh=oT+0ESgJ4JpmWax+uDczlae2yHfnOvyVk7gQ0Jygp3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pGn+QOJYIbkuxiAm0XIA/Uz3YtogGED54PklGSOIuJCuJWcHKe88o69ouKrHU36wBrofpD6f6VWV9qHONA/kzs/GWyhtaLDPSV6XMxmT+hrcSblVwhDBuNfjspJsNq/BE3dAsV2d5TDqej768ZSXMs59poPu6n7kpIcsC9Pyq5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HhCKyXDasryGZXmmp/bXNlvmdHG7cJpt42LTuFYSaM4qNB/zJNo7GcXma3Em7kTKcOZsVrL8DVPGsyVxIUbK/EnVW9ybJB1haRB/sRMtOyFPOK9kSq40nPQsTUlbN7ERxD50/6IPyKfxhWpYzNfVHTFhaTW0jKhGp12WjH2i5mlxxwiQFCwqHjmH6/xkzim0TAmbyNJc+DKIZzZiUE6QxM8Lxhm+NY0ZRvZTeVPZmSBhzUJiWSMcsmXFksaK4fQRuSy2LT0B/icHaRd5hPEpmOORl3Aogff/RLV9VSCx9WOrh+tr6yu/dqyuZ3sLWPI+C2AOwIw8vQSpNxxlsUCERQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcS+4Q1Jlb78yXoQv0BR4xKCq+1IbVqn8l1qCuNYyzo=;
 b=F9hS60uswLXdsyuf1yVnACch3xpCmd5wxGMVH8GQ4Ih+3ZBFht86Ls2i+Kn2lnMU7CcVs2788af0XXBFr+XZWTeO17d60skKhxemBm1oFWRUBNVuwY19ekW6rFDh1EDwjha0rHkWxHeaMj/PeWODcoLVOCQkELW8PkGgxU5s/vQn227dTN+Wvor61kUKTC9tUKL1OXzLpHrJ+Stqr8p4PZ5If0mcnNz9t4wNppUo2gjiNJ3EVYrQQxFmdbVS8X3ffsGW8EEyRRkxaA30A9zmf6Rs3YTDPe8N8U7OUCbER6rGY5mtcmq3gJN40U55akYdzld/ADJTh2FUmQS0niM7QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0008.apcprd02.prod.outlook.com (2603:1096:4:1f7::14)
 by SE1PPF93ED7187F.apcprd06.prod.outlook.com (2603:1096:108:1::420) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Tue, 14 Oct
 2025 01:57:13 +0000
Received: from SG1PEPF000082E5.apcprd02.prod.outlook.com
 (2603:1096:4:1f7:cafe::9b) by SI1PR02CA0008.outlook.office365.com
 (2603:1096:4:1f7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Tue,
 14 Oct 2025 01:57:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E5.mail.protection.outlook.com (10.167.240.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Tue, 14 Oct 2025 01:57:12 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 7244640A5BDA;
	Tue, 14 Oct 2025 09:57:12 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v3 3/3] arm64: dts: cix: Add pinctrl nodes for sky1
Date: Tue, 14 Oct 2025 09:57:12 +0800
Message-ID: <20251014015712.2922237-4-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251014015712.2922237-1-gary.yang@cixtech.com>
References: <20251014015712.2922237-1-gary.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E5:EE_|SE1PPF93ED7187F:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 90d79d86-496d-479b-11dc-08de0ac4fe6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q3ePgGhr2onhE+zCRU8VRcp/2B6NzUuUdt6W/iDEmV0BMroq3Hto5GiIWhnc?=
 =?us-ascii?Q?Pxs41pv6gRd7rXXs0yKdLzpe2CySfdRBtIAgV4cMj2AWWBcwqn8IknvswCI+?=
 =?us-ascii?Q?kTbq8zm0CzhmP/L8FnopFmKRC2i6NOgaWE3nMc9DTRY8t1c59BUR68l1gHH0?=
 =?us-ascii?Q?0A07skUlH0um6sEb+KKUozqC+2B+9vQLsvHl/MINx/eMYVqSAPNbwkZFovXi?=
 =?us-ascii?Q?gg6HWxGTYx7QcZNMP7DjFO4giR26w3jZXn6ZYQcu+SLWcto0OThUdSuUubQP?=
 =?us-ascii?Q?Svh+xIeVJbOi/6fPGjXVypTpv+02bRo5Us0dYqKPsHzEzq0YgsW5IhYrzkyB?=
 =?us-ascii?Q?yFx2c3H6EUkgjx2+UFkX57/nzIsbSkO42okF/x4xzAeeNOjzvHTiB4rLBZOy?=
 =?us-ascii?Q?MF5a8iJgqCvk0OQInm5QGPMgWuOnedJm7ZyJLClqrKO3n2U88hpMeVmZutTl?=
 =?us-ascii?Q?2hmPa7fNhFyPJeeSqK7rHPxRFEZf6IgoGSPXk+0JH6w6UHlLrrbMxssUsqMQ?=
 =?us-ascii?Q?/2VW9HprQrlJwi6lA20ERgNcXTzVM/+unF6SyCN4ktPna4uPleK9R2PAuTG3?=
 =?us-ascii?Q?WKksykrIxHiZ8S2F9yZJEa7QvesJcSf4xa7k0ZI+hPaksvEtLzhCwjKhJHm7?=
 =?us-ascii?Q?cEsndXVerIBp/iAyrKez0BYi8gwHyzZUA82FWsrcSgbmGSahlrtVkLRnSHyG?=
 =?us-ascii?Q?eqS/sQvgTlCCI1O28dCETphb4tMUXHOZgL5+YYorL1M/KDyYDGc5MCakehcK?=
 =?us-ascii?Q?JtD5UW/nRvyOVpZryjJM8WE1QTsk5rGYxfaw5XTUw+Fu1/L49WPKHP0yAOtr?=
 =?us-ascii?Q?bHuD5AksuUzVBfwhZc7BuqVJ+U95SZ609eAWIkB+QOA1chz+HpveV0pQ04U8?=
 =?us-ascii?Q?DgplEvm/6R4w1CFViDg5OIplvHlcj707V6R8NaU94biIX6/xRN/ghmiHwEGY?=
 =?us-ascii?Q?DaUCmx8YBdSUUhu6AK5PLkP1lavszftLtko8xfCffG95wmt4U8I9bSYLW/m1?=
 =?us-ascii?Q?jiavMF7rUIa0h9l7XCXLWCo5vUwyNxnsbd/XByGCKzZZykc1jeX9dDHIb011?=
 =?us-ascii?Q?FiZ+MUnX/AE2UmYRgBCa6qX4JDkXW/GFeEdCckFRh9LnektHVu4QvM6TtW6H?=
 =?us-ascii?Q?A9hL9lEP/4LDuIyYHdf0OJbD42IZjHO1kiuWE6aZPwnElOU5eTURSuYe5q02?=
 =?us-ascii?Q?boRKtZMgMbNU5KfrZrnQGzlCt6WJXHmIRp65TmQErjiypNf05Uv6UpF8WZ0m?=
 =?us-ascii?Q?JDO8lsLPV7PpmzDrbisg0q/JFjNt8sFjUqB/hl6APE5Pv84bbceAYoav8p54?=
 =?us-ascii?Q?o/qESvp3pjpJkIWLkkfAKEriBy2qP5Qccck7+5mi1C0sftM2yMGwQQ1EnGAc?=
 =?us-ascii?Q?YtyWJGvk8HMvGDJtyNC2BC8RzTumV3JMjwcs9a/SedrLh+9mYDKBD+IKOazy?=
 =?us-ascii?Q?I+E7fiE3ab3ZN10SBwnnQd64fForR2ryY+XVac2sIbUc6qVUBHt7ZxcM+LF0?=
 =?us-ascii?Q?Z8f9+171EL5Ftr13kUtSNIWPtbAsBY9VoNJVgkM1qgGpirUpTfjqXxrBHAav?=
 =?us-ascii?Q?EKVEvUzcPZ5IY6XtzxQ=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 01:57:12.9688
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d79d86-496d-479b-11dc-08de0ac4fe6b
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF93ED7187F

Add the pin-controller nodes for Sky1 platform.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts |  32 ++
 arch/arm64/boot/dts/cix/sky1-pinfunc.h    | 417 ++++++++++++++++++++++
 arch/arm64/boot/dts/cix/sky1.dtsi         |  10 +
 3 files changed, 459 insertions(+)
 create mode 100644 arch/arm64/boot/dts/cix/sky1-pinfunc.h

diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
index d74964d53c3b..a35a15471a1d 100644
--- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
+++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
@@ -7,6 +7,8 @@
 /dts-v1/;
 
 #include "sky1.dtsi"
+#include "sky1-pinfunc.h"
+
 / {
 	model = "Radxa Orion O6";
 	compatible = "radxa,orion-o6", "cix,sky1";
@@ -34,6 +36,36 @@ linux,cma {
 
 };
 
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
+	pinctrl_hog: hog-pins {
+		pins {
+			pinmux = <CIX_PAD_GPIO144_FUNC_GPIO144>,
+				<CIX_PAD_GPIO145_FUNC_GPIO145>,
+				<CIX_PAD_GPIO146_FUNC_GPIO146>,
+				<CIX_PAD_GPIO147_FUNC_GPIO147>;
+			bias-pull-down;
+			drive-strength = <DS_LEVEL4>;
+		};
+	};
+};
+
+&iomuxc_s5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog_s5>;
+
+	pinctrl_hog_s5: hog-s5-pins {
+		pins {
+			pinmux = <CIX_PAD_GPIO014_FUNC_GPIO014>;
+			bias-pull-up;
+			drive-strength = <DS_LEVEL4>;
+
+		};
+	};
+};
+
 &uart2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/cix/sky1-pinfunc.h b/arch/arm64/boot/dts/cix/sky1-pinfunc.h
new file mode 100644
index 000000000000..bb2815903cb8
--- /dev/null
+++ b/arch/arm64/boot/dts/cix/sky1-pinfunc.h
@@ -0,0 +1,417 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2024-2025 Cix Technology Group Co., Ltd.
+ */
+
+#ifndef __CIX_SKY1_H
+#define __CIX_SKY1_H
+
+/* s5 pads */
+#define CIX_PAD_GPIO001_FUNC_GPIO001				   (0 << 8 | 0x0)
+#define CIX_PAD_GPIO002_FUNC_GPIO002				   (1 << 8 | 0x0)
+#define CIX_PAD_GPIO003_FUNC_GPIO003				   (2 << 8 | 0x0)
+#define CIX_PAD_GPIO004_FUNC_GPIO004				   (3 << 8 | 0x0)
+#define CIX_PAD_GPIO005_FUNC_GPIO005				   (4 << 8 | 0x0)
+#define CIX_PAD_GPIO006_FUNC_GPIO006				   (5 << 8 | 0x0)
+#define CIX_PAD_GPIO007_FUNC_GPIO007				   (6 << 8 | 0x0)
+#define CIX_PAD_GPIO008_FUNC_GPIO008				   (7 << 8 | 0x0)
+#define CIX_PAD_GPIO009_FUNC_GPIO009				   (8 << 8 | 0x0)
+#define CIX_PAD_GPIO010_FUNC_GPIO010				   (9 << 8 | 0x0)
+#define CIX_PAD_GPIO011_FUNC_GPIO011				   (10 << 8 | 0x0)
+#define CIX_PAD_GPIO012_FUNC_GPIO012				   (11 << 8 | 0x0)
+#define CIX_PAD_GPIO013_FUNC_GPIO013				   (12 << 8 | 0x0)
+#define CIX_PAD_GPIO014_FUNC_GPIO014				   (13 << 8 | 0x0)
+#define CIX_PAD_SFI_I2C0_SCL_FUNC_SFI_I2C0_SCL			   (28 << 8 | 0x0)
+#define CIX_PAD_SFI_I2C0_SCL_FUNC_SFI_I3C0_SCL			   (28 << 8 | 0x1)
+#define CIX_PAD_SFI_I2C0_SDA_FUNC_SFI_I2C0_SDA			   (29 << 8 | 0x0)
+#define CIX_PAD_SFI_I2C0_SDA_FUNC_SFI_I3C0_SDA			   (29 << 8 | 0x1)
+#define CIX_PAD_SFI_I2C1_SCL_FUNC_SFI_I2C1_SCL			   (30 << 8 | 0x0)
+#define CIX_PAD_SFI_I2C1_SCL_FUNC_SFI_I3C1_SCL			   (30 << 8 | 0x1)
+#define CIX_PAD_SFI_I2C1_SCL_FUNC_SFI_SPI_CS0			   (30 << 8 | 0x2)
+#define CIX_PAD_SFI_I2C1_SDA_FUNC_SFI_I2C1_SDA			   (31 << 8 | 0x0)
+#define CIX_PAD_SFI_I2C1_SDA_FUNC_SFI_I3C1_SDA			   (31 << 8 | 0x1)
+#define CIX_PAD_SFI_I2C1_SDA_FUNC_SFI_SPI_CS1			   (31 << 8 | 0x2)
+#define CIX_PAD_SFI_GPIO0_FUNC_GPIO015				   (32 << 8 | 0x0)
+#define CIX_PAD_SFI_GPIO0_FUNC_SFI_SPI_SCK			   (32 << 8 | 0x1)
+#define CIX_PAD_SFI_GPIO0_FUNC_SFI_GPIO0			   (32 << 8 | 0x2)
+#define CIX_PAD_SFI_GPIO1_FUNC_GPIO016				   (33 << 8 | 0x0)
+#define CIX_PAD_SFI_GPIO1_FUNC_SFI_SPI_MOSI			   (33 << 8 | 0x1)
+#define CIX_PAD_SFI_GPIO1_FUNC_SFI_GPIO1			   (33 << 8 | 0x2)
+#define CIX_PAD_SFI_GPIO2_FUNC_GPIO017				   (34 << 8 | 0x0)
+#define CIX_PAD_SFI_GPIO2_FUNC_SFI_SPI_MISO			   (34 << 8 | 0x1)
+#define CIX_PAD_SFI_GPIO2_FUNC_SFI_GPIO2			   (34 << 8 | 0x2)
+#define CIX_PAD_GPIO018_FUNC_SFI_GPIO3				   (35 << 8 | 0x0)
+#define CIX_PAD_GPIO018_FUNC_GPIO018				   (35 << 8 | 0x1)
+#define CIX_PAD_GPIO019_FUNC_SFI_GPIO4				   (36 << 8 | 0x0)
+#define CIX_PAD_GPIO019_FUNC_GPIO019				   (36 << 8 | 0x1)
+#define CIX_PAD_GPIO020_FUNC_SFI_GPIO5				   (37 << 8 | 0x0)
+#define CIX_PAD_GPIO020_FUNC_GPIO020				   (37 << 8 | 0x1)
+#define CIX_PAD_GPIO021_FUNC_SFI_GPIO6				   (38 << 8 | 0x0)
+#define CIX_PAD_GPIO021_FUNC_GPIO021				   (38 << 8 | 0x1)
+#define CIX_PAD_GPIO022_FUNC_SFI_GPIO7				   (39 << 8 | 0x0)
+#define CIX_PAD_GPIO022_FUNC_GPIO022				   (39 << 8 | 0x1)
+#define CIX_PAD_GPIO023_FUNC_SFI_GPIO8				   (40 << 8 | 0x0)
+#define CIX_PAD_GPIO023_FUNC_GPIO023				   (40 << 8 | 0x1)
+#define CIX_PAD_GPIO023_FUNC_SFI_I3C0_PUR_EN_L			   (40 << 8 | 0x2)
+#define CIX_PAD_GPIO024_FUNC_SFI_GPIO9				   (41 << 8 | 0x0)
+#define CIX_PAD_GPIO024_FUNC_GPIO024				   (41 << 8 | 0x1)
+#define CIX_PAD_GPIO024_FUNC_SFI_I3C1_PUR_EN_L			   (41 << 8 | 0x2)
+#define CIX_PAD_SPI1_MISO_FUNC_SPI1_MISO			   (42 << 8 | 0x0)
+#define CIX_PAD_SPI1_MISO_FUNC_GPIO025				   (42 << 8 | 0x1)
+#define CIX_PAD_SPI1_CS0_FUNC_SPI1_CS0				   (43 << 8 | 0x0)
+#define CIX_PAD_SPI1_CS0_FUNC_GPIO026				   (43 << 8 | 0x1)
+#define CIX_PAD_SPI1_CS1_FUNC_SPI1_CS1				   (44 << 8 | 0x0)
+#define CIX_PAD_SPI1_CS1_FUNC_GPIO027				   (44 << 8 | 0x1)
+#define CIX_PAD_SPI1_MOSI_FUNC_SPI1_MOSI			   (45 << 8 | 0x0)
+#define CIX_PAD_SPI1_MOSI_FUNC_GPIO028				   (45 << 8 | 0x1)
+#define CIX_PAD_SPI1_CLK_FUNC_SPI1_CLK				   (46 << 8 | 0x0)
+#define CIX_PAD_SPI1_CLK_FUNC_GPIO029				   (46 << 8 | 0x1)
+#define CIX_PAD_GPIO030_FUNC_GPIO030				   (47 << 8 | 0x0)
+#define CIX_PAD_GPIO030_FUNC_USB_OC0_L				   (47 << 8 | 0x1)
+#define CIX_PAD_GPIO031_FUNC_GPIO031				   (48 << 8 | 0x0)
+#define CIX_PAD_GPIO031_FUNC_USB_OC1_L				   (48 << 8 | 0x1)
+#define CIX_PAD_GPIO032_FUNC_GPIO032				   (49 << 8 | 0x0)
+#define CIX_PAD_GPIO032_FUNC_USB_OC2_L				   (49 << 8 | 0x1)
+#define CIX_PAD_GPIO033_FUNC_GPIO033				   (50 << 8 | 0x0)
+#define CIX_PAD_GPIO033_FUNC_USB_OC3_L				   (50 << 8 | 0x1)
+#define CIX_PAD_GPIO034_FUNC_GPIO034				   (51 << 8 | 0x0)
+#define CIX_PAD_GPIO034_FUNC_USB_OC4_L				   (51 << 8 | 0x1)
+#define CIX_PAD_GPIO035_FUNC_GPIO035				   (52 << 8 | 0x0)
+#define CIX_PAD_GPIO035_FUNC_USB_OC5_L				   (52 << 8 | 0x1)
+#define CIX_PAD_GPIO036_FUNC_GPIO036				   (53 << 8 | 0x0)
+#define CIX_PAD_GPIO036_FUNC_USB_OC6_L				   (53 << 8 | 0x1)
+#define CIX_PAD_GPIO037_FUNC_GPIO037				   (54 << 8 | 0x0)
+#define CIX_PAD_GPIO037_FUNC_USB_OC7_L				   (54 << 8 | 0x1)
+#define CIX_PAD_GPIO038_FUNC_GPIO038				   (55 << 8 | 0x0)
+#define CIX_PAD_GPIO038_FUNC_USB_OC8_L				   (55 << 8 | 0x1)
+#define CIX_PAD_GPIO039_FUNC_GPIO039				   (56 << 8 | 0x0)
+#define CIX_PAD_GPIO039_FUNC_USB_OC9_L				   (56 << 8 | 0x1)
+#define CIX_PAD_GPIO040_FUNC_GPIO040				   (57 << 8 | 0x0)
+#define CIX_PAD_GPIO040_FUNC_USB_DRIVE_VBUS0			   (57 << 8 | 0x1)
+#define CIX_PAD_GPIO041_FUNC_GPIO041				   (58 << 8 | 0x0)
+#define CIX_PAD_GPIO041_FUNC_USB_DRIVE_VBUS4			   (58 << 8 | 0x1)
+#define CIX_PAD_GPIO042_FUNC_GPIO042				   (59 << 8 | 0x0)
+#define CIX_PAD_GPIO042_FUNC_USB_DRIVE_VBUS5			   (59 << 8 | 0x1)
+#define CIX_PAD_SE_QSPI_CLK_FUNC_SE_QSPI_CLK			   (60 << 8 | 0x0)
+#define CIX_PAD_SE_QSPI_CLK_FUNC_QSPI_CLK			   (60 << 8 | 0x1)
+#define CIX_PAD_SE_QSPI_CS_L_FUNC_SE_QSPI_CS_L			   (61 << 8 | 0x0)
+#define CIX_PAD_SE_QSPI_CS_L_FUNC_QSPI_CS_L			   (61 << 8 | 0x1)
+#define CIX_PAD_SE_QSPI_DATA0_FUNC_SE_QSPI_DATA0		   (62 << 8 | 0x0)
+#define CIX_PAD_SE_QSPI_DATA0_FUNC_QSPI_DATA0			   (62 << 8 | 0x1)
+#define CIX_PAD_SE_QSPI_DATA1_FUNC_SE_QSPI_DATA1		   (63 << 8 | 0x0)
+#define CIX_PAD_SE_QSPI_DATA1_FUNC_QSPI_DATA1			   (63 << 8 | 0x1)
+#define CIX_PAD_SE_QSPI_DATA2_FUNC_SE_QSPI_DATA2		   (64 << 8 | 0x0)
+#define CIX_PAD_SE_QSPI_DATA2_FUNC_QSPI_DATA2			   (64 << 8 | 0x1)
+#define CIX_PAD_SE_QSPI_DATA3_FUNC_SE_QSPI_DATA3		   (65 << 8 | 0x0)
+#define CIX_PAD_SE_QSPI_DATA3_FUNC_QSPI_DATA3			   (65 << 8 | 0x1)
+/* s0 pads */
+#define CIX_PAD_GPIO043_FUNC_GPIO043				   (0 << 8 | 0x0)
+#define CIX_PAD_GPIO044_FUNC_GPIO044				   (1 << 8 | 0x0)
+#define CIX_PAD_GPIO045_FUNC_GPIO045				   (2 << 8 | 0x0)
+#define CIX_PAD_GPIO046_FUNC_GPIO046				   (3 << 8 | 0x0)
+#define CIX_PAD_DP2_DIGON_FUNC_DP2_DIGON			   (18 << 8 | 0x0)
+#define CIX_PAD_DP2_BLON_FUNC_DP2_BLON				   (19 << 8 | 0x0)
+#define CIX_PAD_DP2_VARY_BL_FUNC_DP2_VARY_BL			   (20 << 8 | 0x0)
+#define CIX_PAD_I2C7_SCL_FUNC_I2C7_SCL				   (21 << 8 | 0x0)
+#define CIX_PAD_I2C7_SDA_FUNC_I2C7_SDA				   (22 << 8 | 0x0)
+#define CIX_PAD_I2C5_SCL_FUNC_I2C5_SCL				   (26 << 8 | 0x0)
+#define CIX_PAD_I2C5_SCL_FUNC_GPIO047				   (26 << 8 | 0x1)
+#define CIX_PAD_I2C5_SDA_FUNC_I2C5_SDA				   (27 << 8 | 0x0)
+#define CIX_PAD_I2C5_SDA_FUNC_GPIO048				   (27 << 8 | 0x1)
+#define CIX_PAD_I2C6_SCL_FUNC_I2C6_SCL				   (28 << 8 | 0x0)
+#define CIX_PAD_I2C6_SCL_FUNC_GPIO049				   (28 << 8 | 0x1)
+#define CIX_PAD_I2C6_SDA_FUNC_I2C6_SDA				   (29 << 8 | 0x0)
+#define CIX_PAD_I2C6_SDA_FUNC_GPIO050				   (29 << 8 | 0x1)
+#define CIX_PAD_I2C0_CLK_FUNC_I2C0_CLK				   (30 << 8 | 0x0)
+#define CIX_PAD_I2C0_CLK_FUNC_GPIO051				   (30 << 8 | 0x1)
+#define CIX_PAD_I2C0_SDA_FUNC_I2C0_SDA				   (31 << 8 | 0x0)
+#define CIX_PAD_I2C0_SDA_FUNC_GPIO052				   (31 << 8 | 0x1)
+#define CIX_PAD_I2C1_CLK_FUNC_I2C1_CLK				   (32 << 8 | 0x0)
+#define CIX_PAD_I2C1_CLK_FUNC_GPIO053				   (32 << 8 | 0x1)
+#define CIX_PAD_I2C1_SDA_FUNC_I2C1_SDA				   (33 << 8 | 0x0)
+#define CIX_PAD_I2C1_SDA_FUNC_GPIO054				   (33 << 8 | 0x1)
+#define CIX_PAD_I2C2_SCL_FUNC_I2C2_SCL				   (34 << 8 | 0x0)
+#define CIX_PAD_I2C2_SCL_FUNC_I3C0_SCL				   (34 << 8 | 0x1)
+#define CIX_PAD_I2C2_SCL_FUNC_GPIO055				   (34 << 8 | 0x2)
+#define CIX_PAD_I2C2_SDA_FUNC_I2C2_SDA				   (35 << 8 | 0x0)
+#define CIX_PAD_I2C2_SDA_FUNC_I3C0_SDA				   (35 << 8 | 0x1)
+#define CIX_PAD_I2C2_SDA_FUNC_GPIO056				   (35 << 8 | 0x2)
+#define CIX_PAD_GPIO057_FUNC_GPIO057				   (36 << 8 | 0x0)
+#define CIX_PAD_GPIO057_FUNC_I3C0_PUR_EN_L			   (36 << 8 | 0x1)
+#define CIX_PAD_I2C3_CLK_FUNC_I2C3_CLK				   (37 << 8 | 0x0)
+#define CIX_PAD_I2C3_CLK_FUNC_I3C1_CLK				   (37 << 8 | 0x1)
+#define CIX_PAD_I2C3_CLK_FUNC_GPIO058				   (37 << 8 | 0x2)
+#define CIX_PAD_I2C3_SDA_FUNC_I2C3_SDA				   (38 << 8 | 0x0)
+#define CIX_PAD_I2C3_SDA_FUNC_I3C1_SDA				   (38 << 8 | 0x1)
+#define CIX_PAD_I2C3_SDA_FUNC_GPIO059				   (38 << 8 | 0x2)
+#define CIX_PAD_GPIO060_FUNC_GPIO060				   (39 << 8 | 0x0)
+#define CIX_PAD_GPIO060_FUNC_I3C1_PUR_EN_L			   (39 << 8 | 0x1)
+#define CIX_PAD_I2C4_CLK_FUNC_I2C4_CLK				   (40 << 8 | 0x0)
+#define CIX_PAD_I2C4_CLK_FUNC_GPIO061				   (40 << 8 | 0x1)
+#define CIX_PAD_I2C4_SDA_FUNC_I2C4_SDA				   (41 << 8 | 0x0)
+#define CIX_PAD_I2C4_SDA_FUNC_GPIO062				   (41 << 8 | 0x1)
+#define CIX_PAD_HDA_BITCLK_FUNC_HDA_BITCLK			   (42 << 8 | 0x0)
+#define CIX_PAD_HDA_BITCLK_FUNC_I2S0_SCK			   (42 << 8 | 0x1)
+#define CIX_PAD_HDA_BITCLK_FUNC_I2S9_RSCK_DBG			   (42 << 8 | 0x2)
+#define CIX_PAD_HDA_RST_L_FUNC_HDA_RST_L			   (43 << 8 | 0x0)
+#define CIX_PAD_HDA_RST_L_FUNC_I2S0_DATA_IN			   (43 << 8 | 0x1)
+#define CIX_PAD_HDA_RST_L_FUNC_I2S9_DATA_IN0_DBG		   (43 << 8 | 0x2)
+#define CIX_PAD_HDA_SDIN0_FUNC_HDA_SDIN0			   (44 << 8 | 0x0)
+#define CIX_PAD_HDA_SDIN0_FUNC_I2S0_MCLK			   (44 << 8 | 0x1)
+#define CIX_PAD_HDA_SDIN0_FUNC_I2S9_TSCK_DBG			   (44 << 8 | 0x2)
+#define CIX_PAD_HDA_SDOUT0_FUNC_HDA_SDOUT0			   (45 << 8 | 0x0)
+#define CIX_PAD_HDA_SDOUT0_FUNC_I2S0_DATA_OUT			   (45 << 8 | 0x1)
+#define CIX_PAD_HDA_SDOUT0_FUNC_I2S9_TWS_DBG		           (45 << 8 | 0x2)
+#define CIX_PAD_HDA_SYNC_FUNC_HDA_SYNC				   (46 << 8 | 0x0)
+#define CIX_PAD_HDA_SYNC_FUNC_I2S0_WS				   (46 << 8 | 0x1)
+#define CIX_PAD_HDA_SYNC_FUNC_I2S9_RWS_DBG			   (46 << 8 | 0x2)
+#define CIX_PAD_HDA_SDIN1_FUNC_HDA_SDIN1			   (47 << 8 | 0x0)
+#define CIX_PAD_HDA_SDIN1_FUNC_GPIO063				   (47 << 8 | 0x1)
+#define CIX_PAD_HDA_SDIN1_FUNC_I2S9_DATA_IN1_DBG		   (47 << 8 | 0x2)
+#define CIX_PAD_HDA_SDOUT1_FUNC_HDA_SDOUT1			   (48 << 8 | 0x0)
+#define CIX_PAD_HDA_SDOUT1_FUNC_GPIO064				   (48 << 8 | 0x1)
+#define CIX_PAD_HDA_SDOUT1_FUNC_I2S9_DATA_OUT0_DBG		   (48 << 8 | 0x2)
+#define CIX_PAD_I2S1_MCLK_FUNC_I2S1_MCLK			   (49 << 8 | 0x0)
+#define CIX_PAD_I2S1_MCLK_FUNC_GPIO065				   (49 << 8 | 0x1)
+#define CIX_PAD_I2S1_SCK_FUNC_I2S1_SCK				   (50 << 8 | 0x0)
+#define CIX_PAD_I2S1_SCK_FUNC_GPIO066				   (50 << 8 | 0x1)
+#define CIX_PAD_I2S1_WS_FUNC_I2S1_WS				   (51 << 8 | 0x0)
+#define CIX_PAD_I2S1_WS_FUNC_GPIO067				   (51 << 8 | 0x1)
+#define CIX_PAD_I2S1_DATA_IN_FUNC_I2S1_DATA_IN			   (52 << 8 | 0x0)
+#define CIX_PAD_I2S1_DATA_IN_FUNC_GPIO068			   (52 << 8 | 0x1)
+#define CIX_PAD_I2S1_DATA_OUT_FUNC_I2S1_DATA_OUT		   (53 << 8 | 0x0)
+#define CIX_PAD_I2S1_DATA_OUT_FUNC_GPIO069			   (53 << 8 | 0x1)
+#define CIX_PAD_I2S2_MCLK_FUNC_I2S2_MCLK			   (54 << 8 | 0x0)
+#define CIX_PAD_I2S2_MCLK_FUNC_GPIO070				   (54 << 8 | 0x1)
+#define CIX_PAD_I2S2_RSCK_FUNC_I2S2_RSCK			   (55 << 8 | 0x0)
+#define CIX_PAD_I2S2_RSCK_FUNC_GPIO071				   (55 << 8 | 0x1)
+#define CIX_PAD_I2S2_RSCK_FUNC_I2S5_RSCK_DBG			   (55 << 8 | 0x2)
+#define CIX_PAD_I2S2_RSCK_FUNC_I2S6_RSCK_DBG			   (55 << 8 | 0x3)
+#define CIX_PAD_I2S2_RWS_FUNC_I2S2_RWS				   (56 << 8 | 0x0)
+#define CIX_PAD_I2S2_RWS_FUNC_GPIO072				   (56 << 8 | 0x1)
+#define CIX_PAD_I2S2_RWS_FUNC_I2S5_RWS_DBG			   (56 << 8 | 0x2)
+#define CIX_PAD_I2S2_RWS_FUNC_I2S6_RWS_DBG			   (56 << 8 | 0x3)
+#define CIX_PAD_I2S2_TSCK_FUNC_I2S2_TSCK			   (57 << 8 | 0x0)
+#define CIX_PAD_I2S2_TSCK_FUNC_GPIO073				   (57 << 8 | 0x1)
+#define CIX_PAD_I2S2_TSCK_FUNC_I2S5_TSCK_DBG			   (57 << 8 | 0x2)
+#define CIX_PAD_I2S2_TSCK_FUNC_I2S6_TSCK_DBG			   (57 << 8 | 0x3)
+#define CIX_PAD_I2S2_TWS_FUNC_I2S2_TWS				   (58 << 8 | 0x0)
+#define CIX_PAD_I2S2_TWS_FUNC_GPIO074				   (58 << 8 | 0x1)
+#define CIX_PAD_I2S2_TWS_FUNC_I2S5_TWS_DBG			   (58 << 8 | 0x2)
+#define CIX_PAD_I2S2_TWS_FUNC_I2S6_TWS_DBG			   (58 << 8 | 0x3)
+#define CIX_PAD_I2S2_DATA_IN0_FUNC_I2S2_DATA_IN0		   (59 << 8 | 0x0)
+#define CIX_PAD_I2S2_DATA_IN0_FUNC_GPIO075			   (59 << 8 | 0x1)
+#define CIX_PAD_I2S2_DATA_IN0_FUNC_I2S5_DATA_IN0_DBG		   (59 << 8 | 0x2)
+#define CIX_PAD_I2S2_DATA_IN0_FUNC_I2S6_DATA_IN0_DBG		   (59 << 8 | 0x3)
+#define CIX_PAD_I2S2_DATA_IN1_FUNC_I2S2_DATA_IN1		   (60 << 8 | 0x0)
+#define CIX_PAD_I2S2_DATA_IN1_FUNC_GPIO076			   (60 << 8 | 0x1)
+#define CIX_PAD_I2S2_DATA_IN1_FUNC_I2S5_DATA_IN1_DBG		   (60 << 8 | 0x2)
+#define CIX_PAD_I2S2_DATA_IN1_FUNC_I2S6_DATA_IN1_DBG		   (60 << 8 | 0x3)
+#define CIX_PAD_I2S2_DATA_OUT0_FUNC_I2S2_DATA_OUT0		   (61 << 8 | 0x0)
+#define CIX_PAD_I2S2_DATA_OUT0_FUNC_GPIO077			   (61 << 8 | 0x1)
+#define CIX_PAD_I2S2_DATA_OUT0_FUNC_I2S5_DATA_OUT0_DBG		   (61 << 8 | 0x2)
+#define CIX_PAD_I2S2_DATA_OUT0_FUNC_I2S6_DATA_OUT0_DBG		   (61 << 8 | 0x3)
+#define CIX_PAD_I2S2_DATA_OUT1_FUNC_I2S2_DATA_OUT1		   (62 << 8 | 0x0)
+#define CIX_PAD_I2S2_DATA_OUT1_FUNC_GPIO078			   (62 << 8 | 0x1)
+#define CIX_PAD_I2S2_DATA_OUT1_FUNC_I2S5_DATA_OUT1_DBG		   (62 << 8 | 0x2)
+#define CIX_PAD_I2S2_DATA_OUT1_FUNC_I2S6_DATA_OUT1_DBG		   (62 << 8 | 0x3)
+#define CIX_PAD_I2S2_DATA_OUT2_FUNC_I2S2_DATA_OUT2		   (63 << 8 | 0x0)
+#define CIX_PAD_I2S2_DATA_OUT2_FUNC_GPIO079			   (63 << 8 | 0x1)
+#define CIX_PAD_I2S2_DATA_OUT3_FUNC_I2S2_DATA_OUT3		   (64 << 8 | 0x0)
+#define CIX_PAD_I2S2_DATA_OUT3_FUNC_GPIO080			   (64 << 8 | 0x1)
+#define CIX_PAD_I2S2_DATA_OUT3_FUNC_I2S9_DATA_OUT1_DBG		   (64 << 8 | 0x2)
+#define CIX_PAD_I2S3_MCLK_FUNC_I2S3_MCLK			   (65 << 8 | 0x0)
+#define CIX_PAD_I2S3_MCLK_FUNC_GPIO081				   (65 << 8 | 0x1)
+#define CIX_PAD_I2S3_RSCK_FUNC_I2S3_RSCK			   (66 << 8 | 0x0)
+#define CIX_PAD_I2S3_RSCK_FUNC_GPIO082				   (66 << 8 | 0x1)
+#define CIX_PAD_I2S3_RSCK_FUNC_I2S7_RSCK_DBG			   (66 << 8 | 0x2)
+#define CIX_PAD_I2S3_RSCK_FUNC_I2S8_RSCK_DBG			   (66 << 8 | 0x3)
+#define CIX_PAD_I2S3_RWS_FUNC_I2S3_RWS				   (67 << 8 | 0x0)
+#define CIX_PAD_I2S3_RWS_FUNC_GPIO083				   (67 << 8 | 0x1)
+#define CIX_PAD_I2S3_RWS_FUNC_I2S7_RWS_DBG			   (67 << 8 | 0x2)
+#define CIX_PAD_I2S3_RWS_FUNC_I2S8_RWS_DBG			   (67 << 8 | 0x3)
+#define CIX_PAD_I2S3_TSCK_FUNC_I2S3_TSCK			   (68 << 8 | 0x0)
+#define CIX_PAD_I2S3_TSCK_FUNC_GPIO084				   (68 << 8 | 0x1)
+#define CIX_PAD_I2S3_TSCK_FUNC_I2S7_TSCK_DBG			   (68 << 8 | 0x2)
+#define CIX_PAD_I2S3_TSCK_FUNC_I2S8_TSCK_DBG			   (68 << 8 | 0x3)
+#define CIX_PAD_I2S3_TWS_FUNC_I2S3_TWS				   (69 << 8 | 0x0)
+#define CIX_PAD_I2S3_TWS_FUNC_GPIO085				   (69 << 8 | 0x1)
+#define CIX_PAD_I2S3_TWS_FUNC_I2S7_TWS_DBG			   (69 << 8 | 0x2)
+#define CIX_PAD_I2S3_TWS_FUNC_I2S8_TWS_DBG			   (69 << 8 | 0x3)
+#define CIX_PAD_I2S3_DATA_IN0_FUNC_I2S3_DATA_IN0		   (70 << 8 | 0x0)
+#define CIX_PAD_I2S3_DATA_IN0_FUNC_GPIO086			   (70 << 8 | 0x1)
+#define CIX_PAD_I2S3_DATA_IN0_FUNC_I2S7_DATA_IN0_DBG		   (70 << 8 | 0x2)
+#define CIX_PAD_I2S3_DATA_IN0_FUNC_I2S8_DATA_IN0_DBG		   (70 << 8 | 0x3)
+#define CIX_PAD_I2S3_DATA_IN1_FUNC_I2S3_DATA_IN1		   (71 << 8 | 0x0)
+#define CIX_PAD_I2S3_DATA_IN1_FUNC_GPIO087			   (71 << 8 | 0x1)
+#define CIX_PAD_I2S3_DATA_IN1_FUNC_I2S7_DATA_IN1_DBG		   (71 << 8 | 0x2)
+#define CIX_PAD_I2S3_DATA_IN1_FUNC_I2S8_DATA_IN1_DBG		   (71 << 8 | 0x3)
+#define CIX_PAD_I2S3_DATA_OUT0_FUNC_I2S3_DATA_OUT0		   (72 << 8 | 0x0)
+#define CIX_PAD_I2S3_DATA_OUT0_FUNC_GPIO088			   (72 << 8 | 0x1)
+#define CIX_PAD_I2S3_DATA_OUT0_FUNC_I2S7_DATA_OUT0_DBG		   (72 << 8 | 0x2)
+#define CIX_PAD_I2S3_DATA_OUT0_FUNC_I2S8_DATA_OUT0_DBG		   (72 << 8 | 0x3)
+#define CIX_PAD_I2S3_DATA_OUT1_FUNC_I2S3_DATA_OUT1		   (73 << 8 | 0x0)
+#define CIX_PAD_I2S3_DATA_OUT1_FUNC_GPIO089			   (73 << 8 | 0x1)
+#define CIX_PAD_I2S3_DATA_OUT1_FUNC_I2S7_DATA_OUT1_DBG		   (73 << 8 | 0x2)
+#define CIX_PAD_I2S3_DATA_OUT1_FUNC_I2S8_DATA_OUT1_DBG		   (73 << 8 | 0x3)
+#define CIX_PAD_GPIO090_FUNC_GPIO090				   (74 << 8 | 0x0)
+#define CIX_PAD_GPIO090_FUNC_I2S4_MCLK_LB			   (74 << 8 | 0x1)
+#define CIX_PAD_GPIO091_FUNC_GPIO091				   (75 << 8 | 0x0)
+#define CIX_PAD_GPIO091_FUNC_I2S4_SCK_LB			   (75 << 8 | 0x1)
+#define CIX_PAD_GPIO092_FUNC_GPIO092				   (76 << 8 | 0x0)
+#define CIX_PAD_GPIO092_FUNC_I2S4_WS_LB				   (76 << 8 | 0x1)
+#define CIX_PAD_GPIO093_FUNC_GPIO093				   (77 << 8 | 0x0)
+#define CIX_PAD_GPIO093_FUNC_I2S4_DATA_IN_LB			   (77 << 8 | 0x1)
+#define CIX_PAD_GPIO094_FUNC_GPIO094				   (78 << 8 | 0x0)
+#define CIX_PAD_GPIO094_FUNC_I2S4_DATA_OUT_LB			   (78 << 8 | 0x1)
+#define CIX_PAD_UART0_TXD_FUNC_UART0_TXD			   (79 << 8 | 0x0)
+#define CIX_PAD_UART0_TXD_FUNC_PWM0				   (79 << 8 | 0x1)
+#define CIX_PAD_UART0_TXD_FUNC_GPIO095				   (79 << 8 | 0x2)
+#define CIX_PAD_UART0_RXD_FUNC_UART0_RXD			   (80 << 8 | 0x0)
+#define CIX_PAD_UART0_RXD_FUNC_PWM1				   (80 << 8 | 0x1)
+#define CIX_PAD_UART0_RXD_FUNC_GPIO096				   (80 << 8 | 0x2)
+#define CIX_PAD_UART0_CTS_FUNC_UART0_CTS			   (81 << 8 | 0x0)
+#define CIX_PAD_UART0_CTS_FUNC_FAN_OUT2				   (81 << 8 | 0x1)
+#define CIX_PAD_UART0_CTS_FUNC_GPIO097				   (81 << 8 | 0x2)
+#define CIX_PAD_UART0_RTS_FUNC_UART0_RTS			   (82 << 8 | 0x0)
+#define CIX_PAD_UART0_RTS_FUNC_FAN_TACH2			   (82 << 8 | 0x1)
+#define CIX_PAD_UART0_RTS_FUNC_GPIO098				   (82 << 8 | 0x2)
+#define CIX_PAD_UART1_TXD_FUNC_UART1_TXD			   (83 << 8 | 0x0)
+#define CIX_PAD_UART1_TXD_FUNC_FAN_OUT0				   (83 << 8 | 0x1)
+#define CIX_PAD_UART1_TXD_FUNC_GPIO099				   (83 << 8 | 0x2)
+#define CIX_PAD_UART1_RXD_FUNC_UART1_RXD			   (84 << 8 | 0x0)
+#define CIX_PAD_UART1_RXD_FUNC_FAN_TACH0			   (84 << 8 | 0x1)
+#define CIX_PAD_UART1_RXD_FUNC_GPIO100				   (84 << 8 | 0x2)
+#define CIX_PAD_UART1_CTS_FUNC_UART1_CTS			   (85 << 8 | 0x0)
+#define CIX_PAD_UART1_CTS_FUNC_FAN_OUT1				   (85 << 8 | 0x1)
+#define CIX_PAD_UART1_CTS_FUNC_GPIO101				   (85 << 8 | 0x2)
+#define CIX_PAD_UART1_RTS_FUNC_UART1_RTS			   (86 << 8 | 0x0)
+#define CIX_PAD_UART1_RTS_FUNC_FAN_TACH1			   (86 << 8 | 0x1)
+#define CIX_PAD_UART1_RTS_FUNC_GPIO102				   (86 << 8 | 0x2)
+#define CIX_PAD_UART2_TXD_FUNC_UART2_TXD			   (87 << 8 | 0x0)
+#define CIX_PAD_UART2_TXD_FUNC_GPIO103				   (87 << 8 | 0x1)
+#define CIX_PAD_UART2_RXD_FUNC_UART2_RXD			   (88 << 8 | 0x0)
+#define CIX_PAD_UART2_RXD_FUNC_GPIO104				   (88 << 8 | 0x1)
+#define CIX_PAD_UART3_TXD_FUNC_UART3_TXD			   (89 << 8 | 0x0)
+#define CIX_PAD_UART3_TXD_FUNC_GPIO105				   (89 << 8 | 0x1)
+#define CIX_PAD_UART3_RXD_FUNC_UART3_RXD			   (90 << 8 | 0x0)
+#define CIX_PAD_UART3_RXD_FUNC_GPIO106				   (90 << 8 | 0x1)
+#define CIX_PAD_UART3_CTS_FUNC_UART3_CTS			   (91 << 8 | 0x0)
+#define CIX_PAD_UART3_CTS_FUNC_GPIO107				   (91 << 8 | 0x1)
+#define CIX_PAD_UART3_CTS_FUNC_TRIGIN0				   (91 << 8 | 0x2)
+#define CIX_PAD_UART3_RTS_FUNC_UART3_RTS			   (92 << 8 | 0x0)
+#define CIX_PAD_UART3_RTS_FUNC_GPIO108				   (92 << 8 | 0x1)
+#define CIX_PAD_UART3_RTS_FUNC_TRIGIN1				   (92 << 8 | 0x2)
+#define CIX_PAD_UART4_CSU_PM_TXD_FUNC_UART4_CSU_PM_TXD		   (93 << 8 | 0x0)
+#define CIX_PAD_UART4_CSU_PM_TXD_FUNC_GPIO109			   (93 << 8 | 0x1)
+#define CIX_PAD_UART4_CSU_PM_RXD_FUNC_UART4_CSU_PM_RXD		   (94 << 8 | 0x0)
+#define CIX_PAD_UART4_CSU_PM_RXD_FUNC_GPIO110			   (94 << 8 | 0x1)
+#define CIX_PAD_UART5_CSU_SE_TXD_FUNC_UART5_CSU_SE_TXD		   (95 << 8 | 0x0)
+#define CIX_PAD_UART5_CSU_SE_TXD_FUNC_GPIO111			   (95 << 8 | 0x1)
+#define CIX_PAD_UART5_CSU_SE_RXD_FUNC_UART5_CSU_SE_RXD		   (96 << 8 | 0x0)
+#define CIX_PAD_UART5_CSU_SE_RXD_FUNC_GPIO112			   (96 << 8 | 0x1)
+#define CIX_PAD_UART6_CSU_SE_RXD_FUNC_UART6_CSU_SE_RXD		   (97 << 8 | 0x0)
+#define CIX_PAD_UART6_CSU_SE_RXD_FUNC_GPIO113			   (97 << 8 | 0x1)
+#define CIX_PAD_CLK_REQ0_L_FUNC_CLK_REQ0_L			   (98 << 8 | 0x0)
+#define CIX_PAD_CLK_REQ0_L_FUNC_GPIO114				   (98 << 8 | 0x1)
+#define CIX_PAD_CLK_REQ2_L_FUNC_CLK_REQ2_L			   (99 << 8 | 0x0)
+#define CIX_PAD_CLK_REQ2_L_FUNC_GPIO115				   (99 << 8 | 0x1)
+#define CIX_PAD_CLK_REQ4_L_FUNC_CLK_REQ4_L			   (100 << 8 | 0x0)
+#define CIX_PAD_CLK_REQ4_L_FUNC_GPIO116				   (100 << 8 | 0x1)
+#define CIX_PAD_CSI0_MCLK0_FUNC_CSI0_MCLK0			   (101 << 8 | 0x0)
+#define CIX_PAD_CSI0_MCLK0_FUNC_GPIO117				   (101 << 8 | 0x1)
+#define CIX_PAD_CSI0_MCLK1_FUNC_CSI0_MCLK1			   (102 << 8 | 0x0)
+#define CIX_PAD_CSI0_MCLK1_FUNC_GPIO118				   (102 << 8 | 0x1)
+#define CIX_PAD_CSI1_MCLK0_FUNC_CSI1_MCLK0			   (103 << 8 | 0x0)
+#define CIX_PAD_CSI1_MCLK0_FUNC_GPIO119				   (103 << 8 | 0x1)
+#define CIX_PAD_CSI1_MCLK1_FUNC_CSI1_MCLK1			   (104 << 8 | 0x0)
+#define CIX_PAD_CSI1_MCLK1_FUNC_GPIO120				   (104 << 8 | 0x1)
+#define CIX_PAD_GPIO121_FUNC_GPIO121				   (105 << 8 | 0x0)
+#define CIX_PAD_GPIO121_FUNC_GMAC0_REFCLK_25M			   (105 << 8 | 0x1)
+#define CIX_PAD_GPIO122_FUNC_GPIO122				   (106 << 8 | 0x0)
+#define CIX_PAD_GPIO122_FUNC_GMAC0_TX_CTL			   (106 << 8 | 0x1)
+#define CIX_PAD_GPIO123_FUNC_GPIO123				   (107 << 8 | 0x0)
+#define CIX_PAD_GPIO123_FUNC_GMAC0_TXD0				   (107 << 8 | 0x1)
+#define CIX_PAD_GPIO124_FUNC_GPIO124				   (108 << 8 | 0x0)
+#define CIX_PAD_GPIO124_FUNC_GMAC0_TXD1				   (108 << 8 | 0x1)
+#define CIX_PAD_GPIO125_FUNC_GPIO125				   (109 << 8 | 0x0)
+#define CIX_PAD_GPIO125_FUNC_GMAC0_TXD2				   (109 << 8 | 0x1)
+#define CIX_PAD_GPIO126_FUNC_GPIO126				   (110 << 8 | 0x0)
+#define CIX_PAD_GPIO126_FUNC_GMAC0_TXD3				   (110 << 8 | 0x1)
+#define CIX_PAD_GPIO127_FUNC_GPIO127				   (111 << 8 | 0x0)
+#define CIX_PAD_GPIO127_FUNC_GMAC0_TX_CLK			   (111 << 8 | 0x1)
+#define CIX_PAD_GPIO128_FUNC_GPIO128				   (112 << 8 | 0x0)
+#define CIX_PAD_GPIO128_FUNC_GMAC0_RX_CTL			   (112 << 8 | 0x1)
+#define CIX_PAD_GPIO129_FUNC_GPIO129				   (113 << 8 | 0x0)
+#define CIX_PAD_GPIO129_FUNC_GMAC0_RXD0				   (113 << 8 | 0x1)
+#define CIX_PAD_GPIO130_FUNC_GPIO130				   (114 << 8 | 0x0)
+#define CIX_PAD_GPIO130_FUNC_GMAC0_RXD1				   (114 << 8 | 0x1)
+#define CIX_PAD_GPIO131_FUNC_GPIO131				   (115 << 8 | 0x0)
+#define CIX_PAD_GPIO131_FUNC_GMAC0_RXD2				   (115 << 8 | 0x1)
+#define CIX_PAD_GPIO132_FUNC_GPIO132				   (116 << 8 | 0x0)
+#define CIX_PAD_GPIO132_FUNC_GMAC0_RXD3				   (116 << 8 | 0x1)
+#define CIX_PAD_GPIO133_FUNC_GPIO133				   (117 << 8 | 0x0)
+#define CIX_PAD_GPIO133_FUNC_GMAC0_RX_CLK			   (117 << 8 | 0x1)
+#define CIX_PAD_GPIO134_FUNC_GPIO134				   (118 << 8 | 0x0)
+#define CIX_PAD_GPIO134_FUNC_GMAC0_MDC				   (118 << 8 | 0x1)
+#define CIX_PAD_GPIO135_FUNC_GPIO135				   (119 << 8 | 0x0)
+#define CIX_PAD_GPIO135_FUNC_GMAC0_MDIO				   (119 << 8 | 0x1)
+#define CIX_PAD_GPIO136_FUNC_GPIO136				   (120 << 8 | 0x0)
+#define CIX_PAD_GPIO136_FUNC_GMAC1_REFCLK_25M			   (120 << 8 | 0x1)
+#define CIX_PAD_GPIO137_FUNC_GPIO137				   (121 << 8 | 0x0)
+#define CIX_PAD_GPIO137_FUNC_GMAC1_TX_CTL			   (121 << 8 | 0x1)
+#define CIX_PAD_GPIO138_FUNC_GPIO138				   (122 << 8 | 0x0)
+#define CIX_PAD_GPIO138_FUNC_GMAC1_TXD0				   (122 << 8 | 0x1)
+#define CIX_PAD_GPIO138_FUNC_SPI2_MISO				   (122 << 8 | 0x2)
+#define CIX_PAD_GPIO139_FUNC_GPIO139				   (123 << 8 | 0x0)
+#define CIX_PAD_GPIO139_FUNC_GMAC1_TXD1				   (123 << 8 | 0x1)
+#define CIX_PAD_GPIO139_FUNC_SPI2_CS0				   (123 << 8 | 0x2)
+#define CIX_PAD_GPIO140_FUNC_GPIO140				   (124 << 8 | 0x0)
+#define CIX_PAD_GPIO140_FUNC_GMAC1_TXD2				   (124 << 8 | 0x1)
+#define CIX_PAD_GPIO140_FUNC_SPI2_CS1				   (124 << 8 | 0x2)
+#define CIX_PAD_GPIO141_FUNC_GPIO141				   (125 << 8 | 0x0)
+#define CIX_PAD_GPIO141_FUNC_GMAC1_TXD3				   (125 << 8 | 0x1)
+#define CIX_PAD_GPIO141_FUNC_SPI2_MOSI				   (125 << 8 | 0x2)
+#define CIX_PAD_GPIO142_FUNC_GPIO142				   (126 << 8 | 0x0)
+#define CIX_PAD_GPIO142_FUNC_GMAC1_TX_CLK			   (126 << 8 | 0x1)
+#define CIX_PAD_GPIO142_FUNC_SPI2_CLK				   (126 << 8 | 0x2)
+#define CIX_PAD_GPIO143_FUNC_GPIO143				   (127 << 8 | 0x0)
+#define CIX_PAD_GPIO143_FUNC_GMAC1_RX_CTL			   (127 << 8 | 0x1)
+#define CIX_PAD_GPIO144_FUNC_GPIO144				   (128 << 8 | 0x0)
+#define CIX_PAD_GPIO144_FUNC_GMAC1_RXD0				   (128 << 8 | 0x1)
+#define CIX_PAD_GPIO145_FUNC_GPIO145				   (129 << 8 | 0x0)
+#define CIX_PAD_GPIO145_FUNC_GMAC1_RXD1				   (129 << 8 | 0x1)
+#define CIX_PAD_GPIO146_FUNC_GPIO146				   (130 << 8 | 0x0)
+#define CIX_PAD_GPIO146_FUNC_GMAC1_RXD2				   (130 << 8 | 0x1)
+#define CIX_PAD_GPIO147_FUNC_GPIO147				   (131 << 8 | 0x0)
+#define CIX_PAD_GPIO147_FUNC_GMAC1_RXD3				   (131 << 8 | 0x1)
+#define CIX_PAD_GPIO148_FUNC_GPIO148				   (132 << 8 | 0x0)
+#define CIX_PAD_GPIO148_FUNC_GMAC1_RX_CLK			   (132 << 8 | 0x1)
+#define CIX_PAD_GPIO149_FUNC_GPIO149				   (133 << 8 | 0x0)
+#define CIX_PAD_GPIO149_FUNC_GMAC1_MDC				   (133 << 8 | 0x1)
+#define CIX_PAD_GPIO150_FUNC_GPIO150				   (134 << 8 | 0x0)
+#define CIX_PAD_GPIO150_FUNC_GMAC1_MDIO				   (134 << 8 | 0x1)
+#define CIX_PAD_GPIO151_FUNC_GPIO151				   (135 << 8 | 0x0)
+#define CIX_PAD_GPIO151_FUNC_PM_GPIO0				   (135 << 8 | 0x1)
+#define CIX_PAD_GPIO152_FUNC_GPIO152				   (136 << 8 | 0x0)
+#define CIX_PAD_GPIO152_FUNC_PM_GPIO1				   (136 << 8 | 0x1)
+#define CIX_PAD_GPIO153_FUNC_GPIO153				   (137 << 8 | 0x0)
+#define CIX_PAD_GPIO153_FUNC_PM_GPIO2				   (137 << 8 | 0x1)
+
+#define DS_LEVEL1	0x1
+#define DS_LEVEL2	0x2
+#define DS_LEVEL3	0x3
+#define DS_LEVEL4	0x4
+#define DS_LEVEL5	0x5
+#define DS_LEVEL6	0x6
+#define DS_LEVEL7	0x7
+#define DS_LEVEL8	0x8
+#define DS_LEVEL9	0x9
+#define DS_LEVEL10	0xa
+#define DS_LEVEL11	0xb
+#define DS_LEVEL12	0xc
+#define DS_LEVEL13	0xd
+#define DS_LEVEL14	0xe
+#define DS_LEVEL15	0xf
+
+#endif
diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 7dfe7677e649..4c6f25fe797c 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -228,6 +228,11 @@ uart3: serial@40e0000 {
 			status = "disabled";
 		};
 
+		iomuxc: pinctrl@4170000 {
+			compatible = "cix,sky1-iomuxc";
+			reg = <0x0 0x04170000 0x0 0x1000>;
+		};
+
 		mbox_ap2se: mailbox@5060000 {
 			compatible = "cix,sky1-mbox";
 			reg = <0x0 0x05060000 0x0 0x10000>;
@@ -316,6 +321,11 @@ ppi_partition1: interrupt-partition-1 {
 				};
 			};
 		};
+
+		iomuxc_s5: pinctrl@16007000 {
+			compatible = "cix,sky1-iomuxc-s5";
+			reg = <0x0 0x16007000 0x0 0x1000>;
+		};
 	};
 
 	timer {
-- 
2.49.0


