Return-Path: <linux-gpio+bounces-30963-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EbsIlwYc2mwsAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30963-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 07:42:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEC37118D
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 07:42:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E09A03018297
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 06:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC71D33B95A;
	Fri, 23 Jan 2026 06:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S2xNNmBF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013055.outbound.protection.outlook.com [40.107.201.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C0D331A57;
	Fri, 23 Jan 2026 06:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769150544; cv=fail; b=LRW4EmOZJr64mTRfWVxdVOCw3xONTe5SWcyJE1VDTOAVYh7X7/pKjjvuIwpNEFSU2I835l7ylE1+rfR4Y4e9zs5GsxERkNi/yWg5yOj6S0WYpgEkxbkj7BPUIJhEmYXLgK8DZ4pzG8mrBJ6x0rYIpdQVClxabyC77ETkeFv28+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769150544; c=relaxed/simple;
	bh=oCoWG7xs7L1zdmWP5KKyS0TY8yoGtuvPVxUppiDljYw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WKqbSQ62DHzMGsdwFxkI1abAXYWp84v39+tSavXRGEUKj6xuAhd/Pn3YLDYzS1DayBGxg3BhwX+04XBWKRUFBARqIsgfb8t1+vEZHKr7amBc7aXrRemt7w7u56+CW+nU20DeGAXQPFV0HSUjNA+DErG0XGSODJtm0ulRcKv63CA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S2xNNmBF; arc=fail smtp.client-ip=40.107.201.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUn4o5a4+15D4XuPHm1cSUlQV+oLZoFAQDLcm+LFnZCKBOJrOjklbqTOITfysGpSprTOs6FhHkX54/YvVxlFB/lvillzDxz5fF1OLN2PzEaneohMu1gWIINqc42vslvLQJSQ3ggHGT1PGAgoSQ2asC6zp3Dhz6Z4SJ5YVE6DYxPxxA63rFnfFs92R/5SOrprE4w+S7pAOqoYhCHS6n/dUV9EEr2nJp0M/uc+T+TwqxhppDTXr8QwXlaEJcSjXBvIxKHM7EdV6Olym50f1tBnLL4IG7AITPSAk3y+k31aLi848UXyFF1HDdbOQW5pRr+IAPuYxXnEAwHIFks2HOEWbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52xoavkozZ6r++vtKvHIWW483BUDh7EWeRI47cuHxOg=;
 b=K/kAfei+WIzQUNfO0evzYJM1EBLbKKAfNEoDNGkb+Ka16bBQuy+5Pnkpo4ot+ovbTbwZm2FNT4Ew1BuONx9nOnsRRGLwIFUOkIK+z8q7O9jBxQavfSwWjlkW+gB809CSpj5Vammsd4hgJ2Q2QXMmQnigQqx5pQhsfyHbSwjvTjgn4XBduxWUu5eOEh9kemlNoSXTOa2YSlSicr/WYhq+MrHoxTn03DbNg42JPv1dudYMMaJI7k+5T8PRqlPIjVWTUtTjgicEMBEOH+JPZFY4GQ/QbsVloB4MVe2z79P6cFUfBiPitmJCcu5kNA++bLDuBF/KsKnfKR/Iu5prn/TjJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52xoavkozZ6r++vtKvHIWW483BUDh7EWeRI47cuHxOg=;
 b=S2xNNmBF52U82x/IRnyKuKW/30g9JigtL3Fa/GLzSbGdYmQpK0e42RvDrV1dzFDcEz30CBG+mq070pQbqb/RYd4TYxdZmpAXkWypx723n70sQh7ZkQ+vi+ROZTWl6l65gSsMkkC/IoCuVW8lVC9njCDVN/GYAQHnsy5izu7vYnXcZbyKnx5ZPF+tHP08+q36LxBKpSystdyqkxr9AdRkOOTsgxbeOuqvZ/mSrUIFd2cEPy2Fy7iMUwdiMvvAv3Io4WeUkE/h1/L/2VS8+C/cKhB8PgHvyYO71GNNJlDeO+c8KHPhdFriOUv88uOE/MDllTnoiZzWCC1BB0sER7TpNw==
Received: from SA0PR11CA0178.namprd11.prod.outlook.com (2603:10b6:806:1bb::33)
 by CH3PR12MB8481.namprd12.prod.outlook.com (2603:10b6:610:157::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 06:42:14 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:806:1bb:cafe::6e) by SA0PR11CA0178.outlook.office365.com
 (2603:10b6:806:1bb::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Fri,
 23 Jan 2026 06:41:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 06:42:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 22:41:58 -0800
Received: from localhost (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 22:41:57 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<robh@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH v2 2/3] gpio: tegra186: Add support for Tegra264
Date: Fri, 23 Jan 2026 06:41:39 +0000
Message-ID: <20260123064140.1095946-2-pshete@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260123064140.1095946-1-pshete@nvidia.com>
References: <20260123064140.1095946-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|CH3PR12MB8481:EE_
X-MS-Office365-Filtering-Correlation-Id: 69f7f0cc-4ad0-42fc-e4db-08de5a4a8b02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWhUd3JYSjJpVjZHbGhRV0ZDZ2VpaE1wbUhPNVpPd2VSbzFkby9LZzd0NVRQ?=
 =?utf-8?B?K3FJTGE5bjNBTnorQXhOQkFSMUdOV1Z3cUdWOU1DWVdKcWVMRkwrMFNzK0FT?=
 =?utf-8?B?LzB4RFR2eFdhM3ZMVmRhQmtCMURmVVdwMFBUSzRRdzhTMXduVzQyZytaSSt3?=
 =?utf-8?B?eFdOVjBtb2JxaHlaTEZidTlPa0NVM0luSGFMVUVvdFgvN0E2UG1oN1VaU3l1?=
 =?utf-8?B?ODBJYUxLSXE3dXJYM1FwYWh2YlhWM3R5R00xTkVQSExYRXNyVjFESmNjTWJW?=
 =?utf-8?B?a2pFTnFxaDVRdmtheDRZdjJYbkJDYktweWpadGdZMVZmOE9GM1UzNVl6V1RS?=
 =?utf-8?B?cEdKdElGWDVieEtNRWhzUnRST0phUTFzaTVOMm5UOHp3bm5ucHQxblRFakpx?=
 =?utf-8?B?QldIWHU3NW5ucEVBRkZWTkgxa0tRNnJGV3hZR1U2MytXU1YxeHVtVUFIVEtF?=
 =?utf-8?B?eWw5T2ZZcytDVUJPYTZodFN5TWlTY2VEN25POVYwY1ZoSGhsMXRYQW5oRGM5?=
 =?utf-8?B?QUJzMjBieFBZczFCZm83V1Z1NzFCUER3YkxBNGFaMG4vN2lKNXZ2dWFrUUZ4?=
 =?utf-8?B?MWUyQzRMb2FYRTRHRmZ2cXlWWjhRbmN5azJwUEl6S21BOHU2VGloQXRqM0JF?=
 =?utf-8?B?OTJ0UjNmWGlIcVpYeGw0ZThYeGQ0Z1IzWE9VYmM5VjFJUGU2czJiL0lnODRk?=
 =?utf-8?B?YlFyUG85cGpqRlFkMlpWMWlVMHhtQWNmdFFqQURZanFLRThTRnpoWjkwbDVS?=
 =?utf-8?B?SkhmWjN3Uk9TYkxjVWpJdHpXcTJ4d2lsaWtsR1NtVjZuNXVRdVNaUzRPWGtI?=
 =?utf-8?B?aURhNzFjV1Vid2RqVGxnQy9YWGxKeXZwcEc2NnQ5YzkrZlZTZ3Rya3l2MWtV?=
 =?utf-8?B?MEl3YXE2Z2M3SlRZVWZlcGZXeXpFMXV6RmVkSWJEVmdtbFhCaG1mZnlKY3BU?=
 =?utf-8?B?SWpzRGJuWG1BUlB2b25EM0VmckYvRmtubTZhMStEM01oM2Nldlg3czh4VGgz?=
 =?utf-8?B?a0o1bFVTSjMraEdLd2dpQ3hSOGlncW1iazM4ajN4UGpkTWFLVHJ0Y211SGg3?=
 =?utf-8?B?YTVGSzE2V0dLME56cDhwdUZ1c2NzUTdqOWxKKytteVhDT2F4eFRXcEtUZmN0?=
 =?utf-8?B?RTZyL2F4bzdLQVR1Vmlobk5aN0cyWFBRK0pDOElnRzZvaFdnVEZLbXdyeEdD?=
 =?utf-8?B?UVpXUzhQWklodm1IMFdwNGpHamFDYzIwNStiaG0vcTZGWUZYWURraTFDdHZt?=
 =?utf-8?B?MUNLWDJERWNlanpSazZEcnI2RXNjOWNsdjI4YWZvVTJueHZ2Q2dYQzJhUVFr?=
 =?utf-8?B?TVY5bzhEVjBHdnEvSjlSTEdnMkZVSWk1eWlmVWd3K01obk1lUGVndmR5S3dJ?=
 =?utf-8?B?cXgwMTNja3FhKy83bTA4a3djTHduenI4ZGxIODlTZ3VBMFZpMWt5d1ZaR1lH?=
 =?utf-8?B?VFhOU3ZiWTFQWlhyMDZQMWowbGRPZkd0MkVsdThQWENDYW5YOFRTTXlYb3RE?=
 =?utf-8?B?bEpvL0pzRmNGZEZBK2dRbGNxYjVJUmFqS1czalY5KzZtRHR6bVpIRnIzOG96?=
 =?utf-8?B?TWRtWGNPbjBFcWExbm1mK0NYdkozVUNxUzBQREZ4OGlDQ2pMUmFpcVI1YXdp?=
 =?utf-8?B?RExYRHJIQzFJems2eWNCZ0d1ZE02Q2xrWWRlODgzWG5XUTlFcGR6TGI0N2dk?=
 =?utf-8?B?NzZtQzVwSDdNc1hyMEU0b3BXcmg4aXVvRitNRmIwK0s2OElDOGdpaUpuM2dS?=
 =?utf-8?B?V0NPZ1ZTZDc2QTZRS1owcVUwK3ZEVUVXS2dyUnk1Q1VmNDJadGlQZCttd1E3?=
 =?utf-8?B?WFpmVlVDNHJMOXNQajAzVTgyczF6OFJJSXppTStBOXV5YVdXM3FQSC9BSXlH?=
 =?utf-8?B?UWxsWDZ3MU12cTBuaEx5QXBqdzlGN2tXMTdidHZWM1FzREYrMVdSQWw0a0dn?=
 =?utf-8?B?ZW9HSFZiMjU3SUFPZHFtU3pTV25tV29CbTR4dTk1Tk9iZklzN0c2a0xVMWU2?=
 =?utf-8?B?eDhSd1grMS9MNXNSdzF1ZzBrdTBsdXFzZVNZcEdPZzJVU2RlOVJPUEZaU0Zs?=
 =?utf-8?B?NDlBSHVzMnV3MFoxR1h6R2habFAyRnVEZFdkUk5xcEFWNndHcVArc0EzWXZK?=
 =?utf-8?B?d1JIaTl5cVJiNG0rWEJQOUUrb2FqSnJPdExSK1pyRUViZm1qQkx4UXNFekhJ?=
 =?utf-8?B?UnpucDFPU0lmbFZkVThGVzBZRlBVa280bS9nTTF1S215Vmd0SUI5ZWd3NTND?=
 =?utf-8?B?MjlJbjc2UnluWUJuZTlCNUNtZy9RPT0=?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 06:42:13.7941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f7f0cc-4ad0-42fc-e4db-08de5a4a8b02
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8481
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30963-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3DEC37118D
X-Rspamd-Action: no action

Extend the existing Tegra186 GPIO controller driver with support for the
GPIO controller found on Tegra264.

Use the "wakeup-parent" phandle from the GPIO device tree node to
ensure the GPIO driver associates with the intended PMC device.
Relying only on compatible-based lookup can select an unexpected
PMC node, so fall back to compatible-based lookup when the phandle
is not present.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
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


