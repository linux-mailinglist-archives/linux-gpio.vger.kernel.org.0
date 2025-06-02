Return-Path: <linux-gpio+bounces-20895-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E572ACB3D6
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 16:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C6777A8FDE
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 14:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F85227EAF;
	Mon,  2 Jun 2025 14:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="S0fZv81P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013013.outbound.protection.outlook.com [40.107.162.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3E22AE9A;
	Mon,  2 Jun 2025 14:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875187; cv=fail; b=gp5YYdRVnRaZ+jlDD+WsHD95SxU4Zux/IZgBEJa8/8AEKHlD/mOWkmR2DTPWnpDIrnk2aGaVHEj3aT/wDzS/0T8JC04NaXBmoqXhLgvj9q30OZ9HV5Kc6AhWZGAs4zvE6JtaOhB3cSwY00I8AtjYuQywvRzl7NfodqcbpRfNLCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875187; c=relaxed/simple;
	bh=u1lgNTeWBLylJZl2pjbqXqBkwAdqBuRjSl0TDi1OyBI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Q3wSz5aeQbUKOzHn+DAsiclo/WF/JR2CNYwr08rsohiZXW+HpD0avaeYRFOPXQRfDlLnOWbzavuPGiHH5CY92FOr0Pidp0+8m08N+pH4fwVAlxgHtXcIFAY3eZQee8oNnoQ//Qy6P7897jUL+xCv+cjfJ4Z/u65ppxBz2Eu27Tw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=S0fZv81P; arc=fail smtp.client-ip=40.107.162.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQrkejSrgUmFalWFpEl0st02SFKL6h1uCZtKKX4164Sl/APzFumg/VnH5yEuc6HFSmvsZ7ZPpx/OdfmGTOQ8YG09sgQ64slYMQaf7e00XTiz/n6pdbp0ISD4tTX8B5bFrd1nh1DRVnQ61COFt7HNiFlZ0O0HFktRGkwd/DeF1u7RBjaMYEjX8Xfjp6qc9XpkvsScPohgFO/DRsbwznVfpK0ZOo1ZfAhdYlsLDKF8CpcyPxRoRBmfLyyZcg/qbH6l9cx4VzxejDIMYKNQUzgACF38EOINZN25KmBQSWGCIh7IHFv50ZFRxGTOjx1MSs1ZxxRHVMi3bEXzvtNDzv1zRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8H4qjor30QeI7PmGOQaOFhbkj7QWUZDzBZir18+3hwc=;
 b=AIv1XFqGKjVc4r2AfepK3EVgb+coVH5wHIausuHF2Iwgh1fYGcvtcYaznHSHo4DvrkxvOrYNqZZ7IJ05UeLZMqdhqQCtSpY9UvUz+sKT9bdJqxTOH+FPr8WcowWufvcO7qEw+znMc5Uxdr2vYjUR1YKnDX/99TdNOcBP6xK2mkLzhsMltmJeihOf+7gGpqC8fC24W8ES1W21eEyYYXyhQNFlTnK/oZgtdtI+SmcAAvdw0WKIoMF4jIu6ll1JPetBuftrWqIky+5amhulkaajtxqC+cNcFecFnmx3wTz6eRLwJoH5lLr7amYa999srNwYOEaHwpUbJxgy1yATfvDhcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8H4qjor30QeI7PmGOQaOFhbkj7QWUZDzBZir18+3hwc=;
 b=S0fZv81PFQNWxCFML0P3ZIdH3bb0UeQ8YlAfdAurVq+Drgfz16MbCcAsKKtlyGLSQqEMCEDvq2fNK3JkQ69rRZMhqmBDx0IrXQ4IQg+KaoqbsvNnK0EkvjdB8WJTa+oO5eW9Cb0DYOhG4udfCWCWIfGYWh16/RY6Q30iIVUeArdUkma0JTzGZVC/Ofem9VxLDokB9ki5Vby9SLb8y5MByEjIPBzjnKy8+bxRrp12oFs3Uxh9fu4+7eV+xM/Kbkc7XmUOeFn2ElTeCzcqZTH4/65ZJnhp/d3rDu99SdGf+CDgmnw1Lvtnn0vnuOEChi3g6+CGXHjSlr4JjlThD7r9sQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV2PR04MB11304.eurprd04.prod.outlook.com (2603:10a6:150:2a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 14:39:42 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 14:39:42 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: pinctrl: convert xp,lpc1850-scu.txt to yaml format
Date: Mon,  2 Jun 2025 10:39:29 -0400
Message-Id: <20250602143930.943830-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P222CA0010.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV2PR04MB11304:EE_
X-MS-Office365-Filtering-Correlation-Id: ccc57e41-875b-4415-b2b1-08dda1e34faa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zS9BpzoDbVu0nCgQ4ocGDK0+ggIyvwW+HJ9+XMlF6XoC5ciBJKoWLtia587H?=
 =?us-ascii?Q?o00V3hsEx2W25VYIt608QBxmFrZAElWUoT75ALdWY6RhUn0v/aJToZy/ttHc?=
 =?us-ascii?Q?3Cr6DZMS5eRrFiappONmP9+y2ZagKLJqdgRTLiswpMe9ElGf7dyPIE5Bxawr?=
 =?us-ascii?Q?Cd7dz/+5clKa/tFjHt5yq2S0dyxey2hWML1RdcqRkbgVKXSaQdN9BO2T0ypB?=
 =?us-ascii?Q?M+7tmfrPZMx3WO0lA1wCkLn2WFRYR/wxDygwSJ6bGKnr58Dl/l40TDxa6wbk?=
 =?us-ascii?Q?8ugZWjp/GGq0036u0PUNfY0+busJ56lcwwvA9bq6zLa8wkTctwTBtMlBW140?=
 =?us-ascii?Q?RnSRHjPAvUDSZoShGj4Pg085MkIq6/4O5CijGqwM6A18jTIPsS2zRouLWfF0?=
 =?us-ascii?Q?EGvYZsN5jEKwgQVv1noDO43CJO8rk0OZ5vh++UngDa1vo+a6LC5WJBUrV+tM?=
 =?us-ascii?Q?GPmXP1vCLxX5J7OZvAKbHe5Uh+Ject8gK/Z8nc1pNWAGYj55fIOGy/Sb6tgZ?=
 =?us-ascii?Q?06pMsGvBbQeQx85x/Ugu3BYM8vvnqcqpLZMpJ40d5lMvmw+x5ZOgfd6wCMwc?=
 =?us-ascii?Q?+1zpzeyuQZdgGDrbz0K0cVxVMLYvBzwm+QeUK/BB2vv3jNvkikxzXBXeFeop?=
 =?us-ascii?Q?2wIvBiJ0yDwdQzalEC1ADFgq8HEml/nFsCQ5/stSiZ194hCWmMI9lGpbDPbs?=
 =?us-ascii?Q?aZCnocxx/BXg2PpoQLLsTpfP9xEi5KsjbYlEZRobzjzMC+dNu9Lb8dGw+baF?=
 =?us-ascii?Q?UWbm0UZws3oNB9K+7l7z4/Z9zzH+4hZ576UUVHCtWhR2DaJ69OnzqneUctUd?=
 =?us-ascii?Q?W+4ktCtxlPcQ+DMjhm8sOGsIvkFgxvcrZqwLwOWSwNPRtDl6dE5cY6vfqbAJ?=
 =?us-ascii?Q?Htpk040gIgoUYXuZYrv7ZrI+X1u05ArL0tyILu393MEWU70KGj7L8ksIbadi?=
 =?us-ascii?Q?bc4cQEi7JvdimnkqpYbRN96cKMuED95FadI2aEnJC4f3DHcu7loDBF3ZisbZ?=
 =?us-ascii?Q?EOBYYD51CKZBBFBLZ70NtyJdMEDu+4a5Wpb7+vh4kbZD+wAoAGUuKr4BDILj?=
 =?us-ascii?Q?5M34XWnq3UZUV0mliwyipO4bjSDNvRB2vqhxYo1qThgCod19ZWria++E3M9A?=
 =?us-ascii?Q?WRQgSzNLPOLj9Vj37VbtAc/WuGFOZACZxbX+z1pRoGd+YryyMEoaPudY60vp?=
 =?us-ascii?Q?zBG8NoPDets9cZBH2rhWg8uZsPlzq5vR6qgk3RLez9rtbbnLNs2vu1+lLVo7?=
 =?us-ascii?Q?6pRQAcPngQBrVHpSo5OoD7uuIzTvm7R1FUmJmT3DL7grRAv8r+SnJw7PosmR?=
 =?us-ascii?Q?pdTy9kNsYf8lotLbYMWdeRp2SwQhKD58qn+kOSCv4rF+diEFAIqip/nzh+af?=
 =?us-ascii?Q?roncWjXfF1YbCQXtJ1nnVAz3UeJPcE1iFx6TPugM7o2aDUQS5/K9C4Ul+H8R?=
 =?us-ascii?Q?TwTqJZJjc4+T7s9Ri3CaySc6VQHZsGNC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B4veN94FBuiBngGdILpYEwFShXGsaRGpFoMPe7MB+n+7d/tlkSupZJzMyM+M?=
 =?us-ascii?Q?hs3/oTCmq2umhOYjoi58t6M4yvHhCxxjjXAqWfGp9uG6dCg7C1UlyQqdcFnT?=
 =?us-ascii?Q?QA4TNPLUtKxCOgQB6cEt6QMY8OL8bSupy5OXc6ygFb8JH8xjP5acLzS8iaXo?=
 =?us-ascii?Q?PutZLs7Q1AFFKpfES+Uj3fjUyrJL/Mcu4T4kKADr2CU/6UQTxK67EIvhBP4S?=
 =?us-ascii?Q?m9VgfCfaljcqKmciF7x857/tJx4XY6CC6TMd0mUmt06G3JD0+Dpu8IgTPQBm?=
 =?us-ascii?Q?Toi54W1//ognIWgNtiFPBdDYHW7dp4LVikZJWTI0JGDI2SzScusJtzdetKg+?=
 =?us-ascii?Q?umaezwzxsaKAk6hXX2xgCTT7WMhIQdwJyIrsoz28z6xrysAxmJES4YuwwNbo?=
 =?us-ascii?Q?zYbv4NYCL+WUaMbg3OQh14S5kZ0+f2xrw21m6Y9EFc8cU+PoE1jRlQfm+1QD?=
 =?us-ascii?Q?m+V+YWUASoUX/Hk+GATlu+MiK01q2Ae9LaqldUsVa10vk1VzwuwDmc9f3dQX?=
 =?us-ascii?Q?9FW9+utXhh4SZPHLlflAGZTzgsULgxuoQgWaOYzdQ+W/WRrkmN5aCm/pfug0?=
 =?us-ascii?Q?9bXC4M2zl1qbDJTTau64CXXVKw1R8PnHqhu32ROA1vA82d4Qgvn1JMNj81Ig?=
 =?us-ascii?Q?YU6nQc8ODsE2PJjl6wEnCurMguKXBV8Q0158iDfVW+BgT8LgirNbzW5+ra98?=
 =?us-ascii?Q?gGQDdMkkYADvk5Ef5Wo9Dh7y/d0eMZBMW0z2gVmCdwnvAkrpzsO2dZZrLHyW?=
 =?us-ascii?Q?v3wRY69DVhAzTJBDkIMMgS318dBojKG3e+QM6V8eEi6groV2bTJfWcL9yV66?=
 =?us-ascii?Q?+kIeYv6hB+b9rSw1sW7XBm7ptmluEYpu2gweAj91Xt0ogb0yerds4Sh7Qjnn?=
 =?us-ascii?Q?HCoJJ9uCRd7+tZ/WRTV2Gtq1/CR6tQXC1lWTmKlDh+yftosI1h69YOLbqaNt?=
 =?us-ascii?Q?FRoj6Utott7X158iDAWhfajKj2p8sO4R8kdLBstOPwON+WNv69ercf8D+5Se?=
 =?us-ascii?Q?bWIegcrYQwf5aZPe9CF7ynZtfZQXthK6s5WWc8u8IIgqyU2Yav8fIYlmNQL9?=
 =?us-ascii?Q?u9UYTouV4Ni+R4pXgAHADm70cGCyHxqDyY8jwEpskMm7bIGWvjzBvnOc7Eyo?=
 =?us-ascii?Q?fBkyI9ZKwWg/prkWkMunhoNp8Z+G8oqtDbjBGMViJ6vcL/PpiJYZBcouDiS9?=
 =?us-ascii?Q?Laa88L4C1upmkCyonQl5WDn4QVgceoo/cvNWRSiJbbMQpx5nWw+ndUY/eI7f?=
 =?us-ascii?Q?edfP6YT505Hkkbxq/R83QyzUjhcqHAQbauPwU7sJ769pwP6PFWMJq+HWsq8m?=
 =?us-ascii?Q?WfCp3JCLiJ91GXJBgIpnMV7wYB/ZWltlurFEHki6ohtgMvylwv+9vRdbE13g?=
 =?us-ascii?Q?THfKUq79tAis2edKgZxNhx5uPSCg2sjTg9nQY8S6Q3Ybd425P9ozTfq8CMSF?=
 =?us-ascii?Q?ApKjBVnt9nT6tC+5IovVmdvH08FpGtK2kDPTPSLaEfv5zfBY0LXWh3JXFGVC?=
 =?us-ascii?Q?CUC3kyjWPvUtKvGKSoPez1Q4o6b9ZoTr6rubq55oobQrQVv4ybeOL9bPuc13?=
 =?us-ascii?Q?7NC7dIrMh1gOOpwFzek=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc57e41-875b-4415-b2b1-08dda1e34faa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:39:42.4413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /i5CVB+Qs3+g4I1R/L3jhBV+nKCu3v0yrsDDIQVPjx8zqokK6/DSc7fMO6yITnKfzRjTXgEtRElrXc+ZSgOIuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11304

Convert nxp,lpc1850-scu.txt to yaml format.

Additional changes:
- keep child name *_cfg to align legancy very old platform dts file.
- remove label in examples.
- just keep one examples.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/pinctrl/nxp,lpc1850-scu.txt      | 71 ---------------
 .../bindings/pinctrl/nxp,lpc1850-scu.yaml     | 91 +++++++++++++++++++
 2 files changed, 91 insertions(+), 71 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt b/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt
deleted file mode 100644
index bd8b0c69fa447..0000000000000
--- a/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt
+++ /dev/null
@@ -1,71 +0,0 @@
-NXP LPC18xx/43xx SCU pin controller Device Tree Bindings
---------------------------------------------------------
-
-Required properties:
-- compatible		: Should be "nxp,lpc1850-scu"
-- reg			: Address and length of the register set for the device
-- clocks		: Clock specifier (see clock bindings for details)
-
-The lpc1850-scu driver uses the generic pin multiplexing and generic pin
-configuration documented in pinctrl-bindings.txt.
-
-The following generic nodes are supported:
- - function
- - pins
- - bias-disable
- - bias-pull-up
- - bias-pull-down
- - drive-strength
- - input-enable
- - input-disable
- - input-schmitt-enable
- - input-schmitt-disable
- - slew-rate
-
-NXP specific properties:
- - nxp,gpio-pin-interrupt : Assign pin to gpio pin interrupt controller
-			    irq number 0 to 7. See example below.
-
-Not all pins support all properties so either refer to the NXP 1850/4350
-user manual or the pin table in the pinctrl-lpc18xx driver for supported
-pin properties.
-
-Example:
-pinctrl: pinctrl@40086000 {
-	compatible = "nxp,lpc1850-scu";
-	reg = <0x40086000 0x1000>;
-	clocks = <&ccu1 CLK_CPU_SCU>;
-
-	i2c0_pins: i2c0-pins {
-		i2c0_pins_cfg {
-			pins = "i2c0_scl", "i2c0_sda";
-			function = "i2c0";
-			input-enable;
-		};
-	};
-
-	uart0_pins: uart0-pins {
-		uart0_rx_cfg {
-			pins = "pf_11";
-			function = "uart0";
-			bias-disable;
-			input-enable;
-		};
-
-		uart0_tx_cfg {
-			pins = "pf_10";
-			function = "uart0";
-			bias-disable;
-		};
-	};
-
-	gpio_joystick_pins: gpio-joystick-pins {
-		gpio_joystick_1_cfg {
-			pins =  "p9_0";
-			function = "gpio";
-			nxp,gpio-pin-interrupt = <0>;
-			input-enable;
-			bias-disable;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.yaml
new file mode 100644
index 0000000000000..4df47fee3a228
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nxp,lpc1850-scu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC18xx/43xx SCU pin controller
+
+description: |
+  The following generic nodes are supported:
+    - function
+    - pins
+    - bias-disable
+    - bias-pull-up
+    - bias-pull-down
+    - drive-strength
+    - input-enable
+    - input-disable
+    - input-schmitt-enable
+    - input-schmitt-disable
+    - slew-rat
+  Not all pins support all properties so either refer to the NXP 1850/4350
+  user manual or the pin table in the pinctrl-lpc18xx driver for supported
+  pin properties.
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: nxp,lpc1850-scu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '_cfg$':
+        type: object
+
+        allOf:
+          - $ref: pincfg-node.yaml#
+          - $ref: pinmux-node.yaml#
+
+        unevaluatedProperties: false
+
+        properties:
+          nxp,gpio-pin-interrupt:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 7
+            description:
+              Assign pin to gpio pin interrupt controller
+              irq number 0 to 7. See example below.
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/lpc18xx-ccu.h>
+
+    pinctrl@40086000 {
+        compatible = "nxp,lpc1850-scu";
+        reg = <0x40086000 0x1000>;
+        clocks = <&ccu1 CLK_CPU_SCU>;
+
+        gpio-joystick-pins {
+            gpio-joystick-1_cfg {
+                pins = "p9_0";
+                function = "gpio";
+                nxp,gpio-pin-interrupt = <0>;
+                input-enable;
+                bias-disable;
+            };
+        };
+    };
-- 
2.34.1


