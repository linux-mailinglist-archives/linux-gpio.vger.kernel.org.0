Return-Path: <linux-gpio+bounces-21602-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 640AFADA07F
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Jun 2025 03:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9E1E3B6717
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Jun 2025 01:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4775D139CE3;
	Sun, 15 Jun 2025 01:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="EMyPhRXG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2136.outbound.protection.outlook.com [40.107.101.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B12D58210;
	Sun, 15 Jun 2025 01:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749950006; cv=fail; b=iXTuwqK8htRt7L5F2783a4btg1JjKPYGsv4BD1fMgDnPDTN+6Cm/3UtZVd6ixk9a7fJ3udahdevz+0c+pI/uBHBFoJ2TCCwreFAB+gYodE6yhDoNqcfFDLxcDbLbqVKQex+vhKYgNOoNxeGwWBSXMTRc6itboMumYv3v0zy1T2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749950006; c=relaxed/simple;
	bh=/vBIx0PvaTFGH1SIpT+R3QSDPnyJ6rpvlbvJSic5q1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l5irxs7M3lLcNO5Gwz3q0C8X2j+0P+k2d/Fo0jC2e03U/eL7iunXVkWjAbdwjo7tybBzf6QbUibuU0gwH8N2k6BkFHYkHZSdsTNf3KH3tVv/7yjJWiEXrHFkgGqhOsYAhi/jrlvTJSYsEfGqYDE1SRW1mQ4QsF+YNfrmbpl2FAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=EMyPhRXG; arc=fail smtp.client-ip=40.107.101.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QLGRVPwidW0Ie8AL14mC8J6kQZ62TbRLpkKm1KTvlYkcQ/p15WS/LFYMn2kgnyLG51aNHILazW7qx/Ot6OdPQWa9AxbZlUC702BDSBtwx+2AYw0PgzkKWFYMNMoLs1jGcXOQOp7cncINp+Louajh0nswM1AdAhnTdltP34T93ZZRqda6hu96sV2Ngz6Wg3x89fdrVGhPQlxRhdZKdm1nleXEpTBU/kAQ8xL2sIzmNjLvQPSWGbqX+LLuIXIO0A+ES5Oc/g2Wdb9kkETqUyhXTRQIlAUYTM5aXNBAO6ol/o7mp35Wh81Nj+rzOe6ZV7Sk0JDmi8Wci+kvasbJL3Weog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9H3iMIVw76XdEFkS0pIFzApQRXQlkWuRuscTZnf8wLw=;
 b=QyyiJMkGNM5D2wBF/6HoI/GNQgHajeaQQooXYF+6Ss0sRwPN3kftlh5H2mvwJ6hTT49UBNg8jMzhpBOCwFu/CYTKAfCoToG4Aq3sOqLBWhx0JKlQYGAfijU0MRGNED+DV0g2mSe5wZy0P1pxQE5s+Hi3Bu832jRmSeaCdZY8NbaMqhjbrGGy/5Fj0YB5uraBSi5cl+3J/txMjs0hbeiKfJ9we8Wb4IELZP562mIGw0HOkZIlLnL6HwKQKsMpCN3Tr0RCkt03e2Ans9ik/tizr0Eaf3o0doWyj8CtYKYK1ftFQ6SAaJP0m2M3nfhNshrG3l643RQW0Ty/NQqSOl/grA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=arndb.de smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9H3iMIVw76XdEFkS0pIFzApQRXQlkWuRuscTZnf8wLw=;
 b=EMyPhRXGyr3E7j+/1HQiVmny5ZGoPzCApsuR6nFF7vi3xC6fGeBPUIf3U3y/Z6LY9simwySvEvvetKf31zsOunUPDh1Wp+QvABlMNOdpO2nCodxlwOY7DT6iiPbNEgF4yHyMcTY1BlSQpvfdtCuRVgddxVY1nT49VYAEtun7jALjRu02KjQnSgusDMTNeml6T2VIpY6EnwI9eUt4BXJlLEW1gJIf2cCtK4E1StLg1W25QviUMsZzoKyO7hv9T5oxiWAAaKCkmCU5ZBZmZk8uwYamDXcAR1zJ+avFmL3KTu6NfTLY0SL57IDzWIhLQCv3T24RZIIT3uLrd1+slhvAzw==
Received: from BY3PR05CA0017.namprd05.prod.outlook.com (2603:10b6:a03:254::22)
 by DM4PR18MB4254.namprd18.prod.outlook.com (2603:10b6:5:395::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Sun, 15 Jun
 2025 01:13:19 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:a03:254:cafe::98) by BY3PR05CA0017.outlook.office365.com
 (2603:10b6:a03:254::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Sun,
 15 Jun 2025 01:13:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.0.1];
Received: from [127.0.0.1] (50.233.182.194) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Sun, 15 Jun 2025 01:13:18 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Sat, 14 Jun 2025 18:12:49 -0700
Subject: [PATCH 3/6] dt-bindings: gpio: gpio-cdns: convert to YAML
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-3-327ab344c16d@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4491; i=hshah@axiado.com;
 h=from:subject:message-id; bh=/vBIx0PvaTFGH1SIpT+R3QSDPnyJ6rpvlbvJSic5q1k=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoTh4oNEFEp6lD8oZ62lUlim8aru2yKDpvwyvGq
 fAoY6ghDV2JAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaE4eKAAKCRDxWHMRoTLV
 +7EFC/484t+W/4uGk1jL7RR0Zwp5U2dB+NVhfvgSo+vHJmiCahHGvc5+E6Bp7FewxRRIENvsumv
 Uc1BMMprP9pQZ07HDQCtJ+cPm5qneI+jZ//7y5qqd3HeZdffLQx0bUGjNZurhkSgv0UDkcpCiKy
 uCbvgtT0j9844V0h15j4HtIvjK76yqO5gtCBsvIKfnzAtsxZ/9nwjYhBvTdk8tkasLxaWHUj1Kw
 ZprLB9SPqdviKQg/T26a1M4QDT7xOHqTkkXQYqrqGPNfs5gAgruOO2Lf/85Nq4NcvOT0oG7ZPZc
 4jsLJ/ourc+7pI1fpClGea+KmpBFPZRyu6BHNqSoNtGhasK3MW45PpKRRLe4ctTUuWClrPCf2pu
 VQbWgH+arh4tQfXMpR2yWLQaP8HQrya0m2S97b8koOVT9bHsm7F/MHuutV8vaIHIqKtRzGc9/sp
 yJRi7y3Z9qGKigbMNUnsyEawUsSs9HhQgc6bOuwTTi1Gho51yp01BRG1Pdw4JDb58tarQ=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|DM4PR18MB4254:EE_
X-MS-Office365-Filtering-Correlation-Id: a0ed7b83-4d36-46b6-be2a-08ddaba9d08d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUJ5dDNHdFlURkRRNU8zaHFRMERtUEIySGxRS2ViTUFNL29hL1V4anFreUF3?=
 =?utf-8?B?Z3IxZXBFTWEweUFTc0FrWDMrcHhsUEQ5M3BrUWxKUGZjN3FXRFhNaDlpcjV5?=
 =?utf-8?B?aVBMbThka0JVem5iOVRWaHBKaCtDUndIU25Iemh1a0hKMTROSGIrRWJLMzNI?=
 =?utf-8?B?cC9tM0xpTkVsdWZZSUZvUjdQR1NkVDVlV3dzMWVBQ2NvclZhTUkvSnMxTWFt?=
 =?utf-8?B?Qml0akFxK1ZRYXNLR0RNSU1UVmVWa2NzbkNIb2JlL2ovSW5UZXBkZkEwV0Y4?=
 =?utf-8?B?QnRNVUk4aXZibnliL3lVVEZFNjNvYnpRbklabHBkWXp6MjVZWEs1djRlUjJ3?=
 =?utf-8?B?NUZMTjZpL0lOUjVoOElJMGovdDBJVG41eGhnOTFUdy9GYmxTOGg5ZUNKbTYz?=
 =?utf-8?B?QXFJcklnTVYvM1d3SnJUdjBWcFd4anU2RmFaZ0JNMlhoU3c5RGxOWUNSNDBh?=
 =?utf-8?B?RmpmczJydVE4R3hRWUlCS2ZqNVJvL3RtZ3dDamphNFRYMlV1dnNNV0VwSmRM?=
 =?utf-8?B?dUx4czFjU2tYdTFRVUpwdjVWb0FWUW9QbUx0OFFLajZoSllxK29BSzVXQ0NT?=
 =?utf-8?B?YTd6Q2lvUXhhdGYyV2RXQ2JETk5YTWwyUEhZYmlOSUFPdDRjVGdURFVhamU0?=
 =?utf-8?B?TFh3elNFNjlsZVdFSHZldm1GTEJibkt1TlRJdW9GbzZIa0VSc2hOSTVaT1ov?=
 =?utf-8?B?TDB5ZVZvTldoSjFWeHNqWVdZMTdWRnk2MGxEV2RTLzhmNGMzbzU2RVVjaWx3?=
 =?utf-8?B?WVNkSnZBUFByemsxQVJrMXVMc3dqV2wrNkpNOUMxaG11SzY0Rk5DenRxSXVk?=
 =?utf-8?B?WG42QXd5aHdEOXJLazJtSEYvRW1kbSs2b3F6aFlsdzMxclU3bHg5Ykt2QThm?=
 =?utf-8?B?VGhsK1pYTXlTci9xNlVjM1h3ckU3RVBDbzlYZ0oyckZ0a2FmMmhYMU9TRXYx?=
 =?utf-8?B?VS9Qc0ZkSHZWL2JxL3ZiUXFpcVV4ZVdIbjJYd0xTOHR1Vk5IQlhienZONnJV?=
 =?utf-8?B?ZVZnMnExMFNlcHJKRWpna083OTlZdjlWM2ZCdEJNY25KZjZsNFBpdFlramwz?=
 =?utf-8?B?ZWNBTEYwcjE4WTd5ZE04R2p3eHFmMUQrdXdpcGd4Q2htbFZOKzE4MlFnQUNE?=
 =?utf-8?B?ekxiNERuZ1JiTXd0MVk4SXhzVElTOUEzd0xXWDRUZUpLMG0yakJhdWlVWEVW?=
 =?utf-8?B?cmJvQUwxUlE1SFZ1RzQ4c2pDWitnaVNuQmNHNGxraFdtcW44cUFINEN5cFRQ?=
 =?utf-8?B?bkdBWXFLNG1pT1V0OXNtMjJNNmw0ZTkydXZnd00zN09sWUlKclk4SXFPamdH?=
 =?utf-8?B?RVVUMGNlMFZUWlZFdkpTK3lPS21uUWsxeU93UHhKMmpaeWx1aE5lVmVvc2xn?=
 =?utf-8?B?NlZLempRRGVwazJRR0xXeWpJbFFqRm9ac0dyTEx5bXRvZ0tOQVpOZVM0ZHNv?=
 =?utf-8?B?NXRBN3kyWlJjM3I4a3BxS0NST2JkZFZHWFBZallBbjRiOTYvYlNnME4vZ1k4?=
 =?utf-8?B?U0FOcm9PZzVidTBPNkl4eFErT1ZEdE84M056eGN3ZVA1THBuY3QzM0ExUG9K?=
 =?utf-8?B?UTBGNE9QQnJ2WFd1MWc1VlVsU3pJOU5VWU03R3ZWekdJRFlUa2VGeVBra3R0?=
 =?utf-8?B?Z2VNcTVwTjhSWldMbVRtcXpXemtMQUhpLzhxTDhxVW9rcm96enQrUXdDYjBv?=
 =?utf-8?B?Z2xCU2dtVTUzQ1lEUVBWV05TRWx5c3hUcjlQZVA4YktkQ3ZOK2FmOXNaVzBx?=
 =?utf-8?B?MnhvaFJiTEVjU1dvWitldjhPWHlOL001M0xLQjJFeHlMeEpPZ2hHaUdnK2xz?=
 =?utf-8?B?dFcrdnJCa3oxYVhaeEd6WHluZGhudzVPeUN4dkhTZ2FpVkttZ2Iyc1dRMDl4?=
 =?utf-8?B?RnRHblhveTVydHk4SnR3NGhGZWIvSzZ6SVhlbmI4R3NXZzU4VjNoZzRrUzll?=
 =?utf-8?B?NHkzU2FPV01jK1hYNnd6RGdsbUlmSWl3Uk1pYnIrMVdPNExMMmdwMTFiODlM?=
 =?utf-8?B?R0FoTENFL0hBPT0=?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 01:13:18.9524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ed7b83-4d36-46b6-be2a-08ddaba9d08d
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR18MB4254

Convert Cadence family GPIO controller bindings to DT schema.

Changes during conversion:
   - update the naming as per the other files.
   - add gpio maintainers

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 .../devicetree/bindings/gpio/cdns,gpio.txt         | 43 ------------
 .../devicetree/bindings/gpio/gpio-cdns.yaml        | 81 ++++++++++++++++++++++
 2 files changed, 81 insertions(+), 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.txt b/Documentation/devicetree/bindings/gpio/cdns,gpio.txt
deleted file mode 100644
index 706ef00f5c64951bb29c79a5541db4397e8b2733..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/gpio/cdns,gpio.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-Cadence GPIO controller bindings
-
-Required properties:
-- compatible: should be "cdns,gpio-r1p02".
-- reg: the register base address and size.
-- #gpio-cells: should be 2.
-	* first cell is the GPIO number.
-	* second cell specifies the GPIO flags, as defined in
-		<dt-bindings/gpio/gpio.h>. Only the GPIO_ACTIVE_HIGH
-		and GPIO_ACTIVE_LOW flags are supported.
-- gpio-controller: marks the device as a GPIO controller.
-- clocks: should contain one entry referencing the peripheral clock driving
-	the GPIO controller.
-
-Optional properties:
-- ngpios: integer number of gpio lines supported by this controller, up to 32.
-- interrupts: interrupt specifier for the controllers interrupt.
-- interrupt-controller: marks the device as an interrupt controller. When
-	defined, interrupts, interrupt-parent and #interrupt-cells
-	are required.
-- interrupt-cells: should be 2.
-	* first cell is the GPIO number you want to use as an IRQ source.
-	* second cell specifies the IRQ type, as defined in
-		<dt-bindings/interrupt-controller/irq.h>.
-		Currently only level sensitive IRQs are supported.
-
-
-Example:
-	gpio0: gpio-controller@fd060000 {
-		compatible = "cdns,gpio-r1p02";
-		reg =<0xfd060000 0x1000>;
-
-		clocks = <&gpio_clk>;
-
-		interrupt-parent = <&gic>;
-		interrupts = <0 5 IRQ_TYPE_LEVEL_HIGH>;
-
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		interrupt-controller;
-		#interrupt-cells = <2>;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/gpio-cdns.yaml b/Documentation/devicetree/bindings/gpio/gpio-cdns.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e71f0137912f88e69fb3fa20f096e1572211591c
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-cdns.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-cdns.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence GPIO Controller
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+  - Bartosz Golaszewski <brgl@bgdev.pl>
+
+properties:
+  compatible:
+    const: cdns,gpio-r1p02
+
+  reg:
+    minItems: 1
+
+  clocks:
+    maxItems: 1
+
+  ngpios:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of GPIO lines supported, maximum 32.
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description: |
+      - First cell is the GPIO line number.
+      - Second cell is flags as defined in <dt-bindings/gpio/gpio.h>,
+        only GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW supported.
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+    description: |
+      - First cell is the GPIO line number used as IRQ.
+      - Second cell is the trigger type, as defined in
+        <dt-bindings/interrupt-controller/irq.h>.
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - gpio-controller
+  - "#gpio-cells"
+
+if:
+  required: [interrupt-controller]
+then:
+  required:
+    - interrupts
+    - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    gpio0: gpio-controller@fd060000 {
+        compatible = "cdns,gpio-r1p02";
+        reg = <0xfd060000 0x1000>;
+        clocks = <&gpio_clk>;
+
+        interrupt-parent = <&gic>;
+        interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };

-- 
2.25.1


