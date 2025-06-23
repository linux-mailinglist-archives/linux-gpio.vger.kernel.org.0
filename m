Return-Path: <linux-gpio+bounces-22021-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 075DEAE4BCF
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 19:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD7023B8413
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 17:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9374E2BD582;
	Mon, 23 Jun 2025 17:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="QO22ScWz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2122.outbound.protection.outlook.com [40.107.236.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEC42BD012;
	Mon, 23 Jun 2025 17:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750699722; cv=fail; b=ct9JLRvhQ7/ADU4VyA2H47WqrF++6BhFfEPkchxZqH8Y1/qZQCq0IYkLSGsYuD+1O1Ji5xNpJhWfMRX0QlqCzgsyS+jSFAkkg7lppYIwRsWYsY1QGlNH/HZ2nIuVea6BmhxhU7A3zOWpc2umdIx7l3q/ggulFAuR8lRdYthZar4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750699722; c=relaxed/simple;
	bh=FlY/8MhUGOnnrp7gilsv5/leOmRBRFqQS44Y7ligQno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XFcgTAkp/kUpij1N+pb+kx3r3qKklrmOFZvQQpzi4uTxanZAKM1ctmNrGphrVhp46Xnp5aJSE+jZyZmxxgDQu96qJJFcDUG+HrNZuyHSYHPDjBe7S5vYi+Tnqk6ZDInzQueau5TL9F5xW0tSrmKLKwtkrgqg9EPLY3NZTaKR34k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=QO22ScWz; arc=fail smtp.client-ip=40.107.236.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DAG17MP+tT0uYepbUosY70s0oOWOVGCqo6yLsOx4kLz5x1pVWpstgsM3bZy8TWc8tmQc4bW9miU2glFtuv/bIsAus+J855AtHCG4mX1LRo5408QhpXf+S0L7G0qpMCJv04EhHQMgwh8OV3Og4K69eovaEWfq6LMPfQuOzkLB+h2A6AKVTTtcJV7XlRcMk1bAxE+HgYag2xqhQzszFHf7YueeYOwJbCRtJkPdmAiaP5CDMtFqyf/xtIVhy62gWNxPXhoZ1ISfk0DCzgwtdpF8FSOEyIHgfkQdiafKPqPMPltAxdFmVzIjw54k9jUvOy+sZor6tOvuaZGgwozRM9GNnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dt6AKqMXqLP1nzN1KwRjYzHS4CG0RbbjcQeKaS9eHzc=;
 b=N5m3psAz3GyW56omm+7BhNLcLUVyzaM9H8BRtrPGagj9EMKuUy22sNe7UHFdm5r/51u41TGLwaDLgA0h6DNzpr6uPqCE2qnRgl3malOgKSxz9nxYb2X+BgQcLlz7jQ2ve+efa5kRg8x7+ezeMYFpVl0BS+cLtUFr9LK34iXn6AJ9bGYJY8uks91A6GuX4qTCfmY2OvcFb5zVYAuG68FLSfhChl+dB/ZkEgg+8pxxp/GR5hozj2eXOaDYyqfoR0/uQLuBrn/7O6kkCcjGSiNGzo9TqbU2mjJaMu4X28+MCVuQnrAcPimmyY4XgtReD0PPgLpv13RO6l0AW8q0UeaWwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dt6AKqMXqLP1nzN1KwRjYzHS4CG0RbbjcQeKaS9eHzc=;
 b=QO22ScWzgnm6fhSIygJzt5srqqmbkvDZblrawvwccJi7vLmZ2BNjg2LSKl/1QgbEouw9wR0n3bJeqFZFPgjeMslJuHLUW4c6BlvU9LS4TKBbeXXiDh0eAmvD4/iY+brjUWVTSL4KlIOZeYxy0EktgeZ+9OmWL/g3vKfUylw7h+anc+cTtBjOzwh13kU8EuyTYfSOWUVFPVXpUI8H8gH6U5ysQG0yxx1b6nclxF7XHvRqsnv3VToCKQ6Cb2rf5kx3InH9+PWRbQvLxUDn30IEUOX1tySAJZqkMxbsOC04VQfHYnLko+/fj9JgdHLOYAT9K0T001hBEDLPYg25hV2cpA==
Received: from BN9PR03CA0096.namprd03.prod.outlook.com (2603:10b6:408:fd::11)
 by SN7PR18MB3934.namprd18.prod.outlook.com (2603:10b6:806:101::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Mon, 23 Jun
 2025 17:28:37 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:408:fd:cafe::69) by BN9PR03CA0096.outlook.office365.com
 (2603:10b6:408:fd::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Mon,
 23 Jun 2025 17:28:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.0.1];
Received: from [127.0.0.1] (50.233.182.194) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Mon, 23 Jun 2025 17:28:36 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Mon, 23 Jun 2025 10:28:14 -0700
Subject: [PATCH v3 3/7] dt-bindings: gpio: gpio-cdns: convert to YAML
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-3-b3e66a7491f5@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4288; i=hshah@axiado.com;
 h=from:subject:message-id; bh=FlY/8MhUGOnnrp7gilsv5/leOmRBRFqQS44Y7ligQno=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoWY66VQfc1CJkhs7llN6ym2l/zdKRsFwyCfJ2B
 voa8JzqqZOJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaFmOugAKCRDxWHMRoTLV
 +3x4C/9MBM+hwr2dpThwPQLeTzwn84NB/n00IKMWzDOKux0L0qSzAXc7TGDDy8YgUdmJ/SQQfmg
 sA03x6J1pIBHPaGgiftfTgWqbjGRRn4h4MlF0MI1Av/V20GU3Bno7ShTDwHGjw+zHxdc8QMLwDv
 G/3wK3J93wqLfwTiqyI6oMS4vKG3qyx7+iOPyCut4jFqbYC3SsZzdjSkRtd33Q+H/PQAWJB9XGj
 VqZ/KoECFnsdcf04KJv2UhDO7zpox1vDqLMllmIarcNTCGYPSr6OU0wydcpA7ZqvW9Hs/JoJiQO
 019f/6HZ+dJnYQ/OBCLTYPMP7oCqdJTvZ7Hft3bVLduW7KdEsDzohqPrYx883qZRzbcNlsoc41N
 wPr/bx2PexD8HFjRiv9z8YePSf43ReL6LzkttAcc55/3kHCSok4Rmchy2S7ImH7nn5H/Ha9TSpn
 +KER5W0QO6DVJ0hGS0qWDHszwmijKPAUvKcULFuLDlINwbLRSSLZYiRx2Ok5oZHVAMwqM=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|SN7PR18MB3934:EE_
X-MS-Office365-Filtering-Correlation-Id: d2dbbe4a-2000-49ba-cb9b-08ddb27b633e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bTRYbUluVHZZMTU2SXJOTDM3dXVrTG1Lbm44YVhoNHNkcUk4b0ZtWHdEU0xs?=
 =?utf-8?B?REtKQ3g3RHJVelEyZDlONGlYRFRCQVZzMDdvVVRaTVZ4b1I1QkJKK0JEUTg5?=
 =?utf-8?B?NldocFFoanQxNG83Y05QMTAvTkZqYmtKRTE1eUVxbVBERFRPQk80clBMdC8v?=
 =?utf-8?B?ZVk1YTR5VGtiL0lJL3djOWtZR0gyT2ZzSVh3Q2djTjhqR04vcGZqSWxPWWdR?=
 =?utf-8?B?dmcrcElHWkpUZVRJOFBhUFVZQjRWcGVXMHR5d1VKRWVlRzdPOXFNcVNtWUtH?=
 =?utf-8?B?d1FCYUhlLzRuNHBvcno4NDJObHdFM2VBc0RqckFLY0tMOWRGTWYrcndWYnFl?=
 =?utf-8?B?dDMxaFpWeFk4anRyYnNMM29Ob3ZWdm40NTlUVE5MSWZNb0dobzEwYVNXdHFm?=
 =?utf-8?B?MXVUMmlFUW56VWJXandqRkQyUytiNytGVjB3QlZ6RE9nbStPWW9Cb1Q0U0Nj?=
 =?utf-8?B?RjhKSWZBODBBZmQwN01lWlF5a3pGcW1zWTBhQWtaWGUwV0Z2YjExREI4MTRs?=
 =?utf-8?B?WWNrVnB4dU9FT000aGQ0aDZ1eE9hc240SElKTmlVbUpCTkphdTB3V0EzczV1?=
 =?utf-8?B?WXRiWElpZElBNmpwOHJ0VVZDNEJEaVU1VXZBZ3hQaklhbVR6a01uQTFLSDdB?=
 =?utf-8?B?MDJqSWxNaTZwZ2JyM0NvdTRrck5BL1pNRkh5dlFzNHYrWEZJNkYrMEtOdjda?=
 =?utf-8?B?WXVjQlpYMnFpSVVuNE4xU1hRcW5mVFF0L1RhaHNwaENHWXZEZnRzMnJyNjV3?=
 =?utf-8?B?cmhYMTl0L1VCNUsraDNWNGxnN0RNVDBwWUxkVXpONzhiNzRVOGdEcDVjRTlS?=
 =?utf-8?B?YWk3a1gzSXpQMXprZkJFdFczUmUrM296dDRjek5DTm1JYzkva1FwQlJ2WTh6?=
 =?utf-8?B?SlJ3bkNUWlVEMEV5NWtpMEFjR2ZBYitLWVFYelhrTTdnZDU5NjNGb2VZeDRJ?=
 =?utf-8?B?TFVVSXQ2SzJqcFF5eFYwOTBsMEF0Wi9wbVVsdEVLZ2RudkFMZFZLZjMvd0dk?=
 =?utf-8?B?cnNUQmxxKzVabHgvL2o2V1JXazVvTVI2UHVvQnZxVG9xMUh0WHplS01WR0Rs?=
 =?utf-8?B?K2ZqZGVxTU9RbnU5WDRsanBCUWd5VnhrV2RDWWFkb3paaGxJQSt1d2NlREVk?=
 =?utf-8?B?aFNoSDdvZDFRMTMwWDJ4SmdVQmk0dVNxWk5UKzJtK0ZQMDhDUDRiSDNiWXlv?=
 =?utf-8?B?YVppaEc0YlVYd0wxaDluRHMzYTdJYnlabUxVMnhtZnRVcVl6VmkrWXhXUmxk?=
 =?utf-8?B?RHFRUk8raDBpVW02aXNyZ21xcmZnbC9YVFlPNUJrM1ZOOFA1bFpLQlBHS0py?=
 =?utf-8?B?aCtvY2tERGo3RG5kOHhFY0g4bTBsQ0laL09qaVY3eXU0aXpLN2NJZmxhZjJj?=
 =?utf-8?B?RVgwL3R2aFpISWlKdis2SE1MMlJPc2k1RkJZbU13dDNzSWlhRlk1eFhFdVVn?=
 =?utf-8?B?MzhveEozemQ5MGNhdlFZK1BnOUw0SFRiQ08zWlQ1V3lEY2FIWXVwNFV4akZ3?=
 =?utf-8?B?blR6UDQ4eUhRV01lNFNiQjlPNGlFOFZvZUw4bGFtR0NjU2NSa3FvL3lSajFI?=
 =?utf-8?B?NFIrK3B6NkdYVU93V2krRHpvQ050Mlp5eWJYZnhBUEtvaXQvaXhzcUR4c2hW?=
 =?utf-8?B?SkRKU3QxbEhmWXdFaDJic01RNDBaRmlsd1ZDdkNIUEsrV0JrdjdMcElLVVJI?=
 =?utf-8?B?bzB0SEVOTnVDQ3VTMS9rd3pEZjNGenJrNXp1RU4yaE0xSmtKU2hRb2hHckc1?=
 =?utf-8?B?UzBwaFJvVTBZRzhtYTRpOGppTFBoL0RTaHBJYmFzZnBUUFhiSnpsakVxN1lK?=
 =?utf-8?B?UmxaK0p6MHJkMGQ3aWxxS2M3SXBrcFNoRnJ1RzNmWGI1dFRJMThkME5lWVE1?=
 =?utf-8?B?VlNic3BFWXFEamxMbGIrS3FxK2RBTWFKRmFHVy9Dd2RNNDFqbU5LbUlncWg4?=
 =?utf-8?B?cjBuUEk3UTYzNDF2TWdUZjJzWHlkdGkzemlBL2lVWFdzNEl5YlNmL2ZPVE1w?=
 =?utf-8?B?dTBPNUorMmZRPT0=?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 17:28:36.0411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2dbbe4a-2000-49ba-cb9b-08ddb27b633e
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR18MB3934

Convert Cadence family GPIO controller bindings to DT schema.

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 .../devicetree/bindings/gpio/cdns,gpio.txt         | 43 ------------
 .../devicetree/bindings/gpio/cdns,gpio.yaml        | 80 ++++++++++++++++++++++
 2 files changed, 80 insertions(+), 43 deletions(-)

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
diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..265bd62cb0887a860391d56b3154dcd8416c5d2e
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/cdns,gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence GPIO Controller
+
+maintainers:
+  - Jan Kotas <jank@cadence.com>
+
+properties:
+  compatible:
+    const: cdns,gpio-r1p02
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  ngpios:
+    minimum: 1
+    maximum: 32
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


