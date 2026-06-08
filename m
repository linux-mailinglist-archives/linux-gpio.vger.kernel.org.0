Return-Path: <linux-gpio+bounces-38087-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wUChFcyOJmrWYgIAu9opvQ
	(envelope-from <linux-gpio+bounces-38087-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 11:43:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5DA654B1E
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 11:43:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=WxuuzLt3;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38087-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38087-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3794302DFA5
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 09:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB79D3B3BE9;
	Mon,  8 Jun 2026 09:42:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013006.outbound.protection.outlook.com [40.107.201.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6183A6B8E;
	Mon,  8 Jun 2026 09:41:59 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780911721; cv=fail; b=GrKGeTMc1BRTQ/zWU6PkBhgr9ICEPzDx/CUiEHjI6x2PjkrExaYft2JP0XEm579x+LI+gv80I3w8FRSwrlYu/UJ3psrc0cYwiTAwCoIJmLbxPWqMBYSLYcAP1Y0PsUWnAWCTMOhHemRVaCYqm4UuCDTKq2+W5rFzZg4PjyfeTPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780911721; c=relaxed/simple;
	bh=Y1SyH3hfHUqZ9Y7Nll7V+jtx90lodGuBdjjbBN8EKVQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UTnUV2IrAwRG0WnWwNN06C99K+6oj3UlpXM6+8/Zf0BWTIRUiRVd0+0tANwiqZInMLL0F7rugS7p2PmkFwtAIK22T9UQmogANf4tvTX9DgNwcy0b9BtkC7HUOJBI/dFnpdxg4DbH0Dzoxbu/10vNitpbj7dcrKCAgzBgcu5S81o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WxuuzLt3; arc=fail smtp.client-ip=40.107.201.6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+8vz2aRDSpdh02DA7kgUT1CjDsae6OTWY0iATNi5NGWkZrP3xjUkgqqCLDpG75HPRMzXHpSOp+DICQvzUEluDc1G9sBMfXCQulZFLw1MV1hq0XdJiiR6rSVql4JT5YkNDkEHFxrVVRhfdps6AeL0xXvbZZJEbuRsLc2wKoaZUsfcN16yMMTqXpYke2OH6ZMqRC/puUbKabIG0i9UzeUh2a/plfK6vMdZvM/j/CsFisT8xzHvKxPA0xiFbvDmQ2Vg5yB8FNL9ac2plZRAUtNALggR3+1jaNQjYx0Cyy84kV8FtwNh4MYPOIN85g0x+OXJKKIfE5cn+TBXVL/TICtiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTw9h0g5xtOBgK7zuGYP6GO39pjwSBo7jHwNqIg1zos=;
 b=QcYjvdJ3Ftj44x5+kd5y2zQS7JZiXX85TViD0h8KhL/KwoHYTt6RDCTegYoEIQZ22etxKKPMKOCbhXSHFRcGnZl42YXTBFmJ+Yf9VI8rlnUcF/rOFbK6na5CEd03h5UkZ+b/SZnfQeI+wtQwxn76P9zmnH9tKCB/Swt8iDzdgdIr4DoI+9vEUKuHLVpglPOyWcvRIn7lNObfpqigqYOECDtS+CjIlMHAnUOy0N3ozGudUMAeLKPT4B463hfAN8SBSKSBtgbm+aYMrRIHi4bS+kfdiFPjbkIwqzbKlDlz5LD0EZjR+61jzYzSeieH8LJwiJzX1TmXdpSyMoQ0gUnhrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTw9h0g5xtOBgK7zuGYP6GO39pjwSBo7jHwNqIg1zos=;
 b=WxuuzLt3wOoYzWqfP4yVaXANsFcRLF4a2T9THJsinz0yJkZq6uUUQIbkAJRfgVIgWXRiBzt847Yj5fcVkegimU0WPxtpnpSdWQqYxVskp31J3zhL6IyAy7gu66yMB79QU72fhvha8l0U3gTLL2RsnTS8gCwsYEgYWzmSSjpJlqNQX74Cwfx/isepWnv4Yq26c1f0VVNI5zqnpFvvNRN9p2E6JxHAY83rWZLqBlAVKeYzrflVmAeb+lX67vmwCzXrGp9KYwJKH8Vy9bf00Qmog0Ef0mn/plY7JG1tUtmjsxW8klEBVo/StBU7X+tBCwv/D3tyXrkyLVZoZ9M90dynsg==
Received: from BN0PR08CA0025.namprd08.prod.outlook.com (2603:10b6:408:142::10)
 by DS7PR12MB8418.namprd12.prod.outlook.com (2603:10b6:8:e9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 09:41:49 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:408:142:cafe::9c) by BN0PR08CA0025.outlook.office365.com
 (2603:10b6:408:142::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 09:41:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.1 via Frontend Transport; Mon, 8 Jun 2026 09:41:49 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Jun
 2026 02:41:29 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Jun
 2026 02:41:28 -0700
Received: from build-pshete-focal-20260601.internal (10.127.8.14) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 8 Jun 2026 02:41:28 -0700
From: Prathamesh Shete <pshete@nvidia.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>, Arnd Bergmann <arnd@arndb.de>
CC: Prathamesh Shete <pshete@nvidia.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] pinctrl: tegra238: add missing AON pin groups
Date: Mon, 8 Jun 2026 09:41:22 +0000
Message-ID: <20260608094122.1245189-2-pshete@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260608094122.1245189-1-pshete@nvidia.com>
References: <20260608094122.1245189-1-pshete@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|DS7PR12MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: 83bdf0ff-965d-45a7-8272-08dec5422a17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|7416014|376014|82310400026|22082099003|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	5QaFz2kHhvQKWDBj8s6T/RN0nghSH4ZReaG+VQVbACW/0pq8fR7NsV78PRntOa/mTQqDd+rRe6MyyrVM1p0vLYcafzb9wBXZPW1oc4x8Ub8xkjfr85UGPn6sVPzDtloI9K5v+RUUkI8gmnUyTNaUsJ6jrqKcXVYaWxkjGEvJEYbr1nVvhXaOqGylgqlW7TKMhMG2kda7DGVUFBGM5nrYEmHPNzq8gAZBSiW4VjMVDci4CyHra+ahC2dtsIiJ4z9Cj0+Ie5mkdtV+5QDvpp1UyPF7CTQp2Gu/efLaAW49RCc6U5XCP6CuxQ5DnT05LpxrJsZbOPLWJ/taxV0BQTlRSOfPcgu6CXSZ2zzqBROiE2eQdRlO0st3Qd+Hj89ZBlxRKUdHl5PgHQjp2xqId4GL1DYQg3cZKE9v5xcH0r/Mv4FVThUz3hcemfuYMqhbzJPz7IxwYr1I47ZxJLoHsiOOLiuoJyL7O6KMjPVyTMrW7JEhVhTzXrVOrVhnzIc2IrqTcQHFuuiqo7m/ppw0JsNgz88hY0o4ACV/Z+uLXOy79g7GW0dVFwWojOqeMJWcavGMlE0TKehogXthy6QANQ6Mmxxt1NlxmIBwJBeEy5LM7MshgGq710wx/xpuYcPtMCnWp6gMC7kKAO9nG5U5FqhdMYJdZgTa1CpIbEwBhBSqQwITSVMXqod36Klx6eyrP8NzI2Ntfg5ZGN67DiVDhU6MYMHK/5g5h/SY6oWEQtN8VMo=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(7416014)(376014)(82310400026)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Oz2JhlfND3ErCzitWQEoDhVHYzkIt5zta1pyDAX+p5V+fNFRWkb4GH2WSOt12P4pLT7Zs1QN5ZacSWLtP/8DhqtKlIWNrTMVWYwYGffYSPRyv07K36gDE1hW7xuDG1uHcvRVeV/Ea8cGDaLszI5VgH0uZ1iDZ3qmIm5ot00R5sAO3m6jPLSoYg6w3hQFfl/S5c3oZFw5Aofm9dOJUXs++oh2eaNoEdQWHM1BbubF4itzFwC+K9ogKpwgR0r/ESqmt5tvR2LcHsV3Sdhvg5Er2CV58R5QAF/EZ/nyzDoBRAw4uKFEsvI2IiEfJGbZFxp52dnOZMiRZ/7YTxBEIXGdGULLeQSWdWDt1J2ywVsJP3sqqsEF4cZYME8hZsuROwrPvNSw5bClyP96vnXhODCHB2Zs6y+vHUVsQqbx9nIgxaZNbU+mzOJEqHcseW6GnSTn
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 09:41:49.5694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83bdf0ff-965d-45a7-8272-08dec5422a17
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8418
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38087-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:arnd@arndb.de,m:pshete@nvidia.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,nvidia.com:mid,nvidia.com:from_mime,nvidia.com:email,Nvidia.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE5DA654B1E

Add 24 pin groups on ports EE, FF, GG and HH to the AON pin controller
group table (tegra238_aon_groups[]). Their pin arrays, drive-group
macros and pin descriptors were already defined, but the matching
PINGROUP() entries were not present, so these pins could not be muxed
or configured through the AON pin controller.

The pin arrays were not referenced, so the build emitted
-Wunused-const-variable warnings, and commit 119de2c33d96 ("pinctrl:
tegra238: remove unused entries") removed three of them. Restore those
arrays and add the full set of PINGROUP() entries to make the pins
usable.

Fixes: 25cac7292d49 ("pinctrl: tegra: Add Tegra238 pinmux driver")
Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra238.c | 120 +++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra238.c b/drivers/pinctrl/tegra/pinctrl-tegra238.c
index c765b6b880e5..d3809594a5b5 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra238.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra238.c
@@ -1074,6 +1074,102 @@ static const unsigned int pwm7_pee1_pins[] = {
 	TEGRA_PIN_PWM7_PEE1,
 };
 
+static const unsigned int soc_gpio49_pee2_pins[] = {
+	TEGRA_PIN_SOC_GPIO49_PEE2,
+};
+
+static const unsigned int soc_gpio82_pee3_pins[] = {
+	TEGRA_PIN_SOC_GPIO82_PEE3,
+};
+
+static const unsigned int soc_gpio50_pee4_pins[] = {
+	TEGRA_PIN_SOC_GPIO50_PEE4,
+};
+
+static const unsigned int soc_gpio83_pee5_pins[] = {
+	TEGRA_PIN_SOC_GPIO83_PEE5,
+};
+
+static const unsigned int soc_gpio69_pff0_pins[] = {
+	TEGRA_PIN_SOC_GPIO69_PFF0,
+};
+
+static const unsigned int soc_gpio70_pff1_pins[] = {
+	TEGRA_PIN_SOC_GPIO70_PFF1,
+};
+
+static const unsigned int soc_gpio71_pff2_pins[] = {
+	TEGRA_PIN_SOC_GPIO71_PFF2,
+};
+
+static const unsigned int soc_gpio72_pff3_pins[] = {
+	TEGRA_PIN_SOC_GPIO72_PFF3,
+};
+
+static const unsigned int soc_gpio73_pff4_pins[] = {
+	TEGRA_PIN_SOC_GPIO73_PFF4,
+};
+
+static const unsigned int soc_gpio74_pff5_pins[] = {
+	TEGRA_PIN_SOC_GPIO74_PFF5,
+};
+
+static const unsigned int soc_gpio80_pff6_pins[] = {
+	TEGRA_PIN_SOC_GPIO80_PFF6,
+};
+
+static const unsigned int soc_gpio76_pff7_pins[] = {
+	TEGRA_PIN_SOC_GPIO76_PFF7,
+};
+
+static const unsigned int soc_gpio77_pgg0_pins[] = {
+	TEGRA_PIN_SOC_GPIO77_PGG0,
+};
+
+static const unsigned int soc_gpio84_pgg1_pins[] = {
+	TEGRA_PIN_SOC_GPIO84_PGG1,
+};
+
+static const unsigned int uart2_tx_pgg2_pins[] = {
+	TEGRA_PIN_UART2_TX_PGG2,
+};
+
+static const unsigned int uart2_rx_pgg3_pins[] = {
+	TEGRA_PIN_UART2_RX_PGG3,
+};
+
+static const unsigned int uart2_rts_pgg4_pins[] = {
+	TEGRA_PIN_UART2_RTS_PGG4,
+};
+
+static const unsigned int uart2_cts_pgg5_pins[] = {
+	TEGRA_PIN_UART2_CTS_PGG5,
+};
+
+static const unsigned int soc_gpio85_pgg6_pins[] = {
+	TEGRA_PIN_SOC_GPIO85_PGG6,
+};
+
+static const unsigned int uart5_tx_pgg7_pins[] = {
+	TEGRA_PIN_UART5_TX_PGG7,
+};
+
+static const unsigned int uart5_rx_phh0_pins[] = {
+	TEGRA_PIN_UART5_RX_PHH0,
+};
+
+static const unsigned int uart5_rts_phh1_pins[] = {
+	TEGRA_PIN_UART5_RTS_PHH1,
+};
+
+static const unsigned int uart5_cts_phh2_pins[] = {
+	TEGRA_PIN_UART5_CTS_PHH2,
+};
+
+static const unsigned int soc_gpio86_phh3_pins[] = {
+	TEGRA_PIN_SOC_GPIO86_PHH3,
+};
+
 static const unsigned int sdmmc1_comp_pins[] = {
 	TEGRA_PIN_SDMMC1_COMP,
 };
@@ -1890,6 +1986,30 @@ static const struct tegra_pingroup tegra238_aon_groups[] = {
 	PINGROUP(dmic1_clk_pdd4,	DMIC1_CLK,	RSVD1,			DMIC5_CLK,	RSVD3,		0x11d0,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
 	PINGROUP(dmic1_dat_pdd5,	DMIC1_DAT,	RSVD1,			DMIC5_DAT,	RSVD3,		0x11d8,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
 	PINGROUP(soc_gpio19_pdd6,	RSVD0,		WDT_RESET_OUTB,		RSVD2,		RSVD3,		0x10f8,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio49_pee2,	RSVD0,		RSVD1,			RSVD2,		RSVD3,		0x10c0,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio50_pee4,	RSVD0,		RSVD1,			RSVD2,		RSVD3,		0x10c8,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio82_pee3,	RSVD0,		RSVD1,			RSVD2,		RSVD3,		0x10d0,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio71_pff2,	PPC_MODE_1,	RSVD1,			RSVD2,		RSVD3,		0x10d8,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio76_pff7,	RSVD0,		RSVD1,			TSC_EDGE_OUT0,	TSC_EDGE_OUT0A,	0x10e0,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio74_pff5,	PPC_READY,	PPC_I2C_DAT,		RSVD2,		RSVD3,		0x10e8,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio86_phh3,	RSVD0,		SPI5_CS1,		TSC_EDGE_OUT3,	TSC_EDGE_OUT0D,	0x1100,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio72_pff3,	PPC_MODE_2,	RSVD1,			RSVD2,		RSVD3,		0x1108,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio77_pgg0,	RSVD0,		RSVD1,			TSC_EDGE_OUT1,	TSC_EDGE_OUT0B,	0x1110,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio80_pff6,	RSVD0,		PPC_RST_N,		RSVD2,		RSVD3,		0x1118,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio84_pgg1,	RSVD0,		RSVD1,			TSC_EDGE_OUT2,	TSC_EDGE_OUT0C,	0x1120,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio83_pee5,	RSVD0,		RSVD1,			RSVD2,		RSVD3,		0x1128,		1,	Y,	-1,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio73_pff4,	PPC_CC,		PPC_I2C_CLK,		RSVD2,		RSVD3,		0x1130,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio70_pff1,	PPC_MODE_0,	RSVD1,			RSVD2,		RSVD3,		0x1138,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio85_pgg6,	RSVD0,		SPI4_CS1,		RSVD2,		RSVD3,		0x1148,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(soc_gpio69_pff0,	PPC_INT_N,	RSVD1,			RSVD2,		RSVD3,		0x1150,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(uart5_tx_pgg7,		UARTE_TXD,	SPI5_SCK,		RSVD2,		RSVD3,		0x1168,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(uart5_rx_phh0,		UARTE_RXD,	SPI5_MISO,		RSVD2,		RSVD3,		0x1170,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(uart2_tx_pgg2,		UARTB_TXD,	SPI4_SCK,		RSVD2,		RSVD3,		0x1178,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(uart2_rx_pgg3,		UARTB_RXD,	SPI4_MISO,		RSVD2,		RSVD3,		0x1180,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(uart2_cts_pgg5,	UARTB_CTS,	SPI4_CS0,		RSVD2,		RSVD3,		0x1188,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(uart2_rts_pgg4,	UARTB_RTS,	SPI4_MOSI,		RSVD2,		RSVD3,		0x1190,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(uart5_cts_phh2,	UARTE_CTS,	SPI5_CS0,		RSVD2,		RSVD3,		0x1198,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
+	PINGROUP(uart5_rts_phh1,	UARTE_RTS,	SPI5_MOSI,		RSVD2,		RSVD3,		0x11a0,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
 	PINGROUP(pwm2_pdd7,		GP_PWM2,	LED_BLINK,		RSVD2,		RSVD3,		0x11b0,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
 	PINGROUP(pwm3_pee0,		GP_PWM3,	RSVD1,			RSVD2,		RSVD3,		0x11b8,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
 	PINGROUP(pwm7_pee1,		GP_PWM7,	RSVD1,			RSVD2,		RSVD3,		0x11a8,		1,	Y,	5,	7,	6,	8,	-1,	10,	12),
-- 
2.50.1


