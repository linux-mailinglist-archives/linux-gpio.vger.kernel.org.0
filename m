Return-Path: <linux-gpio+bounces-22023-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB181AE4BD5
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 19:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9876A189D9CC
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 17:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179362BDC39;
	Mon, 23 Jun 2025 17:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="CX8VB0+T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2122.outbound.protection.outlook.com [40.107.223.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D39E2BD5A2;
	Mon, 23 Jun 2025 17:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750699724; cv=fail; b=F3wjdROtWiY8pvmyhh9ecGnpugYmVvtG0YQ/UpvQLfnsokO4b3r0yf1m+POvXGzb8+rZZ7C1XkVo8ZIMijvF8Ps5dnPQrjJFI+SAsE63S8hPbkRgbI3UxWWSMIeQuNqeEI/PA7RwfMcjqSV1RFL22YjMbZWctgLxYWm+9i4XxGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750699724; c=relaxed/simple;
	bh=xpgLUZHbK2I1ZlnpUROh2WV4kwNwhiPenZMjiabtsas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DJigF+Dc4XjZqHzQGB8nnNB9O1I+ieqME0MOIrIS7a5+FOFh64rKOe62v79QCLsWd9vAN7VCsk1oQga8c2E2JdoSVjXb1kWn2t8llAW1w9sOUt6NX6+Acqm4Rteqzb8PpNpg6R46tc7NfDUU98jr8y5xQb7VsDb9+mqeiOhkqZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=CX8VB0+T; arc=fail smtp.client-ip=40.107.223.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dl4gxNnR1jOkBDEJsLykNAt/p4XOEci2yslvQT9LStXFAn9/qs0dO1lfyuudpRUfXBZ+OMKyvuMU72qLATBwdnkK9yNVEmqDX6dFmpEr4UW9rnT0USYXzqHWy79pJh2WsdZW1J8bXW0G5eR5ExFXWeFmPcZeWiyd2JGYQQObUM7BjDmzzO3/dwCgh/0NeOsv6qBGr3aDLDTUYq7M9HrFO5se/K71ToBeYAS870Aev4S33zGtYxZ2VMsF4LUCValNRdZfTw4BS0cArSGY5e8onVV5grMxrQZrQ8gBpTuAuc4fweVBheHG4bhvr+/aE64ak9QHGr1t+aqCgynGM8af+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3KTQyXgFncskWxpzXED6v0z+Mnu1q1DqAAKLDIaw44=;
 b=FGvQ/YJPNC6+/TVbSzqt+1a+yHsOdrPaWAS3vk+QkhymheNDw1vxgmpreHgtlhY7Us/GQ6SeVztJNseg2DP2xIVunQKW1UG99BwmqBFamQSzWklOcqhx6GG7spZX7vHSF5tTt4/A6/LfY7zQJWpyZBju6X0RSuZWSXymQ+5C0vkLgf5lep1i1OcfHpHWGLY4a9BjSt10PVxAs3TLeEzaX6GW8spKAEY3nUPylRX9Jc28e8bR51U3oKvBRHE48i32ytibDvNJOVqENnjcgPmZd64VI1mGRCckx+AVhBfMOxSVLSoBkx8vK+K3C8utd4NohBXlK3DCBsp4djwlmo3L1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3KTQyXgFncskWxpzXED6v0z+Mnu1q1DqAAKLDIaw44=;
 b=CX8VB0+TL57ze3Fm6UYkVHFRQnjlBJKc9di0VNVGXJ6ACTNkKBPg4xgcy9fFQJkMQ4mHXvcQ3o9ewQ2li+KBVWz4U/HfKjhu0sYRMxWWteW4WXq1j5dVKQqZy6bmVTjQkol7n5pRhbzCq6ugKYhyeXW6aNeQCIdhIlHQXx3T5N0rBOpjUEPLBwGDdQlzWo5tO7DyfDCWkw7nfXGkz7/ZfCVSiAxkLG4wksLbtVoMkmUEE9z4+c1ATQL6g9ZMaztU5+EUTYa5wjvycE8pKGpce4U2+LOO2CRYfvHf26Yo3hNQU+QIhoDu+JrOnIa++YQXbpLUT0H8uKj2tdq58w1ORg==
Received: from BN9PR03CA0094.namprd03.prod.outlook.com (2603:10b6:408:fd::9)
 by PH3PPF8DC9EB40F.namprd18.prod.outlook.com (2603:10b6:518:1::cb1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 17:28:39 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:408:fd:cafe::fb) by BN9PR03CA0094.outlook.office365.com
 (2603:10b6:408:fd::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Mon,
 23 Jun 2025 17:28:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.0.1];
Received: from [127.0.0.1] (50.233.182.194) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Mon, 23 Jun 2025 17:28:37 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Mon, 23 Jun 2025 10:28:15 -0700
Subject: [PATCH v3 4/7] arm64: add Axiado SoC family
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-4-b3e66a7491f5@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=812; i=hshah@axiado.com;
 h=from:subject:message-id; bh=xpgLUZHbK2I1ZlnpUROh2WV4kwNwhiPenZMjiabtsas=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoWY66qz780i2/xVjAL2c0R8+hfv5ZUcC72G7YY
 jiCN4UeSnmJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaFmOugAKCRDxWHMRoTLV
 +/zwC/9n6g3pkAqhpeox3aVBvUBB3xATFH7ASF5+yRjBoFkeBMyHZ1FA/XDBVoPZ7XbwKzcgUtT
 ymfuufdhrrGmmHInmcTTIqaatIg3+D8cl2yGhQqpFf3U1hjA9QVMYf0EymN5XoeJhIcb4NJUS43
 3SZsk2tS7U6KcQebkik060iIQnsClEShzOh1u8ec1p/AK+QgApqQQqQ9tjYdGRcinT/6d2x+BnG
 +VntkaQMXjgGpKOEGsenV3m5aH4wFTttFkGzN2VEvhoN9XUrVOMsIZIWHLEtKDrL1WgL41nyp7D
 vgvZBWwUCwS3z+GN3TQz0Iby6wFMHOSqS9/z2xU7SSdCUyzdl+6/GWKhdgcc7XYSEVnYcmthotK
 jKg/qRsPRtCaFCnT4euQBiKdtcGFmpPhffrAXioQHHvqkk5VJWMKtx991gaZS4LP9g74aG6v1UI
 bHIaWPNQ7AvDm1K0TaZXrfhPa1qj9MBuuSdS+LvgksRSZ/lLjaqkAOZSBtiWwkUvgGCLU=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|PH3PPF8DC9EB40F:EE_
X-MS-Office365-Filtering-Correlation-Id: c34b7981-d0c2-400d-8b78-08ddb27b644a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHFwdGMybHhSVktYVUVlaVMvYUFqdjB1bDIzNUpxcFZBUkdJeU5CeE9pYjhH?=
 =?utf-8?B?OHlOOE1MSGlEbjBKOEFBOW44R1k2bHhZbWZFZzBhZk8rUWVhZXBXMWR4Z0NB?=
 =?utf-8?B?QmEySFg1ejFaa01jYzZKN281MFh6Ri9SZDZvMkpxVTFqNnczV2sxNzZYalRh?=
 =?utf-8?B?UEFVeXR3M0x1T0F1RW92TW94dE14aFNMQ09IS2ZTQUVnZnNPeVprbEpnN2pF?=
 =?utf-8?B?cHNteEgyNm4yNDdzTzdDcU0vUTFYY2dvTWVRTmVMeUxWZzVvNmRCT1JtZ3do?=
 =?utf-8?B?NCtjbURZQjQxSTNRUWUzOU9OUkRjY05RLzE3V3lrZWpLSmMwcWVGMVc5R3ox?=
 =?utf-8?B?UjRQR1RmVVhOWXdJSlVHcTgwSnFLWUlWTGphZ25WRUpDYzNSREkyNHh0SThi?=
 =?utf-8?B?bWxkdlB2dUtPWEpYNUoydDdCaEJ2S0gzN0w0N3JWeWdielBjUUp3QnFpeWQ4?=
 =?utf-8?B?Nzd3V29nS0oxaEdjMjhzY2lNd291VUwraW9MWEcxZFl0cUwwQWNob3BKZXZV?=
 =?utf-8?B?UUlna1pDOE9BYk54c2JrbzRYMWsvaW8rYy90akVGTHh0Q0tuNVFwUWxpeDhJ?=
 =?utf-8?B?ay9DRldwYVQ5cU1QazgwL2JsWWVjRGpSeXV2TTNKbW1RVkZZcUh0ME5mb0Iy?=
 =?utf-8?B?VE90MHQ3YzdPZkpBRW9oaVRPM3FJbm56RGdxblZycVYyQm8wZUgzL3U3SWZF?=
 =?utf-8?B?TzFkdlFjcFB0ZiswMkNJSXJoZk9aeGUxYnRtWTRSNWxHREl5TG9ETm15Mzdk?=
 =?utf-8?B?TDZ3WklBMjdySVdHeHJNd3FLeWViT3FGSFN1dlJmZmp4SXRiZTh6citBMVFS?=
 =?utf-8?B?WTJ0bVBiZWpyVFZNMHBZdGw1TlZzRnFaZDZ1bWs2RWJZa3NjTWVGQmNzRjdT?=
 =?utf-8?B?NEh3TUthdGFFbWdTSG9UcHdPblJ1ZUNuZWVxbHZhWW5OKzdTRUk1M3VDNnhn?=
 =?utf-8?B?OW11UHNkWWdlczZvS3M0UEhVc0ZvOEpVb3N6ZW9UOFJDWVJocTl3ZUtmSUM2?=
 =?utf-8?B?aEtLMVg2MkJDamczZXJIa2tGWUxnRENFT1dvS0x0K2FXakQxQ254TU5paDdk?=
 =?utf-8?B?Yldla2I5Zzc2b0pGTGp4eTUzeHRGalEvSUl6UHduaDM1TmZiQktNNTRhZ0RR?=
 =?utf-8?B?ZnpIWll6akJ5ZVFSdzgyUmpNUDBaeGVKNlZ1a2VrM0V3YkFKTE9ocVFONERX?=
 =?utf-8?B?K3M1S1FEcDB6ZG1kNnJkTi9MVWRPVWw2eDVNNEZPUlB5ZDlmVHYwOXN3Yllh?=
 =?utf-8?B?bTJCL0FvZnQ2NDhyYmN6V3VlNG5JSHhzS1k0K0tURmh1cERKNjMxb2l3Mmwr?=
 =?utf-8?B?RHZWazdMZFJBRmhYSmlDMkpDdTVoVE16NFhBQ2tvSmJOUEJ2VzNpRkVMOHo5?=
 =?utf-8?B?RnkraHdaSVdrWElqN25rdFZ0VThzWWpsNHRBdHNRc1BRdWw4bmQ2bkJJZXRp?=
 =?utf-8?B?L3hvWTFKeFFTMGIrb05DNzk4ZEhOYXJwVW9CTzFveE5IVWF2VDJiWVNoVGZx?=
 =?utf-8?B?SHVBYy9EZjd4bzNlVlBTdjFMSkQ3WURUVEVIOEoyUEtMQ3lOY2ozNStVRDVU?=
 =?utf-8?B?QTF2dXhUQzdIMWFlbytQYzgvR3NFUlZFTmZqT1FKeFpnTXhyTGtyWjlYRW9U?=
 =?utf-8?B?dXNQYi9zTWNCbVB3TFdwR3VCbDIvNi9MQUk5VXMvdVc2UGw5YXJ1WHE5N0tE?=
 =?utf-8?B?WFl3UEpXRG9DczR2UmJzbW4zRVdWREt6VlZocFRIVnZIenIzU2FKV0VsdElM?=
 =?utf-8?B?VkNrd3FFekJoZDVVak14VWpqQ1BqTDFzMHU4MFlPaytuTTIzOFhsRkUzSGFC?=
 =?utf-8?B?ejVOWlhkYWQzdHhxaHMwQXd1a1M0RTBaY3hUUTVaQVdPbzU3UEV6bDJZOWIw?=
 =?utf-8?B?QzNLMUtaR3Rqb0lURFZkV0VGSFVpVjlTSkVhbTNRem5FS2xtRk83YnJDMXhT?=
 =?utf-8?B?V1BJMDJMOWtvYjBIUkpORms0OTdwQU5sTnN4dEVza0ZqL0FRNlBnMThqOFNz?=
 =?utf-8?B?RWZNU3NlQ0I1Rm9OOWZrVEpLRGdPbHZjV20yK01RUE1GbGNneWdzMjNLeDJ3?=
 =?utf-8?Q?60BHIl?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 17:28:37.7860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c34b7981-d0c2-400d-8b78-08ddb27b644a
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF8DC9EB40F

This patch introduce ARCH_AXIADO to add the support of the Axiado
SoC for arm64 architecture.

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


