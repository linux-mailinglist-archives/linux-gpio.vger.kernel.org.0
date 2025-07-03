Return-Path: <linux-gpio+bounces-22683-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84925AF66BE
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 02:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2276E17C6C8
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 00:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 791BD1F3B87;
	Thu,  3 Jul 2025 00:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="Llf/Tg4l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2092.outbound.protection.outlook.com [40.107.223.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D80E15442C;
	Thu,  3 Jul 2025 00:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751502177; cv=fail; b=py+JW3+uYWkBRQTiGjMhD1eB31v+dpg8W7+DLa6xWus07NRNuHZPlT4lQoQ2fvOyIBxKreYRfUVTpblQo7zzg9Af/mSK+KjkZEnA/DFMJRd3L/0eRQ+oIWurohqemklnsziPZ3DEbYAcatmWxQXo4Ef2jpTl/sIdwKbWmEjj4D0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751502177; c=relaxed/simple;
	bh=93pjMHJ56GGwn1Yks/A1mXhoirw1asDGShGan+RYvqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ocgnnh/1BDM/anGPAMWc/NLkfmJEOyvliNukwi4kOtKTs9XLwLpryiov5EdL7kdU2U+aZKE4RmggPAY+f5cJGgTTe6XYBH6I8hnfz5nYtaKpqnbpD9DqzTUfP80lWnObGSyr6KJQbbwsnfRdD4RcYlaY2CdLh0nE53lIWQU2aIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=Llf/Tg4l; arc=fail smtp.client-ip=40.107.223.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=On68XsxsrhHZGC3DZz5YdD5HFKmUqcM8rG9qZT8h1NAs7vLc6918o9DpnzkdpdJxbaNMXggrNC1VNKaNGC1r3QQlAUHCdMpw0DIB5Rb5TBKa4KOiwVfCDRjFkIMxxJkX8ketP5ISBmtwNqUGjXTLRLMT17Wt0AFnexUEA/Z3/rIgO+luLVPrV5g2MlsBYEQmxkDMCc2PB2psArLbP8e0vvgiWOhhdVGDQ3R089TRRc1rUjMRG65qCLqqhvxY+2ujzWDfJswTTsPaIjS9vkJ1kq9KQHKikjRITdVD8LxqT3Q755p3OFBqh6CvPFnId5yV67rtsohOYqZFSUN3MODQ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOdVFGv2UHJLAMS7EjHilvXuBmTnOheUxaIrDQ1qR94=;
 b=B1V/r8AgsJBk+GYJgFHPEWbzUCDYPQrjRp7sjkls5Ia08iilV+jwrIwcGKTdpSkz17gW4lshSfFcdZO/4qXopblVgQn+zyVNs9tGXb/2z3UYaWDSno4L1D5AUdX/LCVGj5v7EadMpzQujTrS7EadGMcxCfR1SbuBWK00lHM8CzZ24QQufxtRIClwfCnBM2UMMo1H8jXHA3b6QJMJAzUOUmwo/f6L0iQu19tWNaFlBbKb15mT259dWW9+YdXRZGJXbYO6plXd30OaYBlWVutdSEKSwYvMiPxxeV1EosW1+yz2vL8wRDDpSmn9tbtvT6OPeBV184jEy8d6IW6yBU6JWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOdVFGv2UHJLAMS7EjHilvXuBmTnOheUxaIrDQ1qR94=;
 b=Llf/Tg4lshUa23GJNj5XUcrAWJw1/ttIPoMOHlLX7AopZfthFIH51keoIx0Umx4BDeUbEFAFoMX6BhwW7rxauegbNTdpiiM/xWPx1XPwVdsQHApcAWz51o43+GiSCZhhYDY9guz076DGDDrG92DmMzaxkw+5qFUfjG6pYZR7wcnwlrUEfMT20qUFyHukDFUEnP8UMIKfP2MkUGcaUbbqoTVPs2nEILtVj7ouw1LOF+PMmUGM69RQxJegULYVlk+WjDt4UVVVioeaRy+kJdEEE/nTc3FyVIIqrfDlyA5kCY+GcKNHfTX1E0zg5arzzw7MCRQYQxq5WJ7RTlRLdsiYTQ==
Received: from MW4PR03CA0091.namprd03.prod.outlook.com (2603:10b6:303:b7::6)
 by DM4PR18MB5832.namprd18.prod.outlook.com (2603:10b6:8:44::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Thu, 3 Jul
 2025 00:22:49 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:303:b7:cafe::98) by MW4PR03CA0091.outlook.office365.com
 (2603:10b6:303:b7::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Thu,
 3 Jul 2025 00:22:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 00:22:49 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Wed, 02 Jul 2025 17:22:37 -0700
Subject: [PATCH v5 08/10] arm64: dts: axiado: Add initial support for
 AX3000 SoC and eval board
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250702-axiado-ax3000-soc-and-evaluation-board-support-v5-8-6ade160ea23b@axiado.com>
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
 Harshit Shah <hshah@axiado.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=18317; i=hshah@axiado.com;
 h=from:subject:message-id; bh=93pjMHJ56GGwn1Yks/A1mXhoirw1asDGShGan+RYvqE=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZc1T31cRYrGgBhpzvv3O/OsAuixs2FhlqbSSQ
 mCfCEVAB6GJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGXNUwAKCRDxWHMRoTLV
 +zXXDACOPCCCwx7FDwvsacE+KgbGymccKewhgfEMwxolECRkslTzOif8SNIenVMuc63ruVos2+T
 jQoypbmCqMyE898ixFditAbIvbUJSssutWYmn8xLHhX7wbH1dwanCXRJ/jOel6vROwKvnUOlxk6
 3nG038W+SBNbf566+qOEBkN1eRcTCDV35pvdiKVWVCrRT6dh7Wi1PmrizNaZIuowU16utcInQTp
 mR25ZGX6aVQFc13zPz4Py5cSr7+05LCjG8wxhH7bnqxQkmFPwIBNOus0dm7i3A5W2X+cbHGiyxO
 ANo4KtAY2DNTmpX4S0uRsDR+hK5TF1jDh+mkt/BRSgsHIcQWeWF3+L/mZhi0VdIkrNt6d8YChL+
 030Rk+tgfJOuGbYlQ21PsLj16RbHARV822MgNEhjWmM4NBuxGg60Tu/qGmJ4+p9q+/y+znNv2EQ
 MuTCTUFg5WhqnIW5LvFNYzLy7xkoCLzanNre8nULZQIzO4vZdeu5vERGj4ONq460uX5IQ=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|DM4PR18MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dbe77f6-442a-49fb-f4a2-08ddb9c7be1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RzYxMVhmYWp5UkhQeVIwdU1tQUtwbDZJd1dOTFlzWWJhUFkydlZEck4rSTlN?=
 =?utf-8?B?S0pwMGdYQ1MwL3JJaDVOTWx6T1NZa0ZoZU1rbWhNSjhkdldmZ3IxVUc4QVF5?=
 =?utf-8?B?S1dndkU1ZkdhU3hESEpGbzIwdzdsdG5ZcmRUYVBCM00yRW0rZ2NPbWVPVWpj?=
 =?utf-8?B?cWp3alEyVUo5MGVHTDRBdzF4RjZoK3NiOHEwTlBUWVRVdWE3c1dzY2lHNi9Q?=
 =?utf-8?B?Uk5wbCtLcXQ0azg4Mmg3Nll1MlpCQnU0MWpMY1Q1VnVFR0t1YTB2RGJtc2FQ?=
 =?utf-8?B?VU5ockZGRkQyR0lwQ0o0VUl4ekRvVk8wK1lKQjI5bVVQMHVpWWFLSnY0YTRp?=
 =?utf-8?B?ZUFzaGI5bVArMjZTSmF6Vm5ZLzJrdzVWRi9Wa2FCdUJaV1hxc2wzUC9qN1NQ?=
 =?utf-8?B?NEVxMWlPT2o1WUd1aUc3U3gwTjl6ZmlWakNHZklqYWpVZUZ0YlMyQjFLV0Vv?=
 =?utf-8?B?S2JrYU5yODBUclBUSmNYeWVLUTY3T1B2aGttdEF2ZUh1VkxXVitFQmRRWmlj?=
 =?utf-8?B?eFR3Q1pxY1ZuT2Ixc3U1M1M1TGtabEt6RlM5OHliQ05sSlRyMFFoTW5HRlFX?=
 =?utf-8?B?bGRsc1YxSTJ4ck4wcHY4UTMwazZTMXI4MTNxdVE0aEZhRDY5K08yeHJHd0lV?=
 =?utf-8?B?UlBZYUFITDU0S1ZFdWhROUJOTHpnaVRkQ0xZRjVianZCa2R2bm5zY095U3FP?=
 =?utf-8?B?ZW4rUSswcG84MmErNXF4TlRiRnBJU1k0WVd5SytDdWQ4c29BbW9RbE5qWko3?=
 =?utf-8?B?eEVNY1NpaU5vbHNROU4zZG1wRHZPeGhmSzgrTEt2bkRzcEdidVRzYkVwekRz?=
 =?utf-8?B?a1lYN3J5aCtNT1lCMCt1Q1NSTU4renBxTnAyb0JvR2FkZ3FKcXlJenFrUDk4?=
 =?utf-8?B?QjA4djJZQ1p1T29uUEJPSzFnbXVTQ2s4VmhxN3lxRWJXcDdOWmJaZFNLZDN2?=
 =?utf-8?B?T3RtaDVKVWxkeFdzOFhERW10VUxrR28xTURLdXE3TWhwTXBRcS9PRDM2UFcv?=
 =?utf-8?B?c01IaW5uamZTbzd0WlowLzY3NU5tQm1kWGlqK0tSWEJzQlhKakJ0eFlyV0FC?=
 =?utf-8?B?UTVPVVdVVDZQL2wwZ0FqQmJtU1VCNkdIT0ZUZGtBcXo2MFVEc1ZyVkJZN21R?=
 =?utf-8?B?QkdiSzJ5OTdkSDhsdjI0a2d0UjJoOXpDbFVONmdtSmpDNVkzR0tMd0NvWVFK?=
 =?utf-8?B?K3VFY2h6bWJEcUE3cG05QVRiZG12blNLM1VpNzRnSnJ3LzRpbG8vZ3RkZ3pR?=
 =?utf-8?B?aFE0RzBVdzlvY2dNRXh3ekR2R2dJZ00wZFRjTVZUUHBkZ2ppQWxldlF2dE1q?=
 =?utf-8?B?UEM0ODR0QTZhRmkzdVhaOUNSd1N1T04zYkFUZTNhL2RrRnM4Z3M0Z0FEL0pl?=
 =?utf-8?B?bjVMdHdTWE9yNkUyYnVaWk81YnFNY0tTZWZQdyt0bVovMzZiV3pDcFdwdHVq?=
 =?utf-8?B?QU9jNVo4L1loQ1VKSXBkY093THU2VWJGSmhuR2k1T01Tajd3NHdFeGJTZWZF?=
 =?utf-8?B?Uyt1R2xZUUdJOWI4aFhXeXg3NEpqOWZHQ0t4OUhKYTh4NVpDSXIwNHloOE11?=
 =?utf-8?B?MXRuREsvTE55OHFvMVR4RWl5ckd4L2JXN3dJeW5Ja2RaQjhwSGRCMzZaU1NC?=
 =?utf-8?B?dmVhNDRESHdQM1RGU3dqclYrK2NqNldDYmVIWWVYOCtYTW5QWFphMm9oU2Rp?=
 =?utf-8?B?cndDVWNkS2NWMFZqdkJaYUhaN3lQSjg3ZnJEUVB0cm1KdThZMVNYbUJySXNL?=
 =?utf-8?B?aEsvbC9LeWJzS1ZGTlpENkhQYno3dmJjTVY0bGVtZGF2U2Z3aVArc1RqNFhK?=
 =?utf-8?B?NFdSWlh1VmFBZ0xXYmc0RmNNYURZY3hhSjNwRU5MK0luYlY4Mjc3ZWE5dVRX?=
 =?utf-8?B?Rk5vb1VEaVdpc1pOdXBMMWdwWXcxNnBnUXI3Z1RqQW9ZNXJpMmZXbVR6TW9U?=
 =?utf-8?B?d21aSThpcGphN1M1ZStUTStRWmJYVUcwREp0VVl3ZXZZbkEycUFGMFh2U0Rx?=
 =?utf-8?B?ajNDQ0lQMHI3RXllZWNhMXJZSG1LNzFPckF3bm0wc2pKSGxwUnZLNCt5WUJK?=
 =?utf-8?B?UStXMnVHaVJJWlZWZEN6S25uM2wyRnB0TTJSQT09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 00:22:49.4468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dbe77f6-442a-49fb-f4a2-08ddb9c7be1b
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR18MB5832

Add initial device tree support for the AX3000 SoC and its evaluation
platform. The AX3000 is a multi-core SoC featuring 4 Cortex-A53 cores,
Secure Vault, AI Engine and Firewall.

It adds support for Cortex-A53 CPUs, timer, UARTs, and I3C
controllers on the AX3000 evaluation board.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 arch/arm64/boot/dts/Makefile              |   1 +
 arch/arm64/boot/dts/axiado/Makefile       |   2 +
 arch/arm64/boot/dts/axiado/ax3000-evk.dts |  79 +++++
 arch/arm64/boot/dts/axiado/ax3000.dtsi    | 520 ++++++++++++++++++++++++++++++
 4 files changed, 602 insertions(+)

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 79b73a21ddc22b17308554e502f8207392935b45..47dd8a1a7960d179ee28969a1d6750bfa0d73da1 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -9,6 +9,7 @@ subdir-y += amlogic
 subdir-y += apm
 subdir-y += apple
 subdir-y += arm
+subdir-y += axiado
 subdir-y += bitmain
 subdir-y += blaize
 subdir-y += broadcom
diff --git a/arch/arm64/boot/dts/axiado/Makefile b/arch/arm64/boot/dts/axiado/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..6676ad07db6129f8b333b0feffee705d272517c2
--- /dev/null
+++ b/arch/arm64/boot/dts/axiado/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_AXIADO) += ax3000-evk.dtb
diff --git a/arch/arm64/boot/dts/axiado/ax3000-evk.dts b/arch/arm64/boot/dts/axiado/ax3000-evk.dts
new file mode 100644
index 0000000000000000000000000000000000000000..92101c5b534bfac8b463adaa1c4f0d4367d01e21
--- /dev/null
+++ b/arch/arm64/boot/dts/axiado/ax3000-evk.dts
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2021-25 Axiado Corporation (or its affiliates). All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "ax3000.dtsi"
+
+/ {
+	model = "Axiado AX3000 EVK";
+	compatible = "axiado,ax3000-evk", "axiado,ax3000";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial3 = &uart3;
+	};
+
+	chosen {
+		stdout-path = "serial3:115200";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		/* Cortex-A53 will use following memory map */
+		reg = <0x00000000 0x3d000000 0x00000000 0x23000000>,
+		      <0x00000004 0x00000000 0x00000000 0x80000000>;
+	};
+};
+
+/* GPIO bank 0 - 7 */
+&gpio0 {
+	status = "okay";
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&gpio2 {
+	status = "okay";
+};
+
+&gpio3 {
+	status = "okay";
+};
+
+&gpio4 {
+	status = "okay";
+};
+
+&gpio5 {
+	status = "okay";
+};
+
+&gpio6 {
+	status = "okay";
+};
+
+&gpio7 {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/axiado/ax3000.dtsi b/arch/arm64/boot/dts/axiado/ax3000.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..792f52e0c7dd42cbc54b0eb47e25b0fbf1a706b8
--- /dev/null
+++ b/arch/arm64/boot/dts/axiado/ax3000.dtsi
@@ -0,0 +1,520 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2021-25 Axiado Corporation (or its affiliates). All rights reserved.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/memreserve/ 0x3c0013a0 0x00000008;	/* cpu-release-addr */
+/ {
+	model = "Axiado AX3000";
+	interrupt-parent = <&gic500>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x0>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x3c0013a0>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x1>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x3c0013a0>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x2>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x3c0013a0>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x3>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x3c0013a0>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&l2>;
+		};
+
+		l2: l2-cache0 {
+			compatible = "cache";
+			cache-size = <0x100000>;
+			cache-unified;
+			cache-line-size = <64>;
+			cache-sets = <1024>;
+			cache-level = <2>;
+		};
+	};
+
+	clocks {
+		clk_xin: clock-200000000 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <200000000>;
+			clock-output-names = "clk_xin";
+		};
+
+		refclk: clock-125000000 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <125000000>;
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		interrupt-parent = <&gic500>;
+
+		gic500: interrupt-controller@80300000 {
+			compatible = "arm,gic-v3";
+			reg = <0x00 0x80300000 0x00 0x10000>,
+			      <0x00 0x80380000 0x00 0x80000>;
+			ranges;
+			#interrupt-cells = <3>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			interrupt-controller;
+			#redistributor-regions = <1>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		/* GPIO Controller banks 0 - 7 */
+		gpio0: gpio-controller@80500000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x00 0x80500000 0x00 0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio1: gpio-controller@80580000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x00 0x80580000 0x00 0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio2: gpio-controller@80600000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x00 0x80600000 0x00 0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio3: gpio-controller@80680000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x00 0x80680000 0x00 0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio4: gpio-controller@80700000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x00 0x80700000 0x00 0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio5: gpio-controller@80780000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x00 0x80780000 0x00 0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio6: gpio-controller@80800000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x00 0x80800000 0x00 0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio7: gpio-controller@80880000 {
+			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
+			reg = <0x00 0x80880000 0x00 0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		/* I3C Controller 0 - 16 */
+		i3c0: i3c@80500400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80500400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c1: i3c@80500800 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80500800 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c2: i3c@80580400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80580400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c3: i3c@80580800 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80580800 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c4: i3c@80600400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80600400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c5: i3c@80600800 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80600800 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c6: i3c@80680400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80680400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c7: i3c@80680800 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80680800 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c8: i3c@80700400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80700400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c9: i3c@80700800 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80700800 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c10: i3c@80780400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80780400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c11: i3c@80780800 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80780800 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c12: i3c@80800400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80800400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c13: i3c@80800800 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80800800 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c14: i3c@80880400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80880400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c15: i3c@80880800 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80880800 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c16: i3c@80620400 {
+			compatible = "axiado,ax3000-i3c", "cdns,i3c-master";
+			reg = <0x00 0x80620400 0x00 0x400>;
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		uart0: serial@80520000 {
+			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";
+			reg = <0x00 0x80520000 0x00 0x100>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &refclk>;
+			status = "disabled";
+		};
+
+		uart1: serial@805a0000 {
+			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";
+			reg = <0x00 0x805A0000 0x00 0x100>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &refclk>;
+			status = "disabled";
+		};
+
+		uart2: serial@80620000 {
+			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";
+			reg = <0x00 0x80620000 0x00 0x100>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &refclk>;
+			status = "disabled";
+		};
+
+		uart3: serial@80520800 {
+			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";
+			reg = <0x00 0x80520800 0x00 0x100>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &refclk>;
+			status = "disabled";
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic500>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
+			   <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
+			   <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
+			   <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};

-- 
2.25.1


