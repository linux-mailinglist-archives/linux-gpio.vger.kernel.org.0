Return-Path: <linux-gpio+bounces-32648-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KoIF1WfqmlLUgEAu9opvQ
	(envelope-from <linux-gpio+bounces-32648-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 10:33:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F9221DFB8
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 10:33:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 14C1C30095C9
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 09:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AAB434252C;
	Fri,  6 Mar 2026 09:32:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023135.outbound.protection.outlook.com [52.101.127.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B71A2F1FE4;
	Fri,  6 Mar 2026 09:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772789566; cv=fail; b=A6keX9yc6RqwifRkubiyNHNbwDnR5aphqg/aPK4NU9m2MpErDthyAPz3ijMwH66WJ+ewbz/y42X47RCeBc3MqfhOUvoHaryEWnDTNSLrNAX6j/j4+5V2E5ACwuNOcAheTFHHo+eHDv8bsiESLquuhuYrbtMdGdZNa4aM2sIRp8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772789566; c=relaxed/simple;
	bh=yVvWmPQMTh56dnH6K/Bk1u71VjFswKNaJNAFOLEU1fk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hXZ0BQ3fh+jrGfKwfSIgINkjGGc2/fugTU3p0dxj3YjY9KGpw0q3i29K47MbJB9Q43mnl9+sIItfRQQuTCp/sjgNKJSMa8mhJDJSD7E66MY6phFjm8NN6Nt5dM2FWO7IO7nHB+DlXVMYPZnVgUqI6m3cKIz5Tm0c9VGUnMu0/OU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBZP0rBaoU3NG8/6S0+CIG9baUuCwVSyIBVCuuCm/2aze0S1x1Sxbo4CsJZQLJ8OmRuClScA5EXpSqcofGgbos8j9LjXP6ljkb3GRlTS07GC9XthBWemw1HlIgjuuehULLRsXlo2ac1Go1DWdGAh+e/E8NNLjrjHXIxeshMliWZvmAMOvBqiVxrZ/5lsZ2pjcM4XFmThXRh0h4dDl4q2CiYt/Uj/pcrNV600yLuI+TZsDq21QZRubzhuZIkijwG0RnFNkxbrgkg54Ii08JN/OljfLnbA78j+hgJX/P+U9QbpAo/4dBViilFxpRLN36EhwQfsIlnrwIZ9e63wnWHB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDsOvGswv5MMXjq36By3O+u8td88SJvXaTYMt3I0Qs0=;
 b=j31ohKT02+MH2RX8qj0euJi1Mo+VvMvqFJhFZFXQF8AfxvQTTa+TLxe4dAF2V/A8J0bgY08/XQkHB3TQ7UohKOmyWLKVklupiWWDh7Q+5U1GpWEJ/Ag3SF5QVKvXQ/LLvM+h9agmb6m4ojZ5U11MsfMXCwdk4ucWQGcUWBsOa0deEmgD+dxR4nKFfrEh7KE69+KaU9YoGRLDbekGxcRYi5QOMZE+u2pGbOL//wNJROAakwSYWLkVfacuuQSFMFVs0XuNw9kJakDPUpbqCwndvJKD2ML9vF7sOhpz8ZGEC4RgJmbYPPvtXP6zL/tZMTAybBIlXouc95hTeMsJ8iCROA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0034.apcprd02.prod.outlook.com (2603:1096:4:1f6::10)
 by TYQPR06MB8086.apcprd06.prod.outlook.com (2603:1096:405:2fa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 09:32:42 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:1f6:cafe::bc) by SI1PR02CA0034.outlook.office365.com
 (2603:1096:4:1f6::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 09:32:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 09:32:40 +0000
Received: from ZicharPC.. (unknown [172.16.64.205])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 13DCF41604E2;
	Fri,  6 Mar 2026 17:32:39 +0800 (CST)
From: Zichar Zhang <zichar.zhang@cixtech.com>
To: linusw@kernel.org,
	brgl@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	jank@cadence.com
Cc: cix-kernel-upstream@cixtech.com,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Zichar.Zhang" <zichar.zhang@cixtech.com>
Subject: [PATCH 2/2] arm64: dts: cix: add FCH(S0)/S5 GPIO controllers for sky1
Date: Fri,  6 Mar 2026 17:32:38 +0800
Message-Id: <20260306093238.2715269-2-zichar.zhang@cixtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306093238.2715269-1-zichar.zhang@cixtech.com>
References: <20260306093238.2715269-1-zichar.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|TYQPR06MB8086:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3056bb17-be06-4867-24b2-08de7b634fdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	7rrqwBC0hvTQ8DvLS52x/d+LaG2kEv+0sL4OO6fgIRCVXPjGV1hQQQ9EPgHx/VImethJHgYh3gwiBPj1tWwHoVa7OYGye5mmVCivDQIal7JdzD4x5En2Ll/A/AohlWdkSad+unRc1465nslazbhFByhFYJJpy/0xYMI6cd8wsSTmVHcivWG31vpZhCiJ4f/ioHJi20QjM3Gjpd4fp86y7TGKtriIWqxth8boZ8Nj7xIQbEayZ0Fo3Oy3NBqeijiwHIPh/wFFm81wSZjyo4+YcHev20AmhktkfnH/41teOVl/Xy9ytKA6UTIvAyp4jGhBVdk0b+Oz28zVUbi1zFvGcv14eTPWCwhI+ImllCIWELT9KHrXpWhg2WuQUHM4izoTNMsdjP+yqGYo7qGKpd08czLTlvRBRvwpf/1aMNy1t0p5ruzMBYR+kwmR3A/dZ2IWcTjvaFyLR2xAZBAiPL+DJ2UH5MisZMSkLM24ZuwqqZzsLFff5iulMr9KOVm7Dja0ibLbLXXjg5g0g1m9H6KWsjm4kmqgkmZFoO1Oq5GQRt5dvTQA0Q81NjdDGk1DETXJD6J6F4PgCMHodPewkB2j6SmEKh4tAapkuq0NJpMhi9ghXR0oGuoL1iX11Z9UsP/6AxSHJCx9ByM9ruP7ktgfLtEUakkg9HM3OXJc66ikPPgnPLlO8cnxWqQ1RPJI+BeKKP1JwiHF46s2ujKDJC0EdrnSNB5xzbVbImDjLxTm7MZ4gc8HRrH5M2/KD2LdeWgBP2N/oSCerEkkT1lbzRz7jA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(7416014)(376014)(82310400026);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	izl1Ss5JSNLo8+R4QKLfyZFTMHkRvgz5UYHK/BN/T+V/+6sWHZezOcjNW5PASYPpk5BUY/iRCqxiFxsCss724HR9EpqvZM5RtOEIYortvpjnqp+MeHM/QsYni3g8p9h7IbROhxYW1eHfuPz3MVfq9VvmqS2LCd3vfWs2GX1GahMxPJR4GPqe91UtAXnnk5nMaMblm4iEP6fimi3X4brhQWt4iNdBHE/BuCKdflM1aHpry8YsH+gpk060+b7uWEh+E/G4P/uX78B4zebOVLGsYa+yY7RIBR2eK9UipSJCso+wLYRgdHMHWWpmZN8pw/pXWsFr6F4sw51CqiUFAXJn6xVeHqyCIrwkouCodWuY8gDZTCiuxsoMfZKO9eKZG8M4ywYOguE/3vkNFLhhSqtKl9optzpanVEaDYjT63aBB/q57h6SEQyG6YblpWmYk4Co
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 09:32:40.0078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3056bb17-be06-4867-24b2-08de7b634fdd
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYQPR06MB8086
X-Rspamd-Queue-Id: 32F9221DFB8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_NA(0.00)[cixtech.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32648-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zichar.zhang@cixtech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: "Zichar.Zhang" <zichar.zhang@cixtech.com>

Add Cadence GPIO controller nodes for Sky1 FCH(S0) and S5 domains in
sky1.dtsi, and enable those controllers on sky1-orion-o6.

Signed-off-by: Zichar Zhang <zichar.zhang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts |  28 +++++
 arch/arm64/boot/dts/cix/sky1.dtsi         | 123 ++++++++++++++++++++++
 2 files changed, 151 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
index 4dee8cd0b86d..4dc76e0135ee 100644
--- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
+++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
@@ -89,3 +89,31 @@ &pcie_x1_1_rc {
 &uart2 {
 	status = "okay";
 };
+
+&s5_gpio0 {
+	status = "okay";
+};
+
+&s5_gpio1 {
+	status = "okay";
+};
+
+&s5_gpio2 {
+	status = "okay";
+};
+
+&fch_gpio0 {
+	status = "okay";
+};
+
+&fch_gpio1 {
+	status = "okay";
+};
+
+&fch_gpio2 {
+	status = "okay";
+};
+
+&fch_gpio3 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 72f3b195a927..9ceaf8f68e83 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -185,6 +185,13 @@ psci {
 		method = "smc";
 	};
 
+	s5_gpio_apb_clk: s5-gpio-apb-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "s5_gpio_apb_clk";
+	};
+
 	soc@0 {
 		compatible = "simple-bus";
 		ranges = <0 0 0 0 0x20 0>;
@@ -354,6 +361,74 @@ syscon: syscon@4160000 {
 			#reset-cells = <1>;
 		};
 
+		fch_gpio0: gpio-controller@4120000 {
+			compatible = "cdns,gpio-r1p02";
+			reg = <0x0 0x4120000 0x0 0x1000>;
+			clocks = <&scmi_clk CLK_TREE_FCH_GPIO_APB>;
+			clock-names = "fch_gpio_apb_clk";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <32>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		fch_gpio1: gpio-controller@4130000 {
+			compatible = "cdns,gpio-r1p02";
+			reg = <0x0 0x4130000 0x0 0x1000>;
+			clocks = <&scmi_clk CLK_TREE_FCH_GPIO_APB>;
+			clock-names = "fch_gpio_apb_clk";
+
+			interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <32>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		fch_gpio2: gpio-controller@4140000 {
+			compatible = "cdns,gpio-r1p02";
+			reg = <0x0 0x4140000 0x0 0x1000>;
+			clocks = <&scmi_clk CLK_TREE_FCH_GPIO_APB>;
+			clock-names = "fch_gpio_apb_clk";
+
+			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <32>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		fch_gpio3: gpio-controller@4150000 {
+			compatible = "cdns,gpio-r1p02";
+			reg = <0x0 0x4150000 0x0 0x1000>;
+			clocks = <&scmi_clk CLK_TREE_FCH_GPIO_APB>;
+			clock-names = "fch_gpio_apb_clk";
+
+			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <17>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
 		iomuxc: pinctrl@4170000 {
 			compatible = "cix,sky1-pinctrl";
 			reg = <0x0 0x04170000 0x0 0x1000>;
@@ -587,6 +662,54 @@ s5_syscon: syscon@16000000 {
 			#reset-cells = <1>;
 		};
 
+		s5_gpio0: gpio-controller@16004000 {
+			compatible = "cdns,gpio-r1p02";
+			reg = <0x0 0x16004000 0x0 0x1000>;
+			clocks = <&s5_gpio_apb_clk>;
+
+			interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <32>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		s5_gpio1: gpio-controller@16005000 {
+			compatible = "cdns,gpio-r1p02";
+			reg = <0x0 0x16005000 0x0 0x1000>;
+			clocks = <&s5_gpio_apb_clk>;
+
+			interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <10>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		s5_gpio2: gpio-controller@16006000 {
+			compatible = "cdns,gpio-r1p02";
+			reg = <0x0 0x16006000 0x0 0x1000>;
+			clocks = <&s5_gpio_apb_clk>;
+
+			interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <10>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
 		iomuxc_s5: pinctrl@16007000 {
 			compatible = "cix,sky1-pinctrl-s5";
 			reg = <0x0 0x16007000 0x0 0x1000>;
-- 
2.34.1


