Return-Path: <linux-gpio+bounces-35571-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCceElxo72lZBAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35571-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 15:45:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEB8473AAE
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 15:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A19273007A5B
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 13:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 798173CF041;
	Mon, 27 Apr 2026 13:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dqNs/blm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010023.outbound.protection.outlook.com [52.101.85.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FE83CD8D3;
	Mon, 27 Apr 2026 13:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777297441; cv=fail; b=gmrGCxZcxbWqCtiKEkJNe99gyAgma0zCLZKYjUWNbcq2e2xWG5MLzqipZZ+atgVQpOEChtGKvZcenHrq5NKqCKmDcBPMVf9WXFIR7U23x6aCd++1rYI13YwyxxxC54RN3bP01u/rTEmA/+HtMfCYFxkXEuty2pz7NJDCdR7b2JI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777297441; c=relaxed/simple;
	bh=+D9QfCu679Hed6oO3GPOwAUOqA77IqBeqH/PZ5RY+hY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RY/raBhExIrpADjIvLqUlA3UjwMdEUDxrDvg04fPCEylT7xviPqnB9HCkJQoDL9oDeBWBG8Z/HWIa0IZVepg+Gy22vyJ7Yf0qNICp5W/q8XHW4TUEpgOsPLaQprhEqn82Ge+ze0/ve79PnkYgfnd48gZQ5l3ufapyQaefNkiHNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dqNs/blm; arc=fail smtp.client-ip=52.101.85.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMgR83du74QIqLUvbcB/tLnXSKyzjCcfviTgJFqZr1zLDAYbaClNwZJxabxVTkhPRTnxuJm7kedj2aL1oeIwsVuK9l5B6jzCjB3U1cqkh2l8lTaYLrXFyBecHWYgTxJhZiVFTAANSv9uOt/6DTyXYjxHiE3+FoOElYWFCrmYpW8Rza/7o+kKogeso22F+baf5nRDpgoJm+Yq/Eyn/OOzKxENmfvJgUDfKCbDTZbZaTx4nDpzf2cBVI1SEJQb6GulySrc9qhighLZSpq5txWxI+jJxWPKikBr9aNLDHT1JndAcqch+PRLgpjtk3BjHAVCKwq/FIwiIBrbVyaEf+73eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryBToxP+sJYQm0qzUtolUzGetysQOFnbYJgEeD11KAg=;
 b=GLuU5cOBZb6k3O7sbaIzNZPvswb4Gdi6QK28EynYmVf+DMyqAeU4s67Ok+r3WB26v5mAVEioXzRxeaFFGK2g7WASCHCS+5L3hE58RVnlvyPNbp6wNMIGjmjVzj2sIieXAIl0+SZ5FHtxVwpyh6KHLJFmD1VkfRoHkHY4375ikgFkmbv3GzoJGGxSh7tRACFIgJRB6klbCsIKy4J9OlKGHBciWNkwDbRzrP/XKTkHSTsu/kx6x2Jmtoo/gPJMDGtqN7Z244gX/oSmmg396fTsm3wU+QSn7Yaf3FwEjEhsHP0Lh1Crrs2XNObX0j4IaMMY3sKtrnALldmlSTik9dKWfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryBToxP+sJYQm0qzUtolUzGetysQOFnbYJgEeD11KAg=;
 b=dqNs/blmhTLdbYe32cBxP4rNCX836h8pDBPiftFImqpMosLKf/CPmqwQ8kVxFKuO3Ey88IUS+ZTLmTWghmvsGeWmmygW8O9phrCAfEY04xbCEi1nCRf3EAnv/tUmgDkcKyfXHvC3u+nmoNaRF1TdVQaCN5ZSUPZvf9NCmLU7cOKzM400StWjryirY3k0Q05CjYPijmlbY/sQCbrvxPDZVjK3Y30lSkcjxk1NtvmeG84vQRpWATWj56enCHU2cRqhnQdLC/gUZo1Izd7TjQSteucGOZIaO9JDJN263CzsgPl6GwLPCnrsiZHyw4ktaCXW4dkzMQuqS7mxIkI3pszWBw==
Received: from BY5PR16CA0015.namprd16.prod.outlook.com (2603:10b6:a03:1a0::28)
 by PH7PR12MB6442.namprd12.prod.outlook.com (2603:10b6:510:1fa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Mon, 27 Apr
 2026 13:43:53 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::bf) by BY5PR16CA0015.outlook.office365.com
 (2603:10b6:a03:1a0::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 13:43:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 13:43:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Apr
 2026 06:43:30 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Apr
 2026 06:43:30 -0700
Received: from build-pshete-noble-20260401.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 27 Apr 2026 06:43:26 -0700
From: <pshete@nvidia.com>
To: <linusw@kernel.org>, <thierry.reding@kernel.org>, <pshete@nvidia.com>,
	<jonathanh@nvidia.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <webgeek1234@gmail.com>, <rosenp@gmail.com>,
	<linux-tegra@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 6/6] arm64: tegra: Add pinctrl nodes for Tegra264
Date: Mon, 27 Apr 2026 13:42:31 +0000
Message-ID: <20260427134231.531222-7-pshete@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427134231.531222-1-pshete@nvidia.com>
References: <20260427134231.531222-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|PH7PR12MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: 2441411b-db9f-492f-4798-08dea4630562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jMDaluLuN8dMANj902N7LnRh1Wrqt31C9Q6zDKdfRuwKZSyHPEwrla9gLGCqymRF0g5m8Mz29I8KmewggUtI2QTDfF018UE6Eyq0ZmwBbtomJGAi2NPl0axYOK4xe4wEtHkv7xAoGZVUnlh9K8sDEUYP12IVnkJvu3lOvnMn76hSUumU/KD3x7pSLFSzmIwMtYYxCbOHiSaaPyAD8ukythT/aqEYrOlDv01j9Ioq+fzRhxD5zmHSdyh2OWEg9LpIKcHJRhTSqKHYeOgkefJZ7gpRwSAJebXB+UQnZ/lgLK3MIYjlvfTArF0bANdRZNssd1tMD7+m/ye3PEcisnYD+CYD6AhelwU6x1AGMHZBaf3NTs5KT3q+MbOwGHzvfWx+fmAnzyOt8RAro6oEmcfUqLhNqewOxFPuiTS96DCfOyq5uZ0ShfKqRozNXAAUPL2fomacejvpmoa7Lr76DU37cQseJFZ2TDM4w6uoYjpt0fRMMg2yRvBH48+F71Tu1aDVRkyepDvpcqYMcgfKGlXq9Cf/Lb1OtvVZ96RQZgjl5qDqukzQtcatsfreoBkYSNvv5Oz24EttpuTiejivpB0F1mX3YtnpA2MF/MDuCCDqfo2h7UOhbc+m7CVrFyE5OKYSW82YY/37COUqOC7EJLzcGwqNwsKhQBuYB4JoMXnyzt0MvaYMmpddTxZ9gHPgeFcDh7i3FdO1LLTwFa5ERVdmbwBC1PvMU8MHsA+rFAx3qADZOxArIBjkb0RW1Wot5k2B+fsoTyY0HiG6Zw2/EH+o9g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dWZTOsSLBKyQYCWXVVv062K0KexEqMVeMqpcJQSIYXfuPaHOeJhifpgKxJpt5OwCS2j1R09Qqpz1pnTvBZwwRof0fjrY4nyHeJ/Vx97WisTKb7fVPPxe1QuhyjiMoCwBQuIboFcGU7YWZeC6CGAtgq3Bq4l7PN0XsKnt6opTDft3osLmqZeackT9hDoHPiNvdYtB8mrTOHfsEbyQCsBTVTrcDB6xR2bfofpuIi9jN83IUDvZ+UiJXOeE3KKpGTKZwi5Q4jTruvc4iPzdUbYwx4/f9SkL7kugK6wZZG/Kx0rl5dzbL86o7nKFN1mbrNkfEYLx2dEhhtJMcBTqQNYulvbxPqbU115uk7toFgcE8PrjPtuQygzM4McNrazu7Qp54J7AdSZH6vbUqxM9+yTsCstCwYrtpy3saFZgSTHeESoV+xL8jOP/ibIrjNUK3d1l
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 13:43:53.0886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2441411b-db9f-492f-4798-08dea4630562
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6442
X-Rspamd-Queue-Id: 3CEB8473AAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35571-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]

From: Prathamesh Shete <pshete@nvidia.com>

Add the three pin controller (MAIN, UPHY, AON) device-tree nodes found on
Tegra264.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
Changes in v3:
  - Wrap commit message to 75 chars per line (v2 was too short).
Changes in v2:
  - This patch is added as part of v2.
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index 06d8357bdf52..dc7793088d2e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -3380,6 +3380,11 @@ i2c3: i2c@c610000 {
 			status = "disabled";
 		};
 
+		pinmux_aon: pinmux@c7a2000 {
+			compatible = "nvidia,tegra264-pinmux-aon";
+			reg = <0x0 0x0c7a2000 0x0 0x2000>;
+		};
+
 		pmc: pmc@c800000 {
 			compatible = "nvidia,tegra264-pmc";
 			reg = <0x0 0x0c800000 0x0 0x100000>,
@@ -3586,6 +3591,11 @@ pci@c000000 {
 			status = "disabled";
 		};
 
+		pinmux_main: pinmux@c281000 {
+			compatible = "nvidia,tegra264-pinmux-main";
+			reg = <0x00 0x0c281000 0x0 0xc000>;
+		};
+
 		i2c14: i2c@c410000 {
 			compatible = "nvidia,tegra264-i2c";
 			reg = <0x00 0x0c410000 0x0 0x10000>;
@@ -3862,6 +3872,11 @@ bus@a800000000 {
 			 <0x00 0x20000000 0x00 0x20000000 0x00 0x60000000>, /* non-prefetchable memory (32-bit, 1536 GiB) */
 			 <0xa8 0x80000000 0xa8 0x80000000 0x57 0x80000000>; /* I/O, ECAM, prefetchable memory (64-bit) */
 
+		pinmux_uphy: pinmux@82e0000 {
+			compatible = "nvidia,tegra264-pinmux-uphy";
+			reg = <0x00 0x082e0000 0x0 0x4000>;
+		};
+
 		gpio_uphy: gpio@8300000 {
 			compatible = "nvidia,tegra264-gpio-uphy";
 			reg = <0x00 0x08300000 0x0 0x2000>,
-- 
2.43.0


