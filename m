Return-Path: <linux-gpio+bounces-35254-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yK+wNvH75Wm/pwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35254-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 12:12:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 876244293BE
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 12:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD69F30C4650
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 10:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F27A3939D7;
	Mon, 20 Apr 2026 10:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BPxMCc10"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010009.outbound.protection.outlook.com [52.101.201.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE9838F950;
	Mon, 20 Apr 2026 10:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776679646; cv=fail; b=ms4x0NlHwO0NewoKiSH8R55JbFs56FTKj/yGunCwMJq5LhNLSAIKBCbm2+SZDDZKDPyVDXsXkSOJFWSQlInCKZHLhk7pgwW3IUmqfEP7tTNgyih45umqYYimUC9lsexBf+visbZWuwV7kOLrLfJbEcW2uQP3YXt2jLK2uYscEX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776679646; c=relaxed/simple;
	bh=NL5CAAlheZDpxi9kS6gzYv2Alrt+U4OAx5Iodcqrom8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qX9TNTtbuYje2yebsm/h0YHwb18JS7w1qidNivkb9k4Cgsbb2Td+8bps4NzRXQc2qsK2RrsDc/N1smWVOU7LWELjTcWN8+hdf44UV/zNkepDe/6WK6miJtkNFHpUbHmXgKEqSgI5RwZKcmvsBsTuTaCTDXegJZ7w8rVXSCoSpoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BPxMCc10; arc=fail smtp.client-ip=52.101.201.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cu+kusT0H4nVdSafLXOFKpaFsKHP5eptr6pzD2DZZ9lnVLBCKRtk+gZHs5kCe+xx29p56aTcRBLCpHuOpZkt1H6AIxBmz9//oqhzqIQEYhc8AahpECHNABI7hqg+IueratCigBm+vwrzGvBokf4qc2cgN/6xk799GRpKsaiF/pgcIr8mzHVgPkd3FSjmVEnkMH1wge3HRTdfa8+puK47ACpbqs1ILwYPzZPIhyejegYueH4pvbxKku1M9MdMni134sQuIovKkz1thfO3VbYHBtKlwi7SgEKZmAxD47Kg1YmXtLKhthzgqfwoDldZHeqrK5JksEoNDtXDBw+h4ZJd2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzjXhYIQpHl4BNstqBO3VIPh/Bk0ZM26fnJKxZxVxfw=;
 b=O9ASiNvC1GLYy4oxG6WQnHnhgNAvztqxqsSTLrlY31+EDRg0djiM3GRnykbjsxcU3MHL2Qgc4I/HS3jcBmTUyGKNdDPeTWHSo9+3gWokoWiGlGboSpKaEGBpPIj9uyQ78ieb6M5xPRxeXSnc8TVKh+4AhHgDUxcVaOk4VoeEO9Gj21Y/3K+Ukzscl16oYyRlqBUswZnnVD5lDnrvWlZhtsmgA/PUZbFwxmHhNT+pS4AMvhxHelTs4DDrn0nE9f0PR+8tGUz0qcdhjbV2exAMok/FDJqHoFzZuNcISvewpxIb0dDn9DMKBQIqqpv4JrC7W7e/Y+pY4PfaSBYgqdIlLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzjXhYIQpHl4BNstqBO3VIPh/Bk0ZM26fnJKxZxVxfw=;
 b=BPxMCc10xhYO7ArUE9vo6/L3og4W5ZUce2v6kiJbJxYYk+JKGABmeQDNZvoq0XZJX531yx8ix0bOQFfhx2woaHOcSHeQCeIE2aZBb+EALxltlAeoymfsQP5NO48nOTbtaM7jAoo3v1PfUpNacV25MHLhQJ6VXjlS+Re7pF6kzLU6wdarVdp+rctoMGr/ru7aE+CTNWHJTJJiE122nPLeaCkeMAF/WT9igP5Fi6uDzKU3DeRJ/y3zHbbxzYwJBOK+h82CfibCwYKcL13WDlJ312UX807mKFC8tsnNxoua/eZB3uCSPrhauH4MbAGzlHVsWITFNkYxmNTpTAnED6af/w==
Received: from BL1PR13CA0402.namprd13.prod.outlook.com (2603:10b6:208:2c2::17)
 by DS0PR12MB7583.namprd12.prod.outlook.com (2603:10b6:8:13f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 10:07:19 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::74) by BL1PR13CA0402.outlook.office365.com
 (2603:10b6:208:2c2::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 10:07:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 10:07:19 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Apr
 2026 03:07:06 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Apr
 2026 03:07:05 -0700
Received: from build-pshete-noble-20260401.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 20 Apr 2026 03:07:02 -0700
From: <pshete@nvidia.com>
To: <linusw@kernel.org>, <thierry.reding@kernel.org>
CC: <pshete@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <webgeek1234@gmail.com>,
	<rosenp@gmail.com>, <linux-tegra@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: tegra: Add pinctrl nodes for Tegra264
Date: Mon, 20 Apr 2026 10:06:01 +0000
Message-ID: <20260420100601.343707-7-pshete@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420100601.343707-1-pshete@nvidia.com>
References: <20260409131340.168556-1-pshete@nvidia.com>
 <20260420100601.343707-1-pshete@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|DS0PR12MB7583:EE_
X-MS-Office365-Filtering-Correlation-Id: 5da1e0d4-5ec6-41b4-72b4-08de9ec49b99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|7416014|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3OBB8AW2UHB2+TA1VFqkzCqOHmEiX4IRshZHreM9p4+4Zi3XU1kRPLL/bxnHIbONwTEtRk2jvxwZLYAgle6MximPJd7oI4bVx4pWCnMrS5dJiZstKgaOsDIWG7bdt5J2N8jhRuvijzWBc+/2djz7p3he2MiMChDjI26u6S8DAuRf6vfUEQYVI1Z7ZgUUOvph8IX5SzjnLyopreEmKFSr3gimpDs2h8p8FLTMSg25f2Bgls7lZglr1vl35JSED63+EeD46DR06pRzPRjcjMy8/ucJVWpkNXSuW02Km6pLJuzVgdJKq+RyN5bhm3qJjvJrLhNmdthGfIfWtjEFHQYzeUIbAmdzt+v1p2PlUsvFTkoL6UO7fyd23Zqknoe/JtQJwhianx1EhLLQFzYEUjzSN/MjyOJfmU2D7wmDeu4I+ULmUsGKZVexuk/WZXpc58GWncSrudzZ67ZdN3eWChfvlwlFW0KSu7jRoGBxZBqbdo/7Lh02e2cJe/Tm7SFJJlCZ+1XkS6Mpvqcac4SeE5RB1Is7h5zY/ySmu14seA8zRrd871N9NlBYnu5J8iGWl7du8bWGc41fF85V6XMurLPyPBUSZdNbL4DNVHiNbZIIFO0CvnsIdSH0d9pITQ2j97qxKmi8lJOHUqr1tKYldDIMqpQN4HdQpJWjt/pPCp6dX6AlgPpLNbDehKapfhSzs/bAQ5aL/RLXX8sMJ+MkPqrUEne+zOiNd1WKB3c8r36Up6efZv8vOciX3eKElZDmeRmGSjBYqgX0UnZmoAo/9PT+tQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/Kz53MlooQ93w9HpyPpVVgQsdzRYP2QCfYgEfy8dGoaXX5nkcN27AWageB7dJyjzr0wNwHCfecDgnXvfZeYyGD9Ss9Z+ksy3K6JEoaFbaTnPH+PAzESHWS0iGPv/X6xpCgZKS3GugnqjPfl9j/fDtb5pJt8HFIHsDf0OTerjn2Z7vDtAcRDUlr5Nhh0E0JOF9zt5r05hiVYWF63uFzNW2NCsi2Gyw7Oduymhw5fx/8it1l7ar0Bu2kJIXB5emmF4YKi/0v/kwcKW62w02v84oz167Rhp/Q3NPLA8vqwg9Ufw/omhyg1cZKxaz3sQmsISLdRvPYXvb7xDPpryHx0FcpA37vWIcQRxDM9o3DN2XY0RvAKYMlor806tPNNZhtfc+j7HlApIQUj4Zqrl7v2CZlU7oghnbZKRLAt302drWhZraeUQgs7lnKB+EsOv2S0/
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 10:07:19.2514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da1e0d4-5ec6-41b4-72b4-08de9ec49b99
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7583
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35254-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,a800000000:email,0.126.165.224:email,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,c7a2000:email,82e0000:email,c281000:email,c410000:email];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 876244293BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Prathamesh Shete <pshete@nvidia.com>

Add the three pin controller (MAIN, UPHY, AON) device tree
nodes found on Tegra264.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
Changes in v2:
  - Replaces the v1 "arm64: defconfig: make Tegra238 and Tegra264
    Pinctrl ..." patch (now unnecessary thanks to the 'default m if
    ARCH_TEGRA_{238,264}_SOC' Kconfig change) by adding the three pin
    controller nodes (pinmux, pinmux_aon, pinmux_uphy) to
    tegra264.dtsi.
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


