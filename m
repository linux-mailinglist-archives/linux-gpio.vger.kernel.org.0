Return-Path: <linux-gpio+bounces-22547-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1689CAF04E9
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 22:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F330D18900FF
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 20:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE012F1999;
	Tue,  1 Jul 2025 20:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="VH26fMwz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2098.outbound.protection.outlook.com [40.107.237.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE7D2EFDBE;
	Tue,  1 Jul 2025 20:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751401687; cv=fail; b=WvysQw3fUFNGEIaYXZVm9TtYLfq2l74pUAPeQajXWpDCsjkNrGUoJ5KcrHGbjs1JQOuRgq2NVNx73c5n/d4lIQiYdZ8jXjf5iJNdVjvaP/E+W6H+1kv4V/F5SjEGlTcHFSTa2zJX4R84H0AQHJmZ6Yp6Jkgcx9J+RKupi44xIwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751401687; c=relaxed/simple;
	bh=wasBNtUEn7bp/0zcFhO21l4GoYcsVPb4OUeNpfZS2j8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z1fbZgZDaxQnPEMRlV0BbQ2hBbB+GQe34jiyuBx39Jw6zsahuRpol8C0oChfTIL66tlc99Nrcuoj+HCOdqIUe05OGIGYvOLxAipMwo63lp6F3Yf7LqbGCh5W2EbEUDVk9O/rNzXUwnodHEwAMAxe/7EA0CJ/aThQ6XzsuSIrgdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=VH26fMwz; arc=fail smtp.client-ip=40.107.237.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w0qjL2EulWfvP0jsImf0sMx6Ibgj76uglhSEONRuH20zuqbksklGz9h5vLrOh6Ow2eXdgaXhQyxPtvGU0+cFnR/xVaNVJvXHwwYACMbvqiRY4Wp4TvG28/ZkuBpbU5o9WRPCM5ewokodzRAxPIudN3eXIDyXbrtbuiSHrrfRO9kq/zrfyEBvM5JJTXiL1C/eH2d7JxHva5U1AZtIYm0fd0nG2ff5yO4WER6AxfEVVl+3XKZdyoM0JO37c3gEoyVEH8zXuTzTATNtTmEy3PLdjw5ajLE0bcptmlmn/4r86Vn0MvMcmAcM3dVgFDew2upiw332IxsGOE687xP9X/AGMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEIMn8KbBodtPsyGOKZRn3S+q7LI0uFCEfEjI4itVoo=;
 b=xllUcVXU4kbykViigT/AiRXuyk5lSsTepMmYOGyUY6SKo9BQU6/EDAIz3YjoLu5GJwU3/y3Kqheo746IQa9AYFife6NYWUGk+sbqoczMluwohcytAsVJPqc544WR+nKolx7p6UEM85t3sUBdDlVJgf/tZXtuSMlH3xHqbWUCoU04o6Gp2tQR+tI6iUykd+UJ4PBI6NQAIAq9zL8iv2vUS6euLAIx25wz3yo29gmD//BmhEcRZZ6UMjAIJADjcPF1f6UlQL5FFWYlMlIfHfdJzrrXm5KHTYKIZdKUq/kxRjHVqsMEDrQGUODSJ8qhOZlLw6sg+bLe9px7mWfWu0HrQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=amd.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEIMn8KbBodtPsyGOKZRn3S+q7LI0uFCEfEjI4itVoo=;
 b=VH26fMwzROpu9PyzC0hUGja+nAlulYCTvgkYsR6wqJ5sFD6ogEFevgLhf/Cr3jRR/XhvznEqytfPVq/uVh44TQYYhYVUH9eJrQF5CtyAMTGoVgkAR4jEXK1staM2pqqJZGrs9YS9+ltCLX5ts+I4wzR5NJhBRK3PadDeglaPHHsinQDmf/dBpoDrzS8VdF/oAs7MT/c4TkCuzziVYW6wqj6GdS4hHuysSLQdmKsERaqJpIbjZza1e/GA4WL4I5JGxWcTsn4N5fdPMhHTozfnVA63k8qbPgy6w2vzLNwCETruNHTIQUCmUIftLutIHYOZWV/sewdAeGvrcs/VBB2dzQ==
Received: from DM6PR14CA0039.namprd14.prod.outlook.com (2603:10b6:5:18f::16)
 by LV8PR18MB5915.namprd18.prod.outlook.com (2603:10b6:408:22a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Tue, 1 Jul
 2025 20:28:02 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:18f:cafe::e6) by DM6PR14CA0039.outlook.office365.com
 (2603:10b6:5:18f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.32 via Frontend Transport; Tue,
 1 Jul 2025 20:28:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 20:28:01 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Tue, 01 Jul 2025 13:27:34 -0700
Subject: [PATCH v4 10/10] MAINTAINERS: Add entry for Axiado
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-10-11ba6f62bf86@axiado.com>
References: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-0-11ba6f62bf86@axiado.com>
In-Reply-To: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-0-11ba6f62bf86@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=hshah@axiado.com;
 h=from:subject:message-id; bh=wasBNtUEn7bp/0zcFhO21l4GoYcsVPb4OUeNpfZS2j8=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZES+9O9oR3sufRteAsLg6LrdHOZb5t52fqRaO
 rlZPTZiV0SJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGREvgAKCRDxWHMRoTLV
 +7cUC/9Qvio31GqCCg0/jpiyKEjseGQiYUSsMvG3LGHcYc5aID497z7hwf/EYHPw700mOPD0Ls5
 7o+Xyr6gry2N2SFIJv3U4DC1GuSZm0g4B69etSmcZXa965QHVNire3m8qLRvxVqNYyvIMBM1p2q
 IqAGkz1iD5ha6mRH2P4XEMrbsLXKKwvGVmNRZP+rKDvHU/H/ZBHuy1AEkKvOe9gRGMWEb2J0NIy
 HGkWljSQMavpl3E9vP+0r1qDm3Dzk6kEg/jphQG1zWfiWNbDPCKY3dZBf0rMsbUkRaaRKksDwi+
 otAYHe5S30aIvriq09WazSWBRMTKAqDPIQ61mP0o2JnWk4tqdlWi31ABpvxAXLboA5kcJMk+yFN
 7m9XgqY8WCgdW6phs9ud2VvNtQzRnBQgerYZE+8dJu8otsJ81ZMOYqZYJD32LSPCALwAR3oHMAF
 I3JseL/QmGsXxxb3D8yG+mBFRdAhq9HToXqw5aD7oXp7+idCY+qcJnKJwPD7yXOBegTZo=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|LV8PR18MB5915:EE_
X-MS-Office365-Filtering-Correlation-Id: b9221cd0-d911-45c0-092b-08ddb8ddc755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHkvZ084QW9WRmQzVjBpbWdvditVeTJLNVdKejV4bnN5RHNwMnNaTWx1UWRq?=
 =?utf-8?B?M2REeVJzZUNObnZqR3Awenl0TE01bkZwVytndVN4NjZLM00weWxQTXR1NlYy?=
 =?utf-8?B?cXVCSWlLbno1WWdLdmZERmd0V2J6Q1pkU0ppYy9rUlVQWlNpaDZqSFBoOFQ1?=
 =?utf-8?B?a2pHNDFLNWJjT0d4U3BIdVFENUg3REtCY1YvR3AzZy9Sblk1ZExZUUJjdDE5?=
 =?utf-8?B?ZzhrQlE1YytiTnFOdmw4L1c3eWx4Z1QxRG9vWDdMMlZYS1owNi9wQTlYS29x?=
 =?utf-8?B?VG50ZUtjMWVCa1BKTnhPTHRQY2R5L3lMN3lDVS9VQy9yZlQ2d0xlckhwQXVY?=
 =?utf-8?B?WXNwUmFoT1dPZWp1SlFHaTRoR0dXTTdEOFp6NEtrbzJmNWJOeWVaSHNkUE10?=
 =?utf-8?B?QVRyK2huL3FXNEhaMzBzdkJ2MjdIbGVneWFSWmJ1N09yYnArVkNITVkvRnNH?=
 =?utf-8?B?Qmlld3BkekU4WWlYL1EzRFJCZEI0WXI1bXQ0bHFTL0JNZmFOR0ZLYkppS0JB?=
 =?utf-8?B?Zm5SbWNkL21uckRZYnRzYU9xalRYdEdmVk0vWGdSd1VHNXRsRGRiV0t4N1kw?=
 =?utf-8?B?UjNSeGNOcnl1R2JrbEppV2xZSEtlS2p2dGk4b1ZWbjhNRDRGVmtlelFUejRC?=
 =?utf-8?B?WHE2VFN3T1pQNGNLRUtJdUozNGQ3ZW1palFhbVkrUStNS3JldVZERUYxeGxi?=
 =?utf-8?B?R28zRXd0eWxkWlB4K3JwWXJKcS9Vb3hPZ0pnc3V6ai80WTNPNXhzMzJhQ1ZH?=
 =?utf-8?B?TGUySTZieS9KYjhWREczcWxpUWFWWG9mVExRVkJrSVlSVndPSUJrdHI4Qlp6?=
 =?utf-8?B?ZXd0dmlZUWtRd3lrWkhqeC9NSXNuam5YZ3NIMHhodXZaMUluUHAweUtiWlI2?=
 =?utf-8?B?eHJZZFplQ2VXSFcrRGw0MkRZZyt1RjBsa0sraGJFV1N6Z2lVeVAxQ2E4Nkpm?=
 =?utf-8?B?ZUs3VzNmaHhTOHEyRk4vUnFYVGtaTDhRbDZUTGQzZFVzdk8vWGJiMU9oZE95?=
 =?utf-8?B?L1JoSjJxZE93VnN6M0QwTDRXTlkvSVB3MUZWTkxVUEcxci92U09QOTVYOVdW?=
 =?utf-8?B?Q0RIMW9MOXR1UGFueSt6K0pnZE51Q0FEM0xzMFNEd1ZhNUJxQ1NvRWIweG5X?=
 =?utf-8?B?VG5jOVVzYU45SHZVQkdsY0hqYnFoUXZld2JoZ3owVlVtcVc1VjJRVmFkOGxn?=
 =?utf-8?B?SXhWUmdOQkFqQXRFd3o5enI3SVVMYTI1aHB0SHlaVVViRTNneStuNjZNTldG?=
 =?utf-8?B?ZWVVMGlGallpdHV5LytrWTE2NzFVUkNpbkZyVnViQzZ4ampMQTVPZjJDS0Fo?=
 =?utf-8?B?TG1EeVB6L0VmRlBkVDJ2d1BFclBlUkpXS283NzF1Ny9mZnBVSENLbXJiVGd5?=
 =?utf-8?B?dXhnekpmKzJpdURLdmtKTUllUWczNGs2bmNnSDU3Z0xxSzkweUVWSWcyUmxP?=
 =?utf-8?B?bWhPeXZZUjE5RmVuaS9MelNDZDVCWnJJVTlRR0Q1RHFadEZGOXRveGVPU1hZ?=
 =?utf-8?B?Q3Q1WHdJQ2MvTy9OTWFhazBaVE15cW1zbXNSd1E4WCtIeFJ3U1dhU2s3RStC?=
 =?utf-8?B?S09Ha2ZFOVpFRWRXaG1sc053UzlBTzNneGRLUVJWbE5EVFVNYlo4Qmd4bXA0?=
 =?utf-8?B?NjZaY05CZ09mTml5WWpZcFFZRnMrSFIrb3RBWkVYeVBLaWF5eExTNHMwajNX?=
 =?utf-8?B?aFFicm1kbzd6dUNrbnJMblptZnhPN0FWdkNqbXJTbGs4dmkxd0NTc0x5MVpx?=
 =?utf-8?B?dlZSWGdUUW1RS2dDcGp6RlB3L2M0RG1MeThETjhVWExuUEN6R3dkeXpUcis3?=
 =?utf-8?B?V0MyOUJJTVhKd3VYRElLTitLdHlOSFU2aVVaYjdFNlNnOE4xZjM4Mm1Bb3V6?=
 =?utf-8?B?ZFhMN2lHZmQ4YzAvbExwS3RHSE5nbzFQdit3cExVV1pBZGV6UUtrK1J6aDZz?=
 =?utf-8?B?VHFPYWF2endrN1ptNWRBQWMwSGtyczVyS1V0WHJHYWxrQ0FJQU4rczlNaW52?=
 =?utf-8?B?V2kvU1BFVFZLNWpoNU91SHNCMHhPZElXbEpPUnA4RWsyWVJIRFFqSlYzNjFV?=
 =?utf-8?B?bDduYjgydmV2cVprd2pzeVc3T3VYQ3pkUFZSZz09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 20:28:01.5439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9221cd0-d911-45c0-092b-08ddb8ddc755
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR18MB5915

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


