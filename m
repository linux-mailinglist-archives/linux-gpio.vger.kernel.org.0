Return-Path: <linux-gpio+bounces-21600-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E88ADA079
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Jun 2025 03:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D779173C22
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Jun 2025 01:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E58487BF;
	Sun, 15 Jun 2025 01:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="k6NARhgV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2130.outbound.protection.outlook.com [40.107.243.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159021DFCB;
	Sun, 15 Jun 2025 01:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749950003; cv=fail; b=equCbznhYLrZMP2CqzcySL9e+fVJR1SgDurSZdRZW/yJL7abpl+xwcag5t9gb2Rhth2owZScjoVv5zc2mKlHGTMTqM9OXkb6PCVw1NIx2HwJxOTvRojeG/QbWnuxNILAUQWqG7ukRVA/F9T6/3qXPIlLPJYeLOY7GQvbX9n2a/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749950003; c=relaxed/simple;
	bh=k2bg1Idbmpr7InDb5GGMHb0LUKQqJAT8NkVZyKNijmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KarDv91ayvNUnERZc9I0fcDHQiNlYCKjYbWqDeg8DA483sKHWDKh/Uu4SuvqBgb4jgKZO667vrrUPKn1MGouZ4SJyQIDxp73+T5yVZ7tS/kZdKooM06A2pcy+34KzK33ZOLwoTT+BQbH4b2Px7JRJKgOZxVyAm/WAEZafhrdaz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=k6NARhgV; arc=fail smtp.client-ip=40.107.243.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umRqoC2ImZ/MSiU7JpTn6m86GizpSlnvX42ut3hZsWXUifJ2Xtqfx2wDCdpMoHBkZVULKuO/1s2vXb9+HGtWLeOmsSN247m+ElY94c+y5eh1IYZ9XDLiqTRmyLOgG6hZ4UZeJrtwqV5PEpUNDcCL/rXL+C+ffFAVC9H/PXZb7/TtLGietJSxOPPrkx3gmyDnUlW+cMKl0s7UsvK9/KcA3R7+c1cy2z5USOkHvXbRzxiHm82TFV7i6VKxhjTbV782kZKLdnWOfd8Nfl84XRC5oxe/WVT1nOB4YPDLM79YceG4veBQLqZNJx2pFy0KeKd0TCNlofA8lcRqSUQ4faKZhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgF8+PR+/dKwRsE/gY6SrakSd+MSYhaWICfnygds71k=;
 b=Hry9PL6QeUN+WMNlNiCp8CgkptkAapdBOOi4iJH/4x9xn/dYkXfqo83Uy48VgTNo/gO+70GoCNl/eTW9uxexGRnhlDN2SXYObL0oftqO98q0rMVaxp3J+u5UEK1/tkZhXZWN4GYiFbGuP0/coDc48K44aMvzvw1b7pWnBMPlF02/ACnYci4nIoZEfuHfVEPXrL+54Pc65XRPdkbdFjuP82FdQcn6ybdanvMDp7Y/nJL8pUi/cYhU1V3SbmttpPpkmhF8mXcoO8t4w0QIIWh4sHZ2umSUbuZyKauS0hGHcE9rBZzWHYuyG6UKq+kFK27OduFgixgjoX5dR0+n0Y9NZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=arndb.de smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgF8+PR+/dKwRsE/gY6SrakSd+MSYhaWICfnygds71k=;
 b=k6NARhgV8muA68S4qqrdRsedsUeRIQsyC2A/lUT/MiOy8Lfutl1u/sOLIfoWpQgiz2uMwSF4WbnT9/MI1iuEqtnvhjRXTol/jPNGxeCUSLk501v6tznGuhM7fRrRIl9Wu6hIaqYbcmeer9t2DYaoFu3hRhQmh0jCm03T93eo1APwgNRIJvEXtwPhEiXSTbxZ+2t/hewZnbRzNIQPUVZI8Owd/vi7IvV02U//okvM3ZwjWaJz4WamU8eEjJrj64N/3glb50NZ+4kExnEf0Pw6QUZR+3ncgqXIsECKxI9l3wBRIUg0MqWlkWHxhUAWs1LSqODpzXEsbXEEPM/T3ovdJg==
Received: from BY3PR05CA0017.namprd05.prod.outlook.com (2603:10b6:a03:254::22)
 by IA0PPF86576F4F8.namprd18.prod.outlook.com (2603:10b6:20f:fc04::c2d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Sun, 15 Jun
 2025 01:13:16 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:a03:254:cafe::43) by BY3PR05CA0017.outlook.office365.com
 (2603:10b6:a03:254::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Sun,
 15 Jun 2025 01:13:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.0.1];
Received: from [127.0.0.1] (50.233.182.194) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Sun, 15 Jun 2025 01:13:15 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Sat, 14 Jun 2025 18:12:47 -0700
Subject: [PATCH 1/6] dt-bindings: vendor-prefixes: Add Axiado Corporation
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-1-327ab344c16d@axiado.com>
References: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-0-327ab344c16d@axiado.com>
In-Reply-To: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-0-327ab344c16d@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 soc@lists.linux.dev, Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=831; i=hshah@axiado.com;
 h=from:subject:message-id; bh=k2bg1Idbmpr7InDb5GGMHb0LUKQqJAT8NkVZyKNijmk=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoTh4n4ofhX4lUU0h22Eiws8TRXTpCTXovTB9yG
 P2+zJkMJ/2JAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaE4eJwAKCRDxWHMRoTLV
 +8+eDACCGT43QlBJ90RdtYEinxf2Y6mU/NQ3oHQeKxkmTCmQuvZjrLzTTMn+XPmUTmDsQ85VLkq
 ZWySoTk8/9rnmN+MUJ9NzKEnzj4xosp3ZPeAIybcGtu9mdmB3Aw5ffifh9jP5L6pEKupPNG1oZP
 4ykeQLywbWh7GQ969G3EWpDHNfIqbYQmJSFL9GT3gDzLNqZpI0gPNOhAEA8cuvyxYLiWa+ulzwi
 rO31rOc4TvrVS1T3rAEWXqI5x0whTA6bSJWFymIX4q1EX3NB9oqq+RcuhzgPTCNN4YuNIuP+lKK
 OO3+FE6jeJVakOKL63Vf64IMm9GeCKVMbsO9RIF+w3Q/UDLVjNMkwBqbyFdt0UD+amm67L97Uk+
 hz9RJmYoXIvoTFDob+p2o0RvUsbA72hZvwOJVFYb8gILAle+JHXv9dYPhkgQm1R4iXzgA+kOcT3
 2czHWPQeFtx/ebSfJgVNoKRz3kaiVnv1ptQ+zElbudRKX4XZlv53G9YHLVqisWyZA+JCY=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|IA0PPF86576F4F8:EE_
X-MS-Office365-Filtering-Correlation-Id: 98e17838-f14a-4caf-2834-08ddaba9ce9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0s4OWRjWW5uUXVHbnlma3dCRzl2ZGxmVkUxSlZQSXdCakMwRWtOR3ZpVzRJ?=
 =?utf-8?B?U00ySXg5WnQweDNQYXVseU45NE5SVUEvTWxtcGVGWWg2Uk5LTktxUGxLVkJG?=
 =?utf-8?B?SlFKaUJRZkQ4QVhmK0FGeW1UVklZd01YbWRZWGprNHpLSUc2TzdiR1FuZ2lO?=
 =?utf-8?B?bnlKVXZFemJBUVNpeFpObllzQS9ESmN3c2UraXF5ZWdvYU1YcURJS3ZOZVlC?=
 =?utf-8?B?VUdackN5WVRNS29XTXZIMEN1UDAxbmNzSVQ0ZHR3cHgvcER3ZHZBU1ppNVg4?=
 =?utf-8?B?Rnk0SFlHWnRySElxbkZxc0t1TjJlWDF6cXpLVUxtSjZJd2ttV3VHZ084MlYz?=
 =?utf-8?B?elYrQnN1OUF6VUxLeFlRcU1TTU1rZElQMW9rdmJxMGlmK0hGWHZQM292clc5?=
 =?utf-8?B?a0NrNWFmeGQ0K0hUREsvWmN0a2ROVVBLNlBCMDh1YWpva2xPb1NoYVpnK0VJ?=
 =?utf-8?B?b1kwTnRzalkwdTdxbEltTEJpbFF2dmNxYjVaNlRGTDdpcnBoeEU1djFEY0hU?=
 =?utf-8?B?YTJBWFJoYWx6bS9FM0xVUUhnRU1vaEk5OWFnWG1oSXNhM05HMFJEWTNvK1lN?=
 =?utf-8?B?ZEUyVzNjSkljVXBDZWN0ZlBQcWVta2NKTHd6d3FDcW1tYVA5ang1V1IwSHdF?=
 =?utf-8?B?UXFyN081dTc3MFlaTFM0UTBsUFJiMWFNeGhTMkM1WWNONzY0SE1XdjRaMHRK?=
 =?utf-8?B?Y3VLNTVrdjBWWmZacEhWQlgrSDF4VjVwY0syNzlHZVRvaEIzdlZkMnpxNVI1?=
 =?utf-8?B?UStGeUtkVjlmYUZpcXZtU25Kb3FpeXlXVU9oOFp6QlovZUZKTHFRdFk2NEhi?=
 =?utf-8?B?QVNMNkQ4WkpKMVNqa01oTVNtTkg1eEFhM2RzY3dWUFQvNjREQUgrNlE1T0Rm?=
 =?utf-8?B?Z0pCLzBaWXpXSnZUbE04TUQ5b0llemRzanF3V2RBWUNXUGRjZzJwZmxsNE5E?=
 =?utf-8?B?QzFZaWFISHVGWjkzOFVWZHpEeHB3bGdSN1lEbDVoK2tKQ0xFbzJhdTY5VDVs?=
 =?utf-8?B?UC8rN056dTJhRForR2RvUmlYTG9vMkZicXJpb1BGTE9oYTIrZGd2VGU4d0t6?=
 =?utf-8?B?NXdHR2xzV1o0NG5Xc3NzNWdFZWxGdUhUclFTU1R1eXovYjlJZUR5T25YdVB4?=
 =?utf-8?B?S1dxcFJsVHllZThxQ200YThVMnphK2dWZ1Z2Tjh6OHpsNjVXOElrUFc3YUd2?=
 =?utf-8?B?UUZVaE45MW1QUEtTY3ZZalp5ZG02UXd0dG0vSjVYSFpZUlhVUXJveTBmRTU0?=
 =?utf-8?B?V1BUNXJOOGVNL1RBdTBZaFE5NjVVWnNjVC9XTm9ZZUZNQ1JqOURCRG1Geng0?=
 =?utf-8?B?RmlIQko3QUFkeGhtUEhJYUk5Z0hWYWlIYWFjYU5wQTR3bTQ3UWlCM3RONkNa?=
 =?utf-8?B?RjEyYWlKM3VDS2g0MEhiQXlGdEdHeVUrWm9XVEgvSUVlblNITHVtS2VvWGw2?=
 =?utf-8?B?NTlZanBaV0dreXJXN25HYVFxR3JNTjhJbHA1c3NhUkJzNnc0cDc4WDZ6MTcw?=
 =?utf-8?B?cklKRXl5MGRZQ3l4U0Qyc2NVNDg4RE9JMnV3dCtnMEVEditNei9FUjZsUHFP?=
 =?utf-8?B?eU5SV05SNnJveWtsNU95MW1HaGpUanJqN2x1V1V3S2doR2dJWHFYUmwrRkVG?=
 =?utf-8?B?VnI1SjZHc1lHWENNVzdKMDUyQjUvcTk5MnVuNms2L2ltdW5QV2puaVdvcndF?=
 =?utf-8?B?U2pMMWROb0Z3T24wbk9vRkxsd2xEeUY4bzhhL3VPUlE0WVQzeW5RbElXdktH?=
 =?utf-8?B?akIvTXhHZUVMS0Nia1NVZWlwNnRTTVJUSWhNaEliQUluVEdKYVNuQmxrZnFx?=
 =?utf-8?B?ekJJb0hVNTl6ZktCN2RVNlNvV3dldUJvZkowZ1h2MitxdEdiOExZeURnNTBr?=
 =?utf-8?B?ZThvTlFQdWFBbnN0WVdQbzNQL2VQWm1jblhCVkpzSlJKRlZhUHBEd1BEVC8y?=
 =?utf-8?B?dXlQMWFSMzQxSU1aNFlCUVgrTjhqSVM2R1VnbWFTbm9mWHN5OXVsai8zWkVI?=
 =?utf-8?B?QkVNNk1ZSWZ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 01:13:15.7102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e17838-f14a-4caf-2834-08ddaba9ce9f
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF86576F4F8

Link: https://axiado.com
Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6c666c8b557c2ef385918e5e97bf9..5ada930c79e3b32ff1bf194ee66bb4bdb08d539e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -200,6 +200,8 @@ patternProperties:
     description: Shanghai Awinic Technology Co., Ltd.
   "^axentia,.*":
     description: Axentia Technologies AB
+  "^axiado,.*":
+    description: Axiado Corporation
   "^axis,.*":
     description: Axis Communications AB
   "^azoteq,.*":

-- 
2.25.1


