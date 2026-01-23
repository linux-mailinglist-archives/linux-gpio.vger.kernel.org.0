Return-Path: <linux-gpio+bounces-30982-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNEkBdlEc2lEuQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30982-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:52:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D7273A3E
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:52:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB5C9302A7E5
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 09:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2CD376BD9;
	Fri, 23 Jan 2026 09:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LP+IvMuN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011048.outbound.protection.outlook.com [40.93.194.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8D535DCF5;
	Fri, 23 Jan 2026 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769161926; cv=fail; b=CMpe+TVvBMKWdQbvMGQY8scOtSID237fRvk8LivgKVFLnOEKKLtaXwdm8lCq+iGcQCtuXC5F3yLaku6ApSxBuMdyiwe1yEOiDwQSSJ7JdTLPqr3sXg24+HRc0h/9mMQDsrIAQqXiNP4SC+o5xtsfpxmDehXtS7cvNwVYVVddPCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769161926; c=relaxed/simple;
	bh=044D9XlTxrs02Sy1EaPlOhDtVXdZOBC3pjVTahmY3E4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uj2Af0aKwKJmM2d9gsy+vvk90/ifgtUr73lzHBJd/6LcmEbrHF4Nff4KFWu0I1qjHH7+Zb0526x+BlrIq7a43a4QPJRmacIyivHv108pbc1w32etm76voMiM5pjs/Jq136g2t1GWdYfhmLuEhufWV55HR/KyEqHpSYhKZ6KGhCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LP+IvMuN; arc=fail smtp.client-ip=40.93.194.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fpU1JThqv3HKpyJkQwgGethJaypT/X/ZyhR0LTd+ZPer6jHVSmuX8ZYaUQaEZYXn4Wgu0pYl09snWZNDIEP5S6dyt1Vnb/5GZcCZQvkjRw+mEiQv5F4J2AbplAHUmfkmlbu7zVeuPQVY4x47TPFvyDkUevpXQ/cf1lrE7S0+/x8BT/qTsU64LQUq5pjsS875mSEYGm0pdu1yuC0HZqn1X0a9E++UA2Z2tYnmeJ+WWyZne+K2FDuMcVgJgUcuuwa53OtNSbr+9AU70SBwP94G/ZJw7OkBFskEJQwKkWTzLydn7NknSOWV7GeKjyn6UVRuSkBV+oAVGlPmXIkL19ZnWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noqUG0bgzb0Mz26bny+vYut7xyNQTS0q20oZpC/B5Os=;
 b=b+jXr5lwww26kSiBTKs6mgHqu496bE3QxdS6EY8N/AehQAZ3Y+Cgo/H7W2AkuJdJtWvjQkzUdSBa2d7bdtpsRIdZ25aPcZKEZZJN16dRzI434GmTEdxwlWEyiB+YG4mvg+QH4rL03WwvDLAfe6WwjEfbyFUlX+tpwQDQUC1kWbdmgwSI7Hww70W/w6ZqucShgrNzE55Y/Cf+NNj6qWaKUD10FOAvNZaxrIOFnPN9lopXgnosJJFMyEhOInuNCCmpaIeSIxpcW3w/SXw5OiUcEn3xCrVNeJDGM8R/+WyxpeHmY/Rei8oKWpBqEGyQK1fjIpYMmw4bNacToR7XwLeiTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noqUG0bgzb0Mz26bny+vYut7xyNQTS0q20oZpC/B5Os=;
 b=LP+IvMuNEfPjAE20YF/zhZmvQfnIeyrSDkXA9+ocYOFppQy1T86qBB7FjHR8zEvcyaTDpmSGSyktvwoFoFdoGX1DL5LJgS9w/lKBrEvs1CIfoBdcQAZYmKz8XySMY37F7tO05NAVsQijU96F8JJWtNl1+IRpNzaZEAn5R0AFBseQX/g+bs0qA1DCbH9C8AueUVZlV6lBQIkHiX2i7+VLAGWS2PTt851B9+PFgPELAue9MOpFsqW7qEWtIZwPi/doG24tY/6y9fRx7vXGpuyMD4k5RyT/P0GO9Y1dyfSf2DScLwV2ybhWEKDOl0aqVWmMN8lHycpe02YXuu0F61j2Jg==
Received: from DM6PR06CA0071.namprd06.prod.outlook.com (2603:10b6:5:54::48) by
 SJ2PR12MB7961.namprd12.prod.outlook.com (2603:10b6:a03:4c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 09:51:39 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:5:54:cafe::9b) by DM6PR06CA0071.outlook.office365.com
 (2603:10b6:5:54::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 09:51:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 09:51:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 01:51:26 -0800
Received: from localhost (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 01:51:25 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<robh@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH v2 3/3] arm64: tegra: Add Tegra264 GPIO controllers
Date: Fri, 23 Jan 2026 09:51:03 +0000
Message-ID: <20260123095103.1108212-3-pshete@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|SJ2PR12MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: 8143c3b2-14f2-4ffc-0b3c-08de5a650157
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjNYU3daMnp4YmZzaDkvKy9OOVRHcEVtUllEbEZua0hzVlg3QVZsRTFZTWxB?=
 =?utf-8?B?QlpzZmxESmlUNDlGM3F4YkpSSFYvRUhsOCtJdXE5ZUdjRDFxYU80d2NHY3p0?=
 =?utf-8?B?emcwbVB1d1NnWEx5dzhVbldxNU5Ob1dEb0krNUg1cGgyVmRYQUtQTzFtL09O?=
 =?utf-8?B?WGxRaUZZQ3d0WHpta0N6MytIM1V1aDBqY05JYmR5Tll2TFdYREZXSUpiZnly?=
 =?utf-8?B?d1k4TDBJMWZiSWkvSnRhN01aR1dVREFvTFR5RFFxNFNFMXdUWDIzMXB5VzFV?=
 =?utf-8?B?bEovTzhXdzRGbkVhUE9lNC9xMmd4am5SWE15c3d0N3BGY2tTeGdmYmFHcVJw?=
 =?utf-8?B?eFVJTG05SWtCeDVpdFQvMElWcStORWVXY2VleGdkNVpJSUZBY3Fid2R0OElO?=
 =?utf-8?B?RHFObVdQNHhWRFNwcmdCQ0Ruc0JPYlNqR081MUdvc3NRZExDV1ZUWDBIbUVy?=
 =?utf-8?B?bkcrRVFPbUt6NUt5ZHZMTGt3S1FnQlhmeGNScVRuUFUzNFBJT2prRWhxRytN?=
 =?utf-8?B?cmZha3U5NC9DV0lxbUFWbTh3SFZVbUFMLzQrY2J2S1JWV1plZysvOEkrb2lU?=
 =?utf-8?B?QXA5dUxpR0JLQlk4djB5RDhRWHhNNTdnWDlZckZDakRWNmFXYTJFYmNHUkFv?=
 =?utf-8?B?TGpST3pVU3djbXI0eE9pN1hTeHlxSU5Xckp2dVZ5aVFGakZGWW5jaXUrUytE?=
 =?utf-8?B?cVgrSDdaSHV1WFFIT2NHdVN1Ym9ydU5sOVhKUmxxelpSK3JzSWlybzcrSEhq?=
 =?utf-8?B?TGVTSlVJUGdMbFAwM0cxdGtiSUJqN2UvdS9NZmE4UWpqdEQzN21pajlZR0tD?=
 =?utf-8?B?Q3EwVGZOWmRvM0hnWEJMa055RlJ1cnpqbTVnZFRFbWxuc3NHZDdiR3ZpWk9n?=
 =?utf-8?B?Z3ZneEN4ZFI2amVXVDd1bGorb0Y1UURFSE9UUVVjcDNTZzhya3pJNjdJcGxO?=
 =?utf-8?B?R3NSNTJUdzh1SjhSTWxxNGlleUxMWTl0aUttWEZEbzdPTnp1SjRTY0FGS2hp?=
 =?utf-8?B?NThoSWYyanFPZzVzWFdDZUJXYzZrdk4xdVQwOGkzTFNFWmQ5anRIY09teW9K?=
 =?utf-8?B?eUtIWG1wN3ozYytqQ3h5SE1LVkpMY0RoRU9ZRktxejVsdWFIZzFQZHIrK00w?=
 =?utf-8?B?ZGV1M0NMWVlMamFkNE5vbTNVRGJjeStVWncwV20yWU03cEExaDM0NlhVSmd5?=
 =?utf-8?B?aUJRQWk3eWlZTWVWWnNiS1lYTkNQQjVmaTUvRTU1cUo1czhId0k2aUZnUkda?=
 =?utf-8?B?bjFMdVhGMk1vb212N2hrVndCeEVLS01ULzRIdUhFeGhYQVhONXFKZU5iUjNt?=
 =?utf-8?B?SitsNVRqQlRnK1F4U1V3SXBFNnBlZzlTWnFiaTZzNG8ySFNwSEIrNE9vdGla?=
 =?utf-8?B?RHhYL0pHc05aRG9KOGJPSHYwTTdyK1p2T1ZVdnNIVWcvbGtUWndMWWwrcWNW?=
 =?utf-8?B?YXFmSng1VU8xUk1QWlhKVmdUcHplV3VNdWNiR1Z4NFJIK3l5QjVpQXc1NkUz?=
 =?utf-8?B?QVA0Ym5LTi9wdHEwdExZdGRmZUdwYU4rUUFWNlVwdG11MFdXbU9sdGVFTjE3?=
 =?utf-8?B?UWVzTENRaVRPWVk4Y2NYNEJJcm1JaDhhVElnei9BWUJrcXZ3ODdialI0Tmxx?=
 =?utf-8?B?WDdDOEZUb245UzNaSnFVYUdKdEUxeVR5RkVRVlFmTjhLWUhFeWZLQjRhSFMr?=
 =?utf-8?B?Z3lKRGVHQXpDNU1HL3QxdzlldmIxbUZqdEFsSDdyYUNhYm9lM3g3bk0zNmZ1?=
 =?utf-8?B?cFVHbXlONFBxa0s4eEt5YkhxaGdNUW11RE9qbG9VU3FyNGZJYkU1ZlA5Szl4?=
 =?utf-8?B?UTB6SmZaZTBMb3g0dmpQMHlVTzE5ZUNoWEkvaFYwUFlzL0hVODRsc3I3WHBO?=
 =?utf-8?B?MlJyamJsdy80UW04eWFFei9aQ2JLSHU5UG5PSDdwcmRZUTVZd1luOTd2NERt?=
 =?utf-8?B?czl3R2xQYk1aZURWU21yTjFUOTYyNG5hTkh1S2Q2VVJacmpqNVRGRmV5eU1M?=
 =?utf-8?B?cFdmSW1UNG5PdFhiNTR5R21TRFVqUUV0MGRselZYdHFwMVhLN2xWeTFIdjVM?=
 =?utf-8?B?eC9NUDhyUmIyaHNLanhpbm10MXVzZDl5bXcvSnk3NWpUL1JGQW8reW8zUldM?=
 =?utf-8?B?ZFQ4SFdRQmZnL3M5dUtjTCtNSE9tY1ZKcjFQMUtJTXF5cHNhdnh3dE9CS0lr?=
 =?utf-8?B?TzVzc0Q4T09rTTNOdXZWQ0xuNkF5OFdkTWFMR29zRzdCVFZBdFN2d3A4MEFr?=
 =?utf-8?Q?xyHPFa9qNcSnfZ83zYl2AY+ufkHEFdnczCts3gp12c=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 09:51:39.2342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8143c3b2-14f2-4ffc-0b3c-08de5a650157
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7961
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30982-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cf00000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,0.126.165.224:email,c4e0000:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B7D7273A3E
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


