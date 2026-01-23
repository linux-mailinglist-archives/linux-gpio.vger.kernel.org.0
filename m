Return-Path: <linux-gpio+bounces-30980-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGsSIClFc2lEuQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30980-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:53:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E109C73A94
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 873803047533
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 09:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC0E37475F;
	Fri, 23 Jan 2026 09:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KLcnu6Jn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012043.outbound.protection.outlook.com [40.107.209.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E37135CBCD;
	Fri, 23 Jan 2026 09:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769161902; cv=fail; b=m/mroI4VL0mlEbvJ8+8GQLXVK/KgUrp16Kk4ZP2k/hfbiL2FKhvUdSBKAalwtxoTq3/IHY0APRolEpUFULVQLZ3/XXkY/VZdJ4JDAYfT6roVq3L0rI8BtFkZcsmmbkjS5DIFExsCRl8bvgIUik8Dxv5VUo827YO3q9nmLODervo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769161902; c=relaxed/simple;
	bh=qbAT2BsTF0oRNczN1blqMm9W5+YplhKev6kOdrZTsmA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vy6e5Grs2/ecaakOoODhuxH/uDLhtBPQ/sHubiSCW54FK/T9C5Jx18d8hTt3z5VA01Onr+MR6qbQeuKPEegqIQgm4cr5Qxm5sWbRxzD46Sp8J35kowaRzN76foFCzo1tkfexjeih3Or9fhjGNzOUCuCi/rJD5CPYU3nJPQ75PQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KLcnu6Jn; arc=fail smtp.client-ip=40.107.209.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GpFLK8J45S3Nj6OJBjrf6ZCJbnzJzHbjysJNghn1+dez5XuPs9uQW0O8LddPGkhPMnpBcTgHBt1lV6EOUewMpFC3+yKeEP53nU4SYISt9ffMcSJFyqABx/MrTutGI2Kh1Iw8m8pR3eLKAnwlNzfqxCQc98l7S3a8qv7/C5Yo1aK6eGmYQIDmV9mvg58t2Y7Qk0tO3PpCKNRMtMGroR7Ovn5y8AeU75LyEkRaUekulGKuk4W9q36/7QZaJLxctQ0aWxxnB1EqVm/Yd/t4MeTGZwErBN7M9uAArJhOtS2bHAELL04s4jkzYSdGBRc6P45JTH1aaPJ5Dwx81Ozy/Zs35w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzWtxtO9n4jDol2vNQgJGRmTPKQX+RF+NqAE37zRss8=;
 b=nprOH6perpo4+cznuvgXfkAGeuADghQvIIFuP/5IRn+66XWVgO8JGvzx1Q+Vck9CNrLLXslfJagOYU/XVXtdg3XDK76EhuNsD9lBNR1nVWzCqJOGgrw56+QVZ7rOuDJGSX9HSQ7VtUZYOgDdjdUTb7uboRlrWuDCGmPvLxDyCNK2/V5vC+kAVhFO8SITZH7y/2XJvmCqdgVVaPATs2MDt0fZWvgirwb/ERd5kVqGX6KwNx+2GqR3CzbeZT2Lwn8vyVKuYJj0EEu0DkAlWcoghXA0+dK3G7om05AP76Mer+3talYp1lWDcjrc8u3gu7OhUtsI2xqe7mTbf3EMiK8Piw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzWtxtO9n4jDol2vNQgJGRmTPKQX+RF+NqAE37zRss8=;
 b=KLcnu6JnCvKLpEDnsZy1llXTW1Vemfmva1TU3N0RhcCzLqGTLgkNUrwJRoAzSfCkSJKgH0EHsfe3q1wy1pSH+QYynMT/CZ/hccKDnedeuUUdsxo61HOywUZkePoJsVt2ln5ujSGPEpMlRh/vSyndLCBCoH+FB40/+UL100P9UY5UDjT0fR/EXTnpoKkbS10pN7g94xzF5abFYGwb8MlwZT3YrDS0MqRXrD8LaFxIc1w0viQ9+vAnWQdlJc+Jt9s4ddlgbF2Lm+dH2dou7pxt+Nv2xZhJg9pM/hpDYAUiMix+x8e9K2buLOwG1EmqSOpQ6AOYArT6Oi7agPk1d3HxYA==
Received: from BN0PR04CA0027.namprd04.prod.outlook.com (2603:10b6:408:ee::32)
 by LV8PR12MB9405.namprd12.prod.outlook.com (2603:10b6:408:1fa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 09:51:27 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:ee:cafe::59) by BN0PR04CA0027.outlook.office365.com
 (2603:10b6:408:ee::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 09:51:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 09:51:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 01:51:12 -0800
Received: from localhost (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 01:51:12 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<robh@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH v2 1/3] dt-bindings: gpio: Add Tegra264 support
Date: Fri, 23 Jan 2026 09:51:01 +0000
Message-ID: <20260123095103.1108212-1-pshete@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|LV8PR12MB9405:EE_
X-MS-Office365-Filtering-Correlation-Id: 46b004a3-010d-47ab-8424-08de5a64fa0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODNFOE9laS9YOVI5YXVTcWNsUUxHclVVSVcwQi9aL0RQOGFDYmxFbmJvTWl5?=
 =?utf-8?B?ZTVCcC9jVWxwdktPRmR1OSt6c0lhT1NFd2RkQ05HS2Jxc1FGQ0d6YkZHSk1F?=
 =?utf-8?B?SDVQU0xEdkNVN2dBaFN6UWlveHN1ZXZYQWJMaGZtdE1vM05RREVJanY2cWtE?=
 =?utf-8?B?OFEwTEF2ZHlXTEJSK3VxSVpvLzlHWm1FTDI5SUpwd3VTdFR3dlQxM1Qybzhz?=
 =?utf-8?B?RlhxMFMrTmhNN3VPL0huOVZ0N1hKZWYyUWM0WjJ4bWtGVVVHVUZJZ0ducFZG?=
 =?utf-8?B?bUwzNUlwczlmM3RucmxPdFJjeXpoejlVa1MyVDlkdlJ4L3Fwd2VCWlNNR1Ro?=
 =?utf-8?B?czA3M1Q0NEVXVHBlUVRsRGRtd2pVOUxnbDRGLzdSZWZlSW8yV3hhelhpR3Fl?=
 =?utf-8?B?RmwwRzluL0FzUktaVXNnY254Yk81M1Y1OG9Sb2ZrZ0ZiTi9ndTBMcDQyY0Ix?=
 =?utf-8?B?Z2s4cjZXSDhBcFd1TjZSN09yc3lsK0pkOWVKVHQ1K2FCNE53UVFxcTBUallS?=
 =?utf-8?B?TnBSVFBvTnRCcEFBdktUNHBCbnBQekU3alA1RlBXWEVIN1NpeDNkNzZKQVRv?=
 =?utf-8?B?SHNod2ZTRnBZeWRZcUREZHlzeks0V2x5ZVAzTGQ3WHhSbVVQL2Uwc3UyblpG?=
 =?utf-8?B?L21KWFlyTkFZeWFJVkw4NDVsamJZTHBLMHRoYzEwTDVuYkRZdllidnZHeU0r?=
 =?utf-8?B?c0NQVGpaOEI2bnZSckcwWVVibzZ4Mi9IVWVkM0FJK2lwOC9WbzRnSmI1Qnkx?=
 =?utf-8?B?RGc3K0JMK1NydVRzSFduU00zbk42Zlc0RWZBeTdKbFFKMFprY3dnTGIvcGUx?=
 =?utf-8?B?MllBdVA0RU00Rk5uSDdFbUFCd3JQQ1g5OTJoeEpBc2JvWEY1SVo2VlR4dEVC?=
 =?utf-8?B?K3ZIY0tMN2MzZG1TMGZuYlhOSU9tYWVZcnExbDRpVEppNlFjNUl2aGlMM1JB?=
 =?utf-8?B?WGxDWDBhNFgzeFZPMUhkVzN4YTJrbXgzQ3RIRENId3FCby9CY1lCdGl4UGxq?=
 =?utf-8?B?akF0amUvYndZYytpbW16Z0V6SmxHZmp5SzhoTjlKa3ltOXZMYmIzOWpMczg4?=
 =?utf-8?B?UzhKM2xWVjg0TXBqbGJrOHl0WGlBa2ttb05hQVB6T1UwZWMvYVpMU1Q0cEhE?=
 =?utf-8?B?UFZBUG9WZjMwRFlqN1FaY3JBTURVTnRjZW1Uai8rWWRiRUd6bXdyQ2ZQR3RT?=
 =?utf-8?B?Y0lwTTAxUXpsbmxWTlVieEFlUVdGWmNUM05Ga1hDS2FxRzErNDczSzNYTzAr?=
 =?utf-8?B?YUd0Rno2bDZ4WjJGL0MyNXhLSjJTVkhTUXlpRzg2d3pNa21LMGVaSHNnenRM?=
 =?utf-8?B?L1RBNU9tSXZDL0lTOGpON0VKVHlreWRMV1RMQXFhU2NWTHAvZXprdlRwNERx?=
 =?utf-8?B?VkVqWlY4TUgzcEtBL01xM25TenZMZWpFVFBDWnIzWUo0eUVVdUJZQkhrNjdm?=
 =?utf-8?B?QVZDSHBON0Vrc3RNdXd0TFU1ak9TTnYyTGZaK2ZMRi9nclNRVkthb3QwdFdC?=
 =?utf-8?B?dlJPNE05REFLeFpIbU5YcmtCSDcvMkRWSG52N2k3OHFOSkR5WDhFTUZVQzUy?=
 =?utf-8?B?Y24zWGZRbkdHQ3hTN2o3Qk96bkU5MzdLRXBIWmN5VDJSZDQxdDFaeExISHRa?=
 =?utf-8?B?a2JDUnRwSk1Pelk1QndlZnFNLzNjQ3J4S25JMUg1MmpmbFc1VFNTeU1NT2NQ?=
 =?utf-8?B?Q20wQUd0T3Z5WlFlbVA4T2FJVi9vUWs2amZacG43SXdVRGViTjg3WlVWMFBu?=
 =?utf-8?B?V09FUldFOTlwOGZmd1JKYlBaQVpVejlFdUtUQnpmSkx0TWYyakRWcUo4Q1pi?=
 =?utf-8?B?dVoySmdRZlVaMkZtQWJRR3hYWUZOSnFNb2UzSDc2TlZSeXR6RWxOcG8vYlJW?=
 =?utf-8?B?Syt1TmdoRDRXNU92T1RiYlk4azVnSTRYQVVGU3k5TUNubGJ2UlREWHI5SXh4?=
 =?utf-8?B?YkRDUXJzZDhLWmluNWlReEtYa2tqdDBXUWxZRUpuVkwvbHlSS2RseHU2UUt3?=
 =?utf-8?B?elJqSkI5NnNjSDUyeWFpTURLYjR5dG52QXE5Y3I1TFg4RFNZcVkyNHNlRXlC?=
 =?utf-8?B?U0c1Y2NQS05MYU82aEdlQUZGQjM2K1VKcklpNVR5Zk1jODhTU2NsMnljN3Fs?=
 =?utf-8?B?QlVCb2p2bVdsMzRDSTVzRXBPT2ZSbVYxWldwdXVqSnpPRk5xVlVScFg0dVpG?=
 =?utf-8?B?eE9ZaGxzQTZFdnVPTHI2RFYzTlFkaTErRXFheGR2OFRwZ2YydnV1NS90bmxl?=
 =?utf-8?Q?QCyMecEhE2WYjZopp8tlFL+XYFGJszLZnrm8gzHq0o=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 09:51:26.9552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46b004a3-010d-47ab-8424-08de5a64fa0c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9405
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
	TAGGED_FROM(0.00)[bounces-30980-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,Nvidia.com:dkim];
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
X-Rspamd-Queue-Id: E109C73A94
X-Rspamd-Action: no action

Extend the existing Tegra186 GPIO controller device tree bindings with
support for the GPIO controller found on Tegra264. The number of pins
is slightly different, but the programming model remains the same.

Add a new header, include/dt-bindings/gpio/tegra264-gpio.h,
that defines port IDs as well as the TEGRA264_MAIN_GPIO() helper,
both of which are used in conjunction to create a unique specifier
for each pin.

On Tegra, GPIO wake events are latched and routed via the PMC.
Document the standard DT property, wakeup-parent, which is a phandle to
the PMC interrupt controller that provides the parent wake interrupt
domain for the GPIO controller. If the property is absent the driver
falls back to a compatible-based lookup.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
Changes in v3:
  * Fix DT binding SPDX license to GPL-2.0-only OR BSD-2-Clause

Changes in v2:
  * Update DT binding to use “wakeup-parent” (drop custom nvidia,pmc).
  * Require “wakeup-parent” for Tegra264 compatibles in the binding.
  * Rename header file to "nvidia,tegra264-gpio.h".
---
 .../bindings/gpio/nvidia,tegra186-gpio.yaml   | 24 +++++++
 .../dt-bindings/gpio/nvidia,tegra264-gpio.h   | 62 +++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 include/dt-bindings/gpio/nvidia,tegra264-gpio.h

diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
index 2bd620a1099b..b74fc3a8d80d 100644
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
@@ -110,6 +113,12 @@ properties:
       ports, in the order the HW manual describes them. The number of entries
       required varies depending on compatible value.
 
+  wakeup-parent:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Phandle to the parent interrupt controller used for wake-up.
+      On Tegra, this typically references the PMC interrupt controller.
+
   gpio-controller: true
 
   gpio-ranges:
@@ -157,6 +166,8 @@ allOf:
               - nvidia,tegra194-gpio
               - nvidia,tegra234-gpio
               - nvidia,tegra256-gpio
+              - nvidia,tegra264-gpio
+              - nvidia,tegra264-gpio-uphy
     then:
       properties:
         interrupts:
@@ -171,12 +182,25 @@ allOf:
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
index 000000000000..689cf5c67c0c
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


