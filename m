Return-Path: <linux-gpio+bounces-38903-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JkD4BR1QPWqX1AgAu9opvQ
	(envelope-from <linux-gpio+bounces-38903-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 17:58:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 786466C73C1
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 17:58:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=jlkTRg6T;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38903-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38903-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7775330B4483
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 15:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F7130EF91;
	Thu, 25 Jun 2026 15:55:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011025.outbound.protection.outlook.com [52.101.65.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691C73AC0F5;
	Thu, 25 Jun 2026 15:55:09 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782402917; cv=fail; b=thPmVAvnVefxd7D/jatCvXu7SgSyiw/Ou1jAd4KbUda+CK6ELgfaeq6EaKSWFmlSLiWwkDZjC0g2cWKYrO6AdzPWRY9kIQ1hXht7KqgG55NBSdNOqikEd97Y2LCbkX2kMPNmhq9AuMEkGMQDxGDHewT4qGb8xjBYsJJtpFpuEHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782402917; c=relaxed/simple;
	bh=vTNrdpbNiN4seGydM48GH35mKWrR/cvxAF92t8Yxjdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EB+FG6bMmN2WzBNr/hOvnkCrkK2L1GkFms7tbGtPUDJ2CYFGIbHUPxc+t5+gmn3D2pR2C6D53TfTnNsLIHE+/xO0ZnQrHRzrFK/xvUAc+NqJ4V25V4V9k4cT4JzWscy7PxfHLVzDDQ5WmE9I28wj86Lj+SVAmvofVzDB7x8Bcxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jlkTRg6T; arc=fail smtp.client-ip=52.101.65.25
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/0uZCLAvTJmZA8AWWezDuR6fzJ03LObrhLRKfFwPjuprayjNL7jcuRDdQ4qHpSZjIDUSsXe8wPJ7KgGRDVtw2QUVnEWT2GYwVtuzAjF307HALhy8kStvDuSIPgf9x/1NF/nDA89mKa9ROApYR6xK9MuKePHKxiOtgixEj5n2OX0NN+DYJXUhQrLSCgqBLhU1ejknEMZLZAwpgBwOk2rFcOo55pd6TvaIg/97G0EeIrSb97bK1V+22Df0DRkw2uqj/w+emn1T0RxfSSSArFhTiG0EDDzwhElSnxdjp0d3dbv+T3YW6bMP+IFe5yTMS/LUZwLV7hbAAZ++YiUkDz3zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMf2c9sojrLqDjbz4i0r+AVVCu5krY6nmmowztdEUAA=;
 b=rzjv9v0MN3/sIbEzGPWJRsSuuw6PEtMYtzcoXrp66mypyXY0tlEznV54xsY3ofQI1v2dPBOu0E6CxH7NUfgTnXxdpi5XFDdpvIG2XdWrJ2vx8oKthNsHneBpO0KsgokDl7MMValZmtwqGMNGsmAcQ8RLW0w0Sly/bthvbRr6r0uwNUWjmeaA4acms0svpqBO+Asb5vYwLj3GjEI7aeZoAIsQYcsgQOKdeZvbTe3wq+ILL0uKmnDihGC19F67iNLX7T+9IdWr8fc1JLWo5zTyGU9RQyHddrGwLc7pujv+YUisYcg3FvYMnHO55Lkxv5aXelmR9ARZTPCqeX6Wnulw/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMf2c9sojrLqDjbz4i0r+AVVCu5krY6nmmowztdEUAA=;
 b=jlkTRg6T8PqxTuvaVXE3TZgua+kjirwCCtiFr1K2X+jq7HKmfIiqNhuAFxeD22ETHRjgWKhwNsi2bx9yQaxJb/NezU6i+gEUXQzvQBFj07N8SzpHzyDs+nwmrte1nRVSZpnPwGR7RIKkCYs24HAu6Idle5wJY1zY8+7Aq7N/dSYJ4niETF8lG0uvjFZRpD80lQztWVHeozSvNv1xP+dacIIXz3elRWQzOi/j0fWeQKngz8J04p51MEaqo/z1szMwKe5hGf1MiyJZ7OmC1IL6cWSuCO5ctfGBSjHIKiAOQo/BFrTaLCGtqYzA0AD1zR39gvrwlq6zIOyZqFKcWry2Yg==
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com (2603:10a6:800:12c::22)
 by VI1PR04MB9812.eurprd04.prod.outlook.com (2603:10a6:800:1d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 15:54:54 +0000
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4]) by VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4%6]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 15:54:54 +0000
From: Shenwei Wang <shenwei.wang@oss.nxp.com>
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
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com,
	Andrew Lunn <andrew@lunn.ch>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v14 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
Date: Thu, 25 Jun 2026 10:54:29 -0500
Message-ID: <20260625155432.815185-5-shenwei.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1PR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::8) To VI1PR04MB7135.eurprd04.prod.outlook.com
 (2603:10a6:800:12c::22)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7135:EE_|VI1PR04MB9812:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f87e521-ae52-4df5-1827-08ded2d21979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|19092799006|366016|1800799024|921020|6133799003|11063799006|5023799004|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	LNZoTMmtzOWoeP96Zrr95UO9qbox2xajcARBSfC+TXFfrq3IzVowW8gdv2MD+EXG0uIFLpp8ZOcz0WlJwxLWd0aOpOu9vHC28oX7JdPpM2OdWYLMFLUFXjZKEKek0xQQMZYykphCx0lm4tQ9HUmfAaSd1wTphEA0UGyPzvBiK0RHPjXrEtaM1jxOGl1l6CGtz1irZJxE+7ksiRNekPTBMRWv1w2aHsAP7hMUbr4du6D4DOUMtH8gi4Zs8TscrvgimuqfRhqduKGdMBGilh2Oj+BjIlSUpLLD6Isev3P7EzTcE/5DkxqdYClXzbDYV/K6RIJyJ8PSAC6OPGlpBWOLJ0ThKsV1G+Yrl8ZsikI7MY60s1Vl3r4HtQKOQ6tkE3htE3n/rkf3mzpuF8BuuN9tv3EjeSoGNOfCGrOH2NoH+dxFAJPbxM5F54l1fPLBUxE63C0gVtgxrkYezQycUSoSWFS8mdyxyXg1J9PtY7kuOpHjaoaS7VBwcaOAu2OcidywecdT29UeFxoKKzWwRbuOuNmdwGzEDrsKuLgBRvXdnflGdORgp1x4/bLKzIIHxdBxo9qMHQUhTuvHU6vqZI870ev4FZ19ehWEJy0e2mlTPmquCwrApdega+bnEqn5hKl8u3WBrENHzL4EGvZwtGQdG8aS77qOv1rPg2NCkAatE2Qch/E15r3HySkBmzxrL4//WZy+cagFsT8VPSBfuQTmrA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(19092799006)(366016)(1800799024)(921020)(6133799003)(11063799006)(5023799004)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hfzbyw8Mo0Q/n61Sx3LwqVNCjajgTSTSy4YPR309BisMFvhRWwJM3V46CmcY?=
 =?us-ascii?Q?13c6QILd2/iQxjrcVR4TOuenWEjcDK5aoA5Sd28kmwINNRjdmi+YIGl6iJjO?=
 =?us-ascii?Q?WEQd9scGM1cPrtjNw+1njDxhyqk9YRPyQPHRVE7FU6xT86dENGmeBfyFG3HW?=
 =?us-ascii?Q?IU1FCXmwWuHnhEWCWUBPQbxeVPeOlvLoOgDvFw6wrojsKwZ9dckFeN4s3rk6?=
 =?us-ascii?Q?x1NTAWNkedVP4i+OLyjRS2OPd4Zk+tnrvcS0FMzOkmWicSG1KmlXedB1ZUZJ?=
 =?us-ascii?Q?lrvZPucCLOTSpKJ6dlDo5bv95uRzR+4x/1Q4+3EgvUnU6gTeoJA/Ryjav9Cy?=
 =?us-ascii?Q?pry9R7V5xEGvhdRv9ucOHcZWTyuJ8UsQhG1iPfBIIcJDQ5C/kGWj1CFy/9+g?=
 =?us-ascii?Q?1/mybxz7XNEfukpiMQ7pbj9P4bB0NjyqnLoqKemr6n/HS2LMFTsf/RgJirNc?=
 =?us-ascii?Q?rjQWTxtCDd5Vm122Jl8koqY6ZoIaiN+VnCqvtBiscn1k9JmugpgkqLlWxsSW?=
 =?us-ascii?Q?6r6ajmaInOG3YPT2/A6rQ8M5K2Id6B5eS+/8p78/rasr55C2aKLn/G6nlBgs?=
 =?us-ascii?Q?NHbVQCQgEmP6sK+GdO88TCXrg9RFoYjaK16gpeRSntJEayNG5qH+Jam8m9e8?=
 =?us-ascii?Q?flgqN536ODRtxbFfpTaL46QKSg7RYCA8be1vQRlcM8EXwZLAfNM8WdpkHYE2?=
 =?us-ascii?Q?wLWiqdwDwTohWJbEFKuNqCeOzKMn3SZWirh6K+TfnHg7k9kBnl8elPQIxnO3?=
 =?us-ascii?Q?fcr6VxsUyxwf4qojmm0T8jYJLfFb0wIFfiDLUpRGs5VZN+7M8N474W6VdAFL?=
 =?us-ascii?Q?WuJyDAcEG4YivP8Qe6VCHmRTJD2OYknXwWkMAUOA6JWyYf79QFZTAYDaAAQy?=
 =?us-ascii?Q?1UUttfY9n3abif+4ZF4RdW+07cZGfPTT2dykXDM0xONVBxxsokwF8Dp1omnS?=
 =?us-ascii?Q?jXB7GucoaSaHey+VIthhTe5u7OtPLLNdrX42xoUieu3VzUw4mnSXYndw1f8O?=
 =?us-ascii?Q?aLu+AyK2jsscM4dx7RuJGzPojAErIifvULYUBD4b6uy9Zdz6acLibBNX9Q4P?=
 =?us-ascii?Q?XypFHsk0CJ2xaVuCFwOzId4bYUld14QOk/mMXA6Q1ckHN4+sOhY5kxqO3dLy?=
 =?us-ascii?Q?Mr8wFkBpgiy1w4tBtRt8f7M4LWoXSQPqCxN7DGmKPBDgNXFBX2rOimdP/doW?=
 =?us-ascii?Q?ImOrC86b4bhZ+BkBcY2sOjdobdHLTrc96WkzlUNNdwEFS5hTG580BABst+1S?=
 =?us-ascii?Q?ohtcAFJp0hXx2q4x6FH76Fn6nOmXNHDb1IA1sORAv4s8tz/SOcNa0AlnWFOl?=
 =?us-ascii?Q?caIrlokmN5Ny6stPf6fKMbZQFFg7+vxU+eP3dwNBCcHAQgdr2/a/amkqy7d9?=
 =?us-ascii?Q?czbhVwEERIZ3GCl5vmQkL24aPlhRpKwBIyxCMPg6qWnK+OEeK1OdBVzRGmAh?=
 =?us-ascii?Q?9ywvTi9+3mOV4XPZ/v+NBDQgWHmXo6u9nEQu81OWenzwM94JlBK24ang0nbU?=
 =?us-ascii?Q?e/QtoD/6ULOSS5eY5EhBOfSsbhfcSbolTaguNUGy7Xp7qxf9BH5GjJ9/GHRs?=
 =?us-ascii?Q?OdWT3qVs2ZMd3peWakdZ3NpYaHKHI73mFgOrr4LgebmPcmTftix1Y1MgFYOL?=
 =?us-ascii?Q?Et1KJPcWa3DvHToaDeWD3DuN5U2rc8UIOlslMs4ZnfIkndQZHxdtVRfP3Azf?=
 =?us-ascii?Q?1RNXo8SQyQCA793sW8x6Y1dFBnkaededzu6RxEzTAfABszCwg9f+XMdifXCQ?=
 =?us-ascii?Q?gBngn/uqXdj7yBi4n6jfNyEICZULRGBc5OmRTxLQxu0iG12OmKJA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f87e521-ae52-4df5-1827-08ded2d21979
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 15:54:54.6825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WI37TGTRSJkfPWHMmNpS2Lk7xspLmLzS93JAnf6zlvKJ4y59DSQW9Gpraklu3I9oWkc/sHgrFUhiSpZG8Y2g559AfdJuoyIb5oe9fuIUCQxxBPZYGfoedM3KYz8seGjx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9812
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:skhan@linuxfoundation.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shenwei.wang@nxp.com,m:peng.fan@nxp.com,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-imx@nxp.com,m:arnaud.pouliquen@foss.st.com,m:b-padhi@ti.com,m:andrew@lunn.ch,m:brgl@bgdev.pl,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shenwei.wang@oss.nxp.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38903-lists,linux-gpio=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@oss.nxp.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,foss.st.com,ti.com,lunn.ch,bgdev.pl];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 786466C73C1

From: Shenwei Wang <shenwei.wang@nxp.com>

On an AMP platform, the system may include multiple processors:
	- MCUs running an RTOS
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
 drivers/gpio/gpio-rpmsg.c | 568 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 586 insertions(+)
 create mode 100644 drivers/gpio/gpio-rpmsg.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 020e51e30317..4ad299fe3c6f 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1917,6 +1917,23 @@ config GPIO_SODAVILLE
 
 endmenu
 
+menu "RPMSG GPIO drivers"
+	depends on RPMSG
+
+config GPIO_RPMSG
+	tristate "Generic RPMSG GPIO support"
+	depends on OF && REMOTEPROC
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
index b267598b517d..ee75c0e65b8b 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -157,6 +157,7 @@ obj-$(CONFIG_GPIO_RDC321X)		+= gpio-rdc321x.o
 obj-$(CONFIG_GPIO_REALTEK_OTTO)		+= gpio-realtek-otto.o
 obj-$(CONFIG_GPIO_REG)			+= gpio-reg.o
 obj-$(CONFIG_GPIO_ROCKCHIP)	+= gpio-rockchip.o
+obj-$(CONFIG_GPIO_RPMSG)		+= gpio-rpmsg.o
 obj-$(CONFIG_GPIO_RTD)			+= gpio-rtd.o
 obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
 obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
diff --git a/drivers/gpio/gpio-rpmsg.c b/drivers/gpio/gpio-rpmsg.c
new file mode 100644
index 000000000000..332e2925a830
--- /dev/null
+++ b/drivers/gpio/gpio-rpmsg.c
@@ -0,0 +1,568 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2026 NXP
+ *
+ * The driver exports a standard gpiochip interface to control
+ * the GPIO controllers via RPMSG on a remote processor.
+ */
+
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
+#include <linux/virtio_gpio.h>
+
+#define GPIOS_PER_PORT_DEFAULT		32
+#define RPMSG_TIMEOUT			1000
+
+/* Additional commands beyond virtio-gpio */
+#define VIRTIO_GPIO_MSG_SET_WAKEUP	0x0010
+
+/* GPIO Receive MSG Type */
+#define GPIO_RPMSG_REPLY	1
+#define GPIO_RPMSG_NOTIFY	2
+
+#define CHAN_NAME_PREFIX	"rpmsg-io-"
+#define GPIO_COMPAT_STR		"rpmsg-gpio"
+
+struct rpmsg_gpio_response {
+	__u8 type;
+	union {
+		/* command reply */
+		struct {
+			__u8 status;
+			__u8 value;
+		};
+
+		/* interrupt notification */
+		struct {
+			__u8 line;
+			__u8 trigger; /* rising/falling/high/low */
+		};
+	};
+};
+
+struct rpmsg_gpio_line {
+	u8 irq_shutdown;
+	u8 irq_unmask;
+	u8 irq_mask;
+	u32 irq_wake_enable;
+	u32 irq_type;
+};
+
+struct rpmsg_gpio_port {
+	struct gpio_chip gc;
+	struct rpmsg_device *rpdev;
+	struct virtio_gpio_request *send_msg;
+	struct rpmsg_gpio_response *recv_msg;
+	struct completion cmd_complete;
+	struct mutex lock;
+	u32 ngpios;
+	u32 idx;
+	struct rpmsg_gpio_line lines[GPIOS_PER_PORT_DEFAULT];
+};
+
+static int rpmsg_gpio_send_message(struct rpmsg_gpio_port *port)
+{
+	int ret;
+
+	reinit_completion(&port->cmd_complete);
+
+	ret = rpmsg_send(port->rpdev->ept, port->send_msg, sizeof(*port->send_msg));
+	if (ret) {
+		dev_err(&port->rpdev->dev, "rpmsg_send failed: cmd=%d ret=%d\n",
+			port->send_msg->type, ret);
+		return ret;
+	}
+
+	ret = wait_for_completion_timeout(&port->cmd_complete,
+					  msecs_to_jiffies(RPMSG_TIMEOUT));
+	if (ret == 0) {
+		dev_err(&port->rpdev->dev, "rpmsg_send timeout! cmd=%d\n",
+			port->send_msg->type);
+		return -ETIMEDOUT;
+	}
+
+	if (unlikely(port->recv_msg->status != VIRTIO_GPIO_STATUS_OK)) {
+		dev_err(&port->rpdev->dev, "remote core replies an error: cmd=%d!\n",
+			port->send_msg->type);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static struct virtio_gpio_request *
+rpmsg_gpio_msg_prepare(struct rpmsg_gpio_port *port, u16 line, u16 cmd, u32 val)
+{
+	struct virtio_gpio_request *msg = port->send_msg;
+
+	msg->type = cmd;
+	msg->gpio = line;
+	msg->value = val;
+
+	return msg;
+}
+
+static int rpmsg_gpio_get(struct gpio_chip *gc, unsigned int line)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	int ret;
+
+	guard(mutex)(&port->lock);
+
+	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_GET_VALUE, 0);
+
+	ret = rpmsg_gpio_send_message(port);
+	return ret ? ret : port->recv_msg->value;
+}
+
+static int rpmsg_gpio_get_direction(struct gpio_chip *gc, unsigned int line)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	int ret;
+
+	guard(mutex)(&port->lock);
+
+	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_GET_DIRECTION, 0);
+
+	ret = rpmsg_gpio_send_message(port);
+	if (ret)
+		return ret;
+
+	switch (port->recv_msg->value) {
+	case VIRTIO_GPIO_DIRECTION_IN:
+		return GPIO_LINE_DIRECTION_IN;
+	case VIRTIO_GPIO_DIRECTION_OUT:
+		return GPIO_LINE_DIRECTION_OUT;
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static int rpmsg_gpio_direction_input(struct gpio_chip *gc, unsigned int line)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+
+	guard(mutex)(&port->lock);
+
+	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_SET_DIRECTION,
+			       VIRTIO_GPIO_DIRECTION_IN);
+
+	return rpmsg_gpio_send_message(port);
+}
+
+static int rpmsg_gpio_set(struct gpio_chip *gc, unsigned int line, int val)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+
+	guard(mutex)(&port->lock);
+
+	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_SET_VALUE, val);
+
+	return rpmsg_gpio_send_message(port);
+}
+
+static int rpmsg_gpio_direction_output(struct gpio_chip *gc, unsigned int line, int val)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	int ret;
+
+	guard(mutex)(&port->lock);
+
+	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_SET_DIRECTION,
+			       VIRTIO_GPIO_DIRECTION_OUT);
+
+	ret = rpmsg_gpio_send_message(port);
+	if (ret)
+		return ret;
+
+	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_SET_VALUE, val);
+
+	return rpmsg_gpio_send_message(port);
+}
+
+static int gpio_rpmsg_irq_set_type(struct irq_data *d, u32 type)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 line = d->hwirq;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_RISING;
+		irq_set_handler_locked(d, handle_simple_irq);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_FALLING;
+		irq_set_handler_locked(d, handle_simple_irq);
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_BOTH;
+		irq_set_handler_locked(d, handle_simple_irq);
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		type = VIRTIO_GPIO_IRQ_TYPE_LEVEL_LOW;
+		irq_set_handler_locked(d, handle_level_irq);
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		type = VIRTIO_GPIO_IRQ_TYPE_LEVEL_HIGH;
+		irq_set_handler_locked(d, handle_level_irq);
+		break;
+	default:
+		dev_err(&port->rpdev->dev, "unsupported irq type: %u\n", type);
+		return -EINVAL;
+	}
+
+	port->lines[line].irq_type = type;
+
+	return 0;
+}
+
+static int gpio_rpmsg_irq_set_wake(struct irq_data *d, u32 enable)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 line = d->hwirq;
+
+	port->lines[line].irq_wake_enable = enable;
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
+	u32 line = d->hwirq;
+
+	port->lines[line].irq_unmask = 1;
+}
+
+static void gpio_rpmsg_mask_irq(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 line = d->hwirq;
+
+	/*
+	 * When an interrupt occurs, the remote system masks the interrupt
+	 * and then sends a notification to Linux. After Linux processes
+	 * that notification, it sends an RPMsg command back to the remote
+	 * system to unmask the interrupt again.
+	 */
+	port->lines[line].irq_mask = 1;
+}
+
+static void gpio_rpmsg_irq_shutdown(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 line = d->hwirq;
+
+	port->lines[line].irq_shutdown = 1;
+}
+
+static void gpio_rpmsg_irq_bus_lock(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+
+	mutex_lock(&port->lock);
+}
+
+static void gpio_rpmsg_irq_bus_sync_unlock(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 line = d->hwirq;
+
+	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_SET_WAKEUP,
+			       port->lines[line].irq_wake_enable);
+	rpmsg_gpio_send_message(port);
+
+	/*
+	 * For mask irq, do nothing here.
+	 * The remote system will mask interrupt after an interrupt occurs,
+	 * and then send a notification to Linux system. After Linux system
+	 * handles the notification, it sends an rpmsg back to the remote
+	 * system to unmask this interrupt again.
+	 */
+	if (port->lines[line].irq_mask && !port->lines[line].irq_unmask) {
+		port->lines[line].irq_mask = 0;
+		mutex_unlock(&port->lock);
+		return;
+	}
+
+	if (port->lines[line].irq_shutdown) {
+		rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_IRQ_TYPE,
+				       VIRTIO_GPIO_IRQ_TYPE_NONE);
+		port->lines[line].irq_shutdown = 0;
+	} else {
+		rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_IRQ_TYPE,
+				       port->lines[line].irq_type);
+
+		if (port->lines[line].irq_unmask)
+			port->lines[line].irq_unmask = 0;
+	}
+
+	rpmsg_gpio_send_message(port);
+	mutex_unlock(&port->lock);
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
+static int rpmsg_gpiochip_register(struct rpmsg_device *rpdev,
+				   struct device_node *np, const char *name)
+{
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
+	ret = devm_mutex_init(&rpdev->dev, &port->lock);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u32(np, "ngpios", &port->ngpios);
+	if (ret || port->ngpios > GPIOS_PER_PORT_DEFAULT)
+		port->ngpios = GPIOS_PER_PORT_DEFAULT;
+
+	port->send_msg = devm_kzalloc(&rpdev->dev,
+				      sizeof(*port->send_msg),
+				      GFP_KERNEL);
+
+	port->recv_msg = devm_kzalloc(&rpdev->dev,
+				      sizeof(*port->recv_msg),
+				      GFP_KERNEL);
+	if (!port->send_msg || !port->recv_msg)
+		return -ENOMEM;
+
+	init_completion(&port->cmd_complete);
+	port->rpdev = rpdev;
+
+	gc = &port->gc;
+	gc->owner = THIS_MODULE;
+	gc->parent = &rpdev->dev;
+	gc->fwnode = of_fwnode_handle(np);
+	gc->ngpio = port->ngpios;
+	gc->base = -1;
+	gc->label = devm_kasprintf(&rpdev->dev, GFP_KERNEL, "%s-gpio%d",
+				   name, port->idx);
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
+	girq->chip->name = devm_kstrdup(&rpdev->dev, gc->label, GFP_KERNEL);
+
+	dev_set_drvdata(&rpdev->dev, port);
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
+rpmsg_find_child_by_compat_reg(struct device_node *parent, const char *compat, u32 idx)
+{
+	struct device_node *child;
+	u32 reg;
+
+	for_each_available_child_of_node(parent, child) {
+		if (!of_device_is_compatible(child, compat))
+			continue;
+
+		if (of_property_read_u32(child, "reg", &reg))
+			continue;
+
+		if (reg == idx)
+			return child;
+	}
+
+	return NULL;
+}
+
+static struct device_node *
+rpmsg_get_channel_ofnode(struct rpmsg_device *rpdev, const char *compat, u32 idx)
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
+	if (np)
+		np_chan = rpmsg_find_child_by_compat_reg(np, compat, idx);
+
+	return np_chan;
+}
+
+static int rpmsg_get_gpio_index(const char *name, const char *prefix)
+{
+	const char *p;
+	int base = 10;
+	int val;
+
+	if (!name)
+		return -EINVAL;
+
+	/* Ensure correct prefix */
+	if (!str_has_prefix(name, prefix))
+		return -EINVAL;
+
+	/* Find last '-' */
+	p = strrchr(name, '-');
+
+	if (!p || *(p + 1) == '\0')
+		return -EINVAL;
+
+	if (p[1] == '0' && (p[2] == 'x' || p[2] == 'X'))
+		base = 16;
+
+	if (kstrtoint(p + 1, base, &val))
+		return -EINVAL;
+
+	return val;
+}
+
+static int rpmsg_gpio_channel_callback(struct rpmsg_device *rpdev, void *data,
+				       int len, void *priv, u32 src)
+{
+	struct rpmsg_gpio_response *msg = data;
+	struct rpmsg_gpio_port *port = NULL;
+
+	port = dev_get_drvdata(&rpdev->dev);
+
+	if (!port) {
+		dev_err(&rpdev->dev, "port is null\n");
+		return -EINVAL;
+	}
+
+	if (msg->type == GPIO_RPMSG_REPLY) {
+		*port->recv_msg = *msg;
+		complete(&port->cmd_complete);
+	} else if (msg->type == GPIO_RPMSG_NOTIFY) {
+		generic_handle_domain_irq_safe(port->gc.irq.domain, msg->line);
+	} else {
+		dev_err(&rpdev->dev, "wrong message type (0x%x)\n", msg->type);
+	}
+
+	return 0;
+}
+
+static int rpmsg_gpio_channel_probe(struct rpmsg_device *rpdev)
+{
+	struct device *dev = &rpdev->dev;
+	struct device_node *np;
+	const char *rproc_name;
+	int idx;
+
+	idx = rpmsg_get_gpio_index(rpdev->id.name, CHAN_NAME_PREFIX);
+	if (idx < 0)
+		return -EINVAL;
+
+	if (!dev->of_node) {
+		np = rpmsg_get_channel_ofnode(rpdev, GPIO_COMPAT_STR, idx);
+		if (!np)
+			return -ENODEV;
+
+		dev->of_node = np;
+		set_primary_fwnode(dev, of_fwnode_handle(np));
+		return -EPROBE_DEFER;
+	}
+
+	rproc_name = rpmsg_get_rproc_node_name(rpdev);
+
+	return rpmsg_gpiochip_register(rpdev, dev->of_node, rproc_name);
+}
+
+static const struct of_device_id rpmsg_gpio_dt_ids[] = {
+	{ .compatible = GPIO_COMPAT_STR },
+	{ /* sentinel */ }
+};
+
+static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
+	{ .name = CHAN_NAME_PREFIX },
+	{ },
+};
+MODULE_DEVICE_TABLE(rpmsg, rpmsg_gpio_channel_id_table);
+
+static struct rpmsg_driver rpmsg_gpio_channel_client = {
+	.callback	= rpmsg_gpio_channel_callback,
+	.id_table	= rpmsg_gpio_channel_id_table,
+	.probe		= rpmsg_gpio_channel_probe,
+	.drv		= {
+		.name	= KBUILD_MODNAME,
+		.of_match_table = rpmsg_gpio_dt_ids,
+	},
+};
+module_rpmsg_driver(rpmsg_gpio_channel_client);
+
+MODULE_AUTHOR("Shenwei Wang <shenwei.wang@nxp.com>");
+MODULE_DESCRIPTION("generic rpmsg gpio driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


