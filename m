Return-Path: <linux-gpio+bounces-20897-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E661ACB5EE
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 17:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D3394C118F
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 14:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E014622ACD1;
	Mon,  2 Jun 2025 14:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SCPUGYue"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2052.outbound.protection.outlook.com [40.107.104.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A8022A814;
	Mon,  2 Jun 2025 14:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875858; cv=fail; b=uFBJPlAafbgWOVi5Dh4VXfGrp4WsK3zaoXICz4DxlWzM9/cAD4GRkotk4s/iJPqNo0UmE1xlrZ5Hnu8IuhPG8gV+0BDVkqbXIlbSciImIqY1cNS14NK06I0ga4XWxCjPG/R2H3EyUaSM105PXJ4Dyy9uYA8IlrU4B+qcDb2z4Js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875858; c=relaxed/simple;
	bh=EhDAymfqcAkY3RjcHHajsLBTxNwqR8xSAj+aWtjikQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ZWkBDHE4jJAfzWOKFZ4lqU0g4awa3rVQz9BZe4r70lTk4R0dcX9J4idum3QK0FSPOIiRnomiTZD/49vj4JjupqNcMAyfcSqr6sa311GnP2LWCQvbuLzqeKxpRc6g3noUVvds4mWlNLY5VJUIPkS/Nf+xABFiGGmqMNZx9fvWaOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SCPUGYue; arc=fail smtp.client-ip=40.107.104.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TaYwmLuo+o8QviD7npw6MWlpRfAd/MHtCg9TDLhFVieV2dwgMYGo0oJjbpRzZHYS3WDRLFj+EOGay/nTrKjtasJkikb+CwCSR6fujc08mqTJPoJAvsS85VGjEJ5LUOKfo2pZYQezjfa1AIAUZVSVj0YU6mJx5plz8Bi8RiJFlb+Mc4cQ6giN3d9hqTGO/fxhwk8U42YKTYuPQFZl17NAO1I4hhqnhdyULOkaalKxuE1mn6OVe2jZhnWvWt3GIhKWcpT+fVIT2NrhEicE1fYz2raUkf1dMchnTtOiB/RFFnrh4UMhF3cO6jy3FSx/JHJe+s2ltR9TUHeqJTmT8oUhtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vw/G+ZjBW3xTlN1k/gqtSNCN4KSYcawdaTLt1prpH58=;
 b=escBR06u4zCxrB0cDoJzBSIIy/Dwcvs7nipVSUQaqwk9uo0COW2LtPcg1xEnyqOfrrtdRNGb+XGu46zIuFAr0yPFTJ9+D4DkbOdrUSovjs/XmozuOgxmu9BbBvi39PMEhfSk2Chc6NdIUghGffnn86ZBJrxea2XBhDd4gV2e/fwRqpi6YU9auzj6t/teLxOOUmYYd3cICKOqZNcljZ0TdAbACBr6VI+aVcw4NHCYl55k94oH1Sox7aiusta4XMu1AC0TI4OEb0qym5K7N7mYO540jGqu7wmKcNnDXYp6IAJXKuavjfIIPT1pPIy4zNTWkm8Cey1pNoGUheu/T8pIbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vw/G+ZjBW3xTlN1k/gqtSNCN4KSYcawdaTLt1prpH58=;
 b=SCPUGYueU/lF3pYyKTYWXg0SdhLFNTHoaN5e+BOjZxvezHB1nAhq8QzqbJpmdiJjilH/jmZDlNLV5bCcVo29GG7jslNElpq6rK8BznwX0pEudKyTJeK3X6VXrWOJyrPDB6+VbPCpNCM08LGRL4+KUJc+5pe5gbNM2P4wloXXsADBVlTVL1IDKO8TnIaUnIMNJY1+RP3+CyvqYSHXoVjOirpKM0q/epyfsVyZOLG6vkUOkOkyN/2RGIUWmYZVvoTPglw/bEnzD5vq/np57v5ZuUJ9VUmoB2uV9Ym9DMDyzyx+8HYxJv9zuVo83vqXRUhv7p6vNxKXYRvA/gyLNXmx0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA3PR04MB11249.eurprd04.prod.outlook.com (2603:10a6:102:4aa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 14:50:53 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 14:50:53 +0000
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
Subject: [PATCH 1/1] dt-bindings: gpio: convert gpio-74xx-mmio.txt to yaml format
Date: Mon,  2 Jun 2025 10:50:42 -0400
Message-Id: <20250602145043.945065-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA3PR04MB11249:EE_
X-MS-Office365-Filtering-Correlation-Id: d566ae55-02a9-4d17-7c5e-08dda1e4dfb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T41Zxzm3nBmYXGdUHB5z+AJ3+Ml/O+V8KxpWf6jXeYqr8ZNsNLMda64rYqk+?=
 =?us-ascii?Q?n5MIn7ca1yeaILAWS8JtmQMPCXoyXpgdD2cHu6Rj/B1X6f6YdCzd53GMuQAK?=
 =?us-ascii?Q?zJo1w+F3+EsWeNJvENfqkhZm6B5HvOx9i84nnONDCymeVTqNn8y3sBFObMsr?=
 =?us-ascii?Q?qnCVmc1uztpD8YNlS0JjHRvARdrhp9i5JsNRfM29t28yiBOBzq+LZvBDD2dm?=
 =?us-ascii?Q?fByuH3+zy5RPxf26YDOjz9V6q+b+zLBeCf5Pd5pyRY99fyoXujtvUo4nKOl6?=
 =?us-ascii?Q?lQm6W482o+IimXLkOV0d4niN3ileNHlLWJ9oH92l7sT2cVRh1RL8r+w28hDN?=
 =?us-ascii?Q?IwK71q83ThFQPJMcZTB8PiP6P3dcENrjOn6xP9TdrwSx9JB89YuHy7rdIb7+?=
 =?us-ascii?Q?NS51nbV2B9kSJWrkNfgQzr5ZrSgCqrjtWvCT/l1fz1xVxJY2+rsToFUsbDSX?=
 =?us-ascii?Q?5s7SnaohUMD7RsK1BNX+c1rVLigI10AyNiCzD/9jaVUdFd6ET8xT0S8PVJxJ?=
 =?us-ascii?Q?zL17HCyD5qQRwuYzUEhlNmUkmaHvroO4vSBoO11SHIDIvK+CXt7f0rukjper?=
 =?us-ascii?Q?1DAtUqx6OSu5w8/fCiqhEIQmliZpBmBupXZyfm/FU9ZzpGmmaTvghFTy4A+i?=
 =?us-ascii?Q?hMYGYpe1hglw5bZ/CUfrvuiZ1BCb0TxuFLF1NJ5nf+PUccEK6x/UpoUbz1Vg?=
 =?us-ascii?Q?P4YNuiBvoWVOW9tt9hjGtNlvtyrwVtb7J3NqTRsxmlYpBMl1YvPvoA03kK+X?=
 =?us-ascii?Q?co77C85D89WPzkd4XDX4bsdJp0w0ijl1XjXSI349O2FpzdG21oj9jCh0KOyU?=
 =?us-ascii?Q?M0a9KsAjyP/IJWSMPhofbiIGzh0MFoyziV2+gk11mWtUwgXzTGpt07lXeUFS?=
 =?us-ascii?Q?OExtAmnUhP3Xo6vgH2pRye2qb6JjlEBZZJeOKnGCQTCKhpDzChSxsObLyln+?=
 =?us-ascii?Q?G/TfiBa6d3CIBXop8pm9KdRZoCW4AgpxKWqIlRCGhttf/lafF9ZjYsHC3bPd?=
 =?us-ascii?Q?Tebms0eNEA/wgCNthlbJ7GKUEEbUVupHSj93hWPs2zA3PpmMzNLqIVU7gkf8?=
 =?us-ascii?Q?O79mKkzRa5vhYzbk9vyA18TKoK8Uh4nhEGbi2j8VOBu78t4EruLYUmTKRG9n?=
 =?us-ascii?Q?xxDx2SLZBZhn/DaofaveW2kdcQ1SZKiZ0vQo302oPUCs+V+IrosRJMaIRBwY?=
 =?us-ascii?Q?xg0coU7ruKZ673d1OSeonh9vdcAEzcf40GdKMWab/NUkTN92akzZlOrSKcNA?=
 =?us-ascii?Q?WDEOkK3dnSk8OYTupzGzA2jVqCWa7YhqDDkEN2XLjmrCsjLL1dbTarZAyktG?=
 =?us-ascii?Q?Mr8Z8bvFJYNA6dQdGrhoa6TIYCz//ZjKvsMn5kDxLGIwLOeqzfMVIkCVe70t?=
 =?us-ascii?Q?xiT8tM0qZxfPhEU219KFoDpTDYzdYSgbPcsLMWYeDVjXqJtLwHLVkNSj8R47?=
 =?us-ascii?Q?uo2b6r4Ks3jxsPdSkcnTlim+qR3M60sB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nFcGI288krhMtTWqSkKH9TiRGqEOkvglm/03xaItzqn0O74O02nvjaWOXapY?=
 =?us-ascii?Q?itrxIkik0GytvyrMSlOMqee90G1PmxTVrEP9np4M7pothYeDWbUcmtR81gGI?=
 =?us-ascii?Q?iKE4KM94TWhMn3QkrO+cvcEkq2ymnV+7SludebM+izPtxyIv8Kd5lk4zHPSB?=
 =?us-ascii?Q?sXmt8d0h+LM+N1W6sN/gmUapPS9A6jIg4uFAQeNPEWCS/s3RUs+C3NtOsWmF?=
 =?us-ascii?Q?P2Ugi0Rxi7QUp0F7M+qyLbbj2/JShsmc04MjXDF8YPa99OoXrQ6YhwinXTNw?=
 =?us-ascii?Q?uXYTewI1eKYJV2JkqqIY4Y4DPJCCWc2Bz1TzlfHf5P6adt4DunqVdUkOjGq8?=
 =?us-ascii?Q?sH3ckN9EyQI6bt086J4dcUM7NripqozOP7lN6ZTSqKI9uR+kEvmqgorCnIqJ?=
 =?us-ascii?Q?jQvWbENbI4h2RSNP/mvumDhLTyeHWA/yUVGJCxUj5LNzdXeEyyXqP1eqqOPy?=
 =?us-ascii?Q?3EfyBHOyqaIei+aelbVRNOt6GKJ8NIQaCbP1K+aT9yPgDaXE91hZPv52oy/b?=
 =?us-ascii?Q?LiD+b4bnZukwJc42P3RxX9rf7itlFNrXl0U4ZCg0e9Yuf+rHpfFJqMfZ+hTP?=
 =?us-ascii?Q?jVfaanqZjYhvTtuGQ5aSz1QT5CQVlSWVkVC20fpRhF0MDSQeVCGimvMMl5E9?=
 =?us-ascii?Q?2Nyy4Df4eHPa95rdy0OLEz92OLgk1ht6+JtAQ/Lzl9IknQFZ+Sf05fm65ffO?=
 =?us-ascii?Q?jwWYdxfqzecBlQzOlynA8Do097Mv4NpGLDLFD0rFNsDMKOTZ2vFX1pKf6bJn?=
 =?us-ascii?Q?4Y1xFu1aJpbE5WaMCfnudMXUQTcubjFpA+81h/Z0VelH3qb4Ds40ABjzTjld?=
 =?us-ascii?Q?pXBzRNGRgo5zvlgUjyncdnLeZhXI1bhCOziXfz7OS7YWOxtS9VGaXurQ0rX4?=
 =?us-ascii?Q?gaRZv9dMjfBJ0guQ7ZAHmkaZbZFdVFaeLur9XfrGWpVrlFCmdjxD7KN4Silm?=
 =?us-ascii?Q?zcacPWzeDEN+/b8yitk8/Kf2K1q1guwPTYXhzzdz8dQz/cHS8pRLqEAri4e0?=
 =?us-ascii?Q?aG97/1XMCvxlVZtjjINSr/a1Ke6TXCQhtyIxuTLI2BecCJKDPuCIirjS+sOk?=
 =?us-ascii?Q?5xm7p9o/x4iBHOQ9q2Qye/rbRXT0NeSVBUA9LvY2I0wgiqBdK5a3v0VmMU7B?=
 =?us-ascii?Q?fKKJZ1iytfm25G6V/UnZEnyzBso37JTtXffwUnandXJDGcZwcW0q7SI1Q+ac?=
 =?us-ascii?Q?FAjWlt6a5mVMoR1UBDBPU9YpSVRnnH0LcJoKRd7IYhbpDbELU8QXN1qPpVaq?=
 =?us-ascii?Q?PaMQljXXdEJNZK6MF9ZTWgn3RlS8dipHykwtb0O9YBVFhyZutr52yvYxl5c+?=
 =?us-ascii?Q?/DA8rZChOJX/EpOiXAWHwOIpQLgtYMUz4V25mg5ZAfzFpRwaZyk0e5HuW7yn?=
 =?us-ascii?Q?MpNu/zLlLXs6vDtJRYjE072PLKVhOwxhbzWNb5/T2vOBTPX6qlKTZA1nQG6y?=
 =?us-ascii?Q?CXfhIbwZI6ydO8Nh8zoboL5G56U3raOTFJkSwP22XCITatR8t6cT6YBDNQc+?=
 =?us-ascii?Q?QiHpB4h06G4xj5LWpYPI9gpnN/i+xtbVQYeOG4LBgMCyWfm1PoPM0exLVGH2?=
 =?us-ascii?Q?/dmfqhKIuQb5MrS9F38=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d566ae55-02a9-4d17-7c5e-08dda1e4dfb7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:50:53.7053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WbTE6g+EoA0X5GSJsnoRA3Uo0CsPK0dXjzupcDz19RnvUKXmVrJJvh9P7JJqCgxzBt3alffDH0HfO4fy44W3rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11249

Convert gpio-74xx-mmio.txt to yaml format.

Additional changes:
- remove label in example.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/gpio/gpio-74xx-mmio.txt          | 30 ----------
 .../devicetree/bindings/gpio/ti,7416374.yaml  | 56 +++++++++++++++++++
 2 files changed, 56 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-74xx-mmio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/ti,7416374.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-74xx-mmio.txt b/Documentation/devicetree/bindings/gpio/gpio-74xx-mmio.txt
deleted file mode 100644
index 7bb1a9d601331..0000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-74xx-mmio.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-* 74XX MMIO GPIO driver
-
-Required properties:
-- compatible: Should contain one of the following:
-   "ti,741g125": for 741G125 (1-bit Input),
-   "ti,741g174": for 741G74 (1-bit Output),
-   "ti,742g125": for 742G125 (2-bit Input),
-   "ti,7474"   : for 7474 (2-bit Output),
-   "ti,74125"  : for 74125 (4-bit Input),
-   "ti,74175"  : for 74175 (4-bit Output),
-   "ti,74365"  : for 74365 (6-bit Input),
-   "ti,74174"  : for 74174 (6-bit Output),
-   "ti,74244"  : for 74244 (8-bit Input),
-   "ti,74273"  : for 74273 (8-bit Output),
-   "ti,741624" : for 741624 (16-bit Input),
-   "ti,7416374": for 7416374 (16-bit Output).
-- reg: Physical base address and length where IC resides.
-- gpio-controller: Marks the device node as a gpio controller.
-- #gpio-cells: Should be two. The first cell is the pin number and
-   the second cell is used to specify the GPIO polarity:
-    0 = Active High,
-    1 = Active Low.
-
-Example:
-	ctrl: gpio@30008004 {
-		compatible = "ti,74174";
-		reg = <0x30008004 0x1>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/ti,7416374.yaml b/Documentation/devicetree/bindings/gpio/ti,7416374.yaml
new file mode 100644
index 0000000000000..2ec33248dfce1
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/ti,7416374.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/ti,7416374.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: 74XX MMIO GPIO driver
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,741g125 # for 741G125 (1-bit Input),
+      - ti,741g174 # for 741G74 (1-bit Output),
+      - ti,742g125 # for 742G125 (2-bit Input),
+      - ti,7474    # for 7474 (2-bit Output),
+      - ti,74125   # for 74125 (4-bit Input),
+      - ti,74175   # for 74175 (4-bit Output),
+      - ti,74365   # for 74365 (6-bit Input),
+      - ti,74174   # for 74174 (6-bit Output),
+      - ti,74244   # for 74244 (8-bit Input),
+      - ti,74273   # for 74273 (8-bit Output),
+      - ti,741624  # for 741624 (16-bit Input),
+      - ti,7416374 # for 7416374 (16-bit Output).
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+    description: |
+      The first cell is the pin number and
+      the second cell is used to specify the GPIO polarity:
+        0 = Active High,
+        1 = Active Low.
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: true
+
+examples:
+  - |
+    gpio@30008004 {
+        compatible = "ti,74174";
+        reg = <0x30008004 0x1>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
-- 
2.34.1


