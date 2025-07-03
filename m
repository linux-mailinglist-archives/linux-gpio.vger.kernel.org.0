Return-Path: <linux-gpio+bounces-22679-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F74FAF66AF
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 02:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73FD74E5A63
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 00:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4050719CC3D;
	Thu,  3 Jul 2025 00:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="G6rFmVXP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2101.outbound.protection.outlook.com [40.107.93.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD24146D6A;
	Thu,  3 Jul 2025 00:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751502174; cv=fail; b=maN1tOqYDJxGJ7rdrzLKXKwjK697C+hZ28RU6J8ldNeLTgJoMW735P2zKPPomF5vooRQo3UWh7HBrNhpDnOnPay97446yKHaBfxz/xXrHvXf8KNk3Qty0uvqtIptSeW32dyR6VeuPLPwtT6SHrVWXQpnLytomCVPaU+GUNzRWbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751502174; c=relaxed/simple;
	bh=h7/reQekMZR33wAXmkF5fcG5ZASoES1o8MpTsQBpBy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iU20worIGccMQ8HEdM19e7PcDVM/kVUzFVMudoS04mUtg7GtbCd0hKshW/iHSjuOgmQ42SHtAgvdyn6V0lV3C7Qp4juuw3dwDY1SWdaQ2em+XngBumAWC0OA4kjtN4bwsEoDbtmFWZrBpqkOUpBnrcVduoi9jZhhhfW9SW+tjow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=G6rFmVXP; arc=fail smtp.client-ip=40.107.93.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYdSjjwprkZ527Z5FrC33G/Iqp7gC20JIKaUXrVAb6FobAHGIBi56BlsemOrbAa8p5Bp4/fQZqVs1w/rVJcAJ/Wl2DUKU9tHyhhXxPFWqWXQgozbK5GwBzBbwgJT6ZmJqQQ0BKHTYD7wPNiaw6/9xJ7iZHTQF1JII0LD5h6TM6ICC63xVoJaZ5whkAA/fs8sN8AoUpCgeN1RdcKeVMMlpXtx7ozofY86qZXzd2IkJHqQCZrzdBQo5+7gcy7YtoQHGO1x5v8HJywdVxkJe5FTAZMjlDSbFuivMQJT3KHrgtDmx3f2giIa5Tgv37M5wCRDkqBt++alE7BL+Z8eVUyiOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eGSMBpgEbEaJCnQ0epbgv38LSg+oygYq6YuZdlPPI4=;
 b=KJXCJNy7EV1BgPa/rCBuCusrYzUhtAlWg1KSdXV7FiaavObq/VyywN53WcD/4A9o+am4YOknz+5StiKYstgdgvESVE2XBDl2gixYBwc6jmbBFr72VnXWnAZafOxOor7fagQG/bWulWP2q6f1lK7KiudNv8aSWCuOYyzFyoKjyw3tph7RSwIMZApz0PqqciShNLfVgJsNzQ5Iqqpx2Bubc4jqjF60WD4xqtqSUIfF8O+CYfWecOmMce2gQqoAw4LFW/8urw99CErHElKAABxygyionjSzDQhJ6I5bntaPG/lUsRP4dhhSWS6MfcywPC5lYgAa5UsPVfH7WPZFtaoxWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eGSMBpgEbEaJCnQ0epbgv38LSg+oygYq6YuZdlPPI4=;
 b=G6rFmVXPbCoUh1072P9/h/ir3n+NkmOaGzhBldYERJPnjeH5UWIB5cbuAITYq3sapUQfOYJxDDfV3qPc58aeYXayOZN3Hg9RliLhQNZB3slkjfF2IW7um1eCuyIYpKp8Lf7dU46wjs6oQetAAqFpXr7hh9jGAUtMzU5mIM80tZZ8pyCiUf2RSvBss/jAXpH/51J7zRM2c02QYlMTGh4qa7DHZ6qS5T32QkI8SirLyxRvX/qa54287zWBalRrzFC+ETzvOd1UdvQCmTbWgvKIeLAlMrbql9R9m9PBcd2wLZmNUyydOb/ohGwCO4WDPd4PXGAix5hl9SR7/y5UPnddaw==
Received: from MW4PR03CA0110.namprd03.prod.outlook.com (2603:10b6:303:b7::25)
 by SJ0PR18MB4479.namprd18.prod.outlook.com (2603:10b6:a03:37f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 00:22:49 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:303:b7:cafe::ba) by MW4PR03CA0110.outlook.office365.com
 (2603:10b6:303:b7::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Thu,
 3 Jul 2025 00:22:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 00:22:48 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Wed, 02 Jul 2025 17:22:36 -0700
Subject: [PATCH v5 07/10] arm64: add Axiado SoC family
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-axiado-ax3000-soc-and-evaluation-board-support-v5-7-6ade160ea23b@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=858; i=hshah@axiado.com;
 h=from:subject:message-id; bh=h7/reQekMZR33wAXmkF5fcG5ZASoES1o8MpTsQBpBy0=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZc1TquJy8cdK8nkhzqp78E/RtQVR3lj7aFhlb
 Q8Dmrr7/8iJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGXNUwAKCRDxWHMRoTLV
 +wDzC/49eZlHXrDf3YsURjBg4nM4ESZjvaVrNxZDceFvzb2B0/7VjY7DpX7jrGPLEVIG1EHReNx
 YZTb79xRb6qdVaCv9H9pIEpXAxtZX+ZTzS5m1OxxatcIYCe1Md1PoYe98zrQZQuJWUjvOZEJmsN
 0H8i5msXyyHyB+oJ9WQUVp75bXSPyXv5OryZqvVEsxD6k992ylIiveRODGcZ6Nz+4n/SNAerv5u
 zu2saQqCKZgWe1kfThqNvIqVr1pM/x0+T4SF21RDsuBHHTMkd6QghQheknSnE96doJVSXOloVSJ
 eq9AjZhZFA7/ov7OBm8XEafSGAv8n0LEZ7b09cKVF0pCX6iNPMQmdONBve9o89AA7xcyUHGGh1b
 JGyZSKMOcPDM6Yl6fD+deW+AvwyQ2vrNWCUo6eh8KLPS+bwnkn9h2komz6NuFdZYn0vzLpxGQnq
 JIb88WgKMj1By2vxyDzrfxqfiznV3y3wr1XyRslNc3fHTity8CI0zdMN1RxAx3s6Ys0BQ=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|SJ0PR18MB4479:EE_
X-MS-Office365-Filtering-Correlation-Id: 4353c293-20e3-40ca-b6fc-08ddb9c7bdbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VXBKdXltTnRGUllLY1NQenBKZXh4WGlaTXMzZ0tkak1rc2tXVk40THNUWUo1?=
 =?utf-8?B?TzU1MjZpMzBKWWJGVmU0dkZ1K05Oc0JiNStxV04yZWpFWGxQVVNYTnUzVWRQ?=
 =?utf-8?B?bWN2Ty9LRWw3cCs3aTlXK2xHeUU5c1JvNjRaM0NTcXZZTHFHWnRucWltRHNZ?=
 =?utf-8?B?UWRmZlhCNVZiZit0QWRjV1dJQWpqOHozOFJicDd3UUVpSGFqNUFnbmpNN25h?=
 =?utf-8?B?QlJzc01OOGwyVUtxSjFPUml5TE9qaGpMcDhLNlZMdUV4YVRuYWJPVCt0M0ZO?=
 =?utf-8?B?RDJvNTkxVHdIT0ZJOGtOUkFrUlRhTCtKNWF0a0pPYlkwSldEaEhkdzU4allW?=
 =?utf-8?B?VlY4RVVNaHFYeGZBTS9VejQwTFNtQldYQ1k0dWkvYXRrMGtoSm5RSmIzbCti?=
 =?utf-8?B?NGFZSnpoZHpQOEd5WEdscDc5UVpyTzlJRDRsZmNzZWoyTys3WGg4SzZxRVk3?=
 =?utf-8?B?NTlCSG1jdTVTbDdOOFhRZjE2VEdqQ09PTjd2bE1KZE82NkViRzNZR1M0b2hS?=
 =?utf-8?B?WDd5RkQ5YkV3MmlvM1A1OVc3NFhTVk1EWTQyN0hxdUlxUlphTTZ3SnVKdXBZ?=
 =?utf-8?B?ZWVLMm5uQ0FvWVRlbENCbkNFZko1L3RVMDVxbGxQeVZRb3lOZEdwaUxweUhD?=
 =?utf-8?B?NERIWFJCck1sVmxPeVpPYmFLald4eThCN09Iam1vN0V1cnZoZ0tXb3ZnNjFM?=
 =?utf-8?B?UlpGWWlJWnY3blJ0YzFkOWFhcmRLbjFjb0VDcnVrOGdvNURobjFOamg3Q04y?=
 =?utf-8?B?L2ZlSXRxVDc2UnFiZWZpcWpidUVpSWZGbHdqZ0dwNGZtRzNWWmplU3lCaU53?=
 =?utf-8?B?b1cwQWswdkxWeVZrQ3R6clZjQkNvWGc1c01WMU00WmIyTWpIbGdSaTUzcXVl?=
 =?utf-8?B?YmtkVXVDY1YweGZaWXlIZ04vWURhRzkwK0ZrMzNNSjNJL3BNdlEzTE5Ia1Ux?=
 =?utf-8?B?MWRCTE80Znp4VXNOck02Vkg2SGJUTTM1aFNWSmZKOTB3citVMHBVakZnWVBt?=
 =?utf-8?B?Q2xRR1BoOGU1Szg4MVhHc3JpdVFmeVlLcklmSjRzT1czaFU3aFBzQUYyTzY5?=
 =?utf-8?B?V3pFWXlRbmdXcWV2VEFIdHNjRlVOREROTnFJMHBiWEdRK2FmNjRyZG5FZ1NC?=
 =?utf-8?B?bWFZbUxMNkw5ckFucFdLZUJnUzdKS1NOT1pRZEZ0MjJ3cXdkcytoMXE4MXFh?=
 =?utf-8?B?MTM2U0hiUTcrVXlrQmJBTzNTWkRQWC9wdi9vRC9vdldQVWFnK2J2Mkw1dmg1?=
 =?utf-8?B?dyt5dDUzYk5valVzb3RuYW1sUTQrb2Z5V0ozNlRuMkFvbzlFL3dwMkRhVEFq?=
 =?utf-8?B?WXM0Y1VXRHQyK21SMFA5UVo2OGMxU05aTkIzb2ZzTXNnUmxIeW9Zb2owWnNM?=
 =?utf-8?B?QTFLd3R2YTdrUjBWM1BTQW96bEtkeXJnYjRTWndpcDVqMzcvYjhrL3FHakdu?=
 =?utf-8?B?NldpMTExMXFNWkZzQnhmRXVhUmpoUWVENjhoY0ZkTmlaY3JNMEM1QjlVUkVw?=
 =?utf-8?B?Q2R1QVQwbnVqa1FidUJMcExGTzcxOU4xb1pmWUl0ZFhrMnpvaHhXZXlpZDdM?=
 =?utf-8?B?RVFhVVJWek9LVzRaVE5jK2d3cmlESEpNa3pCMFpCcjV5RUU1V1N0ME9FQWJX?=
 =?utf-8?B?UFBvMDc2NGpsbG9hd3lwY1Bqa1pQOUJ4cm5oS1hLTGE2Ymh4Uy9oVDNFNE1t?=
 =?utf-8?B?cmNHOGdYRW1aMTlZUGNaM0k4VjRXSzNoTSs0N1Rucysrcjh5S2JpY3JVRG5z?=
 =?utf-8?B?dWZPWGpuMXVPbk9rREdQaUQxUzdVbk5oNEx4MkNGOXNRYnlqSnFBUXcza1lI?=
 =?utf-8?B?MXJ2aUxKeCtwcWZuSklTa0d3YUZBVGdnbU5iMHEwdFE2VHNIZ1h1a1FaTSti?=
 =?utf-8?B?RHA3dFFEQmFUMkFJQVRCTEsvVXJZODAvRXczanRhUkJxMjFSb0s4SjhCNlRo?=
 =?utf-8?B?SmNrRE41Z3RleFFKTm9uSnFLbGp2a283eitQdDMzMENUemx3K2NKREVSMUpo?=
 =?utf-8?B?TnJmMHJhbk1scVBxeFVLT2JYWThTSzRqN3h0WUdrUlhhRlc2dVVsNjlVd1Mw?=
 =?utf-8?B?ZTFTNXdaMWpYT3lsRmdnYWRzOE1JaUFLZ1RjZz09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 00:22:48.8371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4353c293-20e3-40ca-b6fc-08ddb9c7bdbb
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR18MB4479

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


