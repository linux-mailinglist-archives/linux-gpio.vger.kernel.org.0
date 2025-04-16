Return-Path: <linux-gpio+bounces-18968-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FB0A9075C
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 17:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 561C11884E3E
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 15:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57C1202988;
	Wed, 16 Apr 2025 15:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YTRfTs5t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2055.outbound.protection.outlook.com [40.107.21.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7FA7E110;
	Wed, 16 Apr 2025 15:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744816151; cv=fail; b=K1pIwG2jkY3Xk/h0JX2W3WuV33bUpBopRwdaQmjwJGnWCyUVd1UPzH4EUKwNPmLN1EQlfdVmOctzjfdE5rCxsrS/owmUDGOG70uC2yA4H9am0bF2Zw0dDNxvaP0ghYy88GR0EZW0sPy7WzeT7aGTNb/rghkylq9MUGtA/hW1HFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744816151; c=relaxed/simple;
	bh=bEW7asnU3m+stoDXBfzoq+RfkwBz+mikSQ2/zuGJC/4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fPHMsN65WliMdGIWGD7VhMQtfG6gcgxFrRhmEo9HOoai2CQqC7FuW+mj6y4uz1TiJayX0dMgcU8SNceR5xqMWMdiWfXeM+ddjDpV89+KHk9DAsNkuD7MXTbGu0ijqFgz5EWbIjhr3AfXnpkao8Q6HnjxP9RPEYoM6CE+ap7BDDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YTRfTs5t; arc=fail smtp.client-ip=40.107.21.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WusB30TiwwQ0aEIsLFPhvZd95pGVRif304P2jr+oXqYEZMy5b/3Yvb+iU9W5P1oprBW7kQlR/lpxLUDrZyc+K+tJw7etAJ9A+VsPQgZ2Y4Zy/80eDMfKgxy/De3fsUrI5QNFJre16YR2K47CzWBf7Q6U/2FzIRPEMwJUKOouHu/GMTaVxBYbmzDg7atAhXZv3ZbWpho1W4odR2R/ClesskT/lMignp1U0oFEW+SmDBkb3TlM5a11iNNrDKQb5GLk5te23aD5H+FnHxqEWNY61yjmY4QjwrYaqDpzvBnGoQUmEZgnY7dNdZUulpn5DRetl193L6ZVG6Tc8sKwdmCLOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFZUCoc4/+NWa0nYe2wc/QAVxh9ul+CxlezfLqbgD34=;
 b=Dt6nRXM/QnmtVePIaIkF9VYZRoaDGWv//UlfdifrmNMTgf35zTY718z9atMyyqh584Lp+KGJ/96D6Tv77/Q7o+aaNTIdfBp4AD1FJkZz1N9wPiFjjekhWomoQKvAa4dy5qcmLwhoyDUsG+x4RxVrg2D9AIse9yNXtzQcBEzq90zq/cBT1CjULSxnK5uGQQ9PAe2oZs02EN0qO1ogWX794um/zuDMd4rkR0t3kQ27VxrsNuOVVOtWyUvNU9Pe78S/qIiGj84ZMOeTo1PzTtClZ1026KOStrzSEnZBMfO3EOG8rZi3w147TXoqIkS2FeJH3sLTj7/dD3mQQbZCY8C04w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFZUCoc4/+NWa0nYe2wc/QAVxh9ul+CxlezfLqbgD34=;
 b=YTRfTs5tSMHtapBIisDdel+b3z4DsPjUBesbPRkU6JnKl9/UgeR1j9kZ5vvpODHHWAjRtKNw2psxB2GFE35JlREBYdIlIR8EY84XqOOvfz4C8qo/p0dVFJozpOcKj0JnjYgE2tGxY8eYeK8TWqG3Hrb2hoq4PPjwJUguVYSZMLqW3tnb0mRw65WMs1x1CZOHOrkFwfmUJtm0opSdg8VLSjE047ZPYYRQ1sYR3Lun1Y24yEpQ2snBdvyxQbRX0snvPyl05f4WAYw0r/rLYbSGk0olcmzYjDxJXTYKVNHZSq47o9y0m5Ww3wpsNVyblZLvyWibJWzoX5iZtrLa6ZzTNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA2PR04MB10514.eurprd04.prod.outlook.com (2603:10a6:102:41e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 15:09:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 15:09:05 +0000
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
	linux-gpio@vger.kernel.org (open list:PIN CONTROLLER - FREESCALE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: pinctrl: convert fsl,vf610-pinctrl.txt to yaml format
Date: Wed, 16 Apr 2025 11:08:46 -0400
Message-Id: <20250416150847.3422218-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0043.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA2PR04MB10514:EE_
X-MS-Office365-Filtering-Correlation-Id: 0893d4e7-bffd-446c-6930-08dd7cf8a0c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e01hSxcltAinA8/HyWVip8tBonfnxUhFKITuNa/Ps+ZxyEZF47QZErFEs1Nv?=
 =?us-ascii?Q?5nkic2y8D44Y2ECbxITMNgGaOVJ+KQX2pZ2bR6oLegGAJv6f24ULJkMNt/eg?=
 =?us-ascii?Q?Iq4fJM/NoHJu5/JMgIK+RNOs8uj3JbwRaGUmCprDqLPGsVPYed8qRkYjFUOM?=
 =?us-ascii?Q?vwH8p6ymgEgjLiuCmToq/cVyl43MFfDZIo27XayRHN1d0nPa56DKfTtN3coC?=
 =?us-ascii?Q?WSGZ2AMcU/mx2jhgRHmKUlvhaC/t2ymO3u7N4XNj/Us53zx3lXD6u6iPaTNE?=
 =?us-ascii?Q?81eEfi6NyOh/XnwuS6z6zVsyKIb5JgMqqvWqwYcXar6ClAFy1uiuRuCmo8d4?=
 =?us-ascii?Q?spLsYTaj/lHRowB+8cNC75d4cXcfvQfLhKE6dOeEnGIGN5M3Y87YhVrAussW?=
 =?us-ascii?Q?M7Rvb/UH8rKNHihojPOqFUXJZ89fegBvhQ5akO2n+1LfrNSZxaS+BLBHFm1Q?=
 =?us-ascii?Q?qnTyvtEm0q/im+Fa3sSJLiyluFU4Ra7hCzp0SzWJ1D0HGKwvDdJtuUeoCTmi?=
 =?us-ascii?Q?sqpfSl0i7rccTap7xZTxepx8IGoMCfgoqS/8xH+v8nu77gTy2gmRDaONkzb/?=
 =?us-ascii?Q?DyiqVa6IbHYi2A8wF6IK8TqxH5rdmJpqz2+4QdlDfOihXHbGxAJdcTz9OqXS?=
 =?us-ascii?Q?SDOfthcAUVbWExF0ICGnKYQpAmTmvn918Zx4PTBFrisRbu3VOjjB+o8SVqyq?=
 =?us-ascii?Q?bYRFTRu5xgk3upQwUSoSW2rk73HE7mK2ap2jffVt/9yT7SUDtmWRkHNaCQxO?=
 =?us-ascii?Q?1z8LOiOxFS5HTfK9Gl7P+uXG0VkOn719ofvu1O4ZVwYFFl6o8NI7E3R4MSXi?=
 =?us-ascii?Q?B1vw+4AEMPftOQ313Z8GHpxF2QafZfxOHePXTtTBivoA/phnshX4UaC8u8xh?=
 =?us-ascii?Q?Ws08/gORFtWFEfWI2WKp9H98m3liwn+6rbOzrfHnk9BcXOmAw2rNiT/4Q/3G?=
 =?us-ascii?Q?2vC6Ee2ZslwJPY2gUPy2pUWO8mCbnaeRHoV3WYjbV4RiLyLN5w14Vlewxj60?=
 =?us-ascii?Q?aSePNMSZucEsyhG3RFMpDwKVEKEFboWi5MofiNK6XaRxPH/cde+cuF/AKXK9?=
 =?us-ascii?Q?DpzZ8e+6/AvMBX3bjK55xpy/b0gheUJmxT2bNrHxxzJ1Z6J/QK3fKyUvoJ7t?=
 =?us-ascii?Q?abupAL21z3T40PrwjJpKJ7lsMSfbPkhu/xhEUAFiFL/GsOS/Pe0uplinsHqs?=
 =?us-ascii?Q?LQEMKtAVzogH1w2xRuLWwcGOzAjTDmo4BzKwtGSO//RwZENVCyB8GPDfJ79S?=
 =?us-ascii?Q?00LCrMQPSvWX7LMLhyoksYKIUqG/usu4dAjXLUuU4RU7m2uZU0RPc8vddVof?=
 =?us-ascii?Q?BDLqs6H03yVcvRKk8nFZdi7PM7zIOTVTFHhVOU9xvdV2G5gaCriJutXSTmJP?=
 =?us-ascii?Q?Wg9rsSeEIh3CXGdiukXQU8kkhGCDP4qNfVzSQoP4MObTv2pxH7d0LnrscpeZ?=
 =?us-ascii?Q?egj5Gp3CL9+IcSL8wG96ZBh6sgPUnA0s?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ccahjw3hv4s7NV6Q7OQlgCRO9ufGckHmTyIJGlrRbSv2NVT0TW5ccHdGBEZx?=
 =?us-ascii?Q?0xk0RQIoCb9/WwgdP209rPUMD5fdMfHDwfoyzgnMU1L17O3+0dNRK6nXssqD?=
 =?us-ascii?Q?Fi4Y65u96Bx2Ly697ri9wUvaXScm7QeQr3d6lS4gZZ6wHLFAURsjgw8S/gan?=
 =?us-ascii?Q?FtFJZ/uJRGBrXpAJSYUAV2dugjYZxNuvzU6wj092ojQmBBs0LMur6hV4UKF1?=
 =?us-ascii?Q?WXUfSCDZb/lBWzGGNpKKGIyoJS29v+TM7LvVjlihBDqGNmL0MvQchc99SXTl?=
 =?us-ascii?Q?6E2mAZE3Gdb0VSeW8Vs5K2LfVKy8WqLy2USnJJDp796mH+U+Ze5dITJX5ZPk?=
 =?us-ascii?Q?ydC9P4c9B6i6O92I3csaIaqbSmPi3WIdzLW5ApnOy9XrGnmH8g3M8j7TlRpz?=
 =?us-ascii?Q?jzdzFRGffR+Mda9C2+2LaSvJuwEEulNQ3baGFWjwa3wX100kk6fJp/UhxqWU?=
 =?us-ascii?Q?bsfllaXjPB64nyvt8XeTJZA7gDUPoF6l5cOz3Lp00JghA34bxEwZNdLgWJDw?=
 =?us-ascii?Q?xLJs3gb2yUMIVih5Zg+sTdkAREodKsHi8i8oVeeqXekRYh/TLll24PpaJI89?=
 =?us-ascii?Q?a1ukFRv/TOv07vuvkvYLIkhtHqgGUBWe8lfXSmJRoFmcUw+qs7cxtp1NmN8Q?=
 =?us-ascii?Q?TYe+2uLH4WuTUcrGe4VGPkMWVGtb0qSxcKSQai+jd+wHZLxnza/yzQAuC6rU?=
 =?us-ascii?Q?vqX6GJGjOngaa9V4pgh+aIux4UXHvY14vTe+ZlrbQLMxTCpTNeuQNqc2NyIf?=
 =?us-ascii?Q?CCAZeB4EFtclzOSI6HKZZ9vJajqMZHJS/mPlclo9yvl58mqkXrbJqbAas8kw?=
 =?us-ascii?Q?K0pViGgrL10PqPrXngfcZZ59UxRjBCe77/oN+ziER++jxo9ekLI6UhKIFacn?=
 =?us-ascii?Q?CC42RfhIVWapODs4ZIGv0LLwxIurVAcP3f0ceYD+X+C3ZhkCzJnOs/Of4hZr?=
 =?us-ascii?Q?Qyd2d5leeM8wqzgzzWJUlMnx772dThYVmtVLoe8WuY7WzROjNwM24TS6UoIy?=
 =?us-ascii?Q?icvm7Orp1ed7RE2MS4GC8cTisctcllFDqnfYSnw0PvsozkWKzdsUWlOoIuXa?=
 =?us-ascii?Q?+cmCURFb5DGau1yrE96X6HyEAKUqU1ZE0UAELNEYMYsb6DR9B0i98yA/2b7Z?=
 =?us-ascii?Q?CLc8MvE8474BzlXNIyRaUrtENnKPxOTkgc6Obc8bjvf9uhXDEalak8c73oi8?=
 =?us-ascii?Q?LcAtgy6yBGEuKHS6GQtJAoW+rbOMXuNDI+HIekCRJqj6dhBImkAYnHXQwOUQ?=
 =?us-ascii?Q?UxTKxcDkxdlbTReg4VUhiDxsarTqJAXyOPd7bm8A+uhd1L+1Ocx6gcYOtHUS?=
 =?us-ascii?Q?XFrKeHZPgzjbVsu9uqrMYeQUxhO7Uix9epCwbjB+rSETB+ZBVzLjVZUixZT7?=
 =?us-ascii?Q?AOsrT7eTgN9aEi8fBnCbEPVkzL31eWl3Z4BCueYTpiMdGFAFI0lKjh9kN/WZ?=
 =?us-ascii?Q?3wEQMcmwSVGKMbTNr/59ul7azJm70LzyMZ1L/qn+8vGWS7XTUdpx0mZ95LXU?=
 =?us-ascii?Q?BFIfR5zyqZuzxdSldN3aBypw/CGtkz7GYWIPoFDpkX5Wlbm7r10Gow3ZKtiN?=
 =?us-ascii?Q?lGXoYNG2NJby5RdBAQc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0893d4e7-bffd-446c-6930-08dd7cf8a0c7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 15:09:04.9962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VaxPTwUphN7zA6exgpw7c9ts7IIQYXuOfRJT1lTVi0rtGRkdG8/HoQz1oTuOQklXkVIjuCDjhZEu1OAAaC4jAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10514

Convert fsl,vf610-pinctrl.txt to yaml format.

Additional changes:
- subnode name force pattern to 'grp$' to align other imx chips.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v2
- add dual license
- add Rob's reviewed-by tag
---
 .../bindings/pinctrl/fsl,vf610-iomuxc.yaml    | 83 +++++++++++++++++++
 .../bindings/pinctrl/fsl,vf610-pinctrl.txt    | 41 ---------
 2 files changed, 83 insertions(+), 41 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,vf610-iomuxc.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,vf610-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,vf610-iomuxc.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,vf610-iomuxc.yaml
new file mode 100644
index 0000000000000..3e13587df3107
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,vf610-iomuxc.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/fsl,vf610-iomuxc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale Vybrid VF610 IOMUX Controller
+
+description:
+  Please refer to fsl,imx-pinctrl.txt in this directory for common binding part
+  and usage.
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,vf610-iomuxc
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
+          two integers array, represents a group of pins mux and config setting.
+          The format is fsl,pins = <PIN_FUNC_ID CONFIG>, PIN_FUNC_ID is a pin
+          working on a specific function, CONFIG is the pad setting value such
+          as pull-up, speed, ode for this pin. Please refer to Vybrid VF610
+          datasheet for the valid pad config settings.
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        items:
+          items:
+            - description:
+                PIN_FUN_ID refer to vf610-pinfunc.h in device tree source folder
+                for all available PIN_FUNC_ID for Vybrid VF610.
+            - description: |
+                CONFIG bits definition is
+                PAD_CTL_SPEED_LOW               (1 << 12)
+                PAD_CTL_SPEED_MED               (2 << 12)
+                PAD_CTL_SPEED_HIGH              (3 << 12)
+                PAD_CTL_SRE_FAST                (1 << 11)
+                PAD_CTL_SRE_SLOW                (0 << 11)
+                PAD_CTL_ODE                     (1 << 10)
+                PAD_CTL_HYS                     (1 << 9)
+                PAD_CTL_DSE_DISABLE             (0 << 6)
+                PAD_CTL_DSE_150ohm              (1 << 6)
+                PAD_CTL_DSE_75ohm               (2 << 6)
+                PAD_CTL_DSE_50ohm               (3 << 6)
+                PAD_CTL_DSE_37ohm               (4 << 6)
+                PAD_CTL_DSE_30ohm               (5 << 6)
+                PAD_CTL_DSE_25ohm               (6 << 6)
+                PAD_CTL_DSE_20ohm               (7 << 6)
+                PAD_CTL_PUS_100K_DOWN           (0 << 4)
+                PAD_CTL_PUS_47K_UP              (1 << 4)
+                PAD_CTL_PUS_100K_UP             (2 << 4)
+                PAD_CTL_PUS_22K_UP              (3 << 4)
+                PAD_CTL_PKE                     (1 << 3)
+                PAD_CTL_PUE                     (1 << 2)
+                PAD_CTL_OBE_ENABLE              (1 << 1)
+                PAD_CTL_IBE_ENABLE              (1 << 0)
+                PAD_CTL_OBE_IBE_ENABLE          (3 << 0)
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
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,vf610-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,vf610-pinctrl.txt
deleted file mode 100644
index ddcdeb697c292..0000000000000
--- a/Documentation/devicetree/bindings/pinctrl/fsl,vf610-pinctrl.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-Freescale Vybrid VF610 IOMUX Controller
-
-Please refer to fsl,imx-pinctrl.txt in this directory for common binding part
-and usage.
-
-Required properties:
-- compatible: "fsl,vf610-iomuxc"
-- fsl,pins: two integers array, represents a group of pins mux and config
-  setting. The format is fsl,pins = <PIN_FUNC_ID CONFIG>, PIN_FUNC_ID is
-  a pin working on a specific function, CONFIG is the pad setting value
-  such as pull-up, speed, ode for this pin. Please refer to Vybrid VF610
-  datasheet for the valid pad config settings.
-
-CONFIG bits definition:
-PAD_CTL_SPEED_LOW		(1 << 12)
-PAD_CTL_SPEED_MED		(2 << 12)
-PAD_CTL_SPEED_HIGH		(3 << 12)
-PAD_CTL_SRE_FAST		(1 << 11)
-PAD_CTL_SRE_SLOW		(0 << 11)
-PAD_CTL_ODE			(1 << 10)
-PAD_CTL_HYS			(1 << 9)
-PAD_CTL_DSE_DISABLE		(0 << 6)
-PAD_CTL_DSE_150ohm		(1 << 6)
-PAD_CTL_DSE_75ohm		(2 << 6)
-PAD_CTL_DSE_50ohm		(3 << 6)
-PAD_CTL_DSE_37ohm		(4 << 6)
-PAD_CTL_DSE_30ohm		(5 << 6)
-PAD_CTL_DSE_25ohm		(6 << 6)
-PAD_CTL_DSE_20ohm		(7 << 6)
-PAD_CTL_PUS_100K_DOWN		(0 << 4)
-PAD_CTL_PUS_47K_UP		(1 << 4)
-PAD_CTL_PUS_100K_UP		(2 << 4)
-PAD_CTL_PUS_22K_UP		(3 << 4)
-PAD_CTL_PKE			(1 << 3)
-PAD_CTL_PUE			(1 << 2)
-PAD_CTL_OBE_ENABLE		(1 << 1)
-PAD_CTL_IBE_ENABLE		(1 << 0)
-PAD_CTL_OBE_IBE_ENABLE		(3 << 0)
-
-Please refer to vf610-pinfunc.h in device tree source folder
-for all available PIN_FUNC_ID for Vybrid VF610.
-- 
2.34.1


