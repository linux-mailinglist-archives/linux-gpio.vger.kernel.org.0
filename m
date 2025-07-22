Return-Path: <linux-gpio+bounces-23654-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93288B0E4C9
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 22:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 966046C594F
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 20:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990F6285CBF;
	Tue, 22 Jul 2025 20:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="jq+Ad8rS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2102.outbound.protection.outlook.com [40.107.237.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C307C287278;
	Tue, 22 Jul 2025 20:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753215385; cv=fail; b=UMFiywhBZMLs52pYf3mMOK/iyZJmgHs+/aj1qUyXWG7DxAFZClP6WEs+AGqqV5VApsMaxkKavxtY2IMkTwwuErq1Ou32OFXjC2UebgNd54m/OMfYSzUON/5MOD0msBdpV5s1J7mAODSeaPa9ENhQKhF8yPHIK6rYW5feQgxIVqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753215385; c=relaxed/simple;
	bh=wasBNtUEn7bp/0zcFhO21l4GoYcsVPb4OUeNpfZS2j8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sLXhEAShVW+rYMwUElzAnkMPLdE/nQZjF34h2cOq5a07jW1MVk9lrQlw5GX0M7bgo5eEzR2xRnws09gl+egksUb+nyEu81U2mp/lN4lfD4DpqNoZtmBrS5YraxFXFmg7jSaYHDV1rUYjsPuWoI5YcsLv+ZQ4qui5r2hUOL4nU4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=jq+Ad8rS; arc=fail smtp.client-ip=40.107.237.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKwFy/IiqWjEfhKV2w7Aa5KrXH3sr4NmgaCy8pbxtR9YtShzaAAzsg9i/gmG7kxENKQcHvsIaJ83u/KHoxqXIS4DCzLpMwUo8416xiMvMkM8puDQZcThTgzWf6kLylkDUcCRhwn0evyraGe1A9CGCHlizCb6Qk5ngkChTvxWGDwBCiDwmtItz6qPfUyC4kgcA66QlyJGUoYik+NHVMXQXyt/R5y+BwB0Rfu8TXta5i5vu7g9FtZuJZzt3le1onrHdV/QMB5cuZD9d4X8OIwi82FBhTZqMkiZm167uNO79m0oxla4gcPyfpN8+MsVDwNoz6zKnfOc6indwkKPhpo65A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEIMn8KbBodtPsyGOKZRn3S+q7LI0uFCEfEjI4itVoo=;
 b=T1RSwI5+TCgDHQIOcOn0w5cwN5cykGSRyhKK2Cx4vyhXlPBrIjXskSxn6hAudSvba46BbcuxhC11OFqE6xmjcxpAx3pkYkz7TdIBqV+Eyur6pZSkfPl/tBzj0hLntuDZxM0gatBbjg5Q03Rwf4ulHE/zLkogYvkUaH/JfhPRPFbJe9N9n8sRmJUOL4VZVAj8hEaKyB9EobXZLUJQh02x/noEdZIXXXGPX6Ogod1VkyIeMWJIiYpZJr2k5ZtynbE05WlUh5+5w5OsEINWY5gYbVvl2b8W6c+QOHTF5E0e6YbvJ9ch+xbhx+y5Z7+HcuCp4lr0sum1OQWenknwe+AIOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=arndb.de smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEIMn8KbBodtPsyGOKZRn3S+q7LI0uFCEfEjI4itVoo=;
 b=jq+Ad8rSJk1mdh0Bcay6QdkTkUGAecHyapoEZZ2TkWBEWiGy+dMtJ77ipytj8/VlDpMwXGX4HFo07mx4/zGUaPvlyqAzhAsJo10z5TfJt+hVp85pUH9tiy2lHj1Y+2+gea7DztMk2L8IkVH8qsks/SDVaN8djIcasWHyA5zBYdCKY1mRgYM/YU6YqylyVQyM3Kb3zd/zJ3JW/dGmcCwGtabo6E3QQ6p+zBp5xyywm9dxaDMeDCOEwS6B27NTKviKEi8NKrtLJkSctWkwuykODeAXEVp4QtG1qLUsl5Ih+OBnPuHM13Ql1OgX6lO7ra1eQ9rWC20EfearH4Dl29jDLg==
Received: from CH0PR03CA0024.namprd03.prod.outlook.com (2603:10b6:610:b0::29)
 by SJ0PR18MB4494.namprd18.prod.outlook.com (2603:10b6:a03:3ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 20:16:20 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:610:b0:cafe::8) by CH0PR03CA0024.outlook.office365.com
 (2603:10b6:610:b0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 20:16:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Tue, 22 Jul 2025 20:16:18 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Tue, 22 Jul 2025 13:15:38 -0700
Subject: [PATCH v6 10/10] MAINTAINERS: Add entry for Axiado
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-10-543979a60ccf@axiado.com>
References: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
In-Reply-To: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 soc@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Jan Kotas <jank@cadence.com>, linux-serial@vger.kernel.org, 
 linux-i3c@lists.infradead.org, Harshit Shah <hshah@axiado.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=hshah@axiado.com;
 h=from:subject:message-id; bh=wasBNtUEn7bp/0zcFhO21l4GoYcsVPb4OUeNpfZS2j8=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBof/GEBiobqdW6/akV0qP5Mqib3RJ/WTd6xOHQr
 LnUKSckGWyJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaH/xhAAKCRDxWHMRoTLV
 +/9VDACPtMCQDCl5i3YKK46wZKIoV4z4wUBIb2/lS+o5HrkVwXHiNSfifSQ0tBoEsncJwErP+b3
 cjimpB5ZQkGaShPUjhB8YYPf/XwQjqeBu6kUhruCYE7/LFBlzqdNl/WkUmAKdImoMS4VkZtD2nh
 11HGfDCkiw5RRieWkZfHbi4OHh1XYoySdCkXVIiNEnLljsMQUsApeOWp7pT9IKxDqrNMMRklj7B
 FOtKI1yqhivnMXuqwAAvTfA43p4xE3qthThPI6NxaOctA2zIGWOVnO4txwWCEJ2soPHW3o3TGHf
 nRkfdBDyx3oBdoly83S4afCs3Ienscj1osH5Id4JmFWf/f+FV2UlcRJyXrBnY8rFSTpT512OzlB
 EQkG1EryKxd11l2d/KmTFyTuAAbVpjosIjFvEADrsiO/KB6v2uuHMsnE2xRx2PdNyuyWu9NLXN9
 1HmPhUyLGPpJwQcI7J8M5WC3VFeb6KMaI67R/BN9TlyFpin0BwmDN3ytkUA0yyr61CbJA=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|SJ0PR18MB4494:EE_
X-MS-Office365-Filtering-Correlation-Id: c959c725-b9a2-4399-956d-08ddc95c9eee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|7416014|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXhWcW5nUnQySFJSQ2tVa0dzdUlvUTQxakxnNW90cmxYTk1BaWFqTnVBNUxV?=
 =?utf-8?B?NnNueGxURDBGQlR4Y0xwSFROTFc0NU95Yk1oKzRqMFh4aXZIWmN4ZnhLSlBi?=
 =?utf-8?B?d0ZVc3hWYnFjeHBCZTB6bk9jbDM1ZFZZTnZQeWpEMnA0ai9NcGVsNWU2c1Iv?=
 =?utf-8?B?OXBzb2QrSTlVOFQ3S0NsenZTb1h4Y2ZKSkl3K0o4UnFNRldZd1dlMnpLZlph?=
 =?utf-8?B?MTRqZ3VENWt4TVdUR2ZKSXVrYUtSTzY2dXJET3FHcGVibmp5dk9qTDF0WEE0?=
 =?utf-8?B?MnB3WEJ6aGRuZk4ycGRpR2FRdDhvTnhyWG1ydzhWWHJSS2IrTGNGbXpqd3dK?=
 =?utf-8?B?MWpqTUJLeExKWUFOY1VQVG1OaDRWMGdUMGJPK1UxZWc0aHZiUnhRQXVBQ1dn?=
 =?utf-8?B?MjBQRDRxNk8wdUxTc2RSZUlUUnpXQUVLWnBUdXMrNS9qblI0dFpuZDJGb214?=
 =?utf-8?B?MzVXU2x3UFJVcUp6MTNJK1MrMTRseDNIUzc5SDE1bEtVWlllbjViZStFOE9k?=
 =?utf-8?B?WTBUcEkxcnlGSENvcm5RVjZjWWUzU1JRS0k0VU5MZGpONDBFZjhYdks3OGo3?=
 =?utf-8?B?OFdmTWIvNzVEdFhwNThtVWtYRHpGYUkrNjRndXlSMmk4SjQvZkJ1YzhyYmZR?=
 =?utf-8?B?bUx5UTBwN3h0ZTJKUnJUOEVMUUE3TDFDRC83M3kzeWY1aFN0WXdkL2dVT1Av?=
 =?utf-8?B?QTgxYy92U01DNE9hbzNvTEg3UVBZaVdrZFdscjZKbWhKR0EvbU8xWTEySFRO?=
 =?utf-8?B?NFBDalJJNkRIQkF5b0ZIN0dxb0xLR3BMVGRYMEtyVlphbFpXUDM1eDhVQlEr?=
 =?utf-8?B?aHh5eDRwcEVDQ3VVa05nd25DTWdwcVRCNlF3T09wdTRJUC9SQzc5b01UY25K?=
 =?utf-8?B?dTliUmhKa09jRW43c3NlZmFTVlNYdittUDEyakVHeTVFZ2RtT2JkL0l1VnRL?=
 =?utf-8?B?MU4zcDE4VXFoWHpmaHNzUUVDNGV2aDl2ejBUNHJLTitJYkhtR3ppY3ZXNnEw?=
 =?utf-8?B?QkxwaXE1bEE4YUpJQkV0aUhjbDdzc3pFLzNuQVF4QlRNSTJDNUJBV3o5Z3ht?=
 =?utf-8?B?Q2FDT1lNQzZFcDlqSkVFMFZxY1FnMkNnVE1WckcyL05Ic2d4UVlENW0reUR0?=
 =?utf-8?B?RWJQNVRBYk02RjMvekhtZjFxbjNORWI2RjVTNlp6Vzdhdkt1eXpVNUZSYk1K?=
 =?utf-8?B?RE1qUE9nRFRac0lZdkpibTdpQzdxU1pUYTM5cFQ1OE5vQ3JsSG55SUVsSzEr?=
 =?utf-8?B?b1JkVGVHbVhkMmUxRUpoUmg0Q0k0WXRRbFE3TmhKcTlMKzVCem9vYkVGVnpW?=
 =?utf-8?B?ZEtEbjdNdmdPSWZ5Mm9DZlUrOW9vM3JocW41aVFRQ1RRMkJPYzE2KzVsZGNR?=
 =?utf-8?B?MG1kVGhhRVh2OW95cTNYZVpOZ0RuK1A2MEwrV2JoSm1zZU1acFVpeEExMWtK?=
 =?utf-8?B?c2dtS1JseWhaeFY0TDgvZVoxT2NHUllMdUNsZkFiOFJKOGJzRzdXVGxWd21E?=
 =?utf-8?B?NXlYK0ZFUTVVUUg2Mis0dU1xK0dTSWYyT2cxM1hzZVg2NzYxNFAwejlZM0lv?=
 =?utf-8?B?cThVcmRlU2I2TG43Yk9rKzBuMVRzdGtjYnlKZnhzTmtLYkFQQ1BodmhXYTVN?=
 =?utf-8?B?WWQrUmRnb00xZ2ZpME40d2daVllYQWRnOVI1L2dwL1QrWUlGVE11eHRkdURL?=
 =?utf-8?B?eWdQaVdXVXlRVFVFSFJwTitCUy9qakVJeE0wRk1lZUEyNkQ2RC8wejdxUEIy?=
 =?utf-8?B?WXhwRUtLR1ZJMmZoKzJiNTNrcXdLQW1INDFSenl3THdLdm9pSGRDY3Z0Z3Jq?=
 =?utf-8?B?NG0xdjk3YWlxVlZ0b21id2gyOTFkMk5YR1JJam1nT0NUOW15bkE4QVhONkpN?=
 =?utf-8?B?VkRsMjUyOVNTZDI0YzBuMmFuc2sxeTlmRW1uM0MzZ2U2NU4reHdLTkNYMlNj?=
 =?utf-8?B?SmhlNnhHQytyLytRdU9XWVhnbmRNWGRKOFpxVGVEbExySUMvMmxRRjVySDBv?=
 =?utf-8?B?RG1oSEluYi9IaXFvTWtqWkRqZGppMHI1VDY4RXZINmUyYVVVeGVlM2pvVSt0?=
 =?utf-8?B?aFVnUHNoV3pVVkdma0ZhZnJLSXNjWDdBSnhqUT09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(7416014)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 20:16:18.8119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c959c725-b9a2-4399-956d-08ddc95c9eee
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR18MB4494

Add entry for Axiado maintainer and related files

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0c1d245bf7b84f8a78b811e0c9c5a3edc09edc22..7a04bee308cda1d8079ef61d1c0c68bafa89fa12 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2414,6 +2414,14 @@ F:	arch/arm/boot/dts/aspeed/
 F:	arch/arm/mach-aspeed/
 N:	aspeed
 
+ARM/AXIADO ARCHITECTURE
+M:	Harshit Shah <hshah@axiado.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/axiado.yaml
+F:	arch/arm64/boot/dts/axiado/
+N:	axiado
+
 ARM/AXM LSI SOC
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.25.1


