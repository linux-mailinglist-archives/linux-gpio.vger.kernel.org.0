Return-Path: <linux-gpio+bounces-35567-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Mw9KSxo72lZBAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35567-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 15:44:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5600A473A7B
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 15:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2EA0A3029A44
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 13:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D531C3CCFCC;
	Mon, 27 Apr 2026 13:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sL/03Ac3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011004.outbound.protection.outlook.com [40.93.194.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE933C8716;
	Mon, 27 Apr 2026 13:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777297401; cv=fail; b=sNWNED+LDLAOa5oR+4loVnfU4aVJGEB9J8z+2DoaKrSK5xp88hsYHDJCf6iQKNrtphjh1ylFoDQ0gR7/iILxl5w3loSyIylwnpxNbtam3XZckdlGj7u3oNlg+tlTq9YpL6hzMy5Jj6RhpmmI3vfp/7JU8wHkRfl6AtCC9FuZG5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777297401; c=relaxed/simple;
	bh=BAC7oDy7BhoDrT+a5d9MXp+RNcI5Smff5LnlGV0jJ9M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KAv6Xo+HmyaY5DWeC5EOJrC0HiFtfO2hihNDY07AlwL2q+kLCKaFsQF35aue3p7Ar9G/NopetdmJ+CBbzrYujnTuNGK7HhmHT1vj2gYmbv6b0M0hIkmWfsgPzNGGImdxeQFJdIgP2KBWKmdoQjmus5lWoj6y0x1N0anMvrEZtmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sL/03Ac3; arc=fail smtp.client-ip=40.93.194.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qVNZ0MVG51jJzuQ6byQCfzd+wALexO/0R7D/qJ8r4J3S2XgWWc5xF3k0ZUAEtzPvuNuP8EoYUmJ6BrUgc0AgsYVxlKk6UUL+WcgHI3Rc+6u6tb7pHtdtd2q1Dt8/8azeXXNGTSQZyonj5pL5Tl5lhW7Qn6Knf2aCWnDNnSrAM0+GH/LaEaTey4L6nxzVgVF4irCe+Z/dXbPxaxHbw87uuVwKQqzVpZUsO9hEkGrgIE5uqOEPZ2mZHY05XWGE16NENkFJ5Mg/Abor7s3fbzUmY1mKHCH5x1UDdL2N3wfh0CYvSy4bqNIl1SWolkMsZTFZ5FJuI/RMOuE/87a9XsQ7Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrfkIeO1moWbYcljfcj0YmUOFZAqkfQdKiEWXvHD36w=;
 b=jcwunqYnO/GmPrTJZwoDchcxDeWkQ9ecBzz+HkQarS4a3RAHJxk7LRQY4krljWKsssVs5wmysHkS4GkTZ4bCSC03FsKpgEUV2L4TOLiHy9O/vaJYGZGR78FQ8Pab+qAk+rKD2aO5SYJ1xBw5XzD+2W30ByH24ye2BUzj++4Uy4kQB6JREFpmF5xN2CWm6faWGeg7OJEizMNUDiPLEMowFpNQVn1dokqyPYZbAB3+liR7fZHwrtNIDnrYNDTQ6OOeHW2umW3Jxp7L8Hd/x7ER2ZYbyY4VB4iZXoWLd08v7EpancGhFwQ+ekGYo0ZZz8ZUfjP2EG7jm7MtwVlhyl0E9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrfkIeO1moWbYcljfcj0YmUOFZAqkfQdKiEWXvHD36w=;
 b=sL/03Ac3DAG1zCVI8uZkYG039z4DN0GXS1D92ZVtGDI4EFiGyL24ac0iz79xj/PFYFHVigvxMLyg7X6XGzXG5o3liKheTRGTD9uDvAeHBm0Fw22Vf2dod1Da4IgNHkOaQP9O/D1jP5ZqMf5jhTuA7fxNj6YALJlauNRRwblFfN0qWovoZ2XeZs4uQaFtt+mbtDueyK5XM0z8M+x3XUsJcJa2mC7eCUbBTfEPehVQSDpnKLPd1ROJpNsP4jxbMrU8P0VQeAqqPv21cSau0eR5klyFfewlUJzedm7mpOMVN2id1+gQZZpkCdSJ+yAQ4tQ4MKeA55Ed5gwZSQ2AA2aNXw==
Received: from SJ0PR03CA0167.namprd03.prod.outlook.com (2603:10b6:a03:338::22)
 by SA0PR12MB4448.namprd12.prod.outlook.com (2603:10b6:806:94::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 13:43:15 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:a03:338:cafe::9b) by SJ0PR03CA0167.outlook.office365.com
 (2603:10b6:a03:338::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 13:43:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 13:43:15 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Apr
 2026 06:42:51 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Apr
 2026 06:42:50 -0700
Received: from build-pshete-noble-20260401.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 27 Apr 2026 06:42:47 -0700
From: <pshete@nvidia.com>
To: <linusw@kernel.org>, <thierry.reding@kernel.org>, <pshete@nvidia.com>,
	<jonathanh@nvidia.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <webgeek1234@gmail.com>, <rosenp@gmail.com>,
	<linux-tegra@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/6] pinctrl: tegra: Export tegra_pinctrl_probe()
Date: Mon, 27 Apr 2026 13:42:26 +0000
Message-ID: <20260427134231.531222-2-pshete@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|SA0PR12MB4448:EE_
X-MS-Office365-Filtering-Correlation-Id: c7436681-cada-4a36-b5b4-08dea462eeb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kEmrlrn6qvGwCRo763W5QLtGvioUWTyOkAGHtntHnuzZhdecnfB+dxD4Ic3OCR5ZJ55SnO+l+E2630TdMxuWffLLiw4DXY5pfKJphxoZ8jRj0nPptHqHVS3A1m7rp3ozQll60hUbj0HwbkwFVaYORK2ORR54Mq+R/I1zTn8c5tv88CxY8zqPJGljd/m77pI5lSxPgKq08gkh26cPV5beOv1RBXyQxypm1FUYfOUOg7I0vaT4nCzfpP+j+cKhMeyEqgyR7n+SkvVUDsZj3KHtZhRdTcdbzYP3W+uQfzjgegpuXyv/pVSgZoQJHxlg4CII93oFUaPrvni8/2nRNBcHesL4QBVKtVmWAiCGbOObIxWusKdzWjVGrErIUmQUtGykD0DUzjK4WhxvWCA6npK4l9N8/hMvGwUHZQIvnN8NHckLh8sT2j2N3aOSxBC97dLQKwLMIU50Rmf0d9QoeJrgTXQ7n582nfAcA2mwzsf/ik/pRPpXKidTvKh7V879Rza2M6E0HcOdnIBTtT6RHKcqGByeUP96Stk+TdqU0jdMnUkSITG4eFUtnDR0ZFI4ab45S+8SZcDYl7jbWApuohMajeiHXRvBB86hKpP55J0VJQdU5vUt6nflFty3BaruLsdVxzTHQKrWLwmpGxdn33ZddcncDUEX9lIopmZ89CkMIuWrGCoBBv8pTtAmJSbgG1UjR6otLsBjK9BnSNF/fsbZketfOF170Nj8iOePyYZereu21sfdtpQn45x3rFu17lIa+BG9Qdj38wrQ4Wu8hfCysQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Cr6i5ZpkNTBHXUFHN0ySefYHeDbhsWLy8HelHQUXTx32VLp7g7CDcHoIsoGPaFeOoIBTEeVTYpdSyH17qEMRLs6ZdTOUfk5zmUdTJUSFmCzhQ1lXtB5luB7YH9AJR1uah2M5pd9femP3j2V9vuZBulNA8T/Z7uP//Z8lWN9YPF3SaFCkT6oadL3ewVf8kafW9cN2UXKgaUFiJP31lqAcBTteSiLOrzNYS+ePPY0q6slDQyX5WBZRusL+gYGvlsioJ2fZLAsKuoQkNbPWk5z4q6XS6i9oCNYgv+k5mnF5jdLB8V8r4V8K3ehC41How85JbObR5NurX0TMfmL47tR7zbPthlaNS/6o8uspM7EN895S8vMyrPi5P9BYYk4DlOpHokOz0NfldWytEw+mf/rYPEYMdL5Ozr5j3JpN6kF04YlteXoAXHR+s9vWhXhl8hPm
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 13:43:15.0477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7436681-cada-4a36-b5b4-08dea462eeb6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4448
X-Rspamd-Queue-Id: 5600A473A7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35567-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:mid,nvidia.com:email];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]

From: Prathamesh Shete <pshete@nvidia.com>

Export tegra_pinctrl_probe() to allow SoC-specific Tegra pinctrl drivers
built as modules to use the common probe path.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
Changes in v3:
  - Wrap commit message to 75 chars per line (v2 was too short).
Changes in v2:
  - No Change
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


