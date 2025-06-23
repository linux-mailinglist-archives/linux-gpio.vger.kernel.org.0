Return-Path: <linux-gpio+bounces-22024-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1844AE4BD9
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 19:29:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA48B17BC2E
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 17:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B3629DB7F;
	Mon, 23 Jun 2025 17:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="prywSeAF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2092.outbound.protection.outlook.com [40.107.95.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E24E29CB31;
	Mon, 23 Jun 2025 17:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750699726; cv=fail; b=fBsYOHWv7Psk/e21RTUUGZDisU/bqtTQVXwt8Du5K8LoPMoVeW30ZKnGNxiL97WTToJ1pKfKwPD+LLqLihn55lOVocGKuDMsIP2NIRGU+53g2q3W08c+7rgFmLWPgO3foFlea7j9tsl6L8QRSAnyW37wo3nK1BfpJ18YYucpYJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750699726; c=relaxed/simple;
	bh=XRBQadUGd5Q7RkZsi0apP9VXciKOyzDXLaC3hYUPU9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QdsZFU3SHyuwpGkkGpw8AtClPz9waet2u4/7duOcqJJxeOk+6NqyfjaXLj4pcOH26Gm7EkGGpl92+VnynsxIIpxw9mXBJq2PT24Fo/JOV9fbIy3GKQZABnJRKw5tLO1fnnTyQBkPUutPqaHUtTpwUIaH/sEMt3PwGi50oKNwZ5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=prywSeAF; arc=fail smtp.client-ip=40.107.95.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9oIagywAfh94HP4BN8TcgDOoxGV5R5ZjxzD3/QinL1ZQgNTwoWuFM3BzMSG62ePtfTuBhdno4Dzel/U1LGoqfX8BGbvUhKrJh0QrNN5KBdLdlXaBOprefwsakiMTEtGD0GYAVXoZdviPjb65jfAY3JqK5o3SAhe24Y5F+mtOZgWsoWEX3iVUi/YeKcm41F5scZxVAEJddZbhh2BY83IJJV1MimYGqXtT17pKO8wuzm/wJ+UwjQDKqJjS7aVakN+/wphezDRey11MShhvFDMFluwDaPBhlrHw/sXnCRxS0Ug9HkkbGWalf7Q8XSqlH5lLzGqgoh2OaqTCGyqiI9kPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMeoVOqfOIAKTxDakikQh3RHWrCfRIkHbOeDCSyEFzU=;
 b=v735195Eq+zAoqKCjbDrMqzMWBhLtSs6G+dTXfHjvh18dV4IZHG4lJ7qF0usSCkylawM2Tj5MxHV2cW+BG1UCcOTj/jyPS9k6+9TJM7Mtem6j9MHJ2DGT0JlSFdtDEotCnptsmn56/mZl5Uz4bFpXHMtY8vmftgqef6UipjTg3zhlLynxphi/PbdfXv+8GDVrXbGQoZ9r7Ldw6xYeN/PGDbRhmHbXKmjgMJTy3qkQZ2RJEVKtAOTL/bHw3O0GoiDZbR3MxuKjMGsjp4yLuxvTVfmjYaR42iPXpethtGst8U2AyDCujY3FoFTuu4jxIxghHZy69SUaC2IhLRK+FR45Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMeoVOqfOIAKTxDakikQh3RHWrCfRIkHbOeDCSyEFzU=;
 b=prywSeAFsRpTc+KVRvcnios0bnjt0T2+r4XxbzzwvypgFmlJ2L63lx3jL1zhOeQmW30Hi5T7WSOkuIMNt8XHRb9Refh4HV1f5uqWbDdlYh8dkcD3s9ZKAZBr9/2bNV9nwUKS06OwP+zG0LBTd933SebJArFQuW/JpwG/Oc8Q9OhfZK1FT3xM5iGXd/pCGg3UgRS/cKpombM9f7vbTYbuZQDJqEMwb/TiYZ1u7Xon+cJJrhJBwEWbW3tgeygWpaVdAHhbdSIwvNoVIgBdss+l9avn7PkO7Q5AIsafOWnE5PExlociSHFhMR8OALQI38uPCr5Hrn6Glv0nsuCqMYoQOQ==
Received: from BN9PR03CA0092.namprd03.prod.outlook.com (2603:10b6:408:fd::7)
 by PH7PR18MB5080.namprd18.prod.outlook.com (2603:10b6:510:153::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Mon, 23 Jun
 2025 17:28:41 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:408:fd:cafe::c6) by BN9PR03CA0092.outlook.office365.com
 (2603:10b6:408:fd::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.32 via Frontend Transport; Mon,
 23 Jun 2025 17:28:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.0.1];
Received: from [127.0.0.1] (50.233.182.194) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Mon, 23 Jun 2025 17:28:40 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Mon, 23 Jun 2025 10:28:16 -0700
Subject: [PATCH v3 5/7] arm64: dts: axiado: Add initial support for AX3000
 SoC and eval board
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-5-b3e66a7491f5@axiado.com>
References: <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com>
In-Reply-To: <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Jan Kotas <jank@cadence.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 soc@lists.linux.dev, Jan Kotas <jank@cadence.com>, 
 Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=17627; i=hshah@axiado.com;
 h=from:subject:message-id; bh=XRBQadUGd5Q7RkZsi0apP9VXciKOyzDXLaC3hYUPU9Y=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoWY67ed8mYD4oEtfc3Zux11Tp23jKZr5Y3H+07
 O7vdTpgioGJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaFmOuwAKCRDxWHMRoTLV
 ++uNC/0UOx1ZUBbqMJR1MI0HtFBnELsd0/sPLXyVuhNidUrhmuH6xv7kY7Gd6+WxVCKC3zAnXLH
 1d4kSExZXrjKpUDJJd/jutmClYSM8uSYyZzQHfzGMnL9vp/nPPVdoLzQpRWwujS60w5zjm8Bmln
 K2AkkQzJhUc+5zEPKS4fMCH+1JtUC1cYFpeZI5ESD4B8OkKchf/F+4cuvYn/GeuaJPTGfh2Fetk
 LGRB3zDkrHgYq5rAxddMOy84JHnpwSes4U1f2mOV3Luqzq78K7PvlnEk/V+OGAjDGPGLD21UJvi
 NXBMDUilDzAW2aUYAM02F9G0yXmWpAuQco2P4tCDla8iI//m+c8i9oU2g6Ym6h6e/4YeVktQo9E
 Stf1g/wMsRkWbeQ2QFVtaxStGGB7RCl8EZb9slDawwYo8N0y17eyqshFUIeJ0Nm058tnJrOV19I
 FkjFpnzrRO4IB8hBK+64QooTPcC6O+MvWbe+wvtozt7iAxZjYk4ka2Gpn+gCIOBbRpsCg=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|PH7PR18MB5080:EE_
X-MS-Office365-Filtering-Correlation-Id: 724dce83-e04d-46d5-1293-08ddb27b65b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUdzY0pTc1F3NFVlWVNQa2Y3NHkyWExiWDY4MGxHU0hsQnl1NnJ0RTBrMFFQ?=
 =?utf-8?B?MC9mMzZtanJBb05XWWtYb0dCOUM3TmlFWFRDUjFRVGxDTkExeU41SXB2QVow?=
 =?utf-8?B?ZzB6NE5vRXNRa3l3VDl4K0wwYncvZWJYamczUzRrejk3S0xLUUQ1aUp2NWkr?=
 =?utf-8?B?S1pkeElDUVFDaUhVc21PRG5LUFI3SXhhM0pxTDhjaWlSNmx2TTgyWEVGazBU?=
 =?utf-8?B?WEk4VTd4d2R5WTlXQ3JkbGpOTW9UbmRjZFUydCtQQVhJVjJ3UWpEZnI3OHpq?=
 =?utf-8?B?UE1tODhpcjVQdzhvek00bzY4a2JTNm5WWGcybjFVNzV0anpSUXB6ZXZFc3J1?=
 =?utf-8?B?dUozR2k0MmdGbCtUSlZMQW5La2hpSzNsSzk4NlhmRlYwZnRDNXV0Qld0Y3FJ?=
 =?utf-8?B?dDB5bkdOWTFHWmJ1U1VIMVlPNFE2UzFVR2ZVQ2xLM2xxaFZGYS9PRzkyUVJ3?=
 =?utf-8?B?Z2lndzdhdkhjKytoM2xSMUtuekRyOTVWUGhYQmJzcWM1V05LTGFDbk1yUFZG?=
 =?utf-8?B?c1YvMXhLUDlBdmEwME53RjVXRVhlaFlVVFNFVHpOVUpxVVlVV3ZXTGN0RkUy?=
 =?utf-8?B?cGxxczRGbnRjSzJpazJDTDRrQ2l3MWxXMVhCR3E4V29MM2l0RzhoQW5wcDNv?=
 =?utf-8?B?b1RHSXhRclAvMDVFWjgrYk9Lc1FPam1Sd2w1ZE91aU0vSDFtT2wzL3EyOWIr?=
 =?utf-8?B?bUdoSzREYnY5WEpaSlR3MlZmVTdoZmhKWUdCYzBINDhOWkExOGZqblliU3lh?=
 =?utf-8?B?Q1NiRUpBWkhSb3RacSsvN1VZSjdORm9YYjZpQVZBVFl1TGVkRGNOanVsTm9v?=
 =?utf-8?B?eGhpV3VPZHdKWUU4VGNaRm0rSUcrSkx2ZWlESWFyeHdacW84bnZIK0cyUzIy?=
 =?utf-8?B?VFlsVEdaWktkRUlWUDRmQ0RHTmpzMzhrK2hsR1ZmMWsvN1hqbS9IM1lQc1B6?=
 =?utf-8?B?Vmh2aWhSR3JqL1pic0hOdDA3bndWaFRVUTZTbjNqSzBBUTJxL0VzUnBnTW5r?=
 =?utf-8?B?Ykc5aFZCM0hrNUhrU0h5NEpVM3hwZDJoeVlLVmU2T3VtbEdCZUd2Mm4vd2xO?=
 =?utf-8?B?UmNtTFRFM0xOQUxSRk1FVzZPMGpGSTJyQ1FYVnpYYVdxVjNxMU1QVTlrb2w4?=
 =?utf-8?B?YldLbVdEaUpHOUJiOHd5d1pwb05NSklBRS9yNzdKL3ZTazJjb2NPUFl1ckRT?=
 =?utf-8?B?N1Znbmc3REhNTDZDZWpJQ1dRc0pBK3NISjl0bGxtOXFnQUVkK2NidUo4ZU9S?=
 =?utf-8?B?VURORmVPNWF1OWtNUVR5dnk4engveXJXRldxbVlIMk5iVWx0WjUyNUNtb01q?=
 =?utf-8?B?Z1BNM2ZxVFJzSDdRYzdpZDMzUUVwSDRMTjBYOFV6QkpuQ1RRSzRBeWtCMWtt?=
 =?utf-8?B?aXlsZVo4UU02dU8vRnBKRzZWT3hIUzlNSVBJM3hZakFqbm15VFAwcTVheGpT?=
 =?utf-8?B?K0ZvRU5kNGxyaXRCcmlua3lKNk9RNnh6Y0lKazlCMWRLcUVOKy80dXVCaVhD?=
 =?utf-8?B?NUViVG54cWJ4QUUxbm5uQlB6dGNRb3FJODJjN1lRa2JtL0lCdUdJWXRybDd1?=
 =?utf-8?B?MUwzNGlna0Q0dHY2eXFUbTNQSzJ3dHZPSUNmNmRpU1pNYlhSK1VETzVlekFY?=
 =?utf-8?B?Qk1XZzk1cnRDMzFwWGRBN0JYandUb0pXVEFiZzRyUUZnaDBUTU80U29jdDh3?=
 =?utf-8?B?bFhLN2RWVncyQ3BISkcwRmtCYnN1Z1BsUnlFQjZDZXdBSHlHNnZuQWV6OG81?=
 =?utf-8?B?aS90bnMwV3M2akNSRjNOVTV4d3I4dDVFdVhnTGZkcHFPbXNRdlB4WnJxb1o2?=
 =?utf-8?B?bGRtS3JKaHM1NUkvRlNTSTRySTNnVENNcGV2UVNqd2xoang0ZmlTdVdhSXJY?=
 =?utf-8?B?MVhxVWlIa0pKTXJpdWdZQVRQd1B0YzU4ZytCL2l6WnBuUE14OHRLNXNsK3J3?=
 =?utf-8?B?SjUvTzhnandiaTVrUVNJV1RTUE9JcjFVQ3duS0ZuUUt1M0hRZWpYVk1mL0t2?=
 =?utf-8?B?NCt1L3o1K1FBbXd5ZlBseDk3eVFubWxuNVYzeEQvQmhvaitqY0tKSzZ4MGp0?=
 =?utf-8?Q?nQIXfF?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 17:28:40.0247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 724dce83-e04d-46d5-1293-08ddb27b65b2
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR18MB5080

Add initial device tree support for the AX3000 SoC and its evaluation
platform. The AX3000 is a multi-core SoC featuring 4 Cortex-A53 cores,
Secure Vault, AI Engine and Firewall.

This commit adds support for Cortex-A53 CPUs, timer, UARTs, and I3C
controllers on the AX3000 evaluation board.

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 arch/arm64/boot/dts/Makefile              |   1 +
 arch/arm64/boot/dts/axiado/Makefile       |   2 +
 arch/arm64/boot/dts/axiado/ax3000-evk.dts |  79 +++++
 arch/arm64/boot/dts/axiado/ax3000.dtsi    | 488 ++++++++++++++++++++++++++++++
 4 files changed, 570 insertions(+)

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
index 0000000000000000000000000000000000000000..cc3bcf681c32430d251f20f6d52905423c182f3b
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
+		reg = <0x00000000 0x3D000000 0x00000000 0x23000000>,
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
index 0000000000000000000000000000000000000000..ea85ae8ca5dea5ab3288a2770b18d7aeb66cad03
--- /dev/null
+++ b/arch/arm64/boot/dts/axiado/ax3000.dtsi
@@ -0,0 +1,488 @@
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
+				  <0x00 0x80380000 0x00 0x80000>;
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
+			compatible = "cdns,gpio-r1p02";
+			reg = <0x00 0x80500000 0x00  0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+		gpio1: gpio-controller@80580000 {
+			compatible = "cdns,gpio-r1p02";
+			reg = <0x00 0x80580000 0x00  0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+		gpio2: gpio-controller@80600000 {
+			compatible = "cdns,gpio-r1p02";
+			reg = <0x00 0x80600000 0x00  0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+		gpio3: gpio-controller@80680000 {
+			compatible = "cdns,gpio-r1p02";
+			reg = <0x00 0x80680000 0x00  0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+		gpio4: gpio-controller@80700000 {
+			compatible = "cdns,gpio-r1p02";
+			reg = <0x00 0x80700000 0x00  0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+		gpio5: gpio-controller@80780000 {
+			compatible = "cdns,gpio-r1p02";
+			reg = <0x00 0x80780000 0x00  0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+		gpio6: gpio-controller@80800000 {
+			compatible = "cdns,gpio-r1p02";
+			reg = <0x00 0x80800000 0x00  0x400>;
+			clocks = <&refclk>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+		gpio7: gpio-controller@80880000 {
+			compatible = "cdns,gpio-r1p02";
+			reg = <0x00 0x80880000 0x00  0x400>;
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
+			compatible = "cdns,i3c-master";
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
+		i3c1: i3c@80500800 {
+			compatible = "cdns,i3c-master";
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
+		i3c2: i3c@80580400 {
+			compatible = "cdns,i3c-master";
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
+		i3c3: i3c@80580800 {
+			compatible = "cdns,i3c-master";
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
+		i3c4: i3c@80600400 {
+			compatible = "cdns,i3c-master";
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
+		i3c5: i3c@80600800 {
+			compatible = "cdns,i3c-master";
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
+		i3c6: i3c@80680400 {
+			compatible = "cdns,i3c-master";
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
+		i3c7: i3c@80680800 {
+			compatible = "cdns,i3c-master";
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
+		i3c8: i3c@80700400 {
+			compatible = "cdns,i3c-master";
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
+		i3c9: i3c@80700800 {
+			compatible = "cdns,i3c-master";
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
+		i3c10: i3c@80780400 {
+			compatible = "cdns,i3c-master";
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
+		i3c11: i3c@80780800 {
+			compatible = "cdns,i3c-master";
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
+		i3c12: i3c@80800400 {
+			compatible = "cdns,i3c-master";
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
+		i3c13: i3c@80800800 {
+			compatible = "cdns,i3c-master";
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
+		i3c14: i3c@80880400 {
+			compatible = "cdns,i3c-master";
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
+		i3c15: i3c@80880800 {
+			compatible = "cdns,i3c-master";
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
+		i3c16: i3c@80620400 {
+			compatible = "cdns,i3c-master";
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
+		uart0: serial@80520000 {
+			compatible = "xlnx,zynqmp-uart", "cdns,uart-r1p12";
+			reg = <0x00 0x80520000 0x00 0x100>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &refclk>;
+			status = "disabled";
+		};
+		uart1: serial@805a0000 {
+			compatible = "xlnx,zynqmp-uart", "cdns,uart-r1p12";
+			reg = <0x00 0x805A0000 0x00 0x100>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &refclk>;
+			status = "disabled";
+		};
+		uart2: serial@80620000 {
+			compatible = "xlnx,zynqmp-uart", "cdns,uart-r1p12";
+			reg = <0x00 0x80620000 0x00 0x100>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &refclk>;
+			status = "disabled";
+		};
+		uart3: serial@80520800 {
+			compatible = "xlnx,zynqmp-uart", "cdns,uart-r1p12";
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


