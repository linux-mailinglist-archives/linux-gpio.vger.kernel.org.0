Return-Path: <linux-gpio+bounces-30981-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OduNkVFc2lEuQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30981-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:54:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DC173AEA
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:54:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FA0F3053726
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 09:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF91378807;
	Fri, 23 Jan 2026 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rz6ZU8vR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013008.outbound.protection.outlook.com [40.107.201.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AB732A3FF;
	Fri, 23 Jan 2026 09:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769161908; cv=fail; b=BRJGVf0i0MSuF8PovcGZ3BxBZECDlYemDNMdAlp0ktpvzFexWwiZa8htKbUyFMjTsGlk282mNTyOPaa3wGMiiXyN0gM1X25Ar+2K60ucr3wjRgCERsnKnUWfwTLH/hdeDosMFueKe5UqtmyRr3cfdSNlS+YrfAdDq9onZGd8iH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769161908; c=relaxed/simple;
	bh=JxEBGfjiX9MK5qnjl6K7d5Fi4P0RPk0cU6W+5Im0+PQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uS6oiZJPRyK9ONOQEpUlWvqxB/+UgYTyz6mi8XPjFpuOltMC6pKrudzPyUkR/EB4R+mz1P4d29lfK9T0nXBWn/Dwp/cupG+IYp5pwWTu9whJWItum7yRV0CurRKtR3lgdRb5aX9XbqvRsXsN1mwqAOuKfGPsOvH1k/9ojI7MKbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rz6ZU8vR; arc=fail smtp.client-ip=40.107.201.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzueMzV1Xj+T7P0KR4Lv0AEjVQ3DSOM6qugwbMlWrOJ5sSJhbw5g2i1Zp0O78T67VHCY3AN6HCoDvu7OfqwtfxTQeXSHll9FgaE0ndnZQx59S3CZkJSP4th/Hlj97VYyRlXSl14nOixN9cSHw9sAsnkF5ogu9SSrg9r6oO41BUKzfl/sFlA9TU17RrlFishiWhALd72scVbL2hu2dptPmROeCRUkNRmS/FECMI7RNHPYgbgsdj8sh2rM5CSQG2jHRUEup2fgpkMxO/qLo0tsfthxL2iABTx4z5cj1M3gGrdmMNXxQl7h5S1lWW1451byYxNHu4ZuY8zZxb7s9RJ9sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFtQZcf3ocvWMkwn4FmtohU3EiCaY5i2nrDP98D7cc0=;
 b=cq8HJ+/zM4qAnc56migt9RuUnsxHhXwgY9T3vAiW8E/8PbL5JIaewj91XtmuFjrkC5rDyWnAQQw3RfmHiSVBHSuOl/xzQCkaaQxL8f8VR9k0Ln3SLRXd98OvZz27s/fNshUfYgia8kYo+1NK76ByTw84xHG5uBgS7+HyhkUWKsESssW60SO+WXwx/inGvfVCDIR6LET7AaLRtVlc5WUk6cmGXKgep5phRc2NnePbFLLfmiGbmeKOerQ0uaJr1VL1Qjb7UnCScojKxoM9QKHTVgD2yg8HUSOWJaqxFks+b1sp9cmYcZo9dMGmSMSU8Wo9aOTRb+tEW0onpCT1W8GqgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFtQZcf3ocvWMkwn4FmtohU3EiCaY5i2nrDP98D7cc0=;
 b=rz6ZU8vR1DWzRqRl+SKZvGUZOd2kdTc3c5r9nu67slqEGGpuV6xfgsvBaz9/bJjYoZjzC5fphl70PdAaK+gKw0XAVXf0MXYNmlg1Rp3P5C7NiQc2UeO62agBBStkyTSk9/+uvmWP3cll29hYjfYKNWwR2BKHbF5CWj9eAdoeHD3SrKgi72rVw70AhKfNz5MFqYJ1ZVEFbWjNex0aUzW11w6bnTrGBn+BEYxOFLkxZfTNWxi4AcJQAT84welSgY0dLJ+l2zz5inzcIQn5g2N72RORGdgAVIywbcDOhbp+t9XoJzie5Frh0a8wzcR75EWu0AR6xddl2xoVA0BDbVbxtQ==
Received: from CH0PR03CA0186.namprd03.prod.outlook.com (2603:10b6:610:e4::11)
 by IA4PR12MB9785.namprd12.prod.outlook.com (2603:10b6:208:55b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 09:51:31 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:610:e4:cafe::68) by CH0PR03CA0186.outlook.office365.com
 (2603:10b6:610:e4::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 09:51:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 09:51:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 01:51:20 -0800
Received: from localhost (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 01:51:19 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<robh@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH v2 2/3] gpio: tegra186: Add support for Tegra264
Date: Fri, 23 Jan 2026 09:51:02 +0000
Message-ID: <20260123095103.1108212-2-pshete@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260123095103.1108212-1-pshete@nvidia.com>
References: <20260123095103.1108212-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|IA4PR12MB9785:EE_
X-MS-Office365-Filtering-Correlation-Id: 6471d6e0-9d3a-481d-eefd-08de5a64fc85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|36860700013|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rzc4YnBmSXY1TWNaMHR5WTM0cm1UeWQyRFVVSkNXNW40Nk42eDVaL0pKZjdX?=
 =?utf-8?B?cXAwdnZNZkphdjZUQTMzcFBaUmxCUTY0V3VXVktjWWlnckVQVDlQblRjakdW?=
 =?utf-8?B?MkpoVUYvUDV1djhNcC8xTzVTRk5neXdWd2poUFVwWlBKdE45RUdtQmRwczJh?=
 =?utf-8?B?cVk2UE1xcnFoaHhqZ08yWklrdW4zNlVteTVCa2ttTGUxSFNOYU1vWDhLZFFM?=
 =?utf-8?B?cnFOUGFRUHB0RWpSSVl3WFozRlJ4UW1vM2hGUmNLNnhKTUVCTzV1VUxxdjEz?=
 =?utf-8?B?MHk4SzZHb3lmYWJzRDFUdDBmUFo2RjYyVDhiVUd6bU0yL0ZxNlJia0JpaDAx?=
 =?utf-8?B?bTFZWCtFeW9tVW54VVdQUFd4akE0OEFaVE51Y0krQUFVak9tMDI1U3lEMlE4?=
 =?utf-8?B?ei9VeG1CMkVENnVEbUpxWFQ4cWloVU5sWHV5VXFsOEFLU0FNeWJVaGlzbzFZ?=
 =?utf-8?B?bTJOenlGeDJGekNBWmFBMzQzaEVtQXdGR0pyV2NBKzRCSkMrWFg1N0s3ODAw?=
 =?utf-8?B?cC9kTGhqNU1mdEd6MlFjbzQrMkF1dGpsL2xGY0RCNTJoZEFVVi9HNzcyWjV0?=
 =?utf-8?B?TXU4eWIyU1hzT0xOSGt1ZWluUTQrNWZNVWV5dUpKWXg1ZHZuV0lUdjZzVG5O?=
 =?utf-8?B?clBmelFOZFZLalh6WEhCd04wbElReVpUQm83MmRpaU5KUlhDVjlOellKaHVC?=
 =?utf-8?B?NTd6bXNWVndBYmZnRTQ1YjlPMmsxVmJBZVllSUFFckVkV0RrcHBDYlYzLzRN?=
 =?utf-8?B?TWZ1L3cwbGlSaWpvRUtFU25NaEV5M1hiVjVGcTRBczFTZ2g4OUM5OG8rRis0?=
 =?utf-8?B?K3BoK3gvNlo1TlRsOXNVNnBONnBJWFBxajlKRVdvRVpIODQzTUVLOVl0V2RE?=
 =?utf-8?B?TUlvUC9ucytTTHNHQjJST01vZTloRnk3bXRRYTZRek5DazVzSDM3a3lkbndH?=
 =?utf-8?B?ZklYOTZUZnhxaXo2QmhNUTZ4cUJBVlpsZW5URFhNVzN1Tk1nVHlrOHB5ZkZO?=
 =?utf-8?B?RjB1c3lJenVvNlUvLzVndXhXcFVsYnpPdnEwNWRBSTQ4WGREb2d1VlRXWjNW?=
 =?utf-8?B?OWpQVVNMTkZhQzFaWFBMNDU2TUdaTGh0NDhqTjZicjlhdlhLRWtlMW4xVWJE?=
 =?utf-8?B?UHpNSm8vb2FyanhVa0g2NUU4TnpaQXVPaU1LTDIrR0g2eVF5Nm1VbVlEckho?=
 =?utf-8?B?bFJNUElmTHVvdDVtczdxTWVQeGtSeEttWnRjWFYrbVpxUkF0S1QxVE8xUEdp?=
 =?utf-8?B?MFBRZktDTS9TS0RVQXRyYWpncTdqMnU3RzRaQ3RKQWwxQ1l4cTFRd2JSSHhU?=
 =?utf-8?B?OFJ1UVVRM2RuMnRscG1yUmtObWtYcE4rZTYzemdkR3lKMHcrSk5WWk5KdCtj?=
 =?utf-8?B?cUlaekpZVUpwNS84My9naHdxQkFnVVV1MnM3ejRreUpNZW1DOVZUM09sZThE?=
 =?utf-8?B?RklWdnBiNGJwZjFxVi9JMUJObFlIa1ZoZVhhM3daRGgyOUI0QUJScU1NWVlI?=
 =?utf-8?B?cXNNZkF0TXloaUcybGlNSmhZSnpHbWNoK0FmVWpTcFYwZHMwd2hUZXQyeDht?=
 =?utf-8?B?aFRqMFF5UGlsYzk3Mm5rVEtaRFZtL1c3bWIxU0FNQXNGek9aM28yUXdWcGxa?=
 =?utf-8?B?Zm5uWk9RMURVWFgzZFBQaUhLSUF0Y0x6RlJzejQyZkJ4RmJNb0N3OFJhVjh6?=
 =?utf-8?B?b3VKVEN4SHdpYk5rdkg4cml6VlB4eStoamlxUGl4cHFYZXRQU1NUbWtxU3p2?=
 =?utf-8?B?V1lZSzA3aklhanAySG5yRVJ6aE1aV3dxUmpobUZFYVE2RVpPMlVDK0JzeGNH?=
 =?utf-8?B?Y01SWi9Zd2EzOCtTU1Q0UllpZU1LZ0lGQjFDMVdVL082NUhsL3JrNWhic1Qw?=
 =?utf-8?B?NFlMbytEeUtlaTFiWlhQWVZZNFczcXRnSktXU2NJTG5uTTkzelczSmpNRU9O?=
 =?utf-8?B?VDl1Nnl1dWNyWUVoRG5ubTErNncrdkVOQ2FVcU5QUjJrU1VyVVRvSTR3SVhC?=
 =?utf-8?B?dGJkaXZiYk1tTCszcThCc0dVMklGOURyNWdGYTRaUnlML1RMMU1VaUI2UnRD?=
 =?utf-8?B?Vlc4a0F5OVJ2ZkVHb0t2WUFzZnpkeTFJL3hldEFqcWNqSmwvSnhlSENwRmwr?=
 =?utf-8?B?ZXowcGw2V0toZmh5TmxoMjRHWkZZZXpadlZVQWVscndEdkxRN0hUeis4dmdL?=
 =?utf-8?B?blh2ODE2WDN1NFNvT2YxSHJTTnE2UkVncmx4eGJtWEQ1eFRHeFBYRW0vUDRl?=
 =?utf-8?Q?f7/lLINHQLWtzbxPt8AV0BI1GJ8Ml0WNhVDnQu7Srg=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(36860700013)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 09:51:31.1612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6471d6e0-9d3a-481d-eefd-08de5a64fc85
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9785
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30981-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 46DC173AEA
X-Rspamd-Action: no action

Extend the existing Tegra186 GPIO controller driver with support for the
GPIO controller found on Tegra264.

Use the "wakeup-parent" phandle from the GPIO device tree node to
ensure the GPIO driver associates with the intended PMC device.
Relying only on compatible-based lookup can select an unexpected
PMC node, so fall back to compatible-based lookup when the phandle
is not present.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes in v2:
  * Use “wakeup-parent” instead of "nvidia,pmc" and include the renamed header.
---
 drivers/gpio/gpio-tegra186.c | 90 +++++++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index b1498b59a921..9c874f07be75 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2016-2025 NVIDIA Corporation
+ * Copyright (c) 2016-2026 NVIDIA Corporation
  *
  * Author: Thierry Reding <treding@nvidia.com>
  *	   Dipen Patel <dpatel@nvidia.com>
@@ -21,6 +21,7 @@
 #include <dt-bindings/gpio/tegra234-gpio.h>
 #include <dt-bindings/gpio/tegra241-gpio.h>
 #include <dt-bindings/gpio/tegra256-gpio.h>
+#include <dt-bindings/gpio/nvidia,tegra264-gpio.h>
 
 /* security registers */
 #define TEGRA186_GPIO_CTL_SCR 0x0c
@@ -1001,7 +1002,9 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	if (gpio->soc->num_irqs_per_bank > 1)
 		tegra186_gpio_init_route_mapping(gpio);
 
-	np = of_find_matching_node(NULL, tegra186_pmc_of_match);
+	np = of_parse_phandle(pdev->dev.of_node, "wakeup-parent", 0);
+	if (!np)
+		np = of_find_matching_node(NULL, tegra186_pmc_of_match);
 	if (np) {
 		if (of_device_is_available(np)) {
 			irq->parent_domain = irq_find_host(np);
@@ -1277,6 +1280,80 @@ static const struct tegra_gpio_soc tegra241_aon_soc = {
 	.has_vm_support = false,
 };
 
+#define TEGRA264_MAIN_GPIO_PORT(_name, _bank, _port, _pins) \
+	TEGRA_GPIO_PORT(TEGRA264_MAIN, _name, _bank, _port, _pins)
+
+static const struct tegra_gpio_port tegra264_main_ports[] = {
+	TEGRA264_MAIN_GPIO_PORT(F, 3, 0, 8),
+	TEGRA264_MAIN_GPIO_PORT(G, 3, 1, 5),
+	TEGRA264_MAIN_GPIO_PORT(H, 1, 0, 8),
+	TEGRA264_MAIN_GPIO_PORT(J, 1, 1, 8),
+	TEGRA264_MAIN_GPIO_PORT(K, 1, 2, 8),
+	TEGRA264_MAIN_GPIO_PORT(L, 1, 3, 8),
+	TEGRA264_MAIN_GPIO_PORT(M, 1, 4, 6),
+	TEGRA264_MAIN_GPIO_PORT(P, 2, 0, 8),
+	TEGRA264_MAIN_GPIO_PORT(Q, 2, 1, 8),
+	TEGRA264_MAIN_GPIO_PORT(R, 2, 2, 8),
+	TEGRA264_MAIN_GPIO_PORT(S, 2, 3, 2),
+	TEGRA264_MAIN_GPIO_PORT(T, 0, 0, 7),
+	TEGRA264_MAIN_GPIO_PORT(U, 0, 1, 8),
+	TEGRA264_MAIN_GPIO_PORT(V, 0, 2, 8),
+	TEGRA264_MAIN_GPIO_PORT(W, 0, 3, 8),
+	TEGRA264_MAIN_GPIO_PORT(X, 0, 7, 6),
+	TEGRA264_MAIN_GPIO_PORT(Y, 0, 5, 8),
+	TEGRA264_MAIN_GPIO_PORT(Z, 0, 6, 8),
+	TEGRA264_MAIN_GPIO_PORT(AL, 0, 4, 3),
+};
+
+static const struct tegra_gpio_soc tegra264_main_soc = {
+	.num_ports = ARRAY_SIZE(tegra264_main_ports),
+	.ports = tegra264_main_ports,
+	.name = "tegra264-gpio",
+	.instance = 0,
+	.num_irqs_per_bank = 8,
+	.has_vm_support = true,
+};
+
+#define TEGRA264_AON_GPIO_PORT(_name, _bank, _port, _pins) \
+	TEGRA_GPIO_PORT(TEGRA264_AON, _name, _bank, _port, _pins)
+
+static const struct tegra_gpio_port tegra264_aon_ports[] = {
+	TEGRA264_AON_GPIO_PORT(AA, 0, 0, 8),
+	TEGRA264_AON_GPIO_PORT(BB, 0, 1, 2),
+	TEGRA264_AON_GPIO_PORT(CC, 0, 2, 8),
+	TEGRA264_AON_GPIO_PORT(DD, 0, 3, 8),
+	TEGRA264_AON_GPIO_PORT(EE, 0, 4, 4)
+};
+
+static const struct tegra_gpio_soc tegra264_aon_soc = {
+	.num_ports = ARRAY_SIZE(tegra264_aon_ports),
+	.ports = tegra264_aon_ports,
+	.name = "tegra264-gpio-aon",
+	.instance = 1,
+	.num_irqs_per_bank = 8,
+	.has_vm_support = true,
+};
+
+#define TEGRA264_UPHY_GPIO_PORT(_name, _bank, _port, _pins) \
+	TEGRA_GPIO_PORT(TEGRA264_UPHY, _name, _bank, _port, _pins)
+
+static const struct tegra_gpio_port tegra264_uphy_ports[] = {
+	TEGRA264_UPHY_GPIO_PORT(A, 0, 0, 6),
+	TEGRA264_UPHY_GPIO_PORT(B, 0, 1, 8),
+	TEGRA264_UPHY_GPIO_PORT(C, 0, 2, 3),
+	TEGRA264_UPHY_GPIO_PORT(D, 1, 0, 8),
+	TEGRA264_UPHY_GPIO_PORT(E, 1, 1, 4),
+};
+
+static const struct tegra_gpio_soc tegra264_uphy_soc = {
+	.num_ports = ARRAY_SIZE(tegra264_uphy_ports),
+	.ports = tegra264_uphy_ports,
+	.name = "tegra264-gpio-uphy",
+	.instance = 2,
+	.num_irqs_per_bank = 8,
+	.has_vm_support = true,
+};
+
 #define TEGRA256_MAIN_GPIO_PORT(_name, _bank, _port, _pins) \
 	TEGRA_GPIO_PORT(TEGRA256_MAIN, _name, _bank, _port, _pins)
 
@@ -1368,6 +1445,15 @@ static const struct of_device_id tegra186_gpio_of_match[] = {
 	}, {
 		.compatible = "nvidia,tegra256-gpio",
 		.data = &tegra256_main_soc
+	}, {
+		.compatible = "nvidia,tegra264-gpio",
+		.data = &tegra264_main_soc
+	}, {
+		.compatible = "nvidia,tegra264-gpio-aon",
+		.data = &tegra264_aon_soc
+	}, {
+		.compatible = "nvidia,tegra264-gpio-uphy",
+		.data = &tegra264_uphy_soc
 	}, {
 		/* sentinel */
 	}
-- 
2.17.1


