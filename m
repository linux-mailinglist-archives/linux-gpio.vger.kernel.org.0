Return-Path: <linux-gpio+bounces-21619-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFCCADA732
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 06:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE5B43A56C5
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 04:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD82D1DF265;
	Mon, 16 Jun 2025 04:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="gbAMH1zP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2132.outbound.protection.outlook.com [40.107.92.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8841DD9AC;
	Mon, 16 Jun 2025 04:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750048319; cv=fail; b=ZKcu7JH0YihzCAWh9/Kp1W/pp2wJlSIH+dlL44YL8T7QaMCVV1zc3nQl6o8WMywTovnv8k+mKtK4nBiWZ74ydyXfyOeuaYyLsFe1eCQgFlM+9QwLSeiipe6ErRhCqLPhxwBMc92LpvWMZXkq2Paq8l1PT0h3zwsxTCO0IjhhJPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750048319; c=relaxed/simple;
	bh=KshauV0Ltf+cmlkwHT/6QLg4kHHEmWooSrGJxOuEkO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r43F5y+SrKAQmIY7gEZrLT/eJfFUM9BZmlo2pCm/aPUK//35EVmSlFlL7p8XJ10IXJVKQA5Eek8IUzacgUgEi8zviDJsE5Lr834f3AAz/kCCYR6scpRd4u9AtaZnWe3PUyZZAC3zwoT3U/OWUTWbmgOZvHdEBwXHu2OoGvY5rtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=gbAMH1zP; arc=fail smtp.client-ip=40.107.92.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PB5sLYPiMPx4zQqY2DN7bIrzwKy3N1wu4R1p2s2NyyzhKNnaM5qDbWAa8y0uhr/eyNfy/Vt5bVHm4X1C0WPDxnTfX0WnUIqj3P87VsSfjQvMKkFt/hQ7573ysBrK/3QZ23DnFKTdRszPx6OR25bHcvUAHfYRdrzsnOdL6IwE1BHDSymhKpkJWYJxCgYGrM8k0Yx4rylULrKvFAY3c131NAgTU7b+5q+xFpofOLp4DB7h5H0zT2zmXee1fELMv7fbTjBE+udoxHa2piThwduypnA/i5BJIdJepyST2/RNYLKEiy8RGJ5HtNvuyGB0sn7zutv40k5j+40i+avIGONKrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/e6dBMomDzA+OPvRajUARC3maAaTpwenAd7WEVsP1w=;
 b=H8jXhE63oIuUp+cR0MWRObfK4EFsE2Q/Ugj4q4JB9cXJXPZ839CqyUk3BR6DQEaEAojN629dHcOfDjkg7Vo3lZzwVrV7y1l/YWd9ew2LHjseNAlpnU6l05uLLqFnBXjHI9HBZM0RL4s+lffgtXKT1S7J8wkze1oxh2EIeVPo9G5wUs9/NZekVv3UMX9Qe1in2RATBSon0D3m2y3xwatK788B6w/JKQ37ylup5QIs72slFI/1TRACDid2Vpe63UVUHUnohooTRHcjYIl4waTzvGSqav6QoBOIC7gnIClnY7ChbTxrJpcp0L+atOPtMeAks17mL19dMGCQrj+MZylIcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/e6dBMomDzA+OPvRajUARC3maAaTpwenAd7WEVsP1w=;
 b=gbAMH1zPzFMrVmwo5R+g9bAV6u1bNR8iQdODTlOv3/Vw2qTylHChzYejfDC5okAOVbhS5CXWGChkCygpBNcBM/bCRZrGRhIPf/gZVB4/buhrbheB8Qa5PwH73e8IOPtjofJj1oOWn3KjZ+T5OWtnTPIkPfsC5hPJw9ibpRGNPpDpPMIaNPnnt9XXORE9rel16RfIqdgrWEZ5gmZoaKIl6L44cNPSaW3bkDP9jd4mPKlfGJPp2JNKFI0ED2dOimshp0sMZx3HPBw96BS9KBMn2RnbHZKNfjgipuXbnne3mBh3Fxfn9sJ34OPlqin2bI47tzwmSiUFEVUQ+n9Sq3PJkw==
Received: from MW4PR03CA0063.namprd03.prod.outlook.com (2603:10b6:303:b6::8)
 by PH0PR18MB4656.namprd18.prod.outlook.com (2603:10b6:510:c7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 04:31:53 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:303:b6:cafe::29) by MW4PR03CA0063.outlook.office365.com
 (2603:10b6:303:b6::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Mon,
 16 Jun 2025 04:31:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.0.1];
Received: from [127.0.0.1] (50.233.182.194) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 16 Jun 2025 04:31:52 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Sun, 15 Jun 2025 21:31:39 -0700
Subject: [PATCH v2 6/6] MAINTAINERS: Add entry for AXIADO
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-6-341502d38618@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=833; i=hshah@axiado.com;
 h=from:subject:message-id; bh=KshauV0Ltf+cmlkwHT/6QLg4kHHEmWooSrGJxOuEkO0=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoT54yksR62DuLnXNEOI2sY465LkxMu+71h8sIk
 BcJ9q8VJ6GJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaE+eMgAKCRDxWHMRoTLV
 +7VTDACNh/iN4bBw+nhfx0gLrOAijl4NMFO8y0Y9n+6KRQv0dLWUaViC1d/w3NEbjWFV7P938/w
 z1fkJs3fz1CKyrsubZbol5dfeT5Nt9VQP/zJBmJK65XN+dL5TiM37O4XEtnJLmEAVdExUq0aQ9M
 NnOydy9lQTZwt14s1QOKxehuYBF+l/l6cETh4rfl4xCUai5jY3vhhyn8wZhzGJYtPQ9Dx8tjRw2
 VZ3Rsk56OgwrH6Op+zXoYUREOgI67aAooUyDo5NakmcG00/P1M12pm8M3siGI2w+9rV3N+TBEBG
 K7mwDJ4HSRSDu5h4WBfSH6sY7nWETt+7RlwRndNdCOYcvc4BlM2yiIHGhzxybLviuEoMUt51Jgw
 7vA42R2UxxJmgV0ccEegnHvjzoMgmIeFCP1eQZ2R/+a2gaVX7Riavhm7FplN47aQcEN/SS4XjDb
 WhYfLR2PWNMmZwzsZi7/nSyQROdp9iLPyamPxcGiLNZJTjPsh5yVXRERQSsahS8NW0P8Y=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|PH0PR18MB4656:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ba3b9b4-c7e8-4f74-a5f0-08ddac8eb7d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TjAxc29VNU9Kb3JnT2hPZDJnaXNrZUpWTjRRV1FIZDhsUW1LOGZ2Nm1SSkdw?=
 =?utf-8?B?VEdTWUFEcXplc3Q4TkdoTWRXcjg1Rk00SmlMOFAwT05WVnRhUmMyUndJcW9J?=
 =?utf-8?B?NHZma3IvL1RZYmt3d3JHbStXSGR1TEtENWUrMVVUdzBTeDA5N0JjK3M1WUJ6?=
 =?utf-8?B?MERqRE1BRmxHVWlJSzQ2djUvWG9EbDVJREV0TTI2N0hUa0REd3cvUlV6NUJr?=
 =?utf-8?B?aW5OQlBXZ2hkNExrRVhycHdycjZUbGs0TUdzQjlIQ25jUmlNdXVDV1FqSGdJ?=
 =?utf-8?B?c3RRb2l2OUV6UFJNR01NbXRXMXpBaU1LR3NHOFN6eVc5QjE1MlpjcnVIeHNy?=
 =?utf-8?B?VzBhSFNtdXpFUDBtaDFVSVNFalRubTRRa1J2V212czBheUd6dXVPR1VZcXR5?=
 =?utf-8?B?L1d5Y05Ga0Qra1RjbnNHcnlJZjlmbGptWlpLRnROK3dGMjkyUGVFVUF0QWVW?=
 =?utf-8?B?blpIQ05xSy9pb3lmYWpUdE96YUNkWDFGeWp1eUdYcmFodGQ2NS84V0tSOExj?=
 =?utf-8?B?WjJsc3NUakNFVkxSNUx2M1hlaGhQb05rMWhQNDFCRWNqTEJ3MWVtWFAyMGhC?=
 =?utf-8?B?bmRMQzZGRzVqa1NNQjExOUlNa2tpOHkvdHlGTXdGT3dtaS9PcHFpU08xbDRG?=
 =?utf-8?B?VUkyMzh0ZUo5cENlNHZKVGJ4UzVUakhSNHljcVA2U2lFR3BEUExOc2QrZUNz?=
 =?utf-8?B?RlNvNDdQaEtLMWxYSTF1VFRJU2ExOFczM3ZnR1FuOXJPM3N1aTZYN2ZXMmFn?=
 =?utf-8?B?bU13MWhvZXZNbWFPaGJmMUorZTBGczl6RUV2S3N6UlVURGdTWjNNNU1tYkE0?=
 =?utf-8?B?REVQSENodE9FaEhwMUVFcmZRQ3FiYTdKSC9tbE1wWkNxcEwvK0ZYVTJhTkgz?=
 =?utf-8?B?OGpYL0dnejZlZmVRZ2pHK0F1WVhzQXg3VFVxbEVmcXlJQ2xFdWxVQlRpalNQ?=
 =?utf-8?B?bk9ULytXVlR0ZXNocFZZUWdZNDNVcU13TENnMTVicUo5VWhjRzlEVkkxUUhm?=
 =?utf-8?B?aGhDK2xwMTR4cUN1bzN2ODQ5dU12c3I4aGswQTdIZG1uYWh1ak9TU3AvYU5J?=
 =?utf-8?B?UVFBN3dKamNqZVJsMlFhRDA1bFNxTEgrVTBNUWdWSFdPWDh0ZENmSDFLRDg2?=
 =?utf-8?B?Q2ZEc0x0elB4MHU3ZVNHSHN5a0M5aWU5VGI3d3V4UzZyVHJvUmhwUzZkVjY5?=
 =?utf-8?B?TEsrUGxzQkNGZlprUHdWUThpcG4wWGNmWTEvM3U4Rlhra2phWFVYRGh2VGEv?=
 =?utf-8?B?UC84blZFbVRIbW14K0puUVk0c2hwSE1hN1dNVG9RZEVoTG5JZkFTYUxBb21U?=
 =?utf-8?B?TEtXc1FVcTJHWlRMYnhnWlphbTBvWEEyNzNLengwdlZqSC9neDB4bHVIZWpN?=
 =?utf-8?B?dHFrQWdSL0ZlOVBMeEkwZEE4Z3U5dnV1Uk5TazZGbHdQS1g1bldrWmt4ZGdz?=
 =?utf-8?B?VTNKK1BkbCtnR0tPbkVQWnp0c2lZVmhxUVhDOWVyYUxwYWkxYVIwTTlNRUZ6?=
 =?utf-8?B?djdjZ2xVV3ZTbU43anI2SUt6N3I5b3dCSXU1SlVtaXpCdnVYempIZXYwQndF?=
 =?utf-8?B?ME5kaloxTThpZjlMRThCbkMraVJmUFNEQ1BXVWN2TTJtOHJ0NmliVGRJTEdW?=
 =?utf-8?B?SjVaSUt4NlhZakV5d0RqQWIydW1MRVpFWkhuakk0ZEpWVjVuY3VuUktaTTdo?=
 =?utf-8?B?ckJkTk96TmpBTUNKVkdSR3ZQb0E3VU9BVG9hQ29mL0JhQzNkc1NpZ0VCdHV6?=
 =?utf-8?B?cFdTUzVKUHNDNkpTcEs1Si8xVzVYTlltNHRRMHh5WEZORytTK3NHOHhMR0VI?=
 =?utf-8?B?WWJZa0s4QlNUYWhIZmZLVGhsb1diV3p3aHdRV0xIRlRvOEVGdlRZREZnMHY5?=
 =?utf-8?B?UmtUa0hlUEJZUVRHS3BzVHAwWGdReUZabGYyWXFuYnNYWWNCdlZlU1ZNVnFj?=
 =?utf-8?B?Mm9VQUcrQ2dQaHhnS01ZVUhWbFBDTmttMGRMV21udWhwYmlHMGRQNEJXcWNo?=
 =?utf-8?B?amd1V3JCNk1vbjlMNWpLV1BVWThkTVRiczRQK211cTJFNHYzM1RETlYwOFhF?=
 =?utf-8?Q?F+7uW7?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 04:31:52.5196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba3b9b4-c7e8-4f74-a5f0-08ddac8eb7d0
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR18MB4656

Add entry for AXIADO maintainer and files

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0c1d245bf7b84f8a78b811e0c9c5a3edc09edc22..1118827b8bdf7774e51c0ca9dc33c13257173f2a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2414,6 +2414,14 @@ F:	arch/arm/boot/dts/aspeed/
 F:	arch/arm/mach-aspeed/
 N:	aspeed
 
+ARM/AXIADO ARCHITECTURE
+M:	Harshit Shah <hshah@axiado.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/axiado/
+F:	arch/arm64/boot/dts/axiado/
+N:	axiado
+
 ARM/AXM LSI SOC
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.25.1


