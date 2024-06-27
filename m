Return-Path: <linux-gpio+bounces-7771-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A28891B045
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 22:22:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEA3A1F22410
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 20:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A927619DF4C;
	Thu, 27 Jun 2024 20:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="E/RDcrEo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2077.outbound.protection.outlook.com [40.107.21.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7187619D098;
	Thu, 27 Jun 2024 20:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719519734; cv=fail; b=Ng4Uod0r12Dfqr+YdKjlnVKf24u/2MhDkNEGidGG/jHhh4bwTP/jeZmPiRdq/c/0SYTWKlQIu50GxxFrg6IZIjLtmfKmR7/RntbWqmFvMpEXukh3jGrC5cP23+JZZvlvP+ICjMRZAx0jMjXleQw7XCCYwf9tsZhL0qVB+ZBqV3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719519734; c=relaxed/simple;
	bh=57ODplZgXwK1ub+nXMsbsM1eOlex1U8NeJHLMoFm//Q=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=VUbnOhRJI2SNI3akiQLSgzmyTSi7h/Yvm/vy5Xozb9pC7i0EYnWyrC+tKhbq9p+PfiQPsEi/aVJzfx1SKXmhdXmdFp2to4FUsPWzhcWLGq0dDi26V3hOX6HrZJA8xiiIyKr3ZqTSiVXxWz3MHx0ARVrUX0aElOQE1W20IRrds70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=E/RDcrEo; arc=fail smtp.client-ip=40.107.21.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knSX65UMmEf+KRrxAJ1GOaKRX5HcOWJel3StWptDDGlf6p4rtLCmfpB74ZdGK2BFbESJPWPT7uYWAhxUOO63wEyVDR4yt+1eSARxluXWgKmAjA8cJlmZZfU0nP6e6aEJzvyW0QtHVL0c7IppzsFkhYL964QomaaFAXdfNXOlW3ma9kHp+BvQYsz2AqGSrrj2xu3xyI/7A+XeY2q2+8jVun49ei4UOE7Kj+YGROWjknOBF19qKMw+euCGbecP8k+YtQtpnFISeWga5SJZCy5iOWiVI36nnCgzzALWRFlTcaSniEG5M/2MXwRYKcD+T3yhjEKBfq9HxOPLAck4y0j7Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICKQg+IySjDYG9GxaSSijFXE2DRET/5j+1XjskO95Cw=;
 b=SjtpCVOB74Zc7VosQeTffZ7zMvcOpReHQgN9lioaayF6dXtQNLYxKi9+nhpa9/1lEMFVPmyB3HWOEqT6UYbB3tJeXuKKJ0d/wjd4sUNvqwaCM9NeY35hGha+GufJhd1IpQfqG78HakI2oFCWydMDZFaHlDJwlYfqN5FCX39rkb0TvOD74aKD0f0FCEt5c1mbkS5uXeLnlMIQDWLcEcqSO0WOR+VpN2tg2g0/PPgV6tCb7Lfsn6ZVdA+p1mKneP+F0yT+JRR799+COM3/OwY7i0sWBhTTwKQWXJlbDcLRNUQZm6yYlKaLlqnnqlXiUp7/rqwmGR3N8IIjIZhAFq3Ukg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICKQg+IySjDYG9GxaSSijFXE2DRET/5j+1XjskO95Cw=;
 b=E/RDcrEoCEwgel9Mri+8Wn9pRDKh78tKafaGJpR6fDPCc+Q4XzH3zZQTtKWUh7VttTdsTizVSSVzqjJVrVH2STCI8/LKOlLmdd1I20Qtjuh5BM5X+Smg/GJlGmE5m1z99AKd4OpGlBcLm5KGeWgRNvZ/WpCaP51xORjzbg8VcdQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB8824.eurprd04.prod.outlook.com (2603:10a6:10:2e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 20:22:09 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 20:22:09 +0000
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
Subject: [PATCH 1/1] dt-bindings: gpio: fsl,qoriq-gpio: add common property gpio-line-names
Date: Thu, 27 Jun 2024 16:21:51 -0400
Message-Id: <20240627202151.456812-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0043.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB8824:EE_
X-MS-Office365-Filtering-Correlation-Id: d916b432-153d-488d-3bc8-08dc96e6d1f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l0K2wpByLZ1qmOIIiWtMLEZltPA8t+5Qpqd2gZY86kWDyFY8gwxiv5o4ZEWi?=
 =?us-ascii?Q?pmhyfwQMZOGX3BEpv/1qOqMR0zZNa92wJ74w/0r6XBkwL97merplH+YAaDX4?=
 =?us-ascii?Q?16QR2HWsrzEjOeVX5LzI91HZNFXXGHMuVwJ46j5yhKu+4vmyqDoOnJLrxUpD?=
 =?us-ascii?Q?HgeOmk9e0s0p0U5/vHO5PM5wYIXCauGKpJqLaLBztyQtrVLrQdlWFiCPyvH2?=
 =?us-ascii?Q?Pa/xVSPOixrhF4XTanZ47nR1cYumsxqD7m0SHQQAEV/wCwSIEVvQJSzIMyW1?=
 =?us-ascii?Q?oiVooXja6FBVB52RcDIs0nWsLDtv8PAlsM7OUvU/zExrHewsdCwNA6nCrPLN?=
 =?us-ascii?Q?UqWfFk7q3K8SLFjqDMRHCtLE/vUVGBwWE1lvg6OyCD9dH4KU+C16+bfOmHJT?=
 =?us-ascii?Q?lekjjqzXCgFtszPselXDazOzStzTY7Ri9l3my/+uUBiEmvgmnSDF3ZX8h4ve?=
 =?us-ascii?Q?iRVkolS59evOY5VCkYO1+i0LEbyR2GhegajA6ySp//9ZVijpOsp29uYP2Y6F?=
 =?us-ascii?Q?6HXbymNZcucu9QGcRe6XXVpHFzCTnAa14I0tv8beI5gUTGRDikwLdK/+V4RU?=
 =?us-ascii?Q?4+XPWCXr5EYFZLGrki1dk0Y21Tlv8gnmqsFe2/dDyhqzF3HQBkslTgt2iVD/?=
 =?us-ascii?Q?01ViS5JGwQH98ZyFACA28EWv7BBwWfATF8+z258uXln+eYy7mbc0AW5hKug3?=
 =?us-ascii?Q?K1fi2VAkEqW+5WYp86t4MLkRAmC6Hdcue5oSMIBGg86OD0W+qcp8UqVWP2PC?=
 =?us-ascii?Q?VL2VHtpziMbXZuME8/tUTur6O1et+2jqKtYgVUi20M+BGhDiG8nZTx71CJ2E?=
 =?us-ascii?Q?R0vi9Jq4PqfSNiaTK4Zz4MI0adTW/9VX+QwCYgJimFHqoUl6lckmJjWBQhHV?=
 =?us-ascii?Q?D0yIHo6jSqMkok2+kz9CJZuS4J+WANf480B2H4QepF99+pbOmjLV65/fpuYo?=
 =?us-ascii?Q?qfxTaPYB68JfGyolWduEEEqLsKlnJhX38VW03zKXj/R9+/LwzE6wAsFmHN6x?=
 =?us-ascii?Q?cBdNrFxDtCu+ZUAFkM3rm/9G6mizGcficG/yX4bOziXSpeWbh6B5MB9Vsfj8?=
 =?us-ascii?Q?O7N1RVkgJhS//ADu9g87lQlH+ede0BuDliwdQ++LuxZaomjsLsB3MfUhwKBE?=
 =?us-ascii?Q?kTZ1Ts/nJ4RRd3oX3r+FNYR8VAqRl8mBlT199V0U/YGxZyc9zS7p6m1o6izy?=
 =?us-ascii?Q?QZ+Fkp+0jTlH6+urQX+bMEoXjHDckDDsODBwbTkI8fYAb3+EfKe94Pl4Xexg?=
 =?us-ascii?Q?81ixJZpluIqNKp1B+1KKDwHmlhk90y2jdVBNfZ37KgHnBBhxEaw07muQPE7G?=
 =?us-ascii?Q?pf2bZTKEYa+V0FN7a8xgFG8PsVxnDhsxl6evLNwA0pS8s2hMsUIX3zTOr7Q2?=
 =?us-ascii?Q?mrAI0So=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A70bR9ZrOIab5CtW7wFE9h51rdhhyRR7zj3qzfy2xdmsarkr3WM/HWkHaiGR?=
 =?us-ascii?Q?Tb6/S3epWJ74IcScTG+DMly9GqXvjholHmhXotLam3CS7ORihMzuIA7TTgII?=
 =?us-ascii?Q?JaPYdjbsZBsgEkZPWeDsNjHfjs0qIM6oG0mx72FEEnR/uVZT7dAxvwq43Fgj?=
 =?us-ascii?Q?7p3PHPNH+d+fNURHWaIT7sDjao4vnbz/3j6O5UCXFexa2WbtAcfxcGGh23ao?=
 =?us-ascii?Q?d7cf9KPfKZ6reDVV/Rcl6hJk2x4ZOeZwJLqgvUKy9+TiM4qurvRDKcaSKRJm?=
 =?us-ascii?Q?fRCYQ4lg5yzVIIaMknWOdu63LLLemxm/IrP4zs01OoLhVYCc1h/VTuLRoU0b?=
 =?us-ascii?Q?kRAdx7JVrQ/DgXr4tA22PT5/3lObbcLnZ5VGysfnV/19eAiZ41cWgyCeGmhZ?=
 =?us-ascii?Q?iJV7jlFQbmlwGWATBUVl79NUad0+4PeyGIJLf7gBcq7em7WY7S20ipK2h9ej?=
 =?us-ascii?Q?qjX4ZSjfKy5sHTZ1jzxyoPV5R/CI7er6YoFZFjMWB17Sr+IjKCRkbuIehCgV?=
 =?us-ascii?Q?Cedk4s/HtoCTWOp1oo8fKMGLBPrcmZ+qODPATP2jMwyvMOz1SKk3OPVRs3t+?=
 =?us-ascii?Q?ow/nEmbyI/M5AcypocKTxPA/xqnsi7089sq7jnRlmGlnDMZqfJVQf23Ue/gK?=
 =?us-ascii?Q?MDrs1axespk0X4xXEtBEUchNT5Z72lQHMSFHRXvsYvYSsvd56vtYcQqW8PzZ?=
 =?us-ascii?Q?Rbop66M0eGJ/3Z3PQcpGfVSRB9OpdE47Vp+EsxofabAzcK52DV/fMfVPJk6+?=
 =?us-ascii?Q?y82JKzJn7KcSgD5I720BSvoqX8soZhd26AWC91pE9FihFOf4paRZmdGoydWv?=
 =?us-ascii?Q?jryhTqMPsVrDn1TUSLtoi4g5ZqvnO3SKT1BlvbgN9Wrp+AcdqeINxeuw7UIV?=
 =?us-ascii?Q?Xvje4q99Om6xpKP5xp8s6hyzXQDb7p5E9QngccuJmrqjXTV04xOclcEXpIKU?=
 =?us-ascii?Q?CmUKwgecMnCYej57G/assh6Tk4t0ucakXEUADHy2iq26J9PioH8a6PKZsIda?=
 =?us-ascii?Q?H8Kls7+t5WNLuyAkqQ/0I3eSsT0LFLFSR4DdfitZ7MHPxiBHUYIhyz9ep+Ln?=
 =?us-ascii?Q?bBx5zak7+l/GGL+KdPk8RWjJhu6TZAANVzda83p+jhe4FyW1fWyOhgpEf5gO?=
 =?us-ascii?Q?EPs/VVfnIgu7yhOIm3cn5Nd1Y0IIkvxE141EKanlohUw5ge8+lntyZyNxvUU?=
 =?us-ascii?Q?cOKAHBivoXMjuN/GzH5Jp60b5yNW6i56m63bqoqyXb3+dc66/vJ3TOXVneVQ?=
 =?us-ascii?Q?qf5Eeh27QlfXcTDBlibgKKDMUCz5HcyrNLi38NJzZ6nHfePY02P0hGWuVw53?=
 =?us-ascii?Q?ZivflzII+tdB96qoNF/v91IHtFofbpLqsU6wfCvTnp9qSnOYxOZ/wVMeCOtr?=
 =?us-ascii?Q?Yc/3quX5N8vRrLWqqTNruJrHVwbLNH+ddZvF/NCNF53b5922bLuS58fEXgxv?=
 =?us-ascii?Q?o9pTxj3BuzXwdAh99kKWhJ3JKyqCoqrWqbK6OQ1cFRMfmY/A2ivwim/60GIA?=
 =?us-ascii?Q?tp+GdpAOeqqrIOJQ7PHEpae8Zj/4DuTz8Yx8eUarETDzHvcENuSmVAHg4+E/?=
 =?us-ascii?Q?OHDcsMu5Wa1iCuTmcHc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d916b432-153d-488d-3bc8-08dc96e6d1f5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 20:22:09.1682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +pv2aIA8djz5XhiCC3BBO/HPFCT9NZ8QQ+d0ih7PyaxEocyMdl9k+00+fTTwecrY7vynwJRb/swsZO2VNTKYvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8824

Add common gpio-line-names property for fsl,qoriq-gpio to fix below
warning.

arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: gpio@2300000: 'gpio-line-names' does not match any of the regexes: 'pinctrl-[0-9]+'
        from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
index d5f056b35d805..84fd82291ee40 100644
--- a/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
@@ -45,6 +45,10 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  gpio-line-names:
+    minItems: 1
+    maxItems: 32
+
   little-endian:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-- 
2.34.1


