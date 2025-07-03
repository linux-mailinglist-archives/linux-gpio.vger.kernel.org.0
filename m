Return-Path: <linux-gpio+bounces-22673-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B40BDAF6699
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 02:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D6DF488474
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 00:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853F36A8D2;
	Thu,  3 Jul 2025 00:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="fmJmDjAW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2136.outbound.protection.outlook.com [40.107.243.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF373596D;
	Thu,  3 Jul 2025 00:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751502170; cv=fail; b=kZ+C3/2o7m1+/B9Pg7bPDg8lUsTrFwFucQYS/BDFXQfg+EuvYiAJlg4UGBQkXUyA1U76Kbm7Sg9JZ1mGOCuFdpeS4XtVCF4FpnyVkeWop6+SNDVh4WzjTrkLJqeAQ4sr1QzHYXOM/OZLNQ7IKUBqhAGjk9O6ani4sLS3EVeD9iU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751502170; c=relaxed/simple;
	bh=76okLidoJP6XC526Dh0oE+YzQ6GEuPrslK8PDO1ML0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XvGVka+vp2npjapK7BT3C3oaRs9DlABfPI/dsf4B+uJbkKET3vmsyo34o9Z6LORyHmWelNn0RYv6PnMdjfthApAIC+H4vgVbTwtAd/B0gtxQNIx5MoKXwt4pMpOBy90sPFIHxRfqIi5e3URusU4BAKgGRKkZVdKydD0d72q81Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=fmJmDjAW; arc=fail smtp.client-ip=40.107.243.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0MkxCeLOYukTscl6nlTEIStRPeMdBIQNpPrEcVXzDG2EKK3dYe9uyNtlB8xYflnqNP9GUaRvL9+Acb/JuE9yjKFKRBnGk+Xn5oXElMKJWuH1uXe77xZZZBvMJvJVuUF85pgTgs60lrdekL0W14UHqjjbAfRVQZGFkwk/5nyzzQlEQRxg1gyQSP613saZlLDup1ZhIKIvHXkluYgGluQqprk5jKDBp1jGodiLscdaNTqyogDYKy5jtrPpJApBrTETlJNXLdansi7sWjY+/vzhOMPBOF0z8e7wqclU6YGXRAzDAtTthJZptJPEY9+fIeflnthvI+kdeOw7qWIXUH0nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fC1wGXkjTgm9sdaH+SO0MwS6z+c/SPQ7G2aTB/7FYSg=;
 b=j3D/hfr20NTGnXzNDFoYxmkBS4o3pIHxFmPAEna4KhcKG2m8LNgiGyGxgvIej+YOBR3tL7moE5+c7v6LuBDn0ksXy++pt2L6CHM7qBcv/yWOSKfMuPSPApAxBWj+E7BGpM1nJrG2RVFrZxk+1uBXNSnTsTTxqA8r3fkp5sfzrZp9sWzufp31mAw1bIDGK8W1GIrqG+P2M6v63crwCWJzb8plUv0XZ0Voa7H7SKmXFXJlQ2rcZ5A05hfOPDx1vuT6IrrhtE4y45vSW82v7VUULK43aUITms58Y9eLzT6shOxs/Iilj5hQsrlmUPH9DHuaylbLiCGLZBYkecoP7KSlwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fC1wGXkjTgm9sdaH+SO0MwS6z+c/SPQ7G2aTB/7FYSg=;
 b=fmJmDjAWDrCg00n6IbQ6Zj6G0PgfOWPkRm+DB0P8soG7zf2nMREzxevFpuDSZDgygzW+KCKFtdY4YmiLq2+kCu9IRv+82lK0bDUVN/GTRk53b4V/qt1Sk7KCPN3XTaFLFUo42l89GFrm1fFA9yg+ct1cay/nISE9Unl+biTq0nmW7pUy8fc+KjhIWhvLCw0yazUC68Wdm6P1N2PLdSlsVoD5b9HKfVX8oaqOuG2v3dfITYkB+vPtnqaCYXXVPypm+LxLF4qEvHw8KvJm648kEzKNFotEl1jjvGCL/+YIMhKBAaLI3nOZ+D13pPPep8EfN10AjwEh2ysnwa+3Kd+Fqg==
Received: from MW4PR03CA0110.namprd03.prod.outlook.com (2603:10b6:303:b7::25)
 by BY3PR18MB4803.namprd18.prod.outlook.com (2603:10b6:a03:3ce::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Thu, 3 Jul
 2025 00:22:45 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:303:b7:cafe::34) by MW4PR03CA0110.outlook.office365.com
 (2603:10b6:303:b7::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Thu,
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
 via Frontend Transport; Thu, 3 Jul 2025 00:22:44 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Wed, 02 Jul 2025 17:22:30 -0700
Subject: [PATCH v5 01/10] dt-bindings: vendor-prefixes: Add Axiado
 Corporation
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-axiado-ax3000-soc-and-evaluation-board-support-v5-1-6ade160ea23b@axiado.com>
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
 Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=878; i=hshah@axiado.com;
 h=from:subject:message-id; bh=76okLidoJP6XC526Dh0oE+YzQ6GEuPrslK8PDO1ML0M=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZc1RjoXczerhnzbjp7TGkzM4/pxU/+AOElyjL
 /eMLdr07c2JAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGXNUQAKCRDxWHMRoTLV
 +wOOC/9eiQRJGcwDdNkK1meUzArnpsO4ZoK9LrgF0eIjh1LZryuwvYElCtFpHTWFk2+kmcSPT/k
 q81CcV8qrqT3734G3dN46fUfFqK4NCjgLQBGY4X5C0rgCxBSPVOKieWajflXB43utytgdA6k7+X
 7omlIujL+1MbkYHAqfgLHzGLqIFlNWWDqqAn0hUjvAOaztaBQ68BTIgaF4hsyX/CM7uj4otsvuT
 oNWRhRr9BBjq7VE2iigt/dVwnHGAbR/fxGUIc+1ICT2p6nc5kdK7aAWgG1cwNUcPzauUWQ5K6ps
 8Q83O/kKBsKSrDzBOGVUYiyQKCRysumZSe5Kvv6qVZ663mAiO6G89LV9y3G2sp7YJr+HWNXVUMr
 HFqDpczKq29XUiATo/eZGLWWoNcYx70Q5FlRSLrgpGuDbRvvd0yr6G5/DslUgk4wxhIj6+kliLu
 TOyKYn/22eDHcUseHiKMw1ppVWW+/nq8CbsnaG67x9jcJ10k6sruHKD1C1qliBAT8oyCg=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|BY3PR18MB4803:EE_
X-MS-Office365-Filtering-Correlation-Id: 839083d7-d67f-4650-68db-08ddb9c7bb62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3FyT0lleUlzVHZxdHQyTmQvaHIwU3Y5anlsTzBiT0U4RURmdk5SWS9JaHlw?=
 =?utf-8?B?alF4R24xQVFpQm0wME83QjJZSjNrZTdTWFpNdUgwenB0SU1pK0J2bGh3ZDB4?=
 =?utf-8?B?Y3NVYVVFK0tCQ3dpS1Vsb0VEc01nZ2FrVTBmRmo1VW9jcUkrRmgvekJoSGJ0?=
 =?utf-8?B?alpqRENxeFR3VVlZRFk1L05CQm9LS2FHRE9GcW4rY1hsN0k1TDcvWXVKMUlt?=
 =?utf-8?B?VnVFWWdMSWdkSDNWcE1nbVJmaVF6SHZmRjczSUFDdHpEWnlwMXlhN2JFQ0hv?=
 =?utf-8?B?OEZTMXVhelBHS3ltSWxKUFFFYlZONVFMWTFJYmpCbm1QQUhhTzJidzJERFhG?=
 =?utf-8?B?cjlVbHBaU2xudWg0VGEyL3NiSmRYQnVjellXd0p3ajZNUVYvVWVwRTczM1hE?=
 =?utf-8?B?TWs1QW0wdDFjUjBqUWFSMGN2Y1ZMZWVORTk5RkRiOVk2N0d6cTM2bzdLYi8z?=
 =?utf-8?B?bVNVd1BMRUw0SU9BK2R6RUVVS1NlTldtNHBEd2JjUzZMWnJSaUg1MjNMYUZh?=
 =?utf-8?B?VEU5UEZ0U3V4ZGd6dlZYemFWakVaZElNS0hQajdFLzlwbDRmSnd5c1NQMXZY?=
 =?utf-8?B?OThoWnEvaG1IMkZmdlU5NDA5eXBkM2phcVRib0tsYzQ0OElEbVR2dEtTODRV?=
 =?utf-8?B?ZUhWQXg0YW85N3hRZUVOOGlGQW8wVGRSTnZtWEJMY2RNeVRsc0YwVDJROFVV?=
 =?utf-8?B?ZXp1aFFIZ0tvVWZmeHhnNHgvSHpobWVBSDlTWlBCR1RhdUp3K1lObkk5Y1Bq?=
 =?utf-8?B?dVVqN2FZc0k5UUJvbXNCY0taM3J0dXBKcmdSUi9HWmpqY01aTldUWGhGNm5D?=
 =?utf-8?B?cUhhRVZJTWdJM1NvZHhYNmVockhOdkF0TURLeXZTWHg4MzRSVTQzVGRQbGdj?=
 =?utf-8?B?NXVNSy9FeUZibEpFRG9OemovYWZJRnlsSDM1TS9SbkVuaHNDaU43dG9wQWVz?=
 =?utf-8?B?ZFdDdWkvQ1duZ1NwL1hHRXF2aVFlcElXLzZoWnhHejI4NlFnbmw0NkFVOVV6?=
 =?utf-8?B?VEhDeWUva2h0OWJ1TFZYVFFjZWhwMnUwbVdiSTAwZlFRRk9OVlBDUEFzb0R3?=
 =?utf-8?B?QnRkaUMwdDkxeG9xVUlzWXVHVzM5OWh2ajlkS0hndzc3UTYwYlFyaTdXeDZ4?=
 =?utf-8?B?SXAxK0Roc3BjaUY2TUxTRW5JYjRyYldjdFpEa1l4bXM3MERWa3ZZVzAwek1a?=
 =?utf-8?B?QXBZWC9MZ0YrVjIyNjF4enZBSTNsL2U2eGFkQWFYWWE1WjVCQXNSV2VjQnNa?=
 =?utf-8?B?QWM1NUpxOWdoaGducFRFemRLd3U3SFlnLytJR3VhYjVRYVFsU0N2SlRKQlRn?=
 =?utf-8?B?NU1EVTJsbDI5T3c5a0hremU1aVhCVW0wTlpWbHYzb09IUDViblFMMnZVWEpr?=
 =?utf-8?B?S2RuelpvZSs2T1BKVjhKOENaK2cyWEVnK1FSeExOd0RWelo3MEZhZ2pqc2JY?=
 =?utf-8?B?VFVpQktmVFlrVnhJeEVLbDhvbXlQTnNCMDZWMG04ZkJ1THk3akRxWGlQRkx0?=
 =?utf-8?B?d3EvcVpRWGVZQTJkTklWbmVBaWkzR3dwd1JpdlYzZVJQdFdSMDZTUWlVeW9t?=
 =?utf-8?B?VjV6MGhCVzMrSWFpUWpyVnBjNWY0L3JqSnc0Y1FKTzhlWnp2RSt5dGNqOGFo?=
 =?utf-8?B?eGRDbkt4WDVPMEd1SmdQSmNDd3o4d21BLzVMSE53NlVuc3h4K1RZOTRpNHFN?=
 =?utf-8?B?VkdGSUgwTzdyYnMxejdwS3hhU1NOM2ptRkJ3TjAyY1RMVzVwNDZPTWc2K08w?=
 =?utf-8?B?Y3NzNHJ5bkFJRWE3SlJBcS93MlQrOGNRbVFUeEswbkxEa0cydXVwRWNRano3?=
 =?utf-8?B?SEdnK3RZVHlrWDE3NmkyQ2hPVXY3bjFIZUxQUXVxYVE5WU1wV1NZTlpMQVp3?=
 =?utf-8?B?b2kzelZyRVNQVVBXZm9rL3ptWDRjVWV3Yk8xSFFFR3R4N2xob3V0cUNJeU1V?=
 =?utf-8?B?WElXa09Yd1YxVkgreE5ObTRYY0xxOVc3RGx3TERoY1kwVCsreXlDZ2hDL0ow?=
 =?utf-8?B?TFR1dFR1Z21RPT0=?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(921020)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 00:22:44.8981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 839083d7-d67f-4650-68db-08ddb9c7bb62
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR18MB4803

Link: https://axiado.com
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


