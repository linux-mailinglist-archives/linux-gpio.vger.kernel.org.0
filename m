Return-Path: <linux-gpio+bounces-31643-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIZMCWNIjmm9BQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31643-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 22:38:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5504E1314D9
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 22:38:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8D2BE3018785
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 21:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6977935B130;
	Thu, 12 Feb 2026 21:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="l6eGBI1t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013049.outbound.protection.outlook.com [52.101.72.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38931330D5E;
	Thu, 12 Feb 2026 21:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770932288; cv=fail; b=fF3OYZ6wmm6lnKb/Q7BMzr07QG72wwS+OGNe8Ozbx4N9XtqYDCsuGUGxftfTq6r8+JPE4fWPZ1w/0jcX89sLOalGL2BpQ6GXKr/2+Jl10or+L+SYWMSUG7mMSaqeSMPfdxVKfyLFSLEWe38Q9aBicCEBnXBi6NP2ubgHS5Lrbus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770932288; c=relaxed/simple;
	bh=cAkXTCQ1aIoOw7i2PW+KYYCsX5s9FwTt5BdHkVZ6pWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M5LcGuu3APaY6yIleiyKfginDAgZiGXRb56uHA/4K96WF9kXtOdrQFMkl7TE7fIbct7GcNnm5GMUEdAA/sOXbD8c2oXVVOWGh5ncESw9t2TBrij5SNo80AakEnO8QyEIy8Wa3A68zeBctBjs4ENAPltl3rrP61TFyP03Z2oUg38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=l6eGBI1t; arc=fail smtp.client-ip=52.101.72.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjFa6GOfTlD7IrpyKepZHOv5Q6acBcixF1XVypA4wegYUT1SgZxfYjqWCsQfquGWyWxmcbZVS6Wto2U04tAx+19YjZCFg5CU2A3BdCnH0DEQzH7QB20wjhZ8yli07ND6binZoKr9uINFVDPHXhh5y0y23X+06GdipqARtclRJoNAztq40ael2muJr+t0Es8TYhZiwI50Q9vmfAP7QP6HXY/upxZ3EnqASI/zmEFcjDXl1x87AMgh1yIBW7w0sii2M7kdUqliOOje/soBleyid/K+Z4TA8Z3p/rp9zyVKL07c7IB5TzeCl5MRT0WyBHUUunslXQMe4qIPt8rrfOsIlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5FTZgkolnhiUg0Xosa+w8/3koKzmkYc03vOzLfJNVM=;
 b=ZVjlv+Q8my15tq4/S7dW3DpkA9lzV7GYbs5sAMbzOA7JrNeNu0+SvU7WGiZFl1wLfqq2IxvhXT/FhGNAV5S1z8Bd5ZOP4HGeyTdM5zfYBh59wGVM8YBc4xTbq6hKDi/OiKnudUJQ2fJ7OdD1MlqxcLrP/8zGvtA9C/ITzDGLZoeuW242M8O/gaDHAywHhNodLN/4ZOigHLONVAWi9bTR3D2zvfq0N61M0f+XloVdIbZiAqY2F9ppGh3MLMQKL2rmME5OQSMPh1kxAQN/ui6pquz9X7KclIE6SlwRb6nbK65RC+F/8fDydOoA5Y9XMm54PeajPRK8hbGZaX4Ib5pthA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5FTZgkolnhiUg0Xosa+w8/3koKzmkYc03vOzLfJNVM=;
 b=l6eGBI1tAZ86AM6ek5GimhY88IGFm35jl66a1YueCfQDakgtmFfo1UeKCMkVoinLZ2XpZVUoDWdsrPTJP+5I0SL3Da7OXtdQDibEz3DxxI/0Gyy95FwRZH6X0snZI0y2z09AQ97nZRfRlAEXosNLzv5BzTT7XcVBdScip9pe24+1cxnWIpJw8GIlMtPGpljkvBh+rvSurtOLMdm7TsF3FN8IYbkxRo1pwtzKYe4HS5cSt+pg+g5SfgUD2e/+yVSHaI+P0I8iwcmdg+upUQu3MOZsQk1iI35x8coIh5Qb8e7ew7jdDfLQ7wpqtL/rTk3SsZYb3fTKzCJ70tH3CwiSng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PA4PR04MB7936.eurprd04.prod.outlook.com (2603:10a6:102:c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 21:38:03 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 21:38:03 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com,
	arnaud.pouliquen@foss.st.com,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Date: Thu, 12 Feb 2026 15:36:55 -0600
Message-ID: <20260212213656.662437-4-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260212213656.662437-1-shenwei.wang@nxp.com>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P223CA0001.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::22) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PA4PR04MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: c2524540-3a86-42cf-2949-08de6a7f0026
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|52116014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gT4xm1st707P+NrK01+iyCXnEedovdtHtSu+ryJEmYUdM/sW5h2JkTAn+Vak?=
 =?us-ascii?Q?fZbwCzCnEPFd7sygQVH5kpWMMJ2Qe8EAe8kmpDmXu2SukNvGGkX3t2lQoHOQ?=
 =?us-ascii?Q?m2kLz0Q9jnpjCu7+xS5srcB0Ox5j72cEt38YyrLN7ty4d7lC40LFwfwj3Ylk?=
 =?us-ascii?Q?RkSIT4DWlpjqeFLq/JeRsLlTcl4etWNm2jwuZTTZJAlarEv1Te0ugPGq1WTR?=
 =?us-ascii?Q?8CzhXye/LMSj8vuqojAR/322JHIuF3Z7+lZ7zvlT5rHff4Xu1wZlWNGyIsBz?=
 =?us-ascii?Q?PkTdnb/vvpNH0pkX/hxBo9KoWuUzjRu9QVS6datNVBYjXeRLbuOqDONrHyyi?=
 =?us-ascii?Q?qwYOwWCR2x576P4RKP38OejbklO+Ne2UDqgOHYrtKBGLhTf3+7BbmpZmgRlC?=
 =?us-ascii?Q?MFnQbkr+/5aD6vlmqNrETlx7AGupfej4sEcuCHhWSSICxFL038XZCzuI4S9M?=
 =?us-ascii?Q?mdySi/BTbyKCdNzgUlLzweQ99iSPnwmq52nQFIBD/QzezI9bf7qA5LejyuMq?=
 =?us-ascii?Q?Cyuq96JLsHQ75eaknrnB8rc0Lc5xWAbBHykEbXq5P95xQmXSgK023msTdwdn?=
 =?us-ascii?Q?wKGblV6kF05kBGGDfxbk2dE2wYF8RSvLX1LTNZMPx0P63WsLm5q3254WqfWk?=
 =?us-ascii?Q?ec7cOVsN7vfoKuD7MhnAY8rqQKxul4S6XKQfkmj5/84nGxErQkNKmir/9Gnx?=
 =?us-ascii?Q?317YXG92QDbfWxGJE15xCEMERQutl/bsAKqfm7hXe9494vm6ljz4DA/mlCvv?=
 =?us-ascii?Q?fOJYaUqqW4T0fgz6tELjG6ZMVDJ0KLH5VR2JM2JhupVaSyN/usr2L/wjoIsx?=
 =?us-ascii?Q?ed/mzJT6EIVzLpVFTx+QJlnfVopzNAxKShORexsfDmmg2JBdF3C6FOggI0fU?=
 =?us-ascii?Q?a7xKnr/rofRzxT0LwGkrgEXUMlH1RV0Hi4CfaJSK9yxaoHIay7vOG9uDDy4n?=
 =?us-ascii?Q?wlYb2yGTdEDCt5Lfg6E7LNxsrhApRSg+8OwQ12//+jk4WVBFp7/NF3tr6bF9?=
 =?us-ascii?Q?fgksIMwu+o6NG42tFDsbCCdcJvFctYwFU+0cOQS4I0lAkhSGv2Yh709ntnxa?=
 =?us-ascii?Q?/XwEzhpBkCcGdsCZyuOFw8a5m1TjzdeFG41uGv+gE9pPUqFz2aW3Seyocejb?=
 =?us-ascii?Q?tDFs2SvOljabPVz7Tlyrt9UxzJUOPEbmZY1pgASb0ncHGHspp8eZWqjCoDBA?=
 =?us-ascii?Q?uvin6TFpM8Pq80r7lnAUry0bm8uViELWccgmvIYP/hqo2mGx0B9HheRE7fE5?=
 =?us-ascii?Q?lDTAx7amL6vBUxyy8pjgYjaLmJ08mMFrUlhwehNLCCQCg4ECcdXT7XJHMAkP?=
 =?us-ascii?Q?und/q/KFAukOnQpMSSZ07cMTEjolt2vGbmqSIeiFnG8j96BdSugfAKCr/hWu?=
 =?us-ascii?Q?MhB+7dT5aDaZ4D+b3efKZPtBvT55IVVHTjvMFFZBV45nquPospcOary4UyUR?=
 =?us-ascii?Q?S7w3J20G2DVLOvs/lVLPrHOJ4FPTMEMpK7zD8OtJP50tEg2EH0cDDY0AUlIo?=
 =?us-ascii?Q?reuEe9j73GiL4mRI2cnhrdqOVjvXm29F84Sn7Rwq6V8KKjtsvOm9GthUw5hX?=
 =?us-ascii?Q?X06lP0wC6+bWUtGjAe0etLPerAI58Jkw8sd/YvPS+ZKeJWSdi9aocv6lfSPs?=
 =?us-ascii?Q?mH8BVGjbDWcIjX3n31leKqlOAc4YGu+mFA6lV4o3ZD8r?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f+s40sOzMBGwc/Q0bGtm1WW1UdJV8OMEq79lUI3Xsh9pjB3tViPt32XV7hez?=
 =?us-ascii?Q?wWqullcbwnF8v7J2N2X86dh3yT/uTQEbTlopxnqcz6/bdJU3llaIMZxPu69O?=
 =?us-ascii?Q?F+ffrbUpFUeoYZAz/choFieK/v4cMiAkvhXlTTJXWdORQhHryNWz/6hTiDn5?=
 =?us-ascii?Q?0U0kQ5YHC70Kj2ic8qLpdZ/mwRq5/MZM2Re93lK+E0Wr0aj5E1Mc0ElUrzme?=
 =?us-ascii?Q?dhgdatb1gn01tAV78QALJiszJAeJ40qVtRHgth/TInlh2415vCmMzD2lU7KT?=
 =?us-ascii?Q?qWOMHTJ759KLckV5RqUGRe9eE0y1crysf5NBYuPRDEfYgRddUJJn3ZZ+uqA4?=
 =?us-ascii?Q?eG2Z+Sd99L4TFYpHnZWHLq/W5qdE3DOZSpgON7Mt8lYO4RMebMF9rQ8WtPDa?=
 =?us-ascii?Q?vNbp2VFRLp2QKtKXu1+PQTAIXNIVeEO3FaC6ZofA4Kh6kHVVcxJqzYQaLUgc?=
 =?us-ascii?Q?kDuP06tKp+LyutZXJ3vv6vAxgcxi0HWL353YIUPvInRXuNIskK7taQBo+2qy?=
 =?us-ascii?Q?CaToxAC1Nc0sIvJlwLaftEAiYh3EBVDpBMS5xQ1ihHKXdj08L3Xq8VLecC3v?=
 =?us-ascii?Q?e6+VPzZTNujc44xq1xYDKECNYcdM6L1GmEStmphy/SS1q3U/9uGZaEnZAhxI?=
 =?us-ascii?Q?qOWeE35UIXobnNFbP73VwceI1EOIDkrPoUZ/JgRSFtGXZJ5sCl1+Xj3WVl/+?=
 =?us-ascii?Q?JJU05reGYgVtznu3svKDFzGcctzYVQf2BHr4F3S18ShxfEjiZDAfcX+uOq/Z?=
 =?us-ascii?Q?q6FLwzSff6ceq32ck9HZrdjJX6ICR3VtPAfO0jyNdEtOTHRFXSKtajBKOpDf?=
 =?us-ascii?Q?30CT5vYj4RSu0LovPmCIDJLdxFvx4ANl6jFv5CXAlaxK3A5+MyWQhtFO3C2J?=
 =?us-ascii?Q?EcJkgpe7BS2VRYCtopbDIoORa7aEL3PLY4hMKVoWsG/Bm7VEqRynDbhryj8c?=
 =?us-ascii?Q?akrMYpfwBUqhl0Q4rehM18hfLw7sGpmI/xkWNcPmgSuJSD0u8QSLnbqvjSoo?=
 =?us-ascii?Q?HBgZWiBmwnZUm/zhbKKHRttesuii514v+bI1FUXFlaEaaOhD6Bv7J//8GZF7?=
 =?us-ascii?Q?9izyEaq8GSI5/CZDrC/t9/wvyKRIzS5riuNRsNPLn13N56u59PH9hxPeJvpx?=
 =?us-ascii?Q?O36xM0q/0AQYXk7Y3HJ133OSKxWCXP9mAXvk/OTryyY7lvZmqUgOLyRBzhFQ?=
 =?us-ascii?Q?CpWpUIDmufIeG0MNvEUYZeoS2hns42cGRnDT8GFzt3fAVoi7h8u8WMkoOFu0?=
 =?us-ascii?Q?9h+tWg5DSsvSME+QK1O8oREb8SG5vtcKTQl1jejYG0y6UWlzcqbjQcqc3004?=
 =?us-ascii?Q?alaOG0ZR1SJPB1RqNWHWP1D/VdtEV6OrBE8A51RXxk7afHKkii/1YwDkOEY9?=
 =?us-ascii?Q?2LTXk40z2du0rP580A2nDCTEPhkNO2dy9/k/MFrGMWooNcigYHnEWetes6mt?=
 =?us-ascii?Q?uizAxDaIZLi+8X8ilIGFyjrgszzKmM1/gPjk02WXpxSkzjOEMAo7A0C3iw8/?=
 =?us-ascii?Q?Q2zepEPHVZ6JR+jwHeyxHp4AF84jxNDMm1mUyzsTk0jbKd555ciBXg5gUsma?=
 =?us-ascii?Q?NuVVNTz6t6xwOfObXRKsUun6pTUFiN27eM09R0VimmTr8m1IaYZrCcNCx6wW?=
 =?us-ascii?Q?OPmf+T9YvdFBAEwW9RKca7dJrOWtZogqhiBw8fm7VbJaLE6ozrDyQSKm/79I?=
 =?us-ascii?Q?ttxa3SgvA1ijohB79Nul4Ds9orJSvnducDLJPrEBiSlp9evIpT0IFQYIaEOd?=
 =?us-ascii?Q?tCM4Ew0K4Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2524540-3a86-42cf-2949-08de6a7f0026
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 21:38:03.2311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zy3P4MF51SXkaOorn6MzoQaFAXTuf9DxfWlxU+d7AJjWg5lQO8hMfSoAEYxC1rS8jLoFn1K5ft5W13l6a3vrBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7936
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31643-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,foss.st.com,bgdev.pl,lunn.ch];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,lunn.ch:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5504E1314D9
X-Rspamd-Action: no action

On an AMP platform, the system may include two processors:
	- An MCU running an RTOS
	- An MPU running Linux

These processors communicate via the RPMSG protocol.
The driver implements the standard GPIO interface, allowing
the Linux side to control GPIO controllers which reside in
the remote processor via RPMSG protocol.

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/gpio/Kconfig      |  17 ++
 drivers/gpio/Makefile     |   1 +
 drivers/gpio/gpio-rpmsg.c | 588 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 606 insertions(+)
 create mode 100644 drivers/gpio/gpio-rpmsg.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b45fb799e36c..3179a54f0634 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1892,6 +1892,23 @@ config GPIO_SODAVILLE
 
 endmenu
 
+menu "RPMSG GPIO drivers"
+	depends on RPMSG
+
+config GPIO_RPMSG
+	tristate "Generic RPMSG GPIO support"
+	depends on REMOTEPROC
+	select GPIOLIB_IRQCHIP
+	default REMOTEPROC
+	help
+	  Say yes here to support the generic GPIO functions over the RPMSG
+	  bus. Currently supported devices: i.MX7ULP, i.MX8ULP, i.MX8x, and
+	  i.MX9x.
+
+	  If unsure, say N.
+
+endmenu
+
 menu "SPI GPIO expanders"
 	depends on SPI_MASTER
 
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index c05f7d795c43..501aba56ad68 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -158,6 +158,7 @@ obj-$(CONFIG_GPIO_RDC321X)		+= gpio-rdc321x.o
 obj-$(CONFIG_GPIO_REALTEK_OTTO)		+= gpio-realtek-otto.o
 obj-$(CONFIG_GPIO_REG)			+= gpio-reg.o
 obj-$(CONFIG_GPIO_ROCKCHIP)	+= gpio-rockchip.o
+obj-$(CONFIG_GPIO_RPMSG)		+= gpio-rpmsg.o
 obj-$(CONFIG_GPIO_RTD)			+= gpio-rtd.o
 obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
 obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
diff --git a/drivers/gpio/gpio-rpmsg.c b/drivers/gpio/gpio-rpmsg.c
new file mode 100644
index 000000000000..163f51fd45b5
--- /dev/null
+++ b/drivers/gpio/gpio-rpmsg.c
@@ -0,0 +1,588 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2026 NXP
+ *
+ * The driver exports a standard gpiochip interface to control
+ * the GPIO controllers via RPMSG on a remote processor.
+ */
+#include <linux/completion.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/irqdomain.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/remoteproc.h>
+#include <linux/rpmsg.h>
+
+#define RPMSG_GPIO_ID		5
+#define RPMSG_VENDOR		1
+#define RPMSG_VERSION		0
+
+#define GPIOS_PER_PORT_DEFAULT	32
+#define RPMSG_TIMEOUT		1000
+
+/* GPIO RPMSG header type */
+#define GPIO_RPMSG_SETUP	0
+#define GPIO_RPMSG_REPLY	1
+#define GPIO_RPMSG_NOTIFY	2
+
+/* GPIO Interrupt trigger type */
+#define GPIO_RPMSG_TRI_IGNORE		0
+#define GPIO_RPMSG_TRI_RISING		1
+#define GPIO_RPMSG_TRI_FALLING		2
+#define GPIO_RPMSG_TRI_BOTH_EDGE	3
+#define GPIO_RPMSG_TRI_LOW_LEVEL	4
+#define GPIO_RPMSG_TRI_HIGH_LEVEL	5
+
+/* GPIO RPMSG commands */
+#define GPIO_RPMSG_INPUT_INIT		0
+#define GPIO_RPMSG_OUTPUT_INIT		1
+#define GPIO_RPMSG_INPUT_GET		2
+#define GPIO_RPMSG_DIRECTION_GET	3
+
+#define MAX_PORT_PER_CHANNEL    10
+
+/*
+ * @rproc_name: the name of the remote proc.
+ * @channel_devices: an array of the devices related to the rpdev.
+ */
+struct rpdev_drvdata {
+	const char *rproc_name;
+	void *channel_devices[MAX_PORT_PER_CHANNEL];
+};
+
+struct gpio_rpmsg_head {
+	u8 id;		/* Message ID Code */
+	u8 vendor;	/* Vendor ID number */
+	u8 version;	/* Vendor-specific version number */
+	u8 type;	/* Message type */
+	u8 cmd;		/* Command code */
+	u8 reserved[5];
+} __packed;
+
+struct gpio_rpmsg_packet {
+	struct gpio_rpmsg_head header;
+	u8 pin_idx;
+	u8 port_idx;
+	union {
+		u8 event;
+		u8 retcode;
+		u8 value;
+	} out;
+	union {
+		u8 wakeup;
+		u8 value;
+	} in;
+} __packed __aligned(8);
+
+struct gpio_rpmsg_pin {
+	u8 irq_shutdown;
+	u8 irq_unmask;
+	u8 irq_mask;
+	u32 irq_wake_enable;
+	u32 irq_type;
+	struct gpio_rpmsg_packet msg;
+};
+
+struct gpio_rpmsg_info {
+	struct rpmsg_device *rpdev;
+	struct gpio_rpmsg_packet *reply_msg;
+	struct completion cmd_complete;
+	struct mutex lock;
+	void **port_store;
+};
+
+struct rpmsg_gpio_port {
+	struct gpio_chip gc;
+	struct gpio_rpmsg_pin gpio_pins[GPIOS_PER_PORT_DEFAULT];
+	struct gpio_rpmsg_info info;
+	u32 ngpios;
+	u32 idx;
+};
+
+static int gpio_send_message(struct rpmsg_gpio_port *port,
+			     struct gpio_rpmsg_packet *msg,
+			     bool sync)
+{
+	struct gpio_rpmsg_info *info = &port->info;
+	int err;
+
+	reinit_completion(&info->cmd_complete);
+	err = rpmsg_send(info->rpdev->ept, msg, sizeof(struct gpio_rpmsg_packet));
+	if (err) {
+		dev_err(&info->rpdev->dev, "rpmsg_send failed: %d\n", err);
+		return err;
+	}
+
+	if (sync) {
+		err = wait_for_completion_timeout(&info->cmd_complete,
+						  msecs_to_jiffies(RPMSG_TIMEOUT));
+		if (err == 0) {
+			dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
+			return -ETIMEDOUT;
+		}
+
+		if (info->reply_msg->out.retcode != 0) {
+			dev_err(&info->rpdev->dev, "remote core replies an error: %d!\n",
+				info->reply_msg->out.retcode);
+			return -EINVAL;
+		}
+
+		/* copy the reply message */
+		memcpy(&port->gpio_pins[info->reply_msg->pin_idx].msg,
+		       info->reply_msg, sizeof(*info->reply_msg));
+	}
+
+	return 0;
+}
+
+static struct gpio_rpmsg_packet *gpio_setup_msg_common(struct rpmsg_gpio_port *port,
+						       unsigned int offset,
+						       u8 cmd)
+{
+	struct gpio_rpmsg_packet *msg = &port->gpio_pins[offset].msg;
+
+	memset(msg, 0, sizeof(struct gpio_rpmsg_packet));
+	msg->header.id = RPMSG_GPIO_ID;
+	msg->header.vendor = RPMSG_VENDOR;
+	msg->header.version = RPMSG_VERSION;
+	msg->header.type = GPIO_RPMSG_SETUP;
+	msg->header.cmd = cmd;
+	msg->pin_idx = offset;
+	msg->port_idx = port->idx;
+
+	return msg;
+}
+
+static int rpmsg_gpio_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_packet *msg;
+	int ret;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = gpio_setup_msg_common(port, gpio, GPIO_RPMSG_INPUT_GET);
+
+	ret = gpio_send_message(port, msg, true);
+	if (!ret)
+		ret = !!port->gpio_pins[gpio].msg.in.value;
+
+	return ret;
+}
+
+static int rpmsg_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_packet *msg;
+	int ret;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = gpio_setup_msg_common(port, gpio, GPIO_RPMSG_DIRECTION_GET);
+
+	ret = gpio_send_message(port, msg, true);
+	if (!ret)
+		ret = !!port->gpio_pins[gpio].msg.in.value;
+
+	return ret;
+}
+
+static int rpmsg_gpio_direction_input(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_packet *msg;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = gpio_setup_msg_common(port, gpio, GPIO_RPMSG_INPUT_INIT);
+
+	return gpio_send_message(port, msg, true);
+}
+
+static int rpmsg_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_packet *msg;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = gpio_setup_msg_common(port, gpio, GPIO_RPMSG_OUTPUT_INIT);
+	msg->out.value = val;
+
+	return gpio_send_message(port, msg, true);
+}
+
+static int rpmsg_gpio_direction_output(struct gpio_chip *gc,
+				       unsigned int gpio,
+				       int val)
+{
+	return rpmsg_gpio_set(gc, gpio, val);
+}
+
+static int gpio_rpmsg_irq_set_type(struct irq_data *d, u32 type)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+	int edge = 0;
+	int ret = 0;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+		edge = GPIO_RPMSG_TRI_RISING;
+		irq_set_handler_locked(d, handle_simple_irq);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		edge = GPIO_RPMSG_TRI_FALLING;
+		irq_set_handler_locked(d, handle_simple_irq);
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		edge = GPIO_RPMSG_TRI_BOTH_EDGE;
+		irq_set_handler_locked(d, handle_simple_irq);
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		edge = GPIO_RPMSG_TRI_LOW_LEVEL;
+		irq_set_handler_locked(d, handle_level_irq);
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		edge = GPIO_RPMSG_TRI_HIGH_LEVEL;
+		irq_set_handler_locked(d, handle_level_irq);
+		break;
+	default:
+		ret = -EINVAL;
+		irq_set_handler_locked(d, handle_bad_irq);
+		break;
+	}
+
+	port->gpio_pins[gpio_idx].irq_type = edge;
+
+	return ret;
+}
+
+static int gpio_rpmsg_irq_set_wake(struct irq_data *d, u32 enable)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+
+	port->gpio_pins[gpio_idx].irq_wake_enable = enable;
+
+	return 0;
+}
+
+/*
+ * This unmask/mask function is invoked in two situations:
+ *   - when an interrupt is being set up, and
+ *   - after an interrupt has occurred.
+ *
+ * The GPIO driver does not access hardware registers directly.
+ * Instead, it caches all relevant information locally, and then sends
+ * the accumulated state to the remote system at this stage.
+ */
+static void gpio_rpmsg_unmask_irq(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+
+	port->gpio_pins[gpio_idx].irq_unmask = 1;
+}
+
+static void gpio_rpmsg_mask_irq(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+
+	/*
+	 * When an interrupt occurs, the remote system masks the interrupt
+	 * and then sends a notification to Linux. After Linux processes
+	 * that notification, it sends an RPMsg command back to the remote
+	 * system to unmask the interrupt again.
+	 */
+	port->gpio_pins[gpio_idx].irq_mask = 1;
+}
+
+static void gpio_rpmsg_irq_shutdown(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+
+	port->gpio_pins[gpio_idx].irq_shutdown = 1;
+}
+
+static void gpio_rpmsg_irq_bus_lock(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+
+	mutex_lock(&port->info.lock);
+}
+
+static void gpio_rpmsg_irq_bus_sync_unlock(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	struct gpio_rpmsg_packet *msg = NULL;
+	u32 gpio_idx = d->hwirq;
+
+	/*
+	 * For mask irq, do nothing here.
+	 * The remote system will mask interrupt after an interrupt occurs,
+	 * and then send a notify to Linux system.
+	 * After Linux system dealt with the notify, it will send an rpmsg to
+	 * the remote system to unmask this interrupt again.
+	 */
+	if (port->gpio_pins[gpio_idx].irq_mask && !port->gpio_pins[gpio_idx].irq_unmask) {
+		port->gpio_pins[gpio_idx].irq_mask = 0;
+		mutex_unlock(&port->info.lock);
+		return;
+	}
+
+	msg = gpio_setup_msg_common(port, gpio_idx, GPIO_RPMSG_INPUT_INIT);
+
+	if (port->gpio_pins[gpio_idx].irq_shutdown) {
+		msg->out.event = GPIO_RPMSG_TRI_IGNORE;
+		msg->in.wakeup = 0;
+		port->gpio_pins[gpio_idx].irq_shutdown = 0;
+	} else {
+		/* if not set irq type, then use low level as trigger type */
+		msg->out.event = port->gpio_pins[gpio_idx].irq_type;
+		if (!msg->out.event)
+			msg->out.event = GPIO_RPMSG_TRI_LOW_LEVEL;
+		if (port->gpio_pins[gpio_idx].irq_unmask) {
+			msg->in.wakeup = 0;
+			port->gpio_pins[gpio_idx].irq_unmask = 0;
+		} else /* irq set wake */
+			msg->in.wakeup = port->gpio_pins[gpio_idx].irq_wake_enable;
+	}
+
+	gpio_send_message(port, msg, false);
+	mutex_unlock(&port->info.lock);
+}
+
+static const struct irq_chip gpio_rpmsg_irq_chip = {
+	.irq_mask = gpio_rpmsg_mask_irq,
+	.irq_unmask = gpio_rpmsg_unmask_irq,
+	.irq_set_wake = gpio_rpmsg_irq_set_wake,
+	.irq_set_type = gpio_rpmsg_irq_set_type,
+	.irq_shutdown = gpio_rpmsg_irq_shutdown,
+	.irq_bus_lock = gpio_rpmsg_irq_bus_lock,
+	.irq_bus_sync_unlock = gpio_rpmsg_irq_bus_sync_unlock,
+	.flags = IRQCHIP_IMMUTABLE,
+};
+
+static void rpmsg_gpio_remove_action(void *data)
+{
+	struct rpmsg_gpio_port *port = data;
+
+	port->info.port_store[port->idx] = NULL;
+}
+
+static int rpmsg_gpiochip_register(struct rpmsg_device *rpdev, struct device_node *np)
+{
+	struct rpdev_drvdata *drvdata = dev_get_drvdata(&rpdev->dev);
+	struct rpmsg_gpio_port *port;
+	struct gpio_irq_chip *girq;
+	struct gpio_chip *gc;
+	int ret;
+
+	port = devm_kzalloc(&rpdev->dev, sizeof(*port), GFP_KERNEL);
+	if (!port)
+		return -ENOMEM;
+
+	ret = of_property_read_u32(np, "reg", &port->idx);
+	if (ret)
+		return ret;
+
+	if (port->idx >= MAX_PORT_PER_CHANNEL)
+		return -EINVAL;
+
+	ret = devm_mutex_init(&rpdev->dev, &port->info.lock);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u32(np, "ngpios", &port->ngpios);
+	if (ret)
+		port->ngpios = GPIOS_PER_PORT_DEFAULT;
+
+	init_completion(&port->info.cmd_complete);
+	port->info.reply_msg = devm_kzalloc(&rpdev->dev,
+					    sizeof(struct gpio_rpmsg_packet),
+					    GFP_KERNEL);
+	port->info.port_store = drvdata->channel_devices;
+	port->info.port_store[port->idx] = port;
+	port->info.rpdev = rpdev;
+
+	gc = &port->gc;
+	gc->owner = THIS_MODULE;
+	gc->parent = &rpdev->dev;
+	gc->fwnode = of_fwnode_handle(np);
+	gc->ngpio = port->ngpios;
+	gc->base = -1;
+	gc->label = devm_kasprintf(&rpdev->dev, GFP_KERNEL, "%s-gpio%d",
+				   drvdata->rproc_name, port->idx);
+
+	gc->direction_input = rpmsg_gpio_direction_input;
+	gc->direction_output = rpmsg_gpio_direction_output;
+	gc->get_direction = rpmsg_gpio_get_direction;
+	gc->get = rpmsg_gpio_get;
+	gc->set = rpmsg_gpio_set;
+
+	girq = &gc->irq;
+	gpio_irq_chip_set_chip(girq, &gpio_rpmsg_irq_chip);
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->chip->name = devm_kasprintf(&rpdev->dev, GFP_KERNEL, "%s-gpio%d",
+					  drvdata->rproc_name, port->idx);
+
+	ret = devm_add_action_or_reset(&rpdev->dev, rpmsg_gpio_remove_action, port);
+	if (ret)
+		return ret;
+
+	return devm_gpiochip_add_data(&rpdev->dev, gc, port);
+}
+
+static const char *rpmsg_get_rproc_node_name(struct rpmsg_device *rpdev)
+{
+	const char *name = NULL;
+	struct device_node *np;
+	struct rproc *rproc;
+
+	rproc = rproc_get_by_child(&rpdev->dev);
+
+	if (!rproc)
+		return NULL;
+
+	np = of_node_get(rproc->dev.of_node);
+	if (!np && rproc->dev.parent)
+		np = of_node_get(rproc->dev.parent->of_node);
+
+	if (np) {
+		name = devm_kstrdup(&rpdev->dev, np->name, GFP_KERNEL);
+		of_node_put(np);
+	}
+
+	return name;
+}
+
+static struct device_node *
+rpmsg_get_channel_ofnode(struct rpmsg_device *rpdev, char *chan_name)
+{
+	struct device_node *np_chan = NULL, *np;
+	struct rproc *rproc;
+
+	rproc = rproc_get_by_child(&rpdev->dev);
+	if (!rproc)
+		return NULL;
+
+	np = of_node_get(rproc->dev.of_node);
+	if (!np && rproc->dev.parent)
+		np = of_node_get(rproc->dev.parent->of_node);
+
+	if (np) {
+		/* Balance the of_node_put() performed by of_find_node_by_name(). */
+		of_node_get(np);
+		np_chan = of_find_node_by_name(np, chan_name);
+		of_node_put(np);
+	}
+
+	return np_chan;
+}
+
+static int
+rpmsg_gpio_channel_callback(struct rpmsg_device *rpdev, void *data,
+			    int len, void *priv, u32 src)
+{
+	struct gpio_rpmsg_packet *msg = data;
+	struct rpmsg_gpio_port *port = NULL;
+	struct rpdev_drvdata *drvdata;
+
+	drvdata = dev_get_drvdata(&rpdev->dev);
+	if (drvdata && msg && msg->port_idx < MAX_PORT_PER_CHANNEL)
+		port = drvdata->channel_devices[msg->port_idx];
+
+	if (!port)
+		return -ENODEV;
+
+	if (msg->header.type == GPIO_RPMSG_REPLY) {
+		*port->info.reply_msg = *msg;
+		complete(&port->info.cmd_complete);
+	} else if (msg->header.type == GPIO_RPMSG_NOTIFY) {
+		generic_handle_domain_irq_safe(port->gc.irq.domain, msg->pin_idx);
+	} else
+		dev_err(&rpdev->dev, "wrong command type!\n");
+
+	return 0;
+}
+
+static int rpmsg_gpio_channel_probe(struct rpmsg_device *rpdev)
+{
+	struct device *dev = &rpdev->dev;
+	struct rpdev_drvdata *drvdata;
+	struct device_node *np;
+	int ret;
+
+	if (!dev->of_node) {
+		np = rpmsg_get_channel_ofnode(rpdev, rpdev->id.name);
+		if (np) {
+			dev->of_node = np;
+			set_primary_fwnode(dev, of_fwnode_handle(np));
+		}
+		return -EPROBE_DEFER;
+	}
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	drvdata->rproc_name = rpmsg_get_rproc_node_name(rpdev);
+	dev_set_drvdata(dev, drvdata);
+
+	for_each_child_of_node_scoped(dev->of_node, child) {
+		if (!of_device_is_available(child))
+			continue;
+
+		if (!of_match_node(dev->driver->of_match_table, child))
+			continue;
+
+		ret = rpmsg_gpiochip_register(rpdev, child);
+		if (ret < 0)
+			dev_err(dev, "Failed to register: %pOF\n", child);
+	}
+
+	return 0;
+}
+
+static void rpmsg_gpio_channel_remove(struct rpmsg_device *rpdev)
+{
+	dev_info(&rpdev->dev, "rpmsg gpio channel driver is removed\n");
+}
+
+static const struct of_device_id rpmsg_gpio_dt_ids[] = {
+	{ .compatible = "rpmsg-gpio" },
+	{ /* sentinel */ }
+};
+
+static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
+	{ .name	= "rpmsg-io-channel" },
+	{ },
+};
+MODULE_DEVICE_TABLE(rpmsg, rpmsg_gpio_channel_id_table);
+
+static struct rpmsg_driver rpmsg_gpio_channel_client = {
+	.drv.name	= KBUILD_MODNAME,
+	.drv.of_match_table = rpmsg_gpio_dt_ids,
+	.id_table	= rpmsg_gpio_channel_id_table,
+	.probe		= rpmsg_gpio_channel_probe,
+	.callback	= rpmsg_gpio_channel_callback,
+	.remove		= rpmsg_gpio_channel_remove,
+};
+module_rpmsg_driver(rpmsg_gpio_channel_client);
+
+MODULE_AUTHOR("Shenwei Wang <shenwei.wang@nxp.com>");
+MODULE_DESCRIPTION("generic rpmsg gpio driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


