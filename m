Return-Path: <linux-gpio+bounces-23653-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6658EB0E4C4
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 22:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 699A06C02AC
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 20:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C829D2877DD;
	Tue, 22 Jul 2025 20:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="sCB67BbT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2133.outbound.protection.outlook.com [40.107.220.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6836D286D62;
	Tue, 22 Jul 2025 20:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753215382; cv=fail; b=Z0+Oa9B8daHkz2krXxX0lJEfkBjkrYRU9O/2xCLd7CFWTH2Sy5UjvldgIWPQzd+RvuZLRRDq1A1ZUC1sbOT0OKBaO8Jjm5J5QAns7KfghkQrx2Z+WSa+ScQqd+CiFziPfVajzdV+8ZitP8316KD/Zn2gCzpaN3O+0pAyAxO4syI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753215382; c=relaxed/simple;
	bh=93pjMHJ56GGwn1Yks/A1mXhoirw1asDGShGan+RYvqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YhrSWKZcs2cHsIHf0bGnR/6pt3OGcK6KggUABkzJnuaZjMcaCTlM7Z00QtArz0ipsZgoiMQAs5sVILmfVL721jDhzuiE/QuYvBz5zBsViPGlDlyRvJt16WoQBHkhhMFCjuL3HMhB678MMPYc8wgKylWI1gwfRFfOBPMxyaPZ8rI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=sCB67BbT; arc=fail smtp.client-ip=40.107.220.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vo1zC4PpMMEptnoEVeRSKUI7+nUWmCDTgct5q8+SjFoU670C9I9EsQEFm37r1QxyhWCjeAce9qqGCVKMAP4CyFplXpf/5jRBvRkIZS3JTQyPQb7Ae8O/CRXTw+I4yePNIsftTQy7+xnAKUXwB8+u9rv8qTRVjoKJSaXIGgkaA3gZBum0wJKcaC5Xx/GqDmem/cG3lEB5ZMtqxZHclhaJgSWZ9YhU9zQmpdYVtVJ0hHs4eFI2ABxInYMQYia+nojuv4xG51K8jBRmpq3Q8Yi/X7BCPs/WXkS9TSHyRP+KUwNoDudAS0pwAIXLcGiJsohacjLEIiVU4SPDatBDFMMdgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOdVFGv2UHJLAMS7EjHilvXuBmTnOheUxaIrDQ1qR94=;
 b=QX2Qio3m3uk/e7EHET7ViJzQg/DjMBJ2XZW02Jpj3fyrC4uKktf7Ik2l8AxGhwD2Wz6s9lAHKwO7PUEgH0y/H6+OPWPXTninC2RB+yrGq1QSFSOx36cjZI9NcW3JIwIhf0u6ruhWf2jOUJsgyMSG/uHPNPkZr8hiIa20bHtS4MmyAmDOZkfpCwS3AG7tZGnumKWa9HMTqESwmC4xKIYERvNekCG6v9Ht0OmvHgNQdC9sMlT6/UPCCg9bhNpgv/aHefr71WJeD0fVPVblVJLzakvscnzm8Plem6JGvXo4xHeLEbnCJpkb+FAYJcfyno/npm42wEBt1ErCcoPwRS6qQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=arndb.de smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOdVFGv2UHJLAMS7EjHilvXuBmTnOheUxaIrDQ1qR94=;
 b=sCB67BbTxztOwMOrVvefCDQAyVJHLbsqohGIduZDqMIaPKebJYYF8JnnRX4iqG9AaDVm9GNg6AG6GKCspME+wsqx7jnQLXEDDNHUgLE9cQdqr7QJL8LxoERptXQvGgtrss+uURltsxa2e+yi2VyC6BiFwP2r+BDs8tK5I60DQlXZ1sP/kAp8b60v6lLoChB6NvviD3uVKuDl74ldxJXb3lozAnIdKDJLqmf+UhyQ+w8f1kA7olrkfTSsv9yk/wmD90KO+48navzazuMeIj0rACBv87gRSEQPxk3I7rcuBGCHNcAfRHnXIfMDWifghlWMfQ4iZ/P06W4VjS3Moif0eA==
Received: from CH0PR03CA0018.namprd03.prod.outlook.com (2603:10b6:610:b0::23)
 by DM8PR18MB4488.namprd18.prod.outlook.com (2603:10b6:8:36::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 20:16:17 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:610:b0:cafe::7c) by CH0PR03CA0018.outlook.office365.com
 (2603:10b6:610:b0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 20:16:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Tue, 22 Jul 2025 20:16:16 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Tue, 22 Jul 2025 13:15:36 -0700
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
Message-Id: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-8-543979a60ccf@axiado.com>
References: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
In-Reply-To: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 soc@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Jan Kotas <jank@cadence.com>, linux-serial@vger.kernel.org, 
 linux-i3c@lists.infradead.org, Harshit Shah <hshah@axiado.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=18317; i=hshah@axiado.com;
 h=from:subject:message-id; bh=93pjMHJ56GGwn1Yks/A1mXhoirw1asDGShGan+RYvqE=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBof/GEOWtIRjgfPDJ0opk6LZDZ1A/7QRc/7OKW7
 9JGAo3U3g6JAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaH/xhAAKCRDxWHMRoTLV
 +32tC/47uV4v8ukD1tUXrGVS3f25ER8Cfbn3kvx6GHqDm1ZleXAVo9vCpdj3YyL6CnRs0QuBKXx
 5fEUftlfH7Ej9Wf/ySkvtr35+3HSxPMMQEyPtxO9n6qf25VXvQagnUlvPkuEgvSyxXMVv5nqX9L
 mr6kBaD/35LD5G6R2R959D7RChfBC2ullylGq5tkENxugYyeW5R6oG/L68Bn1POBfOj08hLHzVX
 UhtB9l3SmOIbuKjuiy6VLS2P3oJHNSM3+xRWRV/I9Cpi1xZoJxy7yPBf15agJEUy9BSQ8+fJdNH
 ySm52ObCqSHGyuoE2BasIa7VFqt76s7HJMrHQzE/Z7K2Vq1cm0UbfdTnY6J9c5m69yujeZBUtqU
 B8+UgzpPqDKCzXc1iR0CcLGHPyJzM1Lg+ooOE4gsKN9PFV9FpeBtQHaqjkhwjSDyG/kjR74ffK0
 f6oPfSWVfYSaTgScj+gL/k0zuxGbsJX4oYpEbuBpjkiXV4P8FdbZP4AetpVH3jW6YyLO8=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|DM8PR18MB4488:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f3c433e-f4f1-4de7-cd68-08ddc95c9d60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|82310400026|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXpOUjhDUENRbHBKZHBZblBnVXJ0ZWxvcmMzTUtTQ0FTb1NwazBDa1p2MkNU?=
 =?utf-8?B?UHVkYlU1TURkdnJFSURnaDZIeEU5S01NMUdoeVdTK0V0YUx2R25qNytDaC95?=
 =?utf-8?B?a0FzWU5JM0UxSzBUSzI1dFBhUVZQWlJQUzhSM3NXMHlvTkE1cXJxK0NoVUMr?=
 =?utf-8?B?VWNHZHhPWG9OMWFDOFN2ampMc2haeElSdEZYYktWZ3Z0Zjl4MmRqTS9GNlNa?=
 =?utf-8?B?TnhnWi9uK1hXNmh0YnpBQ3RESFRRVk9CellZMk9WdHZLTG1rc3YrbE1wT1cy?=
 =?utf-8?B?ZHVGOEhlc01UdVlnOS9pNS8wc2lMYXVxM1NQeHJlZDl1NjZhZWd6MjZSU2gr?=
 =?utf-8?B?b2k2WXN6bzkydjdXWVY0TWdaRjZqZHh1NzV3cXJVRzJPSkg2Sk44SEI2ekFz?=
 =?utf-8?B?Z0VZa2VnZTUvdjE5WnJ2WEREMVhMTGFEOExhZ20xMUgxT1N5NGttU1ZJNmRv?=
 =?utf-8?B?ZExPTmZWeTI3N0tNWWFYTmRwYkIyekpwQ1dDSzJTY0tReXhnRCtGT08wTTJy?=
 =?utf-8?B?RVlWV2ZWSUNLU2NLdGJYREY5L1RHdHpOWkduMmY5dVBtTWhMUnN6Qys1bUl4?=
 =?utf-8?B?NUVaS1pOcUhzQkdzVG15TWljbmFYYTN3ZE9YMVNqR2pDZDV4U3BET0l3OUFK?=
 =?utf-8?B?QXZhTnNBSGRxYmQxZHlLSWxxQnpOblJtcUowUzRYTjNwZ3JQV1FNWXh1K1Jp?=
 =?utf-8?B?bjRZSk9aa3hGbGRPb0g0QzBUcTFMT3JuOURYaHVESUV6Nlg5K2ZETVczejJY?=
 =?utf-8?B?Y0NhYkVGbTI0cjZtKzdVY3RVZVF0bG5uZjNNVWNKalJYd2o1U1R5b2JmUkZ3?=
 =?utf-8?B?STZMY0hDdlFpS2x6U1RJNUE4SmRLRHVPOGZqaFRKQTArZytuNHlLRXpYcnRq?=
 =?utf-8?B?WTdyUVNyS1haMkRnV2E4TG1sM0pGOW05QTV1dy9IQ2E2TCtkNmUvTWE0SUIy?=
 =?utf-8?B?bWRpRTE0Um1LRmJQR0lCaTdUeXRIVEJkSTI0ZmxSdENDZ2NzcE9WOGV0akp0?=
 =?utf-8?B?YjQwMUpaRWJFVWhSSUF6RWx3R0VUOUFxR1NwbHJJeGlQOEFjclh3OFRyZThB?=
 =?utf-8?B?amI0VGlpM2lGaU91ZWo4bGxWT0hOQkRjTU5tWTU4MXNuN01hNWlXNmkvS21S?=
 =?utf-8?B?N0d2NlZOc2FjU2dqTEEvRU1WZ2MxT3lEM0VldzVJQXByNjJjZFJvTmhUVFZT?=
 =?utf-8?B?anhOY2s0dmhaQzVlVXNUcXlHMnJpclJxR00rR0FyRjQ3V1pmN09Wc0RGK0pv?=
 =?utf-8?B?eTczUGhKcVJSRmk1cklFdlh3ZDExVitFZmZFS1VhSXRPdTJpMGdIakJ4M2lK?=
 =?utf-8?B?b01Ba2QrTkFzSGdvVFpadzJlTStudnU0dUVmcjhiZWFGckp1clhPc0YrNC9H?=
 =?utf-8?B?MUEwaWJqanRKeWJiSTgxdFhESm9JYm9PNWppZmxsaFpxQUprWGEvMFpVeVk3?=
 =?utf-8?B?cU5IdmIxWGRkWXhDTzhIbG5hVVZ1Q2EzcTZmNFE0TFRwTk9HRVNrSWUweWht?=
 =?utf-8?B?ekRyNnN4YktlTHpIMHNCZlkyWmNsOTIxUjllbkhrL0V5N2ZoTXRpSHpkVEF2?=
 =?utf-8?B?eVlEbm40Ujd2bFM1bWFPSThydS9DUzZ0RCtFOEljNXZObHNlbWpmMVl1cmdx?=
 =?utf-8?B?UlN4cXRqeXZVY0hLc0RpVE1LcVk0L25VT3pWelE5RmhLRDJTalRFUG9zYUtW?=
 =?utf-8?B?NUF2VjRvd0FUMktmQVJ0Tm1GWEQ0T1RjUzdhd1hpT1hHbG5MMmh1STZhMjUx?=
 =?utf-8?B?UGZUQ1pKQWRVQXQwUWFpWlZ6aVN5NWFabEpEd3hmWGc3MmlUMUNrMUhDY2Qy?=
 =?utf-8?B?cHpkWThjWmorYTV0bWtDQjRRaCtiSDNrQjlRQWpSN0c5TEs3VE9YOE1PSjlu?=
 =?utf-8?B?VVYweUwxS0svSmljdUpRQ1NpcUhrUGlOd2FSeTE3L0gvaTZVTUtXaUVsWk40?=
 =?utf-8?B?WkgrZWoxUFF0dTNEZ2FKRkhhc1l5dUd2Q1FDYUNIaHJtcXJZcC9BU05nQ3Vn?=
 =?utf-8?B?UEFjWjJUTk1xTlZnMlFjeWtCYW5mYTQzRW94NE0rN1oxOEUvdkhYYjZOUDZl?=
 =?utf-8?B?NCs2UzdhaEFnWHdPaVN6K1Q3VnY4cGVvY0NxQT09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(82310400026)(376014)(1800799024)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 20:16:16.3389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f3c433e-f4f1-4de7-cd68-08ddc95c9d60
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR18MB4488

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


