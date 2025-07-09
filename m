Return-Path: <linux-gpio+bounces-22984-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A70AFE7AC
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 13:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C14E3A0687
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 11:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E712BE052;
	Wed,  9 Jul 2025 11:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Hq9eagLQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11EE293C63;
	Wed,  9 Jul 2025 11:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752060451; cv=fail; b=rTLFg8CiBTIvOHZAME/xygkP6D1IWbcASBe/H1wT/IX2cDeUuI0PKdu1CPBtPlBrbUrQhJ+MOgFvFLcES4WDLQVLPOlsHzs3E91sIdOWsttoJ7bwuGr4kDGqIFHZWWPHdZIo0a7yZp9efKGQ42GVlCyJ0vf4e0GK21iL3ykLCTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752060451; c=relaxed/simple;
	bh=X6a718mErL66n2mgyzU0EVbovuPPaD+H2vp6LWwdDe0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Sl0O2q8FT25XUwkVH4CdWDxmPNfNgBagty92O7b3ZQ7OISHyvsAp3/wk3vVe+ec0BwWmjIMv1bnrwLpZtApaVQN0kcnzraj2c7OfpIa6gaIJDeC/CY+Y77Wpc7zdcb5zFqAlrztsp3HCwqdT/16hcImzzPTQ87wB0q23AXFhbEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Hq9eagLQ; arc=fail smtp.client-ip=52.101.69.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJh+f3xkZDJ32Jg/yQ3boBicDgA6b3RZ4iXT5mrf+pBR+2An0VgdV1toiGVqM9VGJlEtLJ2PHSdMSRgdpmPZe6cYcmFtvpHwjXs+YpUHwmbF8+xEY+nhwYsDFbe+17lOToliqeELwlecN5V7zlZsdLGTszO3ak60psyDq3P/G2weSjf3qDydVm0chKBaNbwL1GUgwzqT88p8gy6COEkF23CwbLeaeMiWEOQFt8bNsfdOc8V3x3YvFUvvoHDZvkW6BNFHR9j1N8LbKSVUEtfQnz2W2XkbSUhK/sgl9zXUYo0lZB54YguHCGZMj5q34sfRnOET5AcxQLz9sZVJl/OvSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krWE//ItbjSAKjYXiwls8vN8IfxzSJGDZBjYNYU49Vw=;
 b=GUC03uiPsIeOtT/wSxAuOeElqZrzeCnXLSQ8lObzsW9IsZgfp+3+gofUJoic5kUWu3sE3lMedq7NjY0Mk7eVNY5rVjzBVJyMq0otL7pFKLiXm/MRm+0/C+Jsbu06BbqeiochM+MMME3jY0641wCrwQHUjZvRsJHalnUzQX7ywTce3r200WjwFURJsM72PRQV9ckMk1ZZxt9l2jMXDmwJkLX7EO+4vX2kBKnRghYMcRrPM3BECH+zjQ+I0EAv2mw+K8FENsk91GQAeyqRbiWOsgpat89fAxa9Q0bYtS0dW3Y79Zxtg6BmL0KsGh2HwgzO1Zp/74fQYRe9i5b6CM9amQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krWE//ItbjSAKjYXiwls8vN8IfxzSJGDZBjYNYU49Vw=;
 b=Hq9eagLQdDpmrh0WghUjqO8r80TGCP8M6e/hlS2/ZDKQQp8uTuBrJiEWeYH/+juTwI0hSYxcXuqUm2yeoTw4aV8vUtz8nLZkAVo+ooVHQiAsHQPs7lQsqiXeYQJfSIOhfD4fbKxamwz9nn04s9DvSHfI6Va+hSkBIlJPjUCqEKE9P1KiCmJDnGnQ28dHR/BMo/fikn+I1ahn7ohI+isL80Fo3X9+t6/2scTwlEISIdDDzYMPoCHL0V3nTs7cwgckmXCCesDe59KzUGcTQeOMAa8XsnBtjr8v/LBF91+IzcSYiJ2Mh0xDv9BBWpPz15yOWcWtAByLXFFV31Okyf6Aug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB7830.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 11:27:27 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8880.030; Wed, 9 Jul 2025
 11:27:27 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 2/9] dt-bindings: fsl,fpga-qixis-i2c: extend support to also cover the LX2160ARDB FPGA
Date: Wed,  9 Jul 2025 14:26:51 +0300
Message-Id: <20250709112658.1987608-3-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0263.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::10) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: 301b30c1-8666-45c1-a4b0-08ddbedb952f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zOve9fDVgl+AMTzHyzpAJhw6fB/hygnaBFKwi4olxE69RPC9Z1GS5WUf7Dpj?=
 =?us-ascii?Q?OduP1sbbBMOvpG+7kxfTsi8jBOCxCDEdLs4vr8x5mhHo1kFGXr1/ta3jPNak?=
 =?us-ascii?Q?UjV8guFdqbt+REPwzxNMWT2NT3ivrWvebmtRKPswe3t67I6Q8m+a2vzkmMkD?=
 =?us-ascii?Q?g/iniz5GJvIrbjUqpzAjbi6LGzjwCOOgg/1SHCwa/qS9lY/GSZUjAme8SMBO?=
 =?us-ascii?Q?yMhwbTRqDFAog7NO19QMcCUUvMcTm7hEMSVOJQCtevl0H0gRSLdd2wIyU3VO?=
 =?us-ascii?Q?GHAnkkX95kvx2wIBFcCzqHde3YwGppu1BheQny5OhsDN6XibTtL1ymZqL47s?=
 =?us-ascii?Q?y3/I0cg0DJPx3ERfD903KjQOLJu7+exXTTPaWKuTKibvruFqBk7FBkdzxOnq?=
 =?us-ascii?Q?N04/fj0Y6MiTGpy+g8wcH6wa1sh+K/XmPfQFR1/ey2DuPnh19r9EzaaHtTu+?=
 =?us-ascii?Q?c6PkGrgZ5EYcEDLX3VLAn6wLMYXxZGBEHn6RQClGbBaP67wNTs2/L4vce/CJ?=
 =?us-ascii?Q?MY7Xh6q65BKZ5rxNvn63TbEK/2J2gCrm1bZTg9oT6Bb8QbVLjc6LxwUIwn9j?=
 =?us-ascii?Q?xTGx70xOKSATMvm1N6A7747kndfPdiwGlqs6GXEgBr+FkLVfGneon7wr4OPQ?=
 =?us-ascii?Q?4k7QtO5YDZjp2LcTdjqYYdCKd2oZ/Rf5xsEG8y4RWC7Eauolzx86n0amEGlq?=
 =?us-ascii?Q?cLNiapZMvw1DT9YFhqWAn7/Tgnd1IF6tG3jo/6cZatT4qJGY6juEL9dfRTdu?=
 =?us-ascii?Q?KKTGbAsK/ZQgP3pWLdZshUus7L2o8p8a7PQrhcHgxO+Och0HJAkAw+DsUPsQ?=
 =?us-ascii?Q?VUrZN7UHVLe1D6CIyxEW1aXQNfmZ2znf4t7C+e4Wcz87Wmnk/mxhBK6vXoKZ?=
 =?us-ascii?Q?BRPiS3MT+pEfcIFoisyzqQ8GPBFQWv9OSC0hiTvV8i5RwfgMD6Qbj4INj4Qg?=
 =?us-ascii?Q?tHwyAGePsb7VjYibYTgoc+ZGoHvDcwmcYxsL2NFa/5vC7PqK4h+r4wg9+0w9?=
 =?us-ascii?Q?JDVWrYUZe7UppXSXERlMkmbbgVX6i8rOj+HZ/ved8PV9jN8K+WwfgNs6MQa9?=
 =?us-ascii?Q?ZUtCMlv0LDtRxOSsWD9DSSn0zYPjPvZ1vLLogu3vQztjev3NcJylbNzccVkQ?=
 =?us-ascii?Q?zTyyulq6tgUVr7m+wtQ5EHwbagF+0PV3Irea+F/YwMu9iLWE84phEHbLkf9o?=
 =?us-ascii?Q?4I44EMzfIuBG/wWAyBcgpJUlph9beVuh7T8gaS2FyckHDMg+XJfup6tnkvR7?=
 =?us-ascii?Q?Wv3gEmw2NuKILx40iVBx7tvUybFuZ+uWRyNvEGldg8QmykAemT0FXi+2jfCX?=
 =?us-ascii?Q?05ols/9eHPfml7l+YWkRC9CG9gOKLKV/SXbJPBLS9X/Zpl2fLOejwuszJg6d?=
 =?us-ascii?Q?Gd6GwGZ/WI9IGY1pjhPftdnqkwyhHbafvTTrcXfQNN9d2iuI+qOfncGXuP5x?=
 =?us-ascii?Q?VF5yhnxVuf0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dLaP30pda843DGanYo9YQNidQ3DPEWJPb6V0wIbNzuRghVm+vksDe0kSXEcb?=
 =?us-ascii?Q?R040w/R1KjND5YxbHA+uvybPtxQN+LZHwJBkQrDqZKB8h9Ppn8Oewo1lMo+/?=
 =?us-ascii?Q?vJACIKs1qCr/3iGdROS+hQeturySaX8jNYrM+Hn7dzGOxWZL7o992pA+AWwJ?=
 =?us-ascii?Q?ivSCwbi6QQ8g8OC6rek6DBI/Z9d0bcgvFPWlHGkUrAzOsaUWSW218uOQr2aW?=
 =?us-ascii?Q?GJG8nvLqnlBd1nUBf2pKoDXD0nQiSyOZw0oEqIbbsURMx/xBNXdISAumTg+n?=
 =?us-ascii?Q?LnPUN1NbEMP2LVxfzsytLuxSUOR0yeOHQRWVg/vz4KCVfBDxVa53k+8nmlCT?=
 =?us-ascii?Q?HwPsSVQQlUvSn+5ATTimyMrWDZEBf6YBT8LTukoW5d7K0OF78hmslAGCLW21?=
 =?us-ascii?Q?Iq7vF1rVqoYnCHft4RwMUE5LBWKavD1KPRxh1NRJ2Tj2ghAYnY4oYT6WARet?=
 =?us-ascii?Q?ioGzUkSgK+Hty92CaULHeM90qOapLdP0nhmOqAXP9XZ8uPr6IYGZDRvmxOmL?=
 =?us-ascii?Q?+ZjmvrvXqpEM0mOVSzoAJhkojM4Xulu/n/RZ00nhVeSGbn+u4/Sq+CSyqgfx?=
 =?us-ascii?Q?KKAfAbAnvS+ZfoPhvdQShVlxWd5QOKL2Xdu6PXxQtCZ3ftVVUsYaW5+bwCn+?=
 =?us-ascii?Q?Hk6LkVXbhhgViVr2YMvEKMdLCyJTj3mPl7a1VwzQWKjebnEFOkMtJwhWe201?=
 =?us-ascii?Q?zJp1uA6z+H3YV+VRxeKh2FsefDONPSOXuqBQ1qsg5iO6oWsPmk9q1TPhHV1e?=
 =?us-ascii?Q?jLtXOS46KV1lpXs8G4kt8ij1kryrpXmRRLHdTT0Zf3RijTTpp86uuSrSDL4p?=
 =?us-ascii?Q?+0gP+NXPpVtyhbo0592fZUHDae+hSjJwjDma4fVfrDQMBDsKezPiFz9au5nX?=
 =?us-ascii?Q?+Jc4spkHDrkR3rcZc70DG76qdR83s//fCYQmyOkgThLHoBrz5SbSoSDzpT8f?=
 =?us-ascii?Q?s1n29+8514Ox0y8QCinB/Vow2YIwimYXVjfFU4Ce6GYFFqmwnZG+J3vyQMU7?=
 =?us-ascii?Q?s62N35CKVWMUjhyi/gCRdwqFdRs55g1nScA4I9j1RqUxZxrTdmbhHU5PkGtU?=
 =?us-ascii?Q?xKT+T5fp1hnRbM31tmXkfkwGBEprl9ZInbPOxwqp3bWZhMkQZWePLmsV4/wD?=
 =?us-ascii?Q?Wdo1ppz8NveQcka3fYz0RXHlrI1C8vpFQmiZwXGPCPXuiya1undgiGhTIRgZ?=
 =?us-ascii?Q?rAk+BphApnrnyRCJgIxp2y6iQmUU8pLklxVROTS0ViCz/x92Irz/fIEaeD87?=
 =?us-ascii?Q?/2SeIju7RV3PBd+Ye1K4PzMJXfZEDAfN1ypCqp/uN2HOksI047RR+s+1tz6s?=
 =?us-ascii?Q?msfmDVaiQVVSNKkPXuQVnV6AXUyzZrZ/3QI3NnCa4dyrOZUJHhz5V3kgJlQj?=
 =?us-ascii?Q?JHsF4mgAHNeEuz+vvAmcRf8gtOZwT+7Uu3CYuSRqzGxXq/q9v7gSNjd06j0t?=
 =?us-ascii?Q?Ir7dt41dEYfp/1N1Ydu9V6XsFhzLtrD1xv3Wl5NODNrlptFnNTKNHvQFzWDX?=
 =?us-ascii?Q?URFWUuu6XkdI3APkYglcYwj1T3lgUTCNL02L1UB79ZUdcYCq8xW2GVL9vgVg?=
 =?us-ascii?Q?HuT0VPqEggyw63exyRY4UwQu8m/tol8x6X13i+25?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 301b30c1-8666-45c1-a4b0-08ddbedb952f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 11:27:26.8970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xh72SXNW/Rp/+eyY5Qbgg9Q9Y85UgVfUqQdYN19jY5ZqVkxdxl33/Y8dGhVJT800XjggSNJvmvAJL4iytG9k4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7830

Extend the list of supported compatible strings with fsl,lx2160ardb-fpga.

Since the register map exposed by the LX2160ARDB's FPGA also contains
two GPIO controllers, accept the necessary GPIO pattern property. At the
same time, add the #address-cells and #size-cells properties as valid
ones.

This is needed because when defining child devices such as the GPIO
controller described in the added example, the child device needs a the
reg property to properly identify its register location.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 .../bindings/board/fsl,fpga-qixis-i2c.yaml    | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml b/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
index 28b37772fb65..e8981f974210 100644
--- a/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
+++ b/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
@@ -22,6 +22,13 @@ properties:
               - fsl,lx2160aqds-fpga
           - const: fsl,fpga-qixis-i2c
           - const: simple-mfd
+      - const: fsl,lx2160ardb-fpga
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
 
   interrupts:
     maxItems: 1
@@ -32,6 +39,10 @@ properties:
   mux-controller:
     $ref: /schemas/mux/reg-mux.yaml
 
+patternProperties:
+  "^gpio(@[0-9a-f]+)?$":
+    $ref: /schemas/gpio/fsl,fpga-gpio.yaml
+
 required:
   - compatible
   - reg
@@ -68,3 +79,27 @@ examples:
         };
     };
 
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        board-control@66 {
+            compatible = "fsl,lx2160ardb-fpga";
+            reg = <0x66>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            gpio@19 {
+                compatible = "fsl,lx2160ardb-fpga-gpio-sfp2";
+                reg = <0x19>;
+                gpio-controller;
+                #gpio-cells = <2>;
+                gpio-line-names =
+                    "SFP2_TX_EN", "",
+                    "", "",
+                    "SFP2_RX_LOS", "SFP2_TX_FAULT",
+                    "", "SFP2_MOD_ABS";
+            };
+        };
+    };
-- 
2.25.1


