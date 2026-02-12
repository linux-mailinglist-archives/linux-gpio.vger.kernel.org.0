Return-Path: <linux-gpio+bounces-31641-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFAIL1dIjmm9BQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31641-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 22:38:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 683551314C9
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 22:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F02831167F8
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 21:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09CBC3590A2;
	Thu, 12 Feb 2026 21:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="B+2kif12"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013001.outbound.protection.outlook.com [40.107.159.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178D233120E;
	Thu, 12 Feb 2026 21:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770932276; cv=fail; b=uZoPUR6prgMbFnQlFHUz0mfZT5afm8LE6DTHO4juBpQnwZY8+xySTYxFgXHLHjpl7HWHQhKGGyZ/ml7Nc8cD8U1ltqwkI0Bc6ZPSQD3/XuNa24NEKjDYfqTG+QMlru1qYkZEkLXpOPQiJ2If/iIcyEfNa+Ao0Wj3vgMW8kIm9w4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770932276; c=relaxed/simple;
	bh=APEsHsPA+SRYAQb56wdUX3R6FUPFjBh/Kb6DW9xMkTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=elzAOQGXXIDr8vcEXldvnwLomxqmiuDedqw2nXBrgiCEpJ86SxARiy3YNTugoI0hRFaKoWxk7fnQycl+NRSauPTOUjdcBgGrggXt2RgNRvvkdjiMiyIwRP7NPiBfIRlTRs2XEB6rS4yecDZMN0hnept5XjYJAeNP54ugh2wt4qw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=B+2kif12; arc=fail smtp.client-ip=40.107.159.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mujHw5puhkoJpoBUE0rIgSCPBa9VKkCaXHrbxkHAO6ONvUCLMLOvK27JX34jW+K8w+yhUTBHGectfEG4JijfKOTm6h2FwC2i3A0BrnZ/ceMNosmUVJfkCUUTWKOCxoGW27pDc4lpYTAn/EqxvkYjasx2MIR/ePgq03CiBHg9HipIWis71lSqp4+bI2RQSneU+XF8XRp6hMCajY4lZc/emYZr/h16/VwOO4ubw01MSPMv8bUGc3KaxnuVrB5pMAdkdf2y3VsNabnh99hLcCnom3DqfmqZY8OJi32We2aDWpKmtvNU3UysspFtk1hb474XqmaFdvHMpL9loNNWu6/A1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WebKrxRlyhQT8ggoK9Qy7iVHQbwQ7XNNHQo1FQKijFo=;
 b=bMtab+/7leM5yye7IFI21f0an81BqHeGPMyrq7FyxwMM/uvicly8sBsCf8iH6RDApJo7eSEJ7CTMuwG0UHS/pDtfk26NVA8nXJAL/r7wy55EPM7Y9fqTE9sOJMI5V1/5Tz74ftyUGFQC9oQI+o5ux3YPXMazpSTsVhs8BdC3zwkez/Bq1pkKKEVZwZeXZarUMcx39F0xRpDM+Eam1HXE/95U0i7m2oWUYMOcUuaIwGlmKI2tivW+M9FYpLbOQAvdQGyQjaaZZXiEgMKykKiwBcmjmrbwMGY1ch/OoJNgADs9pITkShvwdBAR2069p1TX81jUJOgpLnXRoOXkltBhfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WebKrxRlyhQT8ggoK9Qy7iVHQbwQ7XNNHQo1FQKijFo=;
 b=B+2kif12fv3/l+UIE4lY0wXpITaE1YCRBUIB740M+SXEH+Ii4HlSjqu3WFN7vRWnjPDVk+gBoOejFX7jo3Z4xcXILJgWGuyJUX+xphKgU4SFbqMMORiDx+qzUn1uAqu8StZLaiMLHr6TC7ujmkSPi4gRXCXnOwzis//0rrY0CdjxgD2tPIa9u52rzMMHUoADAfIGJ2bflwz7/LLKWYK6IiC/RhyCCBMjir2wLSBJX2xrv7SSCouX3+TEv03gl34Iny3hV1c6K7FFKPi17nLIZIoMZGwMCY/V9PjMqWU28dEmPyGk/LAnKiyjMNl6SDXQvwG2VjVGGA1aKqutC688CQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PA4PR04MB7936.eurprd04.prod.outlook.com (2603:10a6:102:c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 21:37:52 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 21:37:52 +0000
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
	arnaud.pouliquen@foss.st.com
Subject: [PATCH v8 1/4] docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
Date: Thu, 12 Feb 2026 15:36:53 -0600
Message-ID: <20260212213656.662437-2-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260212213656.662437-1-shenwei.wang@nxp.com>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0032.namprd17.prod.outlook.com
 (2603:10b6:510:323::22) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PA4PR04MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: 929dbb04-eb61-48b7-01df-08de6a7ef99a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|52116014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YMu7+0t73VkmJuPhcMej6BS2IqTbeqH8chb3NOBHXsb01q31d2MttSjRi8wG?=
 =?us-ascii?Q?9Or6ieIEzmUGUGG2s3T82O3tzRjYSunDpL69oGEe1GoiWZyJpVvrp7FbuMy0?=
 =?us-ascii?Q?9EzNLrQbZjz1lCPcsnMQlxMv3TlzCIkVZWkgpSNLvvcHViJ2sXYrRBuWGuKU?=
 =?us-ascii?Q?LLFFs+DqtGIs8GB6BvXTmFIcW7KoNTkl+0iIU2xt7zBMW3w6bqAkhSUk2J58?=
 =?us-ascii?Q?dd1aTa5Hpg2Jg+J0EGwzNoICRH40f+LWV6Rrlk7frEi0EzcvZXjIwQpjbluq?=
 =?us-ascii?Q?6BjkBxrV4BvnUbMBLkm8qNoJG/jAD+Ta2Zaa3oLIZ+dKLjTfu5SSdaa5+WH8?=
 =?us-ascii?Q?6w2S/jabzZ2HXqjIcUZtfPprBncAFA1+fYdOyTOXnFc+5yzTCA98iBlF2cQ0?=
 =?us-ascii?Q?ag5esdREt4hsalPoAkCbWZTzgDqESFJDEZRmIhEtkrSeMDAkYskbOlDl3AT+?=
 =?us-ascii?Q?8LK3P2IidsQ0w3nS0YzA76JsgUuKRijAba03QhO41dNJAdCJwSW+gMIdgFFK?=
 =?us-ascii?Q?miMrbrlVwfHDJsCc7VT22jR9KQfd+q6ppR0c0FGUOMotz3TSz4kKtm4eBtiF?=
 =?us-ascii?Q?VeO5UUiuuVwBxbJSvYElfbcAVwLuixmaq5dfAO2ltleQ0wM5yLfm9tcKhJ8B?=
 =?us-ascii?Q?yacPrh49LxkbPd/Bb9sz0K2+UEXuiaslCC18zy+xjsZkY4et+810oaH2h0jq?=
 =?us-ascii?Q?jGCTkiRYSMueh4tRNS4sy67yTNS476Y0rU87H4v9Tt3aais0qpda27ht6b5n?=
 =?us-ascii?Q?uc+Tr+9lNX1xa3sXOWYToM6KNpedLoT930paIbFuZRqN5Av7u9+AxOZHg8KI?=
 =?us-ascii?Q?9mmlJwBrr/UB0a/lCTD4WWlhpAiFpuzO7tW/yxWZ/3+5GUROQ5IP7ol01ana?=
 =?us-ascii?Q?r5mjjfEgTNaxvCW7xr5+lX4zzqzP3LubEobCli6nRL9IhgWpGNUK3WhgAb9e?=
 =?us-ascii?Q?yv5qGfEsWkgs78QUthWf5+dEGxJk97PoCixHBfOttkHrOI0rR+MhK/Fm/04y?=
 =?us-ascii?Q?kk35pyzbJlParjPaRCorrNDrskISiFugP2wlCWiOxhB6PpDiJHkcnM0YmYVZ?=
 =?us-ascii?Q?vV2HW59Hz0kTWCUmX2s8QszY82aEHj2dxsFpfsYoty4KE9UkNP4KHrHYVbix?=
 =?us-ascii?Q?sL4okSaF3k1cArBstJinpKRtItS0Rkvqi307eIfI6w5m5/oKKenWGhdtyAbf?=
 =?us-ascii?Q?pSPImPmKDvhwDl71c0hETrc8V9UwLGGuUMPqE1NbAuenjc19x5NlX7qoGPtm?=
 =?us-ascii?Q?uzP6q5hhRKQCrhbyWpCjLmOuqbpwVW4Gcv7Q7Yqr4AaoHoBwdHv+taBxF3kE?=
 =?us-ascii?Q?oVUMqBpad81eHeT43VyD2lxQ1NbrZHfEaRU/TMfpIrIK+1A31gp8JOg1C1pW?=
 =?us-ascii?Q?M3wIEeYXCrvzwU8Hcc0iHhtETE+vyxWZN+kDTeZlsFDMoWBkFymEl6Znov2z?=
 =?us-ascii?Q?585S3tptu/mRbQiatsTrIa0KJ2NE+oWhfWtPDoHQFDll8K5T5PcUzbfdKQ1P?=
 =?us-ascii?Q?9zJsiNUVcA4KuLyYR4ybSm4liY5QYuFFPMCWjzX9aCjKNjeRXRp/Usf738Eg?=
 =?us-ascii?Q?uC6YQcWFqjMoSBV0ZCAhevgF3ndK2OoTdCWBT4LEYcfcXkAn9g94MwR2QEJe?=
 =?us-ascii?Q?dICi70ZRNQ31NjvvDSuziugoJa+x7kWSqXUp9jTIUXXH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WC+gqONV/qMq+rEa58yWhSuYsSzBbFsxCOHiE4/r0xcjoWmPWeUuBzZCYMWU?=
 =?us-ascii?Q?e1t4sjcCtp7Fw/iVqH4qbgHHfhDcI3KjkLecrDlOXpjzlQEsiW8y2DIP66dS?=
 =?us-ascii?Q?JGHUJGcoZmgjCTREyftQL9l3YkMFS5s0YOJqq41ajHd19msyjdRXr6AVb4ZN?=
 =?us-ascii?Q?uqYbj9MMpth7NuPScBtSFScm2zwls+SM1peJjubZUaMbh+SIbuoO6NMs2g3m?=
 =?us-ascii?Q?0zI+EbzMPJl7Nu0QQ0NZCaDz/xsFfHaH8PQKp7RogIqpKddRKAxVBubsKWBp?=
 =?us-ascii?Q?Q/ydcGqTHlOzrI1eg2RgD+jz6wpzZ0in+hanZKHJjU9w0GCQ75fvSwTrGm4I?=
 =?us-ascii?Q?HUvx7H6DZpEl4YJ9XCTPG0Pbm7MpHrpraGxtqyQesRBBiI2y9Ig5BQccSZde?=
 =?us-ascii?Q?kQtv9WdiWxIKBxIpLrqwCB+GBC7DcXap92g1uCxRmadwUvGpi7JHN2W4gz2Y?=
 =?us-ascii?Q?ZycGE2m5J8e1xdBEnmecM7Fu39ntrU5+ONpO/M4FA8DRNKwaMKBWc3bmP7mm?=
 =?us-ascii?Q?An9RL7s9TxBLV1uB4m4m5whMKKt9UwfRNbOhy1V2Tl8w13c/QARa7VBL50TZ?=
 =?us-ascii?Q?jMDDxMQqG0Ul0R9iQJYnEuHSWqcS2TBmAqbl2QvBWRgbhc3vywZtsHl/w0AL?=
 =?us-ascii?Q?W0511R2oYaWG803SvyrgNK2kGz2rYEfoHBFuUgfyGuAY1GHO0DtY2hYMHtzX?=
 =?us-ascii?Q?PWxipxyMHi6mi+2K7tyoWaSEaHonBIOhP1R3DkF/m3HOQaMFyCYCIog8r+zC?=
 =?us-ascii?Q?bhRXV9zf5vQk1mHfxrUflwt48u5gB7Gkd3AngEDN0BrG6SBZ+63pcYD0u74a?=
 =?us-ascii?Q?/xvxPnAiKXe800+8PkbxfIULD636t+e7A9TN5IGGs/lJj/1uyUk1u//zZzuB?=
 =?us-ascii?Q?R9+YYRoLACZQ19c5o1SsAZzjQ7pGal/iRej0D+R5TjcwIclUDz8ZBJnJk1M2?=
 =?us-ascii?Q?hG75AChjuX/ZHPc1tfPtHv1o6OP6jGsvhIHaViPk991UtO6DTAI3AYtmJ2sl?=
 =?us-ascii?Q?A/p9Mx3ZPnOcyLIhDCmQOmFYxLUfQjAYPmUbFUBNccPd/GdHvYCgIJytumX7?=
 =?us-ascii?Q?4yGXpn1JPK3PzSRuTylVMq1fXzSJqkyBK7+Q88FC0bamxNMqbFH4Lx+L7Y4u?=
 =?us-ascii?Q?op0+7pBko8285ewA22wLp2JFC13WEDVQpq5dofRIYzSukX7/78eCH351GbIC?=
 =?us-ascii?Q?GcnIZbph0vr7Oln9fItT1o/KNbDe/e2IgZnzdfW9XN3CXnUU6EZA/nLnHxHq?=
 =?us-ascii?Q?9lNy81yqzSTjZW/nyzX/XPIbf/DVv791Kl6RYSy1oWXxax8+jfEWLdkoJrwq?=
 =?us-ascii?Q?clJx2u1FxjkaQbSE5RG1uzzrP+0g3efG+QCpHhy8MIzR0y6izbCUE9CvHGc+?=
 =?us-ascii?Q?4g0x/pWn9kPvc3PnhIJpxsS3rdxuIxevtdrJwywJ1DhaP6VEvDEi6rQEqPGz?=
 =?us-ascii?Q?8T//07V3qmwfvLZZhgLLNB99C5tyYGEzImSS/25kZAHZnr+2ngXaneiWdyOK?=
 =?us-ascii?Q?i+yChqT2vcoeNJ9RL/Ov/iUQmZN2qyYwdgkGAKVw/2OnDSFADgpxFToMDGG8?=
 =?us-ascii?Q?QRAlvXWeJuzAY7p/NBcQN8GYqj8kDZQdequXloxEBwrTGN7+M2v/LUln1+w3?=
 =?us-ascii?Q?iyDaD6rEoSV/OXMaB+SFIjYFHcGZx1CFxLjtX7rovzds7Ae6RSKNdTz90WT0?=
 =?us-ascii?Q?RwooP1MElrj3XUDx/EcoGCEm3Pzg5yxGVWWlSACTkal1BLIqstgWU6uUA3xB?=
 =?us-ascii?Q?Z2+f4vSuog=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 929dbb04-eb61-48b7-01df-08de6a7ef99a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 21:37:52.2146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNOrJAJJh+KFrAIpBfLyIxqPSeUwnPG7hrBTwXKKxPVPyu7UTzgxjkbHpuE/ADg84f0A7PQGbGXB3eoeBXEfVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7936
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31641-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,foss.st.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 683551314C9
X-Rspamd-Action: no action

Describes the gpio rpmsg transport protocol over the rpmsg bus between
the remote system and Linux.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 Documentation/driver-api/gpio/gpio-rpmsg.rst | 236 +++++++++++++++++++
 Documentation/driver-api/gpio/index.rst      |   1 +
 2 files changed, 237 insertions(+)
 create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst

diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst b/Documentation/driver-api/gpio/gpio-rpmsg.rst
new file mode 100644
index 000000000000..59eb0d49002a
--- /dev/null
+++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
@@ -0,0 +1,236 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+GPIO RPMSG Protocol
+===================
+
+The GPIO RPMSG transport protocol is used for communication and interaction
+with GPIO controllers located on remote cores on the RPMSG bus.
+
+Message Format
+--------------
+
+The RPMSG message consists of a 14-byte packet with the following layout:
+
+.. code-block:: none
+
+   +-----+-------+--------+-----+-----+------------+-----+-----+-----+----+
+   |0x00 |0x01   |0x02    |0x03 |0x04 |0x05..0x09  |0x0A |0x0B |0x0C |0x0D|
+   | ID  |vendor |version |type |cmd  |reserved[5] |line |port |  data    |
+   +-----+-------+--------+-----+-----+------------+-----+-----+-----+----+
+
+- **ID (Message Identification Code)**: Must be 0x5. Indicates the GPIO message.
+
+- **Vendor**: Vendor ID number.
+  - 0: Reserved
+  - 1: NXP
+
+- **Version**: Vendor-specific version number (such as software release).
+
+- **Type (Message Type)**: The message type can be one of:
+
+  - 0: GPIO_RPMSG_SETUP
+  - 1: GPIO_RPMSG_REPLY
+  - 2: GPIO_RPMSG_NOTIFY
+
+- **Cmd**: Command code, used for GPIO_RPMSG_SETUP messages.
+
+- **reserved[5]**: Reserved bytes. Should always be 0.
+
+- **line**: The GPIO line(pin) index of the port.
+
+- **port**: The GPIO port(bank) index.
+
+- **data**: See details in the command description below.
+
+GPIO Commands
+-------------
+
+Commands are specified in the **Cmd** field for **GPIO_RPMSG_SETUP** (Type=0) messages.
+
+The SETUP message is always sent from Linux to the remote firmware. Each
+SETUP corresponds to a single REPLY message. The GPIO driver should
+serialize messages and determine whether a REPLY message is required. If a
+REPLY message is expected but not received within the specified timeout
+period (currently 1 second in the Linux driver), the driver should return
+-ETIMEOUT.
+
+GPIO_RPMSG_INPUT_INIT (Cmd=0)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 0   |  0        |line |port | val | wk |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **val**: Interrupt trigger type.
+
+  - 0: Interrupt disabled
+  - 1: Rising edge trigger
+  - 2: Falling edge trigger
+  - 3: Both edge trigger
+  - 4: Low level trigger
+  - 5: High level trigger
+
+- **wk**: Wakeup enable.
+
+  The remote system should always aim to stay in a power-efficient state by
+  shutting down or clock-gating the GPIO blocks that aren't in use. Since
+  the remoteproc driver is responsible for managing the power states of the
+  remote firmware, the GPIO driver does not require to know the firmware's
+  running states.
+
+  When the wakeup bit is set, the remote firmware should configure the line
+  as a wakeup source. The firmware should send the notification message to
+  Linux after it is woken from the GPIO line.
+
+  - 0: Disable wakeup from GPIO
+  - 1: Enable wakeup from GPIO
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 1   | 1   |  0        |line |port | err | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **err**: Error code from the remote core.
+
+  - 0: Success
+  - 1: General error (Early remote software only returns this unclassified error)
+  - 2: Not supported (A command is not supported by the remote firmware)
+  - 3: Resource not available (The resource is not allocated to Linux)
+  - 4: Resource busy (The resource is already in use)
+  - 5: Parameter error
+
+GPIO_RPMSG_OUTPUT_INIT (Cmd=1)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 1   |  0        |line |port | val | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **val**: Output level.
+
+  - 0: Low
+  - 1: High
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 1   | 1   |  0        |line |port | err | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **err**: See above for definitions.
+
+GPIO_RPMSG_INPUT_GET (Cmd=2)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 2   |  0        |line |port | 0   | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D |
+   | 5   | 1   | 0   | 1   | 2   |  0        |line |port | err |level|
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
+
+- **err**: See above for definitions.
+
+- **level**: Input level.
+
+  - 0: Low
+  - 1: High
+
+GPIO_RPMSG_GET_DIRECTION (Cmd=3)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 3   |  0        |line |port | 0   | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+**Reply:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D |
+   | 5   | 1   | 0   | 1   | 3   |  0        |line |port | err | dir |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+-----+
+
+- **err**: See above for definitions.
+
+- **dir**: Direction.
+
+  - 0: Output
+  - 1: Input
+
+GPIO_RPMSG_NOTIFY_REPLY (Cmd=4)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+The reply message for the notification is optional. The remote firmware can
+implement it to simulate the interrupt acknowledgment behavior.
+
+**Request:**
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 0   | 4   |  0        |line |port |level| 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **line**: The GPIO line(pin) index of the port.
+- **port**: The GPIO port(bank) index.
+
+Notification Message
+--------------------
+
+Notifications are sent with **Type=2 (GPIO_RPMSG_NOTIFY)**:
+
+When a GPIO line asserts an interrupt on the remote processor, the firmware
+should immediately mask the corresponding interrupt source and send a
+notification message to the Linux. Upon completion of the interrupt
+handling on the Linux side, the driver should issue a
+**GPIO_RPMSG_INPUT_INIT** command to the firmware to unmask the interrupt.
+
+A Notification message can arrive between a SETUP and its REPLY message,
+and the driver is expected to handle this scenario.
+
+.. code-block:: none
+
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
+   | 5   | 1   | 0   | 2   | 0   |  0        |line |port |type | 0  |
+   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
+
+- **line**: The GPIO line(pin) index of the port.
+- **port**: The GPIO port(bank) index.
+- **type**: Optional parameter to indicate the trigger event type.
+
diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driver-api/gpio/index.rst
index bee58f709b9a..e5eb1f82f01f 100644
--- a/Documentation/driver-api/gpio/index.rst
+++ b/Documentation/driver-api/gpio/index.rst
@@ -16,6 +16,7 @@ Contents:
    drivers-on-gpio
    bt8xxgpio
    pca953x
+   gpio-rpmsg
 
 Core
 ====
-- 
2.43.0


