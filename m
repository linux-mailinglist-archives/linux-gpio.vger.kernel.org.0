Return-Path: <linux-gpio+bounces-22754-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C623AF7FCD
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 20:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1B1B56668F
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 18:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B0C2F4333;
	Thu,  3 Jul 2025 18:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="QU68LA2k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2098.outbound.protection.outlook.com [40.107.92.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890542F49E8;
	Thu,  3 Jul 2025 18:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751566876; cv=fail; b=ikVjtp+EuWTeo/zGP0w6VEnVx2J/xFxPDisf+a6EQT2/OhxcxeyjIr5k+9lKjEWYHj4ozsuJlO07uuifxYiQhr4eXNX9CxPV5VXCFHQCTvFKKmtIxLs2IpFtsGSslLba7OuEqer7PRht6WquVth9sKgjgPI+3h2hCrnjQLlrMkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751566876; c=relaxed/simple;
	bh=h7/reQekMZR33wAXmkF5fcG5ZASoES1o8MpTsQBpBy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mZpCjdSvk6DlCQzzZpx1Ug4vl3SIC1bs2XVB+WiHcfgmIASgXExdZr9tYZFKvZ6nAF5+R9tl8wR8PO0MvSbdlt5tw9fcVlgFjZf8ZXGjkeUkQiT8NFp8o0fxpZ4MjLV+3qR7RG2yF78I0fvyKNcVS1J6vpDyO9DnA6jaAqClOis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=QU68LA2k; arc=fail smtp.client-ip=40.107.92.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BxNDQM1n0J6N4Qes1kgxdabekViKeeb4QenJ87S9IIdBA6/zYwKBpcfUknwAJXz+BQGQD+oPhmpOp+BBozh7e8wuJJFixGOd0TW1ffr1xmiq7HmorY3WGTN5TK81vKgFHCRyTJqLpmv1K2t4TqlVd3ZTYmUcCMG68z2ig+mf1Dx5Q0LE44qAWYG7Zn2pbyAd4z+Ejmh/9kuo2a/6WM41oB+ln7T8VF68rhk8vj+gO+ZuJ644/p0fjAz4pLtI9BXYcLZt7jEG4z3pg0WY4P2ghI4xZewpriRtPOTqnoytuGCMPYpqecoC/wSNlFyVWUqTuFsRlHz/1xQ6ck0aSjt+rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eGSMBpgEbEaJCnQ0epbgv38LSg+oygYq6YuZdlPPI4=;
 b=nCUkg/gRY3b7pMikpqfr9vsG57fpKbHX9cmsO9ge6LwWszoS7wtzKbWwSashDxIEprrxrVT5yF2VIcC5JBqwBFPOYlafiOkNps9PhBsvDJixwYx+JI0DCs+Crw+8w4tWWzo4Tf9xCKKtWgp6xvFUuFjQyV6fxpf2sI8lZpSKvUtSi10Gf4aRe2inYI36vPmDIXfqK6aNkgoeGAACE+atewWnQJC7j0JJ247+lZeWQA6WL1JQea+sPqDQ0I3XZYTMFn3/BOW319+DXke9MxrReZy7Qu0ZEqTipJ/+kLpnXZ+K4gzcaFZPf1PeFQm6WDrzjQbczoRBfaGk56v9ogKDTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eGSMBpgEbEaJCnQ0epbgv38LSg+oygYq6YuZdlPPI4=;
 b=QU68LA2kZ0Ch9ILf9YZIye5vVajtlvt2ac1RA9qoohpCvRV50rQk0tZV8DSc9g311l7Rlt3KZcseMi1uigShS5Hq/9o54Gfjk03TjLDRbYL2DKzdxkc9qjsI5zmbxihrvfO92fuPIdeJnAFT2uCMR36cePKTG7RooAK3syLS9Xw1BUBl7bJZQGWMu5OUoyqsRU8+XIsWO2nrpda+62oZRqXpmdQ/sJgSX0w9jK2GmBYYWEEbDaWIt13aSGzHAQ208/chTMSjQPVxV6/N5Itw/BFFHIoC3RhyoO3c4CBUJoApG+qQS6jqNsiONL1IP9/TojMbC8+WecKi/ilpIZncmA==
Received: from BL1PR13CA0319.namprd13.prod.outlook.com (2603:10b6:208:2c1::24)
 by DM3PPF901E5EC44.namprd18.prod.outlook.com (2603:10b6:f:fc00::6b7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Thu, 3 Jul
 2025 18:21:08 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::4c) by BL1PR13CA0319.outlook.office365.com
 (2603:10b6:208:2c1::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.12 via Frontend Transport; Thu,
 3 Jul 2025 18:21:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 18:21:06 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Thu, 03 Jul 2025 11:20:49 -0700
Subject: [PATCH v6 07/10] arm64: add Axiado SoC family
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-7-cebd810e7e26@axiado.com>
References: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
In-Reply-To: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=858; i=hshah@axiado.com;
 h=from:subject:message-id; bh=h7/reQekMZR33wAXmkF5fcG5ZASoES1o8MpTsQBpBy0=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZsoAmzqR7pYFUVuKCtAlh+wj8cNVVn9iu6YP5
 mLG6eGZermJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGbKAAAKCRDxWHMRoTLV
 +9y5C/40BLq04SOUTOCQYMnpDLZIiynwxrxZCYPeRnkQkBwNMjABqL5iCScDHm1oTfzvTYlgBS1
 X6w8OYcOGMIKvbAX3qH8gWzey9Q1QLYLLZ/zGOkHG9JjGYnSkUypoZaDwfuOsgr6l2TprPrVvox
 5BgaFqRv4MzH32iWWes7XTU/f5nPDxu+co7P6jn31b5UMVExOyFUAESGvddlpl77of+pxmfPlkj
 yx4c1U11NjWFufFAdiGlvMr3xAvVelInBkfc6SPjgFT3Y0Alacq4A+It1CFUGbNbYF/mXbp3Anr
 I2LaSRD0RkICKxHwiGk6H7VpnH6xLGqzgrZcOIFbjohL79CPbSRegswyZUv+1n3PHttYFprjVKv
 CI8QgWe0y4QirwjI8JDAA2B+DidgvMDJXXZrBJztxJuC9kMqP/WWf1+Yep4UZ6xS/x0IWuUZtv9
 D8PsUK30wo176Fsp5eBWjDQxyMqtjhQah2e3X8GeNLJQTFxAEyREEFa150omyvOOZ1lW0=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|DM3PPF901E5EC44:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e850a63-fb76-4f82-28de-08ddba5e61b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c09heFJSUEZrRjU0b2N3d3JibXg2Qm1QS0ppQWR5Zk40TitkZ2ZqNGQrejh3?=
 =?utf-8?B?OE9ib0t4eDNYaXA0RDN1YVMwZ3ROK0d5Z2ZpN0xwSjlzYTZxQUkydHpwWFFX?=
 =?utf-8?B?dmRFTVhOS3ZiZ3BTRVNLM0dpRG1VbEtTTHQyL3hUT05KaEwvS0JhbE55cmRz?=
 =?utf-8?B?eld0OG1RaWVOMnN2enhEYi9pbU5hVWFuRjhLLzFTQW5nUUY3UnFGd3RpMFZr?=
 =?utf-8?B?eTRaQUFlWmwxdEtVOFJpb1NPOHRPblVHT0xPMGZWazBiR09heUlkMFozVzBV?=
 =?utf-8?B?c1RQQlFMamFMSmVhdS82WUtEVlFrOGQyN2w5eitSbGZ1NmpVWHR0TU16N2Fi?=
 =?utf-8?B?MVI2UVJBaW5LalRPdDg4R005Zkl2S0lnZzZQa1l4bHBrakt3M3VKaFVCd2J5?=
 =?utf-8?B?NHlnbzg2d0kvbzJCWkRsWGtGYjFqaHZiVzVOUlY3Zm5oYkVWTjNjTEJaOXdm?=
 =?utf-8?B?Qk9aTnBNWkhkYURxVWN4eCtwMzBsUy9XWFZISGkxdWJJbEtaQmpTSVhoNURa?=
 =?utf-8?B?YkxyK09hMmJBdWFJcTZxTnc0MWFCYjhQRmdyZGw1VmNUcXFqNjQwcnRTZ3Nl?=
 =?utf-8?B?VHdHZVpWSDJUUkRTdDAxZFpVeVNIV1JOQkhRUjZ1S2NVOHBmTndJV1I4bS96?=
 =?utf-8?B?ZWJreDZxWTAxdndNMDFFTU9rdkNpQUhLVExPWjFRN0wyTUdlZjNQeCtVU21z?=
 =?utf-8?B?ZmJ4V1Z5MWxyT1ZQWmNBMnV4VmxYNFQ5Y0dRUzVaL1FWTStoZmMxcGo2emg4?=
 =?utf-8?B?emxOQjJQRFBiR2pxbGN3eGtSNklJNmc4eE85bzBWc3pYNXBGMmNsZFJ5Y201?=
 =?utf-8?B?dGF2RTdDRkxTS2k0N1NOa0FkUkhWMlVqNUI0Mmdua0UyeXYycE9HNTY4SDNJ?=
 =?utf-8?B?Q2xnK0FtRUYwOGxqVUJXTG50dnRqQW1QSGN1dFRGZzlVTk9HeEZzdWVNQzdo?=
 =?utf-8?B?NDlXM2t5ZU5lOU9GWE45bGJiS3oxcy9aMGdKWEl2c2NyOFVtNHhiMko3VFJy?=
 =?utf-8?B?WGMzYjBiZFpML0tCeTJ6UGptQmppdVdnNDN2SzJjdXBVVWhQSmpHaUJVQW9v?=
 =?utf-8?B?RGxqWnV2b2NFNld1OGV4b1FLQ3ErTHNsK3ZiRHFXUFlYMVk0UWRMWnhnRHl6?=
 =?utf-8?B?dDU4OUJPNlQyMmtsTWtlUVp0S3JGV2R5L3FQWHBuV0h3S2xnYW1sem90Nk5i?=
 =?utf-8?B?bWxNZVdITXVjTlhOQUZZb1RYNmNacmJMaDA2VVFNRFByMUxMT0JqWnhWeWhw?=
 =?utf-8?B?T21Gd0x3SFErbytlRDVOcnpQMGhLUDlYM2ZsaHFGYnJpbzdabzFKNkRHeDZi?=
 =?utf-8?B?ZDFMZktqcmJZU2hBZUdDTkN6WkUzdEE2dWNzcjgvQUQ3YzVTQU52T2crMEg0?=
 =?utf-8?B?OHlYRmxPNGw3aUh1MTRPUEpGdmtaR0JkTkxXSEdqdlZCQmhCOUdwNWdmNkwz?=
 =?utf-8?B?YUtWckVGVDNLM2ZnU1ZMZStvRXpqSC92dlNSbW1jWStEUTEvdWVBTUNCR3NU?=
 =?utf-8?B?dkhhKzNpSkhKOUVPVE5KUFlHSTBHL3JwS3dTTGtEYklFRlRUaGpSajY3S0Ix?=
 =?utf-8?B?L2h2ZHFiaG1EalNVTE9WM09GNzBpVHBTMzJOMzY1VVltb1dJL21ERkNjYVRT?=
 =?utf-8?B?TDQxZDBnN081aEJqNHBSZDhpWDhhWjBpZVV5dEVWcXByY1diN2Z0a2QzUjAw?=
 =?utf-8?B?RXlzbjI2SkFoTVdpVjdzVVBnaTlYTFN1Y2tDVTVyOXVBMm1pL1R1TEpyNTNy?=
 =?utf-8?B?M25CVG5MMHRITElzWkdiSWhZZGg3TkE4M0Q0bHVidUFkUi84bmEzM083UkU1?=
 =?utf-8?B?M3U4ejUrR3FsWTNDNnVoYzlOVnBJc1JwK0NlWGwrRmhPNzNyQ1ZvSzFDR3E0?=
 =?utf-8?B?ZDdlRG5ta1JSZS9PWWlvUVl1NmZtVW92VlVTRG1TSnBEZncwVFFRR3FXZith?=
 =?utf-8?B?bWZxK0sveHFkNmxmU1ozamxCam5TeTVsdlpTYm5ZS21EdzduNFRLQUNqQm9t?=
 =?utf-8?B?RUhNOEdVN3QzYWpSbVRUOGRjZWxhMnJBd2grc2VhSy9GNXNoVmozZFJyOEdk?=
 =?utf-8?B?Y2dMTVdjR0V3WnNJWmFSWUxmMFl1cVcrRUIrQT09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 18:21:06.7224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e850a63-fb76-4f82-28de-08ddba5e61b7
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF901E5EC44

Add ARCH_AXIADO for the support of the Axiado SoC for arm64 architecture.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

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
 

-- 
2.25.1


