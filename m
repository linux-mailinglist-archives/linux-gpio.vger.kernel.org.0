Return-Path: <linux-gpio+bounces-34941-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHCpNn2m12lfQwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34941-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 15:15:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A2C3CAEA0
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 15:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 47734300AB3A
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 13:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC95B3D170D;
	Thu,  9 Apr 2026 13:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PBFD0DCU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013051.outbound.protection.outlook.com [40.93.196.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB703D16FD;
	Thu,  9 Apr 2026 13:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775740465; cv=fail; b=YuNUbAXazcTB0OUlf0M9DheDRb4G7U8KLmMiqlnTaPCG2/ERFjUM4RF3odZiEvOi+hbI58rRQrZXzdzvglC3x9lC6J0tiJPEnVzq05+Nu3w8w7dOP6PlS3K1QynMd7yNlg25mkwmh2OLCesYDBveG8Eosh18vMbFf+aWKwXMJVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775740465; c=relaxed/simple;
	bh=7fDDfaHTUTNwnaoo0+Q9fu7Jv1BiKtbL5LMW6Aud4Ms=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LLqvcBmWzV9eS/eGs5bV/BuZRO+bQeH4v2HrDQ5/Q1ZSS1nn/4YuEKo9qnPTvDnCRHKwRGcmaSebT7t4JdMXS57xJylA3DL5An9BXsq5TuWnR7U1DRyddwv6TtFWIOUobIZOPIi6gTNTJQzKPfRuZ1Vti3yYURkJ23l5xzoBTuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PBFD0DCU; arc=fail smtp.client-ip=40.93.196.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHS6KkgweaIUis0oI3XXJ979qOKgxSqC3zzh4QzA/H9WkTtX0VMBTFpPeO/WS+1ZdT9Wp78f1A3Zcp5tZ0tmJP05ntPYCatBM/oeDuUEZZ/myxBxr1u/gxOZtNkdijTt9E2u/n65MKewM3eT2/HhseYAYwy9b9awTGgPUud5GrsG9t4bF5PIwAPpnjMeuXCym5SLRiS26EvhSptk5VmrUEBLumHeTDFxedNpA0MuA2VcUakxCdtdTc7GYmKTH0Z5QSpnBNagFfjBSADzwpcGtpbdzot1kfPH8bqml385HJ9hLokFMihfhsK+DkB9ENgyHalkME4Gz6D2Jqr3FSiN0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BcDM9yMNfYyoB4org0Id1z7zLSt3IXkIA0IMYvr/xmE=;
 b=c7l6B1HMhCf2vA0RBk8gLfMCsfrQDF1ez5fXNWUa0CA8VO/5zwZfda39i/5C17IoX5JJxFAg6wcdneUDvzJ4BXx8U9NEBLasF1Hr1UqyIsBbSxGOiXAK8ax5O6RomRnNa/B6xGPXhr/27a2uP65uvEpoltbHeAOrNbdh8LBYCZZNL1Hf9LifBYTRjkcK5A7iVFxLt2+jliiI0L3hn2/pa4DCuZpYKzKysXU8Ps7q+9EKk3qkV0xD2+JmCNZs2K5LSaVO4xUUvtvmnv/l1gaTz+YNEaG+Crsr192w+8HSG1vIKaWL25anoKFB82tbGTEoNZi3PDmUt7vmGM7pfxar0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcDM9yMNfYyoB4org0Id1z7zLSt3IXkIA0IMYvr/xmE=;
 b=PBFD0DCUlo9KiQxxMESsuGoWn3owExbEJj4+WXc7z+VYB7xl41ELCG+U0KtQIJgg8SsumW/eMfV8VWS45GNHrFbO6bbdkYVBJs5EBXGoxVqIfCAjRqmexxgHlRD1pEeOnKhBMJfhJM9dy/jrZYlH04cq0vZ/P+3KH4Kwo+AFm6vUL1EFT6rCLItuVKBTWf/MXdQED6JUwpm8WBId4HGRvOf946T1Aybi5D3DNtupPEjiqu830yMydnqezeBQpZRJUr51iHaNv6AtbyMnceWbXiGI4XaHDDBEz+wiROdUf7opynY7f5mVerx5ZnBw25VIrVATucTtkMRUGR2QMTn2aA==
Received: from BL1PR13CA0113.namprd13.prod.outlook.com (2603:10b6:208:2b9::28)
 by LV8PR12MB9418.namprd12.prod.outlook.com (2603:10b6:408:202::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 13:14:16 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:208:2b9:cafe::34) by BL1PR13CA0113.outlook.office365.com
 (2603:10b6:208:2b9::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 13:14:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 13:14:16 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 06:13:56 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 06:13:56 -0700
Received: from build-pshete-noble-20260401.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 9 Apr 2026 06:13:50 -0700
From: <pshete@nvidia.com>
To: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<arnd@arndb.de>, <bjorn.andersson@oss.qualcomm.com>, <conor+dt@kernel.org>,
	<dmitry.baryshkov@oss.qualcomm.com>, <ebiggers@kernel.org>,
	<geert@linux-m68k.org>, <jonathanh@nvidia.com>, <krzk+dt@kernel.org>,
	<kuninori.morimoto.gx@renesas.com>, <linusw@kernel.org>,
	<luca.weiss@fairphone.com>, <michal.simek@amd.com>,
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, <robh@kernel.org>,
	<rosenp@gmail.com>, <sven@kernel.org>, <thierry.reding@kernel.org>,
	<webgeek1234@gmail.com>
CC: <pshete@nvidia.com>
Subject: [PATCH 1/6] pinctrl: tegra: Export tegra_pinctrl_probe()
Date: Thu, 9 Apr 2026 13:13:35 +0000
Message-ID: <20260409131340.168556-2-pshete@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409131340.168556-1-pshete@nvidia.com>
References: <20260409131340.168556-1-pshete@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|LV8PR12MB9418:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d05e739-afde-4894-2698-08de9639e717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|82310400026|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	iITYczk1hCLNJ5BmCaQCs0hAwV1h3KpsJQExcMbEJpKVxnkSOuARLYNRpYb7O8S974GeKu/sAHixb6ySFyDXbZDYYZRF0rGVq8FUZ7ZNzyG+CaZMhJF6AfCIMveh/y8L77M+W7jUMQRB7tavO9X7WCtuNi/6/5JlXP6MEXgGSr8T/CHyf5YqRMxGYhZXgJebW4CecfJZhxu0L+5fGxCk+93zn0DSReD2qiaef68YgEez9qqSsQpuc8JgAlwl0RyLsfnbQaGIzrYlyN7TAALZ/34ChrW/tKQXmDVsADagfazkxsKS6RW2SS5jrjrG2kK6QpljMWArBfcj+YPaQvuzb1KNzChuihZB7bBZwG2EcKzl7LiaztItuzzvwqUefFJ4II+bWhD9blfbUGQyae+12wjemuYlkLpQEvqx9L8bOHkURf53NSnkVoYCnSYgbTwAxTu2m0MIONDn9bK1LYhqrqRiqXP7LAeRnx4wUb9CUz5E3j0Yz8j9Pee2z950oCVOnCnz4oePxC8nDoXHmPrpoQbgJhNM3JmAmNVSfSh9dxw+h8eiRJOjYnySdMvBKYEfPqr2O6gBMHEPVAVUiouXrSw6qZ1pVQF0LOpK0yjiz93ctsGWPwba+4+NSa15TqQGH6ogQkn84l7wnBxpL8xb5Tt/2n3i50AFP9Cx0rwNphz9euWGlr/Ld9/L2vYg3AM/USeEBqExfyT8QzLSUgce5S9zat7F/bnZJimeVDKaIEAt+PRry13fg+OuovjU4vN+zV06xsMUKCfLPqFZDGYoJwFehNLQXG+WoozJVChf9PouynvB5MHn0J1AaVM+OcOP
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(82310400026)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/j8vip4OisDL2ZBw8CCmSn00JUfabFK61Q8YDPbqTnarPujC/f5H8iQP0d2ixhvZAmqjvdTC7jNvOf3ZSjyDI+2R763cVN+ngQEsHm8Eifo6RkiE8pVWFLrkVzPt+ASrFX4ELPIlqxfFBIB0rViyOMt7nx3UbEWbini0qddnrCmTJqfJUuH+Z2WPBEEQi/u2ymK9H57FGwvU3oxN7GZUnsRr93v0R/TKW/DYYZ8QR6RNpE3gR+H593Ri1sBN1xNbPUWw3TUT0d8NRrWLySphhwZzWq464TG8EmVzdRrLLYSgGBD3tzFq96xHlAkAf+3lL9s+4PURvJYKnzcj0wuxOFlS4WD/AdzjVXEykeeXZ3bGSBpshOqeJsXizlr4GQXvoOGFLoqyDOV2bbuQEWctWPhoRBFhEHH68NS3D2YTA04onVd49LHznX1ILurYeOsX
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 13:14:16.5440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d05e739-afde-4894-2698-08de9639e717
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9418
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34941-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,arndb.de,oss.qualcomm.com,kernel.org,linux-m68k.org,nvidia.com,renesas.com,fairphone.com,amd.com,bp.renesas.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 78A2C3CAEA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Prathamesh Shete <pshete@nvidia.com>

Export tegra_pinctrl_probe() to allow SoC-specific Tegra pinctrl
drivers built as modules to use the common probe path.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index bac2adeb5c63..3f58f7db525f 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -13,6 +13,7 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
@@ -936,3 +937,4 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(tegra_pinctrl_probe);
-- 
2.43.0


