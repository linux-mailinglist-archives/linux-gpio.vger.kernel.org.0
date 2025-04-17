Return-Path: <linux-gpio+bounces-19025-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82507A92154
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 17:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFCCD19E6E28
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 15:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B5B253B48;
	Thu, 17 Apr 2025 15:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Sp8mDSGY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013052.outbound.protection.outlook.com [52.101.72.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFF4253956;
	Thu, 17 Apr 2025 15:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744903335; cv=fail; b=t7zyiophudPp6XZWcwc8mt44SDhBw8W+/1WoEkycJEHIVyC0wjzt9CCb403sBnI0ObSbDL7lGyJRccvTWMSqD8d6XcoMNQx9NRLFGLF2zaQAb/6E2ClFcRygqwdAh+TpAwClywnYyy7K7Cb9bdDVDbSnj6eyKJZQ1JkzGoRXFls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744903335; c=relaxed/simple;
	bh=AyBUkuQ9oxG8Dz0ValmA+JpQnajzBWSWY+a8P6EM1xA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=VVGCQadZeKBT9dnUMvLeXZjoPejxzzDCQmrYf35xCjz3mhEb/6WaTC2mlbwp242BwHOdjgN3qsGhv/435gJLLjrGDvx8loqpv/9P/ykcjWjZAJfedmklBhcJQS86Pu5TObk7Z50TFhbX85PmLwQSKI02fiLWmgd6/LxI3AzwPWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Sp8mDSGY; arc=fail smtp.client-ip=52.101.72.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=flBFb12JjHimTpAsQ6inoRGfoEV1zCfi3hSGAr0OPVpogJP8XwfGPyXVyvxqQddFhx3xvh3LpE5Dhhvi/h5hKcvlwJM3vs87WUizPYagfGnpgPvvj1D6gRl4XiUOjom+QMwKnPxrSSgWJc4Gd7zD/udUNBpi7ZAGxdIDNOjmYCxUcviPQk93Z/gZ5dPDJOQceSUXAYz4jA16qSgCTljEBoGwljkkg7ZJxerbrbXl+SktHhUTX82hBeS78AceauSpHBOqVh9ff1AkJSEhDRflt18WQG6SEDviiU3FFbNWSJWAkOCOspLOO5J5XN2g01+lmDiJDRcjtiA7XvBTasmZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xh47/kmzeluCVRQWijIRoXKOi78khq+DmtGQ309Yamo=;
 b=GejoeXNYM96bR3b/kVbPOX769V4AqxOtyBnFgDKh260OiFBE1Gt9a3z7B72hVXfaI1M0aoMbn5OAwqqO6uhflMO2z5JNxJIoKzJjlC96cUfzArrpfmCn5V2fbwznsnnw22LB5WNvJRLFOQTvalJlITxUeFGLBTQgCoDG09EH+myqJ9Y56WrHWaER/fACgsqUOT70V//Shx6IyhPnr8mIFCF8fXnpG1kkTQOrTVu2bofImyupiDF90iwlUP5VxEehexq4ZBgZLaRQlNiFrK+/rH5wLc6/C/5wKltYG8u5iP4roEQnK1jNpDHMCqX+lsPA5tZm12akO+fQPCF6b3WiaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xh47/kmzeluCVRQWijIRoXKOi78khq+DmtGQ309Yamo=;
 b=Sp8mDSGY1PR0xEDpDcuM/fAim/HcjG35/XMIFWN49/Tj+MSUrryzlnsBCpNIarSxsmHA6mXk0tOSWaFbXDKMrlwxRsG0qe4XedU5PiwWCxknpGrCXgw9uVjwEytqU2/azbGQhxhuTHHoIZHE7OfmbQet9DNBK4lcbK1LJPO4/cGMLgmZCZDPZ1N+/NGJf2aFtMIAeABiRfwCRf1v68dAY9PgSBijGEkGfVu4UWwscUzFO7rkpsDbFLYCraIAQZEyWbBmFWl0zvHqM4jU3LUmdtATfgdjVsrlj13SfQXisegB//+6XpVMKoihtQ5H+MAHwSHsr+9R1gaUNWUBTq88Lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10957.eurprd04.prod.outlook.com (2603:10a6:10:584::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 15:22:09 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 15:22:09 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-gpio@vger.kernel.org (open list:PIN CONTROLLER - FREESCALE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: pinctrl: convert fsl,imx7ulp-pinctrl.txt to yaml format
Date: Thu, 17 Apr 2025 11:21:57 -0400
Message-Id: <20250417152158.3570936-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM8P189CA0006.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10957:EE_
X-MS-Office365-Filtering-Correlation-Id: c02bd4b4-267f-4b35-c48f-08dd7dc39e96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8YEL5BtFItLjJBfx0BmU4Q1qANiP3wfIEcfaEJj36VEZiLajfTB20fxy/fNz?=
 =?us-ascii?Q?F6PYMbvu+QcQsNrH91HUP7xjZhrjffodyrDWuc/z7g86nhRfvVV6DVHSp0KV?=
 =?us-ascii?Q?sQTDDP5ntxlbXNIuLHIb0lzw/aIdV0PVOdsFjp8UTKnNL49PPgkUDa2XzKjV?=
 =?us-ascii?Q?GD+eNkDD6JtQLAAfa90WMvwf2xIS6xIc6gbawtAK1V3YsSgGv46zpSHPr56K?=
 =?us-ascii?Q?ORsHHTKu9mv6e9UrmSvY9TAcyUedCPYBXXgBdxLijdqTCsP3dUW6G8GSXBnq?=
 =?us-ascii?Q?XCpNU7rHVnmR7pUGSMGta+DJhgPq+rLMndgGRkeOFLmTIw8/zBCbdvXyqYTW?=
 =?us-ascii?Q?wL8rFKybES9IfX4iYn8GOiIzV0LLzaNuA7qrp/RxRLlewG/C3ZC33j7Y5cpm?=
 =?us-ascii?Q?9b8nuT3Zm9cfbiNrQV7kHYFYQvaUzOQUbnqZsfX3gEXXu+dxVcFpIv7v0/Sb?=
 =?us-ascii?Q?UTHHvHouXgOb3KArg9P++cQgaFhCmECrx17ibSI4SV9zZixPMQp0eb8Bf+FE?=
 =?us-ascii?Q?ZRKbt1ymvkccwukca8i+5koL/4UaUBCdWyt2yGbNyROId2LfpaGkCm25KJTg?=
 =?us-ascii?Q?ro97sNmNbqSKk62TchNm0wAxtahzTcrVxslYeT6AaT7JMgeEIpCXi5RjEufC?=
 =?us-ascii?Q?StRJpCEzASv0ZmbEywuhAhKXlvPJCqzGDo1Igrr1fa0PD9/cHBb3qLk5g1DC?=
 =?us-ascii?Q?0aAIBtAE99u4oYgjJSLQa/83g1CLRpS9inIme7W7M+Y9hJ1GHgP/HpbbuoPB?=
 =?us-ascii?Q?SjdTJbkob2WIVJd+5EPaKVAzIQLSJdeBol22JZc3TCeWIaK4NFb8mK9LQTam?=
 =?us-ascii?Q?j2bn7Yt/nzMpwsQGXHyVpwHKCCD3IhgevQKEsRdno9KLGGjb6xo/CWFXdREy?=
 =?us-ascii?Q?FLlfPdUGdb15azRLBjjUKdMOBz6dUtqxkmdd9UMb1QBn6GzdbSBDdCV2AkM8?=
 =?us-ascii?Q?TLzHfyjMoxcdW+SjSQVKL7Hw/BFS813GrDnXY9KAuc34nE+vPhISq8jT1rTV?=
 =?us-ascii?Q?B36K8Sb9eDvaGmqaFPzdOS+NnikOdlvJOwD6vqPaRYaWCFRbrliCaGiRFK3R?=
 =?us-ascii?Q?kjT9ahDP/qj6nFMEFx0VmY6LaH9dBwUDGMsz78n4QCpH9v+K6eYLeCqTfEK2?=
 =?us-ascii?Q?fTMM2ILcW9Q9Hafd5hOsWEEq4UGzg7cgTceKaIMA9WPfRFuhdTcc+cFjI+lR?=
 =?us-ascii?Q?kOVFVQ6lIoaBm1krrNEye1R/Va27bizsKWqC7+mt/PTcST7sw6lddtVhu5ay?=
 =?us-ascii?Q?d/hbSxxSwBiIqbwHL+s7Bu7vTT8DKEeY1DJryvrCaI/rDB0CoCpHoeLZL4nr?=
 =?us-ascii?Q?mwOm8Hp/SvFcmrjSvlG0cJ5urHNqwhgQhWburwgyuokRnuPJ/6hfwbrA+BC+?=
 =?us-ascii?Q?XP78LXxehoF030kGNvp6nKqh8C08gu/VMwsgIZtWXaxwSDgn3c8GNDij60qL?=
 =?us-ascii?Q?V3g2BSWifSMUTohDGpibDcg/GOmrZ9+j?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bQ25SCuRQBRq8d52gao1YTuVp3pxntXRZah6aTrcb+uEfUNht9wOhVgjQ7S+?=
 =?us-ascii?Q?45pDOquQnXuHaO6Q+rKA4AVx/FMcxqNgrCZi/xtjYV7o1668lxMyOmPDranj?=
 =?us-ascii?Q?6joOapUXjBgEFU2KCvtSTYGvPaAmnwuriIP7Mx16pVrSE/ZU+1pfdCCkUfUN?=
 =?us-ascii?Q?1Zi04bU1ZrTmt+i1sPMTsDx6tVu5iW5n1u5F+nmT/dI+mxqpP4lRZfk+vXgN?=
 =?us-ascii?Q?Q4I1LViF1ktt9uZU3G4hPYI+FSxvhdI1qP6Qv8mIhdfFJMx3n+JUSd17NnTi?=
 =?us-ascii?Q?5uIop5Hc7Ozct/g/tt/hiltaZODZqdwnCFqjTzGiJJE4ZnsGQKsr94/e36ni?=
 =?us-ascii?Q?fBtS3mjWF26pmBOA9OYSMOOn5KcWEq+0mXi9ZoX9nURe9iTYTv1OAxByt3lK?=
 =?us-ascii?Q?8YKQ65msOHsPsctpQE+Ru8l6zofTKU3yVKwUjtsDfqQijX1LyirCKvp8StHE?=
 =?us-ascii?Q?VRcyW+a+rhWz5xg7UEni6NhoTKzaExY5NkKTFyRRrW+dfG1H6vMw94kIh/Wj?=
 =?us-ascii?Q?zNZO3DCrLDf3zjBaeT0/4e1rq67rnZW938OWS1gEwAJZig22xb/vU5RrqKQe?=
 =?us-ascii?Q?H3m3cc8itx5PQVRS6/wb9qOdu+QznbVCvZKSPNPa0Y+cmgOA18K7baeV2Nu/?=
 =?us-ascii?Q?6Wx/0qwiDDCYx7TyN19bimiNccp29LJLL3RkVOXC4+1grxoL/Xzlr6xgREAF?=
 =?us-ascii?Q?H9g3DhcYgbV4rdnMOzga5Yrboow4NA3zFDTt/6mugAwaucKWPxYFseg64Hv+?=
 =?us-ascii?Q?hUfx/bSLuAQne8+652ncpeydBC7Vo2rjlH5dVpTYjF5XJh0803oT2WZh6D73?=
 =?us-ascii?Q?NBIVPdY3pFA8vSOCi9i5vAZA4UtzQydeyUWTEv1sTUWsjR7SNiC5zdM7lAo5?=
 =?us-ascii?Q?fDLDQ+U2xqxlNxxK8YJPBWjo/9nd49D+5Whi1WRaclZxEGybbpEpEozvtu0A?=
 =?us-ascii?Q?ONJM09S6UJGLfxf3Q9fP1dU9XWBxncioODiMEhQU7bl9pWlJ15bwvNU9pOra?=
 =?us-ascii?Q?XoCqqe7V1zoccfqxXdXetMoRNdztd8N/bcad3KcwgIxBgSjNL904cztHg5Je?=
 =?us-ascii?Q?R5IPIewROPOmEipTQ9EM2ruwbeHwqCJ7N3Fj4/K3+10wPIf5qGo71R796Aer?=
 =?us-ascii?Q?HGNB8n/a+ajxuqHkEh1ELkOdNEP4NyFttgFjuUchavHGCZVkpYlru/gyMSGj?=
 =?us-ascii?Q?+VhtQEaJGT9622NLdPqpTaKRpyjEp2QQHHN5lB9V9lNvXcgu9QJ4L1yMbkzK?=
 =?us-ascii?Q?yqzTYw6Kn4I/dzNSlUpq3FsZVXNs/WB2n9iiMIRXh91nU12/FIh+KjElZLwA?=
 =?us-ascii?Q?piH0uWTBMlaN6oBF3+ZfPuP6eNVGnFGZnAFn6WF99tm6S8xRMOnzoFDmUHVi?=
 =?us-ascii?Q?5k3mVmUWuSSD3U6F/Wneya+Ssz+MJS06gTzE6kR4uXzDbyDjbnfEarUHuqEA?=
 =?us-ascii?Q?/hmxc0X9Zs6U3gxrqztMrshLCyIeBbHIa882SuXA09X5eRP+NWluy7HlCyxS?=
 =?us-ascii?Q?RFSg6+sn3r8yGH6+pyKTqva5K25zgXnj/E07XnRWGeTcfowhRUP2xzp7tMd3?=
 =?us-ascii?Q?0hXjNSSCEBDCW0UX6bwCtTSwcT45RHHdNsOwlNg4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c02bd4b4-267f-4b35-c48f-08dd7dc39e96
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 15:22:09.2340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KgtJCO+eXC2jtEOkNIiMFCfx4wpIcM89omMM8mZsSpgqcAUdZPBNe6dTbirSKP6IkyhEXrHOuoUBwMcOB/PkxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10957

Convert fsl,imx7ulp-pinctrl.txt to yaml format.

Additional changes:
- remove label in example
- fsl,pin direct use hex value instead of macro because macro define in
dts local directory.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/pinctrl/fsl,imx7ulp-iomuxc1.yaml | 99 +++++++++++++++++++
 .../bindings/pinctrl/fsl,imx7ulp-pinctrl.txt  | 53 ----------
 2 files changed, 99 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-iomuxc1.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-iomuxc1.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-iomuxc1.yaml
new file mode 100644
index 0000000000000..957918b73a93f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-iomuxc1.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/fsl,imx7ulp-iomuxc1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX7ULP IOMUX Controller
+
+description: |
+  i.MX 7ULP has three IOMUXC instances: IOMUXC0 for M4 ports, IOMUXC1 for A7
+  ports and IOMUXC DDR for DDR interface.
+
+  Note: This binding doc is only for the IOMUXC1 support in A7 Domain and it
+  only supports generic pin config.
+
+  Please refer to fsl,imx-pinctrl.txt in this directory for common binding
+  part and usage.
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx7ulp-iomuxc1
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  'grp$':
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+
+    properties:
+      fsl,pins:
+        description:
+          Each entry consists of 5 integers which represents the mux
+          and config setting for one pin. The first 4 integers
+          <mux_conf_reg input_reg mux_mode input_val> are specified
+          using a PIN_FUNC_ID macro, which can be found in
+          imx7ulp-pinfunc.h in the device tree source folder.
+          The last integer CONFIG is the pad setting value like
+          pull-up on this pin.
+
+          Please refer to i.MX7ULP Reference Manual for detailed
+          CONFIG settings.
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        items:
+          items:
+            - description: |
+                "mux_conf_reg" indicates the offset of mux register.
+            - description: |
+                "input_reg" indicates the offset of select input register.
+            - description: |
+                "mux_mode" indicates the mux value to be applied.
+            - description: |
+                "input_val" indicates the select input value to be applied.
+            - description: |
+                CONFIG bits definition:
+                  PAD_CTL_OBE           (1 << 17)
+                  PAD_CTL_IBE           (1 << 16)
+                  PAD_CTL_LK            (1 << 16)
+                  PAD_CTL_DSE_HI        (1 << 6)
+                  PAD_CTL_DSE_STD       (0 << 6)
+                  PAD_CTL_ODE           (1 << 5)
+                  PAD_CTL_PUSH_PULL     (0 << 5)
+                  PAD_CTL_SRE_SLOW      (1 << 2)
+                  PAD_CTL_SRE_STD       (0 << 2)
+                  PAD_CTL_PE            (1 << 0)
+
+    required:
+      - fsl,pins
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pinctrl@40ac0000 {
+        compatible = "fsl,imx7ulp-iomuxc1";
+        reg = <0x40ac0000 0x1000>;
+
+        lpuart4grp {
+            fsl,pins = <
+                0x000c 0x0248 0x4 0x1 0x1
+                0x0008 0x024c 0x4 0x1 0x1
+            >;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-pinctrl.txt
deleted file mode 100644
index bfa3703a74462..0000000000000
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-pinctrl.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-* Freescale i.MX7ULP IOMUX Controller
-
-i.MX 7ULP has three IOMUXC instances: IOMUXC0 for M4 ports, IOMUXC1 for A7
-ports and IOMUXC DDR for DDR interface.
-
-Note:
-This binding doc is only for the IOMUXC1 support in A7 Domain and it only
-supports generic pin config.
-
-Please refer to fsl,imx-pinctrl.txt in this directory for common binding
-part and usage.
-
-Required properties:
-- compatible:	"fsl,imx7ulp-iomuxc1".
-- fsl,pins:	Each entry consists of 5 integers which represents the mux
-		and config setting for one pin. The first 4 integers
-		<mux_conf_reg input_reg mux_mode input_val> are specified
-		using a PIN_FUNC_ID macro, which can be found in
-		imx7ulp-pinfunc.h in the device tree source folder.
-		The last integer CONFIG is the pad setting value like
-		pull-up on this pin.
-
-		Please refer to i.MX7ULP Reference Manual for detailed
-		CONFIG settings.
-
-CONFIG bits definition:
-PAD_CTL_OBE		(1 << 17)
-PAD_CTL_IBE		(1 << 16)
-PAD_CTL_LK		(1 << 16)
-PAD_CTL_DSE_HI		(1 << 6)
-PAD_CTL_DSE_STD		(0 << 6)
-PAD_CTL_ODE		(1 << 5)
-PAD_CTL_PUSH_PULL	(0 << 5)
-PAD_CTL_SRE_SLOW	(1 << 2)
-PAD_CTL_SRE_STD		(0 << 2)
-PAD_CTL_PE		(1 << 0)
-
-Examples:
-#include "imx7ulp-pinfunc.h"
-
-/* Pin Controller Node */
-iomuxc1: pinctrl@40ac0000 {
-	compatible = "fsl,imx7ulp-iomuxc1";
-	reg = <0x40ac0000 0x1000>;
-
-	/* Pin Configuration Node */
-	pinctrl_lpuart4: lpuart4grp {
-		fsl,pins = <
-			IMX7ULP_PAD_PTC3__LPUART4_RX	0x1
-			IMX7ULP_PAD_PTC2__LPUART4_TX	0x1
-		>;
-	};
-};
-- 
2.34.1


