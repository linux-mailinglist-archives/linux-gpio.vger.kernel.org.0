Return-Path: <linux-gpio+bounces-20988-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D24ACE0AF
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 16:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0CC0167A62
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 14:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C952F291160;
	Wed,  4 Jun 2025 14:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="l4Ucq/49"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013019.outbound.protection.outlook.com [40.107.162.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C47A4C97;
	Wed,  4 Jun 2025 14:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749048412; cv=fail; b=V/Z/adObIo64BOsaHDRaG7lBhaGOCV8ZhQbuNxKjsLf5KTiPxHd/2Fs5wPB4f8zU8LUNEFgWdGXKysSABgpGa8FGiD4kGLrOcb/GEvO6XdfZd5xR32U2tz1NUIbGOdCrQyGXZ07Yu+NvDHm1ApECbv1c5QY9HfwxMZPQGqJE9Qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749048412; c=relaxed/simple;
	bh=M6jDCqInL78JzxGkU8M8UFpgcgZd1X6U6Hi1FC2idko=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=QNjw5hu8WM1XjyNRfAP32z7EinGingDMCm/S1+wfjSzRP5zQjnZdQiYrp1b9znOtivpMgfwXFGvWP0+2mWe/JpLbIt+T4aG4l8/fDCDQGoE8+v5x3fQ2ulOC9XYwIXbOT0Fdj1YjjhkI2tMTsjTMAHu5+k7VSBSpwJn9RQOiOA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=l4Ucq/49; arc=fail smtp.client-ip=40.107.162.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmuN20T8lKq5wvmvbBYrbaeyrPgMZNj+kfKGef8Yq0IGzOvq2NTbLYTTom9VPhEASlQ7UfXznGeYP8rlGCpVzPrM2GQ9MgnqeWbdUbhi3PYQuhNFfFjUlv4IoIzJ88rw0lb9rGjppfBqGzzmWU9nLbdvAF1JZRrpoNVBodwlfOeZBNCc4dI8IpTSburYulr+bXdsujKpUIVlDBLheSIp7v8mkTnx9UoPApNKSvOMT4f/Xl678MEN4zNtaaIuypzxDcvbnew8/xEJfRI2+dh4E7Lgqsfv4rSd7lY8of3MaY9qv7eZaIEOCKEBzPOwGK6RbADDeyk/xX6d8lQBDhaXmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOaO1NLX4p7IBd/tPilSfu6EonttEk/jSUrKuqI7dtg=;
 b=pJchaLWsuKU/0GKruOsECVsj+AljXAkXDGhebF7O3vKF03o0kLQl9dw35LuX9dvoUHc0LiXtigWtoqFtPIi8Sg8MJVlMmjYmRZs/65ExYUKwOcXPAKKsT0DNiCEnlmvVVY9XKbJOr9nRu4XqXeAZq/c24gfvP8+BTC+2wK24uRDN6TCRjThO5F/wHprCNexoGF48p9Rz83v7QIc1I4IplqXhVibvx369BewX+nQa8MNJin3ZvBggel/E1TzLI4A6vFjeRd4ZdM4+L5FralDuoXJhsA0nlQrsd/BWv8dy4wiP+TkagrhJM0KYcdV1KptwNbwfmk0hiztSzAoXj5G1AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOaO1NLX4p7IBd/tPilSfu6EonttEk/jSUrKuqI7dtg=;
 b=l4Ucq/4993fr64YhlOmEf4jUn4vo+gt2k60swYEs4Me4PsNEQuXWDh6Qne0jRoxFK8E3CoUnpOamdsKq2JkCjm2A8k/GHxy/Eq6dcvvvbqKwOhCrARJx8Rs6SMzu13FyNsR+785gRE9NAuRmMoyEzmF+2ClZyMjwM2k1GV1WYWLv03vzElwLPwj2XE5QpkMWKzPnTvLMEitW19/pM6NIsQRwng9sf7KmI8twyiZzx4IDoRAfq1u/5LS8ocLoFDpkWm82t+xjw0dEwN0qj4AEGbS0bMbXZVrmnvJunZltY80POVrOXW9TrRdVC6PCamjJEAm1NSgcBcs99eHZNcEyiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10667.eurprd04.prod.outlook.com (2603:10a6:800:278::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Wed, 4 Jun
 2025 14:46:47 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Wed, 4 Jun 2025
 14:46:47 +0000
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
Subject: [PATCH v3 1/1] dt-bindings: gpio: convert gpio-74xx-mmio.txt to yaml format
Date: Wed,  4 Jun 2025 10:46:30 -0400
Message-Id: <20250604144631.1141430-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0130.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10667:EE_
X-MS-Office365-Filtering-Correlation-Id: 2380c9bf-b775-4c65-4c62-08dda376a191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zLVGz4kv9n5uW4bavBKSYtX/7UfoRImasRdHAjtASfsNDFG57/Y7d+jVPsN9?=
 =?us-ascii?Q?lNCZWy9AOCVdoLZ5/hpT41uJxg+6HRoO0mGiqJykrk8RksaJxWuHMEvfA/ef?=
 =?us-ascii?Q?j6zELE+yDkUTO7TvloEKwV6d6/AK8LMTKpau2GbAFiICYGhNvvrlIQBGRVT7?=
 =?us-ascii?Q?b4JFlsnSHu1V9UoYo7UgbG0UMSqXjUZ5/TlvCcEoNOmxlbGZDV+VP0NGluzb?=
 =?us-ascii?Q?uMwJG6bsaNYqQqFquGPl5DsR+Nf6/J2tTr3PEcYhZe4fdyQXPXn+qSIeGsp1?=
 =?us-ascii?Q?GAsW7SgvzaEFjOD4VG60RzV14CXW8ZpUyrXDe/dSb1aDs10XB0yBfSAkfAc/?=
 =?us-ascii?Q?6B+1B3T28FsRXgzunruV6J4GpfbuTDlA+kSxn925LzldSPEVnE8kPTTn8OWI?=
 =?us-ascii?Q?xqzC4RQmQEvKOQRpc9IOJh/SsdbLnXDN9JOH4kJDM9SlN7MxNrMyN0vnw/Yl?=
 =?us-ascii?Q?AFZSAR1beTil73rLaKOjgTVQgERll4q2JHgJmF8v3n9C3ZkA1QdBRRNNruVp?=
 =?us-ascii?Q?iQldnoPQAtIrlPDsZyL9I9Yx4nLcPjPFChyVxXv+RJz8gx7/tDS6Maa4sHyN?=
 =?us-ascii?Q?fxZHGfCgAxPQbSwPL72EqwiBQQQIYWzUFVaohcKJh+RUrIOCM7qsJOO7dfqS?=
 =?us-ascii?Q?MgQ7hlOgi8i9v3NcV6Kdri8nRixjKUNVuG0Aly2nCnyYwy4gnbBd/mJct6Oz?=
 =?us-ascii?Q?FpSBaD3A/our3WBia5nVCB5ifuDW55lmhvgJo54d5O0NjEmhtaoHohkuSWmf?=
 =?us-ascii?Q?ah/ZQR0P1ZyzneM/3a8LA5CVZTzwtSphaudgcs8741gVp0mhgDoT+kWcf1HG?=
 =?us-ascii?Q?3BUCFpPN+kYjzsWAeF/Dy2YTYV1ueOS9h7aQ8T+PigNiEUk6DDtUdGW0PpLS?=
 =?us-ascii?Q?6b53cDmBDW1sneqqU++HDBfOBdI8H9ebknyD+dnKefXNtBhCCTvda+uT+Nx9?=
 =?us-ascii?Q?m4UUMiygmmahGbD/8DY2SfT1N/XYDotPiGnllUZXzifCuXV+E+YN9Y/mHEWj?=
 =?us-ascii?Q?XQO2X7amSOdYYfrrDvBaMZ0KWZBYlom+dYuhuZyvFrYeKKhVVdRLUAHCb5BC?=
 =?us-ascii?Q?d3cgUKLIpqL17nQEF8ETq0QnIqgh9HzcXr26bcJP/5fSv8gBe6uIWQH7OB0o?=
 =?us-ascii?Q?LnTdn4/C9h5TBsj6+TPY6t+y3+UIq2VzXt7U5bJLAKge2A8vsp/fR6AFCuSu?=
 =?us-ascii?Q?+dSEJBKXGvd1SaCZA9uDcVgf8lbFGN2qIF9fUG9mfigzQP1CFT0Q9SzhmAVl?=
 =?us-ascii?Q?jTAhBVnCSw5K8XDYl0bS1aPqEEYF4Ks42CF1/r8O2w93qF/nZQf16exbhcWi?=
 =?us-ascii?Q?lAAjF9xwOLaIcfAJL0gIP6KCIKlogvv8bsJoJKlxS0LWfoJ5aP7uPkUAAnFU?=
 =?us-ascii?Q?ZSkg4L+3a6RvwIikzwuGvxYuxE6Od01eirAEvbg49IALT2i83TwT0Uh7L5Vp?=
 =?us-ascii?Q?SuTH9kDv3qdD74t5aABe97NOfX7T66lA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SSioaExSNpVzpAPIOyMHuckutrLQx0qom81mw0sSd8eMUwZPZkKuElrT17ib?=
 =?us-ascii?Q?dj2DNw8VyGtxyc9c6i+loclInbLw5qi4Ssmtur2KVf0ZqAOhNsNW7RumGK1S?=
 =?us-ascii?Q?Fa+1dCdjAz1YD9ZDim86qwP3nOvpSxxNZunwmmZMt2VB1wV1AbDKthCHVpAw?=
 =?us-ascii?Q?Y6ljhokiC7PDq7OjjX+U4zb2pwHnZMv0W0gPoTYvVyd/qsGdof9wdppfT3ZU?=
 =?us-ascii?Q?meUWFpx7aPGOESlaedk/N8+4uTo7FYGHJX0koTbpxSQqUCbbwKUpNXS6HxhK?=
 =?us-ascii?Q?BbWPj7fdlyIVtXC41/RsvgcDBKbVKYsxE0HZmkSDT2PmRnYhybVyyO1Hq16h?=
 =?us-ascii?Q?2NoWHwsZ5K+u0e42NBqTzCJLHZmG8ogc0vzWcMwUE0J1d8eLEVcdGCz/z7hq?=
 =?us-ascii?Q?RJlLvJqhFkHqC9SKd9bilnFr4q6/HdUiBA6O/SPLODJXWcFf27HVHe5MBoml?=
 =?us-ascii?Q?J/vpYxodl2QG5NNjnYyhRZrcWX5Ko7vPIxCoXKN1LF2ngoFvSMWBZAXtybYW?=
 =?us-ascii?Q?10L4aSjz0dtS7Py4E7Wg4ErUIWn99GGbrYxIGp2Ex/Gnz8Xq+1xVJv1vbpNM?=
 =?us-ascii?Q?2NjuiWr7tudBtiiml6Jk8P850febF1h8E4pazdIkzd3Ku7xCg2PqldXwyHcs?=
 =?us-ascii?Q?FpToewxjiRULbTlq+vGdCvJhHV6VTKccKK48D5mosgUXeqiSa/hHnBir23JW?=
 =?us-ascii?Q?uMNfziVffJHkKvWucoOMy6bSEuuZYqcl+EhhQy2TDWsDjXLDgXEnWihLKk9A?=
 =?us-ascii?Q?Nj5UnfUi3jS5yJdtpc4VwxQq6fW0VtlpX/dxQWCP28YJjrB1QPB9H8hvNha8?=
 =?us-ascii?Q?HPpYavRm73wXMrNJniAUR3+pZuYT4MegFkvHbBK6g3H/BMDb1WuRASKaVFUm?=
 =?us-ascii?Q?rPebJeX+2Nv8CEmmwZpskxU361JcWfozM5WPuDncj2XoGHYfDjfQr+XezTgt?=
 =?us-ascii?Q?rqUgruxmUOJ4Sy0NsM/w6wt3kAn09Ra/TaujbqjGDHgEejsuPi5rk+we7oCv?=
 =?us-ascii?Q?fXheSJ+sjq4KhzWo/o7lXkMoYgnMxMkF3GsFANNZfFA2imcCnpmB/POIdY/a?=
 =?us-ascii?Q?tXhj29eHpjEwg463vzWtuT7VHpkQdsXaMS8M2LPWUWvy52ZQgzJVovQZXoO1?=
 =?us-ascii?Q?WvQrr9+lDnT4uw3b2TWiLWsWXIGErlwCBlhyGKgt0qhPWihVQVZNqTEitkfG?=
 =?us-ascii?Q?9jdppx/E9S9cogr3BKAFydiuT09MTTnjeUtwuaO3v3izupSeIkOIg9vAmEI7?=
 =?us-ascii?Q?gvZJ/YOULGucOpM3P4P+fEMelJncwIvS5PGy+ujEihm6YyTmwyWMKeX5DlC+?=
 =?us-ascii?Q?QYjyaemI49uJlkSGWGGD6DLNWjB7oJTu68YjkWyqVbnzQVWjlbiya915ZnZD?=
 =?us-ascii?Q?GyCSpapPHBazrjWFXpzhvtlyAtWBGAHanuqilDiV7gQl6EQxwmQx4n1WZgjB?=
 =?us-ascii?Q?Mi0T+eBwVpiPoxnqvoSySbrOoLKArWOmCtcw3ZH6ky2/A8fU7bDztLrbZw+7?=
 =?us-ascii?Q?pqcXbdcGT5qetcssESWp1R15Yt/e+iE1ZshFsyE552s7weIS8HO5R9wfmlD3?=
 =?us-ascii?Q?MpMa2XYnCua8agGG4H1LG3J2qoNVa3Jn/EFmj0Gk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2380c9bf-b775-4c65-4c62-08dda376a191
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 14:46:47.0845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XwGnekNIvtVnNrCI8vWRHsJ4y+Mt1NoX2Wphav/odqbTrgp2Y5cBxpBP/e5WJuTmMFTQPzvJxcapBiWDoOMxTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10667

Convert gpio-74xx-mmio.txt to yaml format.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
- add Krzysztof Kozlowski's review tag
- remove "driver" in title

change in v2
- remove trivial changes in commit message
- add TI in title
- fix additionalProperties
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
index 0000000000000..33472f0911011
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/ti,7416374.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/ti,7416374.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI 74XX MMIO GPIO
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
+additionalProperties: false
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


