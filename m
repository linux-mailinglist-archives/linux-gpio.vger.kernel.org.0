Return-Path: <linux-gpio+bounces-21620-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA985ADA735
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 06:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6E223A5394
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 04:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4731E1E12;
	Mon, 16 Jun 2025 04:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="PFS8YGC5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2115.outbound.protection.outlook.com [40.107.243.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC391DDA32;
	Mon, 16 Jun 2025 04:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750048320; cv=fail; b=Fep7ptB6EndS9XTS1/VbXDy4bSrnNdDc1UkQ6kK57nSMW1LVfqsVq9MzZCTntYfEBjO7HAuK8k4jdPdIJQajvlZS9/uHRXadZ796ZA32/eKT+S/ctMb2dgwWKX6evySRKVesukUOeqTDfGe5ijPQBQhsnKqH9hL1oiyuWOQpQuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750048320; c=relaxed/simple;
	bh=ax5WVHwMn9h9/QI+fZ1jJWwNN4R6eLWVvY8XrQOgkgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kkDEeylASW4lOdhkUWfU1+oLae6PMvJZ6SJZ6YlQVQ7RDWgn/j1RkiC2FQshcXuA6RT0njIjT1cAZKb6ffZwC6yaTP6fIJP7pnjnN3KqVzKELfO8LnhQ6JN2EptEepcP2Y3aJmOArg0gSowt9zDkIo9nPs+o6AmHMu9TvwR+/YU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=PFS8YGC5; arc=fail smtp.client-ip=40.107.243.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KeMYCrRTcZEcHBfKn3PHgFQhKhjCkmNUidtvo+hh5i3NTX8Yu8MUL7XATCXI7msJNlZ0vuTPFuGjFrZyitb7cxYkAKz3L/yH+QfLsgGGYk8XAHyhnSddherNVAxgOhR1Gj6Vu2ONbH3gbv2wS8VkXwh88jupfCzf8qoivfMEWeqWVdEJMNcEe/w/n/95eT4W4jZ99Q6UJpj2lkz1QU/mvUtGHhsET2/54O8PWmq03bsjJKUJVEvsjg4IB3BPFYo4T5aPJhTpehdxKHYOOw4ZndZ7rX/lgN1cSi8sYNn7gdnDv8LBNg6PBfOFFKLd23kT2INUJYJflpDgP2jhQAuofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTytpIyACWpdVOC1FrmEAlCiu3DOhyaJw9sL+z8P8t8=;
 b=hs6e6ST55T1GJrP/w9NChKxIlNRmCnRg3Gt5tcV5j5BNnPsXJ6SliK91dgRoch1H+VBKqjvr2XCi2VwJxDPz9+nHcCSCQmpGtEvGwCj1y9bnlC5uqF6MU9mru0EMlUmgM/bT1z3YSOL5ok6Obx82Dmr7HXtjhmxydjiRscrSEkvnO/AtblgC/yaPGlmXUDk6AO5n/3MoYMtDk6KU1tMtdTAXEQT12pX8QycBhhaK+NfVcG07jYKv42C0oUAzLrdjZZsT7i/6tj1X5kvaTszVeWgg9dqIRC/FH+I4dDUoDgnCP9wB8hArba2BvzbwI1G8M9GDAArfEsnJH1otVtIdZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTytpIyACWpdVOC1FrmEAlCiu3DOhyaJw9sL+z8P8t8=;
 b=PFS8YGC5XzmdKT0PRCYaKEXiQsVSt/l0ZFtp3IgSCy1LXIwXXfM0y0RIUBAT2Ueb7XePqsRAoWZPwVy6M3681XrpyJUIaM/xUBQ8Gmk8KNjWuTz4Dy3lNFmbfAZubnhgxomnIeTfCzv1ER8i76dcfjbL/9iLXZdcinZVYU5TgenkLIrOkUq3Z7HsRD7vXB+np+PDcM/R3kQsLJUtHaEQ55eLN/s+H/8GYiJBjEU/c2XtsxpRSS95Tf/Bk2XNg4jsx1lTlT0U88PumTBBkU7MGsj8cvxCjwpTcbbuTPFF2mre51qo1xGSa/wqLWQfVJi1yMomQ+KIifv08rLnp2L67A==
Received: from MW4PR03CA0066.namprd03.prod.outlook.com (2603:10b6:303:b6::11)
 by MN6PR18MB5496.namprd18.prod.outlook.com (2603:10b6:208:478::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Mon, 16 Jun
 2025 04:31:51 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:303:b6:cafe::2a) by MW4PR03CA0066.outlook.office365.com
 (2603:10b6:303:b6::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Mon,
 16 Jun 2025 04:31:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.0.1];
Received: from [127.0.0.1] (50.233.182.194) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 16 Jun 2025 04:31:50 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Sun, 15 Jun 2025 21:31:37 -0700
Subject: [PATCH v2 4/6] arm64: dts: axiado: Add initial support for AX3000
 SoC and eval board
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-4-341502d38618@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=19004; i=hshah@axiado.com;
 h=from:subject:message-id; bh=ax5WVHwMn9h9/QI+fZ1jJWwNN4R6eLWVvY8XrQOgkgA=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoT54x0YOVCDFMIk1DbfKtWsPv3p5zPYQe3jlwf
 JvNEHE+4/CJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaE+eMQAKCRDxWHMRoTLV
 ++cPC/9Qe5d/AncUBJQCvBhgy+rR0/+zkmwG/5GgjSYoBBtFXundtfA7tLEoBei2H6A17N65vN+
 uuYShhPN5I+/osDXZ83uZlsmDPCQzWFakOY32oNnDAnYmRIiWnLHN58K+G+P8dV4B/n4kg9Di+/
 9Ridy2OBw0OPxfV6gZNPf1cKcj/7h4FbFO3VCSTSLDvuZ+g5PyWuHFfo3yTqHN3qopYaN+ARVcc
 TrErpahKc7mWjSC+595uvHsuZm/Ww6JZ39mUcOeZg3qKisCAIQWoVepYQxmQCKL28wmlISm30ox
 YSadpozz5PXZlHuyEEGlcFTVQFPAV9Vi17emQOkj4jyvkPx/TMPR1g8OPlj5A87qmkZaxbyrAEg
 AxYGyv+1e7l1Z3kGbO1SQGZud3nGHWIrO/pM5LHw0M8TgZYLdKsUCy3G4i74AlEB0IcMpFgaGf5
 tTlUSSo79VcuB0W/BOPBmlDlFsXTkwC89Ltb746eobCtHdRkV6ddaPIRePnEoKCexzNhs=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|MN6PR18MB5496:EE_
X-MS-Office365-Filtering-Correlation-Id: 036c1a91-3c3a-42c0-a670-08ddac8eb696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dU1oS0ZmcTBReWx4cnNpZllUdzROOVRRMWpkT2R2S2RsSU42Uk5iald3Tjlm?=
 =?utf-8?B?VTBTWXVUQmQrOU1mNUNVVmtvNDhGMExqWmxlYVJNZnJjVitJUmJYUzRSd0Fh?=
 =?utf-8?B?Wm9jajkrTmVEcGRWUStoTndUNXkyY0NsemkzN1liZEQ0bTlvUUhiMDJTSEtF?=
 =?utf-8?B?NWkvZVg5c1Eyc0ZpWHB0K3BLd0ZabTl2U2JwTmtuTUdTNE1PaldxaGtBV0ND?=
 =?utf-8?B?WGN5Zm5wUTNHNGVsWGlqL3Q3aUwwNGlVeSs0cWhXblc4M2RnUk8xTlhyV2VQ?=
 =?utf-8?B?NFZhcjlVc3ZMUWdoalpxVXNUVlhjdGJSNE5GTHkwY1N1WFBmZ3BrMkxoRWc5?=
 =?utf-8?B?VVdyb1JMM1puZlRXa0dZRXpUOHV6TEV1VTUvMVNpY0MyUzM1ME9xVzR1aDly?=
 =?utf-8?B?bnN1ZDNNSXBPRG1NNHNHWG1PLytWTnEvbVNtWHBLaWFpRldtVTIxQjBDRUI3?=
 =?utf-8?B?Ym9kOFFMV0ZBMFh6ZXpnUm1QRjJqVnA1cFo2ckUyR3d2bGRCVmsxci92bXBD?=
 =?utf-8?B?S2ZPY1hIMGtiRjJHUkF1WjIwSHpYOVBYSnJVRC9LZnpxSzdyMFMrTmNYYmxQ?=
 =?utf-8?B?WkRXTDhyTWo3YWszZFdPUm9rR29mTm14OTNnREZNa01FT0hPVnNRU1dPcEYv?=
 =?utf-8?B?M1UzQ3RnSisyendXNVVFQUl2SmQ0V1BrRUQxQzV3eUliT1NuRFhRY3EwV0Y0?=
 =?utf-8?B?TVRYMlJKT2p2ZGh2M1RhNE1Scmc4L2ZHbHpKL2hJWUtMaUdJUlpJejljUmR3?=
 =?utf-8?B?RGRoSGd5OHBoT1lLNitBK2Y2Z0ttYzEwd1ZERU5PcnhPbkNzZVN0MUIrZjQx?=
 =?utf-8?B?V0lsN3BrYkxtT1J5WFpOWFc2U08zQS9rWmtJUVdId2R5K2ZYV1NRbnRSSVpp?=
 =?utf-8?B?cnV1TzZESVRpUFFzUEM2Q1ZxbWN5VHRvVmc2ZjVLL2JnbTUxRFNhUjdnQVNY?=
 =?utf-8?B?NnJhNXZ3Q2tKcjJuRGN3cU8xMWRTOXY4UU93ZGhsSEdONG5hMTNuams3d3Rk?=
 =?utf-8?B?NXNRTXpkSzFPTVQ3czRReWFaQUp6MFNNaCtDd0ZrT2VjelBjVkRwSVpRMk5M?=
 =?utf-8?B?VnJLZGhFMW1aMzZOcGYyZzVqVCswa2luaDIxTFlGUWEzVjhPVWljNU5mVjdx?=
 =?utf-8?B?WjdzMjBCVmtXNDkrU2x0ZlpFS1M3dG1QWGxmZXlSL1NJYUE5K21GcG1vZGNo?=
 =?utf-8?B?WmZxUGFjTWZYNkFta0pCZjYwanNodlhsS29wQy9lZXNkeGl4b0dEcE5IY1c5?=
 =?utf-8?B?N3dNWGJXVWlpK3lPMFF5N2kwMzVOa1Foc3U2V1lYc1E1Q0lvY1l4Q0FnUUI0?=
 =?utf-8?B?cVU5ZE5DUSttM0lKQjZjUWdOZktXQU5YYkhYaHV5TzFjSjJ4QnBiTVJyWE5w?=
 =?utf-8?B?QzYxUHpEZWFEZG5xdjJwUCs1VE5wOVMyM05CdUxhd1Y4TEFqV1l2a0VVY3VI?=
 =?utf-8?B?SUJ2cWFjaGFqOVJ4TGpiVzMrRW5FWjgwZG1QT3AxWnhHL1BMZmYyTzFzQW5O?=
 =?utf-8?B?MFh5aUtJR1NpUjNkOXFmdjcxU0hES0haOS9vclNkSE9oNlUzSllLSDJpTEFo?=
 =?utf-8?B?bGluRUZkVFRLT29GLzJwM1U0UGhITVJhZ0VibU5PcE9sRXpoUVJXc3p1U205?=
 =?utf-8?B?d0doV1dFbTlycks2WjZEUFhoZm1uaU1XQ1BJMSt6N1Z1MTBwUncycDZlRU1h?=
 =?utf-8?B?b0U5akc5QW9BdE1qUG5jRk05bGYzVVgvZUhZcnVieXR6dlpkSndKTXE3a1Vy?=
 =?utf-8?B?T0FWbEtaVjdzMS9VdFdVVC9CSFV2bjVjdERuL0xjVjJBL0pRQjJqOE00RU95?=
 =?utf-8?B?USswWUxOR2Y3VXVwNFUvdmVJNGtZYUc1S2lYQldaSStQY2RZak96czEva0hs?=
 =?utf-8?B?Ky9IR2VLQ3RxS05kVS9aMzZCUmhOYkJoOVFlcDJhRklYek90bWhqU3p4ei93?=
 =?utf-8?B?SFhnaitpcXdHbVVQK3lXeTUwS0xvbjA4RWFZNEFnNm5HTmxSY3gwQnNNb3px?=
 =?utf-8?B?TkdpaWdmR2twZjU3THlvdituTEVkU0k5cDRpQUgrYmUrWnkvYkJXb1MzTnRJ?=
 =?utf-8?Q?0sbngF?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 04:31:50.4525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 036c1a91-3c3a-42c0-a670-08ddac8eb696
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR18MB5496

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


