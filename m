Return-Path: <linux-gpio+bounces-27899-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8901CC2581D
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 15:16:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6BB424F90F9
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 14:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 222D934B682;
	Fri, 31 Oct 2025 14:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="knMJbhJm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010067.outbound.protection.outlook.com [52.101.193.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E042376E4;
	Fri, 31 Oct 2025 14:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761919700; cv=fail; b=m4KLrD7EazLtzlpLLND4Es9TrulsaBuTls7V4DSc4rdUmbuCzzXb7vuwVrvicwCCrDRqBw74Jft0NA3m89shFKmoDFCG27+ok7VnfMzERB/YOeqNFeZ85kXJU7UGeaYr9NafID1Ygs06qaSkR0x2bsKzO/ZcB5r7ae/7ysqjr+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761919700; c=relaxed/simple;
	bh=K7G3udHPamOIpemxXwpyNe2NCfzd1rLXph8WXJnIJ98=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=KaBWHDEvt9wwYciVJyz3e/R9Rz90pWydKDx++zUtzbpmtJX9JvYvKsdOWW59ZH0UubAdwtEX2b8i2iS3NzFYS2GYtToko3u12HIdqoonUvWphbza0Lc8Tu3uiKK3NQ8FBsavVlA7W8N5Ye5JkkYDWN9E11zN1j0IWQLGT1vkqs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=knMJbhJm; arc=fail smtp.client-ip=52.101.193.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmgWPesAF1aUs4hu8FLyg/AZtwNDdaGdhKipzHhqY1Hd6Gto5qsUXFlPA0DwGdh3wvjCWc70Jj9OMLRJw6aUwv7Y++a8y57tiFjFbSBPhUqkDaa/iakXOxNTX/0549yjGCLtV3Von2yPG1bT257EXJ7WkXb9ZlPP8U5cbdS7fb2ljkLMb7lulpCNgl3xhhGOd9qAVVhvntKOpjh5d+J9FsW6+o5PTvLfKAnv942K3SE1kjodweRl/rtutEB9Dh8k083d5+y2f03MIUHmo1ce0VDqjtMeK+yFNK+/th/3X/ZzEIWPk8G/+VPnNNa3fusHe2RK1em0Sdb4PC7MrLL+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cZT3toUu7p7spWU7lt4usK4s3bpIwE/AsUa4eZIjfI=;
 b=sOaEsAZ1BMUe0YT8QCOa2yIEuIprDzeZMMhZ6GvvLYEz/9gdA+UvYqLTPgYDUjVg9WpWRAy3iTdurnerMuajok7fkiiPDKZRYWQ+C7RyH55eISKmidrY0OmoxsFpgo69rWvmgE2nTTMhIqFMuYR8Y3AkhOSv+DDoKdCfzh3WiqD12PIwFtmCHukuZxvfOvSK1PjyYlfsNm+DOZ9XIe3IV0G+t10uNbZMPOUVKJY6S3goOPyHpamj8q7uPVgxYPkLpk8roQtlkwvQ9cqAHkcpmKBbZvi//XLgzbUV9Eg/jvMSIS4FLDHSRT/S3x3Ruay8Jeo+lCacCh/SwyEn0zukSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cZT3toUu7p7spWU7lt4usK4s3bpIwE/AsUa4eZIjfI=;
 b=knMJbhJm8f4ES0AMlC9zbTDigXG4R9ucVYxxkc5B+mRf1QnFWbFQ+N0GtbMUnkuNcbsanLNjlP1wK6ImnhO1EZtSstvZZ07+ua4GE5GVdXZu+5n8tKVQD1KbtA1MsL3kwuy5nL86/ifhw7plLGvKknyGrbqYBVcHtGELY1KzGdQ=
Received: from MN2PR20CA0044.namprd20.prod.outlook.com (2603:10b6:208:235::13)
 by CH0PR10MB5193.namprd10.prod.outlook.com (2603:10b6:610:c4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 14:08:14 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:208:235:cafe::12) by MN2PR20CA0044.outlook.office365.com
 (2603:10b6:208:235::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 14:07:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 14:08:14 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 09:08:07 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 09:08:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 31 Oct 2025 09:08:07 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59VE87lb3982029;
	Fri, 31 Oct 2025 09:08:07 -0500
From: Bryan Brattlof <bb@ti.com>
Subject: [PATCH v7 0/3] arm64: dts: ti: introduce basic support for the
 AM62L
Date: Fri, 31 Oct 2025 09:08:03 -0500
Message-ID: <20251031-am62lx-v7-0-cb426be9d6ee@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMPCBGkC/1XMwW6DMAzG8VdBOTdTYuLY2WnvMe0QglkjrWWCC
 nWqePeFSkA5fpZ//4caZcgyqvfqoQaZ8pj7axl0qlQ6x+u36NyWrcCAswBGx4uHn7tOMbjA0rV
 Mosrz7yBdvj9Dn19ln/N464e/Z3eC5bok0FjDa2ICbTSyBcZYU8vdxy2/pf6iFj/VryZspi5GO
 ktWiAMCHYzbjTO0GVdMkkDkQhMkysHgbvDFYDGuQZLIxOLhYPxugrWb8cXUGBiQk7MNruZUrb9
 w+IXQYvTJG7R7f57nfz37/COVAQAA
X-Change-ID: 20241220-am62lx-ca9498efd87e
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Andrew
 Davis" <afd@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "Tony
 Lindgren" <tony@atomide.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	<linux-gpio@vger.kernel.org>, Bryan Brattlof <bb@ti.com>, Dhruva Gole
	<d-gole@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5236; i=bb@ti.com;
 h=from:subject:message-id; bh=K7G3udHPamOIpemxXwpyNe2NCfzd1rLXph8WXJnIJ98=;
 b=owNCWmg5MUFZJlNZS8sWyAAAaP///7//Q+u2z2e/7u/f335f/17//c157nbd9tme7rlru8+wA
 RrLRD1ANAAMgAA0AGmIAyAaAaaAAAZBo0AAAA9JkDQekA0PKaHqNqaHqZHig5ANADIDyg0NDRoA
 0aDEMgNA0A0AAyNNMZQANAekGmmINANMmRpoDTQA0MKqGJoyDQDRo0NGnqaDRoDQMhppoGgaGgN
 AyNAADJkwgA0BoAAGRpkGhozUGgSJ4Rh0VgCHgZXDodtrxwR8DOKGo5lXLRb0agX4C1eDUcUxr3
 Wz/KdCDlZ4NmAJrKZf0pkpgEQZAXP4RXOdPJ9gN4EWii40KH0fQmekj5An33tksde0wqJO+dhOf
 V3UX6Rm1um8FA2yO9qOas0dowEnQWCqyuEH0A7p9kFfCuFgmUiL/AQhNl8wICCBzpPeDN6a5ko+
 Bn6Fcz0qZ8h+3Z6OH5+4YACrHUp0KarCH8TIxzM+eREU7cPdhlzYPEQEQu4/MbhgVCz5VoRIsyQ
 MrVLW59Mi4H3CSLFD7Egfoio87hXfi0bjeZ98vz4zqXIadpStJnBWfphTrWgmJMHSA3dcHnCzjV
 sORn4yREfpMwH9gHFxK9eBE94+0oRpR5RImIPgDtqA2YYMNN2rWJISIpYR+alGcNTpoCMjSoh6L
 FI7+h6v4H/F3JFOFCQS8sWyAA==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|CH0PR10MB5193:EE_
X-MS-Office365-Filtering-Correlation-Id: c22878b7-d58c-45d4-e873-08de1886eebc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|34020700016|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0h6ZHVZQkZ2UEVtaTF4Nkg0ZWNMdUsxU1E4ZGdvOGZEbzJPN1ZFK3B6VUI2?=
 =?utf-8?B?WTZrWU1OY1dHYm53YjcvS0hHZHE0bVJoVmtSSnk2OXU2L2ZqT01hSVp6QU9i?=
 =?utf-8?B?YmZxdzFnVEdUb2h3d0dqUVM5OGpDdjdsSkFxenlLVmErekdRL0lHYUtQTFY0?=
 =?utf-8?B?QnJ1K2V3eUl2dXk3dTE4Ry9SdjNTYVRkZUJVRzdqMFM0SjAzU0xLQ0N6ZGMr?=
 =?utf-8?B?UXdvYzRTZlUvYmZGRDArM3VLU3o2cTRJQTBaV3orM1RVTlJSMVJTQTl6K3BG?=
 =?utf-8?B?ZXNqK1VPTXdMY0NMckFGTUVwM3U1a2tpRy9oVm5BMGtSb01XT2R6bVJockxQ?=
 =?utf-8?B?YVF0Ym45cCttcHM3Q1dCYXJWaVZ0UnJnalV1ajZ6cjZKTENuQXNmM1NCV0hs?=
 =?utf-8?B?MWlQY3RIeUhpVjdKWm8xWXBFd1BtZjFJOVU0T0NKNkFKazQ5WDd6ZVNsQTVY?=
 =?utf-8?B?VEs4a3dhYUZmb2Q5dGlERnVnY1BsczkzeEViRG0zTFVtWVIrdG94OGJidW05?=
 =?utf-8?B?N3hpanpMWEl2ejFWdjNXUzRoRStEQ21qcHUrdDk3dzdDOU00RytTUmVUcFp1?=
 =?utf-8?B?WDl5M2hLTFdyWW5NbUNxc2VqZ3BTcEFkSVlMMVMyK1BLSkkvSTYvSUVnOTZY?=
 =?utf-8?B?djRrZlVFRU9TWkJnQmFCZk9oY2tteFRiTmtaLzJYQklqZGVuTDhFY3VKamVL?=
 =?utf-8?B?Q0pUUTA1VG1tZnYvNDNSWTd0MWFvN0o2azJmeDh5RXFydWxVZy8rVXROOThK?=
 =?utf-8?B?UTBCTmhtSUk0SS9uSW5oRW1Zbnl3YURxcXh5a1RyMHhxL3A5ckF2QzZxYjZM?=
 =?utf-8?B?TElzSVJWcFg2K0U3elc2RjRxK1hVK1g5NTlJTGhmd1BRQzR5STZKOUJsdTFv?=
 =?utf-8?B?RG1BZndPcHZUM3loTVdLSHJvbG1JTFZ6enBTb3V1SDJISE5rTEE3ak5sTGdR?=
 =?utf-8?B?MHkvSm5jdVNpRGRRUzk0WXhiUUJQMzhpT3RoZ0hTclJuQks1WGg5Y0tvZmpq?=
 =?utf-8?B?dHFHTDlLQ1NzaFNjaHJZWEJSRG43OXoyaVVTNGl1ZkEvMkQzMjl3L0VZSXZY?=
 =?utf-8?B?YkVRU0RlaXEvalBnOWdtZUU2R1hJWkVlVVhGbFhnQzI4Wk9EcXQ4eEhyVitP?=
 =?utf-8?B?OFZ2aWJDdFVaNEpudUlaU3BnTFdlTWdsYW5DZ3F0cXZpMHFYRmh0NkxtanY0?=
 =?utf-8?B?cjB1OXJJdnZYQXlWcHp0eENvU0svMUlCbDBLdlZuMk9raEMrOUJBVzU1RWds?=
 =?utf-8?B?U01pZG0zdktmR1d6UnhTalQvRk15UXZrbk5sU0ZETjR6MEcvSFFpZ2VKcUps?=
 =?utf-8?B?VFFsRkN5VmNReCt4Z21JbzMycTNtUXZhdjk0L1hTcU5jaTVpSkpzUkY3UGFT?=
 =?utf-8?B?UCtWanl5b3JUbDNUei8yWjhvVnJzZ3p0Z1FsWVVVcW5aNGdiM3NUK0tldTl4?=
 =?utf-8?B?MnpNNVFPRmZFckJhaEl3cjhxdzdzUy8wOVNmR041ZHR6anpIcVJ4bk93bjZ4?=
 =?utf-8?B?TzZDTnI0ejQrOE1DenQxdUpuQVZhOGNHdGNmdyt4WWRqOWFCazVBdFFWK2h2?=
 =?utf-8?B?VmtYeE00ckhSVFhnM05jbndrZGRSK2E1ODVjbUJKbWxQS3NoSTJLM3BkT2li?=
 =?utf-8?B?ejM4aVpiQy9PV1pFckhHMFVJZUZ3THp1L2Zob2lmMC96QTBoK2hWbWpQVUtU?=
 =?utf-8?B?K0FPeUV6amQwaDhpOU4zZEZUd09wd3Bqa2FXckJtLzluRHZrQ2ViYVZoYnhE?=
 =?utf-8?B?OFNaVm9FdkVDSWNvM2lrY284RnJONVdnUk5sUlIwQytROUNCZEg4TDVFOG8r?=
 =?utf-8?B?dWk4ZmhZR3hQeEY1RlNGWCtISEJHL1B5MTh0dWFjbmdQZXhOelRPckdVb05U?=
 =?utf-8?B?TzVsNUhCZ1dKQ2ZDd0MyUk9ZNlZaZUd0V25BcW00ZnlFSnlsOEdOb2hpRUlp?=
 =?utf-8?B?dWVKajU2WTU5NXBEUU5QK1czZzA4YklwKzV2L1BJUm1sSXRDV2tHenUvSjlj?=
 =?utf-8?B?TTRUR3hUU1ZhQ0VNNmFVUUlhQW8wWXkwSnlEYlNHRXhLTnduZFY3am9YS29t?=
 =?utf-8?B?eUFOdko5dTV0YlJoS3M1TXB1TFFQS3JUcWlGbVdYSVhoa29kWWRHY3RzLzhQ?=
 =?utf-8?Q?1i5E=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(34020700016)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 14:08:14.2520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c22878b7-d58c-45d4-e873-08de1886eebc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5193

Hello Everyone,

This small series adds the initial support (currently just a UART) for
TI's AM62L SoC family.

The AM62L is a lite, low power and performance optimized family of
application processors that are built for Linux application development.
AM62L is well suited for a wide range of general-purpose applications
with scalable ARM Cortex-A53 core performance and embedded features such
as: Multimedia DSI/DPI support, integrated ADC on chip, advanced lower
power management modes, and extensive security options for IP protection
with the built-in security features.

Additionally, the AM62Lx devices includes an extensive set of
peripherals that make it a well-suited for a broad range of industrial
applications while offering intelligent features and optimized power
architecture as well. In addition, the extensive set of peripherals
included in AM62Lx enables system-level connectivity, such as: USB,
MMC/SD, OSPI, CAN-FD and an ADC.

AM62L is a general purpose processor, however some of the applications
well suited for it include: Human Machine Interfaces (HMI), Medical
patient monitoring , Building automation, Smart secure gateways, Smart
Thermostats, EV charging stations, Smart Metering, Solar energy and
more.

Some highlights of AM62L SoC are:
 - Single to Dual 64-bit Arm® Cortex®-A53 microprocessor subsystem up to
   1.25GHz Integrated Giga-bit Ethernet switch supporting up to a total
   of two external
 - 16-bit DDR Subsystem that supports LPDDR4, DDR4 memory types.
 - Display support: 1x display support over MIPI DSI (4 lanes DPHY) or
   DPI (24-bit RGB LVCMOS)
 - Multiple low power modes support, ex: Deep sleep and Standby
 - Support for secure boot, Trusted Execution Environment (TEE) &
   Cryptographic Acceleration

For more information check out our Technical Reference Manual (TRM)
which is located here:

	https://www.ti.com/lit/pdf/sprujb4

Happy Hacking
~Bryan

Changes from v1:
 - switched to non-direct links so TRM updates are automatic
 - fixed indentation issues with a few nodes
 - separated bindings into a different patch
 - removed current-speed property from main_uart0{}
 - removed empty reserved-memory{} node
 - removed serial2 from aliases{} node
 - corrected the main_uart0{} pinmux
 - Link: https://lore.kernel.org/all/20241117-am62lx-v1-0-4e71e42d781d@ti.com/

Changes from v2:
- alphabetized phandles
- corrected macro and node names for main_uart0 pinmux
- Link to v2: https://lore.kernel.org/r/20250108-am62lx-v2-0-581285a37d8f@ti.com

Changes from v3:
- added more nodes which have been validated
- added link to data sheet which is now public
- Link to v3: https://lore.kernel.org/r/20250109-am62lx-v3-0-ef171e789527@ti.com

Changes from v4:
- corrected copyright date
- used the ranges property for the fss{} node
- converted control MMR's space into a syscon{} node
- Link to v4: https://lore.kernel.org/r/20250407-am62lx-v4-0-ce97749b9eae@ti.com

Changes from v5:
- added new compatible for the am62l pinmux driver
- increased thermal trip point to 125C
- reduced size of &conf its correct size of 0x380000
- replaced dss with display: s/dss@/display@/
- expanded chipid to include the JTAG_USER_ID information
- removed nodes requiring parent clocks until sorted in firmware
- expanded &wkup_conf length to properly contain the &usb_phy_ctrl
- moved back to &wkup_conf as a simple bus and grouped both 
  &usb*_phy_ctrl into one syscon node rather than individual nodes
- Link to v5: https://lore.kernel.org/r/20250507-am62lx-v5-0-4b57ea878e62@ti.com

Changes from v6:
- moved thermal-zones{} into the k3-am62l3-evm.dts to allow other boards 
  to select whichever thermal nodes trip points they wish.
- removed dss{} for now until binding doc is updated.
- Link to v6: https://lore.kernel.org/r/20250912-am62lx-v6-0-29d5a6c60512@ti.com

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Tero Kristo <kristo@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>

---
Bryan Brattlof (1):
      dt-bindings: arm: ti: Add binding for AM62L SoCs

Vignesh Raghavendra (2):
      arm64: dts: ti: k3-am62l: add initial infrastructure
      arm64: dts: ti: k3-am62l: add initial reference board file

 Documentation/devicetree/bindings/arm/ti/k3.yaml |   6 +
 arch/arm64/boot/dts/ti/Makefile                  |   3 +
 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi        | 582 +++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi      | 141 ++++++
 arch/arm64/boot/dts/ti/k3-am62l.dtsi             | 118 +++++
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts         | 362 ++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l3.dtsi            |  67 +++
 arch/arm64/boot/dts/ti/k3-pinctrl.h              |   2 +
 8 files changed, 1281 insertions(+)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20241220-am62lx-ca9498efd87e

Best regards,
-- 
Bryan Brattlof <bb@ti.com>


