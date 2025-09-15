Return-Path: <linux-gpio+bounces-26157-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25689B57ADB
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 14:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 622B2160B33
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 12:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD5630C624;
	Mon, 15 Sep 2025 12:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YTgBXcLG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013043.outbound.protection.outlook.com [52.101.72.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D849730B53D;
	Mon, 15 Sep 2025 12:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757939095; cv=fail; b=jeGKsOGkTEoI66KKB09nsmEKzkWTzJLI+EEeepf6/tx1kPFKAUdwtNghMxHSY1c/QBXWayauTYfaTw/4q3VrGsB7QJYqXir9hzhAV/7aL1sTaHxfZuEvbWMLOe2SFk3Zvf06n86iJI/wWnVkGFHnKKgEhI2L//+yvX1CFtPc84s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757939095; c=relaxed/simple;
	bh=w4hjQ0H1Jgwo7hLkumarEci0zZQLJXY1ogzkn6pD8eA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=pcimlXmPQqnCgTC52Sxjz6bvVwxsSOitzuVkK0nZ6T2eX4EOC5pSL+7Ilx797crImBSAd7eTxF+3sztQIzSucoQqX1lfeyU52kvR606y7p8qqZshoSld/ZLzuLyHU8kU+cYUK9Nt2roN8w9giOTCsUNpAaa0F8H1KuPerRcm2nI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YTgBXcLG; arc=fail smtp.client-ip=52.101.72.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ydo1E1e+SRP5w1Ykh3qU2AYB18RyV9Gg95MBC+NlX6LHqYi4GfaXF+K37cy8NT3KeOq0o9Q92VAKMRsNlODLqVKlisTTa+3o6rlAjCRsO5IequCnbj7SkVXVV0HlL+QgtE4rFNHbi0wcKiC5RhXxpqqqegjpmTzKfzsN9P8cxV0Jye0heqOONjCbV1ZZ9u+RBUaIUmzhjh6Hb/2K2Gzxq8iDY5T4Zcr3tMsvh5/I0KfzYCeNSjmXG0JvT7khjKa/ApnYP7MvzjlRwnBvLAl1n0UAi6omxr/n3ScrLJ0wmV8uxlXbfA9xGhBU8PKMNpK6qs9KKQ0ym7KPSSwD2Q4paw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjJwUJOU+O1e/dn1GktrrN+oKEsGGeyTNaKuDav+pHw=;
 b=vQ0CuxtP9MU/391lpN13rVn7zmhTPMNYN6MAuwjYmpQ/RdiRI+WwrU9QtRmWVHXNJwH0cobTnucN2CNh1OlryYs5aXGN+D8jhLbNyvPICprN9oXYni0TGzOnio2tIPWcbPdwVoLxbQ36WttaeG30eJvx1+zH/ODcJDT3Mcxo0Bwsr9H1EqmIqygYLngkNcOZ7t0Fh8f9JzJonhy7HK5M18e6j+s2Ss/6buygTYAhCott4ls9/r7XfIb8qNeuXnj1IcVbvd8JTStfQtWr3v0v6NBgWLYYU7XGM2+mprBrRDeaDWjfyeHbmuD20gq6xtKK8gXbzKl27O70LkLA3h4D2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjJwUJOU+O1e/dn1GktrrN+oKEsGGeyTNaKuDav+pHw=;
 b=YTgBXcLGXRaBCWxBWpTpzwEf5TycPBDvbjy61C6w017oZsSwoiJ2BSxVXyjA7j3BzElq1n9F1MfQq3E7hPGb8iYD4B5yagALfwjQkqSCUI2myXMM5Uq2mjISvLAYzlb9cmWCT8NeDmw8BDSrVdFk+bZX/rL+NB5CQa9iykqQ4/uJL46Gb13IQEWq38P+OdUoNbhZBFhJ846gkjqwsxEFBCIwoAxfkQbdCfAJ8+e91LW9JRSzXvVCTjAW04dyYydT15lgKLae/iL9z3sy4HNsuCZokVzq0H9Khh6nxO0nTcCkuv9DBoV8r+t+yQ0qRgFw/ywVe4/o8sSgKFJsMLhIgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS4PR04MB9291.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Mon, 15 Sep
 2025 12:24:49 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 12:24:49 +0000
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
Subject: [PATCH v2 0/9] drivers: gpio: and the QIXIS FPGA GPIO controller
Date: Mon, 15 Sep 2025 15:23:45 +0300
Message-Id: <20250915122354.217720-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0023.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::33) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS4PR04MB9291:EE_
X-MS-Office365-Filtering-Correlation-Id: 167079e7-edcb-4e47-12f4-08ddf452dd6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WDrtK/W8YZMyQq4an0zx3KJNiZiQfN1CSEjQ5P+OOiaU+tTLBpF+hFjwQlZ2?=
 =?us-ascii?Q?mEMF4OU5/5m18Z/eT0ZPaPe+5I3Q15VhKHelNsaMAQFViyoQxdYisX29spn/?=
 =?us-ascii?Q?vkDxkzY/J7i8BLYzLPFnN4kHqu9Lvg2J/Y+kP7hxANfbH9k1SP/HDmefjm+Z?=
 =?us-ascii?Q?nJKx821+6ToArUc0rNQTvWF6rjUmkYdU6G1Ilmr9B5tAzGAgkchYIsIGN3WU?=
 =?us-ascii?Q?B+OupFprkzZv1HwOuvyn4DVWYaSb1X34JNJR1b1RlmS4oNdClmru9P8IvbYI?=
 =?us-ascii?Q?HNlq3XBc9db8O4oRtC0B6zVF3FPrGpenbJLGD+97CVvBkrwMQSP911HmxKIK?=
 =?us-ascii?Q?FFZZxNI0rb85Nsfvog121WqMUecwrMFdmRFcs7p+AGFa9pvQ/bSPHEKVpR6W?=
 =?us-ascii?Q?A1WjYpA/pH2Isg61ASNtSiJqdFzgXAUHHhPDT1S+imJIQnMoRbRHfCyJKY2s?=
 =?us-ascii?Q?1JacS6xH75ZGGG5CDiwMHWX/0jyNd3Qj7ygmqo71MhRo/XITwedzNRJWOItJ?=
 =?us-ascii?Q?oCss7Oqjlxb3x3rybMIB0OcEOhRzYolvvXBXO0Lkd4kJb6C7p4lEC5eFvEqn?=
 =?us-ascii?Q?vLcT5RmhAS6HCxEUAorGv/gZH9OGL/tkqTFxXOOScCJu6bC4jdnlLcMHzm9E?=
 =?us-ascii?Q?qSHwNHN8lyQvVjsP1nqbfu5X2QS92fj2k42i5xR3NOsjte9cg/zBW4GHgaAd?=
 =?us-ascii?Q?r+JFsBgD2bBeprLlFKee52ThmLOZjgqMRUx3XlNdtUGPcj2gWKoKeW9UOAbN?=
 =?us-ascii?Q?9Z89TaTrBFFH9zopbz/lb3cJzbrUgKGfBA1trM1ytlX3XqOVLGHISb35XtzO?=
 =?us-ascii?Q?nKYQdJIgCGTbwq7dIh1H2zOqqX3oLcYq/wb5bgFxvFYutwfBEsmX4XE3IDO6?=
 =?us-ascii?Q?RCUth61QAw+RHQA6DMiKEw6hlr3hohMS//VW47akmmAGZclvRWDQ7nChdPwM?=
 =?us-ascii?Q?2LxKHsx62vpErAkHlXfpPANcBYztEVSCkKJzB3Gniao96EfjK2U5JmmBZV/0?=
 =?us-ascii?Q?Iv6/pvgg0KwSfcvY5k4WybT0D3edsCNLSk0JPqC3iFXf5i+TnEptIrCYJeqR?=
 =?us-ascii?Q?DEFzdtl5lgnRpvoR/o1xpQXhQTwZQTpLtOWqouzjoQhwtmamfut2dHI4g5Sq?=
 =?us-ascii?Q?uST421nyONLpJd0Wg/cvVZ2C0V1G2eywPlOouY9K1l1tKpj4Gm4zMhdIVZJP?=
 =?us-ascii?Q?AnsgbUVSaeZ6pSWwBeyk7o4o5N8BRRHzuTxaHc4IaRRzaigC4oj94D+rH1XG?=
 =?us-ascii?Q?d3GBes+lMUBO4xU0Fc48kYDNnsFGscu5sIgcVZ+07flJkR7Fgx2cQhV2Xv0O?=
 =?us-ascii?Q?yTEQV6mZ3CUrp7+4FxFQV7tnXZDzGlJlorjVMJUpuf25xQRRG24ywaKf7o4z?=
 =?us-ascii?Q?saeWTRZ+8OKrfZ8xp48HmXuzN2FephbY1i94ulNsTbW55ENsKpYvib6WQ8ue?=
 =?us-ascii?Q?gIhDeo4TtiU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qVEkLxgmbPBBGL6YJJuVW3Bbg4USIjfmbOlDpYIA3c3hAGpIFBQNu0SmDQGH?=
 =?us-ascii?Q?EyivbzvESft5OlIArp96ymreJ0CmMNpj/aX90qeXplCz4lPgZUmCCZiQt7UZ?=
 =?us-ascii?Q?LvS83b76q9p9XzfVPxD4cad8iFvzne2L3sjjYYXG7u7N/mXgqDRewaCAgaXa?=
 =?us-ascii?Q?eWt3hgKW4VFjfw9hm44UAGVmVdFdfy+TQr4Va8gD3vyp2AqxN6+3UnIWYKsH?=
 =?us-ascii?Q?eRpyRITlnXm99ge4xExPf4LHpm49ZAASZR3DDgbTaTi5gY7CabfCWtPIwny/?=
 =?us-ascii?Q?2m8AosDhkHProEtuC4E+OUmHPTq3wZNNx5hYRnHgzSolZJrtFA+NkqEMeH6n?=
 =?us-ascii?Q?d24alvHjXhfE9u+sdx6l0hL+nSk+V3Y4n8muhEGT1Z5YP8E2RowBUjcWXzHC?=
 =?us-ascii?Q?cDhPnF3k1lZ8B8xUTUzqhhIZesDhlDtmpr9rv2E6fN/atj0uHObRuT3X8DFo?=
 =?us-ascii?Q?41olgPQtOQuK/ibW6EzFcxvX5pYusVy1VdOgwk9F2yy9BWY+PDegWJR0yTuV?=
 =?us-ascii?Q?3p9ysntZr6w86LANIP9StdDkcLJsp0NKB3jqQJN2AAGl+931IXqpxeH4kudF?=
 =?us-ascii?Q?Nsm8OsFshSoigErc433o+kDsYA7cgVxsJ5itosXupWGLI5egDFo/AoOn8nfz?=
 =?us-ascii?Q?FYEgrKangt6mDKxvLTTH+KfxR94Ry0uelmZyHCoVNtq7TK5l8gjPfbdFl8wK?=
 =?us-ascii?Q?vXqqwga/84huTx8nLDDDRkO8cQadOX1Fqr5nbDKFYL1t1VY51j49ilTWVkCf?=
 =?us-ascii?Q?TUmkCqRo5DDVSkSRhC3zRN49hsZKFgrptEWojCMLb1+mF01BHQuBokrnUMeq?=
 =?us-ascii?Q?pv0ZSGMatcIXDPPWVrzo9ci9L+/ONPxKbRKBH1xfMQ5Bk4uqpbBEJjYDH+Si?=
 =?us-ascii?Q?1vK71EkTbGZHKPk8LejCBcZIAQ6oF1a8S7IW4CPGVUthNXRI1FbwO1ZQ/fTA?=
 =?us-ascii?Q?EgZ8vb2NuK9vevkTyYxr/E36zqcBSa9FT54xlniJ4j8hYBVlErEJY4eoSKWM?=
 =?us-ascii?Q?60LKQRPQbJ/RlSFT5+g4gyH2OosJRPpjdlXzBGTl8Ww8FF0CB6L7VNDPIZ9G?=
 =?us-ascii?Q?opI500la1EK8DTWCJVGGwBT2xumgk9WyXrY7Dm3Xay2Rl9cVeba/PcBL3MAU?=
 =?us-ascii?Q?07kjuvowoXueBr3eTCw0VsXwuFDhXeg2naTZwELVmJoyZVGqSZ9jyMLjJjJV?=
 =?us-ascii?Q?SLhLRYtcYRv9OOx8jVWnuTQZUITrcch+DH/UaUdZr0GBHE1iseCOx9sWr4r3?=
 =?us-ascii?Q?w42y+sm0yOKT8ubjqT8PchZrjEVwnUrW8btiM/PbYJ+U27kTXX3BCtRHkL3A?=
 =?us-ascii?Q?j7peJfYB2M3DM+k4D33fgMMfTuqWRJQRfPo2oddfU/+OTgIXVUzVtlcGlpjT?=
 =?us-ascii?Q?pDmMkXStX9cWSyuDbHnuVYuv290zN/MYnYhGFA7VXqn0bAcJDRojOAQUVfrL?=
 =?us-ascii?Q?uVAA+i/o2Rvsd2YgqAqO8cT6IqlZB4YrdqOBa2Dvfoc8yeOyNYEyZfY1f0M6?=
 =?us-ascii?Q?pMI4e6qprbXh6xvdLHk7LFNH3eFxuzrlWQdbz2zqhgyAaThkUFRLLKWiJzLG?=
 =?us-ascii?Q?g4g327sVN+fgiUdfmbpICgA/5o8MWDgihCPKEBAU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 167079e7-edcb-4e47-12f4-08ddf452dd6d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 12:24:49.7797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W128y/C0Ai00efN6vZldwwcG5TYMUEP/Bt4MXqBMWg7gaZgq3Gen8MfMZMHrWjJFQRoAn1Q+1nQVeKBv6FMd6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9291

This patch set adds support for the GPIO controllers on the QIXIS FPGAs
found on some Layerscape boards such as LX2160ARDB and LS1046AQDS. At
the same time it describes the SFP+ cages found on these boards, which
are the users of those GPIO lines.

Before actually adding the GPIO driver, patches #2 and #3 add and
describe a new compatible string - fsl,lx2160ardb-fpga - which would be
used for the QIXIS FPGA found on the LX2160ARDB board. As opposed to the
other compatible strings found in fsl,fpga-qixis-i2c.yaml, the
fsl,lx2160ardb-fpga imposes a unit address for its child devices. This
will be used in the next patches when the gpio controller node will
define its unit address as the address of its underlying register offset
inside the FPGA. This requirement is described in the yaml file and it
only affects the newly added compatible.

Moving on to the GPIO subsystem, patch #4 is extending the gpio-regmap
with the fixed_direction_output bitmap which could be used by user
drivers to transmit directly the fixed direction of all the GPIO lines.

Even though this patch set touches multiple subsytems, each with their
own tree, I submit everything at once so that we can have a clear
picture on the overall intention. The hope is that each subsystem can
pick up the related patches since there is no compile time dependency
between them.

Please note that CHECK_DTBS will fail without the following fixup patch.
https://lore.kernel.org/all/20250912165916.3098215-1-ioana.ciornei@nxp.com/

Changes in v2:
- 1/9: Used the newly added trivial-gpio.yaml file
- 1/9: Removed redundant "bindings" from commit title
- 1/9: Added only one compatible string for the gpio controllers on
  LX2160ARDB since both registers have the same layout.
- 2/9: Enforce a unit address on the child gpios nodes (remove the ?)
- 2/9: Enforce the use of unit addresses by having #address-size and
  #size-cells only for the newly added fsl,lx2160ardb-fpga compatible
- 4/9: Add the fixed_direction_output bitmap to the gpio_regmap_config
- 5/9: Use the newly added .fixed_direction_output bitmap
  representing the fixed direction of the GPIO lines.
- 6/9: Use the same compatible string for both GPIO controller nodes.

Ioana Ciornei (9):
  dt-bindings: gpio: add QIXIS FPGA based GPIO controller
  dt-bindings: fsl,fpga-qixis-i2c: extend support to also cover the
    LX2160ARDB FPGA
  mfd: simple-mfd-i2c: add compatible string for LX2160ARDB
  gpio: regmap: add the .fixed_direction_output configuration parameter
  drivers: gpio: add QIXIS FPGA GPIO controller
  arm64: dts: lx2160a-rdb: describe the QIXIS FPGA and two child GPIO
    controllers
  arm64: dts: ls1046a-qds: describe the FPGA based GPIO controller
  arm64: dts: lx2160a-rdb: fully describe the two SFP+ cages
  arm64: dts: ls1046a-qds: describe the two on-board SFP+ cages

 .../bindings/board/fsl,fpga-qixis-i2c.yaml    |  47 +++++++
 .../bindings/gpio/trivial-gpio.yaml           |   2 +
 .../boot/dts/freescale/fsl-ls1046a-qds.dts    |  52 ++++++++
 .../boot/dts/freescale/fsl-lx2160a-rdb.dts    |  78 +++++++++++
 drivers/gpio/Kconfig                          |   9 ++
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-qixis-fpga.c                | 123 ++++++++++++++++++
 drivers/gpio/gpio-regmap.c                    |  12 ++
 drivers/mfd/simple-mfd-i2c.c                  |   1 +
 include/linux/gpio/regmap.h                   |   2 +
 10 files changed, 327 insertions(+)
 create mode 100644 drivers/gpio/gpio-qixis-fpga.c

-- 
2.25.1


