Return-Path: <linux-gpio+bounces-31098-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKNtNmpHeGnWpAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31098-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 06:04:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1C58FEF4
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 06:04:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3C7A30252B5
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 05:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E5A328632;
	Tue, 27 Jan 2026 05:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XRg3Fh4v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011002.outbound.protection.outlook.com [52.101.62.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9A232692A;
	Tue, 27 Jan 2026 05:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769490266; cv=fail; b=JJwGAF/BBx/MhaD/nWU2P49aCc7a299UhN2cK6o7IpWbwpgMN+fQ5AKHqhZLRaxaPLWhw5D6nhdrtETcAdu8WJhvnV21x4I9EZMnZJw8xfO9JzamOP/7lOUIXNC6DrRifwbotb41PpyfCQ6AK97+SC0oV7GQ01azEKpDJQi+jPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769490266; c=relaxed/simple;
	bh=JxEBGfjiX9MK5qnjl6K7d5Fi4P0RPk0cU6W+5Im0+PQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jJXp0JaiePfljgkVs0oFEmEUYocu8LQXpe1wfANLKeM/Bm0CdMzBjF2JXFG3a9HV3oFJTSz/XTyxUQYa55NlvDsA5+yU8O1iMlutsbJ9yd2eDnBMdsVbAKwAIYtHhIduOFTKjHlc82Fd+L3fmaIY3cJcQjMXNtcDHSUeTu8He/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XRg3Fh4v; arc=fail smtp.client-ip=52.101.62.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/8/uuj55bHm1CU3LKdHGiNtfZyWl/xL4FF99R6mA1uRuyjKuODWaXauE1N3GrFyfq71jDBg43drNYDodFVE4SIH4Mycv6hXFZPNN4W6W7L+VSOU0woMVHFsEjaAU2NbzKDDpbq4m8CXPPenQ1S0s+XnJGInLnT9BMmry83LDZ0ZBYj8+D4CLJIuTLDA5Kkd4X/G+f/E3yqTagsGbnW7jWHsOoyxa32mp6cFd2Fo1fQehqXhBKptyn16wUP7slleaQV7oUXFbCTrTeEgFYujzfP6A1dEPb9UeyUsZfCVq3G+eM3esbJM44l9VwbReqMofC/sqvS6qKSlBk+vzE7DFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFtQZcf3ocvWMkwn4FmtohU3EiCaY5i2nrDP98D7cc0=;
 b=ShyzS807u9Hrh4aH/rc0GIZoWWdrcWhzIYAMYAH7T629f1dFz6X05W8Gcne185D2x6feFKfrEe0zOBOd1otAbAAS8Oog6hBGdaIlL7hufy4x37KIh38KAfWaK7azEChgAQWhHOYugQxfKgdCToUEWbDOYDMj4DWCMO333iUPUfZekYw8prVjUGWqqHHF6oBaJO2qqNLkSoc4rP07X9L/wiykuVrrrzq52g+fL91IsxBxAeSbRn7NPtDc/a0lYjOwDGzNOAmzKW7H5drioHTmEd1Mjbjrac8GesfohamuuASdfCWB26C51+5jz+ELJdaxAm+FFuNVjccC80Ta2atDJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFtQZcf3ocvWMkwn4FmtohU3EiCaY5i2nrDP98D7cc0=;
 b=XRg3Fh4vlJfgriBwNXPP5W42gZNg0rpJf0VNwxtF2MP0Lh7Ew73vGTWjIrhPU0uzzNSgtdyhpbzpxO0P4HzciIoGGI/fNDb0LPQl1cCxdv5yY86DOOKL6nqF5Okf3obkiMSkK7Z21ZrJ7LwGUN1zBMFLGBIkUSFEbRm0gpxGV1TaQ+VWChwAA+bYk2sNJSEBNz+r7oUVcKWT84LpDUgD6oXiBYxs/OBGYGseDE6u8I8VAav9Eauoyr/uVERn91VpP4fWPWTQ2f96PfNpxUee3wMxIYsV6BSMXp9dP/+Mwe/oiwHadkXy7VPznw2syv6Qk5LKUVb4p8CZaCqtEVnZPw==
Received: from CH5P223CA0004.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::24)
 by SA0PR12MB7076.namprd12.prod.outlook.com (2603:10b6:806:2d5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 05:04:21 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::e7) by CH5P223CA0004.outlook.office365.com
 (2603:10b6:610:1f3::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 05:04:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 05:04:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 26 Jan
 2026 21:04:11 -0800
Received: from localhost (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 26 Jan
 2026 21:04:11 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<robh@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH v4 2/3] gpio: tegra186: Add support for Tegra264
Date: Tue, 27 Jan 2026 05:03:57 +0000
Message-ID: <20260127050358.1136279-2-pshete@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260127050358.1136279-1-pshete@nvidia.com>
References: <20260127050358.1136279-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|SA0PR12MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f8c0f2c-6d69-43f3-e146-08de5d618824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZGRqRmJxYm9DcjYwRGFYZGtsZkZiNVNjd3FXWGU5bStYZ0JTdEh2eXFaYTJx?=
 =?utf-8?B?UndrT1Q5dVlpd1RMZzlVZWVxTFZMb0U1cmFmOTA2YzBicG9sNEFCakV5VnAv?=
 =?utf-8?B?T1owQ2M0YTlJd0dOMm1WU2gwaU5WR1Y4a3JSRkxxcExDdlNZdFRsOUNpL3VD?=
 =?utf-8?B?RWQxZEw0ZlQxS2J2THlGSDBvYlRBRjZKbVJsb2lCdnErT3pVZVZWZ1BjSFdh?=
 =?utf-8?B?SGVXbU0wRmNOY09xZ1hGTG0zSGEyUVFZd2Nla3RMSm9MVkJjbEhZeW9rakJJ?=
 =?utf-8?B?YmtTM3NzZmt6dDY0RFRsR3F3Y0VSOVg5aE5DbWdCQUpKVFFrOXh1aHU3TXFL?=
 =?utf-8?B?VEZVUHN3WEpkZS9YZHZiM2h0MnBnZVdJYUc4MlJBcktXdXFER2Y2WnpMTDBC?=
 =?utf-8?B?R0Y5aGg2WFVvemFEb0xaNzJOUFRlNTJpd3czUjV3RXZySE4rRzgwNDlLK2pW?=
 =?utf-8?B?b2FiNDVHRXFadE5GMUYvYkxhTDdGT3d0SkVzbHljenhIWHExU01RNFBhMkVW?=
 =?utf-8?B?S1prU3VQcFdxaFFNd0lhWFBqczNlN0cva21Dd2dIYzdsbElReUJRRy82cWlU?=
 =?utf-8?B?cEx4cGd4MnBNUitkYkI4LzNxSmZKb09RWUF5MTBiN1lqN2pjblo2QkE1NjhP?=
 =?utf-8?B?TFN5WlhuQTB5elFDMUdHV1R6dVRMSExtZUlKMjFDMC9aTUl3U0xXV3FSa3Ax?=
 =?utf-8?B?dlhJR3gzZm16RzJyRG94ank2cEk3bjlWM21LSUl0eUg5Y01oSXJNL201S2ZG?=
 =?utf-8?B?cjk1eHpudS9VbzQwaW5hYkNqb0k3TzRkRlh6M1ZxYXd3Q3RnTHBDOWhYNXZo?=
 =?utf-8?B?MGdsTHFXNzMvR0ZHVHNiN2FnZnpvZzlINlFkZ3p6N05PMHNZak1GcVZLUnNs?=
 =?utf-8?B?aEp1eEVzUU1BeDRPbnhoVFBSQnVQVkFDZXVKYyttemtDVzFlRkE2Y242MmJm?=
 =?utf-8?B?Tk1pcWdia2FVdzlLeVNlYVVKdlU2TVVBOW9zaThqSjFHTHRlNERvUWFYb2JY?=
 =?utf-8?B?ZGs1U2k1RnVKU0hOd21JL0t5WW5yVjBjWERIY1ptWkFMblN6REFDSXlBMDVs?=
 =?utf-8?B?cGtBcUZCa2tCMjV4bElLc0lqb3JCbE1vT2poVUw2dmRySmZueHJqV1ByU1hl?=
 =?utf-8?B?eEVtSDdnakx6NjlJMFJrWUVIaDVyZWNpVDF5NEc4bFlCazJCQW5BWXFVVWNp?=
 =?utf-8?B?OVNSNmhqaUlpYTczaG02YW1RVkxiUDZhdG1jOGw0RzZocXd3OENzQnBQZ1dw?=
 =?utf-8?B?L1k4T25QR1ZoVXovcGorUGU2RUd4d0VjRzE5S0JyWE1BSXNqeElLS0lOUVRN?=
 =?utf-8?B?cC9JTFpqV1ZaV2hvZUtMWjRPcjB0ODg1Z1lTRGlCYW0zaTI5N3NkYnlvQUFK?=
 =?utf-8?B?MTFYS3RYZmZVTXNNRURobWVQczNQWEg3bzZjSlZ5QWpYcFVOZGQyTWtkSGxE?=
 =?utf-8?B?aWNzWEk2SEFOTjNnaXl6WHJvdm9HZ0xOSWl2ZmhjdThhRGpvRnVuNit5clYv?=
 =?utf-8?B?SFRBV2tIbzV5SjVickkvSldNekhRZTk1Z21OaE5JWE92cXp3UFN3TjkzY05i?=
 =?utf-8?B?a3hVR0RURkZHNDlDUkhTMU9Nc1lkdFhoOTQvaE0vaTA1cXZzejV4R0VVc1JJ?=
 =?utf-8?B?b1E0ZTRxbEN6Q0NuMlhqa3hVR0orS0JvRnRLTWd2d2FiZk5wQ0llVFRyMmJO?=
 =?utf-8?B?QVp5eXBDNlZOZitNNWRyN2dSNzdyZSt1ZmhoOUxiYUJtTzZYcVM1R3diUVdH?=
 =?utf-8?B?U0ExN3dJTDN3TTF5bUU0Ri9XNDlFNDdYMytqemNTdExNTkphV1hIR3JrcWlj?=
 =?utf-8?B?cFR2ZzZHR2ZLTDJQNTlod21td1J6dE1YZFpqa0k0bGVlY2R1dlp4cjRxVjNZ?=
 =?utf-8?B?cEx0M2k0WFNkVDNSaUM5Qm9qRWViRHV5eW4zYzhGMUM4Z1FmeG1CYnU3eWRr?=
 =?utf-8?B?Z1dnWG1JanNQZjFOK2VmVVVHT3hJeWZVNTNQSlJTR1RLZUs0WDdjeENLeWti?=
 =?utf-8?B?bVY0TVIzaFpoZ1lmSzUvU2tmMjZuTUVDdDdUd3ZZbDRQOEFmQ1haY0hJZ0Yx?=
 =?utf-8?B?RzZrLzArWldwNnZNNlRqSk1NSXl5ZC83a2xLeXMzS2oweWw5ZzN6SUxwTDRS?=
 =?utf-8?B?dTU3UGNQV1gvb1hKSk50OVpNNjkveGk5S0ZaZDdGMEErWjRuOTVFRldVbFdt?=
 =?utf-8?B?VlBod1d5L0lQd0VSUXBXZTNpSXlZTGdJUWwwSDNhN3FFNWZEdGdZblpSR2tZ?=
 =?utf-8?Q?QyDKRw+8hVXlP/HnDlzbd7QtDfr45VCKVJC0jWp/ko=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 05:04:20.9431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8c0f2c-6d69-43f3-e146-08de5d618824
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31098-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7D1C58FEF4
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


