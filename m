Return-Path: <linux-gpio+bounces-30991-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJZlNbBKc2lDugAAu9opvQ
	(envelope-from <linux-gpio+bounces-30991-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:17:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7708B742E1
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99BE93296B65
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D21437D12B;
	Fri, 23 Jan 2026 10:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tqTwnOJn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010032.outbound.protection.outlook.com [52.101.201.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1796337FF40;
	Fri, 23 Jan 2026 10:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162961; cv=fail; b=JtB846DZEazcnXDgG69QGx8OQv5/x0wtDRg7JaoFoVghyzXCgcMSRq4vXxlwzODplG4wFebsbJTwldYcWOMCZSWOnT5lQrIEDrvonX3sgYccsSY6S8k02SCZshUANfPpz/LrXdmCXGZkZw6Y7NFo26uOdXG/vS0IeTOTNnc44kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162961; c=relaxed/simple;
	bh=JxEBGfjiX9MK5qnjl6K7d5Fi4P0RPk0cU6W+5Im0+PQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XN6auTFG+9r7IngaHeyBv6JtKsMWhq6OJpOGz4FO67/C3F8DtLMh4FM0oNh6gKGOuSZq7fov+yMoRS+yfF/4T2lw3ZdWxCcPASkBXs+vk4A1AJ9E30Hfdk4zApVEkSFH/n8Q/l9ukwr2CbktfKn1TKlUr81vOJglEGS/qBHcgos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tqTwnOJn; arc=fail smtp.client-ip=52.101.201.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=moaFMoB3Y4EYP+yPDvULTs0gEQ80JFRJxwn1FG1s1fOTJJjI1Rm9WvUKjISOFL+bxaVAZuGyZ/sQI7Ss3zQUX+T3nU0UJCWssXM/JCT16RnokAi+bD7qCQDLTfmi5S6Q5wNtPkFrA8Bfhmuw6bUig+xq6YXcZHhN5K2r8FklSXUyYx17BaC1eK2Hj9wZNRzwXZqBHbei7JEW+uXY6rV970zHuTybv/nfSPiVPKffbyy1gKkxaKP/MvJ5Ogk9EfK3tRbuw1yon93V8fGhIaVBwDJf7d9E3hF7tfhVWC5aNREYGS137a+z4msYXR+CfCbUH9vX7XZ+i2sj1BhOfelr8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFtQZcf3ocvWMkwn4FmtohU3EiCaY5i2nrDP98D7cc0=;
 b=el9lU5OTuvWSc8pvFdDo2Wiac/RCgBxVKQf+R1mVex6i9aW8tLruaiCXRLcsEclmdHF9BDJIkI3M+GmLqV5vIVwLOfnIg7lC98rXRRVGZOONJOx3EcSuI++9AOpyYrCZOG0Dgnpet0j5iSADVsBc+05Z7qGETgUQSXC6lfjtebU9I9O6wyY8CNvCYm210VhIGo7WO3yLJDX+DFHHyfwYsr4YWCLt7EAYK49Bb41iezfEsXEvqaTAIW0ixNjZyTGTCpDffOQQIUgVbHbPXOnhs3afhmEFwpF18lPOhuKRhBfw9qIp/swbTFjJpyzMBuxtysg7rHAiHAJQX1DRb9s6MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFtQZcf3ocvWMkwn4FmtohU3EiCaY5i2nrDP98D7cc0=;
 b=tqTwnOJnnL4IEOz4f27CTkBQG/hT5yYeblKiVmJZxxVSrjN78BcdSlIcZ/21kGH9M7CGlg16PgqkDO0XOpwyHke0UEHJKeLIsAAGMPk/smAdrZtCtBA4G5oNo5Vaxwww+JSpIUNMoY3D+M7LPjam0yIqvx4b7GZfBEIuPEDe80/5XtGbtGLOQfo7vowsnJIKpBfcHXJtjKotrA/51TqE3oZ90F/qmVnrJ/7CCo3yF/IebuDSOactY3Ho3dhdGcl5B4Q0oCmE75nys4kvzQpJTgbrYGse9iABqqP76OjWLIoxfe5DdCG3ZVP5dc6FN7BfdFwThEin/1CZ+iv4QyQiiw==
Received: from SN7P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::17)
 by DS2PR12MB9566.namprd12.prod.outlook.com (2603:10b6:8:279::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Fri, 23 Jan
 2026 10:08:49 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2603:10b6:806:123:cafe::82) by SN7P220CA0012.outlook.office365.com
 (2603:10b6:806:123::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Fri,
 23 Jan 2026 10:08:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 10:08:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 02:08:38 -0800
Received: from localhost (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 02:08:38 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<robh@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH v3 2/3] gpio: tegra186: Add support for Tegra264
Date: Fri, 23 Jan 2026 10:08:23 +0000
Message-ID: <20260123100824.1109150-2-pshete@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260123100824.1109150-1-pshete@nvidia.com>
References: <20260123100824.1109150-1-pshete@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F65:EE_|DS2PR12MB9566:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bb4b370-f0b4-4034-3a30-08de5a676766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2RHRFg0VTNZdVpTRkgwNlR0L3JUNGwySE93bmsycEFKVjBxR3M1R2kwWWNF?=
 =?utf-8?B?ckgvRWNSK0c3QnA0dDN5cnpmMUE4bGlHOWFNUVJ3VE5waFNIaU9vMmF3OTRM?=
 =?utf-8?B?UDRvWVl4eUxXZDZEL1JxSUdVcFpiaDFNZFArcmFJdjNtVW1Mak1mV2RHS1RH?=
 =?utf-8?B?U3MwYTNhcDBRQmluTGgxRWQ1ZGRlVEZIdW0vNmlFKytIREFRbk9HRHBQcnNG?=
 =?utf-8?B?UWV5QUoxZHI1N1N6aExPbVBPbVlmUktsaTcyam5MSnREWTJqWHhGSzlPbmQz?=
 =?utf-8?B?WWZ4VFZxM0QwNDUyQU1yM2R5YS96RUZSbEJUcFR4WUpOZ1BNZVhqZTlUTzFC?=
 =?utf-8?B?ZHhscDk0elRlRUhraHpVZWd0VVlIRnFYdUY0ODQ1UlZZMTlVblFzWWdGWDkv?=
 =?utf-8?B?Y0VZbEVwS1NDL1FlRTNDeTJoODB2Z2V2SUZaVHZmajhSS1ZXUE5DWGQvTFhh?=
 =?utf-8?B?UlF4cjRrZVJqc2dNM3J2bmwxQ1JnVWE2TytSaWgxSUhUeDRHSGFHUlBTTTIr?=
 =?utf-8?B?QWhxSGs0WEVmaFYwQ3NUeWlWY1dRNEs4TFNEelUyWVp1VkxtWmpWck1McmNG?=
 =?utf-8?B?VnQ0dFlwVjdCUDl4NGdoMkJmQXM3aTUxWFZRTnZiZ3Ntb3BwQVFQTDJJaGZY?=
 =?utf-8?B?WlJpQVlabTJFbUdrV2d3UHR0Wnd1TEdwZk9kY0tlUzZqWGZMbExGUnhTTlRr?=
 =?utf-8?B?SVRiVDYyeDRPUERGcUgzU0pPNUlpaUMxamRUTnJPTk4yOXVncVQ1RU8rZlpy?=
 =?utf-8?B?cTlYRE1laUQvekpYSFNaVi9XZlBqdkVDTHhVQVhPemFVTXlpc1lZYTBLaEJp?=
 =?utf-8?B?U2tmbFRuK1dWNEFYR1lQQUpmbFJyVkJkWjB3YW54a1JlNURiTWppRGNNNUhY?=
 =?utf-8?B?Y0xkWEdCa2tkWjRXMUY4T040NU5hK2FBbTlQT2hRTXFDVnBxR2Z0K2d2eDJ2?=
 =?utf-8?B?dkVoSHZXK3V5eDMyUjF2T0k1SWV2NFcwSWFaQ3NuTERENUw3akZSUDRybzR3?=
 =?utf-8?B?VzR1SEYrQWV5WmgvQW9oaGphbjlxeFlGWU9iTGVGdVpybHM4eGdURWorRG80?=
 =?utf-8?B?dmdnMVhMa3ZJWU9hMnVFVnh0SjEybXhaVncwYkQySDBVUm9FT2JrY0VXWlRr?=
 =?utf-8?B?cFFVQ2s1ZG4xT2ZWUmZJbGczb3JrT3lVODUvR2xTMUU1eGtPTXhwbmdkTXNm?=
 =?utf-8?B?MzkzcFNaR09aVXpCd0dSWTJEWktEZXJ0U1VpcklWMStDcGNld0NJQXFvV1RR?=
 =?utf-8?B?ODIrektQVGNnNldEQ3h5dWI2azR2SHI4R09VeDRGd282ZTJTVHpuQ0tISWpv?=
 =?utf-8?B?L3dRdkE1Tnpnd0UyL3BGVVQxeXdpb1pONHJTbUJMWG93azRMd3lhdWJDWGsz?=
 =?utf-8?B?Y1V1SUI2UE4wRkpyZ3ZmQUJWc0VpN0tYN0ZRQ2J5MlFKMStiZnRDNVVYSmhS?=
 =?utf-8?B?SUlkZk8rR3YvQnYwUml5LytiVzFGelByeHhNWStnSHIwTURQb0s2WTk2WDB1?=
 =?utf-8?B?NTlsOEJJdWpyZldrSHZ5R01jMjFsL1JvZS9HR2RSeWtoVys2WkQ4cUNDNGpR?=
 =?utf-8?B?R0J3R05RL21HZW1URWhRZElFRG5oTVl0dGdOWmd5WUFzbC9CWUR0eElIUmhs?=
 =?utf-8?B?ZitDZ1k3dlY1dWxlVUFIZWlRMlMyVUkxSlZucVh2T0RWRjRDTnBVRTZjTGE0?=
 =?utf-8?B?d0tGWFlodnkzS2hLTStXUWlyRnI5V3ExNnI0KzdCUmNkQU5kc1FGS3R4aStM?=
 =?utf-8?B?Y3RDRmNWWEJDMmFOYmFpMzUvbitvQlE1cjZUdWhHNWNRMFgzaUhKbkQ0RDMx?=
 =?utf-8?B?K1lLN2tiRDZWT3Z6VTlKZ0kzcUZkZzNlOWdXbkNwWjZvc014VFhPdkwrVlht?=
 =?utf-8?B?YlNFUXR5aStkUDI4Q09TbFZETVg0WHdFZzZFakxsU21KQUVCS2ZIUVRrM0tC?=
 =?utf-8?B?bE02eUQ0M3NGcERTVC9yOFMyYjhUUGxWcGNQMENqOFN1V1BWL2cza0ErWWlH?=
 =?utf-8?B?ZzdIb3BKUVRvcVFEejNHZW9Qcm9JdmU4b2pYYVp3TEJ0MDlVT0hrQUJkbk56?=
 =?utf-8?B?b0F6SXRGdk5Yc2IzeHVVaVlmNDFpUE9lSXZPOUxhbCtUSFp0UzRmeTZBd2dN?=
 =?utf-8?B?S1orWndpVUhwTmYybU1NSXV2M2M2SnIyU3Fna0F1V2ZlbFBjRWJXUUFyWkNP?=
 =?utf-8?B?QjZCSmZ5NEo3OU53Rmx0aEkvcm5rb2tnUEI5d0dSWTdDQmdzcnNOcUdVQUV6?=
 =?utf-8?Q?wA5v9L9IPsHjjEeH/D/5LXk4wovRF5pEBGOKfh4iiU=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:08:49.4593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb4b370-f0b4-4034-3a30-08de5a676766
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9566
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
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30991-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:mid,nvidia.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_NONE(0.00)[];
	BLOCKLISTDE_FAIL(0.00)[52.101.201.32:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7708B742E1
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


