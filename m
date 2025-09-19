Return-Path: <linux-gpio+bounces-26381-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A057DB89A88
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 15:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AF70176658
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 13:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ACA0311C11;
	Fri, 19 Sep 2025 13:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SEE6atON"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013044.outbound.protection.outlook.com [40.107.159.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA483112A1;
	Fri, 19 Sep 2025 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758288382; cv=fail; b=DGFLrtnEkqL1cERNZflIgcmilML930qf5ZtBXvMXqOLZ1oCjbmy1pezKR7OCCQJeHykMwRJBzXnafwn+8ZK+Ht1o/UcP2ESazong4f1FbRHOK7YYe4JgCWslJabjXBslqqkj4B+UXkU/I+4jI4i3i7RuRpzZMyKHhnEfaEpY8lc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758288382; c=relaxed/simple;
	bh=Dkl60bSr1YHOrlVbtP72k6l3a3kPSPavT3NBpr/QTnU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qXPoZ5AcoDqiJ8J43VS1vyKnwlmEUPw2dT6f/zAcAkT4ij3qrWEPDL6vNU7sSkIku73pffNz7CJlU8MK7o5/Kdnh6ZCwnGvi9aqq2r3zF+Hxjze1oOHAAt0+rtRn0N1xPuWJ/g9OSoPU8kJZvL4kCa70co4K6+x4ncvxp0xi7Bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SEE6atON; arc=fail smtp.client-ip=40.107.159.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVXJ2G0JNz7wTfWaaObyt1+mesjkOPtBK3vk/V4QaNRxZthXqGOU63/EthPMDkZb6sRBwUhpd3TjEmE4fMVam3fa6cLCdneYu8Qv5Gi3Q259a/1cIeAo5seQp5+tEZUogR40UnLNZoPfLxPJ9FGaZqlIyZ3j960HvmN7ZSaQU5rBxURiAVp21G+7Zu8VlfSnyzFmZ4khepOIRENuka4Ta6IR87we3mXskKG+VwfiWukbhTd/bj8Lp6NgH8nsb7qm9S5pAmM0R8PsacmhKua9+qYpigxspNa5x8V/O3Mk6C0hNK5Ypc7lCBLLicxXMh/QXuoZtgqWxUPABzSuVQTRag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cozKTNugGKoydC/1YBg+lO1jv2Kw7gOSJHy/FY/54lY=;
 b=ABsEyi5dELe9loGHgv1new6rlD1+lrQEi4xB6AG2G/Zh0RKW31xSYssX9XkQcNJ9SaPOcPdEnWEQEMSG0NqGMCaJ6ZGqugsOTX5o2q5Ki/TGitL1JVA3MkUFuRP9rzP1a5r9h74niVWPe8L4RIhFMw79hbVofHSRfjiA3EuwiGUfYF7FK4QFFClLKDGfA00F4AkH2WEKI8wicAiQyOeN9YvwGABuX9XbdyIP3OVOhhe7yFrU3Yk60MjdbrSeJnGGSXDlWsEdmY4dgBcnAgkJi8bZv+C3erzyM4/ySB7v2e6kAUDF9WnVk6cENyjTm5hGT3dPwPwRDCrhbG54Pepsgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cozKTNugGKoydC/1YBg+lO1jv2Kw7gOSJHy/FY/54lY=;
 b=SEE6atONGQDLo31UrHspfe/4UugKIhI3pekngMtbZB3QgqO/eu4i+YV2lwBp9uJOQWgRpExxIe76/n/OdkFsb8gED+Ub5kvxm/HfXiwP9z1ydaUSxgYlviBi7EuZdY3K9G3HLi55SAYuWCmQ8trJEYxokzxzEISFxH3QYB6ib7bap/ODznzTAfe0td2/jAw5hXX/XSuZhrGN9gAwFsUlpRG6SZ/WHOwfLtJn+sZfqS8xN6xw1Drxbw4tj50oSRMab/v1uNTpjZm//CJEwcET5tPj9MVQYsws+j9oq7dMoCuvYJWbwbgXqkvuoftr/ke/uKJC9LHqmMApmoukuOLgvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 13:26:10 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 13:26:10 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4 03/11] dt-bindings: fsl,fpga-qixis: describe the gpio child node found on LS1046AQDS
Date: Fri, 19 Sep 2025 16:25:07 +0300
Message-Id: <20250919132515.1895640-4-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
References: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::7) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DBBPR04MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: c79e8f5d-222e-48c6-eb0e-08ddf78018b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u+z9y9dbz4diOxKcCq7ImC047GtvEoQcvMCvXCs0rc6ecxt7CvecFT2Ujluy?=
 =?us-ascii?Q?XuAr+nZ8xATGemUH+/KSRlWP+BuhfRamnL4mpUB2D3GPKLqGcQfs2BgaIhVf?=
 =?us-ascii?Q?obuwyTSDhvcOHS8uLJtPbjQsxAI5cXMtyu4Q7dv3KIT7UDtkt8ndy3FXRReW?=
 =?us-ascii?Q?DIXR0gAlhWkNTWEcIZchU2QTakEc1y5ii4ThgsVuZEAGcG7CWajP0JlxzPGf?=
 =?us-ascii?Q?kLIgpQYVAK7EWdDsay7prXAJt25XhoZepsxO4L6EQpUDvKjUZKkA2HvHFqpg?=
 =?us-ascii?Q?428thy9yPVmk+0yPxeVGhZc72Yk0sNaz3QKWDu7WzIzkyHdXDqmxhcbx0KYe?=
 =?us-ascii?Q?Sog8zSRMvmxZV9Nbv7gVqmo3bI6AietQxoeRuo5NZmnc4AGkt6P3OHuNTwJQ?=
 =?us-ascii?Q?02/O8UDYiwnNDkYFF/nMsBRt3KdLWYxTSjE3vpCWStiBFQG4u5+7GLmsSLwT?=
 =?us-ascii?Q?IN7MyayW1JUV6Y5u9fQttLITnVYaHjPIxdf+205TEfwxVLj100HeZGYtBl8N?=
 =?us-ascii?Q?q5vix97/3B36BIb2NIiHUzVC3da8Yzt6G8lXy1BPFVRMpmpErgCK7nOOfIq2?=
 =?us-ascii?Q?IrfQ8CWT3+ZOav3Rk7v3PvOKvoUPMjbrVkZbHn2qZRSth0D4/2wuesGCnw/8?=
 =?us-ascii?Q?3sce8WQZ+qnhKekVHHJHrLzq5POlkLRjzz9ANoeCi5r1SalBg6m7KTUTFQfA?=
 =?us-ascii?Q?2y8TRJPxnctdGH+jhvf1xNvKH2tHyztGQv1hO5213KCvFrujYax+ur963gjX?=
 =?us-ascii?Q?V7Z0ZrrHJMrn/hwnpZuAIvx+5f/TP9YW/LaNGaWP0Sf+EyMzw6HxQMUJIGr6?=
 =?us-ascii?Q?c1y8hSK1JRPb+24ceMYuLB0x3AVRd9ZyVXhYtyRNUqg5aAoeKocwc84F+Rq6?=
 =?us-ascii?Q?4cWdfw9NFu5bdXeaCZ7FYdfjOfw6TOGZ3CWPwEUD/+/M65LKGQ3l3N7lYjxu?=
 =?us-ascii?Q?yoBCf812pnV8xpLGpaYBShMlluXPRpX6qwHFKl5FMbKmXoxj8KelC9wN6ACC?=
 =?us-ascii?Q?WKRt6XVdeek2xBUdnVJdQnqCi9L6qmzV6ux2CZlYNeSrTOmzQunAAPAN78gE?=
 =?us-ascii?Q?CV+H6rpihvIH6sVKNhpyH6fw7ru3PPvJv5wIGY3k32f7KlD4zgpxumPCfKyy?=
 =?us-ascii?Q?JCIGyBPdkb1aPWUqirU9GxZ0SpPvOzCxRl1s8MWhkZcGi+P/P+n4fr04gH7X?=
 =?us-ascii?Q?p6l5UUf8TEUFEaiVw+61TBOKTz2S/CugIWLDOL8lwMWe50lo7lRqlrIvVfN1?=
 =?us-ascii?Q?BKSmS/rDqFEjI41hTLkw64xZOdMqKnqe/sC//NmnMVfreEtiGBvoB2rBVKp8?=
 =?us-ascii?Q?tqXdhDKel+GST7JT5wJVIFk4INvySksz3c/4PRmH9dhamscJJuVG3sFltbh4?=
 =?us-ascii?Q?xOTj+9ZQOIi+J7zRVzPgZGq6x9lrHywTrV0PRVEPzrib9fxaQL7t0JKrzeqD?=
 =?us-ascii?Q?tK72UF6Pc+picdimbp7+LCKBRR62UVZjdg2jenz00vcRNJnomPqB6Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ksVE+QuHYzf5E7QHQcOypLOp52XwsCI/6xdOoT0Dwn60/MxfTdz8M/3+XqGZ?=
 =?us-ascii?Q?X+ovPoJNwJXZOFJrXVJXyziMyU3PZLVLW7XguvdWxZzF+GRETqgfTYzZiOu1?=
 =?us-ascii?Q?f8d2/Qj6hBjJW0gJqoe+WYrWkujqGYJUnD815PNWmIYZ6PKmIwJ+yRvjsNcO?=
 =?us-ascii?Q?54WT11gmFVhhalBj1EDzG4Qhw45B2ZQyRCamnOPWfIfjun0nV1nr6ejJ0BW/?=
 =?us-ascii?Q?p3tI2GI/o3aoCJdubwytDwoX7jex4bJQm4T+K/S++O532AeHvFYbTuobXiI2?=
 =?us-ascii?Q?QSpMuu9aZGLW6IyjERlGWXVOK7U/XtMSQxp+GCxmSQBjpMl9r4PBNKYTZ55M?=
 =?us-ascii?Q?sJUBD0c/d4sUZ1zEWw2SZMC+uFB11/elSkR4bfhnjsWc+S6loXGiAJqEH4aK?=
 =?us-ascii?Q?/qQqVh9ylIygVgo9erAjCqf8zZYv21ZH3wFhsNUaEnhBCFOnLP2SFO203WtY?=
 =?us-ascii?Q?K2jPqIVWiGbXn5D0foSIH8wR5xA2NmyH8+bq5b4GIgHyujI8vKtTvZJndDjX?=
 =?us-ascii?Q?PC96cIFENjvX/Zbjqpw8KzOTZL3CJODSLidPDU71HUw4+KIQXsx570h0Vcn7?=
 =?us-ascii?Q?B8HAOiPgW34JOZjZ0xLa0uqdo/k6kKdUVK+l6B2yq85/Q1Y03Z9v7+nN+j3i?=
 =?us-ascii?Q?GfX0yTkCbvMCJkc25/e4cRM9xUUe3EsDFoBEqqzyqtEionMJLCIxEn7n3mem?=
 =?us-ascii?Q?Cy8sBTmjQeNvysmrqAq6ASd9IuzFpaQov7VJ/LMOjYn5crbXxHNl4FTrJBFM?=
 =?us-ascii?Q?sNdh+5kbV/Lz8aSIgW8nA4fa5+Le8mUeGEeHLhcJxcjrp6PgcM2RYxFXcSpt?=
 =?us-ascii?Q?MfleqoPdyceesa291P3xnQiwUvine+SE5lp35bWFQFaJ/m8IPgDX4qlgloLi?=
 =?us-ascii?Q?wH23bF4qiJqQ5K2/L75J8JUrsWPCHOdwOPuxz9kOFmUfuCMj25sxSq8h2nI5?=
 =?us-ascii?Q?tFBBgRamdi04EaD0eI6s4oLmMVAaGW3Y075MEIEMQdvprhsVuSpDimiutVaH?=
 =?us-ascii?Q?yzywekQQ/SeT0gApy9jR7EN0fy+gNaG8zqIZF6hwxHiR2zsjdcGZ8pUw0Bk3?=
 =?us-ascii?Q?Xo2ldLrcRMaefrGvd7mFHDS0dGTiUkVOq3faQIAMqCN/Ipd7wqTEGtonrcSB?=
 =?us-ascii?Q?8Bro1HMEgTvVJQoWNrJ0BLngbY5Y1XE5PWbiAMw6+Ww4KvNW0OHUFilrKhDy?=
 =?us-ascii?Q?/E92JAdsIq09kNymQOxOSnTno/SK6jX/C4Ej2UbJLJ9abr7V+pNLQhzbgUNi?=
 =?us-ascii?Q?WIFkSnW8kXi9I6oHzH9UGpkmpK8RYIw7c0c1pLir8b1cU6pDVU82Kk7+oXS1?=
 =?us-ascii?Q?gfxtuNPVzj/lOQlkiSLu19lYK6THrS1TNOZR9O4oVgRAkzKKnDiarTEJIzMv?=
 =?us-ascii?Q?FZCeSW3KfcoKnDPfRpw7kKhoJsXpNBNR0O9+OFQZl73FyWGwxUhuN2u5EwGt?=
 =?us-ascii?Q?1zCs9VmY5RPrV+ZWR++MIVfCMMLAEdgQIEohi+j5Qn84QYzbAhjok/te3D23?=
 =?us-ascii?Q?nvdwEuFyqaKfxy5KuHFs3B5rJAwaZqttuOtuWPLkBXmuzRexiqPC/+Q9kMey?=
 =?us-ascii?Q?xeALv/P2ELk3AkiogTbQP948uNDxoNuVFsAwimFD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c79e8f5d-222e-48c6-eb0e-08ddf78018b2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 13:26:09.9879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1NS3S+cGzrCVZzeNNnfQ59Jdv2BqVoAQsExJxJy+gieTdeVznGXOm724jwvH1oI2fyZnHt9FFPCA75CtnNZ+Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7737

Extend the list of accepted child nodes with the QIXIS FPGA based GPIO
controller and explicitly list its compatible string
fsl,ls1046aqds-fpga-gpio-stat-pres2 as the only one accepted.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v3:
- new patch
Changes in v4:
- none

 .../devicetree/bindings/board/fsl,fpga-qixis.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/board/fsl,fpga-qixis.yaml b/Documentation/devicetree/bindings/board/fsl,fpga-qixis.yaml
index 5a3cd431ef6e..2eacb581b9fd 100644
--- a/Documentation/devicetree/bindings/board/fsl,fpga-qixis.yaml
+++ b/Documentation/devicetree/bindings/board/fsl,fpga-qixis.yaml
@@ -57,6 +57,16 @@ patternProperties:
   '^mdio-mux@[a-f0-9,]+$':
     $ref: /schemas/net/mdio-mux-mmioreg.yaml
 
+  '^gpio@[0-9a-f]+$':
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        contains:
+          enum:
+            - fsl,ls1046aqds-fpga-gpio-stat-pres2
+
 required:
   - compatible
   - reg
-- 
2.25.1


