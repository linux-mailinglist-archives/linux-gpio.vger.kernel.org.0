Return-Path: <linux-gpio+bounces-38086-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9e+vLLGOJmrSYgIAu9opvQ
	(envelope-from <linux-gpio+bounces-38086-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 11:43:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA3E654B0E
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 11:43:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=iWXeBRS0;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38086-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38086-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68E6C301C90B
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 09:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA783AEF58;
	Mon,  8 Jun 2026 09:41:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012020.outbound.protection.outlook.com [40.107.209.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DCB3A6B8E;
	Mon,  8 Jun 2026 09:41:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780911713; cv=fail; b=RgzBEbdFlA2vnJv6UiTjqSpB5M1AG+oX88SQ5W1OcKVWgIWWKFOukc1FGrhVZ8K46ZuheU34Qz62BhaZ1sQ6WNFmMRTMiP1a6nUkST6xlitgP+QFGYRQsnUCWBUT0nDlcli8aRgZvujwki55Mj6Xc06AQlr4chqMyMLW0+kHcPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780911713; c=relaxed/simple;
	bh=EmMpKejFovm6emfOn+3b3BJ9lPrSlOg+8GHa3UbomOM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pT+F1iGuBLtd4XqlMSWCucqmsBbjqj3emFCYrjE6jlMns3kaiwUW444+Vp+vMnMkR1EGu5mrLc5woX5M869dH57PnVdBbYCuJV9XDMYRfjONZmlU8umihMw3qwx+4ZknELNkGQDlZ+3tuOErR57x/95D+iZnZTNOcQuRo43J2K0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iWXeBRS0; arc=fail smtp.client-ip=40.107.209.20
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OytRSQEMjBSSqghbxl0R2UKb0TnMaEghWaPNQgwwo8nBUoS3IYEqZbLNRv7iRhU+ZctuZhcDh9UzcPO9tm/mq6+KnHlkeHpEefw4b/5vyD8DhJTv1XC7l8YFWBIkXdRMB8D/2CpdsALdR/GqEfL/Zt/w9bb+vh8b4rqvwGkSTw7PppQER87FlsISt1rtk791Av1C0m6NrAMba+jV/X0I33qxlNzIOQt+AEb/3neYBToRHo9rvTPFf8N+qNLe8yHL6GJKuL3BDKiE9I/9Yv4CkTXov1+2H4kOvDb56o71zxKYVOokm51XfVQ+oIL3uayIKZRh/auML0IPoLQUPinh7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/OPOwifLzLd+ZCx2HhPzU0+RhV2q9xVqDrcQqqyI+YY=;
 b=lPZ3wT081fFU7f74kMXZbt63EqjX+pteKGvBiVoLKm81/g9F+uktPva/rLb893ziYxqu+mom27t/S7d0IyfhUPusT0OGamKKeSnJ1CqkCWvyrDXVjMzX8MS27VztwcISMorwIx/zsLYWYbeL9OHpuY7hqxf5GcivNSX9o0OOZzKRDMmo8yAJtTjpjWtQS9/GnsXrl2VKkWUF/bz6WuVB2VfS2jy9odx+lVkyrjPHJx/nWaN2jvqWMOzCbxGap3y2rm18bt7yym53RUAoySrOKvjZ7xQfioyqeLoPLpEaOalJ8VsguEi7t+YGViWBNV8usiXdhzmvbLgJvDOG5QF38g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OPOwifLzLd+ZCx2HhPzU0+RhV2q9xVqDrcQqqyI+YY=;
 b=iWXeBRS0fGm/SOw8+JNF06kG2Praq23d59HeVGRI51bLZ1L3UfDyMZsUWxBWnKMkLTDYQNjQ/UzGaAxsLJjeeDUJj0wQx7gXjhEY91mX5S+IEIWDZJkn7MJySuzJIMXSkWGcTSu208CI9A4PFnRnHJw5SzP/KkjIfU058ZfkAvcAmtoRhEy0B3xDuOEnLSuxmPwNfSKF7Evk1ferdp9zMbcgwbpsBJ8/vI7PQIFTc0rSbybXPpku8sr+brR3OmmeTMAPhnCahS97yr+V9+H5Ei7OOJsGn3N0OBum9PGAy63NYVbzVqMJvmNj5XmeU+b4QcUo58OObgDIxaemeIb8QQ==
Received: from BN0PR08CA0027.namprd08.prod.outlook.com (2603:10b6:408:142::25)
 by BY5PR12MB4164.namprd12.prod.outlook.com (2603:10b6:a03:207::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 09:41:47 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:408:142:cafe::8) by BN0PR08CA0027.outlook.office365.com
 (2603:10b6:408:142::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 09:41:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.1 via Frontend Transport; Mon, 8 Jun 2026 09:41:47 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Jun
 2026 02:41:26 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Jun
 2026 02:41:25 -0700
Received: from build-pshete-focal-20260601.internal (10.127.8.14) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 8 Jun 2026 02:41:24 -0700
From: Prathamesh Shete <pshete@nvidia.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>, Arnd Bergmann <arnd@arndb.de>
CC: Prathamesh Shete <pshete@nvidia.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: pinctrl: tegra238: add missing AON pin groups
Date: Mon, 8 Jun 2026 09:41:21 +0000
Message-ID: <20260608094122.1245189-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.50.1
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|BY5PR12MB4164:EE_
X-MS-Office365-Filtering-Correlation-Id: c3dbcb39-e135-4240-2c67-08dec54228da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|7416014|3023799007|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	qnznHsJRymAmxkfQT7bmuOYGzqhofNTx92wsMA0Hdy0fOdBMgV6GLFi4nfy7ZG/PazALyfCS55nfWX4xwgO6YLSXu8MDDv36YCWdGYhMa2FC83MUsH8JK3LnZoiNWcR7sSzq98WiHH425NFbRkr71/e/GdmBScqAWnU9wNkfIzV0MXw1ZAdAlbj9AxAI00W5zP70V3CbCD0HNcJ/UkaYwjiqKKbnwq6ZxTJZ+bNkcDftniSh8ubpsqfOyZych9kHvRa2blVU0fCz2JGI2/on1Z6HJwgIC1+eeS5Oj92IzWj1fLsS36eCtF/4IJ7kHskaSHSeqm/3fhJznqNXLo2untjPWdfm+Pw9EbNv4+IVy0Q5Q6omqMP7vbQULcRfrgqbHPOJM1BCJ5NWqOqCwYso5oyWLwEOjDEFqbuPxXhcW7darytXvYL26dHyGiu5opqIXfq5gqOn1n7Hvsh2cbH5EbIQ+zex4QRpjc9Y2RbFE7GW7r3dT1gIRhzQWWW8iAhhRkKNYp9EqN+Gf8w8FOxTTUlcjN1gO+OD49b8jcSLhxEcRCfoLMLtKFrr03LJvVUXii8Y/7T9jN39DwvSP2VJwE0mLrIG1UeBG0X6IHTQo6EGqW4Yi8BBOnOyzy/zNU5ZHCO323ITOf+o9yN+ehDKcAc7ZEIYldyfDZdTPWVINbk5EDVne/sKiamQsvTMsOgnRfs/t7cnpUsutphq2pxh2Wo29Svm74+3qyfZ5mqA/Gw=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(7416014)(3023799007)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Gh0rATH7741fTa8tX2cfXQSPtCUXoU4soPFd2TvXCAbyLAdrxnPTXOWwRQcl/M8ILhCcHPQjednVv4M6dPAR/t5kivEbGJZ6LNnB93rd64VHclGdylKibSwEGGpfumBESueGgy9MINyJ1HUw3UeiGJtazwaHTrMq6j1S882DQU+D1nq+Agi/a4FzjjVmdp0PMt0Y6D2eSGayAqPYEcxEBH8sadXh83IzAiYnowIMRc6phs6+7s/JjE5ILSvKTuuRALOE4UqZjyKhzAP2KcuPmcrbwsYfV3J4WHvmrtlc3rAzjmLYqZW7cnyQZxVkVfJ/3T/UaLqAKMUJ/C/yU/TnRj6BHSnyP4u1kWJOKmwSb8rr6tiUDT+BceA5guVy7Rlxt0unXliWjopptOLxTJmG4kGthhBqAcxw3PjRE0RV9fwu7GSpA3kR0bQZ26YBoXXf
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 09:41:47.5145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3dbcb39-e135-4240-2c67-08dec54228da
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4164
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38086-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EA3E654B0E

Add 24 pin groups, and their matching drive groups, on ports EE, FF,
GG and HH to the Tegra238 AON pinmux binding. These groups are present
on the AON pin controller, so device trees that mux these pins through
it validate against the schema.

Fixes: 9323f8a0e12c ("dt-bindings: pinctrl: Document Tegra238 pin controllers")
Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 .../pinctrl/nvidia,tegra238-pinmux-aon.yaml   | 26 ++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux-aon.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux-aon.yaml
index ab9264d87c88..2b2e1a82880e 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux-aon.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux-aon.yaml
@@ -38,8 +38,16 @@ patternProperties:
                     gen2_i2c_sda_pdd0, gen8_i2c_scl_pdd1,
                     gen8_i2c_sda_pdd2, touch_clk_pdd3, dmic1_clk_pdd4,
                     dmic1_dat_pdd5, soc_gpio19_pdd6, pwm2_pdd7,
-                    pwm3_pee0, pwm7_pee1,
-                    # drive groups (ordered PAA, PBB, PCC, PDD, PEE)
+                    pwm3_pee0, pwm7_pee1, soc_gpio49_pee2,
+                    soc_gpio82_pee3, soc_gpio50_pee4, soc_gpio83_pee5,
+                    soc_gpio69_pff0, soc_gpio70_pff1, soc_gpio71_pff2,
+                    soc_gpio72_pff3, soc_gpio73_pff4, soc_gpio74_pff5,
+                    soc_gpio80_pff6, soc_gpio76_pff7, soc_gpio77_pgg0,
+                    soc_gpio84_pgg1, uart2_tx_pgg2, uart2_rx_pgg3,
+                    uart2_rts_pgg4, uart2_cts_pgg5, soc_gpio85_pgg6,
+                    uart5_tx_pgg7, uart5_rx_phh0, uart5_rts_phh1,
+                    uart5_cts_phh2, soc_gpio86_phh3,
+                    # drive groups (ordered PAA, PBB, PCC, PDD, PEE, PFF, PGG, PHH)
                     drive_bootv_ctl_n_paa0, drive_soc_gpio00_paa1,
                     drive_vcomp_alert_paa2, drive_pwm1_paa3,
                     drive_batt_oc_paa4, drive_soc_gpio04_paa5,
@@ -53,7 +61,19 @@ patternProperties:
                     drive_gen8_i2c_sda_pdd2, drive_touch_clk_pdd3,
                     drive_dmic1_clk_pdd4, drive_dmic1_dat_pdd5,
                     drive_soc_gpio19_pdd6, drive_pwm2_pdd7,
-                    drive_pwm3_pee0, drive_pwm7_pee1 ]
+                    drive_pwm3_pee0, drive_pwm7_pee1,
+                    drive_soc_gpio49_pee2, drive_soc_gpio50_pee4,
+                    drive_soc_gpio82_pee3, drive_soc_gpio71_pff2,
+                    drive_soc_gpio76_pff7, drive_soc_gpio74_pff5,
+                    drive_soc_gpio86_phh3, drive_soc_gpio72_pff3,
+                    drive_soc_gpio77_pgg0, drive_soc_gpio80_pff6,
+                    drive_soc_gpio84_pgg1, drive_soc_gpio83_pee5,
+                    drive_soc_gpio73_pff4, drive_soc_gpio70_pff1,
+                    drive_soc_gpio85_pgg6, drive_soc_gpio69_pff0,
+                    drive_uart5_tx_pgg7, drive_uart5_rx_phh0,
+                    drive_uart2_tx_pgg2, drive_uart2_rx_pgg3,
+                    drive_uart2_cts_pgg5, drive_uart2_rts_pgg4,
+                    drive_uart5_cts_phh2, drive_uart5_rts_phh1 ]
 
 required:
   - compatible
-- 
2.50.1


