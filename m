Return-Path: <linux-gpio+bounces-26158-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA41B57AE1
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 14:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13B23162AF2
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 12:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7665230CD95;
	Mon, 15 Sep 2025 12:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Dsnl4HPt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013043.outbound.protection.outlook.com [52.101.72.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EF530BF76;
	Mon, 15 Sep 2025 12:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757939098; cv=fail; b=mj1yifdIQsFact8Q1MDB/u3iCfK3fXdBiP9krxqZbqMYC7HBLoVM80w/UlrjlPnB8pP56Rx0yGz9NAv8F2kiHia2AezylxrZhj43qSjjzPNieforMZ4lpwbViR9ptKC68m402cg7ut12zhL6BTvTgsS3/U5ngJmhW8oJiQddINo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757939098; c=relaxed/simple;
	bh=Qk+M2gw1BVPhyHmvCI19U+zqm9w+BKTHb7sOgHxsXvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dvXVvDS1YIFcIqzIUYgJ8avkcHjwvAa4RgevPRxmCDEgMse0wKgRIDpkbNCJhpoLYkmYoy9J2ngbY4PjYsBI2V7EMnsNTiB6zx14uBqSDDJwSmQTQ0ak8kBQ5XJbfuQzqDYBU7WLBao4psyBSP5Nm+vID9VCqhuzwQ1N3rBZ8wU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Dsnl4HPt; arc=fail smtp.client-ip=52.101.72.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AyTSnqtiGfVEP40Tzj3DzuvCvxfoFz9WVQYyaMGLLOdoPzsw7exjrJvIZN8HWZEplwgl6xT3aa2OhoamNRSdlsBM+LooI+wYkaXAqXU05XWh8H6cjJVnUFKzmmMBZcfjFrP/+7KITPPhYcFM/d532XAXwW6uCikVF1zrcwtYgemrvjhtomsKYdiHBqz8QrisiLRW/1SSvhX0mADVSQDwBNNJIEsrI/n52mFP76iy7uH/aPpCHveAq2649Pu7QYSaMs+Iz/HSSgnDH9FhhazEiWaZ7PNle4kz5jmhnU7MXyWKlRha6fuhDf5B+Eq4dYCiQgLHCAs+Q0ubOuK7MDt32Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0cibkuTq9SHEJbh2EYRF9sp0jPUwRTNxPxIAQ08fkE=;
 b=YvuMcQVbhvkSqfd8lCZo+bhiIMzmHfQfek/4GQMNtHyK5chyQKo7UFy2XUBCwk7MHxEC5k5gaqV5NUhySkCuo5ov4jnx14NKcwb8P3uaThC32/Ltw5AEaIQzzvI6BwnnnWxmS44dEx8s5m3XcFp9ubqp5efO275nNomzI5ylN3/YGaFouyYW5hNfqD5KdWbB1qnf1XEP7MNqGQJTsv7iFVVIhva3AmVfpYR0qUEP7C54rEwGrC1/yqjlB5lPM/Sxzv7d/wJEYQujFdZHuzIjPf/lkjHAJmQnaGqVblHtDbal0tVMxRR/rgRrpQXACdJotFXEUvfHO2sAOPgk5kkQOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0cibkuTq9SHEJbh2EYRF9sp0jPUwRTNxPxIAQ08fkE=;
 b=Dsnl4HPtTXbDACa9lQFtLjwrwyvEyQyDrnYj9JrYyCd0DINRd87UMI0lWw3OkmocnxC9JOf3PCUD4lGRDLHGWa7qvI5s0bVycnlsFEwnHr5mJxU7ltz54c82iyR39d12JYJp71FLV/Ywy3mahwgJ8bukfZ4AVum/EPGdxfIrOvIHVygTR6nf8kjvUGkjfsZtRioijxwsYBrvYvs2aBYl9SWnsTdsD9cZfTswXdahY68vk5l2YF//E7ukGWkAB7tDDdvi93hmb1Pkkp0ZUVwy/WdDeK70UVZIfcl7Y0uvPiDLs1tuV2V3xGU73/i2xgmvjluiqie3g0xzCBhUNq4wWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS4PR04MB9291.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Mon, 15 Sep
 2025 12:24:51 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 12:24:51 +0000
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
Subject: [PATCH v2 1/9] dt-bindings: gpio: add QIXIS FPGA based GPIO controller
Date: Mon, 15 Sep 2025 15:23:46 +0300
Message-Id: <20250915122354.217720-2-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915122354.217720-1-ioana.ciornei@nxp.com>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0028.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::38) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS4PR04MB9291:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fac5981-d618-4851-41b5-08ddf452de62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CbF2Ace3vH0cMvmn4THr4bDeAkdUdvhNYRknCQXN4PgcQ2ADo6JvYCxrdVFW?=
 =?us-ascii?Q?6Uvf1zHHvvpqBtY6cegSQwOoF10f0nen0jJJsmvdNn98PlpDqyhL2z91G/0f?=
 =?us-ascii?Q?rEVGs8NWcD+HCNYWnRhfhSOsJJfQN3NByT22Q1z68Ao6+8Mq7vR6a2a8CffU?=
 =?us-ascii?Q?XgpT8lsVlYQJTiOyqcN2Sn10QMvav9sr4ca63jJauRh4W+B9HSuvN0VHBX5T?=
 =?us-ascii?Q?puyKJF4BuBVpz+WhNEuFNl2r0sAI8K3RNYyrcqtoS6/c6J15VvfHWsVprkzB?=
 =?us-ascii?Q?MBDwn3p9kQyNEBY4gI8SNRkM9PLNdEqqlfpPpz54eq6C2lT5GIqeBnX7ig2S?=
 =?us-ascii?Q?zVVjiyLKAn4SyvXPuMPFbZ/DpxYJZCJ/Zl87hulQzV68gVTYskUZBLuH6Cns?=
 =?us-ascii?Q?czjBr58mZRpFh8ETo+Qmenz4kmfnaX3NiLrqgC8EjT/AfR+9sFt0m+gf9WAv?=
 =?us-ascii?Q?pZDixakOcC5vSE5bxwB7SqjA7xoBE1ZBKC0wqZBmyjWuPeMt8gJkwXadQmz+?=
 =?us-ascii?Q?SoBduubgsrAcGEnTHSK/Bi34sLIyR7Tl42FNmshrP0OA8xz/DHc/l98a+3rp?=
 =?us-ascii?Q?gH3S9/2un3lTwfaYspPoRTUcoLaA02YPvDy2bXIVLRDSIJikfdaLSuTt9RwX?=
 =?us-ascii?Q?cEVtqXJXW55kdbeFva63xuXXTo6jDaCsnXqn66aVjOK22kMKP0MIDUgLcuAU?=
 =?us-ascii?Q?5n+oODw0Vs9PdmaA4Na1CpTKwq0c4VB1ZUN2VxtawzXBpPQJwpASopOPnW/y?=
 =?us-ascii?Q?woej3k3sN4oliegj/bRTgEijJvBHJweOGasxURxk47e10s8kzWgaBzD4HJpr?=
 =?us-ascii?Q?cfwP/KNXiHAvjzWLswyQj2GR3KWqk/Dh5LI/ZPCv9A8pdPbPsu1qDEV7k956?=
 =?us-ascii?Q?Ej9yptX0HGyuJL5RNEjBDNUTPUF8bHpmwP3wSbfVM2Az/lWnmly+A26S1Me5?=
 =?us-ascii?Q?j2gAQxWx+oRsO61JXLNmLiQ8ZqztE80e3gkkQXRg30ezpcRUqYllPtKDlgsW?=
 =?us-ascii?Q?QxXRxcRe+bWIxXYxTs19ZE9YWpie+H0G6JdUzs5pSigNQuFb3Uh58tgbwAhG?=
 =?us-ascii?Q?bdjehKraHHdioO9er/6dNFWh3T8WjU6h8ain7CFi5XmoJ/j9XYl08SdfxLer?=
 =?us-ascii?Q?+uK7lZuXOQLzWTFVwioKdxl4INlZypCOD1+5BsRGXYsJeppavY+UYnOCD/Wr?=
 =?us-ascii?Q?oUsc1aiRgrTiWT0a1br+DhKfCJiOhy00mztOfDuDIJPcI+Ra6An2QqIDekUX?=
 =?us-ascii?Q?NFqx3pEg3824MMy2VMS8UZVJjX51uqjOhGiQcJ8sRLewhvEcjEQvsbkTbSXZ?=
 =?us-ascii?Q?zlYBGYfXO3bvhwhAoeYixrG43RI8JgYeFZ6IYlDfXpJl/vTeYHaN3qsPYQnC?=
 =?us-ascii?Q?R1lsSizIQbDQndo6qDCvTMpm2DJ4obkCoxBugdDgYHdgIMaxozFQMJl9LaFw?=
 =?us-ascii?Q?R3bk/1rS8KBSMK9FUXRGMhlLDs3SpSyt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J3NH6eyK+aOxyfqwhep0faqrQDuxRmheEpFr/21zMOAXKj/s2+169vWj1oTf?=
 =?us-ascii?Q?HqGBLPdcZVxvxL0lsWYd78md3o4EjQ/DJbVU3OdYyBS6BcrKIMTZD2JooBL4?=
 =?us-ascii?Q?yO6Ehgjtj0WuvzeytD3KT9Hqb4BHQ+QanASLMVAyUQ14KE/rGyheZsIUFkT0?=
 =?us-ascii?Q?OPElmveWVN1/Y8sB9NBt+VbxjjX/p8FQ0tzRQAtpPfC5u+hJJxetOhPCts9N?=
 =?us-ascii?Q?VAOZU4VJRMzs8uZAOA4mpDoeSMH8I0qZgIpuCPPB04FQ465wRp4mX046j/ok?=
 =?us-ascii?Q?26tiuTY65X1NDGAjugHY7QBG/i7AL5JQfccErNjXThgue/owWqFjke66lngz?=
 =?us-ascii?Q?T1ceMWQdCQHPBlzkSS+e+giPD7mYBSeUBWM/k14IsupT3S0rztYicSuxjF0q?=
 =?us-ascii?Q?+sM6Lk7iqJpcMRCYSqHTOCjrhYSsdSY3/IwDp0RNaNlA3mtaJxRHmxncizAR?=
 =?us-ascii?Q?+in+um9Wv2QZoS88vc1Nu5MgfvWC6TTFM+CXKv9bGNu37fDRvS00GiDCREP2?=
 =?us-ascii?Q?P9kFCJViQ+iNo50/x6IWssvBsbh2FEDgNsnqzkS3HaZdnEi2TZ0ZFf7AdlXi?=
 =?us-ascii?Q?T/6kbNNUU+vfhLEj1VCvYtMTo4v4jz334OlNX6g6Jz/EExkPt4C9UN1+BP5h?=
 =?us-ascii?Q?ix9PZlfYQThEEloxeBKKz2wXG9uvtjwc9LH68OV97vL/Nd4Y5IyNZDE11gBY?=
 =?us-ascii?Q?v0XFV+xNRLCUu+s747DQ3yf9JLBqJcUSXyFvabcSipr21xH5w7heT29xNT1Y?=
 =?us-ascii?Q?uCmFZXbJ3Ep54SXmW2Bcv53updKE3m/goFroq/8LtIryw/zJuMKBDT6wgZg1?=
 =?us-ascii?Q?6hKddABxpeV6mxnxrT5qiEjU2Gg04pnOjHd8AWmFv88+s8+Fj/XCqsFDxTMa?=
 =?us-ascii?Q?B6BDd8vPwN2oIzp09sBe3HjK6z0rsqo7sTgwYhhDfguIL4LUgV+yuDpSmD04?=
 =?us-ascii?Q?DPZHfCDh00ED2AICgpuU0lXvxStQefC4s/jWPB1ZinMK+nElRPLO1ystueQP?=
 =?us-ascii?Q?AmH0SeXlLyUVvfw/CsqYgrHrO6tVlj+XxzkFqAwl+2B4poCnp+551JiONOA1?=
 =?us-ascii?Q?XFy/hWtuKP5D1pXOKLMJNOULSJOZsNvrlOVlCo4inmTJNDNqgJN13UApBQ1h?=
 =?us-ascii?Q?IMubOJN9vwmDDY9CysGpDMex3Vvs4l73OcWO23L0nK2A4ozNIMajSu2DYBjG?=
 =?us-ascii?Q?pWbYjCDYbrBMSkPOxA9iV0wMgH0D7Inr1nmgvkDRs6YaCm6fUU39CoVqyVbE?=
 =?us-ascii?Q?XvtXFxo9hmh6Fq77hr79x/LcnI5XDSDX2D6q/ts5TLg013FxBYU+fGJ+0bGu?=
 =?us-ascii?Q?5XjWpQXJdR+hXfKsZY9EEZ8B3lXK0/uq3QS4EQbM99jneUOgEtPsyDu76c68?=
 =?us-ascii?Q?mxPjurbi+ZjpAU8F2iOrsJQ1aDK2wI82l309n8qr+T3J/kT/ZapbB76llyG6?=
 =?us-ascii?Q?ZIr0I0gZwIOKuRT+E2YdNT6OCHkuapvw5WO6afYbZHjyH0d3vYZowgWXGRtr?=
 =?us-ascii?Q?1aVHH2f8HD2bxg2nVha8LTKAxZ0/z0Z8qyDN0kN9arXysA/XDKIQjXBC+65D?=
 =?us-ascii?Q?bmoMTsS2SiNXYp59QdvwXvIrqezRrmNJd5l7phJf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fac5981-d618-4851-41b5-08ddf452de62
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 12:24:51.3603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CcAy7tYUX7i+4N1hXYQFHJTRtzWKIkITt2woafLbqwUrlU4u/g6yHwljJLmO04FC2CXmN3gZpp+BPWA6MHRZeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9291

Add a device tree binding for the QIXIS FPGA based GPIO controller.
Depending on the board, the QIXIS FPGA exposes registers which act as a
GPIO controller, each with 8 GPIO lines of fixed direction.

Since each QIXIS FPGA layout has its particularities, add a separate
compatible string for each board/GPIO register combination supported.

Since these GPIO controllers are trivial, make use of the newly added
trivial-gpio.yaml file instead of creating an entirely new one.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- Used the newly added trivial-gpio.yaml file
- Removed redundant "bindings" from commit title
- Added only one compatible string for the gpio controllers on
  LX2160ARDB since both registers have the same layout.

 Documentation/devicetree/bindings/gpio/trivial-gpio.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml b/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
index c994177de940..3f4bbd57fc52 100644
--- a/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
@@ -22,6 +22,8 @@ properties:
           - cznic,moxtet-gpio
           - dlg,slg7xl45106
           - fcs,fxl6408
+          - fsl,ls1046aqds-fpga-gpio-stat-pres2
+          - fsl,lx2160ardb-fpga-gpio-sfp
           - gateworks,pld-gpio
           - ibm,ppc4xx-gpio
           - loongson,ls1x-gpio
-- 
2.25.1


