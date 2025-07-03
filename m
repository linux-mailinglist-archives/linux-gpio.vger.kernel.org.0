Return-Path: <linux-gpio+bounces-22755-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA21AAF7FD6
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 20:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42AA74A6A4E
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 18:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91DB72F5092;
	Thu,  3 Jul 2025 18:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="FHY88qvT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2135.outbound.protection.outlook.com [40.107.94.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D222F49EB;
	Thu,  3 Jul 2025 18:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751566877; cv=fail; b=jvqGXSavyThWf1HOpd3WzR1d99m7T6WXkxw2eC0QXzj8tJZKAY+QqYu9nGKcUbr27/gat+vmAcwzVf1+3MI/mVNEowwiqd8BZNJyTLWXft9rQ+oHC4xYvp9ntPyEQSEaKlm48yWS4nj+kAD/lvjpV994f5tplZfmhVTmPpPU3UQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751566877; c=relaxed/simple;
	bh=93pjMHJ56GGwn1Yks/A1mXhoirw1asDGShGan+RYvqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bVXoKH4QXnSEwa6jInr8CFTnQUPK6Bhvpaa/ximrinU01yWDKuaGfKMXOODe+eI60WGHIxM+zsP5jvSCwTv/WY18hOaPI116w8SwBEjU7o8LWA9EfndMEqvFdBn+Bj75ystqHpiodG12dkyPrRp8bMCdbOkhvbt7/yGtu0kObqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=FHY88qvT; arc=fail smtp.client-ip=40.107.94.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cCfIxGzhIQxMYKHxJCYQXdtGirxsBEtukbdrTAByegxGkQfG9KYhIlaD5006gBjcus7dVJry+Qe2ZnPjlslj01HOb9d/OY8iZQw0h+5ZTiCzzY5oIfhKqVFOpt5DCHz7rGmbmdIjcxZ7wPMGUPD95L8ca8plQRkCevBF81TlK+SJnqYTWNbOyl231NhpWMzNXdvPkyJiQOZzvyz1GEMWmJsIxcg/aGnljeA8+qIKwdrFS33vFT2Vesp+oQLVSKjs6t0yQVbFdxU5FSZSkHCHi1jbEOjWLl/VIqceVl5m4w/hYuchowh5vxz+KXbBDTItvSWSTbIZRcA+6UzfDHDTUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOdVFGv2UHJLAMS7EjHilvXuBmTnOheUxaIrDQ1qR94=;
 b=fadrxbX0SI0/kndzpLxMl34a1ogKDIXth8RAB0VCcyPAoOi0oja86Sj3w83pfhmr/KckfcTaDPgUph5n9CaAviRxBLn8iNferUz1AjXcY7gBsOsdYb6KvSFHW+7efuSwTmtDtMej+Sx2N2l1Hv9JOv4p91ss3ridiA9ui0o/Tn8R+o7aqHJXh8JuS37B4NXoqjCbrx6q2iO95u2yBx3Cu/1RKG4rVsKieeYPEbJrjPqizsKTzzLah1Hva8jSJ3BRsXQQzj+35q6o9OqUi2Udymk+EqFjZ0VXnf4LogOrBBcAkn48SiZ//2xieC2wJrPH7XONyPDmRxYoUp1/xu+NBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOdVFGv2UHJLAMS7EjHilvXuBmTnOheUxaIrDQ1qR94=;
 b=FHY88qvTWWjd3ItwgIqoONx+c6zg/10JzJ11l3OwDx1ZXnoJp854n6Nudig4xJL4EWNMzjmnukOUzqbu3bKZIpDjtzoh3m13cV9wR86Rt6gh53A8b0BFrBxwvk7ICbKXSEbc9NSmf4sGZ1doGIuA4Il130aRLX45j7lCdbiciHuL4nn2iuNbud5xOiKnbjw6V+W5ORvkjUGaaLDugDCaYW+6GgesjTmu6N0GOQW3w7yViGwy/qY9T4Q6ILSy/3RhGtJIGy9t6UKzIEUAAMHZlUyBfDu/L6YDtk3ITXCIW6XZltuJr8WT+Yn/WpKHFCHKW2cNW9dkMWRY/FXnpH3F+A==
Received: from BL1PR13CA0329.namprd13.prod.outlook.com (2603:10b6:208:2c1::34)
 by MN6PR18MB5415.namprd18.prod.outlook.com (2603:10b6:208:473::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 18:21:11 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::3) by BL1PR13CA0329.outlook.office365.com
 (2603:10b6:208:2c1::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.11 via Frontend Transport; Thu,
 3 Jul 2025 18:21:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 18:21:09 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Thu, 03 Jul 2025 11:20:50 -0700
Subject: [PATCH v6 08/10] arm64: dts: axiado: Add initial support for
 AX3000 SoC and eval board
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-8-cebd810e7e26@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=18317; i=hshah@axiado.com;
 h=from:subject:message-id; bh=93pjMHJ56GGwn1Yks/A1mXhoirw1asDGShGan+RYvqE=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZsoAXAEYkm8ajoIMczRcVbeB/iSLHvid9btB3
 bfAFbR3VPmJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGbKAAAKCRDxWHMRoTLV
 +3r6C/wKfdBKgCcpETXhnkeYa3CXSlg4doJNbK4AWpsNyfMrihIaapC69lRs4X+JxXeOJQfV4Fk
 ii5/kJo/Gz0oMzUfWibhG7fL/Dh/LW5VJerSovtSmSSAGIBtjRXH4ThWK/nWdkkC9xqxDAUu2x4
 VFFu2LQAxDhmObn9V6n1TRMqxJEQZqv5Oql5slFws3Lk3w1Ju4efNv2t/wWyY7sxr8irp2oy85C
 NkfSqiPx3CxTH6CQQmEiMRdEoQq+eFoJcVqu0GeyEHbCFBEbLcbcw7VbfMQUWsPC4AX0TbaKhsl
 AKqo6Y+GStlzs/Pdk6p3Gi8pbmQpcKK6CG1e3UcRDlV263PZsfJxdtZQV/l7oYFgXE0K6o2QD2H
 UJovXHhTQiIXE0B0ZrK8ZD4vSAze6y0t5ZFF7m5b7sCYaTpnh26s49LKLGV9s3CPfgDxAN9xCOh
 em8Tjm6H5/9htSUeOG+AKVD9DctO3IaeaOoChNP9brchEl/eM2y9BgALYNxctT13D3qo8=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|MN6PR18MB5415:EE_
X-MS-Office365-Filtering-Correlation-Id: baf4fcdb-27dc-4a64-aab9-08ddba5e6364
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjdzUlcraGx2Ry9NcjN3a1hQaDlVWGMyU3J5blE1T29BcDNJUWpVNFFLaUkx?=
 =?utf-8?B?OHJHTDBZRURSUW9RblBMZ1FYSEM5QjQ5M3hBOFlId0h5aVJlbytwV2xib3Vi?=
 =?utf-8?B?aWgzTyttUTBPMnpTTmcyZ05hSkk5cVIrRVowYmhkK25QekJPOUQ5NDcrSngx?=
 =?utf-8?B?MzBtOGNvY251QVQvMjlaTXhGUzRPUVBQWGVFNVNHMXd5amVNR3l3ODUzUHhn?=
 =?utf-8?B?bnFzZG5weXowbmlSN3ZUcllnbHlEMENpVW94YUxzZ1AraFoweTUzc2NOc1k2?=
 =?utf-8?B?VDU4M1Y2QWR4dVBIRG5wNytURVhuckc2d3l4Yk5LVWhRdDZ1Ym1xc0Z4WXh3?=
 =?utf-8?B?eFFDMVJrV0JGQUN1eW1pRURwZGlJb05qMFh0bk96QVdsOHVFYU1DaXZPSnQy?=
 =?utf-8?B?SWtzV2krSEQzRUxwZUp4YTV4Uy8zd1RwM3BFcUVLczg0T1dMSVFEMDlIUG5T?=
 =?utf-8?B?a3c5N0YwWklESjhJQ0lEdTdlZ1BJZ0NJS0lhakgyamROeW5VSllqYTdhazVx?=
 =?utf-8?B?YkhjY0cwWVRuRkU4Z1BUU0UzSUlTNlBOOGRDUE9Ob3VJVkZtdmFLOGluZTM1?=
 =?utf-8?B?TVhtZ1ZGSWc3eTU5N2RWUSs2UlZsV2hTc2lOWk8rRC8rR1REWWQraE90VGNE?=
 =?utf-8?B?emNrTnVnWGVCT21TSVh2QzlZbGNaU3MyMEtEUXlMMkVGTnZQRmQzNzgvem5R?=
 =?utf-8?B?ZXJFUWhQWDVQVUZ1a3J5b2llTHpuc1B2N0dIR1JZdkZRL082d2JvMUFDY2JK?=
 =?utf-8?B?Zkg3L0RpclNTRit5U3B3eURBUE1lRFBwa2E3cWFhRGt6Z3V0Z0N6QW0wWHUv?=
 =?utf-8?B?RUJkZm9WWkVkb1Fma3pZMmNPUGlOU09CWmYwMVhxTGRRZXFjcVBwbys2bW9V?=
 =?utf-8?B?RGhMUUNILzk0MEphYjdvbDRKUUx4R2RxUU5NNmtlSm1keitGWnAxV3FWMWlH?=
 =?utf-8?B?L3c0NnI4OXVaMU9iT1ZnSkRyYnE0Z2xtcHczVmVDNVZmYmxsd0s5OXBuQzcv?=
 =?utf-8?B?VEMrTWhmSXl2Yk03ZFZ0TjNrMkphR21HeWZ5ekNnaUxGT0dmU0h3a3VFQTdE?=
 =?utf-8?B?RGhiNURjWXh3SCtPaWdMeGZpRXV5aFh6S2pzVWpJNXlGclNlNElxZVo4WHpx?=
 =?utf-8?B?dWNPbHlTRXVubStXQmwyek1LTDA1cmIwZk1NUlhtQ3VBbGpCMXFtN1hOSHh3?=
 =?utf-8?B?dXcrL0tCcUtOOXFoS3pjbHhGb0N3TEtkQXFlaVRNUi9PWTJyd0t4bVd3b1hU?=
 =?utf-8?B?ZzZKTitoQ0cxL2I1VUpoRHh4Z05PanhkYi9RbnZoS2NLaE16bW5UVzVQTU9r?=
 =?utf-8?B?YTFrUk5xL1JHYVpxUExuZFFQVGo4WjJwSkVzd2hDWFhFMTNveHc1LzZmYkor?=
 =?utf-8?B?K0hlK09ZVXJiQ29ON2FyMGZZei9DT25LMFNJZmhsdnVwMjVhZk9YaDZPNTQv?=
 =?utf-8?B?MUJwdTMvZjd3QnVsblA5c25wVWRFY2pLSUtwdFFVTjZwQkRvZ2RXZy9kOFhs?=
 =?utf-8?B?N0x4RHIwOXhjMVc3dXUwTnZzS2FkSWxsT002b2hyUHVjcHpMVk9Vb25hT21K?=
 =?utf-8?B?ME01MjJ0M0NzaHdqSkpRRFdISVliT0hNUWE4RVQ5TjU5TVBSZFREalBLQnds?=
 =?utf-8?B?S1JEOTJsbW42SjNwaFFEMFltZ2lzMEJ5b1k3WEpuSWZZbHV4NU1BVjJzVWRv?=
 =?utf-8?B?cDY4WjltNWtuT2gyeHBCdE1sUEZWL3NWZE5UK2xPRnJOa01yWG1vSnR4VXdo?=
 =?utf-8?B?TDZZRjR3Nm1nNklGcjMxZ2NDajVQdk5UWWVMcmZzNEN4QjFaTmdJVGhKcFBJ?=
 =?utf-8?B?VTEzWGVuVGFQbHNIZmFKazNrbVpFbWEwOTVzUlZFYXo5cldFSTRQV3F2UXI5?=
 =?utf-8?B?OGMxa1REYVNWZnd2WU9lS3d6UmRKYlJxbEp1L3hMdVBIeGRGMmdBbmRMeUg1?=
 =?utf-8?B?VHlkbk92Ym1aWmVHb0JkYzYvYlFJTkluTHpoVzQyUzBIOEhXaTJ2UXUxNm9z?=
 =?utf-8?B?NE0zcFczY2JOVkxmYkhFcDU3ckFMOWF6VHY3Y2RYc3dEN0hRTGhyV0t3dTdD?=
 =?utf-8?B?VXdBbVBTVWV1RngyaUFxOThlaHV3V3BlS0Z1QT09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 18:21:09.4666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baf4fcdb-27dc-4a64-aab9-08ddba5e6364
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR18MB5415

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


