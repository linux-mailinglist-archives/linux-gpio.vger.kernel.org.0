Return-Path: <linux-gpio+bounces-26295-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B705BB7E6A0
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 14:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 268232A2266
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 09:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E0C331ACC;
	Wed, 17 Sep 2025 09:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="h3aLRCKt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6237330888;
	Wed, 17 Sep 2025 09:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758099913; cv=fail; b=ffZwA7VAGsVqFfJ53covqT13yP8NLBlSZYuSk8SQ95oXZufIXnS7Wbw1BV33j92Wqo5WaTAT+trrunytD0kdpLuaMDCbcJpwkRbu7NYlbymRTkO+JxYndbFROp2ARhzSoGW9zy1Rj2nYSCfvB5uZW+350XUrAWlTs2tD8Qdh4Hw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758099913; c=relaxed/simple;
	bh=k0RyD/JpZajlAJ/shhb+R/fNkGdMcRnuh8sKVLgEjVw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SzFusDQMIuW9hQYihQOf7/WeWHdFH13vhco6eY9pntByFryi6xGdvTpZa5fXEd1D69pA3MApf1IO+jHQw/SIqqTxvhy3WGC247ws2j7iCs/Gh8C+8J7Xwwwj3DbFyeFnfT6s1V5WnvC70uJW/f64WqK3xnjaVKEkx0muXO7A2qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=h3aLRCKt; arc=fail smtp.client-ip=52.101.69.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rf3sY10FPuYpGpd7vR30NJlKDkQoFMN4yqd4OLQ9RReortJU8sGbbQ88ydRwaqDcIx5zo+HR3IMG7Q46K1Bs3GYKKg+auWIgQeNQN5dNZfCidPC4jrM93/Wm410CR/N8UG6UP6hD2E7a4R7034pMUlonPpV3NwhmryHiLnJy23amV4vqC9SFKPm+ocZVBV3UoE1BrfUHYRbUuBENvi9a9Q/Agmgj4WC7//F/zC+Ww7RnNY31Puxt79d9J5yxU55CUz2FaWY/LbjtcMQRS1BYf+wWyQtYrZPiULOnCXWeVk+fm/ZEQsLy5ZC3Lb0M28O5wJM18FM/EXSNSXVI90HdJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oD3Lsd+mN2QK/10lFCUa6JyVEp0s/wuU8PZD2UZP9yU=;
 b=SBRdnnQOWrn5CiMCoeW2ok4ol6sxl7f0YACYLMFKDTo01vr52Bd3JJhZXWzzlEzz1nbT6/A8Xmj2/UCwYqIEKPIV8CJ2Jh1b3EwMQvve1d54UzwVZ7XZROgbT39d8Z2RXjOz+FOk7XsS9WBfWcynGS4gb+f2WnIpb+5ONfXQgGXiCtNGIAptIOx5gkz1lBSehJ7o4z3xPPlQHAtz2jNDF2rdOgaYf+GXY7I3eSTkxkYfWvZ0JA5dqxFhZxYM8kLAVAIGRka3GqmaclN930BUMzHgqSQOceTPS4MU02/bZaMNBXWcLnU11kGHinEq3iE0huqdGf5leCDv7F9IApxL6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oD3Lsd+mN2QK/10lFCUa6JyVEp0s/wuU8PZD2UZP9yU=;
 b=h3aLRCKtt9/ysyQ8ZczE963aTXmLpa7LhrXEocwshC6TNqVg04K0Nj6ErN23y89FwOY8ctJku7m3pbsSrFIZB8mxQ+cNY5JLgmlTkbx+NBlVZVk+k9L1xoj6WbMQSjRZbb2XAxhrXMfEVmI/Pzt/geyfyK7sY3H+/PgvFKr/gPtRLf62w1rq+ZFRgCMXttR3SsmH+EQv35+HB03vZvHZrzauEs0sXS2D/q5a+SvaKSoDuXFWkg/LFtOqhtJqM0xyXxFQvuYaMQObUImc9lbEd8NDZPl0lpKAypHSGvhlPukeYFL2eGOlRfF3cdKCHlVOZvZMglXzrMbrHW+1Pcz1Lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PR3PR04MB7387.eurprd04.prod.outlook.com (2603:10a6:102:91::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.13; Wed, 17 Sep
 2025 09:05:06 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 09:05:06 +0000
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
Subject: [PATCH v3 08/10] arm64: dts: ls1046a-qds: describe the FPGA based GPIO controller
Date: Wed, 17 Sep 2025 12:04:20 +0300
Message-Id: <20250917090422.870033-9-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917090422.870033-1-ioana.ciornei@nxp.com>
References: <20250917090422.870033-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0093.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::34) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PR3PR04MB7387:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f19c23b-dc2e-4276-146e-08ddf5c94b96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DMqP60TfrwudKG+tIbwcZkti+fSY9TKaDhUu75naRKk4TxqyCYLj2AiuZBFh?=
 =?us-ascii?Q?5gTDO3KMtFWmab1ND6J92judHkD7tu6gRRKn7c7yWgbDr68eSdgtWzIBJVFi?=
 =?us-ascii?Q?0U8NVaaFiVK6JDLy46xixfAOJSYAfxai2G2ua/PTF/GS6OmfTvW2akDivco/?=
 =?us-ascii?Q?y++NPwIjH/jVUqR/k1uPOA4bgoETAT73G6KUy2kzLQeYEN/6RwmR9DPiCRo+?=
 =?us-ascii?Q?9E8rIuLyWI65ZwVg85u5FQjyp4TMCUFLojKmBqbTZyYTkTC0NvCU8V5S6/0n?=
 =?us-ascii?Q?JU42Y6BPlucmNIRlgI0T1YUwRXt06RSH4iomORv4cikrRh/E+0uUJWUKrBnZ?=
 =?us-ascii?Q?qKGkMJ9zWgpNzAXpFU1l0+Ue4+5CIEWtLYrNxCoL0LZdMWnicWJPpJeWE1gj?=
 =?us-ascii?Q?0f0sCbihjq39XHTQxmviZnCOnm4e0K/WPlDWB4TiVad01tk+FkpK3QJykmU/?=
 =?us-ascii?Q?gTMg07zo9mwUsNOPFX14jbihBwgoDENBt9ul01peibdBZntfV6yXDFn4eoNf?=
 =?us-ascii?Q?UzJRMNf+TnEHtBHptlS8cHfnmpBN6ejQkMmRug80WsYlNryyv5DljgddNiL4?=
 =?us-ascii?Q?cibQ9nix+C9ESSmuC2Rtf1fuXR1ZwCNpVKE7CU7H/ShFpZ/z+3Wzc2+1p1fi?=
 =?us-ascii?Q?8M+k9VD75bN8n9lPNGZDTfEQpLpmYRAG+xs84xqH+o2a3Qld6iGxuqi/7eaV?=
 =?us-ascii?Q?/R5KTTxam4Dd8hJT44TQj/I1hH8eBUuKYNTAQr+9bJ7R94ICbx4Sr+5evbRf?=
 =?us-ascii?Q?gIA44RianBgV710kQ/OjDqQhd4x7bPI+KIJzFojSMRFAZyazju5SfXqj9Blh?=
 =?us-ascii?Q?Ja5OaTXIuNWpdIDp6pJr2Sts+PBVOymVKaIDyNnBwvgD4BGmlVniW9Iyq0y9?=
 =?us-ascii?Q?iuh8S3CRkCoQAc5XuisXKhEXeV4ESq9NO7ackVAyIxwVJt2BHtBOc5FJ5sVd?=
 =?us-ascii?Q?wjEoTwvthLwNSQCfmPaYzI+hbN2YeaAjN+uihsPnK+atXJRsMaxFImV5yawZ?=
 =?us-ascii?Q?md4V2I1oEAa5aPn8vScH2vi7su/I7GqB5U7p4qPPmHqIZ7Wsshd91mjkoZTJ?=
 =?us-ascii?Q?pVblu/25WSxTaQjZxFlGqWqCMmaVqg9+UlUgQA4rPWUe8Ik+kM8EljweJVrs?=
 =?us-ascii?Q?yZEBtcKVSp0EAY0ArqQAX65rLai1xYI4pe2VAZKxRE9xIzFNJ+vNJLCDMAPK?=
 =?us-ascii?Q?t0pmCc1f6llwfAVJpo0/ZOx51P8t8oaxPjJ9ujOVSwSx92Wg8mxvFHPDD7XP?=
 =?us-ascii?Q?ZbrupJ1/7TLYSbE3qBkZA+5hBGCHyKTmilDVpnrH8wFTjwbffytvkEALe4JK?=
 =?us-ascii?Q?KzxJsFeQCzwaMUsve19C1O62+CFAtj1Qx7tlKwk+wwWPYRtFADzxQfJi6E7t?=
 =?us-ascii?Q?qV5sSt/UdW5RfPexwIlCJ6kUvQJ20YX3o6eiBHJlp06LsQ3LoppseP67zfAo?=
 =?us-ascii?Q?coBuR7vWfmGJSoW5ZmNBU3u0u7mJdPtJLUHnPMiYsh8p8nDP8oecoQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nf0cni3LqeIkNUxl7ZNHIXHUY6GvCHh80r1r3qZDjbq6a0uLHbWC+sfpi6N4?=
 =?us-ascii?Q?KpySML92A1NO/ksb0vPBAPlna0jx+l6syTzdV5m1Gvpy914Lcxx+USf4/VYt?=
 =?us-ascii?Q?HIdivfp1VDPQWT6Iu57sgbtOwcsLVeZZTgrdkYBqhjUwLH1q45tNBTVRWjr6?=
 =?us-ascii?Q?37q2DTOV7pwI1VhKaqLJZwYjH4YkN83jpN1Fj0VuKruw8f1FMoS5gPc9B4qd?=
 =?us-ascii?Q?rlDfKUgjDNev/IDN4FWO3YORoykUMftDCCjM53APDFyoi8CCBiZThDtLsUyP?=
 =?us-ascii?Q?AgTqbA3I5BZjWoWmGfrw4kWm6HB930vIQahVONAIQteskR0A4R43ZVy2I+9T?=
 =?us-ascii?Q?2DZtruglc9DwUTy+Ejz7GC6mTXR2fD8Bgj3Go8Lt9U9/yoTmA/srRGuS5Kxi?=
 =?us-ascii?Q?7HTqasWvHVQk43hfa0wFOuxjGLbzNMDSkapysFa7FH8xVgTyZGlZDSQ3Dc3/?=
 =?us-ascii?Q?lw06rcCxzJPnbMh9DbcKCUjdU3nLjDAG6zj7FPrvmAZ+oZQJgO0DWJ7lzlvp?=
 =?us-ascii?Q?kc+x34OHleiDjdrFwkuNKwRiAPi7/vZLOX1cgY8jGQN1kS1L2Sx5rD+Cfu/O?=
 =?us-ascii?Q?48QaSJCteBfoSkstlD1p2vNjgnbJrnq1B4vdDozvh3iX6Yxgm7SRY5fyBide?=
 =?us-ascii?Q?VzvUsxyJu3QVDuwth1xv4qdPaLK+MpX1dvW7sBoD3FlXK12BZ4UlwfDIRHcA?=
 =?us-ascii?Q?+Ff35x+nMCAmQuLPmlZSBhqq7QPZSV1TXxBW5ps4iDmQw6JIg6TQf/1pe9BK?=
 =?us-ascii?Q?pBOrmeQ3byu6xkizlp4IoMGAPrA4KtAjpfWKnCDgUGEDyoAYphAJ5TX587EU?=
 =?us-ascii?Q?h+LRcOF7OQjJ5N+JQ7AKU9osMo7CJdTGNlGJxE29iIHyM91AI+rrQcJwPsIw?=
 =?us-ascii?Q?/JleI6kJRdWNugpNBezPAdvKRjPGOder97meqvdEwrtB1duVivO8cBQGSCBq?=
 =?us-ascii?Q?1pUJCGd4pbgrrrnqJsUSheAAAJ0lZyMLn/k44B0ZdWZ2yMsxKUc9iNfEpsXW?=
 =?us-ascii?Q?UqWrXbRuY45lk4nZeQsiRrO5w6T/iCWnNwSZh9nt72bKyJHgYneXhT7X1BD6?=
 =?us-ascii?Q?Y01E8yPa2hxM3aGG/Pt/eMUaIAx8qFg0gHIbOtPS0rDYGYWKOMKnWkflXH76?=
 =?us-ascii?Q?EXoWduKfA4d1bIN/kg3HMSM193jqg87CIzybDcmK5d1KOCuAson/fcuAf/CA?=
 =?us-ascii?Q?6N9enpFmrxkkz+s3bCm4ywXqtGg5z473peJ3KoxlegJQSuf0tE36RT5BxVGp?=
 =?us-ascii?Q?II1aQdYioFtt91h+F5AoaCcjw6oWUl4bUEVbJvGGf/xHcizZIZaN9RC8SNpO?=
 =?us-ascii?Q?LbKLNJVXqVyuTzIxgI6O6F6k3i+Ut+GU7ztbyKWl6v473xREgJCyBuO2vebo?=
 =?us-ascii?Q?AmhKebd1niF6u3tYYhTWDCEGWyrj/NzBc2zI/qEhF22Kgr24VzpLag8amgU0?=
 =?us-ascii?Q?7BnTa0WoSEXyD/+Fi81DT+FMvxnDzNCLIyq1iEMfMw2b7kbR2Losl20AP/Z4?=
 =?us-ascii?Q?jAduthgCMR7yLB8Kv6d1iQiiWsrtGq42Qts7bJblQcEJaQvwWEBIh91LA67o?=
 =?us-ascii?Q?1yBuLjEJVsFV1chZgvXsOjnjIUQdRDLI42EhKz0G?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f19c23b-dc2e-4276-146e-08ddf5c94b96
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 09:05:06.2954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NKFIgNwav8BAvLH/1Nxsoz9W/PVPuPETqrqoguO1zf5uq/KBd4SCi/GsQluN8u1ntUZHZ7bSmjzDdKaVZuX+Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7387

The QIXIS FPGA node is extended so that it describes the GPIO controller
responsible for all the status presence lines on both SFP+ cages as well
as the IO SLOTs present on the board.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- none
Changes in v3:
- none

 arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
index 736722b58e77..812cf1c5d7f4 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
@@ -166,8 +166,20 @@ nand@1,0 {
 
 	fpga: board-control@2,0 {
 		compatible = "fsl,ls1046aqds-fpga", "fsl,fpga-qixis", "simple-mfd";
+		#address-cells = <1>;
+		#size-cells = <1>;
 		reg = <0x2 0x0 0x0000100>;
 		ranges = <0 2 0 0x100>;
+
+		stat_pres2: gpio@c {
+			compatible = "fsl,ls1046aqds-fpga-gpio-stat-pres2";
+			reg = <0xc 1>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-line-names =
+				"SLOT1", "SLOT2", "SLOT3", "SLOT4", "SLOT5", "SLOT6",
+				"SFP1_MOD_DEF", "SFP2_MOD_DEF";
+		};
 	};
 };
 
-- 
2.25.1


