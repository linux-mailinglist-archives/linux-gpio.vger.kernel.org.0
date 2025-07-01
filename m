Return-Path: <linux-gpio+bounces-22543-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0642CAF04DC
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 22:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13FF31773F5
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 20:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335B0285C9F;
	Tue,  1 Jul 2025 20:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="Auw8/qEE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2129.outbound.protection.outlook.com [40.107.237.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF092EFDBE;
	Tue,  1 Jul 2025 20:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751401680; cv=fail; b=mgkbk4EnEJN3pVW3LyOLglJMIhxiYglFqqG3eBQGNCnfRXG6af/+oKksj1LUpyxpR1RSYB+EwFc2juoLBhNJe/ebWDw+C0RTBEH/etcixjWP9ggYrhfKS3glPhWst/lbHqA1HKwmxKxjjqyr3esjY8+5wpCYHrLXz9p9izLymYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751401680; c=relaxed/simple;
	bh=h7/reQekMZR33wAXmkF5fcG5ZASoES1o8MpTsQBpBy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hU3RGo6w45i8pAv/aaaj9vIuSrZs2d0qOOISteoy5nfT5P4MTOjxq1q3n9bXVjFSr0k+rzfDekGOWM4C+W1y8GG4ztse/LDTVQRxa4CSTM5JSYLJDAXRsP3ZcaMLQPI8zEeep6VNXDez4bsmj0tLE4Bw1ASrGvg8M3PRplIv7CM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=Auw8/qEE; arc=fail smtp.client-ip=40.107.237.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSrNtvyUftbJiAu1daeK8VkNVCHX5y66pT754NeA1JN4581vpDmH2nTJIk9U9UMdy8RctT2ho5aGhQSmjbR27GAP2DAkFl9To5GPX0H5jrT2IuPBONBot8rnOnzNQKfmV0iHtXpyV4+sdwPTzLTJXVmtMhrgBAFvoQvZ0IZV4La1OmTTh5hc1Xzv+wE3HFx5zNCvKZhQMq0Wf/zDk256TCCnxALZ9f2pkBzSDAvcvFYpXpAhJesa5NEv461NexHXJ+m1H+ATZEtJsouzk5uIhIuXaBFMQxMSq/T5ANcZYW9W+2K48whWviFpkws2gKWi7jKBgNnlCBQvLPr491F7ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eGSMBpgEbEaJCnQ0epbgv38LSg+oygYq6YuZdlPPI4=;
 b=XelUaya81A7uvx+anUHvJZQkRtv+eal/3Py2qE3+xJQ7W2kzfzJKKNPxhxlNuJHlk55bKugivVw+bftAFrNt2/nNL4meYBkjouu5d340VNPDv8AL7KsVm2pbm56H6Rr0qp+riW91IuxgPSS8pQD8gw5V+wOLcBt9cK0RXV+r+z1B+FWhuf+PB49AahhTnVjnIOtXHskanMioYcdHpOxEWZEiCxrMSO8PczldOuEIRtLTEjgLyDMfgLYeFG/CFIYs9Xtm/UTTL6Aw1cAdlLJfpJr7XA1ZTwSMJNwm3Js18re2d+Oq+I8tp1e6Hcjb7LpSnqGi1Q1rY5jUM6RwEZDTYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=amd.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eGSMBpgEbEaJCnQ0epbgv38LSg+oygYq6YuZdlPPI4=;
 b=Auw8/qEEkGv8bSdojlQ/ohJ+zfbqN3caxsaRM90SYrg373zor2VT4a6ZL2iPnbwPZ305WndEuWU/a9vJtA5YGPb66pEntufoTegwmJv4hPE0AEEXFXNyhgfVdy8lmLUD4GmJX/AV/gPLKw+bhJXNoqbN3ffsCKAjo9e7XdH5vWuRZmVS9Vtsvkm8O+5IjwkqAg2v7F0yOKm4oRORUvZcE9yv2OaKICpOXGMJPWHs2yqXQJ1+uEo5jj03Ocrzoife3EsAhX65oBVtiDrVI89Dnyeo3xGaG+3wcmqqxCoOWPmlhPCpo6FA0Iooopu8yb8dMcTcjaS52VQpC/WlkRw6HQ==
Received: from DM6PR14CA0055.namprd14.prod.outlook.com (2603:10b6:5:18f::32)
 by IA3PR18MB6164.namprd18.prod.outlook.com (2603:10b6:208:521::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Tue, 1 Jul
 2025 20:27:56 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:18f:cafe::37) by DM6PR14CA0055.outlook.office365.com
 (2603:10b6:5:18f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.31 via Frontend Transport; Tue,
 1 Jul 2025 20:27:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 20:27:55 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Tue, 01 Jul 2025 13:27:31 -0700
Subject: [PATCH v4 07/10] arm64: add Axiado SoC family
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-7-11ba6f62bf86@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=858; i=hshah@axiado.com;
 h=from:subject:message-id; bh=h7/reQekMZR33wAXmkF5fcG5ZASoES1o8MpTsQBpBy0=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZES+wKbROIVZFnvrMqDcd5dj7jI3JoX46eBmL
 r/rorfgJpaJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGREvgAKCRDxWHMRoTLV
 +1TdC/4h5/NIgJWBjjpD0QNjSpQgfZvSSpojo9GKQYum8zuV+fgCLi0EFFFpAuZomS3d5gtjphl
 Vv9g8ClWr+4bHhTSZvM10yabxQmaggL2yd/FZld/EPgpaL+1E0PKTnYeVJc6GF0xVxWYk3hD+QC
 3Tzj4gbsP84xw2qHO55/xwZ1FVWLBSVWneuXpLVWZAzGMIF0wFZ7wa9dJRyg3O12WS9KZJb8pyg
 f4XuHRY4pnu6qz0zbeZN6H0fHFXf68C+idxlrJkX0+ByInAfxCuEY9W4iQHm1hpyLo7SZdWGN8t
 gxwEIHPEd3QA2sPsiyThiIBd6cOjzFD6oNSgWOzEAbe97S8Fb+cKuxa0FAVSDr7vTwuy+HiYS2q
 soEwap/YXUdjZKbZEWgobL+EULH/yW0omy7651bNvo8jl3fMbnVxkyuGOr3WZubkob4Px6bIS8e
 41i3eJoRQedXzCfpyp2wobCwYTOI7rQkCbTxWyfT3+ifn4sJTkBF+x51LH+jEb0SXvSYA=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|IA3PR18MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: 959a5abe-13c2-401e-75fa-08ddb8ddc373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXVVUGxPcHF5bUZPNkJPNVFPajl0QzBRTkl3NHo4Vk9BWkJEUmRVSkVXcW5G?=
 =?utf-8?B?c2NDK0p3U2JjcHNUK1EwWGgzaFUvM3lrQThyVUYyRFNqck0yZmNZcXI2QUtP?=
 =?utf-8?B?N3VMVlg0MUU4ekl4ejZGVnJJd0JuamdUY2lOUXNhYjNGU3hwMEFBeUpvMGJX?=
 =?utf-8?B?YlJvNm9OaENscnE0dkNSWEF4aTdxMnZyWVI1aFU3Mm5NRkVienlaRE8rVjV3?=
 =?utf-8?B?Z0NjTzNFQk5QY3FDUzkwUWdVVHJtZkx0czFJR2EwWVJUYmZlRkJLR0E3QVMv?=
 =?utf-8?B?TVVteTVjWEZ6S1grcU9qQTZjaVhseEFpTldmK1BUM3o4bitFM0Rxc2l0eTc1?=
 =?utf-8?B?ekhnVG45RXV6TEhLTFdSZU1hbEp1VElkWkI2WlY3YzVwQ2RDdEJLZnFxN0FP?=
 =?utf-8?B?ZXMxWk4vWXBWejFNdkh1UUJKV0R4TUdjdXlZb0liVXc2WE9FQVBmZk9LRmFV?=
 =?utf-8?B?VzllQUlTQU9GMDdid1l3MzBpeEFSKzk4MTNPUEwwTjVkY1VacS9KeUJBM3Bj?=
 =?utf-8?B?cVgzL25TT0dVem1EZ2FhZkw3cWJzZWNUQ2ZQTWZDbHFaNlNxREJxOG5OMnZ2?=
 =?utf-8?B?cXJzdGdjK1IyUjl2d0h1dTZwcTUxbWNmaEIwQ21TUmNaaXNzdjZLMTJvMDBZ?=
 =?utf-8?B?K25jWUpGYUJIRC9hSjhnNWhEZFNQVE9lV0hvcVZ6UGJyWVFkSGRjaDFFVURu?=
 =?utf-8?B?RjMyeVpBRHZ3bW9OMnA0dktRQzJWN21BMFFxY1lBMFBkOVdhSlp6NENLZ0Uw?=
 =?utf-8?B?eU9ZcDJScDM1MXdtaHhNL05MMEdZT0xYWk1pUzVzOW1BdkZBUEdLWUFFR3l4?=
 =?utf-8?B?YXpLZDFUcTc0b01SYktSL1RyenFiTFNjQjRaZHZFakkrck41K3lNUGFRakU1?=
 =?utf-8?B?YUljYUtFN0pWdGY4eHRGb0JnUEV5ODhDMUhKTjNVdWl6dk15SVIveWlrbGJB?=
 =?utf-8?B?U05QWnQxT1ZBU1lNaFBtZFc5NmhyUThkR0dYSEduTUNYV1crNjVkYTZqVURk?=
 =?utf-8?B?WEd1a29IdW10MVFQd1AzSmhDWkd2Sm5pSmNMMko1TWszQk9kTmNJVE1HUTlS?=
 =?utf-8?B?a3FnbmNzRnFCRUpnYXZYTFozWkEzd3EyQnVab25hRUJyOEVMdS96cTBQR0p4?=
 =?utf-8?B?VFpnMTZGcVNkSWJaMUdwWnFqcGp6THMzek5FeS9DdGdMNUdTcVV0RFByWkhK?=
 =?utf-8?B?QXdFWENuWnJUTU9pZmlZeEIxYzhsWVNzTXFwaHBrVk5kL1Zab2V1T2t2THBh?=
 =?utf-8?B?QmNjK0g0ZUk0TVNUNGJaVGNna04yL1lMeld1OFhaVUdqWmN6bGR4RW9CM01L?=
 =?utf-8?B?RFdXRTZxZWxIM2ZvV1lOdUJHK2NNOUxIbS9LKzc5WDRIcUo2RUFBUUpjbTZw?=
 =?utf-8?B?M2Y2aTlvd3cvSnl0Y0Rtd1N5d0xVTTVSL20vR0dhcUN2WG51aURkQTdrN2Js?=
 =?utf-8?B?UmhRYWU3QmV6OFUwVVNuMnk4bWhhOEs3OGhsaGRaY2hnbERVc280ZFVQQnho?=
 =?utf-8?B?dkgzclNvbUhtNFVaMFFBVHN1QTJDdnhnUklOM1VHTFF0KzlCU3UxdDYyc2Jl?=
 =?utf-8?B?Mno4R0FlbWNwZEg0aXRmc3pXcVZNd1lDSStSOHRSUWoySU1nc3VSWDB0TWpM?=
 =?utf-8?B?aFNxY0FmTWxJWFNrN1JrLzZlbHVIT1dxZFhTWU9HNjZRMkk4RWQyL1lxcDFY?=
 =?utf-8?B?enAwMnJLMnEvOTIxZTN4cWdkeENmTHV3SU1Uc0VTeW1qeUJyV2VDNHNLYmJE?=
 =?utf-8?B?L0xxNzJwU0Q1SkFiak1MckhZQm1vcTdtZStLNXhGekdva3JWdGJLWWhxOTRa?=
 =?utf-8?B?Y3hvLy9ZckhkVTF2dXVENWc0SzNxWmI2OW1DNi9XTThwRGJWeWpsMEIzMVh3?=
 =?utf-8?B?RnZFalBDMkU4SzJMR3pHNHp6OXhIbXYxS3dycVVxMDBQNExlOHkvUzRqSlF2?=
 =?utf-8?B?NWVtdnBGZ2RjQmRaL1pLV1NGNU1ERFBOTVlWVXYyemtPVGJuN3NuWHFPdVBh?=
 =?utf-8?B?RC9JYXk0SDJrQzJlci8yRmRiQlNEbGRPVWU4VVptL2xxUUx1ZmtZcTYzcHNK?=
 =?utf-8?B?Zlh1WTM5UTdjRmZNVWk4bzg3K21XeEI4MVpVQT09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 20:27:55.0321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 959a5abe-13c2-401e-75fa-08ddb8ddc373
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR18MB6164

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


