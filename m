Return-Path: <linux-gpio+bounces-20511-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 601A5AC16E9
	for <lists+linux-gpio@lfdr.de>; Fri, 23 May 2025 00:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 871353AB7CD
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 22:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7612F281502;
	Thu, 22 May 2025 22:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Vrj8uM2C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012044.outbound.protection.outlook.com [52.101.71.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1B327FD6C;
	Thu, 22 May 2025 22:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747953484; cv=fail; b=G3erMwJeob9CQQsPRXOzIj20TR6H8+GzeZN2FEwJiWliFHvbtHipKJ0luuDE1lZYcTd5DEkCXC5pHDamxAW1UdwfQ2Pe3ik3Ck0Y7uZMDRjhO1lJ70GHMKJl2rvU3HcfmhRq/Z1kbKhltL2RTSkTehViSX5NqGUH+YguxHCt/Vc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747953484; c=relaxed/simple;
	bh=hWFGatZWRTMTzBxvjutA13622UWJpoQQp4ryOhRzGlA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jkGgIiiFBIP3m+T+qiavjXVRlOkSQvWYUap9ukk3M8qRIwtaxcX6B3X1OmnlsRIa1+/DVmOinhcTMwQdacZJE6GEE2PGtjCtVLamVtcCrbEp7VFzcnJksCUjxPHnKnRUWM5/6C3BefRCWExdriRipEVdw5A+CXWTNeiFk/nupf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Vrj8uM2C; arc=fail smtp.client-ip=52.101.71.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+P4FZNhuGGezJPqYtI6seHXJXPFtQ3wiNj4l1yUjA+UgVODxu2CFEcLRq7PdY+fxVApWpNQHBCO+jF7jT+6iDEJ501mpJdhme7sXscC7F/39CgaatVcMLIyrhanngASAYRxnLhxvCftB5Qwaf3JB5ApxafcQcxke8GojvOG0x8ALgmaHfR8bsMZU5sgolYzQy52s0GH8uyxHWU8Q4NAXV7itsbM4+WX+tEFFzBxAOpxSXkifAIH9/bxROysIXhcvQGZ2t1Dy3cU9/p9WyKopypJO41Q6yVCdOAmOLMPoUSijndg5U9UCAkFe1NZ99SE2jzkIAa0R9T9+NOdkOCzyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Cov15xIHgokH83RrBZ/R/zhSsSBUJHtkiQ6HopLoyU=;
 b=PIBGL4VjBo1EfxjeSH1Ie6uAnQwxoS4BfLZHYSZW5ZBMeRZdwmR+YkuTuNq186W3t5Q8wxd7y65AGoA7JjHLjKylBeuuyCqLMkml8jtAyR6VuvhBmrgBHD+Mzu4q2eZ1DXkcYxn51MW3rcPq2k5qxTASRwFnZCqWEWdHIl90Gz8VReJ0KNNV4gQmpvsoYAZYatdpHPEG+5Bci59YTfjYXE8B5eR8dazWT6/aCAs3PVNShJTQm3bsBvni+uPo6akraOPFiIQ0c9wtRtGqjCGd5fWr6yyVsrVz3LIdKXb7W0/tQV4P/Sm5qIUNQEhaB7HKfZhnvBFa16TcDPCLQJgfgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Cov15xIHgokH83RrBZ/R/zhSsSBUJHtkiQ6HopLoyU=;
 b=Vrj8uM2CWEU+R+Sg/BEjsCnoXquKmGVCQ9GI2132HDVzB14eAHt2j2NBDOG5BMn6x78gqtpPPo2oGPgaIcA9ofCQtQ04y3OOSxca8ualv23TyqvCVGKUiBGDjvYVCxgX9e3k+geZ45WAwObayNXJODDEmuIrcp5OM4lWLJt9sP2HMNu8DTh3S6zcCY5F+tzAMqEuCnL8pk5jTusZWu14V/lR7b/AtzH+cDur+mhTC1oGmqhhmE4QiptEMuSdDnh1vZdo081cNnsyBzvlG+SyrafPQqVYdNpEX4OLmkb9IXaEHma1LYcGvzmYz6jhnIG20f+KM9f2wJZCdxyocW/v1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10500.eurprd04.prod.outlook.com (2603:10a6:10:55e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 22:37:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 22:37:58 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: gpio: convert gpio-pisosr.txt to yaml format
Date: Thu, 22 May 2025 18:37:41 -0400
Message-Id: <20250522223742.516254-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10500:EE_
X-MS-Office365-Filtering-Correlation-Id: 60c0216d-6c46-42cd-daba-08dd99814d7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kfiL4Zi/GS0DmKNZC5aFHvfp76Hvn+mPHC4ajro7pHfvg+oa1iaR54+p795T?=
 =?us-ascii?Q?6fXa/0PiTzKIVwE/BceRE7mfL6521oEVctkFvKoijlrowU5Xe8nRZHsMN1TN?=
 =?us-ascii?Q?EXQrKlnmRlmODaE2XdB2QbROadLj3DUKuEUsssZVsN9YU7m36vno367s42Ot?=
 =?us-ascii?Q?r9+JSSdTonXOS4gNysL/jCmV1u5pbRPIfY/AZVKqnaItUW+l5cgsr/0L/gzv?=
 =?us-ascii?Q?658B+AXDC7Z3Q7AwpGOO7VNN5c7wn8U4AZarvyqO8LcSFGHy/a45zWRlrUqK?=
 =?us-ascii?Q?ZzrHDb8KcKtW6nvf78jcQKWQ5DmIn1l+98Uv8C2i/6SH3Lw1YItZJHzv1QLR?=
 =?us-ascii?Q?xgJBCtuUm+mnHYs8CBkAdRsN8LLY8u3iizk9TLAvX3tqRK59/EolxOvLzWOY?=
 =?us-ascii?Q?RVyhwotM5vmD288+c1lCAHs6QRpynPHMC4pEdM0BPBeLkNzZ6U4sGnYHIjeC?=
 =?us-ascii?Q?RoKd1UtHwrw7Z4sbqiLXfx+o+zH1t1vGXqwmLAejIITl0xBexqChPzFHgf4n?=
 =?us-ascii?Q?OcPgDtBAeaE/duAKDdi2vJeXRoMnpTiWUXUzKxQUZLFt4DhuvHvH97zp3l/1?=
 =?us-ascii?Q?GlJjj7evaze0rKQf28ZGwkCaUsm/xJFOXCmxYNaO0zNqnoRz7cMH7mltw5A/?=
 =?us-ascii?Q?K5WKVSVqKrRflv7DIx+DIO2SzkILtRUqek48/J6hhTO6lW52JwUfcuKa/nMC?=
 =?us-ascii?Q?mM6sU5BX0fVpxUY8an6DhXzznRTjM81uPUnKCinszMCEVDBpCjnDGSgrR30n?=
 =?us-ascii?Q?Q1QC98OrI4RL2cqNQl8SJOHB/mlG4cBbbz5094GUEpInjrwIQOiYQQQ3Pmw9?=
 =?us-ascii?Q?sRiW/RwBnpAKw8vuNSLSeaeebTARzmRjkO+mhEvjNawesyjNyvAV5Aji1kRP?=
 =?us-ascii?Q?Iepwcji8ND93q9exmamxdRcjDLWIDBHpD4HgPFazQPkqQwrrV2AUQpT9ibqe?=
 =?us-ascii?Q?BlPQTEQ9GRFqMMhtKd6xTPYFapmrr/alUrfTW5zbu9FmN/e1DwZ4flJC/TV0?=
 =?us-ascii?Q?M8i53DYr/5h573Zwai1MfifB1BqakthcWddhQRYxyqaFlzvJvqqYsnHw9Pe9?=
 =?us-ascii?Q?0ZVvTwsLUrb/jHDHJQKHBOoBVWU3ijnqpRJp3/2lu76QXE5jKS+Mst0CmcMF?=
 =?us-ascii?Q?MN3LYs7gYLpw1bGGRpANdjqFwUzRSDaeCMSJGqPdtAFZ6nuEtPiXOtiTBX1C?=
 =?us-ascii?Q?qQuyLJr/P5IJn52FPLZx4erFpQ8pXjrxpygDcIPQNWj6lr7mLAd9STxpxMyI?=
 =?us-ascii?Q?BZBt+p1FMjJZzbRZTPxUfnhXYU5Gmp2lb5s6QMhnYwEVnokFhLVzUFyA8P11?=
 =?us-ascii?Q?4JmoE/2an+8eUDy56/zNQTVq5786asNH61hgvqsekROcPQU48UoNLc6MqqiP?=
 =?us-ascii?Q?x5sPoNd1lFbS5DPIWzy6xwcurz4gpyzKvs5x3Fbhh8KkZyhngvK3ZfD59/9Y?=
 =?us-ascii?Q?pu8z99whxKs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zxP6hpk3XpZ92Y4mFOscVVtwyoAdOMKhbbI8h8zQ5AFZO9OfsQTytL+WOK3x?=
 =?us-ascii?Q?uMzOfidcP6ZNbB7HKI/sQVo9GHhbrQokhbkjfu8KIS7AytjZxYTjrLrE6Yp5?=
 =?us-ascii?Q?DTDGujNxZ/j/5LkLsZJepiE6a52oFWwMT8L3milnBn81pA1EQJUQZXTDmWsz?=
 =?us-ascii?Q?rjDVKKZ5k0FTGyk3ji/PmJxgzpJ6ll9P6jM2jPtTnuI8vmkfZSeIdT0i9FWk?=
 =?us-ascii?Q?UYwdNcYDhgx841hgZb6Vf2/uTRI2Pz/mT0+uAbWJd2vTk//OOC+MdQMUdwiJ?=
 =?us-ascii?Q?owOB+IaIEgTMd6HVrgagNDktEIU0rBM5ljKPFv8K8x/SFy4q/5bRyicUMMS0?=
 =?us-ascii?Q?McgOGc8Pvo6yWwUHsaWurW6YOureWB0xXvZnz3LQwD/7/0XHn1/h3x5Qm76F?=
 =?us-ascii?Q?QBSBrjicB90mgGD50xKD4FkPeLgvhgOfnj3dNU+t12UXTllkXOob1vAms4Qi?=
 =?us-ascii?Q?2HJ9zONlHFpwAJsnJje7rabjH5arISrbilbm0AQxuEwZjZVEq3RJyVEJouii?=
 =?us-ascii?Q?L0Ewc6DlvqAMCJBKkyfTI1Xc8uJ7LzD3S3zg+5HM7Y/c9Ez7x3gSyGM6nI1I?=
 =?us-ascii?Q?EK1FWhNs2piH3loZrEiCotBtw9IlOwGVaFTIhvgNXOryHL6PJah2yAEJeDOf?=
 =?us-ascii?Q?un1rXaqXHHQT1LTz5agVgMvcXze+A4MUHQVlO4mNNvO5O9nxoQ9Hlfj+6zDB?=
 =?us-ascii?Q?3EKq1k3e2qtcaJRMitOHSF1sfm0nbyuw5rJ2fbKpWoN0taOGH8tJaffGTzyy?=
 =?us-ascii?Q?/ZZIO2Jg7BqvxFvBQSDV41dQdp3gpGbinPlqJmMc5+C0HXcje6KZRA9NMCF3?=
 =?us-ascii?Q?Gx/nL4rGpt5FPZUVzdewVMU3jlm/tB5svugziXfkjGIQBhqAiWsNrUh8xfpY?=
 =?us-ascii?Q?QxYdepOY99S0DrOHRlCj1kDBUqPNvtFpN/fLcMRcuClk/KZqiLzfncgrt1Tc?=
 =?us-ascii?Q?JiFXrHB3VVYhvnjspBdp6u0r57wRcoQwdF6Rf5o8XFy78K4f6Akgby+vlsYF?=
 =?us-ascii?Q?A8Yfo6VxyUyawW7Jh2fScEmeJ+oa29EpMKD5wmRhiVZUBa58D93+BAIHVo3D?=
 =?us-ascii?Q?35epQW2wWMmnTiqaoHm8KWR8lZRhDHy90gobQgZJa3dUXvzpCsRyCCBlX45Z?=
 =?us-ascii?Q?Oct9Bs0zfJ6IjefWVxRA5tTT8ziucNJPpqcajApet5L1jMr0mPGhI1mC/Voz?=
 =?us-ascii?Q?sG689lbrmNZ27xhQVa+uUNJcT1+N6+hIZyT6umLSrpWRbOQ6wx2JscThAvNf?=
 =?us-ascii?Q?FB0hKfNL2rHZyrjo/vKQ4uTVi3LDHCrWbxP3WkohwNL6fJnHnMWqTr+qA9mW?=
 =?us-ascii?Q?hirVm0MnKtheaQ02IRTu/xPOfTs/cFJaHZP1Rv28btDruoVkd/E/p/x7734T?=
 =?us-ascii?Q?z8gjjwzyK71rBx5ckwciWILANeHnPE4M9aAcUjP1Nhw4yJB4rjr8cc2TU+Kd?=
 =?us-ascii?Q?L022AOJoIXnkNN/r36oAuzGlASIaTI8AofoR9BfP04fJ5WOndytDeyUgz6VI?=
 =?us-ascii?Q?rilxbgqQnnzq+aRj7CGOSOcQzYb2yHuTfBRXLvLCwBe/5Mi+zQY9ErTaQ9qp?=
 =?us-ascii?Q?rb8CAanlory0qgd+7zmdSknGPljmdEmKPlodGUD8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60c0216d-6c46-42cd-daba-08dd99814d7a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 22:37:58.8999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LSYIvXUx+s+qgmkhof8Dm4XBRcx+3ErphmxH8XphlzZXqH7sh+mORwI0zb7qMGNjav9ONnGw2QgHZbnkn1yulg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10500

Covert gpio-pisosr.txt to yaml format.

Additional changes:
- Add ref to spi-peripheral-props.yaml.
- Set ngpios max value to 32.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/gpio/gpio-pisosr.txt  | 34 ----------
 .../devicetree/bindings/gpio/pisosr-gpio.yaml | 67 +++++++++++++++++++
 2 files changed, 67 insertions(+), 34 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-pisosr.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/pisosr-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pisosr.txt b/Documentation/devicetree/bindings/gpio/gpio-pisosr.txt
deleted file mode 100644
index fba3c61f6a5bc..0000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-pisosr.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-Generic Parallel-in/Serial-out Shift Register GPIO Driver
-
-This binding describes generic parallel-in/serial-out shift register
-devices that can be used for GPI (General Purpose Input). This includes
-SN74165 serial-out shift registers and the SN65HVS88x series of
-industrial serializers.
-
-Required properties:
- - compatible		: Should be "pisosr-gpio".
- - gpio-controller	: Marks the device node as a GPIO controller.
- - #gpio-cells		: Should be two. For consumer use see gpio.txt.
-
-Optional properties:
- - ngpios		: Number of used GPIO lines (0..n-1), default is 8.
- - load-gpios		: GPIO pin specifier attached to load enable, this
-			  pin is pulsed before reading from the device to
-			  load input pin values into the device.
-
-For other required and optional properties of SPI slave
-nodes please refer to ../spi/spi-bus.txt.
-
-Example:
-
-	gpio@0 {
-		compatible = "ti,sn65hvs882", "pisosr-gpio";
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		load-gpios = <&gpio2 23 GPIO_ACTIVE_LOW>;
-
-		reg = <0>;
-		spi-max-frequency = <1000000>;
-		spi-cpol;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/pisosr-gpio.yaml b/Documentation/devicetree/bindings/gpio/pisosr-gpio.yaml
new file mode 100644
index 0000000000000..db98ba413fb6b
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/pisosr-gpio.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/pisosr-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic Parallel-in/Serial-out Shift Register GPIO Driver
+
+description:
+  This binding describes generic parallel-in/serial-out shift register
+  devices that can be used for GPI (General Purpose Input). This includes
+  SN74165 serial-out shift registers and the SN65HVS88x series of
+  industrial serializers.
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - pisosr-gpio
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  ngpios:
+    maximum: 32
+    default: 8
+
+  load-gpios:
+    description:
+      GPIO pin specifier attached to load enable, this
+      pin is pulsed before reading from the device to
+      load input pin values into the device.
+
+  spi-cpol: true
+
+required:
+  - compatible
+  - gpio-controller
+  - '#gpio-cells'
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        gpio@0 {
+            compatible = "pisosr-gpio";
+            reg = <0>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            load-gpios = <&gpio2 23 GPIO_ACTIVE_LOW>;
+            spi-max-frequency = <1000000>;
+            spi-cpol;
+        };
+    };
-- 
2.34.1


