Return-Path: <linux-gpio+bounces-21618-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A1CADA72E
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 06:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D078D3A56A7
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 04:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE751DB92A;
	Mon, 16 Jun 2025 04:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="W1bhSgVt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2118.outbound.protection.outlook.com [40.107.243.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5577B1C2335;
	Mon, 16 Jun 2025 04:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750048317; cv=fail; b=I2fBCAegH1CMxYEbkZlLR8okTJh562x1Dq+xRtc0+WGkGDyE80WpXckkZcU7zl1HzBjRxzPy3D4m5Dlls7xiom/fl2UZB+cj91kFXnd9z+j010lZs0F+TcTibbwln1Ix3JkSjf5kPaPNjH9Cc+5x2avpAUcdk7LTH2myL2QkWdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750048317; c=relaxed/simple;
	bh=/vBIx0PvaTFGH1SIpT+R3QSDPnyJ6rpvlbvJSic5q1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AvHb5QLGceX+/y9Fu4l8dW3uRSeh095RRnjGyPiu6LlbiN6HjZuHyxvnKKNuRr4dmYKGxgkS03JBrmzx177KqYHb9sBtRwImv0xZ0aeUtObjtiLgBRF4MRiw5uhKhlyzxfrRHCVLv1x0FDfekvHR9TaeFSzjMZ2ojeTmz/ShnHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=W1bhSgVt; arc=fail smtp.client-ip=40.107.243.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQcgY4CCC0U8syu3WD0PLGB8zsTPjE+ybruIzJvv+QGUqDtDH97qmWYNrXdaCjwHAgaIfUwZMWwAcdMlc+TyTbr8Ldk3lH3kssngmz3MIiGPSF1Ky0tSLQsdUSvVpTaxEcXYAys4gXnWEuZLmT1QcTTStQGdewWAlxAiyBfmd0/hpijXmnapWR5MOvIjmdK1sdGWitGuGoB/iyUV3p9gSoyxNg8HfaZpbn6ERVob7zYUKukIKJ3h3snFM5hE8za2BFGs1x7YlvLbGVlLruRWGr6fZkt2+lFqhE0yW+qtyEidwqZQ0a1+pDGn4RF5Atk5/9x4pHnAfl+c6kZAQpSjGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9H3iMIVw76XdEFkS0pIFzApQRXQlkWuRuscTZnf8wLw=;
 b=T2s5wBsGizVaIBHK2FFauxUt1Th56eSw5RMnaf831Gb/ukKQFjVK1M07/VaeQIjgPsvwNfZOzVdhWntB2uCzAOjvCSgzEau09MN/Ml+kVXhN+TXOrYWIB+GoKKTJPW3EZH4XqORHEENeKY9fQ2hwVLFtpkbnRbBM84wQ0cKj1nUKzB0+TwKFRSM29FOOevWrRtKTpCewMENi90cqxPvkDL0fJXm2EMYN9YGnGav7mNvujFwwlGla88gZosAsMr85ieCGqZtaOyMUhNTRfHmuP6pJVh/j3hFqnuSnH2c6umbWvP8gXj3035zAp+WKDo6cU5hbcWoAmCWns8xlr1iJhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9H3iMIVw76XdEFkS0pIFzApQRXQlkWuRuscTZnf8wLw=;
 b=W1bhSgVt0FbfxpRa55xyM2jUCHjjIV22MRmw2IywXPvbym+8SiNUKJq65i0NnM7rM2lwOYB+N//ZmP1oGpdYefJ/HaI57Jy1izqT7wnYUd+E2MApxCXJbKYeomAf36RaGdSGw1TIJ+vg5XvUlYGnHw1Rp/t8B+HDy93BUALJ1qVO6DsKdUYZI0imRoK0ooTC4SxwOmPWiaqrpMVKsZWpqQfzuMmOrBAXRuyJMOmB9kYgk6mKqPDbOOCMBjvD/Hakla88xmQgkfojGPC5Z6N8PqHr+cy2yiZkfzAgsgyjgZ+bTQ5fqITevdLTQBitXpERq/lmjOdACI5tDV2nhqVs4A==
Received: from MW4PR03CA0064.namprd03.prod.outlook.com (2603:10b6:303:b6::9)
 by CO1PR18MB4617.namprd18.prod.outlook.com (2603:10b6:303:e0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 04:31:50 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:303:b6:cafe::1b) by MW4PR03CA0064.outlook.office365.com
 (2603:10b6:303:b6::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 16 Jun 2025 04:31:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.0.1];
Received: from [127.0.0.1] (50.233.182.194) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 16 Jun 2025 04:31:49 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Sun, 15 Jun 2025 21:31:36 -0700
Subject: [PATCH v2 3/6] dt-bindings: gpio: gpio-cdns: convert to YAML
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-3-341502d38618@axiado.com>
References: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com>
In-Reply-To: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 soc@lists.linux.dev, Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4491; i=hshah@axiado.com;
 h=from:subject:message-id; bh=/vBIx0PvaTFGH1SIpT+R3QSDPnyJ6rpvlbvJSic5q1k=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoT54wW9p2n848NY0SxfvKKWAgml738gKNqTFxh
 nwLPjEUNWCJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaE+eMAAKCRDxWHMRoTLV
 ++4nC/oDMAIsqqvCvKnPOnivoVxRBrD7Ews9mDw1ypV/l25o4W7aXHfh3WO7TOLM2b5GxCe6vAq
 ZYQNspz0lb+zzU6mb37waGxSKIJk1adb4YdQFAP8Er/dlgUJhM7mkuZGGsZkHORywdwbmFrz4s6
 x9TBFoqHf2F9Mn4s9WGI9u54mZNVf6RTaH9uRJlnhAVIrT+8js5HqY1NodQxH4sxQEUsu2e/0AP
 S4ZjbEqAJRbim4RJ8ZDBuCOogtOcCuCmxivpEy50gtik7zW219vEy8rrboOyHsRrQQtVfSrjUyL
 ptMRb0eo2HWAzV1JFI/JVdfwOduKXfXOrLZbfMXQ2MTVvR/oWpyecXMswu926jlrlonJOt01TBS
 iLzMdq8h2LYdTkwL/9RsFXzHO/OxLNazeN3kYWRaFoHWrQy7hjee+WAdUb5thzZkMysXS4Ri2I5
 BDz7ynhEtq0Os4LPPHsblnvKdwz8Xqc02Cu/v0Bb5bjAaTXC1UoQVJToltYN2qp7zBT+w=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|CO1PR18MB4617:EE_
X-MS-Office365-Filtering-Correlation-Id: 57bcd786-8e7d-448c-760d-08ddac8eb645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVI1cFkxNDBtYWt2YjlLZVdlV3FnZ3puNWZDcU4yV3ZlclpBaFY3dG8vSTFx?=
 =?utf-8?B?eU1jVmVLdEM4MExvakJYT0pYdXVLU2FzaHhQdnI3UTlla1RDdGsxcExReWZ1?=
 =?utf-8?B?NW1ZT2U2dHp0NG9ZbVhFY09iVFQzcW5PMFd4dFJ1enI0OHZNZGpqQ0lMR01t?=
 =?utf-8?B?WWZLdjcyWDZNWk5KUHF1VFBCcTZKbHZqN2lKOUVKZEFzcEd2bnhzelM3dVdT?=
 =?utf-8?B?RC96eCtKeVZRdUJ4UERkOE9ZdHJwNEljdTRNNTBoRDdqS3g2bC93aU92MnU2?=
 =?utf-8?B?MFJ2QUIzYXJyV21La29UMTRSNnZLTkFMdjRObFB6ekpyVjFUdkZkUHFXT0lJ?=
 =?utf-8?B?V3FLZTVoek16NzErVUpkRkVaaUQ5VWN0aXdubDFIcTN6czFVWVQzbFQ2OWc1?=
 =?utf-8?B?ZEhpVDJ6ekJBVXBqcTcxb3JLVW9Hbndhd2NKekpXNFJsT3UyZXBXbERmc3BS?=
 =?utf-8?B?WkFobWg5bkpnZ0tySHNDMUgvMWJRR0tDVjNVSHJSS0hHSHNFTUxJRTZPR3VQ?=
 =?utf-8?B?YzN6Y2l5eURJcHVtNlU3UFlCMmVwMWRCcGRWZXV0OHlGSDNsdUJSbkdvZXFr?=
 =?utf-8?B?REN4cU4vOGlMYndVcjFTWVBKd2NPcWF4Q0tFOWdVNTNxMVZmRzJmcFBjVmpy?=
 =?utf-8?B?eWsyeUMxajgrWEVkS3o4ek5SdmxLUTZMTkFLRDR1UFZQZHFYdVl4QTRpYVpC?=
 =?utf-8?B?NGVyR1RpN0hPRTJUdGVwRWtIOGFWNXZXZDNrMGFBQ1pHK2dTbHM4ajVXUFha?=
 =?utf-8?B?V1EzTXREOUtLOFFodkRZaW55RG9ZQ1FrZGRMVGJlTnZnSG45bHI4VlZOUGg1?=
 =?utf-8?B?NW1lNDJLL0hCcDllMmtMUVBXRXNaM0NqYms1empoQlVSMWRoRmpTaStHU1Iv?=
 =?utf-8?B?ZUI2cXVCU3FoamNrNHRHNU5BQ0x3NFMyejJDQjhMNVoxSjRkKy9LM1BsTWgr?=
 =?utf-8?B?RkNxSDg0OXRndU81bk5ZbjYvTzc3bUkwRUl0amE5VnBBclRwZkNNU2FvQXpM?=
 =?utf-8?B?VGVVYXpObzBvTGd2Nk52TWNzY21uKzJvR3U3bjFGTGNaSWJKQ3VkZWtGOERq?=
 =?utf-8?B?NjVLMkZDS2JHMG9TY3lyczZKSXJoUjkyaEJXYUJwRTVTdkpITm5GWTBIakFo?=
 =?utf-8?B?c29PR2NMbzliSHRZbTdvakZ5eGFOS1lnUkdxZUhDYk5LOTFDRXRzODhWa1o2?=
 =?utf-8?B?cnVHQzBwY1Z0Q2h1RUNBN0lwSjBrM0MvbHBnWmY4OHFPbUpIek9mMklTOURJ?=
 =?utf-8?B?eFRCM283cFBSeGxrWVU5RDFOdGV1aEpuQkgraU9uOUFMTlFKYzJyUVFvcWN0?=
 =?utf-8?B?cENvWkhhN25PRkp2NGpnV3F3ZEdsMDVNRDRYVXBHWDNsWkNDSE84UkJjak9y?=
 =?utf-8?B?bTdDSXFvQ0xXM044aEtWQjhJaE83TXU0aDJZNTVPalNxdVNydFB3d1EwVTRk?=
 =?utf-8?B?V0ppNzhNNmFwNlJuVEgveWJqamQ2QlR5dlVNQVEreHY1SldGWkJrdTg5VUln?=
 =?utf-8?B?TTVCMmNadnlHV2d0azkvSkRsU0tZRk1BeXZmTmdyRmVnS1VrSnhaWVl4MHI0?=
 =?utf-8?B?dXBPTHp6cHhqZi85cm5jWDQ2MnA0ejF3bmZ5enZ2ckZaQ2wwTkJPbGdYYUU3?=
 =?utf-8?B?djRGK3V4QmhpUWtKRDU3QmRNMWlyRm8yVVFHM3J6Y2dVcXRRSmFjekZuNElq?=
 =?utf-8?B?UHRPQklPYnBMUmdSRE9YazZxbVBHd0JuQXBIR0gyQVIyQ1ljQk5zUm1MV0Ft?=
 =?utf-8?B?b0xVOUhSNTRMblRrYmR1Y2F2aWhibjZTZmxRdDlQWU4xY3JXcldtYlNLdGsr?=
 =?utf-8?B?ZVEzRkxCMHllSHZXZS9mMlpwUDllSjUyeFFzV0dBL0xyMDZxSEpRTGtvMUw3?=
 =?utf-8?B?L0xFRktWTFYrSEdia1JTMGtjdTlNNVdMcjBmcUkvRmdoZmppdko2emU5N2la?=
 =?utf-8?B?VmxZN3FHa0J3bEljNkZ4ZEpUNmRieDhodG9yb2FMTXR6bmNCNWVCSU4vajhV?=
 =?utf-8?B?M29rMm13aTNBPT0=?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 04:31:49.9278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57bcd786-8e7d-448c-760d-08ddac8eb645
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR18MB4617

Convert Cadence family GPIO controller bindings to DT schema.

Changes during conversion:
   - update the naming as per the other files.
   - add gpio maintainers

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 .../devicetree/bindings/gpio/cdns,gpio.txt         | 43 ------------
 .../devicetree/bindings/gpio/gpio-cdns.yaml        | 81 ++++++++++++++++++++++
 2 files changed, 81 insertions(+), 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.txt b/Documentation/devicetree/bindings/gpio/cdns,gpio.txt
deleted file mode 100644
index 706ef00f5c64951bb29c79a5541db4397e8b2733..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/gpio/cdns,gpio.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-Cadence GPIO controller bindings
-
-Required properties:
-- compatible: should be "cdns,gpio-r1p02".
-- reg: the register base address and size.
-- #gpio-cells: should be 2.
-	* first cell is the GPIO number.
-	* second cell specifies the GPIO flags, as defined in
-		<dt-bindings/gpio/gpio.h>. Only the GPIO_ACTIVE_HIGH
-		and GPIO_ACTIVE_LOW flags are supported.
-- gpio-controller: marks the device as a GPIO controller.
-- clocks: should contain one entry referencing the peripheral clock driving
-	the GPIO controller.
-
-Optional properties:
-- ngpios: integer number of gpio lines supported by this controller, up to 32.
-- interrupts: interrupt specifier for the controllers interrupt.
-- interrupt-controller: marks the device as an interrupt controller. When
-	defined, interrupts, interrupt-parent and #interrupt-cells
-	are required.
-- interrupt-cells: should be 2.
-	* first cell is the GPIO number you want to use as an IRQ source.
-	* second cell specifies the IRQ type, as defined in
-		<dt-bindings/interrupt-controller/irq.h>.
-		Currently only level sensitive IRQs are supported.
-
-
-Example:
-	gpio0: gpio-controller@fd060000 {
-		compatible = "cdns,gpio-r1p02";
-		reg =<0xfd060000 0x1000>;
-
-		clocks = <&gpio_clk>;
-
-		interrupt-parent = <&gic>;
-		interrupts = <0 5 IRQ_TYPE_LEVEL_HIGH>;
-
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		interrupt-controller;
-		#interrupt-cells = <2>;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/gpio-cdns.yaml b/Documentation/devicetree/bindings/gpio/gpio-cdns.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e71f0137912f88e69fb3fa20f096e1572211591c
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-cdns.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-cdns.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence GPIO Controller
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+  - Bartosz Golaszewski <brgl@bgdev.pl>
+
+properties:
+  compatible:
+    const: cdns,gpio-r1p02
+
+  reg:
+    minItems: 1
+
+  clocks:
+    maxItems: 1
+
+  ngpios:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of GPIO lines supported, maximum 32.
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description: |
+      - First cell is the GPIO line number.
+      - Second cell is flags as defined in <dt-bindings/gpio/gpio.h>,
+        only GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW supported.
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+    description: |
+      - First cell is the GPIO line number used as IRQ.
+      - Second cell is the trigger type, as defined in
+        <dt-bindings/interrupt-controller/irq.h>.
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - gpio-controller
+  - "#gpio-cells"
+
+if:
+  required: [interrupt-controller]
+then:
+  required:
+    - interrupts
+    - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    gpio0: gpio-controller@fd060000 {
+        compatible = "cdns,gpio-r1p02";
+        reg = <0xfd060000 0x1000>;
+        clocks = <&gpio_clk>;
+
+        interrupt-parent = <&gic>;
+        interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };

-- 
2.25.1


