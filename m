Return-Path: <linux-gpio+bounces-35249-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPNiCq765WlwpwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35249-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 12:06:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1CB4292B4
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 12:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8C38303E49B
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 10:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0F539151F;
	Mon, 20 Apr 2026 10:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IwfOaf9+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011054.outbound.protection.outlook.com [52.101.62.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D47E13D539;
	Mon, 20 Apr 2026 10:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776679592; cv=fail; b=obeRxhLX5M/2vGo9UZtdm7WPSjIFO0oMrDfQg3+m/L0ZS/hP+jTec96jqF1z2gzMDZOWx5JWzH/KoB4GB54inVpzs0p1nf0D93vPwBoLE2QhlV+f+g6xK8DpwqbEAXK7OrZ7GBN5YAItH9YMG3NnDrK4EhAuRxGbYkFCF4MHv4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776679592; c=relaxed/simple;
	bh=uQKI3pf2pn8iGpKPyiTI9GexOfcIoP8+3eAk6fYEDaE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IH/g8UtK2uPA4fxAuoUE7YZN5gxoQcVW/9OQZkez1saYIqEnCksMe60aZQM1Yjp8OM9s4qmPvQhFEOSDnx5yYTxdnToihkK5LLziSxEhG43gj1Y264MwXh7YPdPK6+LTMK2evOtvkvWqkgzG2HWnVR5thcCmR8Hr/+G8ZWUNa1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IwfOaf9+; arc=fail smtp.client-ip=52.101.62.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvQ5h+Fkx9AW2qjtHmHlV3E4FBpDelN00PrECt1JjPSzAhxGU/BTy6Uc8NEJBCuOXIk4NYYuG4u+R1vhW7KVR7+1uS+8vVrT4ANh8pVOcPjup0ADRSqwYRTWw+e4bjrsmhY0PJYsybiHpqwpXsQSZucthHzkx/yUoK/Wfh82DoYh04D2VM1e25x45xWv4JR1KztMig4B/lTGARWlmJML0agJAYx9B08i02BRvRGAp+NBQBUyVVk5Y9XUuWH69G/CHTszOitEp5VlhKt1T0/ehYZ12srosY42lKOZC89XbsDaQOxJNJNHJQg+hzODSI9hzqLbnMvxqGvMk7QvX/VmXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gFx8VpLExsshYeXb/Bd+tffp3Bp62ZleLZOIRoW55c=;
 b=alnVX81SJYYoXulFsv99y+yLnVzN3xC3kA+dPS8k8aDAEShY9EePyc6VLzvX7rfh5JzZv4TRTsx9ZK68vLqi9i8xOZJsrcohzrUb1kXUEyYuurSgTqXWBmfGY72BipC1Wh9c367i+wtKACJHOcuRG0ZCJACeiNKtKq+6qoDzyAlOy4RPOz/l7mjBKlDJH3PmpoBc7WML7HrAn25lCoeahO9WwRrtjqPmyoh2CPKkFdUs4lDxYM5WogeAZYc4z6Cs6otb38POPVbP59IXweKCi/E73SQNOTIVOth4rZKCPrl3ecfaIas6fVneskuH9H1zohgA9qNn2caMAfqHeWWOoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gFx8VpLExsshYeXb/Bd+tffp3Bp62ZleLZOIRoW55c=;
 b=IwfOaf9+2VWOsrJol2YzGX0K/vCHZE93/8txzAjx1ty854prEoRlITAtJvHJPE0BxWLIbWbZMUzvYs/2Hvc7lBzXcevZ0b6PHQ+yPL3Dcm6NhfrTInGqc1ynVXA9SjIPf5xpvuVXXg2GbgA/IprkSzlvFf91FsmMRLMy2bwsH+gd4nt+u+rbcYZfpwE4VJDGK8FJ3jbzex6/2ErIeICOtwVcHtMDAQuSKiwtmYYsQ84s5BDPE7MTHeJupf7wzOHjo9nEVqMnYm7fpfFkxw8XWbYJJtP/iyCJCLrKKEG7yJi+HPoKanL6qgw3ssVtGqiD/1/XCUZBIoPqiYxyIBKZ1w==
Received: from MN0PR02CA0012.namprd02.prod.outlook.com (2603:10b6:208:530::9)
 by DS0PR12MB8768.namprd12.prod.outlook.com (2603:10b6:8:14f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.14; Mon, 20 Apr
 2026 10:06:26 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:530:cafe::40) by MN0PR02CA0012.outlook.office365.com
 (2603:10b6:208:530::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 10:06:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 10:06:26 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Apr
 2026 03:06:12 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Apr
 2026 03:06:12 -0700
Received: from build-pshete-noble-20260401.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 20 Apr 2026 03:06:08 -0700
From: <pshete@nvidia.com>
To: <linusw@kernel.org>, <thierry.reding@kernel.org>
CC: <pshete@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <webgeek1234@gmail.com>,
	<rosenp@gmail.com>, <linux-tegra@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/6] pinctrl: tegra: Export tegra_pinctrl_probe()
Date: Mon, 20 Apr 2026 10:05:56 +0000
Message-ID: <20260420100601.343707-2-pshete@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|DS0PR12MB8768:EE_
X-MS-Office365-Filtering-Correlation-Id: 085b6bc9-d3f7-4b76-3aa0-08de9ec47be8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	SD9v3WzS/yqkm97IScpkj6+lX7kyhSkAYYKbsk+LUWEsPOgBHUAvEwAXsZur4Ir9xvL7+udgoDbveRIK8fheTmsTfj0rfo2DjXjw/o3Tx7KzCMYk639PzOqJhfwDJ/B0dKFqVXbJ8FkIJwGuH6PoBuuUSfTehKKK4BXMvaFjg5kSVLAR3b2vC08k2QCZ2ssqo/BlDNhE/Kc2DW/XODwXsVDe99Y8IjNcRmPWr50sCdUODr5UZCjXASkEwEZtsyb2u/YLwOJIIN58UGwYR+Fip4hjhCaAWPcKCBeDtxGoWjlBMFM9i9tuQ0tQM7zoPOQLhfhi7pWhyxa+IhJPhCIa74WdU2+e3c7UQuSqFDHr2rztY/VVb8/cpYJHCDwW1EsHjjAitRHZpmbCc9w0KaWntvvMiZQFezNBbBG4ok+8/EuqpGMoT6atIUHhjLoQo8Jk5qNBc22iyzvI0eAy7xGsk2AJMMcqV38xFuVxNid4lauOy65lCTV+oMOxZLP0rCGTyXS6D5qAWmdVVGK4+CNZAU+eTMcRjozoxWUkN8Ygo78rtKqCfpy178n27egTarNlqmSzh81/QV8Na6S61ExJ0b5FMgETBhzmeJa+FLg2Bfs8LKQauPhERNkkO8ef5KJVnHv2aN7sWfedNUu+nVeTyuOaR2AXHj6t2fUr0ru3nCXSX8jVA5jTfUxd8isTJoM611My7EzkhwiA1kyVMBzgyES2cGUEV3I13q6gGbo0Y1Ii4bbtW5K4hbQHPerGnXoRm8LA8XUpWywz4H/ACTrpTQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j6o5YeSE6Sy0oJRwMatnXl5KFQQ8Prsfn5WvxGiGRB+MkO2zjiG6zI6efF99Oa7neSwsNiBqf/ldKRP/MF6L+wmzEUwXcJjJIIXAHqf0u+DTBKgvt3ZSIBKkqThMgoyo39Psp2fEeAT7hotNScwr7idB/DOlby9nK8wPs8LmWa1gZAaHrEZlznlIaWQpNutFINhPUK3HQZW0Y5r/FiJ/8eS5PkVqacmzpxdP8wnDLDTDmDSx56bh+E5aci9j6DjJKwyqLBhR63wwQ5gdN8pcwpyvm0TCbMjOo35SlWe1ebfy+T49CwQutkpLVlNANGfuf9AVSXkh5YGyMKxGhBurTRP8WpuFlSvWzXiWhw8AG522CgKO5ys1CDXKYWDhQn3HIygGuY48/nDhn9VzIVaHdPgNpR5vMB1tqomSywocem3Da/tnbRhMtSUdBwNWHCg6
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 10:06:26.0971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 085b6bc9-d3f7-4b76-3aa0-08de9ec47be8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8768
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35249-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,Nvidia.com:dkim];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: CB1CB4292B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Prathamesh Shete <pshete@nvidia.com>

Export tegra_pinctrl_probe() to allow SoC-specific Tegra pinctrl
drivers built as modules to use the common probe path.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
Changes in v2:
  No Change
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


