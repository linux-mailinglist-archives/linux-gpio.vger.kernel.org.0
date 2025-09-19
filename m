Return-Path: <linux-gpio+bounces-26379-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFBEB89A6D
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 15:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5B625861F6
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 13:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82CD230B51A;
	Fri, 19 Sep 2025 13:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nuXrClfR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013044.outbound.protection.outlook.com [40.107.159.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD512BD582;
	Fri, 19 Sep 2025 13:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758288374; cv=fail; b=gD4s5W2nnns76gn/boqi17kf2Ex73wS8L4HlM0f9WcBPHOP4EGi+q+6m7lJ95oftA//IH8fFjmo08nePoHGvdRYqvYuhvaKUjvUODFlVP5D9PL8hyI5r5AYk7FGm4dMxjGlWxbXGvTbYUIYL9hAe1kRKQaariHIkJlMhpREQRHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758288374; c=relaxed/simple;
	bh=HNvmCBtKUhAf7f7DUFhwsMGZGiYqHZ49AAsge4y74gg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZQxVGWza+snMN2Yu6HeWzlTb6T3ZJV57PEYIXMR93PEh/R/V/WMpgl+MoWMKSiq6Fy9Lh33zxXEaUfn33M1tJDNBgKY2e12Yr6MTqgAAP9A7PJLfrVqEiJC3VBbXoZIueGULk4OcUNO3i2IctiKC6qLH1YaOwgtIgrJ7unZSpGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nuXrClfR; arc=fail smtp.client-ip=40.107.159.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghn++yZlZHwMG/bNXTVHk+cRCvdLz/tQAfvOnuV9Ti/xfDXiLkH0gilOGp0IZe9DJaPjhjyAoAIBPSazJ1rS4DJnBF7L7YIlNlvgXVHJFihUogWU7Cb1O19qx4pnWG0mURS4P/SbjrVIs1lZ+WUm7wdK2MWMykUyJTwrSRMOoJHXGrJayWEwgtnbNeRuqjc72Pmp58yLNACh4MlTZiXK4KnKzst0DrDyizMpfEeRfydz17hMatim13diwpua4XoP7KGsA13Wh0ZlFrougxYlYQ1waOeEZLElrjL49B2DaCbHW1nHe17VozUKGYrZux89/Ve8UF86EQ7AdkqWhzIxaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARSkjhXs72W0JeFAwbU393v5JRfiloQ0eYmHG4OLhUM=;
 b=ytOWD4kNuFdNBONXP2WuZYdKMbeJSCeGyvTxvBgFhOE7VE12u7HgXYumnJVZFxIv9uMa2mqWQ6AfAlgJqkH1RUKzbdUFBtUtWc21z6zNI+8ifIAI6t4DZXk7kGemjbTpwf5Sst9GApQaXGrDrwnZdhAzw4fKcLpWa+vPXs3o+KkqMeGhh56VPDpliOF7zlAutB+svvYGQkwUgjafE67qgpPUhFcZGWLk5PLDxtOrNRnfI9AfY0NNh+aH3OF1FFAFFElaESorr5Lv2ziMqDrjfNlyuF7gfEDZYLa4yFJPB2UzgF84wPTeRvHE8RtuP4Ex6Q3Z9DvCHj4D5bgWTOgo7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARSkjhXs72W0JeFAwbU393v5JRfiloQ0eYmHG4OLhUM=;
 b=nuXrClfR2jwhQj7HDXfKVQFeOJlypILelD8bwkuWliltrpnhk82g95eMCqEBTaFHGdrVSN3pJXbGT0PkjGCa+ysRGmBvkqjZvbnqxEzYlf7M+7eo6jeWbV/b1L/ASZVeEkHK+l3DizIvDaRzFjpUaCPt2kJ7Cga6KBHzy1sMbqzO+dMZ2zTqlO4/fBNqxxVZidUK5CpCE6IqB5Ufsf22yxmhvHu6I/aMI+w6gLctu6w4BBNSIXOwCbYLozZk9iLD70VIrG4miO4Dj/2TJf4UAI/G1edT+vfK7hdNTDUvKEE5V+8KQDj7ARo9NpnOW6FH4UNhzTq/2dxyyqs+JQi9tQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 13:26:06 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 13:26:06 +0000
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
Subject: [PATCH v4 01/11] dt-bindings: gpio: add QIXIS FPGA based GPIO controller
Date: Fri, 19 Sep 2025 16:25:05 +0300
Message-Id: <20250919132515.1895640-2-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
References: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::9) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DBBPR04MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: 49097c4e-f735-4662-f4f4-08ddf780169b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?za3RvgxYiPfRPb3Qvl3Rgf8uSN1l9ltyT16l0Mum+BI8lxqu359oOlZ9OYRq?=
 =?us-ascii?Q?WY6tjiR6+oK06Arya65kP0kdY3cRlln5hARbrrwZ97VP68XyvuTBGalV+/uu?=
 =?us-ascii?Q?szw06dGPD4+C9TiQbJ2Tzczy8cJXj/HSoEZg5fVCiUsBmfMkdeFFH+DtsA6N?=
 =?us-ascii?Q?vopQsND4fYUNb6Hj0b8nUN8nkvauNlgYJlUOMN6wRMGOJrsIQD/VXMXt7fix?=
 =?us-ascii?Q?uNE9hCmpZbX09yuqMgeZ3O6HrWoCeQ8kJUPsASf0g6l84kj8qt6ClGIP9YV3?=
 =?us-ascii?Q?UYScWemTWV6ni7gDDT9+4NE1KS0FDbTG2xZF+/tGImgitpAUodShtU4opo3c?=
 =?us-ascii?Q?d66VC5D/TnUJR6YK5Woj0cuMZubyjXjQTSekO03X2ou9XVkFJuVY8z7xjO3y?=
 =?us-ascii?Q?OMokBfT60Itg+C5MwO9iTBHh0G7UsrDmXz4rE/a0Cz0QDxcF6LWWxnc+mxiq?=
 =?us-ascii?Q?TCaSVmia7zLxkQdcujZx2ADfo3Y6CBoFmWWZO2RF5jYbJIYZFzx94a8TWXzA?=
 =?us-ascii?Q?qB8j/F1+r03/KHah0FosAUeuMeFPybKTwXLrmdOJCone5iOF6QafZonOsUGR?=
 =?us-ascii?Q?EYvfukUjNtLh023L0OgBJSFzZVyiv5MKo9ekEStqT0hClr+w7QfJP7v+jpNY?=
 =?us-ascii?Q?ybCOYdroOrWjbtD9PYBNU7uUtHUHeGKHjvatbfbICIwdNGx74Rd7Jc6zdvm0?=
 =?us-ascii?Q?u2jYuhLKs0ykKzwbEZcX96ZOAhBznGbcUpI/w6KYdKEuXrX6U0584M5oLO/Q?=
 =?us-ascii?Q?0Cj+m0NQdDKSUZVcrBPQ9JXlQ2AvB69b1GObu91XH2EdvkYwTsOo1XxXHS+y?=
 =?us-ascii?Q?szUwtrKjJ3Js4k3jz/Hk94ckbqn/QOtFJ/5UgX/r38WOBy9jOhUtupSyvcCL?=
 =?us-ascii?Q?z1LPRNuFedH/1sFCmp/6eDA134gV/P5Vx7a1BJT3QaItuLMwnynoPOXThfxY?=
 =?us-ascii?Q?067Wuztf6EpHu+lstw0ham0MYYj0OdmQWsRHs+05WqUHkz/g+gtja/XTxjku?=
 =?us-ascii?Q?CzCyMW2AfLBr6qiIcFDL66Xh/LKLjdfwMdP3ivbf7BBvGC+kOFqPYeXDj1Hx?=
 =?us-ascii?Q?EYnBLiXbcYIMMjVwD5O4W7tzK7JgIb8K7zbSRnTqyZX18g6L0zubMqfcEzv2?=
 =?us-ascii?Q?ck0buT8EMKLP23t91gNhQ7DqISntwRLhKjXuZ2S3wTE1JzCuU+k91PITiJep?=
 =?us-ascii?Q?yj/nwt+7SvTI5aTDrz9VSf8VNDfyEiLMYAbza7pV1i1ustrOQg+WQ+Nr+MEj?=
 =?us-ascii?Q?FtAb0iYy9dXPwQN5LJEe408d8euz2e2NsPRkF6MLu3NL0agzvz+xy2wYVAda?=
 =?us-ascii?Q?eL50upfY9HipWdR5+n8a0FQhHUMMvu6sH2XiD7eMTurnoO8pP/SIPi2aokrA?=
 =?us-ascii?Q?LOZWXWK/M99B5k+mX9fXCYvBP8sZCY8GNlHz8Gsfsp2WrgCdM1W7h/0i88c3?=
 =?us-ascii?Q?C331ndyPS23t5dBJWzS/GLBIHKo4hmPh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1/kvxrHlfpx+C4EExZa8VAr3Lux5VMhHi26XVP/NwYs3OD4Dvlmm6aAW0Hx4?=
 =?us-ascii?Q?wYy0/QHogggfJ6H0ioOUvYV8uD6PWXNfgdv6MsGesY69yNz0qwEjz68LpZVn?=
 =?us-ascii?Q?YFJrPJoPionCYYP/kYPtFoK+DlVqGXBefCTuQLeFJmxf3sGOYWVllpRCNBkF?=
 =?us-ascii?Q?F6LgUAAelFHhkir4JX1STKCh45WfenIvaaHf3Ozb2EuH7QGk6RCWexQr13qb?=
 =?us-ascii?Q?87rmfOBtAnJt9/KFfU37PX0UAJDYLEfGpEEb7SenFCdDkHcg4xMjmUl81Mmv?=
 =?us-ascii?Q?Emx0kTNhebO8L+u3qQhebKsCmk756kgGoKjAs4Jk1oFLN/1P+PYnvCmJPnC9?=
 =?us-ascii?Q?fkgF16G1RvEa763xF5EngWAtX/Px27n3EnVvQp7Ou/fsAUJ4inhAymiezBj3?=
 =?us-ascii?Q?ihm80Yrh8iCoDThcgagl2GkZ62OM3PbWaWYHerLBVPiNAF1QFYzdpzw//Py1?=
 =?us-ascii?Q?McuXYGfeQ1ph+pgi+5a5eX9SFIIcplb6tBtxrfFMpiy4Ia3Cx8GIHqXvLHId?=
 =?us-ascii?Q?ReiV1LfXjV4f2mTXEnCmuWkG09pWt7qnuqU8tCmWy4sPSsuN2txuZI+4/x9H?=
 =?us-ascii?Q?tNbuy2jV6I/6R6+5g9PU8GazE8PhWdAsjrErfnQBUzH7bn2WDqlhqSG+y2py?=
 =?us-ascii?Q?LBhbMmDKnKjOihiobWCj2ctt7GKxOIHEh4PaOjMY/NXVCjC+XJPMVYiH8CWg?=
 =?us-ascii?Q?VnfFGlgavZPwmPcHsUMZN04XAU/60Dpn/JXAcQ9jInT706qFG2eFLuGFTOKC?=
 =?us-ascii?Q?EYqb8feEeIF3QZ9ByqNRDQuvAYCVEGI8OlF7uj1xjQpvACNnlVvXopTCzkJr?=
 =?us-ascii?Q?ArVdzFJe2IQIPG0dKj4S5UovN3xITMa+3jRrY86WcS3W7COk+at+dV/Vw+J2?=
 =?us-ascii?Q?ezdp9tw7cP3NTME88tlUiAJDOeqvpaIFWWB/dcQSroe4U8ndtgYuQKqcwTwd?=
 =?us-ascii?Q?pEq6ASLmAKwO6pRXvZJKXz/jTJfbGLvClUoE406WCSacWUPAhkulh7sZP0XB?=
 =?us-ascii?Q?y3vGvOPuRDypTvgBKFCvl6gO/TwyuBXJz9XkOeit2cico9qMZC1oJaPsyevj?=
 =?us-ascii?Q?zcC3JiFJ3mnL5piYz0XUjMEBd52cNIac2KZbj06sieRYIVZkbCmmDkZ6SlH0?=
 =?us-ascii?Q?1dJwzzEHQQsIF9paiG9mAGbUDY7UH+xPXzWGRd1VbjpCeV6sLZAaewLL53OU?=
 =?us-ascii?Q?SLOTG10twQS7cGVadeUi7mAKDabq2xUY1pEGMJyxLapQqFnlAdgQCxvEQc88?=
 =?us-ascii?Q?ZG7GoAraUeWW9NT377eQZmIQ8BP8px+l0OwZclhq0fylh5oNQnAGlfCK+Z8v?=
 =?us-ascii?Q?5ZpzWtBClOBk5PJ3nBGoVNKLsMK9IvxfvGykSvJmJAc5aOE5NkaD0QqMNspQ?=
 =?us-ascii?Q?uh/koSvX4f++EJ7eIcN7uNuql8j3Yo5oyMpocsftnr/Rc7baeR95igZkbDHm?=
 =?us-ascii?Q?6u/G3Z5oxk1q8by37Yj7NDshePvBvVYi7GvCugAzNcSH38kBiuVGQDmMtmfD?=
 =?us-ascii?Q?vXlh7u2Ck4EquDBvdTeyEBZza0reyW5znkgAzywDMQ34hgeA3v93HA+0I+S3?=
 =?us-ascii?Q?WeiseLCPSxHjtoBPJ/d/zxBpEQbLXIYkMatTT62o?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49097c4e-f735-4662-f4f4-08ddf780169b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 13:26:06.6035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LmsSfSE3AXi0GXs+MHN2BMSaKyXqPGl86wo8Uy+TVYjmemPLTOP7S++Tjh/isfWGTrzP8sLvIGX9ALe3+/PFjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7737

Add a device tree binding for the QIXIS FPGA based GPIO controller.
Depending on the board, the QIXIS FPGA exposes registers which act as a
GPIO controller, each with 8 GPIO lines of fixed direction.

Since each QIXIS FPGA layout has its particularities, add a separate
compatible string for each board/GPIO register combination supported.

Since these GPIO controllers are trivial, make use of the newly added
trivial-gpio.yaml file instead of creating an entirely new one.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- Used the newly added trivial-gpio.yaml file
- Removed redundant "bindings" from commit title
- Added only one compatible string for the gpio controllers on
  LX2160ARDB since both registers have the same layout.
Changes in v3:
- none
Changes in v4:
- none

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


