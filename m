Return-Path: <linux-gpio+bounces-22757-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE45EAF7FDF
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 20:23:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B1A74E44FA
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 18:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0E22F548F;
	Thu,  3 Jul 2025 18:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="r/gczaVW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2105.outbound.protection.outlook.com [40.107.220.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ABE2F5325;
	Thu,  3 Jul 2025 18:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751566881; cv=fail; b=H77vo+OEe40bt0a7ACvy0DQ/Vbi9qUxYY8bwyc6v4g/eXet15h0ob9LERyv40RgQ/lTM2zuPtS8YMFeAILisDx+tkmuKLpsoh199cHOySr4jQQfTLBOhDBftRgyCOYl0x/CgNcxBKJ/ySRO827oC34Ya6UelV8xVLCkNryhYgdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751566881; c=relaxed/simple;
	bh=wasBNtUEn7bp/0zcFhO21l4GoYcsVPb4OUeNpfZS2j8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=COPpTIJhSvdqehfyktRfxsG8lPi0Q7Qhieoxy4LDEV4SY43jLRY1WixbQnwCJRC8aHed+Ap0v5q6XO+hQiTTZx6PlHLhiyRHgALbPgpQb/OnRW5P7KCGZSJ0cQmCkUWzfFcs35nKXxep4KmlFZQQs4D8As2mj+Qgzou59I98C8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=r/gczaVW; arc=fail smtp.client-ip=40.107.220.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yA+T4uVPIVFNJZ6Oc8jOKnhLYzxJHHdG/maJRhhgndc3Z26GPxVGLRb7JVkbKA2nWXlI/G1XEPHxZ4thaFVz7a+9d4fWGJ93+EtcrYfUj0dObpAZ5WEgKRsERxrki/nBWHgT6/rqULT9AYtNk8pwcRZK1ng9MMCHoAexxZaDKEcGeGDMLWZqqwD+UOXh7GL3nnvD0c1UM49z0t5bIQDBvxqGKxsJcQQnR1xCdeZ3uTA9RJAXP347I52yofWNushT4t1m40PlFq0a+jUdGBjzc0jEM8urJ9cYzrxxvjGSAeKvrhKf95XZVbv8Fe1fzbMgOOegNZ4xxchWqf6WWjYUww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEIMn8KbBodtPsyGOKZRn3S+q7LI0uFCEfEjI4itVoo=;
 b=L5ZzzGJuxmAeGrZkXSXatRw81pr0O+OyA2o1sezYEnjY0NAhgpXxNFFp1VDAoBvghRpdSqUztEkfzfNG2wTd8O0Qv6pZSWn3KtNPUnNQKyc7XpMEKmCSU/2A5GiyU2mBD3f6orwr832RgPDGdaFp7b0FpkAkQbnlq/0TgQd8acNgUNtwCxM5r0gOdU/yoL6IhuHChdX3eDL/K6GuKBFtcQokHuDBsGjf+K30TUWKkcoNxrbBHKqyc29BmrO6uIJGw+wlgKxzt+W2Y4PWIPhd+bVj51dTEN/jydTkvaEu0KBnHNJQ+0AC6jhINCm03vUxZ+pPOWHt5rwTY4PLboqXbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEIMn8KbBodtPsyGOKZRn3S+q7LI0uFCEfEjI4itVoo=;
 b=r/gczaVW8mo4inC8KZ+PJJO5NOVJ8xb36myxenI1ryjidd7VVFKRoDx9l6ljPFF93g8cIbh4+eGnUCg10VIXQ0RPVkuIPqDs1q5Sg/EOWAYTECz0oPNn9ei30vY7BDqpcQUH9PwBoJhzSKjLtcVVIcChWA3qk1ZJMgR/BbRsqcqOBww93aMnxNtDgm98UPWnrXkm257JmJdWHztL5c/rdz+IlI1uMvj+hWl6vGzc89YVsSGg+HC3ZRx5se20+olRs2heN6Zc4hJRgoCxK7XgTNuqZZC8ryfFoskk4l0NX5Mjer9lYv1e2iEqcHxCeo+cguyZWApnyepJziqS+C++/w==
Received: from BL1PR13CA0320.namprd13.prod.outlook.com (2603:10b6:208:2c1::25)
 by IA0PPFDEC9B0D0E.namprd18.prod.outlook.com (2603:10b6:20f:fc04::c47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 18:21:15 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::98) by BL1PR13CA0320.outlook.office365.com
 (2603:10b6:208:2c1::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Thu,
 3 Jul 2025 18:21:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 18:21:13 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Thu, 03 Jul 2025 11:20:52 -0700
Subject: [PATCH v6 10/10] MAINTAINERS: Add entry for Axiado
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-10-cebd810e7e26@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=hshah@axiado.com;
 h=from:subject:message-id; bh=wasBNtUEn7bp/0zcFhO21l4GoYcsVPb4OUeNpfZS2j8=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZsoALyMxhktT20SFV+1ooadwCUEcRiBjlbuJK
 RNgzb2850KJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGbKAAAKCRDxWHMRoTLV
 +0leDACdHRJfNIqGpTVLmF+g9mQDfQxG0pnbExh5GxImX7TEiqeLmDvW/CeeL1ihfDzcjB0bAeQ
 jwoXZPVYEC0tr3KXQ6SsDQhzM7XCTN3egjRTsEz96xRtQqOvLFd8pwK0LKOCyafyoQ+lvcOXiXB
 oiy9gOfL5Taen+sCGC4jwHa+4msucaT69NfRbbmm/K6CFcdL5HS6PptXBzeYNtBoKD+PTyHWmBt
 JUpdjJHW5JPynYcVQEdNSds7vRP4UZC3rK1rPqGmHk1LLvP7lHrO4ihThRZFFhf521nzV83SAI7
 qFDobBwKEhPjVOhPBzRrFihE1UlR8Us6IiiKdPc1G10GDXUJnSD1k/IVryHV7SzrJJNOVPLdn9b
 aaC/Trlu6avo0zlfZBWOXQC2dBftlmcpiav3qGdAD5uo7h71Jau6EodprWZt1ed1ZtYfurBmCfv
 xslGU4T4jQwlLtkjiw9e024dfB57NNy/kia0rGhQ/6/j3aNHEzqEJpatg3rlW1a0OoKWE=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|IA0PPFDEC9B0D0E:EE_
X-MS-Office365-Filtering-Correlation-Id: ceb233b7-d626-4e2d-6f1f-08ddba5e660c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTl1UUxWbkppQUo2ajVxSHNxNTdiRy9Cc1BIYnF5eU1yQ1NZSkZwbWNleDJy?=
 =?utf-8?B?R1hxeGk5c1kxYkZBTVA3WDBFa05SdzJlRXZiTWpLek9POEFGMjJBR0lvWDEv?=
 =?utf-8?B?bndqWlJsWG8vbjYySlh5eXJYZGJGM0xRSUtXUG5UUjBNQy9LSjZ6cjNKZ3E2?=
 =?utf-8?B?Q0dpaVFXL3l0MllZSG5UdTJST0hzdldORjV5SG42amFrSkN3RkxwYmFINWtY?=
 =?utf-8?B?ZWNaVzdnczZ6a013eTFOa0t3cnZCaGZVcmx6WklrNUk2TjJRSnllbkFaMnRG?=
 =?utf-8?B?eFJxOW9NaDRkb1pTVlFxSVJTS2VZcGlxRndKOWR6L0s1Y1hocGV5M0QrNFFU?=
 =?utf-8?B?RHEyMjYrdmYwT05VUEtvSW1YK3dXTysxdmd1Nm1YMkdoTXpva0JQYjd0bVlr?=
 =?utf-8?B?Y3lOSytDVTBBQnZXWHdBcTBDb2Y0STVMRWMrWnNlQnFzMzYxMmJXclBjNDlJ?=
 =?utf-8?B?VjZTVXN6OGZTQ1lsazRpei9IUlNuYmxZM013ZytNYnpiZksrWU9lTEhIN09w?=
 =?utf-8?B?Z0QxQ0c2OG5ocUsyd0NzTmNBQUhSeWpvV2NsUEtycDdBQXhnYldKd3dDMXVt?=
 =?utf-8?B?Q2hkNWprbU12cnAyNzV2VURwY2VHYjltLy9YUmZ1V0FON3UxUkNtekk4YWtG?=
 =?utf-8?B?OTdoN2MwejkxWm1kQWVXbHhIZ1YyZEk0SG9uUndNRFptOTFzVlR3cWdMZE5n?=
 =?utf-8?B?UVBBVG54OXRyOTRHaG94Q3ovSzVXSlp6TzFNaGIwMmJLcG81dWthMkM3RDNV?=
 =?utf-8?B?WmI0MzBDTmZPcmhhclVXNHFtajRBWFAydXJxRGRTTkF0dm5DWVNoZ0g5U0cw?=
 =?utf-8?B?cWcvRGtZbCt5dUpNa2FQanFuOThEQXNxQnR3OTF4QVB1aUpQU0toNDU4VzV6?=
 =?utf-8?B?aS9wN20zZVNDQUxVMUJ5UGxXSE5FV0MyOE9ib2RrY3J0UEhDYUQrR1pNdEJu?=
 =?utf-8?B?WmxRSVJIR0M1aklnb2o2TlI5Ui9FZXMvcFo0S1dmQ0s0RC8wWVl5OHBCTlgw?=
 =?utf-8?B?OXl3L2FGV3VQYlJIZTFTbGFQM1A5cmNmbVp2aW9qQ0x3ZVN0MDRhL2tIdXFB?=
 =?utf-8?B?UWpZUzJPWmJmZ0tTN3R1VDNscU9lblRwaFlSRW1mWmJSQ0EzZXdvQTJVZ2F2?=
 =?utf-8?B?TWRQd21OeThxY09FVW1PTlVKQitXY0syYm4ybHNqa0xrZlpBWlBJa3hjNmUv?=
 =?utf-8?B?dUdwK2g1VUIvZDBFaUpjdy9uMHRORDM2ZmNxMGg1VnBVbHdBZ1RWbVJtd2hx?=
 =?utf-8?B?eHp0MlRRZEdUT2lmSlh2RFowckwxQmU5UHp4KzZja3J4TFREN1pUak5iT055?=
 =?utf-8?B?WUJRdVNFWm1razdFejdRRWlyaGN1RXVlbU1jM2Z5VFZmVjZ3K3NPU0tXcjRn?=
 =?utf-8?B?a2ZVYUtiUC9lRXovUVNNeDF2aVBMbVNlNzQ4RlNWdXdIZXY1djZjNWpnQW9x?=
 =?utf-8?B?ZktxOWl3cFdMeStORTliaWR0eE16Q0tOWHozWVJWOFliaG5ERUkzdE5id1c5?=
 =?utf-8?B?cWRnbXdtbzJtMjZ6RFR0SlRMdjNGVk5Vc0lIWmJSQlhBeXNtMFM2UVZzRXZj?=
 =?utf-8?B?VkJIWU9pcjF6bzVsLzB6c3I4aWhoVkplM0VmMTFaTnBmMXBsc2NZbVpsYVVx?=
 =?utf-8?B?TXZKQUE1OXVCOXc4ZVZJVGI3YVNGZTBiRGZ0Z2dWQzBXSkREVmxwRWNzMlky?=
 =?utf-8?B?YWIxVGpTa0MwdCs2SGZrbWJybjlaVmxyS3I3Qi9KQUFkcXJYTTh1TVpCSk1I?=
 =?utf-8?B?aWJhZElRSkYwVnMvZGF4Um1meXVQNVFXcDA4U3BvcFJ4VHRKMVJYUnRadmZn?=
 =?utf-8?B?UEtDbEEyQVozeGZLNy93dzUxa0U4U2t0MDc1Vng2ajVnWXhUeVVVODZveksv?=
 =?utf-8?B?eitZc2NFbmxyWG42dmxMQUt6V1BnTWhSU2lLM1pLTWkzU0MrZ2hzTjlhVnBj?=
 =?utf-8?B?QmRhTnY0YzRkcTdrTGhuTThaWnRRM1Vqc2kyS1U5RGZaREprVGxqU3dMNkZM?=
 =?utf-8?B?N0V1WHlEeG1JUjdiYllNNTdBM05DQzlVZEs0a1V2VlROdTZiM01uMmc2VjBQ?=
 =?utf-8?B?YlIyRkpjMzFVNEt0YXlWSjFvcGpWdDRNaE9JUT09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 18:21:13.9245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb233b7-d626-4e2d-6f1f-08ddba5e660c
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFDEC9B0D0E

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


