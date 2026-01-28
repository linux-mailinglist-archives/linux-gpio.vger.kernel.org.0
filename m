Return-Path: <linux-gpio+bounces-31200-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gInRJO3OeWnezgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31200-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 09:55:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E70D29E7DE
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 09:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56F31301185A
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 08:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C704333ADB2;
	Wed, 28 Jan 2026 08:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XcT0De8w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010062.outbound.protection.outlook.com [52.101.46.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED4733A70A;
	Wed, 28 Jan 2026 08:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769590309; cv=fail; b=UFC1mdBGAzQmQzT46IuUS1/htpT/o5QwqF36iYPw5HFmvJAKwKfswUTWpipd8p68Od20c/W6ZEw5oNt6z0ST6qza6wg4uKrbgDFPtI31+XuY2BrW9+Bro1rdESjgGITc4vnOC2pqNxoh4esIEHOA6MfyBsBBDisE11043acSziU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769590309; c=relaxed/simple;
	bh=LaUPdwZu2toxeLjah6J5meVqDo5uTfr0rtLW2J9UV90=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q7rj2f1n1eUAdmkywOOCu5R/JhCnzXbb/kbWEtijzBXiUcLnN4QaFq4jhFkvgZ+I6upLJPUhyyT4Jvy6EVREmxUsliGQOm2AczaaIlLvRHq3q4XlzQdcsesWnl53g5FFHtW3jLxT0cB8SStVJ5GBLQyvKjNFv5nblkUYUaY8jxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XcT0De8w; arc=fail smtp.client-ip=52.101.46.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QLzcnHd24zsSqtApfkxwXeYUUOTFlxqSQrnvA11tjjM6dQKINs735XpK4k2dGcUELnC4LrDxO3zcVHtuNSdoQJ9hLAKAq69ao2WUMGFEgfGxyHj8DW7Fu86LYZFr0o47ZWoUW1XIKo95MOQx21q9yGpewA9zjQpb643X8jMdVPYuRkbQoueNnPmvzpPxQpi3s/6nKOmMj1/dkExfXPOOCkZoX/5fq4zt7jc0f2GhdmDYltZCXNH3UndwwfIDJ8QbO4kXGSRPOnfAvYk7Gl6fkUiRahDhhlBDwC0GVljkkKrH4c8VCVbt2767k9jrO7Vjz04li6jhEkqpj0EO76AYsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csf1cJNQ7vqBjg0ez48uHATBXIQMHxCeqL8htsnYOVU=;
 b=SmA7B5loZ5IptSsnMpALY+1nEHBa4L/ORORFtkAFsjprG4yV121OwiYWnl4weGtcx3g/Nowyi7qQxq9rDDZAapSNQpVQW9TOtmiL3UZZK9CIkuwbZBPWvIs0Qn54jSWeqI79q7uhV5HFsIKHolhpQ2puWJhLn5UI8KA7djPlyPQn0byZ95WltGJLX/yfOrrXVpPDl3+76tVv4TgTq0B1hnZ74u4WKn9WZXBl5vcLs5aGs02NXxaoz0h9WYvRC3H4BpjPgAJDWjCm/XbxqvhAFqV8/OWEZauL0OgabSFct2fS5MWEL0K/+nT2KsE35uJyLjj1Mm7lyoD1xCAeAD4dmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csf1cJNQ7vqBjg0ez48uHATBXIQMHxCeqL8htsnYOVU=;
 b=XcT0De8wbRpcQgdvTDKSKvx0zT8A9b87IdJ0mHH0elTWRjpNTXgqvIntbIkpt8kg+TxzQOz+8j5BC79xKy2tMJrDaVbBuKIEnkglQ4HTKd0uhf9rZKnzOXlgVf9YC76+5lYobEGgT/PqLqHhYoodfUzTNdjlXmpPxfQ6dIqOVS9lKD21Zqf7E682YVUc1vpAvBfrfmB2oHeWx67iA05SIxe9VRPRyGyFt3ZZBGse8MnIxKb1FkHLnbEdxQJKX2Xs4diBEiDoe/iEMNkF76O6rjnSnTH+Hp757m/jXV8GpndLVxIy1e3qpeEaIIRGFzuKH5Ky6oRI0Jg4U155Mg/leg==
Received: from MW4PR03CA0121.namprd03.prod.outlook.com (2603:10b6:303:8c::6)
 by BY5PR12MB4146.namprd12.prod.outlook.com (2603:10b6:a03:20d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 08:51:41 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:303:8c:cafe::57) by MW4PR03CA0121.outlook.office365.com
 (2603:10b6:303:8c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Wed,
 28 Jan 2026 08:51:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 08:51:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 00:51:19 -0800
Received: from localhost (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 00:51:19 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<robh@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>, Thierry Reding <treding@nvidia.com>
Subject: [PATCH v5 1/3] dt-bindings: gpio: Add Tegra264 support
Date: Wed, 28 Jan 2026 08:51:12 +0000
Message-ID: <20260128085114.1137725-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|BY5PR12MB4146:EE_
X-MS-Office365-Filtering-Correlation-Id: da07f2b9-1f32-43e2-81c5-08de5e4a74a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QkJubUp4Z3U3WEh2WVJNNC90ejd0MXk0QUFJWWl6ZHFVM1l1dC94NmgycEpm?=
 =?utf-8?B?MXJwWVRhYzRaVnFIY0JKSE1NdWNubGVpdThscGRUVithMGZDOUhlVTVCOUJz?=
 =?utf-8?B?QzlxWFNDNGluczZIZUFxMWR5VmFjUmNPWFRQcTZJcUxuRE94cWk3NmFDaXhS?=
 =?utf-8?B?Y2JiblBjdjduS1NaQnhLQlNtQ1ZPWDkwOTNQdUNIQ2tRRlZ1TFVVUy83elFT?=
 =?utf-8?B?NGphR2tKNkMxTlptMEE5NUpTeWxvQ2tNR080R1VpcnM3RTFCbU42RGFtblJL?=
 =?utf-8?B?a2ZEY1ZKM3YxWnNmSUFXU0pKWndLWTh4MVhjN2dNNTFuVWJ1M2dpV1k5TTli?=
 =?utf-8?B?NmNuaXVYRnROWmJvYjAxdEU5OXdvVXBNbExCUW1VN1c0UlIvRTZ3QUNBNVkr?=
 =?utf-8?B?b1dCOUFuaEVhK2JFSlR2WlMxUkNiMUJLZkJnL2s0VjdwQU8yaCsvZXJiblhF?=
 =?utf-8?B?dU9kUnBzcTBpclUzZXlqUzNCVDQyejVlQnhzU2F5ZDBDNURmaDFLVUdZSWJw?=
 =?utf-8?B?VVgxRnhrY2U2b2lYK1BQQ05TU3FmbDhuckJNZGdZdG5Kci84aEhjbHlCQjlo?=
 =?utf-8?B?cHRHNVhxTE5HOVVxdDRaY2lKNnBqU2o4dnZ4Q3B3bWdMOHloVVZoUXMwRU12?=
 =?utf-8?B?WEx6RmVYR2JjUzNNWkJDOGFndVpseUJMNktTZ2llZlBCVmV5UDVlY0Z0MmpJ?=
 =?utf-8?B?eXdHb0xWWGhwVTFDRjEyRFFrR3hVWkxtS0cyTUlXWlVUa2ttdWRaSVdNOXFt?=
 =?utf-8?B?bVg2NzQvT2NMM0QwMFRJaHFBbi9KTkgrSjhIWE1FZUQxZ0JzWXVXcVRXSXNX?=
 =?utf-8?B?aHlLUCtvdVB5dVJxTVFwclgwVCtUMW1UV1pYVlpqRVNXNzFMU1NOaWI2TGxq?=
 =?utf-8?B?TzJvSUNGV1RScnkrOXV1TnFMU1pYcFdRRlBkTjJENG1LaktOaHpzSHRublh5?=
 =?utf-8?B?TFBLSGVQTDV3L21tWnQwZHJzN01nbWdaQ3ZOM1ZYUU5IOWw0VDRkUkYvcEZY?=
 =?utf-8?B?OGd4MzVUWm5lMUsrd1ZaUHk4M2VCY01hZkhWSXQvWmV1Y0MwNk16Z1hNR29X?=
 =?utf-8?B?UzhEejBlbVEwbmNSbDlLQy9UbFI5cmNoMGFMaXVNSXZlODhVRnhsOGlYUUkx?=
 =?utf-8?B?ekJ6dnREM1lYZmFqdnRTakd0SGFmYXJieTdsTWRiTFlJOGRNek9Za25qS3Jo?=
 =?utf-8?B?aU5GamhNYWpTbVZPK0thMG9VeEhUQ0l6aWRveERrN05VSWJEZmFtbnB6Wmg4?=
 =?utf-8?B?QUlEblJVNUZlb3VSN2tWb2s4bHM5dkFDcWx5Z21xYU96ZWh4V2ZNUDlBa2tS?=
 =?utf-8?B?MGFBQytJSGJBTDVpSkxxUzVvazNGdXg5eWg1M1RnQ2NGUTkvS0NYbGtiZTR0?=
 =?utf-8?B?cEsyL0k1UlZTL2sxOGhCbjJVOHdVb1QxQ0x6SG5zVXAwUW1QM3VVaWxtQUZ0?=
 =?utf-8?B?WTlzTWNuaTlnbVZHN0JtL3hRVUR1T3UwZ0h0R2lXaVAveDVCSjAwb1czRnRr?=
 =?utf-8?B?NlA0MlRRVXBXYTJYM09nN0R6Zy9lMkVjdnZkZmNEVjFpZnNPVVhzbm5PUFA1?=
 =?utf-8?B?ZHYySzZBMHByLzExdWR0TDN1aEd1YWZEV1pYY01YM1JLcVROZ0RSV01sd05z?=
 =?utf-8?B?Tk9XY0Y1eTZhRDlFSm9wWFpJVEZ4bWRnYTQ0N2pjdGM1OVNkS0RjbW9ENGZi?=
 =?utf-8?B?OGJ6cG82Vk1SakxmRXBQSUFleG85Qm5WMGpoWm5tejF0UXByVzUzZFFuS0Fp?=
 =?utf-8?B?Q3dhMUxNcWE5akRNZHlaREFmOEE1SUNjeG1ab3Q3UC9UeGw2bmV5Zm1lS25H?=
 =?utf-8?B?dFRwNytVL05jKy93dDZHTGxXMU16N0RrVnVvTWxFUmZaWGlVRjVsaEpOUi9o?=
 =?utf-8?B?SXdCVittUGJoa3NabktpTHVoZTFIOW0vZ25TVUZadDdpeW5jYjU1elVMUmRl?=
 =?utf-8?B?NENIMDRxQ2V1ejFRVHE5NFEvKzNmZkZKZXZqQU9NR1Y5WEVIZjZUZ3B3cTdy?=
 =?utf-8?B?OUhZZllEMTNWZ1FUdi95VnpXWlM5bktjMU5MMFo3bGM4M0F2eWlSQmljc2Y0?=
 =?utf-8?B?bkRmM1NyRHlFY2QzN1BuaHBGODZTbUpyUnZDeDc5UUZjZG53VzFTaUMxUjVO?=
 =?utf-8?B?MytCbzlKbTR1Q0tGMGlxNVc3ckJXc0t4Y0tRV3BCT2NBdXlyMGdtQ1lzMmhu?=
 =?utf-8?B?K2VlQzN1WFArSGUyZzRBays3OVR1VlVaNE5ud05vbk1jSlpEVGdpM3Z6YkUw?=
 =?utf-8?Q?Sa6P0JUTgAvIZfyZqF+09Oxs3OOggDN9CeddR8QHZs=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 08:51:40.9220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da07f2b9-1f32-43e2-81c5-08de5e4a74a5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4146
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31200-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E70D29E7DE
X-Rspamd-Action: no action

Extend the existing Tegra186 GPIO controller device tree bindings with
support for the GPIO controller found on Tegra264. The number of pins
is slightly different, but the programming model remains the same.

Add a new header, include/dt-bindings/gpio/nvidia,tegra264-gpio.h,
that defines port IDs as well as the TEGRA264_MAIN_GPIO() helper,
both of which are used in conjunction to create a unique specifier
for each pin.

On Tegra, GPIO wake events are latched and routed via the PMC.
Document the standard DT property, wakeup-parent, which is a phandle to
the PMC interrupt controller that provides the parent wake interrupt
domain for the GPIO controller. If the property is absent the driver
falls back to a compatible-based lookup.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
Changes in v5:
  * Update commit subject with changed header file name

Changes in v4:
  * Drop local $ref for wakeup-parent (use dt-schema default) and inline its description.

Changes in v3:
  * Fix DT binding SPDX license to GPL-2.0-only OR BSD-2-Clause

Changes in v2:
  * Update DT binding to use “wakeup-parent” (drop custom nvidia,pmc).
  * Require “wakeup-parent” for Tegra264 compatibles in the binding.
  * Rename header file to "nvidia,tegra264-gpio.h".
---
 .../bindings/gpio/nvidia,tegra186-gpio.yaml   | 22 +++++++
 .../dt-bindings/gpio/nvidia,tegra264-gpio.h   | 62 +++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 include/dt-bindings/gpio/nvidia,tegra264-gpio.h

diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
index 2bd620a1099b..17748dd1015d 100644
--- a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
@@ -86,6 +86,9 @@ properties:
       - nvidia,tegra234-gpio
       - nvidia,tegra234-gpio-aon
       - nvidia,tegra256-gpio
+      - nvidia,tegra264-gpio
+      - nvidia,tegra264-gpio-uphy
+      - nvidia,tegra264-gpio-aon
 
   reg-names:
     items:
@@ -110,6 +113,10 @@ properties:
       ports, in the order the HW manual describes them. The number of entries
       required varies depending on compatible value.
 
+  wakeup-parent:
+    description: Phandle to the parent interrupt controller used for wake-up. On
+      Tegra, this typically references the PMC interrupt controller.
+
   gpio-controller: true
 
   gpio-ranges:
@@ -157,6 +164,8 @@ allOf:
               - nvidia,tegra194-gpio
               - nvidia,tegra234-gpio
               - nvidia,tegra256-gpio
+              - nvidia,tegra264-gpio
+              - nvidia,tegra264-gpio-uphy
     then:
       properties:
         interrupts:
@@ -171,12 +180,25 @@ allOf:
               - nvidia,tegra186-gpio-aon
               - nvidia,tegra194-gpio-aon
               - nvidia,tegra234-gpio-aon
+              - nvidia,tegra264-gpio-aon
     then:
       properties:
         interrupts:
           minItems: 1
           maxItems: 4
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra264-gpio
+              - nvidia,tegra264-gpio-uphy
+              - nvidia,tegra264-gpio-aon
+    then:
+      required:
+        - wakeup-parent
+
 required:
   - compatible
   - reg
diff --git a/include/dt-bindings/gpio/nvidia,tegra264-gpio.h b/include/dt-bindings/gpio/nvidia,tegra264-gpio.h
new file mode 100644
index 000000000000..63a3541c2fb0
--- /dev/null
+++ b/include/dt-bindings/gpio/nvidia,tegra264-gpio.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/* Copyright (c) 2026, NVIDIA CORPORATION. All rights reserved. */
+
+/*
+ * This header provides constants for binding nvidia,tegra264-gpio*.
+ *
+ * The first cell in Tegra's GPIO specifier is the GPIO ID. The macros below
+ * provide names for this.
+ *
+ * The second cell contains standard flag values specified in gpio.h.
+ */
+
+#ifndef _DT_BINDINGS_GPIO_TEGRA264_GPIO_H
+#define _DT_BINDINGS_GPIO_TEGRA264_GPIO_H
+
+#include <dt-bindings/gpio/gpio.h>
+
+/* GPIOs implemented by main GPIO controller */
+#define TEGRA264_MAIN_GPIO_PORT_T  0
+#define TEGRA264_MAIN_GPIO_PORT_U  1
+#define TEGRA264_MAIN_GPIO_PORT_V  2
+#define TEGRA264_MAIN_GPIO_PORT_W  3
+#define TEGRA264_MAIN_GPIO_PORT_AL 4
+#define TEGRA264_MAIN_GPIO_PORT_Y  5
+#define TEGRA264_MAIN_GPIO_PORT_Z  6
+#define TEGRA264_MAIN_GPIO_PORT_X  7
+#define TEGRA264_MAIN_GPIO_PORT_H  8
+#define TEGRA264_MAIN_GPIO_PORT_J  9
+#define TEGRA264_MAIN_GPIO_PORT_K  10
+#define TEGRA264_MAIN_GPIO_PORT_L  11
+#define TEGRA264_MAIN_GPIO_PORT_M  12
+#define TEGRA264_MAIN_GPIO_PORT_P  13
+#define TEGRA264_MAIN_GPIO_PORT_Q  14
+#define TEGRA264_MAIN_GPIO_PORT_R  15
+#define TEGRA264_MAIN_GPIO_PORT_S  16
+#define TEGRA264_MAIN_GPIO_PORT_F  17
+#define TEGRA264_MAIN_GPIO_PORT_G  18
+
+#define TEGRA264_MAIN_GPIO(port, offset) \
+	((TEGRA264_MAIN_GPIO_PORT_##port * 8) + (offset))
+
+/* GPIOs implemented by AON GPIO controller */
+#define TEGRA264_AON_GPIO_PORT_AA  0
+#define TEGRA264_AON_GPIO_PORT_BB  1
+#define TEGRA264_AON_GPIO_PORT_CC  2
+#define TEGRA264_AON_GPIO_PORT_DD  3
+#define TEGRA264_AON_GPIO_PORT_EE  4
+
+#define TEGRA264_AON_GPIO(port, offset) \
+	((TEGRA264_AON_GPIO_PORT_##port * 8) + (offset))
+
+#define TEGRA264_UPHY_GPIO_PORT_A  0
+#define TEGRA264_UPHY_GPIO_PORT_B  1
+#define TEGRA264_UPHY_GPIO_PORT_C  2
+#define TEGRA264_UPHY_GPIO_PORT_D  3
+#define TEGRA264_UPHY_GPIO_PORT_E  4
+
+#define TEGRA264_UPHY_GPIO(port, offset) \
+	((TEGRA264_UPHY_GPIO_PORT_##port * 8) + (offset))
+
+#endif
+
-- 
2.17.1


