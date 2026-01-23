Return-Path: <linux-gpio+bounces-30990-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJm3H7BJc2kdugAAu9opvQ
	(envelope-from <linux-gpio+bounces-30990-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:13:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 115EE74115
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:13:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 05C393012E80
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E753D3803F7;
	Fri, 23 Jan 2026 10:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WHrK8pQm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010052.outbound.protection.outlook.com [52.101.193.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B9A2BEC43;
	Fri, 23 Jan 2026 10:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162952; cv=fail; b=jDrKO0CtwqrPtwQ31PsbXmjRaTuESxkCM93Sh4gWcDVdmJz0VsT4OSFSXKiK0nriCFhXy4PRPvemH9KkCZOUCT29EQibtw4iw8MfZgxCXFSNrgKDjP6Gn0P7JZB2TpvJZZ5MoMf7je7TMzOKVAzo18O8WAofoaMYMUqmYs4CP7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162952; c=relaxed/simple;
	bh=044D9XlTxrs02Sy1EaPlOhDtVXdZOBC3pjVTahmY3E4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LvUVOtCgWwOYIpq6jmyrrUReWl+SvO9NE7BVmhCMTSEBkpUyFEG5j66YPOFZUftTjUHSxWFec8n9g/O+UjIIANn7PlfbBMqpQ5Nd8YNvdeW4y9OPRfOXr2e+pt79gz95HWX0dTXRxD4kXVas/sUrwLEpvoSeebzbDuXCYIyW6do=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WHrK8pQm; arc=fail smtp.client-ip=52.101.193.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IK1MdrL0yAan1ub9ebN9G+b+9sGbfM/NGpCBq5AJAIzs7Y19FlemKFoBiE9yHHMyqJuRM3mLDTGKnJEG48k9CkJXCuLMmppm710E7Gmx4+S1PDw7xxUUqIPbumpbS6SNjhldZ9xFNQmp2UNPDTyWsAz23DLvAzb8Ha0p8RA8uP55SO+YnQw0ql2Ykq2iWpx1/cPM+XfoLyek1WZCVdv2rsRbVwrHJhLGttNGz7owJZrYmBdARI5Z3MVANr6ODRAEEphhauFAZYjpwYc+/Rwftcl4gHL08RRh6UAMNZG0hLIHt7LMEgFOKckRhDAkxfuYiksE/DGVGe9uTmeGuIZXyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noqUG0bgzb0Mz26bny+vYut7xyNQTS0q20oZpC/B5Os=;
 b=e6+Oub21q6tD58aDQ+XktnPpO7WhM+u9LRsDCDg/l54X0Ax44/ftJs0cVW19NaxYWdK9CFPvqJYn1/zbS2qvdi6o4FsmPwDsvFqm0vPrRO2NZuwC2s34AdsEGs70r0gj2nHKW8QiV00GHulUhKlRWDt2hbbShYqrc2y1bH9Z55IT2Sqt6lwQvx+ksq1jGH3aUNJCO9YBctd9qW677ztQOhXxccRLy9XiXPoG1mm6xxJOyqybTj9oadGIrNPGtn4qoGrePOVzfP9qro13QEktJTDVTx+rLBrvUM9dqSYJ3CsmM13oBPRUYJziob5B+15ejVZwTdcDEBN9uwj6IF/iTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noqUG0bgzb0Mz26bny+vYut7xyNQTS0q20oZpC/B5Os=;
 b=WHrK8pQmRPmvY3c4qvrvGTPyuiKi/zjDU5BC2hJOybNRnION6r2JSzbTU0DO5avhzeeo9tC91CEZDBydpbIC96edg1UgMKOuGH4rnQWRLpiwRm7Qg98VWyHuN6AanOz/qHKzjDnn9kf+rWkH6Zj7pNO8MeK3uf156Vs/1Jcv10nQY+9eM8swhusgL+v1NfGb3MQhKxckTgLvt2wLLebbwHqwmwHff32KRN53DbKo2ldLOeBQlw8SedzbexdU9AflV3aMi1ll146Ujh/V8sCSWuboRn1qVryYXjTPHHwaGlyYcMPA4zfnP8bsifN6d8ZDruem4r5cmMcwVMpABz0MjA==
Received: from SN6PR2101CA0018.namprd21.prod.outlook.com
 (2603:10b6:805:106::28) by CH3PR12MB8404.namprd12.prod.outlook.com
 (2603:10b6:610:12d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:08:56 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:805:106:cafe::9e) by SN6PR2101CA0018.outlook.office365.com
 (2603:10b6:805:106::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.4 via Frontend Transport; Fri,
 23 Jan 2026 10:08:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 10:08:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 02:08:44 -0800
Received: from localhost (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 02:08:44 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<robh@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH v3 3/3] arm64: tegra: Add Tegra264 GPIO controllers
Date: Fri, 23 Jan 2026 10:08:24 +0000
Message-ID: <20260123100824.1109150-3-pshete@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|CH3PR12MB8404:EE_
X-MS-Office365-Filtering-Correlation-Id: 27d3886a-8160-4ee8-265c-08de5a676b12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkloMVcvalNiODFDNjNXU2hsUnpLbUZPaXZvVHFZUW1sN1pDYnFaaktCYnRX?=
 =?utf-8?B?VnNzNE1QcHgrbzdGcHNIVjlqcjVWN1JCdEFNVm9wTGFMYWMrd0h0VmVsMjhn?=
 =?utf-8?B?UzQzeEFjQVl1M0xWc09tU0Z5WnJoelBsY0Vkc3UvYmRubzV6WndsSjR2cmJn?=
 =?utf-8?B?UFVVdDRHQjZOZnpMV00yWWpIZkdaU2ZtUnl0RXhTczRKVUFaNnp5a1VOTlRI?=
 =?utf-8?B?Y1B2Sk1MdzV3ZjFZaTFzcUxnSjFEbllVSmFYYkRmSUovdkR6Z1o3L1hrOWo1?=
 =?utf-8?B?a3VaN2daVVRTN3BUd3NyWXlOcGhORW91cmtNalNkTXN0UGp0dWhqOVRLQmh6?=
 =?utf-8?B?WTFiZXNtQVdNUUNpd1RTN1ROdVBNTzVLTFZPNjJ0bElqcWp1YmRPb01LODZ4?=
 =?utf-8?B?MzdVRndla0IweTFlbXdpblVFOSs4WWNya051eEREYXJ1QmloMFh2V1FRbVJ2?=
 =?utf-8?B?dGo1K1ZndVAzOTEyVzBKaHovcVBxd0hzTWw0YVZFc0RYb1JIQmJUb3V6T2Ir?=
 =?utf-8?B?dGZ6cktIWUUrMTNJM0s2bC9md3BpTUpZVjREQjc1OGJWWDJpTU1hcUJrNG5w?=
 =?utf-8?B?QkorKzJ0Q2Noc3FkL0dDOGt4QVgvMDRMOUxMUzRjN1B0UXVWSmNBV00zT1RN?=
 =?utf-8?B?UzFzMEFDa3M1STVvb0swK3ltRTErdGl5RWYvcUgzb0dZVDZoemx2NDEyUy8v?=
 =?utf-8?B?ZVYzOG5oT0ZzZWhIcFlrVkwyNUxQdVNwMmVFanBhakNKeVZEeE8rVVpiZ1NM?=
 =?utf-8?B?cjd3aDhUMWthai8zcURkemdUVk5URTN1YjdOcFpwUXorcFhTVS9sWlkwNmIy?=
 =?utf-8?B?eHBZWkxwU3MwQTd3dTkvMW9lYWI2ZndDN1drM0FSc20xK3BTaFFlWERXWjhR?=
 =?utf-8?B?Q0lYVytsaFE5NXc0ckVqMGZzd1dTeEJaQnRoaHZFWXRoZW1RQU9lSlFPa0JO?=
 =?utf-8?B?MXVrWVdUMVBOVWVyWlUxUkRxZFdzRUpZazZNWTc3cVlaeEh4cjNxdXdvUUFw?=
 =?utf-8?B?YnFUOTExY3FpV0RFRE9YYmRlZGlqUEl5YjlaVjEwVDBBNE1TZHhYdDdmdUc4?=
 =?utf-8?B?WitNQVZQVFFVN2VtNVRZV01TMThRRWZYUmtueWJ2eDQ0QlNuWkF2Z3ZhbGpz?=
 =?utf-8?B?Q1FnYlVNYXowNmNseE1XbzJKcmlEWlM4bWUyRitHMEt0NkxQNE8rRE9YRnJx?=
 =?utf-8?B?RitOK2hadlFYbkJ1eUhra2dndnVtOUlrWks0WGtzcWEzZ0hLb2UxUmMzVExp?=
 =?utf-8?B?eVQrRlRYQlFkTWRkaUFCTlhQWWNOaTdPZHVHeHhoNEVtajR5ME81RFkwNkZT?=
 =?utf-8?B?THR2UDVYcmNlK1dSZXBrYzltZlBkN083Ny94eFczQVI0RmhOYnBGWmxTWTNC?=
 =?utf-8?B?dFhLOVZBdVNXdnRjc28zVmllU3hCRFZsRFdJdXl3cUQ2dkhRVnppTURLVHVO?=
 =?utf-8?B?eWwzdVRhWisrZmR3VTV5elphRVhUSDV5YkNFbFE2UXpZQmpRVXlneVdMMFU0?=
 =?utf-8?B?M0lGRXl1RnNXbVBvdzc1UnFvS2pESEVuc09NWGJCUiswUW1HaWt5SGJ1MHJ2?=
 =?utf-8?B?MlJibUZQUllENkxaUXhTTW1wVkVsK2xpNm9uUHNKaHRGdzBFbE1HQTVwNzVW?=
 =?utf-8?B?cnRnUGpnemxodFBoaTU0V2JUVEFsNGtXSytFa1J5YUJDVUNzaUpvK0pwZWU2?=
 =?utf-8?B?dlAvMEFpUWwrY0VzVjRkNWlFMnN5V0ZJWURPQjdjVEZXTkNxeWdhcWQ4UlVs?=
 =?utf-8?B?VXRKeDJjYVE3R1I3elF4N3NwTlNXT1ZwT3g3YVdhRDNMbSt3WEhBVENVSU9w?=
 =?utf-8?B?aDJCRFNsRXBHdkxMbjhjMGJUYU50VjZrWGlTVUU3NjhZT3ZDUkJtRmErOCtj?=
 =?utf-8?B?WWkvMkdjQzdvRTN1RHJPcEZPakdvRDNUZGVvdHhmbUlmbVp1c0dyOHJjTVNI?=
 =?utf-8?B?QjgrMVZoS0picmZMeVcvdWdCWklpdFQ4L2M3Ums0Q01PaHZ2UUUyYTdTNyta?=
 =?utf-8?B?WTZaTGpMaVk2ajM3cnFFcmlpWkk5d1o3aVhVTlhjYW04ZG5DOGNuOXNEcnVH?=
 =?utf-8?B?dVFmM2xpd2poV25QK3FIalpMTGN0M2daUjNUR2FlL3RZbUlwK29jS1JtaGE0?=
 =?utf-8?B?Y25oQmMzVkkxUkIxU04vMTJ0Z3d0Q3JleGdCUDFvWnFvZ0J3c0tSa3U4a3lU?=
 =?utf-8?B?TUZSTFBCUVBqRFE1eTIxcWo3bWdNMUFZVFh0Vmh3RkwvOEZGZG5NdngyeFBP?=
 =?utf-8?Q?sZnXaE7J+3VPG2507f1esspUeYI1UPDpf+Avvh7ZBs=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:08:55.6117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d3886a-8160-4ee8-265c-08de5a676b12
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8404
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30990-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[c300000:email,nvidia.com:mid,nvidia.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,Nvidia.com:dkim,c4e0000:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.126.165.224:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 115EE74115
X-Rspamd-Action: no action

Add device tree nodes for MAIN, AON and UPHY GPIO controller instances.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes in v2:
  * Update Tegra264 GPIO nodes to use “wakeup-parent”.
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 88 ++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index f137565da804..cf4de2c517fa 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -3277,6 +3277,50 @@
 			status = "disabled";
 		};
 
+		gpio_main: gpio@c300000 {
+			compatible = "nvidia,tegra264-gpio";
+			reg = <0x00 0x0c300000 0x0 0x4000>,
+			      <0x00 0x0c310000 0x0 0x4000>;
+			reg-names = "security", "gpio";
+			wakeup-parent = <&pmc>;
+			interrupts =  <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
 		serial@c4e0000 {
 			compatible = "nvidia,tegra264-utc";
 			reg = <0x0 0x0c4e0000 0x0 0x8000>,
@@ -3347,6 +3391,22 @@
 			#interrupt-cells = <2>;
 			interrupt-controller;
 		};
+
+		gpio_aon: gpio@cf00000 {
+			compatible = "nvidia,tegra264-gpio-aon";
+			reg = <0x0 0x0cf00000 0x0 0x10000>,
+			      <0x0 0x0cf10000 0x0 0x1000>;
+			reg-names = "security", "gpio";
+			wakeup-parent = <&pmc>;
+			interrupts = <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 541 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	/* TOP_MMIO */
@@ -3726,6 +3786,34 @@
 
 		ranges = <0x00 0x00000000 0xa8 0x00000000 0x40 0x00000000>, /* MMIO, ECAM, prefetchable memory, I/O */
 			 <0x80 0x00000000 0x00 0x20000000 0x00 0x40000000>; /* non-prefetchable memory (32-bit) */
+
+		gpio_uphy: gpio@8300000 {
+			compatible = "nvidia,tegra264-gpio-uphy";
+			reg = <0x00 0x08300000 0x0 0x2000>,
+			      <0x00 0x08310000 0x0 0x2000>;
+			reg-names = "security", "gpio";
+			wakeup-parent = <&pmc>;
+			interrupts = <GIC_SPI 843 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 844 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 845 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 846 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 847 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 848 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 849 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 850 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 851 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 852 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 853 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 854 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 855 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 857 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 858 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	cpus {
-- 
2.17.1


