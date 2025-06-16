Return-Path: <linux-gpio+bounces-21617-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A543ADA72B
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 06:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59052188F181
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 04:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86231D5AC0;
	Mon, 16 Jun 2025 04:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="lMl/UCnK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2102.outbound.protection.outlook.com [40.107.220.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273A41C1741;
	Mon, 16 Jun 2025 04:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750048316; cv=fail; b=COEUK0l8dVIUTAy3jifwxuxg8tnP8qBOiE2YT5jyJnYTzdUOWsMHR5QjP+NNwggbxOXBPZ3EbYh9Ku/gkOk2XPDvSJ7B0Y59wZUJxkKPgCJe47Udwrmj4/0l4Zd9yg47OM4C+e6HqKgMh8wF/9I4RY4ib5rcqtZzyGgt7EDSa/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750048316; c=relaxed/simple;
	bh=W2+dR9YDi2vH4QRD0vNtxQgk03X54wuYNgbB1HGy6Aw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lCaPoNdDvw1xGLg9VdiqbcybuYpx5XUWcJQ7CWmwVMeMrV13TERyCmVAnb6t8TQLEVVcLJqnyqE6wx9cjhDf795mDiVOdLOVdeehYDRi77uHXXOgeq7h99y4NJ/9iSngtXXs3NlAe3u8EP4jCMDc2p+TFsCXj7qIBFkkk4be1mU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=lMl/UCnK; arc=fail smtp.client-ip=40.107.220.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHgKdlQ6Gh5NydaKh7f0JuOak2OargqmlWLuuG6ySYIFimiJxWCvcfpoEeqe62g8NWtZNl4Q47wyF7cnKgWg4iB5kOljEmBol+Htt3pn4CK1o85oRaeu2cyX3LmChzk5ShLgUoaZwuTdKfgtzTTkAnk0vZE4YupzhgU7mQNe0T1pijD6WGoXNcQwIYEp08E3mJ5FWb51Vo5gT24+IfPnrDg6fB+Y7XBPo/tnCWxtA5Dphor/Uuz9e1mBxbNFRtcwcZaUhFuCAf8TbsqJZnzLkGZ853ymeaslDVR7EGdxt5VvT2zDjnMN8Hvf4Y0mWOkraSKwl2uNvqSen/cFpyV1YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcZQ33YtoDnKL7sgOWF8I7ZiTpmL/obVvISsHWgYkus=;
 b=FRh11Zr9s27i5W+qYlGhpTnykH7TcM9h8d0CLa+IuUnVqMMhL/8C+fR0i5gw7ro6wawIMPjc7zngfwub8P20qvXYoJ/YQLSNcLR2VCj4w+rHM9MelcvrVog3EfDrXbTohvq1MAdPjcv+WJDomwMqSWGP03fP5yl5Hp/g26TIv1WBxmALArHlXFxp3s8jlxooTCRH3CSyw1tlPHMM32O++jI+d7ma1gNRg3EZmG4c9TXGCkhxBNGTjkgXPU8tXG+b+HIA8UH2NQj6hunTG/Q5D+UN0nbO4T0DiXO5MQ0gQ4uo45Pv7d7zQw6T1Q2U0jUS2T3o5TKq05chdmeJAslt4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcZQ33YtoDnKL7sgOWF8I7ZiTpmL/obVvISsHWgYkus=;
 b=lMl/UCnKYjjq4fFDQQRU4G7SSHk1YRDBWfcuK6fpZm09ubNT5lib/9DRiIBzLWHCU82OAjcrXrDjZACjwDArHajRb8f5uyt+Q03Wyodjea1Cc9r4b4AOiGQ5lD+keCtccCKqAjDK2sh/UuVedNajQPJZjrCDGmwi54byimRm6dxWHGplsOCCguKHhyiohAmdYUUoh+PhRlVnCs0RzR8nZgPtEIv8HB4Y6mVR8/t0KEdcfjYli9bZZViZ+klr5IQscMRgJEGRyalaJuupdqKpOSqWGLMG/OuLMnZZvvrBT6GCcKhub7tIgp8JjroyMfNmqwJRn5Wk4bXre+jeGQGISw==
Received: from MW4PR03CA0076.namprd03.prod.outlook.com (2603:10b6:303:b6::21)
 by LV3PR18MB5662.namprd18.prod.outlook.com (2603:10b6:408:1a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 04:31:52 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:303:b6:cafe::ac) by MW4PR03CA0076.outlook.office365.com
 (2603:10b6:303:b6::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Mon,
 16 Jun 2025 04:31:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.0.1];
Received: from [127.0.0.1] (50.233.182.194) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 16 Jun 2025 04:31:51 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Sun, 15 Jun 2025 21:31:38 -0700
Subject: [PATCH v2 5/6] arm64: add support for ARCH_AXIADO
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-5-341502d38618@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281; i=hshah@axiado.com;
 h=from:subject:message-id; bh=W2+dR9YDi2vH4QRD0vNtxQgk03X54wuYNgbB1HGy6Aw=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoT54xOQJIPZiuO9AoQ96LJVbTKQg/fQAXxM5wD
 df2ksurz8SJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaE+eMQAKCRDxWHMRoTLV
 +/aJC/9vO5eV4h/+Mj0YpsVN0uOZCNODTwd38wlfbbSc98xZC38OZPhGO+eeUpSveoIphBe6Ic5
 dxacJnDq9y7CuRkB8hskMcs+dnVObY+YSxgHjt6GMALSb6O7n7fFxaIsoMXmpbfy+PEOwXOOkAa
 /s8Dt1xr6yOTZWiXnYxP9bzIbDl0kw5Qb4bdeQnj+E1vaw6iPOeB4cOp2jqnq6vOPmADDwhbabk
 UcrXcYXRgj+VRDQuMPiZA2KE5zNONE39CJJNvzen/ZeSssHrVwIO1L2zQix9JVDxq3DYI+Tw0T7
 Y+LMelF7RyHPFTKkkTTYkHK4RpPX26UftjlOD3tyVhIMxkq/oDi52bxaIXV5Ps3Rr4201UIC2bJ
 8xnfH/U/KgIPtQjf7oJKj9vHc6QMEAizwxHkAJ8vMJIhYOFWMaTZGlzHcYzZhRAdAgEi3CiXOgX
 8E1guF+6bycbwg9BJvL0IEV+WBzYF3DcP0UTYL/ISNIs9HKKuf8EejcIVhnr3zZNZaN6k=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|LV3PR18MB5662:EE_
X-MS-Office365-Filtering-Correlation-Id: a4a345d2-95a4-4326-d9f8-08ddac8eb756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWFxcXRxU0g0dW1mNnkwYkw1ZUJ4dnhqY01JWkdDS3hFdGRpbExveHFMYWNN?=
 =?utf-8?B?MUdiS2lGSUZwMEpMRmFFWVpuSC93cGV6eG16S2loQXNjeDRvc3ZzcTFLYy9V?=
 =?utf-8?B?Y0VhQzFBbE5QTG1NdHFrTUkvTkFFd3R2bDIrVHVtdFF4Y25VUEhDSWx0Q3NT?=
 =?utf-8?B?NGdpQ29MaDZ6eFYwSkxiblBiMmczSTZscnEvVXlvS2tzaUcxdU1iMUlTWWlI?=
 =?utf-8?B?YXl4OEZiUHBFaUxoRVIvM1BVT1EyNC9KYUd1eXZTUUljdys2ZlZITjVaNjk2?=
 =?utf-8?B?MkJYdWJWZ21BTTFncUFtcUxxNmxrMnVtelhrWmJBSFZLWlZHNEdyS2poTURv?=
 =?utf-8?B?MXRmZFF3VWxZNEVBSjZGTWQ0WVVGd25DVDN5S2ZUL0IzT1ZCc2F5NnFZWHl0?=
 =?utf-8?B?ZlhHWjlaK3VKMTZ1ZDlFZGRJM21GbWY4MC96S3B5N3AvajBwRGNpOWxTbWpN?=
 =?utf-8?B?KzArM2RHd0JOZEovNW1sRmdBd2JhSG53NG15NVRHc2l2bjkyUjFjcWJJRUx5?=
 =?utf-8?B?V2Vpa29SQ0svc2E1ZWlZNk1VWVlXaEZmektRNzVQVUFiOGJ4eEZjRWpGZUVX?=
 =?utf-8?B?bllZNW4vS3lJdDNDVmcwMTdUNjdIZWE2b3cwMmk4MmYrTUJVdHpjMzVoWVhH?=
 =?utf-8?B?NmtaSTN4Yk4yemNRcDIwQktMN21idlR5ZW1jd2d3L2RmVk1jNWpwWllGM29z?=
 =?utf-8?B?SWdGUWVQWHRibU9KekdwNWhYSDBYbFdNSFZ0WU1YYnZycmNZN0NSbWYwZFlM?=
 =?utf-8?B?RkRMTW5kWFFDQmhKQTZmcUE2MUNyb0g0eW5DNVlCM0tubXl5ZExqQWc1eXo2?=
 =?utf-8?B?VU5oaDRZb2lxVk5Md1FGQmJqMEpPRzVxRXVNQU03azhxa3ZCUXV4TkRlcGFm?=
 =?utf-8?B?UjhDTDZQT3JDcFVKTnQyOUpnWmhwdmFTUURzZlNiNDhEVEx2Nlo1T0xVUm9o?=
 =?utf-8?B?UFhmK3VHRGJ3M1NnSFdyVDB2VlBYRFNQYmJmaS9vRGZ0SGdpSCtDVk9MY3hZ?=
 =?utf-8?B?Y09GZWsyYmdDd2VWVytaNUtnMVZIU2xHaHpLZzRjYXphTnZHajdLZ2JoMHJ6?=
 =?utf-8?B?azNrb1FHemVYOHNxOWZyWEFNMFNnQmxVYlhiMHdiWThXWXVMN1gzYStNWWQ3?=
 =?utf-8?B?QWVZSzRpS1Q4RTl3b1VINjlKeUNXUmhrbzVWZTY5ZnRjWjA4U3ZVV0svMWtF?=
 =?utf-8?B?SHViVnBnbDRNMEc3algvWkR0bkNUMCtZeThmNkZDNHZNTC94ZStrN2hCbjBT?=
 =?utf-8?B?S0tOSmxnOGo5YlkvVHp0QlM0ZGs2dnQwOVlOejVBTDc3d0xMWFQ2SnkzcEFU?=
 =?utf-8?B?L0EyRnVIR1RBRkRKYjErTGNaRWtxV2xFL1FhSzlMVEVNekNKQ2xPMXFISEtl?=
 =?utf-8?B?NGJqVGsxNCtYeFBwSFMwdzhUQWFjV3RsTTRxZU5hblpzMTBpWUVBNzI3cGF6?=
 =?utf-8?B?V3N3QjUxRlJKSFhuMmFPV3hRNjcyRFBZbkFuMmtoODVmT1AxczFXRkJlNHFZ?=
 =?utf-8?B?dkFSSlpSOWx0cDFjbXZJY0JyR1E2Mm9lWWZMRFB0MVZGSmtObGhzVXQ2UlRG?=
 =?utf-8?B?dTVxNnRzQmFYZnVNUzAvUXgzdlZQdkpISVBETVR2MHlpWGQ5WGgzMEVteXcz?=
 =?utf-8?B?bnNPQStwODZZTS9zZENtTmNrY0prTmttWE1VbWxLQkZudUVQa0hKcnc0Z25C?=
 =?utf-8?B?cENESFNyNHlEUExxRldNSVpsZHVVUDJzeS9FUUFzTHV2ZDl2bW82NjJtK2Nh?=
 =?utf-8?B?ajhva2VIbFk3d1pCYjhxM3F0Y28rVEk1OStnMHRhWE84OFJsTUF2TVlBZ2pY?=
 =?utf-8?B?RzhmZ1o2MC9lR1UxbDJ3M2pPVGJsMnFOY3JjZ0YraDFNbjRILzBqaGhZVlFm?=
 =?utf-8?B?NVlWSkVMcWU2Tk0zcHpXUlZhbTRiQ0dmbUY1d2lwR0pPTTZsRU9Ea3ppcm1S?=
 =?utf-8?B?TVFFL0pPK1JTU2xVUW52UERKTFZyWVRTNkt3U2VYbExsVlFlYUZic0w0Q3NR?=
 =?utf-8?B?Y3kyY3BsSnhkY28wUGFpKzRqU2J4SVpuNHJzc0cyc1Q0d0VNWW04M0R3Rzdy?=
 =?utf-8?Q?8HpEKx?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 04:31:51.7211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a345d2-95a4-4326-d9f8-08ddac8eb756
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR18MB5662

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


