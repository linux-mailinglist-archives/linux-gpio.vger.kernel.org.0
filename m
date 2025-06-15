Return-Path: <linux-gpio+bounces-21603-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BECADA081
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Jun 2025 03:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 127543B50C1
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Jun 2025 01:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A8C142E7C;
	Sun, 15 Jun 2025 01:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="V+HeR2BU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2101.outbound.protection.outlook.com [40.107.212.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D7084E1C;
	Sun, 15 Jun 2025 01:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749950007; cv=fail; b=Fa2SUCxox9QzVNb8/K+eluYsLtNHPiuYKkT96v7U65x4QpzNG+vcKKP5tsWm1bjTTXZ/v0B6sU31lUJZqgyehvafxQgoZ8+yfx2sOox9dKpS2/VJHsfwU6KXDIuhQhTsClIyERig8FVFIhrqH4PY5OSuh9TMWY2aEAM2c3zbrf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749950007; c=relaxed/simple;
	bh=W2+dR9YDi2vH4QRD0vNtxQgk03X54wuYNgbB1HGy6Aw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vGtz4zlCjVw6WrEkAY712lN35+T+jxdQJQgz21gYpbU+RFQ2RgSBfDFnBJBl3VjqhuewEap8M8YzZOlksPFDD68S8XOcddALlfoQwH4ef9RnoPqs063engji0iVtvV9wrHrRI8SiGU2jd0mO0ZD3MVW+DXicUr6KK8tfO16OX4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=V+HeR2BU; arc=fail smtp.client-ip=40.107.212.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENTMUmKMOGrotHb9ImgGcvtArOGn2Y0DnaUCYxmQhPavTE21uvaSuyfS5EKt4dmkaelznJc7B+4wHYLFcwLCiykBNkydZzewfoKTRNisDXvf+935CNZSQvtaMpsq0zhRfXg0yEiT7ld0J+8snrcTuQTF9Z4EbORpHjJ4fYAWFbdZG3NDT37KIQluNafTUJyPIPSCm22k07lFFJkZzBrp65zRvoZ4u8J9mHS+k1L6n2xlzyw6IMXu2GLHtlkW/fOD+YoM7YA2pF/vxrnpTqszJnIyIzZytHOCMHmuawHYieXo6cV+DI4Yn7NvQ7JniQM0KTQY9C+aX+q1XBnA/MhPZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcZQ33YtoDnKL7sgOWF8I7ZiTpmL/obVvISsHWgYkus=;
 b=UkboKAB1vzLwAjDyn7BmYX+dVMdWF19bBsxBM5XMpLzLPsI1SQGZiW4JRE1Ot6iDY8X80g89w+qlrf1u1b4VtJHtpNSuLY7GEITI/4ZBAeGzeHNO7rD76cvsr4zfwww87ajRgPyJhjjhNO8ohGJNH6vKVtdcO+xXIAFnscEeicBdFOOgZ6zu4dv6VzQYF+H/sGQTlySrqrEMuG0m1ouVC+KuXZkrmGUhjeD8jBlWCAAyamG5JWhydTL57F3a51tkrhlF2+a7H1SckFH1FZlFwWb7Tq+f1gXNMNwyzIFtRXq/C3S+9rlfntX+EO+3EVQglGdO03XFDtSIyUYsuW5kGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=arndb.de smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcZQ33YtoDnKL7sgOWF8I7ZiTpmL/obVvISsHWgYkus=;
 b=V+HeR2BU9NwQhST8jvSuxPbXY+7ru+yRfDPgTjiZMOilhLVUzyt+DhCW24euNU8stBjc3XFDTo5da2jf4RI8hTUGfr0khzqBHV4sm1E2/CRCQ5Kcbuzx1U96pyCXoaTcUL0FQWz7Oklxnz7dPXBI9mVJockp4dLubkG7uTPrKDoiJ9X6Fs8qxL7wqj/m8t+Pgfki7m5rJ6sbxTYUsoS13WPJRp+eyCZXEod8thDXVeQ0RolTXdZ8FNd7l2klYxJxPCE3Ub/sJwQjyLNugzrCi2zuhftqwQnovNuD/4uy+Q3f/5NtwX7JpF5rpixZSJfNGy4Mqrnx5YumN9N+dWaELg==
Received: from BY3PR05CA0013.namprd05.prod.outlook.com (2603:10b6:a03:254::18)
 by MN0PR18MB5941.namprd18.prod.outlook.com (2603:10b6:208:4bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Sun, 15 Jun
 2025 01:13:22 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:a03:254:cafe::66) by BY3PR05CA0013.outlook.office365.com
 (2603:10b6:a03:254::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Sun,
 15 Jun 2025 01:13:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.0.1];
Received: from [127.0.0.1] (50.233.182.194) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Sun, 15 Jun 2025 01:13:21 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Sat, 14 Jun 2025 18:12:51 -0700
Subject: [PATCH 5/6] arm64: add support for ARCH_AXIADO
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-5-327ab344c16d@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281; i=hshah@axiado.com;
 h=from:subject:message-id; bh=W2+dR9YDi2vH4QRD0vNtxQgk03X54wuYNgbB1HGy6Aw=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoTh4oLbSu2wJg25ZgEee+Ims9iT2AZW6tpxlGa
 SaExYWLLfGJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaE4eKAAKCRDxWHMRoTLV
 +7iHC/wOPtZGPgIBw+w2uHAUKbhCFdG7XQCDgaxEEybyeqOjR7oCKhDLphkGEykF/OxhlKsO4vj
 4oDv+Fbhjfm0fF7YVtrdIe4z3q68ETLOAC/7z08ZgbyNF9he/iXkKi76F7IyL7iX+PVIBDjFioh
 oeu6nHTcy9BkDriLvxpUTi6NiDipURpI+d7AFIUbWVXUg0+MeSNgIB4zGPw2CGbg5tLN3YLo28E
 0MSvmvNVaseG2s8gtxIhpvMjuKxXAiL9ShGPX9/PG/Y81hziVvpioyK7tdXpHTcaYnA1uiObWj9
 ef4LCKrnw75lHpDli+0TXDvR5Yhm06fS3dw31XNxhJjdxo3h7k9CrdiCl9nTpx+sWNpngnyES3J
 d8PcxlfvU+GCDuqg54g19q6No4GC0zi4YZR3v6VI65EjcPPkHlDLN1HF1J/UajYbV2StjvETU7G
 yj1TSL1EJuqEBKQF0cMCQ00fZRJzw6z4idRY6+Ds6bhCxYo3y+EkP0LLGrgS9gQfJxMXE=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|MN0PR18MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e6b07f1-8bd5-454f-b66b-08ddaba9d1d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0lqM1hkdE83UnlPMXBNZ0psV0ZRL0plb0llYkU4T3krZVpHY3BYSStlbXBk?=
 =?utf-8?B?WmFvd3dNVFFFaGV0eUw2b3VXQUJIeVYyNXBkVGd2Mm14OVVIclhpWE9wMmto?=
 =?utf-8?B?SXpyeVlIc0JUWWVZMGhkcE4wQmt6SnVyUXVvWTVUSmRVVDZzWXhrVkZGS2l5?=
 =?utf-8?B?cDgxNVJjbTNuam5SS2lqQWRqWlZsSmRGNkQ1bzlOeHI4Zk9ad1NJK3Z3Qmtv?=
 =?utf-8?B?SzUwcHpBbjdUSFFvT2U0dHE2K3ZRODhqRU1adElkdlR5T3NMbFRPZWJHK0g0?=
 =?utf-8?B?T3Y0OTlkcnFVZUh1dXk4TGdXU1B4OWFGY1VGZHFEZEgwUHR5TEhFNHQ2UlVu?=
 =?utf-8?B?aXFZMzF3Tnd3MU1IblI1a1FDdFZuVnJNNXlEbWE4cEVsU3hwTFhpVzBsT1cw?=
 =?utf-8?B?cDgxd3JvZlpOdTdZMnhWRGJaTjR3VENtN0txdDl6VlNEVzZia3hOOGZsUUl1?=
 =?utf-8?B?aUo2d2RpQ01rL21iVS9UcXF6SHNnbEJrSVEzVE0raW1kcVJmdEVTa0tpTEwx?=
 =?utf-8?B?cW9JM2FYTnhweHhZNjc4WjQ0cW16MGI4MVQvaFFQSFFKbnFycEFNU3J0amxh?=
 =?utf-8?B?cncvYkZjWm1rbm50NkFLOWxaSmlwRmZzN2l5WTU4OGQ1OHJ5eFk0KzN2VTRz?=
 =?utf-8?B?TVVPS3BLUWZBcGpoNk9uVkRkSDNDQ3RBVnVtQ0Via3VsQmNHOE5LcTNuUFMv?=
 =?utf-8?B?Q1pvd3dNMFNjdGdwS3VNd3p2eWN6bitFeFBiS2R1OUhyY3hJLzdBT2JEemQ4?=
 =?utf-8?B?cWNqdjBJbUw3Vi85Y3UwSWVXUUJsdW16Qng5M3YyWjBadlBLelVoZmlyUXdL?=
 =?utf-8?B?cnRIdFhFa0hRUG9wNmN5bjIrZTRJY3FzZ0pJTFNwaEZBa3hKS2VwS093REt5?=
 =?utf-8?B?dlhPVmVGMWo4ZEZSK1lmN2ZNZmdxVkxRNEFRVk1EaTFFeHFuclBncDNNZXov?=
 =?utf-8?B?YWNiMTZhNEhiMTEzKzQ0YncyUTlBenhoWGg0ZFE4OFc3bUFjbWs1Q3BwZllU?=
 =?utf-8?B?N0UveDQ3VDVKNTk4dm0yckVmU3RBVXNjYWlLV2xMRmV6VTlsajVxZnlZZ1BD?=
 =?utf-8?B?dGlaNkpQejd3YVE5K3dvSDRsVE5HWVNxVWpabVpaeFNqS0Q0YkhBeUNpa2d2?=
 =?utf-8?B?TStJbEZ0cWZ2c3YybytQcEVhaXBnR3NpbURqOEZ3NzV6emVjOExDUGhVWEJs?=
 =?utf-8?B?cWxoanRxVmY2Y0p1K200VDFUelcyaEVPcjE5T3F3Z09MK3hlNkVYSEJXTkxh?=
 =?utf-8?B?R0J5UUs3TXpNMFQvbXpLRHAxR1hCWHVkaU0rTkJpaGhzUDJZVVloZFBLUDR2?=
 =?utf-8?B?S2taRHhCWXh1K1ZDVFZMcldYbFkwUXZIWk1qY0Fyc0RSUmNaUTdZbGJtalkv?=
 =?utf-8?B?Rm9nMml0MU5RSXlFa0VsbkY2UDJNODkwbVZvQnFxamhaQWRvNWxNTnJVVXlQ?=
 =?utf-8?B?ZzAvS2hvR1E3Mk9ZR2lIVjgwK0w2U3N2WW5ockt0bXpMSGRvRDUzV1o2SVI1?=
 =?utf-8?B?UmV1L1hCeUd6WWhxcjEzN3g0dElGUVloQXN3VWJMaW5UV1g1ZVR1VCtVL3I3?=
 =?utf-8?B?K2pILzY1VDFFWFpZVThyalFYdlV4Tk9xRTdqNDBZc2J4V3ZnaHhEQVNjUmpw?=
 =?utf-8?B?T0ZGVXF5NTBCNFlNSVJKdkV1V3g0UzNRby9iRVh1QStkZWptQUYydFBZeUhH?=
 =?utf-8?B?S2xhNnhwMlBhYVZiaU9HamdraTIrTDZzOWdiTGZTcDNtdzVBcURJZkVrY1dN?=
 =?utf-8?B?eEprOVZoNERBNU03c1FPRHgwRnJIdm1zaGpxUEtHS3FRelVTUEUvWUVHNlZ3?=
 =?utf-8?B?MUNkbVJRTytUSThkTHpyUjlid2owMHpRanlHSGpoMVZ4MGZPV2FlTW4vdHBt?=
 =?utf-8?B?eXI4cTJqSjFESWwxdVVXOStKMDltZEgwTUUrODgraXVCWVpOVVhETzBJcTRp?=
 =?utf-8?B?UWRjbUtmZzNmR1pHSFRrSXFyOWZPWkxyTUtEVmQ2eWZrUmxSSUNYTUFLZ3NZ?=
 =?utf-8?B?TEJPMW54NDFUYjlXd09XR2JOUkcwTjUxc0ZlZHh2c014cittMkFjZFE0eGdP?=
 =?utf-8?Q?Xggyzq?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 01:13:21.0908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6b07f1-8bd5-454f-b66b-08ddaba9d1d3
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR18MB5941

Add support for ARCH_AXIADO in existing arm64 list and add
the same for defconfig

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 arch/arm64/configs/defconfig | 1 +
 2 files changed, 7 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a541bb029aa4e1bee095ab3f44e3a52294905616..e998e1aff0fec4aca5e3bf2d0410f2578e25cb1d 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -40,6 +40,12 @@ config ARCH_APPLE
 	  This enables support for Apple's in-house ARM SoC family, such
 	  as the Apple M1.
 
+config ARCH_AXIADO
+	bool "Axiado SoC Family"
+	select GPIOLIB
+	help
+	  This enables support for Axiado SoC family like AX3000
+
 menuconfig ARCH_BCM
 	bool "Broadcom SoC Support"
 
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a91b79770639d3eb15beb3ee48ef77..96268ade08aff844ad833c18397932a059db5499 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -38,6 +38,7 @@ CONFIG_ARCH_AIROHA=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_APPLE=y
+CONFIG_ARCH_AXIADO=y
 CONFIG_ARCH_BCM=y
 CONFIG_ARCH_BCM2835=y
 CONFIG_ARCH_BCM_IPROC=y

-- 
2.25.1


