Return-Path: <linux-gpio+bounces-25009-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39853B3783C
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 04:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E48D07C146A
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 02:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E5B2D0C61;
	Wed, 27 Aug 2025 02:42:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022105.outbound.protection.outlook.com [40.107.75.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880F52765FA;
	Wed, 27 Aug 2025 02:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756262551; cv=fail; b=ZS5PYmWARRjwvD+J7RtUW80UZZK/RV3MMFvxWZOYYCiOh5qm8Hnw0nlbSDtMdTXYqRqUxDC7Hdg2JricBTBuHJV0DRjQ+H8S1emXCgee4N8BhxVZl1/eI2sRvFkKi/vV+BXmzF9e5AJ7D6Gx6J3npMy/p/CIDVLfCJn9fD7zx1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756262551; c=relaxed/simple;
	bh=X3dh/G3YH/2qel8wx4hQvLhochUkw/h9u/s4RObk/is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DbQdFxrISontX8p+gS6NCNyEzxs95dKrsRQ2ukcuM8Nmtxib1yd0i2WotDshqBAMppBhRQ08FSYnPfIYkUwf49t3jPNqomXIWNp1C9U0zUDzkUZHx2UlYUje266s/ZQBSprwbvlsfx9IQ+1PyvTvy8nHBFCOPtiuMqXa2jkeDlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/ucA/fCwSqzlTarG/r+PGKh8XI0IQ5D8qpNAUdyiVbR2as9J6tGXqr8drHagVilCvgVjC/T1phbL3csThV04zPBLesBpCEXnQn+/Xl93PzAAoyY9XVuCYD9A35nedSN3w11x4DjgH+vYsntFRWcfUeXcE60t3W7xltMCDKXt+7kfUT5IvCopOoSztN22qZpppjsBNqjSiuOQIldJ6aODF/UQcR/c57Nl1+/EVA1w17n6bimlphx3N0eh2A3aIBAGMsBSDYHzeg6VyIuftqT9fXwlNXTlQBAjfBZKJyRYxXUpYNSDiAMWtpSDeLa0EybXr+HTqkyuNsLgDihfEmi6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuQk/2VAf9lSPFqtss0hHRYNBLfzHc2Vano0IA0f3zA=;
 b=P6phEGkKpwn93wOUxeNKTT7a9k56ViEPT3fQMYMZRe8W6aPMjjnsxmFZ6P1piWtIw63DYIrGP4RomHC2SV/zQqfjUIuarWi680o6JK6V7Er3ejPNgbvrL5CW6wBp26SOYJj0S8L+ownTsrnWpoRMeEfazaZ0NzZ9aG/MVFuqRdvE0zCIUPFzfYluCnKQ50WvELMvXIvixyeJOly32wceqqTQyxsanA0LKjFK0XjTFFtAhlcCYJOuj9u2oAIq2wVCNaWm4gGynCq3IdwnKPNGKIEQLsknXaH+X4EK6w3PXzMok+jp5Qo2G4Cd3zLEYhj2QNyf3fVXI3+KMRKOJ0uTaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY2PR06CA0045.apcprd06.prod.outlook.com (2603:1096:404:2e::33)
 by TYZPR06MB6144.apcprd06.prod.outlook.com (2603:1096:400:341::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 02:42:24 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:404:2e:cafe::6b) by TY2PR06CA0045.outlook.office365.com
 (2603:1096:404:2e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.14 via Frontend Transport; Wed,
 27 Aug 2025 02:42:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 02:42:24 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 1F30441C014B;
	Wed, 27 Aug 2025 10:42:23 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH 3/3] arm64: dts: cix: Add pinctrl nodes for sky1
Date: Wed, 27 Aug 2025 10:42:22 +0800
Message-ID: <20250827024222.588082-4-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250827024222.588082-1-gary.yang@cixtech.com>
References: <20250827024222.588082-1-gary.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|TYZPR06MB6144:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b6acf922-2a57-4e37-1f1c-08dde5135aac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lvjxnu87crCx54IktaR4ZDfbgPW8gtJY7LJvdF3iR98kEgb5ybkgKk1OWoPG?=
 =?us-ascii?Q?4RwhVQnun/CVKM39MtAwoNU6ZTp6X+ratpaSFMc6RfEJ6CeW2jdcmjivkP8r?=
 =?us-ascii?Q?MjAC6We4n3SQt2BEgP4qzapIKEom8vd3aClboJ9U7LVXmTeGRfq+tSnO0CnX?=
 =?us-ascii?Q?2VG31fq3/yrXfhCxHfiPieFCkM52YPQjED74O7g4vgNJQzQ6DaHG9OzYQoEy?=
 =?us-ascii?Q?NZJqbPwacpX0jXob7aWmKsqqCmO8CR5zOBkna4iEhMdMZEfFhrw5QvIi3L+q?=
 =?us-ascii?Q?3wKrNkL9QXcY9I2eerD1izmsAAM+SZ/eTaAbCU/BzkOs4XM2b8GOL5niYbvu?=
 =?us-ascii?Q?ITmNgo4C+n2aBvr4avgXyzPkImqk6QBouL458Uj1lODII1irOAD/lQZciYhT?=
 =?us-ascii?Q?X8mGY44PNS84LlxcPu0DJ/GOYsBU/A3LgjW1r3giXMbyJe9pAO4Dmebqfwng?=
 =?us-ascii?Q?QK8ulTJTkDtVF0qZXxINI5K2OwcF5d5w3s/Me8TeeuijXR1HzbsP4r7DWHn6?=
 =?us-ascii?Q?w1+UP4+4chRsd06Ma4pwe21iR0wqUjWmUZIu5M8oBp2+OlRs1OnWfjrkGX+Y?=
 =?us-ascii?Q?GqZW/nR536yxXcdKtJMf70sV6A/N4IDNZkXOyGvLlE4JtcVcrFnaAgK0QwNl?=
 =?us-ascii?Q?lyW+Y0i84j5Dr2z0KhJqlWh3ov1OztHWnnjIawLM+R1BX3iIJK1ENTbzxYRi?=
 =?us-ascii?Q?RmEfcnp9/aeJGsTsTyEFi/JmNqg+loweb+VKqwkFaOm9kGwmeDw53b4vrnP2?=
 =?us-ascii?Q?KEiCGiSRvKQX5isVuD9Wn7krQC09u6knsRoZlDMoUa55UlRGYjsZLXC4zfpM?=
 =?us-ascii?Q?8IOgQAKUTUga0C77ZpJFxx9YI1nAPj1zYrdzNXTgR2lQwxzZJv8RPCXFpH9T?=
 =?us-ascii?Q?UrXZDxR2hjkQALTkkWT/cVH73f2+TZWS831dz2GfY81xylhYqAs3m/2cmcAg?=
 =?us-ascii?Q?gDUsG6oM9GNbMPn7ICC0UNlre0rRNmU1XEZ9uZODdFhIYpoOHycXiZAm7WMW?=
 =?us-ascii?Q?Z97KAyZYkozWGKVChfARs2oY2Y40JpoyKly1gQs5ji34Bwkf8eBKLeV8voGR?=
 =?us-ascii?Q?H63mnFfTYPnTXQ1f7kUTaJBlEm5togIxtaTtBFBGf0L3plBMczxj/5wZY/KT?=
 =?us-ascii?Q?NU98Jt2Sg2xxGxYO3bpF/gLN3LDtv8ZylvvU5b5RQ3vkO0zcnXXeiVvk88gp?=
 =?us-ascii?Q?zT0fXh1klAt5kWiK/tHaNclRxrWKRCKWlwR3edupsGCmdVgxdh9qwZEEukR9?=
 =?us-ascii?Q?1+/OWJUQjO7leA5ZRGVtKfbyu1sTMSwQpAmRw3N5ki4gwqGTNd5hvXOBxg+t?=
 =?us-ascii?Q?JJQuq0mghsKkRNqpdagz9QE5SKwh5q+N7hmLQX7fFcZ+KZO65zRrrErLYrbF?=
 =?us-ascii?Q?X3T5gkGCuBryeLPmVTqnD2ZUsLHRTpb+B32ct2MkIdnbPmLUHhX6hpJw6/Kg?=
 =?us-ascii?Q?LKlLUiI4eEc0T3GwlMYLdhBE1wmJQtsaetUVzYCs1u5stT/4rvvwU23m8Iq0?=
 =?us-ascii?Q?el2cCmOgnhsExbRJjfIc4XI6c/XFKzmgTOAp?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 02:42:24.2767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6acf922-2a57-4e37-1f1c-08dde5135aac
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6144

Add the pin-controller nodes for Sky1 platform.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts | 28 +++++++++++++++++++++++
 arch/arm64/boot/dts/cix/sky1.dtsi         | 10 ++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
index d74964d53c3b..8fab0c3b36b3 100644
--- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
+++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
@@ -7,6 +7,9 @@
 /dts-v1/;
 
 #include "sky1.dtsi"
+
+#include <dt-bindings/pinctrl/pads-sky1.h>
+
 / {
 	model = "Radxa Orion O6";
 	compatible = "radxa,orion-o6", "cix,sky1";
@@ -34,6 +37,31 @@ linux,cma {
 
 };
 
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
+	pinctrl_hog: hog-pins {
+		cix,pins = <
+			CIX_PAD_GPIO144_OFFSET CIX_PAD_GPIO144_FUNC_GPIO144 (PULL_DOWN|DS_LEVEL4)
+			CIX_PAD_GPIO145_OFFSET CIX_PAD_GPIO145_FUNC_GPIO145 (PULL_DOWN|DS_LEVEL4)
+			CIX_PAD_GPIO146_OFFSET CIX_PAD_GPIO146_FUNC_GPIO146 (PULL_DOWN|DS_LEVEL4)
+			CIX_PAD_GPIO147_OFFSET CIX_PAD_GPIO147_FUNC_GPIO147 (PULL_DOWN|DS_LEVEL4)
+		>;
+	};
+};
+
+&iomuxc_s5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog_s5>;
+
+	pinctrl_hog_s5: hog-s5-pins {
+		cix,pins = <
+			CIX_PAD_GPIO014_OFFSET CIX_PAD_GPIO014_FUNC_GPIO014  (PULL_UP|DS_LEVEL4)
+		>;
+	};
+};
+
 &uart2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 7dfe7677e649..bfe34e5311e8 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -316,6 +316,16 @@ ppi_partition1: interrupt-partition-1 {
 				};
 			};
 		};
+
+		iomuxc: pinctrl@4170000 {
+			compatible = "cix,sky1-iomuxc";
+			reg = <0x0 0x04170000 0x0 0x1000>;
+		};
+
+		iomuxc_s5: pinctrl@16007000 {
+			compatible = "cix,sky1-iomuxc-s5";
+			reg = <0x0 0x16007000 0x0 0x1000>;
+		};
 	};
 
 	timer {
-- 
2.49.0


