Return-Path: <linux-gpio+bounces-23646-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C50B0E4A7
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 22:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85D153A991E
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 20:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D1028136B;
	Tue, 22 Jul 2025 20:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="Y/sYZMjb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2101.outbound.protection.outlook.com [40.107.223.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68AD1C1AB4;
	Tue, 22 Jul 2025 20:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753215374; cv=fail; b=KpyrRUjEhsdHxpl342ZeVl3/zJaMO3JBBJkq2cFEOKlmOEfez9Fr5OjQ0Sjc4W9BHClyNhs3TQTei06FWJOdDZS51ESHYwJhboYezdgbgv2ebD6vzYE9WJ/GjXp/TmQGABudIhRu2xmdwVqhDQZZ1KydZGqwBdA6uXvcEOdCkpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753215374; c=relaxed/simple;
	bh=2P0fqQ4rK4FrrY5jP0Z+4ts52LSAML5KAClXxLndh0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ViC+AZppnRbXZKw9VtcR586nhU8U25CfuoAa/3v6m2ppr1INpZr3wCPgJR05e1UJYj05VAt5Ulqbka8GNpIdTrr/4zVPR5QHb1Nok4BFNmxSsxe76DYaKdkHULcq4l+i/BdqZCCpfEj3mdQKS9yOdOJUWhVuBj/ct2IUwqINOAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=Y/sYZMjb; arc=fail smtp.client-ip=40.107.223.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EeiN8zQ8Pz799J/cpRtcp3878CphwUQjqNcf3SW9v9MRVXjLz2qQwcSuJDaUm1PwymzoAcwQQh3+TJpB0nfM48wFKi33zBWh/zeRdt4xpbGbAPc93EGjeGaHkIygBYnZmVjYnQj2dnvO4Eo2uK8GK1uirFSrbL1Y64Mr18soBIZ+39Q0ruXt+CjK0qZ8RjPx5QNzLbWW8TQ260W96HVg3528jFxbnS3s+N2+yKvAIHPzrkYp7sz76Ye7kO2hoRjVNG0R8VxKuEVuWZZfFvxuJdtY4Vy+LSXM2nnNZx5KdtcPj6JacznK70ZNMvRMlCFDfh3qglQytqsUD2XR47WhJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84FxozLh+z3Mz5Az4nAW/8Rmh+SGSo1C4c0QaxoJcYs=;
 b=AAyttlb51m8/muxw3ljYLdODbk1Sr71GQRhTF+tF9YhLz3TM3VRpRi9U1E2JxK1ovu30UGQ0CfIdA32rPia/k0d1mEd5PQd5yl0NmCmkYu3QdyuQLZU1st2hK65K80KXMKHAB/5k5LuDEz39CgopBFXyjl756ys6Y852MDBURRLdxzTVvXfjp/O11SPespGeR+u7SWOhUeuz5Abfw9eI2NGmlU14aDTBG+4NghqAXNRaiW9SDz3iecpzjz+iHDDah5iSqrf9BSmCPDacoE4dhkgVPLjgEP6WwClnfF192PrmwbtfQeZPg3LPBxv6SQIf/lkL8+BqK71fel1Y/rJxWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=arndb.de smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84FxozLh+z3Mz5Az4nAW/8Rmh+SGSo1C4c0QaxoJcYs=;
 b=Y/sYZMjb4GgKzJt0KOivAohjHTnqrOEbMJHmnmH5sFcUNFv9EN8PXdAoDMRga170Pi7yiz117xBRGkGvFFVrwJesWxXfsAgSnSD+dtSEI3c7h1daZFkfKbiCQBHlccXlBPdrk0QLpc3CH8MUrYi2hlUPe4pgj0jrqNqdbDCddiykTicES/tdyT+7RZqFQrum/w3HA9Q8eEdhdHxdhfrGby8EXUOhhSW3+wtuXRuJ9DgcZIItU8WPZ1wk+q+v+GpKwFeh801Nn7JjNOpfTOBbXL2zCDKtKgfiufMAK41UgATmANo+bAO1TdejfMOXN8WAyc4VioSKUXGTeM5GGhTqmw==
Received: from CH0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:610:b0::19)
 by CH0PR18MB4209.namprd18.prod.outlook.com (2603:10b6:610:bc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 20:16:08 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:610:b0:cafe::2a) by CH0PR03CA0014.outlook.office365.com
 (2603:10b6:610:b0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Tue,
 22 Jul 2025 20:16:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Tue, 22 Jul 2025 20:16:07 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Tue, 22 Jul 2025 13:15:30 -0700
Subject: [PATCH v6 02/10] dt-bindings: arm: axiado: add AX3000 EVK
 compatible strings
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-2-543979a60ccf@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383; i=hshah@axiado.com;
 h=from:subject:message-id; bh=2P0fqQ4rK4FrrY5jP0Z+4ts52LSAML5KAClXxLndh0k=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBof/GCLbQbEnjQAsxiyOVVeqw4Tg7dbu7EOX3UA
 lQG1o/cVamJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaH/xggAKCRDxWHMRoTLV
 +3eiC/9mOqb0FtVNnEOGOy2qIuMa3N+EfIBjkKDU4OL8T6Zg4NIk5CzNYnuMnv3BNycWCTXL77f
 3EaGsDEbhKv1wt5jJNwBhMgSuACMSeTnibpR/osVniTViu+tdNTR6oxu2qhhxOQQn4EvLv3L7+Z
 pehhKAdXQ4A3BkwhaD6DRPN5tzIfy9ByIO5XN8dsalFBRo83gV1LPZ66FLPImNUpuu1+ediYZQK
 ZMtP5+vZy7hX0rFBX6rXcy96lDpOOt3KURDHFKdA+lPVno/eNBNHxrZzfipVkmq2MDiCRJ60Sky
 A4aPP8TSuYp+BbiwpLvQdTvMVKnVX7kTsL/0BDP5u2rCF14969fljw39FvYxoOmt1rDBb789Hmb
 EVWLBCuiFbbByi2X9izler5YOKAqxFMAqKApeqk8hz0Q0mpBY/nn9EQJtmYmPINBRv8/BBhw3Vn
 4ya/5KNkOjwaZzkHEh1hN+4Q73Yslt7eDSbzuLBQAxL4VHGIxL0MfToiOuZk26FYRiXGU=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|CH0PR18MB4209:EE_
X-MS-Office365-Filtering-Correlation-Id: ca15ff05-2f73-4e92-ac5a-08ddc95c9816
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ly84U2ZXanhTUmkvSmlHWTUwaHJqeVNMV0VoTmUrVUhGazRONTZDbjRyZUpK?=
 =?utf-8?B?TytDQzk5K1pQckJjVnBTT0VhMzYwWjVONXRIbFpoK0c0SmxCYXUwN2xhSnRW?=
 =?utf-8?B?dFJBcFpBRWw1QWdEb3BlUWRSdFFIUmZXaVhWTWhuZ211di9nbzR4VWRXb1h2?=
 =?utf-8?B?ZklsVGk2dmtDSHNiNXF5bURZa0xPUWQ1V3d1UXNNZS9OejUyeHB2L2pyQVJo?=
 =?utf-8?B?ZS9hK0l6ZmdxQWxSSVdvT2U0amlzRWl1ZTl6KzBYcExaOGphaGNEZUd5ak5J?=
 =?utf-8?B?OEIrZzdZT3dJcERLZ2JtS1hVTzFNa3FTUnBZMzFESkRiem1IbVMzaGVRa2dl?=
 =?utf-8?B?b2pxcmpoUmRpUUFLQnJxSWNrSHdNa0tVcG8yVUttRXczWTU2ZkpGTDMxLzJk?=
 =?utf-8?B?YkNuNnpGM0IzVXFzM1d0VjZuOGI1NE5qNmNFWStvZkFTZkZYanBuTDB1RW84?=
 =?utf-8?B?ZFBxTHpQMzVDcU0vTE53Ym5ldUMzd2E1R3pSSkw3eksxNURUTk9ac05sSEw4?=
 =?utf-8?B?cDNSSEQ3K1ZGR3NmUTdjTTE1ald3Wk5Gd05wSTIvTXlLUXRCTkpKSHluQVNY?=
 =?utf-8?B?WUdmR3E5NWd5OVZ5M1RyWUtCQlhuRXFkKytuZjQ2bjdVOUhTQ1RNWFM3WDZU?=
 =?utf-8?B?Qzk3RnJXdnNqWXlsNG4waUlTb01tVElGdVNTUUk3THBXSm1zNHVnYk9PY3Js?=
 =?utf-8?B?b2dEMEpPWDZEQkFONEE5eFlnVGpxQW00cjJ1bHd3V05keHo4U1BzcFNMVUY5?=
 =?utf-8?B?bnFJM1pSTzNrdTJjVlcxbWV2Y3ZTYUxUcEx0b2tmNTVCMkZ4ditSWENqemdP?=
 =?utf-8?B?cDR2d085TmJ6d3RZZlJ5aTcwSUlYSjJrZXVuTkVmdFlhZ0Y3cTNlYnFocDVk?=
 =?utf-8?B?NElzNnpGVUpQL0dkekloMVM5YkZkTDN6cjJrTHVqNlg5WFdSL2pMdURncGNE?=
 =?utf-8?B?S2FmM01PdGNoVEJhVnIrZGVIMklmTW4rQ3RwMC9SbzdKK0JhMEUvODBLTnQy?=
 =?utf-8?B?NzBXb2VDQjRmeS96VzBwSDJvcnlCQUt5L1E5S0JsTGlRTk83eEZHSXpXeDF5?=
 =?utf-8?B?UnVQSUZHUGVnS2ppM2ZuUHBaNytCVWY0R0RhSG9uc1BTT0xJRHNubUhUcWZR?=
 =?utf-8?B?RjRmTFFoZ3hzMnhBZEtncEpoM3k3T0p0N3hvTUZOdXRHZ25NTVJ0aTZIU0dY?=
 =?utf-8?B?dlhYaFJ4aUlpY3hHUUxGZTltMVQySEN6Umd3N1BuZzRTS2NFUEFKQWFmUHg3?=
 =?utf-8?B?NTVoMW1mTW1qQXAvdjFkTmltYzhMWjUrNmphSk4wSlV3ZnJrbjIyU2F6ZlFO?=
 =?utf-8?B?alo2RTQzRk9IcjlIYXdGNGVEWmpkZGJBUWM5MGxLVlhUZE42MVZJTnJUbWJj?=
 =?utf-8?B?Y2JjNW9aaWFMUkN2QUoyMk9PdTI1eWF4ZHhGSjM2enRsTlJDSjYyODdQZnJo?=
 =?utf-8?B?OU9MSnFCZ2xpdURXQzJZMUtMbjNjV0dtQ1FXdmhzZDdtOWFUQkdKa1Vwempo?=
 =?utf-8?B?emhSc1grTXNhOFdVZ0kvY3JjMXBCUGZJeHBEU042VHFMVEg5ei9XcVdFR1lK?=
 =?utf-8?B?K3UydXZwQlNsOEpLVjNQVDVkWXl2aVU5a1ZEelRtQXNETC9wYkxlN2ttUjdL?=
 =?utf-8?B?bWQ5VGlPZ2k3QTlLWHdaVk5SeXcxNmdpU2dFUkhPWjVDeUVSaUExTXZDZmJp?=
 =?utf-8?B?a1NCdjMyYXdXcjJleHp1MEdEU3FmTTAyQzVNSHBQaXlQY292Q1NNZUorN0Qz?=
 =?utf-8?B?QStPbU9pZm1mTk9tTXg5OVJkbjVMaVBLSkNDYlZCUXF1dTFxV2J2Vmx3M01B?=
 =?utf-8?B?S3Z4UUdUSXA2RHc5VDhsa0xTMjlyMTh1a2tjL3NvMVMvNVVwRHdhUUtNV2hN?=
 =?utf-8?B?cjRRSGJ5bDlwZGsyeWFxbnR6eFMwVGM5UFdNNFArbi9KZXdpTG9oMWovSndD?=
 =?utf-8?B?UWNtaHJlVjhPRUx4TUFkMmhBa1l6Wll4N05YN0dQaUNyL3N3Tmx5NDZBTDBI?=
 =?utf-8?Q?HMA29/AFTrtYHgxSGb0XChaAofUVco=3D?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 20:16:07.4970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca15ff05-2f73-4e92-ac5a-08ddc95c9816
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR18MB4209

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


