Return-Path: <linux-gpio+bounces-40106-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3w57KhJfV2pfKgEAu9opvQ
	(envelope-from <linux-gpio+bounces-40106-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 12:21:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 048C475CE8F
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 12:21:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=KOMh8ppS;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40106-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40106-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6F193040C89
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 10:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6425F43CEC3;
	Wed, 15 Jul 2026 10:17:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010070.outbound.protection.outlook.com [40.93.198.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBCD431483;
	Wed, 15 Jul 2026 10:17:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784110623; cv=fail; b=DlQhYHVZi6gb5DIRMRJ9ATF3JC0KPRIrTv15oyKDM9wdlm5hBXPbOmqsmk8xBdCjEBj+8I8CiA5yzKFddkW9umkLg7K5LpHnaP5m6QsqkgOvHaJs2HZeEBffxvZfYCJ10FXvaFDFpaTPjXbbv+qfJ5sPf/xp3QzzwOVSDo7vs24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784110623; c=relaxed/simple;
	bh=jnsF/dyUd/nM6WNouhznq5ar8vG9Gw0hgFPHgB7p65M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=alXrUwElsT8YYqPWBo6MVt8btJJelpAoSqf8krlBU/aUl7pPrSReTKDfXOolMZJGIxrnc/mLx/vLJwUjKOU87yddW1lZj+ZaWlhZLsbdkX3ete34Or0np6219HN6JonqEHFhOt+WWo0OW/YGvMkoWN9kMQBlh/qnRdMlghJ1LvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KOMh8ppS; arc=fail smtp.client-ip=40.93.198.70
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3A25JHoYejAhjXBcHWKqZ8zXWZUZNOuAbqO1jloMDvi0EyWsgWEsTVj6G2QT3r+YWQPz8o51PjV0s5gcY5i7MkKuWRxBC4ylDlztlv0RJLyZLetisjlZe+EcqyNPnaX3inQ9jO9ATbuPQ8cStxu36PCgG9KK+JwBumwuU/vjufHR4eDLa8+BOTxBMm6/uPDL0VO3mYuEMb7vNgOMQ/ugNPXvNMBnFiAEw+SfhEuN05yGxl/7q90Bal/oai0NhoC0WrmIQfcm408uBUlCq1Z/PPZQ1kzQQS3MISgW7qNcWqFp8dRwohM4hHvUhcZdTUSsJOoqT52XzZYX56AII0J+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6nieyPU5MxVYJD+TUTaS/W4cXz7XGRdLtfYLixPllA=;
 b=txn5FSo14dTRCJywuMvsXvuQQr4qmPYrAyX60incml5tkCsvTGE65rTonPp1b4kgstxRJDAE7abHqz2z03ndA0CBWCH3kMDOhSCpP8J4LXT/trMJ9lD5Ql3qJYo1y6mPaCPVovwgt9GGgf8EDUsaRw+lnc4tstn/lVvmZI28bTMDDfC5WOB2v0yHIGCm0ZKbt1jASiMepwPfUlsf5LQ2FhkDl01dpZRWdSVfuCOVE0zqpr5UVCkRoIZZHb+7Mej/E0eJ955e9KkLb+iB1hjb9yQAOLvr6enUQvoJhejyOKM6++XK5SitMXTgQZE+c16R777yPF6KKjzq9xmKVNKi+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6nieyPU5MxVYJD+TUTaS/W4cXz7XGRdLtfYLixPllA=;
 b=KOMh8ppSvr8LEf5FljrdqiK86QRn39sb9O6SKPCwjwESpTbn7lTLxJtq9mT1iFxO4sjthL7MM09Re7sbgqFAB6I9Kxs5R9n3o2E6K38cKEP/zdP0BvYS13Eqcq/MzYSTpt76BcdWalASXs8v3YzuJPUykTOoXvMnwLuUd9fs98lIbA4V+U6S1q53Uq36wuv1J+eHt/XivDj6Jax8tloWXPAqBNiR/nz0OK6aYOEXyuaawyCOoKlcThLmmuFs+aYxoGxRla30i0yfkiToFwIHj7CPy8rBfNhKWSBGjVu8uEMYmUOgpWriceusu1VYVHOCfQaR3L5bJYbCbXQ420Cs9A==
Received: from SJ0PR05CA0167.namprd05.prod.outlook.com (2603:10b6:a03:339::22)
 by PH0PR12MB7861.namprd12.prod.outlook.com (2603:10b6:510:26e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 10:16:56 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::59) by SJ0PR05CA0167.outlook.office365.com
 (2603:10b6:a03:339::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Wed, 15
 Jul 2026 10:16:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Wed, 15 Jul 2026 10:16:56 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Jul
 2026 03:16:39 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Jul
 2026 03:16:39 -0700
Received: from build-pshete-bionic-20260122.nvidia.com (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Jul 2026 03:16:39 -0700
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <u.kleine-koenig@baylibre.com>,
	<dakr@kernel.org>, <bhelgaas@google.com>, <pshete@nvidia.com>
Subject: [PATCH] pinctrl: tegra264: fix DAP2 DIN/DOUT mux functions
Date: Wed, 15 Jul 2026 10:16:36 +0000
Message-ID: <20260715101636.547305-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|PH0PR12MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: b2099286-d8e6-41fd-9317-08dee25a331f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|6133799003|3023799007|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	Bu7TDaNe+sbD+L3w5qsTuPtg+QwgHflGnwCQzHUftYzNSAhz4bSkfvwLAT7IlBedeGDSigpZUTsuTe6PVQsD1cATBAGu3ZUhM93iD19oR1ceDPyiBVyak0+I8w7+QUmoKpLOglCtQ3YfJ9h11U/b4xch3VEyYMVYP6gVcwi5087LSkfJWSCZgNwY1GqpPQlGkJ9YfXMtPnwKYRi71hIh+R3TxXMUwaNY2zhgEtWEETI7FybKYEG7CBe4VsgsrR/m4uUK8ZXO/7hyeYdI4tecdIvgf9YyqHB78uQjgE4Bfdnie72PaJFoiByJYdKCbGTJyBq8Cu8NpuNPxUfbzxV2oWpqBB8pA66zSesqT7aF5Fenm7JY1YzCMHGENu0P8SGBVjGalk2kjRj51rzxmykPK7Z4AdvbtBlSehVPkK4lrYpAg3EXwh/ikzA2AIC835/g/dhTqZ4MH0nc/V0MB3ZY4Eri0syBtgoDBjC5XuUBEz7eN3y5n6aHOfb+8i8U8wb8qvPzFP7M63u/lGP2Dfv2Pac/g4PdIv+B2TRhG70hoPaHYH0xhBFUQRzYuTznqQjBqmMumn0oVRzD89fjSs0jvC+k3aIakkGRq2wE35NsR5hgCl1y16wkDi/2UxEiugbZlJd2UYMHmuRkwRO2MJljFjyIlJtvxbSv2+qQWEdAIaWQlEBZxZUFqLQU6LYS2K42srsRUZhe5JtViGRp9C6HoA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JGKBguixSGErptw5PQqRiDdaPg87hCEwaVdf/l4uXTrJWyVwsXnqD10uzvsrUgAYAy/iMD1Beu11XV1ZThIDeVtdSq138i9517vJ9FWlozR2rr5kV6D0r1VmYWFgDOu6wd3S1wtKAUjz5gTJ1OKZZG/8JcGXCu9vG3LT2jep7t7NBsoEEaYjUPdt1lBWoUd5S4+Du6bPDMJ2rkotVDWhkcVvR58ScpieYb0Qafqxl54LiEF6xvtceiZM4HnqQlTt4QMR7LQP132Ykqjy+7V0WLPUaqm/F7WwCbtkcqFagfbo1g4XtIEKYGElp+dOJJ12B0w0PK2h7TDd3lOXYmIaRbE2/a38Ez8k+ZMAkfuZpXHgoRU05yJt3zdYexxRw7zcB5VXu4jxDMG+S+AV9orl1+cP1gEJlfUvzHZm1tAylwz7w2zhZl4UyF9GnYUeliw5
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 10:16:56.4511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2099286-d8e6-41fd-9317-08dee25a331f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7861
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.66 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40106-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:linux-gpio@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:u.kleine-koenig@baylibre.com,m:dakr@kernel.org,m:bhelgaas@google.com,m:pshete@nvidia.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:from_mime,nvidia.com:email,nvidia.com:mid,Nvidia.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 048C475CE8F

The dap2_din_pv7 and dap2_dout_pw0 pin groups were assigned swapped
primary mux functions: dap2_din_pv7 (data input) was muxed to
I2S2_SDATA_OUT and dap2_dout_pw0 (data output) to I2S2_SDATA_IN. As a
result the I2S2 data-in and data-out signals were routed to the wrong
pins, breaking DAP2 audio.

Correct the functions so dap2_din_pv7 uses I2S2_SDATA_IN and dap2_dout_pw0
uses I2S2_SDATA_OUT. The register offsets and drive-group macros are
already correct and are left unchanged.

Fixes: c98506206912 ("pinctrl: tegra: Add Tegra264 pinmux driver")
Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra264.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra264.c b/drivers/pinctrl/tegra/pinctrl-tegra264.c
index be64fba34dce..3802e480d39e 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra264.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra264.c
@@ -2051,8 +2051,8 @@ static const struct tegra_pingroup tegra264_main_groups[] = {
 	PINGROUP(gen1_i2c_sda_pw3, I2C1_DAT, RSVD1, RSVD2, RSVD3, 0x6018, 0, Y, 5, 7, 6, 8, -1, 10, 11),
 	PINGROUP(dap2_fs_pw1, I2S2_LRCK, RSVD1, RSVD2, RSVD3, 0x6040, 0, Y, 5, 7, 6, 8, -1, 10, 11),
 	PINGROUP(dap2_clk_pv6, I2S2_SCLK, RSVD1, RSVD2, RSVD3, 0x6048, 0, Y, 5, 7, 6, 8, -1, 10, 11),
-	PINGROUP(dap2_din_pv7, I2S2_SDATA_OUT, RSVD1, RSVD2, RSVD3, 0x6050, 0, Y, 5, 7, 6, 8, -1, 10, 11),
-	PINGROUP(dap2_dout_pw0, I2S2_SDATA_IN, RSVD1, RSVD2, RSVD3, 0x6058, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(dap2_din_pv7, I2S2_SDATA_IN, RSVD1, RSVD2, RSVD3, 0x6050, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(dap2_dout_pw0, I2S2_SDATA_OUT, RSVD1, RSVD2, RSVD3, 0x6058, 0, Y, 5, 7, 6, 8, -1, 10, 11),
 	PINGROUP(pwm10_pv1, GP_PWM10, SDMMC1_CD, I2S7_LRCK, RSVD3, 0x6060, 0, Y, 5, 7, 6, 8, -1, 10, 11),
 	PINGROUP(soc_gpio170_pu0, RSVD0, I2S7_SDATA_IN, CCLA_LA_TRIGGER_MUX, RSVD3, 0x6068, 0, Y, 5, 7, 6, 8, -1, 10, 11),
 	PINGROUP(soc_gpio171_pu1, RSVD0, SPI4_SCK, RSVD2, RSVD3, 0x6070, 0, Y, 5, 7, 6, 8, -1, 10, 11),
-- 
2.17.1


