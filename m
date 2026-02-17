Return-Path: <linux-gpio+bounces-31734-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GC87FI4jlGnXAAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31734-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 09:15:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7D8149CD5
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 09:15:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2CFB7301A2BD
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 08:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C922B2E040E;
	Tue, 17 Feb 2026 08:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IH+MtlfN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012011.outbound.protection.outlook.com [40.107.200.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BD02DC34E;
	Tue, 17 Feb 2026 08:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771316104; cv=fail; b=VDMwbPk3zhOxWdE7RMuucBmazJ2uqZ6VLkT8lPJWdayXHjK0OLlIiYOOtBVZnnTb2twWL9lLqXTBUAvuZVUEk7ORVafGJVa9kCyA1LutBknFB1zN80FPVnKfkzOVNioSa/tDSWMZ84sNPuuUSjLQyr4xaQ9IfUdFy/x7iXpuGug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771316104; c=relaxed/simple;
	bh=eMmBnT9qBoMICUWyU5Y035qHc4zAw+k6xtue64XX5Yg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qq6C9ZeyGdjMp3jwinMhOwcp9JDEbyWZOZK2YfG+7GvU4446scIUvHHcaVltoJ0yA53UA8cIAsuolE2ESrrLI9FPCVvqnAfS8vSgHGd998oGiGDFKR1gZTz9r1Z8qaxfqxypUr6Cg22fUfU8vLkihPjSJIBkDT71TjIoroIH1MQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IH+MtlfN; arc=fail smtp.client-ip=40.107.200.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wp9WXJAvhFWMe/lcjk+IGMFUcEpmoOJ3SXUqEmX1zkX6STUBNSOdSKgjnTYViZ4ORmhFk5gxDLghEEIBGTfKfa5NqvI8+z8qJywl+gNqxqRH91+thDOaVKF0sczS/50Uyt6fDgebVVXHxWYypsHkBSepJX0+MB/BVWj0QY4Jn+MyBwCaCBT7BbEWbUx69fOVvGWb6hCiVJcFDPUtTRsFURZ/tfdHTx+U8IRWifbrUUv6e5lgRpGjHgXMrQ+WmAef8jiPxMsUR11ffNF7mZH1UmCc27LLBQUgxZx4e7e8znAF6Pnqn2Nd6d12wtV6pAA1sN7zNCmeAPLkDujZOuTEsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgODC26r3p8oD+ln9/FdXpTiyTy2cnuuAaAqGr0eavI=;
 b=GVOSrxw03yiJq3WBNxL069qyOABeUw3YywjFCt48uyo8YWaSZo4cKNzIeSBEPxuAH5P9c91wu2Sr/g8LgXNGhXAHxBL3mc8PWKPAp+HzHxFF+rOS/mfiT9CjFVKB008uUtusugL10KNQierZuY8hxhaPa2JUoGcGphQdSFp5b8PUAn8rORTm2dAKDaKZBNSG5QaCbbmHKWSc9wj1Shu3UEa5xxRUprOuKCnvXtIX9jWetf4HpLAOBqQLsciPhwTl80onb9Dk58NuxEYW2WwEJSmEnHz+w9jkPSj3SCm/4eZMSnAED+RlqP8d/rEoeJzbBgyj2kcVf7CVRsDac1aegg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AgODC26r3p8oD+ln9/FdXpTiyTy2cnuuAaAqGr0eavI=;
 b=IH+MtlfNwAwm5SGm15qTY7KkAVotAlkiDPr9u6SzHfvnUnZFZfi2xKsIKEmvWUtZ3XYcz2xDmUhUBTHNw8rELXmg291voaOsfitZGJ+BG47UZ3Viqj7h4KVRm1oUn/eqQSiTADZ365zCU3vYPYXtoQjsnu80kuwbSQHsArpyrXuMM3UMybbGfSQKg8oqHgcXCfBFISVlEKecIQzOCdpc0PtJRKOAIGt/Wn5ucLV5VI4YP35SYBLpz2jjiPOZ/DSZChD5IXe77MVAPjDRVNHKPDRPmWJaqQo+jsqF2yj6UlcsVBy8/iVvDzjTQlcEMSMf7hX25CrnEr7o0z4HjzEm1w==
Received: from CH3P221CA0022.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::12)
 by SA0PR12MB4365.namprd12.prod.outlook.com (2603:10b6:806:96::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 08:14:59 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::98) by CH3P221CA0022.outlook.office365.com
 (2603:10b6:610:1e7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend
 Transport; Tue, 17 Feb 2026 08:14:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 08:14:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 00:14:43 -0800
Received: from localhost (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 00:14:42 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <linux-gpio@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH v2 1/2] gpio: tegra186: Simplify GPIO line name prefix handling
Date: Tue, 17 Feb 2026 08:14:30 +0000
Message-ID: <20260217081431.1208351-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|SA0PR12MB4365:EE_
X-MS-Office365-Filtering-Correlation-Id: b0bb0745-a8fb-4c00-b025-08de6dfca4a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xbwCjXSI2wFYQ6oWRTs2veV9qbvkUs+BIjWOmv8rp+/TYfzHcqF2HpUkaNY0?=
 =?us-ascii?Q?DrLzCS2ByocWfQtdE5OFX/SMKQ27fCWzGDpXXSgQMMMQi/CIY7g2uTnttJRV?=
 =?us-ascii?Q?rQdM/0ttsOD9HE2+d6JKHKE7B31S6YsxvZTiUJKQ+C0BordbEO91lexRVeFI?=
 =?us-ascii?Q?nvdsEV3Oc1BYc9CnqiPntPNXU/enToi5pfi0i47b3v8jPFlLFv0FVS9KXq3C?=
 =?us-ascii?Q?7TCiKworvWt4Z8YeDUPbKlwysquxa2v/29ahjx4/XFWEEN2lA/YVLkFTaIbE?=
 =?us-ascii?Q?tQqicXrZ5GfJaiLHLtKOtcbOhO31VQbHBmB66h0JM623+Aymgq98kxeJ8RrJ?=
 =?us-ascii?Q?SSgx7LE2xOqIn9M4pcchWZ0zDs0iX1qHZd7WG2UVHpSkXJMNU0yotldUvIvQ?=
 =?us-ascii?Q?wFr0H4RzWI5iXaSeTzaGUG1ql2sekSSIsEkDpN80zQIM1N5nvBTQJQnOc5oQ?=
 =?us-ascii?Q?n28076UH2mtqJMYZF8Il2iTPmQJPqO40VRb3UsVYYn63T/dsPoT9u//KvvOJ?=
 =?us-ascii?Q?2PfpaG4abSRQfOmaiS3StAPxVFJznrEo5czO34gfYayUn9w+HhGuzDABIURs?=
 =?us-ascii?Q?IkB8FwPLBJ42aZKyYw+ygT8TXSg6ao3gofXgZtnB25h+VdOQDqTPD/HsLnr3?=
 =?us-ascii?Q?EKAkfKPnrhSgQ3nkxSV+LrIhu/foDhQXxkP27DsoAd+nOuIir0vPI1a9/MpR?=
 =?us-ascii?Q?QiX8o7jyAwPSNfatmZkxFLUz6+8mJM6i+Iy8ISwVgdKWEeqV/lO/0SvCYYNl?=
 =?us-ascii?Q?uoXZKJzUXs88zqtcm/EbSbGQ9By2qszsfI2BSgoDpPMMIJt5fYMQf8QCmOvb?=
 =?us-ascii?Q?axKk6IYAADsxqMeumJI3C5rysFpyVNPDzMaw7UPu/r8Xm3XNxKHzeJqGWJZs?=
 =?us-ascii?Q?u6CZ5cQTtB0wzs9Wrf4yFDJQnlgt/kBmIAqwkGCTuyE0DL2xTJPEI66AyP1e?=
 =?us-ascii?Q?6qsHOR+u/6lxQQH1LJNrnPu2EydBcav1UwZ8OWl2MauGf1gPfWkdDuycElxy?=
 =?us-ascii?Q?dd8v5TVEIvHjUb+oiirwC77Rti30VeI7Ywm+omUressHhLDEcKSJybgHTglj?=
 =?us-ascii?Q?5PKDmg08WSldf8VahykZHUpf5ZqGPQ787eZ4LVVjPBVvTcWKOzAHLagdlMUP?=
 =?us-ascii?Q?DIakJhHO6YlB/pYhm0o7h2mZDxtFzr6O17qrCY5vQBpCD94wwaIKp1tg2Wdm?=
 =?us-ascii?Q?Xs3CSBggHrOKPmFbQcV7s4K75mbEzce19Q6mHMbnrLkAhbjUYN3koUjyZamC?=
 =?us-ascii?Q?o7nQAiSwrh4/O4NiBAz/Edj1yCnDzLq+EPSRKhFpiU+IjSLjhYbevRWAAlWR?=
 =?us-ascii?Q?f4XsgxxZ/11IgVSjGeFUX1hqksjXaVKzPPhzrhc56Fmo17VJVe0ucgdf2wD5?=
 =?us-ascii?Q?WgR+DcxYNrJcmWQEuIHa5WYM8a2M+wg7rc4SZUhF1RUMdT+NJbdVD4Vk1xSa?=
 =?us-ascii?Q?MlDsoKhbw7UrcE3ubvyZ1vNuZ1SfwR7Mc+UQ3esnI0Bitol8ywh8W1au33ZY?=
 =?us-ascii?Q?8/X3ZKVGzDdN02t6Zjm/kPyX2zc1+TPwCRyA2q5+hXmEgC99jeCDW+C285or?=
 =?us-ascii?Q?IVUZJmtrwjVcP8rHM612c+9ucI+9AP+2vIxsRoaUYYlNa3FRxU/Q5IHVtPun?=
 =?us-ascii?Q?5twv8MEdFMmhSo3pM6OoXSU4wF588emD8eXg/9PRNHfRXnr5BEaCaYLClqAh?=
 =?us-ascii?Q?RTx/Hw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	N7C/DWprPfSkUqSnl1XochnwqKB7apvB9IgHIz3KlYEcsVSQY/94vnGP2UoBaRFg8iYxf79tOpGV0WNcjM4eDl+j6UG6J8Pmgbl6wqvsT1W9+Ldb5Hx3l4qbKFjxbEIoQBt78x2P4IgtZaOGAhrmG9+elrPCNOBUPoZ23mpuf/1kEXaPbvM5nTvNXv3cU0X5sGZmSa5dPklPscCGVfWfbFVRwk4w/iOE+JW8ellfANNL7cDw55oYiBk+97y6SdahR/kWpi74p36kKsQwc2m6H6RzcVFs4vCTXzgTguF1rgq4dw2OSc2PmFB+soo2FystYFLYDHESH5VeE3CcYbmVvdzNguubdHb7sPWCUrXpvBVF6xQfrdZgt38iIAC9xyS+IKI98TyK41rdNI5L2C3qoeO4c6BARKS+KjCtGnO+1duV9Z6dLmGDqvEXwHaDwfub
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 08:14:59.2943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0bb0745-a8fb-4c00-b025-08de6dfca4a1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4365
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31734-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:mid,nvidia.com:email];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BF7D8149CD5
X-Rspamd-Action: no action

Introduce TEGRA_GPIO_PREFIX() to define the Tegra SoC GPIO name
prefix in one place. Use it for the Tegra410 COMPUTE and SYSTEM
controllers so the prefix is "COMPUTE-" and "SYSTEM-" respectively.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
Changes in v2:
  * Split the v1 patch into two; this one to simplify prefix handling.
---
 drivers/gpio/gpio-tegra186.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 9c874f07be75..f04cc240b5ec 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -942,12 +942,8 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 		char *name;
 
 		for (j = 0; j < port->pins; j++) {
-			if (gpio->soc->prefix)
-				name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "%s-P%s.%02x",
-						      gpio->soc->prefix, port->name, j);
-			else
-				name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "P%s.%02x",
-						      port->name, j);
+			name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "%sP%s.%02x",
+					      gpio->soc->prefix ?: "", port->name, j);
 			if (!name)
 				return -ENOMEM;
 
@@ -1373,6 +1369,9 @@ static const struct tegra_gpio_soc tegra256_main_soc = {
 	.has_vm_support = true,
 };
 
+/* Macro to define GPIO name prefix with separator */
+#define TEGRA_GPIO_PREFIX(_x)	_x "-"
+
 #define TEGRA410_COMPUTE_GPIO_PORT(_name, _bank, _port, _pins)	\
 	TEGRA_GPIO_PORT(TEGRA410_COMPUTE, _name, _bank, _port, _pins)
 
@@ -1388,7 +1387,7 @@ static const struct tegra_gpio_soc tegra410_compute_soc = {
 	.num_ports = ARRAY_SIZE(tegra410_compute_ports),
 	.ports = tegra410_compute_ports,
 	.name = "tegra410-gpio-compute",
-	.prefix = "COMPUTE",
+	.prefix = TEGRA_GPIO_PREFIX("COMPUTE"),
 	.num_irqs_per_bank = 8,
 	.instance = 0,
 };
@@ -1418,7 +1417,7 @@ static const struct tegra_gpio_soc tegra410_system_soc = {
 	.num_ports = ARRAY_SIZE(tegra410_system_ports),
 	.ports = tegra410_system_ports,
 	.name = "tegra410-gpio-system",
-	.prefix = "SYSTEM",
+	.prefix = TEGRA_GPIO_PREFIX("SYSTEM"),
 	.num_irqs_per_bank = 8,
 	.instance = 0,
 };
-- 
2.43.0


