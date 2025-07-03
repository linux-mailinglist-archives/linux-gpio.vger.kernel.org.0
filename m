Return-Path: <linux-gpio+bounces-22677-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2DAAF66AD
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 02:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 780B252414E
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 00:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA17618DB02;
	Thu,  3 Jul 2025 00:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="JlhEweIn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2112.outbound.protection.outlook.com [40.107.243.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B453FE7;
	Thu,  3 Jul 2025 00:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751502174; cv=fail; b=d3qRKNKww/eztlmun7SpSyAPGvdULgkHRTXZYH9hrAyaToOIlQS0kT6nby3sNarambyqdOxvod82FPpSYZ47Ph49AB+asVPmDo5nJb/HVY25F7+2Q4bUx+6BnALcTwvsv23Jf92PNH0+SgmZBF9tXjBdCsA6MI244dxAAsJVay8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751502174; c=relaxed/simple;
	bh=2P0fqQ4rK4FrrY5jP0Z+4ts52LSAML5KAClXxLndh0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jSSLD22hw/7MCUE+aKOyRDbyNG6WpIH6e7iLJAso6dizzdZ2GoeosE4753P7quxMmZTAqO9xsK1XoT5JSOx0UU3n+8pMJRYQ/jpMKy+3X/ga/ETXJOTtcLAA/TAWglIZOC8lWMFIgGAZOHhJQB1jcwDNNfVpI572dkB31eK2NsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=JlhEweIn; arc=fail smtp.client-ip=40.107.243.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PU20HjOiHquvxcXDwwX4T9Gih3HDBAWRK8L+K9UUiD2te0Z0NyvriHaeVoQmamXciQH2zmRHS9ub9TcHuHh4q1c4FK7/oKDoVMEII15MTv8efWYxDnc51jq0b0O/1t4PXDWtilbNfExmdZCa92NIedwQDWN1aCrhO3ZYTyzA9HBQNvnYVW8k+LQFPWr/jF2G7Pm3RCPC48tw/wxeUBjjcxwrYQeXsx+ORcSq5PRV0tAy5MTFkHtesBd2m8POmoEC43aeVwZGboLeDolLYRMpf5LKljZM5FmuqEmluYwQhVGoKLCmClY7xU6AOAFyy0s08sDaLfc7V+gzoaFvtN2luA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84FxozLh+z3Mz5Az4nAW/8Rmh+SGSo1C4c0QaxoJcYs=;
 b=umcvTJYUOCvQi3ORgcxdp50BJ4joQHILBZpJCDx0kSHfe6C048kg4AQRMyvwNmwonhp28JCzE+4+oLolcYLkaZStP54Dl85N5uPTgLjlpjJOlzzQb0z3uTVJHLoSQbTr5mVkpYX5YFXfZdUV+c62blBJ/pwPQfGwWUpR0EYKG97tLCnRIz7Tnod6dfFhpq0+uIlT25IF3HCwDs6Whokp+0f9Mgghecv9yM5xkgalcAnNu0J0CSQ+6Losk14bRQq3m7hQIKgWk908Rnd2Q1gGqGNpC6/CSI0T1sDpiJUIP2kfzCYgoD0vO2h5RelAA7nYf2ITph6yr4JNXzyopBhN/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84FxozLh+z3Mz5Az4nAW/8Rmh+SGSo1C4c0QaxoJcYs=;
 b=JlhEweIniRERfNMcUH7GaTsM6bd00UQ9p5SMwc6iXDOqbkWUC/m4UOprgvFMDy9HtH3oQC6vX6JgAF04u6rfrBGsXYhlX0ChP4ry0tIN99I3Ch6aEaCl8NbIIR3gZCi32gpLW6hZz7W/qvrMSBo+2OCzxRy/UKNX2QJtk056OV/XFsBeH+1GeucXVI5aVSCPscyzUeflLPN06lJP/szqq72+wCq+8mSj62y67G7/2l1SDJ2+/6sfV00ECmo2VnlZd7VBgQtb1MinNbbEGh1iqYmYAUoXB+HwW2KP3ZtZ1eYvJuzLgjtU//DwvKeUIz0tVYxFYw5RZKQGRBQTv7hoRA==
Received: from MW4PR03CA0112.namprd03.prod.outlook.com (2603:10b6:303:b7::27)
 by DM4PR18MB4352.namprd18.prod.outlook.com (2603:10b6:5:39c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Thu, 3 Jul
 2025 00:22:45 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:303:b7:cafe::84) by MW4PR03CA0112.outlook.office365.com
 (2603:10b6:303:b7::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Thu,
 3 Jul 2025 00:22:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 00:22:45 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Wed, 02 Jul 2025 17:22:31 -0700
Subject: [PATCH v5 02/10] dt-bindings: arm: axiado: add AX3000 EVK
 compatible strings
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-axiado-ax3000-soc-and-evaluation-board-support-v5-2-6ade160ea23b@axiado.com>
References: <20250702-axiado-ax3000-soc-and-evaluation-board-support-v5-0-6ade160ea23b@axiado.com>
In-Reply-To: <20250702-axiado-ax3000-soc-and-evaluation-board-support-v5-0-6ade160ea23b@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Jan Kotas <jank@cadence.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 soc@lists.linux.dev, Jan Kotas <jank@cadence.com>, 
 linux-serial@vger.kernel.org, linux-i3c@lists.infradead.org, 
 Harshit Shah <hshah@axiado.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383; i=hshah@axiado.com;
 h=from:subject:message-id; bh=2P0fqQ4rK4FrrY5jP0Z+4ts52LSAML5KAClXxLndh0k=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZc1SLBGnu7G/ywq/PVVohi3k1OWEd2Ub27Dml
 AaAgXy/b0CJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGXNUgAKCRDxWHMRoTLV
 +yduC/4+6cAKsWJNtdFgMEe+dwYn+QGLtTT9qfzoyrUiQRZ2Nn9zrKDjtWyCxeW7QUM3cB+w/xE
 yRPBkIvHvgKysU2sNXWZLeaA37i1u/TiSwPoKBcuOKxzfqQfbkIMt3SSjNpssU2YuynUgnYar4r
 VfI6vQfZJc24gANR/qd4fof1gjx6Lavc0SdNWTXdvk+2iOvcT4+LWg5ZPpZ2hjmKtMEU3EYHHmA
 2RXUbcGaQkDuWSyoWKBJgEiEmy9lFXaYsi/4cM2MmrlLc+CbYG09WZ1NjrS1RugiZ1iZt2lEcoc
 cqQH94UBDo5Sqevt8xKyl1y6ImmBlfJKZ4Qypj9ToSDM01bXleVTtvg8Yz+siUxNQst02Z4RXJJ
 F9URETVt2+fdsZ8iHuY/RisELXbisXgiTxS/fj/XYaeAbdxJ+3zrKOO+ifEBrdd/wQnorHTz9fJ
 TV54xEgr+ATiiHkkg+mgG9Q6mVfWkpOrq/C7bqp8jl0oCPIOhEka5Zs40aTh/yQy+DqpE=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|DM4PR18MB4352:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aa179c6-a92e-4436-c9f3-08ddb9c7bbc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDJ5MCtTZkllcUtZYVh3NE9qaGttVXdHUGU3a1hjdVVFZnFnVzVFQ25vTS94?=
 =?utf-8?B?Z1U3a2w4QlNKejJQeVJ1YXZBdXRSQ2hLTTYzZDN2bDlLVEtjc243d1FXbGE1?=
 =?utf-8?B?UEpaQUNVSURhOTBLMmJEYmsrNDdTbDBQemZMN2NpZ2RFYlJhNDJrNVltbU13?=
 =?utf-8?B?MzdrbnljL2xUZW1KcGMxV1V3K09sT1hzQUh4eFFuaG1JVjludlUrUG1sOUFS?=
 =?utf-8?B?TkNGOFVTbEduaEdLZTlYVm0xWVg5RVUzeDhPU0JRc2Y0bFMrR1FQMW40Sjk2?=
 =?utf-8?B?UmYzSDBiREF4dHphLzg1aGREL0NkaXdtaDY0UGo1U1dxa3IxODk4MUlFTFJt?=
 =?utf-8?B?SHBWQkF6RXZxRUZEK3ROUEdSSUk3cTlFeFFUWTFyWmkzTUJ1bzFsT0JrMCtE?=
 =?utf-8?B?YXRLS0dReWUzaG0xZ3l2R3E3bHBsMC9lYWd3ZmdMMnNjVlRNTlBSWHZTTGls?=
 =?utf-8?B?K0Jjai9VbVBhY1M1dVJqcDZwWGN2MjlmaWRuOTl5akVjZStZbDdQUGF5a2Z0?=
 =?utf-8?B?bkJCaXhmd015bDRGRUw0dmc3L3locEphWnI1dzhmeGJMc3ZwU2duV2J6MkIv?=
 =?utf-8?B?Tko5V2xnR1hGd05GT3EvSEJWSm1pN0NxR2lLUVI5YmtZczhudFY3ZFVWZXhJ?=
 =?utf-8?B?aUdhZHA1QitLVFg1VVJWNlBxWjVYTVhIS2xIQUpwaDV3dE9IQWZCNTdDOXRK?=
 =?utf-8?B?L2NVNzNCUkhNNzQ4SjM2bVg3YzV1N29HTXVOYWpLVkZoZEhQQlRRbnFTamIy?=
 =?utf-8?B?dlJEczdiSWl5NjBlQ2UvRnRhcDlkd2VtWSt2QnBCSnBMa0RmYkkrbkhhUFZt?=
 =?utf-8?B?OU81cUtsQkgxSWhUc2x2UWxEeE8vRVZtRi9hak9TUjAzS0FJYUd1MnFaaEFG?=
 =?utf-8?B?NGZlZGlqL1VYYmJrc3ZqYVJmOVJua0lOSjFaalVUVGllMWh1NlV4ZzVxNTdW?=
 =?utf-8?B?ZnQzTjV3d2x5cmFYWEc0eU1VMnZhck94UEJrRXhLN3lSZUJERjJORnFNRFJN?=
 =?utf-8?B?d1hvOExtRkR6NzBxakRaTW1XdVYrdUVJUXpJV2U0RDV3MkxVNnFIaFpSL2pX?=
 =?utf-8?B?NnFsSnd4U29nUDVJSnQ5UkhTdGx1QUl3azk1QXErT2c3dlVWamF1TjVVeHRh?=
 =?utf-8?B?V2VLK1FqZTJ1VWprYnAwbHROVnNJaHpJdUZ1bnYzeUNWTVZjTjJyZmo2alBP?=
 =?utf-8?B?UEZsd1lYTFBIVVFtQWZ5ci8yTlZlNjBlbWtEcVo0WDRpRlUvelZ6a0dnNW9x?=
 =?utf-8?B?c1JLVHcrbHRIalBiWWxiVCtvcTlBaFVJam4wVjlGZWZXWThuaGtlTmZCR1pP?=
 =?utf-8?B?NTR1ODNhTXBadzk4VXhycUZhNWVwZE1JWGd4OENMKysyMWZHdFlKT1IrcENt?=
 =?utf-8?B?ZFVBbmlPZmgwTlB0U0hVM0F6ZkNIejgycjkxWjNFRk5HRncyazNGWWJOaldY?=
 =?utf-8?B?TUN0UFFDd1E2N1o3K2ZkOTdNOEhsbitCY0VnZ2J3YzJoU0MwcFRRZ29XNG1T?=
 =?utf-8?B?V1pHdmxkZUpWMHNDZWh4eXpDSnhIdFFNR1JIOG5zNG5GRitLaHFKQmRsNjRQ?=
 =?utf-8?B?cjIvRXlRZGZaVU5reG5PeGVlRDRZeUgyVXVwWWFiVVFyTjNsNThRZHVYajJQ?=
 =?utf-8?B?TGR1WlJiRHdRZTNqOUVyMUFIaXBHYm9LZXc3U2xVS1VUajRrRlBQSzlFNVlD?=
 =?utf-8?B?TkRhUGFXb2UzWDB6ZjJOK2pjbXNIWHB6L05CZVIwV0FtNkR1b0FoaFFKcHpi?=
 =?utf-8?B?ZVAwZ2pYRjJLcXJwdDV2b3pXUWwzKzJMc1BSK2NKbklBbElyN0toanhNT0dC?=
 =?utf-8?B?T0x6dlNITnNOZ0xobzNYU2lqK2trUTY2cjllM0lOekY1TWt0YTNkMnJsN0hx?=
 =?utf-8?B?Y0o1RHhxYVJpN2JMTXNrZ0VQNEJSYjF2alloY2FXVTFnRmRiQUR4RUpyUTlQ?=
 =?utf-8?B?aUZIMUFHWVVudlYveEFYVC9STG8zeDFEK05RcjV6b2syMHpvUy9nYnlOY3I0?=
 =?utf-8?Q?HD5vyPicfCxjKcYbOM5yhjQQEdqQD0=3D?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013)(921020)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 00:22:45.5703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa179c6-a92e-4436-c9f3-08ddb9c7bbc8
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR18MB4352

Add device tree binding schema for Axiado platforms, specifically the
AX3000 SoC and its associated evaluation board. This binding will be
used for the board-level DTS files that support the AX3000 platforms.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 Documentation/devicetree/bindings/arm/axiado.yaml | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/axiado.yaml b/Documentation/devicetree/bindings/arm/axiado.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..bfabe7b32e65fb06d1f4faecfad032219f95dfca
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/axiado.yaml
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/axiado.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado Platforms
+
+maintainers:
+  - Harshit Shah <hshah@axiado.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: AX3000 based boards
+        items:
+          - enum:
+              - axiado,ax3000-evk       # Axiado AX3000 Evaluation Board
+          - const: axiado,ax3000       # Axiado AX3000 SoC
+
+additionalProperties: true

-- 
2.25.1


