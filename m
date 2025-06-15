Return-Path: <linux-gpio+bounces-21605-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 442BBADA087
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Jun 2025 03:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B6F63B58B7
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Jun 2025 01:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B8F18DB02;
	Sun, 15 Jun 2025 01:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="NeAYj8yc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2103.outbound.protection.outlook.com [40.107.92.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4EC2E659;
	Sun, 15 Jun 2025 01:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749950010; cv=fail; b=ipM4Ns5BN4J8zldfR7OO/tbV+EnuiNqVWGnkw2gW4Wpq5pHuYus+N3RENAkhyfgdVp2mzUjZAAYC8xHab3geSHfmu4iuOgXm3jje/RYoTp5GjaKWqA0RSJEtxRckboi0PvuvyZE7Jfxm1h3QgrhVSXwQZr5W7rsbiJ5ANmq6O7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749950010; c=relaxed/simple;
	bh=ax5WVHwMn9h9/QI+fZ1jJWwNN4R6eLWVvY8XrQOgkgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KEUSSxArIbpzgEOTjdp43sVX72jxfS+HwaPXGQ8e8NbTTJ/DjejQavEnmZ62uqKrpuvWCM5F6ENHb0JJ96nP7MC8tcQGb8H83X0irbwdKGe6zfyD8KqpQKBq7lidmANjgcxTDTKxlDPRpODDPAYwbl87l7x+ODgyyeM4lFMyeys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=NeAYj8yc; arc=fail smtp.client-ip=40.107.92.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tN/BCqR5kuXK9ZduGsdQDAcTuWYDsuadKcSQvP5Msp1fksJVdhY4nco6jG1btBdq6wQBY4PaT/3Arq40GhBRr6lysYw2MB4aEpannb7lUwdRLJkoxh52GUKjX55Vjn5E77cAUL0B81aQGixlAFUQT80RA75l9MPmBSvqi3A9yq2qNX1nN5CLU6JKBUCShoAA/rL3x3ufwgnqIMJ53ShDR5DU9BHHLa0JUqXSK9ZargUg/qrtUM1TodzZ4AcHByA9jjhZAfgT+EJ/K4uBtTdvj5dG0G8bqtwq9wjEfL/OF91BxYWtFAWwDTr7ehfXsmmEWrNBjWrfU57oOcxtIXSUMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTytpIyACWpdVOC1FrmEAlCiu3DOhyaJw9sL+z8P8t8=;
 b=o1dsaz5djm0ehsLkUB2sEBR1TEq2YF2j6R7zHy9jjGhy6hZaOQr98UwHqcAu8wZOJDR+64mxmXVoip7+oCFE/6MoH7Y0gsD8J2iyCoxQeWDmRDsv/mkxC6plv77Y2GVpw/vszDJCiebPKSdgdMFmrpNqSgftT63z+cp7fqafz39z90zN7evjUXRSJSLFkpm92IPKMbOYEbV4G1dIRq65L8gjlqv/98142K6g5t9hUIsQzJyHnBUAPQ6qiBjnfX+kdRmLnjN1BWWroOxGQ/haMVH/2Sk70W6bbIfAtCl5boIdQUEkeJktDBIxlzilDuryOWOTY0p4srkS4EQJl8bXQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=arndb.de smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTytpIyACWpdVOC1FrmEAlCiu3DOhyaJw9sL+z8P8t8=;
 b=NeAYj8ycKnNqi+k7uyHqp5bySBhkTCyPZSnr7edduTCBJbnsPqhw+Ms6ouST4P5XaYs5jyfjZT5Ex4XAPOYCvkBGseQJp8Kr+Cj1CcpIOo4Gbb3kQVnZbViwc9JPGMZKXOaC2qALWhsDQqBsbYSQfX2fHCKGFi7f4eLkw1Hwbhod4y/4WBjavPlSZD4M7m3WR+SkL42/bXlOVDjsaDQR/qTAPixdLjouIeWkYKVUAgpWGnzdJ0n6Yl//3XTOLbjXb/liFuKQ0eGOyRVxvoSrFdV8eBnGwadCFoKRrtd9XIz4MitxcIr1Gk5rdEzezwADryNsTDIVuUtYS4wBKmtsuQ==
Received: from BY3PR05CA0003.namprd05.prod.outlook.com (2603:10b6:a03:254::8)
 by SA0PR18MB3613.namprd18.prod.outlook.com (2603:10b6:806:71::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Sun, 15 Jun
 2025 01:13:20 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:a03:254:cafe::2c) by BY3PR05CA0003.outlook.office365.com
 (2603:10b6:a03:254::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Sun,
 15 Jun 2025 01:13:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.0.1];
Received: from [127.0.0.1] (50.233.182.194) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Sun, 15 Jun 2025 01:13:19 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Sat, 14 Jun 2025 18:12:50 -0700
Subject: [PATCH 4/6] arm64: dts: axiado: Add initial support for AX3000 SoC
 and eval board
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-4-327ab344c16d@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=19004; i=hshah@axiado.com;
 h=from:subject:message-id; bh=ax5WVHwMn9h9/QI+fZ1jJWwNN4R6eLWVvY8XrQOgkgA=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoTh4o0x9p4+NoG2FMxsJ/4Jjs83ulZafOxJzTK
 oZWlB333mKJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaE4eKAAKCRDxWHMRoTLV
 +yFUC/9fwWsGhvYSWq/mAVKVfViHBjWa/oU/cSv9a/v0+tjPrdVAmfLB/oqUrmQXXFwXGkWFyQ5
 5NQZBlppRKWFrlkGC1ykBSbcdprQA/AqC/ySwxf52ICkaugqv3caBG3SJGUi8aNrQ1Kf88H5DKP
 gBkG60DNlVbuMhyz31Bomlvl6xBcP69HQuCbZr9q/aQusUM6kwH4TO8cP98YKQqopJ6BOlI5a73
 /6FrP39HMWy5KmLxnAkSfwWpC+21ff19qlSspor3VU3uyrAVlJmnropR9EIWzZrQgsl0mczElKP
 A2WdSg+Oc7D7GX1uq0wZsk7VC1LdNmCW/diore1Sx6VC0/7jLsTDtQkkBB0WUIUJIi9iKx08i3J
 Z1psT+FRojXRNmLTuZ7l3YAxJTVetAU5uMbzi5L7EhkzVu982eMDq1fu8oAzIvtSyo57cOMYicM
 kQfcHOzNV/olLXR9dzD+reEd+tjHpwlSl+jzel6fzohf6u6Za0VTsQm+g54zfEeX8wo0o=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|SA0PR18MB3613:EE_
X-MS-Office365-Filtering-Correlation-Id: cc2a224d-330e-442c-1290-08ddaba9d128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UEMxdjlQcDZjdUJDejFuUExFNE81d29GU1RlaHc4T2ExSFJmQUllaHdGUzNl?=
 =?utf-8?B?Z2JCVXk2OXZtTVE3djFZRVRBZFN6WWdlbXZLUkVUUjNCMzhpaHdmSEc1VDAz?=
 =?utf-8?B?UjJDK0ZVMmJJTWxTR0RVRllvQXYxRldwa0wzc2srNEpsWVZpN1BkUmhMd1RK?=
 =?utf-8?B?alJVLzNvcEIvTHR0MHhoc1RpaDJLREhhUENncVJ6Q3M3Wkt4RmJlZHFSdE1U?=
 =?utf-8?B?emxSL0J6YzRsRzgwYnBEUitRV2VIMkF4MEpZVFhya05rZFhOMjBFMG5hQjc1?=
 =?utf-8?B?amtuVDhSN1ZlemFOaEhHTk9XYWg5Y2gvQ21vYlNpWTJ3VmYxL3JuUkFTOHA3?=
 =?utf-8?B?MzNITkRidDFwNzAwY3NNQThGd1UybXpFNUUxTjM1YmlyQ2wwM0RUYjhpekFT?=
 =?utf-8?B?TDVtYk5qc293a2UxeERabStlRVVKd2hUMG11NmM2QTVzaGhhWE5EUWJYR09C?=
 =?utf-8?B?bTFNUHZTVS9rZWtvZWxHZnRSM3ZCWDdaZjFxWlc3Y3dZbWZ0KzFXSUVzUUJk?=
 =?utf-8?B?alZ2a216WDNqUmFSdXArQ0VUN2k1Wi9adEVDRHNGWUpWVG5oY3lLV0EzSUZs?=
 =?utf-8?B?NHhSNDNEV1VIT0orRVlQWmZDNFB3MmtSUzlJYUM2Sjd4ZnFLbXQ3V2t3UEIy?=
 =?utf-8?B?Smd4UmN2VERYZWNKaDRzUDBScHhLc3Y4YWI3K2ZzRHBoRzRBRXQveFNOejFO?=
 =?utf-8?B?Z2hTMjZKOXVOT1BwLzluaUlMYXBKTFZQblJycHlrQzRWcjNCMkxIUCtvejJS?=
 =?utf-8?B?RTdYZFd0NFVnQWtrUDBPMDNaTnpRRmV1M0pRZnROMVVlb3ovNnRzSC9aOVFO?=
 =?utf-8?B?QkpkYzNPeFl6ZVVkdkZHdUJMd2YzcVFLR0Fubm83QVJiQTE3cVR3SmluR3Jo?=
 =?utf-8?B?S2xtemd4cnlqdWxRaXBUVWxxNWtuNXhuR0plY3QxaUpFWG9iT2VJaUQwYnhr?=
 =?utf-8?B?UEREczlWQ0RPU3kwTmNNcXdRQlNuR2U4dkhFdE9XdVdWa3hOWGZOZ2I0bW41?=
 =?utf-8?B?bEI2RGdBajFpNmhmNzZUYUE0bU5vTzF2Ujc4SlRBV3k0MkEwcjZ5cVIyN3FE?=
 =?utf-8?B?eWFvdmZTa2tjMWVhVGcrVjJsaml6bTF0anVscmdzRTQvd2V2ek9Ra3I3VUtS?=
 =?utf-8?B?MzJEUTJRSUlrL0dSdmU5SzgxSVhmSE1VZDQ1TG1IeTlZQ1BPTjBCRjhRZDFv?=
 =?utf-8?B?SnJwSkJramxpazZjK0VmNmM4QlBLTytpQmJFdjJoeWQ0Q1NpbG85d3RibHd1?=
 =?utf-8?B?YU9MVTdUekRPQjRNV3VQVml1TDhNWXk3bitNd2wyN0xFTXdpVmlDRWcxYXdt?=
 =?utf-8?B?T1M0Y3dnVkhPRVIwY0xwQlkwbC9STHJTQWVMWWs5Z0ZpUGZoZE5TUG40M3RZ?=
 =?utf-8?B?eUE5eXBkd0krR2UrM3VYNU80SXJ1TldtN2hKcjlaS1FKeUY5RVAxU25OWlQz?=
 =?utf-8?B?T2J0RWhsOXBtV1VCNERWQVg1L0ZHZ2xTQWFKbzh0bUdWeEFpQWVYTTE5bTdt?=
 =?utf-8?B?OUxUbW51bXFjZCt5QzFYOE1ORFd0RUU3QjB6dWJZa0h0QVFFOGQwR3BjUXdY?=
 =?utf-8?B?MEx1NnFOSHdvdVZQRWp5WlhMUVpGRU9pY0dNS09IeWdkTE9PY2dmVEM4c3BB?=
 =?utf-8?B?YXRNbjZFamlJRFZhMjdvaUJIQVovR2k4UGZMQmc1MGd0UzVhcm5RYjdoWmpo?=
 =?utf-8?B?SDg5QjBDb0lYUzBrcVU3d3ZzclBUS0NPK1Z6UmVCQUZpRWt2T08wdjhaSG9R?=
 =?utf-8?B?d1dQRThiVTkwZ0tFaWQ0VmdCcSs3OFdnY0ltTHdTZmpZNE0rb1cvbmlsZVNP?=
 =?utf-8?B?cE9vbVF1OTJHNjA0VTJsZE1VK2pFZ3NUUVN1ZGI5R0YrT3RvRFluNXZmV3hv?=
 =?utf-8?B?cmVyV1Z4d01WTC9BZCtWUDIzUnFnL0s4WU5NN3BMUHludHVnclpWb2tJak54?=
 =?utf-8?B?NHpMVkV6bDlwMDBib3pzODI5RG9JOTBOOHdScnVEU1lxVDN1Z3BpYlM5b1Ro?=
 =?utf-8?B?Y3diSW9PNXpQaThhbnZ2ckhCRFd4VXdwNU5jZzdnaXQrbU1PS3hlZlRZMWRz?=
 =?utf-8?Q?evQepj?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 01:13:19.9416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc2a224d-330e-442c-1290-08ddaba9d128
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR18MB3613

Add initial device tree support for the AX3000 SoC and its evaluation
platform. The AX3000 is a multi-core SoC featuring 4 Cortex-A53 cores,
Secure Vault, AI Engine and Firewall.

This commit adds support for Cortex-A53 CPUs, timer, UARTs, and I3C
controllers on the AX3000 evaluation board.

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 arch/arm64/boot/dts/Makefile              |   1 +
 arch/arm64/boot/dts/axiado/Makefile       |   2 +
 arch/arm64/boot/dts/axiado/ax3000.dtsi    | 584 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/axiado/ax3000_evk.dts |  72 ++++
 4 files changed, 659 insertions(+)

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
index 0000000000000000000000000000000000000000..eb5e08ba0f39c32cdbfd586d982849a80da30160
--- /dev/null
+++ b/arch/arm64/boot/dts/axiado/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_AXIADO) += ax3000_evk.dtb
diff --git a/arch/arm64/boot/dts/axiado/ax3000.dtsi b/arch/arm64/boot/dts/axiado/ax3000.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..d5d84986d18efe9dfbb446ceee42fc4e4dbf95d0
--- /dev/null
+++ b/arch/arm64/boot/dts/axiado/ax3000.dtsi
@@ -0,0 +1,584 @@
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
+	compatible = "axiado,ax3000";
+	interrupt-parent = <&gic500>;
+
+	aliases {
+		i3c0 = &i3c0;
+		i3c1 = &i3c1;
+		i3c2 = &i3c2;
+		i3c3 = &i3c3;
+		i3c4 = &i3c4;
+		i3c5 = &i3c5;
+		i3c6 = &i3c6;
+		i3c7 = &i3c7;
+		i3c8 = &i3c8;
+		i3c9 = &i3c9;
+		i3c10 = &i3c10;
+		i3c11 = &i3c11;
+		i3c12 = &i3c12;
+		i3c13 = &i3c13;
+		i3c14 = &i3c14;
+		i3c15 = &i3c15;
+		i3c16 = &i3c16;
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+	};
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
+	timer:timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic500>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
+			   <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
+			   <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
+			   <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;
+		arm,cpu-registers-not-fw-configured;
+	};
+
+	clocks {
+		refclk: refclk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <125000000>;
+		};
+
+		ref_clk: ref_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <1>;
+		};
+
+		clk_ahb: clk_ahb {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <200000000>;
+			clock-output-names = "clk_ahb";
+		};
+
+		clk_xin: clk_xin {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <200000000>;
+			clock-output-names = "clk_xin";
+		};
+
+		clk_mali: clk_mali {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <500000000>;
+			clock-output-names = "clk_mali";
+		};
+
+		clk_pclk: clk_pclk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <74250000>;
+			clock-output-names = "clk_pclk";
+		};
+
+		spi_clk: spi_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <25000000>;
+		};
+
+		apb_pclk: apb_pclk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <25000000>;
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		interrupt-parent = <&gic500>;
+		ranges;
+
+		gic500: interrupt-controller@80300000 {
+			compatible = "arm,gic-v3";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			#redistributor-regions = <1>;
+			reg = <0x00 0x80300000 0x00 0x10000>,
+				  <0x00 0x80380000 0x00 0x80000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+
+		};
+
+		uart0: serial@80520000 {
+			compatible = "xlnx,zynqmp-uart", "cdns,uart-r1p12";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x00 0x80520000 0x00 0x100>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &refclk>;
+			status = "disabled";
+		};
+
+		uart1: serial@805a0000 {
+			compatible = "xlnx,zynqmp-uart", "cdns,uart-r1p12";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x00 0x805A0000 0x00 0x100>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &refclk>;
+			status = "disabled";
+		};
+
+		uart2: serial@80620000 {
+			compatible = "xlnx,zynqmp-uart", "cdns,uart-r1p12";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x00 0x80620000 0x00 0x100>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &refclk>;
+			status = "disabled";
+		};
+
+		uart3: serial@80520800 {
+			compatible = "xlnx,zynqmp-uart", "cdns,uart-r1p12";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x00 0x80520800 0x00 0x100>;
+			clock-names = "uart_clk", "pclk";
+			clocks = <&refclk &refclk>;
+			status = "disabled";
+		};
+
+		/* GPIO Controller banks 0 - 7 */
+		gpio0: gpio-controller@80500000 {
+			compatible = "cdns,gpio-r1p02";
+			clocks = <&refclk>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x00 0x80500000 0x00  0x400>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio1: gpio-controller@80580000 {
+			compatible = "cdns,gpio-r1p02";
+			clocks = <&refclk>;
+			reg = <0x00 0x80580000 0x00  0x400>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio2: gpio-controller@80600000 {
+			compatible = "cdns,gpio-r1p02";
+			clocks = <&refclk>;
+			reg = <0x00 0x80600000 0x00  0x400>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio3: gpio-controller@80680000 {
+			compatible = "cdns,gpio-r1p02";
+			clocks = <&refclk>;
+			reg = <0x00 0x80680000 0x00  0x400>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio4: gpio-controller@80700000 {
+			compatible = "cdns,gpio-r1p02";
+			clocks = <&refclk>;
+			reg = <0x00 0x80700000 0x00  0x400>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio5: gpio-controller@80780000 {
+			compatible = "cdns,gpio-r1p02";
+			clocks = <&refclk>;
+			reg = <0x00 0x80780000 0x00  0x400>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio6: gpio-controller@80800000 {
+			compatible = "cdns,gpio-r1p02";
+			clocks = <&refclk>;
+			reg = <0x00 0x80800000 0x00  0x400>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio7: gpio-controller@80880000 {
+			compatible = "cdns,gpio-r1p02";
+			clocks = <&refclk>;
+			reg = <0x00 0x80880000 0x00  0x400>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		/* I3C Controller 0 - 16 */
+		i3c0: i3c@80500400 {
+			compatible = "cdns,i3c-master";
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			reg = <0x00 0x80500400 0x00 0x400>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c1: i3c@80500800 {
+			compatible = "cdns,i3c-master";
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			reg = <0x00 0x80500800 0x00 0x400>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c2: i3c@80580400 {
+			compatible = "cdns,i3c-master";
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			reg = <0x00 0x80580400 0x00 0x400>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c3: i3c@80580800 {
+			compatible = "cdns,i3c-master";
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			reg = <0x00 0x80580800 0x00 0x400>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c4: i3c@80600400 {
+			compatible = "cdns,i3c-master";
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			reg = <0x00 0x80600400 0x00 0x400>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c5: i3c@80600800 {
+			compatible = "cdns,i3c-master";
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			reg = <0x00 0x80600800 0x00 0x400>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c6: i3c@80680400 {
+			compatible = "cdns,i3c-master";
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			reg = <0x00 0x80680400 0x00 0x400>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c7: i3c@80680800 {
+			compatible = "cdns,i3c-master";
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			reg = <0x00 0x80680800 0x00 0x400>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c8: i3c@80700400 {
+			compatible = "cdns,i3c-master";
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			reg = <0x00 0x80700400 0x00 0x400>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c9: i3c@80700800 {
+			compatible = "cdns,i3c-master";
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			reg = <0x00 0x80700800 0x00 0x400>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c10: i3c@80780400 {
+			compatible = "cdns,i3c-master";
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			reg = <0x00 0x80780400 0x00 0x400>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c11: i3c@80780800 {
+			compatible = "cdns,i3c-master";
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			reg = <0x00 0x80780800 0x00 0x400>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c12: i3c@80800400 {
+			compatible = "cdns,i3c-master";
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			reg = <0x00 0x80800400 0x00 0x400>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c13: i3c@80800800 {
+			compatible = "cdns,i3c-master";
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			reg = <0x00 0x80800800 0x00 0x400>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c14: i3c@80880400 {
+			compatible = "cdns,i3c-master";
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			reg = <0x00 0x80880400 0x00 0x400>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c15: i3c@80880800 {
+			compatible = "cdns,i3c-master";
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			reg = <0x00 0x80880800 0x00 0x400>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i3c16: i3c@80620400 {
+			compatible = "cdns,i3c-master";
+			clocks = <&refclk &clk_xin>;
+			clock-names = "pclk", "sysclk";
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-scl-hz = <100000>;
+			i3c-scl-hz = <400000>;
+			reg = <0x00 0x80620400 0x00 0x400>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+	};
+};
diff --git a/arch/arm64/boot/dts/axiado/ax3000_evk.dts b/arch/arm64/boot/dts/axiado/ax3000_evk.dts
new file mode 100644
index 0000000000000000000000000000000000000000..0a183695e857a3a1e722ea6b7bee388bf650f0a3
--- /dev/null
+++ b/arch/arm64/boot/dts/axiado/ax3000_evk.dts
@@ -0,0 +1,72 @@
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
+	compatible = "axiado,ax3000_evk", "axiado,ax3000";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	chosen {
+		bootargs = "console=ttyPS3,115200 earlyprintk nr_cpus=4 earlycon";
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

-- 
2.25.1


