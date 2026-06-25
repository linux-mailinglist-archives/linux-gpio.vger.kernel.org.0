Return-Path: <linux-gpio+bounces-38901-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IEY4C9RPPWqL1AgAu9opvQ
	(envelope-from <linux-gpio+bounces-38901-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 17:57:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CADA36C73A1
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 17:57:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b="sVqA0Y/t";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38901-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38901-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1ADB9309B86D
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 15:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71193A7F4A;
	Thu, 25 Jun 2026 15:55:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011025.outbound.protection.outlook.com [52.101.65.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C1438E129;
	Thu, 25 Jun 2026 15:54:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782402902; cv=fail; b=VLxgTxNCQfUb6CY8kEWtoDPf0WY1xMegp22icCEN+yjQ6PmMjThlhAxzZlH9eW7GhHH26hwjMpNUt/XvBED/Uuau0cH7hXAPE6XJWZtW35G0ARUMPOZyVPTstyGqM9G+PmvQuLDLJITiILYsQ8QfU4DLp0qixW/FAE4lTZL7vMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782402902; c=relaxed/simple;
	bh=uT/s0J6zxtK5T3PBQ3GAKxKRPBgmYupnyKKF+WZTZ5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cqRowy/1px/xjj1lRV8Sd0tOyvzWagFiGZABgv7ZcNes77I2GlMyqwlHmVuVOgsa0Bbw3VnlyRXtPCqpQICPjqM1u37KaRDgS2JitItpt0gsnlCC/Y2ddo3n4f/cReWDDjsPmlvFk38NbvxS9febybjzsI9UCRMHls8mtQMWsxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sVqA0Y/t; arc=fail smtp.client-ip=52.101.65.25
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wahh3FuIE2+oqcHbPOaZPhyfUdx0gdxYdDwAdP1HvVqdCidW1Vb+O8H0dqjU5NNCgTTOfTL88wKZ6gMahppK3niHQxBuT+kY4EYZgqlyaO2oh8XrnFaWx1CMcUQcTZnybA8ZPH4S530sWR2YhBaxafCu5DYWasxDhL49gEXfiZMK+EUQrgBOOt0OdzCZbh35As9tynKBGoBUtoGd0tSNDMkMNavMnlUz+N2Dk5olKTmXRdUUxzsJl05zta7pC7+pE6iib+YpSJitOmTaOZxPEJiWsRrUGjaVALYBdslb6iNVadEEsAkRWUoBdO26o7Wia9v/xyZRcUQWcFv316uWQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFfZMcQFLsgsIMHTx+wphYYI1IOCL3rAXhgVzbtu2Qc=;
 b=QXPoOPrvw83qUhlEDAfXDOXV3N9MIRCpij6VcL2DFxq8g7U6G++r38w6o5h5IP9ONAnldgQWAaf9fbGbfOt5X/gqV/ofux55m19ji8W3QKEbXOpnyVkPKldmBmvrSSOx6QM8SaV95ih7KXMO/vBvCpEAVntMi/qWTQThiXcAO6dXBVTdhyUN5ntmr1B2b6YqZtT5/6pB+s6IBfTR4cLofspux0kOWee6s0/Say7Zubn/yA0D+5X0D9COlN6Ts2pnp0V+ZZGgh1U9HI2RP34FMnnLK/XCxmQg4wbJ4dK4gehy060Tyo4yZZZEXmMhm8Nu7EjuVUhh4xwvFkMcef3UIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFfZMcQFLsgsIMHTx+wphYYI1IOCL3rAXhgVzbtu2Qc=;
 b=sVqA0Y/tAY9B9JkONIphsySKtxu8PmfQXmCNfpkS0MZ1MfE+fkgh3SxYRmZBlIwdxzsq6BCe22xm6HNaA/tci02HaFO+xSjFL1mx5OMrUEpEbF68R6f7X/qbW8ZgUjBgzACxTloLd86ju4QtucZBrZ/8TetdyaMkWzrpxFQ0wBecVylWVjCUl/UDDkkxTsxIG4kTqalx649p+RW5RDB8aY5Fu3FM9gAjtrAeav71ubqvDdWw6VYlqK/k9fZhbA+x44sK2RxAziuuUEbOmCog3Aw9UC39Pw0hNOkfiaDCsgf0kqdg1/d0zPfYCzU/djhshbseruUVHtFD3w3OUz/JfQ==
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com (2603:10a6:800:12c::22)
 by VI1PR04MB9812.eurprd04.prod.outlook.com (2603:10a6:800:1d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 15:54:46 +0000
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4]) by VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4%6]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 15:54:46 +0000
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
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v14 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
Date: Thu, 25 Jun 2026 10:54:27 -0500
Message-ID: <20260625155432.815185-3-shenwei.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:806:130::10) To VI1PR04MB7135.eurprd04.prod.outlook.com
 (2603:10a6:800:12c::22)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7135:EE_|VI1PR04MB9812:EE_
X-MS-Office365-Filtering-Correlation-Id: fe956fdb-9fbd-4291-01b9-08ded2d2148a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|19092799006|366016|1800799024|921020|6133799003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	xatGkVvvd75OQ22i5ey/C3iwRlCafkFEG5SpYTZ4QNtB/+v3o9dbHVpGA4E5gTpMDQ4ULXUdDzbP1vobDSNpzPijETN3WCLfyI7z4OAgLGSIeGVYRGZ9jjCNVGbYwBz1AHTfro0YC/7lfTIBN83qfjZIF8S6Qu1ZDl1oarzZRa/VzTnjDPs4el7NxmJdsh79aGey4NoeQeRE0hC5kFFjbqQT/W2cmlmHzXSWY015wQvubU6BEO3ljwwxggpgFtsBO8nQT+5/fjT3QuyUB2epke95ytyphlI8ngCei5gDM700hlEU7BENsaLpQhnrZPmXqjlAqCysSuwx7ZQE3/wVLTRQkyoTv0t2gDJjpYMr7sg1yhVZ8b6yIAzWn4tbQlxU5RchwAgyPnLfC8Rf8SPqIfbfhXNXe3HWDfJzhEqs6WGA3IMM4B4sj40/ubzXAAPfoaUXtttM7Uc8sBzQ4jm/F33QE0/Nrc4VstAD+ZEF/vmstplq+D/u3j1LjDpwEA8fLBnEWjx9djrLQpklfeZQMlr9k2P/67Pj86bXd5UH+mC1ML39pV8kDqbupBKbpCpg863bZEKR3/jp5/NKtHMUwiTqIfjsouUfRaSEJWApL+u9ASfIi/pwaqboKJTd/QNa5LAqEoz7Mt7dp9BbiRaEEw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(19092799006)(366016)(1800799024)(921020)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g7GnGu4BzDQbiNeVOvGFopZg7YksCbL3XircUu39ByiZqkY3aIxd3nbqF147?=
 =?us-ascii?Q?otqvY4siAMcU585j7V0w22nM19sMWRahKzHGI1wmvCARqw68mYCtQxsDd/rn?=
 =?us-ascii?Q?FbZlCQkdyJ8xCIpTs09fmTk6C7f+iEGAOivGRbOheLf2HTbun2YQ3lXh0M15?=
 =?us-ascii?Q?t4/PFNR5WrEwx04+Feqk2PVC/ZIURkeaHh6619X00If0Tc/8Qf8NDNeW2cgY?=
 =?us-ascii?Q?n7y88ebTuEeCFNpOmp4Z9H0HKt3q4e4OHqS44RIUqIiO61vT0G23oApg1iHg?=
 =?us-ascii?Q?t5PMWN5HqBp45fwdVGJcwgdKKRWgKNgj+37xEtpUWCKFgmL8JNNNTOvctowy?=
 =?us-ascii?Q?FtWrKXiDAQmHFQy46P6DC+tlrpWlkcMyHQpyka5f0p4EV+UBKnFPpMa6dFEY?=
 =?us-ascii?Q?OoA+GD6H4c5QtP+BYKzPIJY6ymFi9Al5JKIro/M0ypjYc0wmXzOFalPo37uM?=
 =?us-ascii?Q?Njj2vel0rdaG+ZY2GI/XkjY1BuisLc/5hIm+5kMYj72dYKWJ9pNYPTdobqlP?=
 =?us-ascii?Q?1w9axN/MgXde1mhuemf62JU1ZmaEpVgHdwt9HsN1k9kyW1pXsRMmBe1DjFfm?=
 =?us-ascii?Q?jeKZPL0ZhNPIicm0m4MWFm3fLVpZNWFajuKLXNG+lrL6tO8a8n0lHVzjy4kM?=
 =?us-ascii?Q?b6C8EE0PodHiNlU5RcKOuTz+DA97ScVyZgJbLJVkGQjTAe5hqIthI472WWxX?=
 =?us-ascii?Q?bChG31OnDhHXu1DrjXaq67USpno4Im8boz0PNVTP1ZobMxjqctDsGYJRExEC?=
 =?us-ascii?Q?cdCi0lOZ098pkj4sIbBq7UwlbeotAoo5nDHEejaaF1Cf6LsdhTVHPvk/kvKp?=
 =?us-ascii?Q?4Vv/hoxIWs4yFgz0xP24OIB+A4D6vNxyDbiVgLFaui3dTCBxVOz506PCC2TV?=
 =?us-ascii?Q?5gW55TKwOmqf06SMRVRQOSrMeJehbKY6n+TLzSmsvoUAZn7y4U6QdDz2owjs?=
 =?us-ascii?Q?V2xe4ELejHqRfCo2jCtN6ckU2WrG3jsUK8F7vB96EYCd4yB3EfBZAgcXnvR/?=
 =?us-ascii?Q?nEc7CcRYCmvR22tvjSrhBIzu0riKeWB7XtOUxmYROwXaQKVH4df0nkK+96fB?=
 =?us-ascii?Q?0zgaNDDzwaRXwpafPlo7J2QLV3kEzxb5sUiNqHoH8ov6AVvqvi1WGSxk55Wl?=
 =?us-ascii?Q?6oxW8ordkj3fEls5ZC3K10QcTIRd21Gs5Wj2hqNcuYWmxyJA1o28kbkuNbcz?=
 =?us-ascii?Q?i4zJClzzDz7Rf5YuVHZ9NlkkyIyizpMwik46k4u+GoAR1gkxUYlhkiH+X3hT?=
 =?us-ascii?Q?yg6lExLiMQqOg1amb8CMq80kGSstXMq81tM9CtWVv4qnzI0B1ylKNyKp7CED?=
 =?us-ascii?Q?j8yIPZ6viC0wPkQfvKzpv2dgu5r6ZusK+AQ0yTfLEl0UVbSkyOQSkGU0Wr1r?=
 =?us-ascii?Q?mYuTVcEn7tLQUZTph6dBMEXZqzAeMX8NVxxCHu0lDZcSXN5xONczKHeRtXAz?=
 =?us-ascii?Q?ILzD89dFdPEjBa6rm7T0g6HrY/aeTDUuTanfllc2ZE7KbAW+Vm8zNzoekqnO?=
 =?us-ascii?Q?YSOVS1u9BiUUoUWezzi51S9MGOgo/iHjmDdltsMiuW1ECKt9497UaoPGu4Bc?=
 =?us-ascii?Q?I6PZA+tsCTEsKfZ/wJXn1xq2WLnZsEJW9vkDA0ZeVf9dHBtlnQNDQIWOy+qm?=
 =?us-ascii?Q?yBRIeronj2U3XgFO+2zqLsLc6c8vRmiNR1Rd15XE+YjWZ0TbMD9+TBVsRKAy?=
 =?us-ascii?Q?EKs7tHt/+mErKEPRazS1Fw+kl5jQJ2+VMOZuSApt+vsRMwMGWGuevvwNTvFi?=
 =?us-ascii?Q?XMD7nkwQiuiMjJFUdOFVKkQVrHEAyb0iWI1fCL/ZD+SLa3Aq6XJW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe956fdb-9fbd-4291-01b9-08ded2d2148a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 15:54:46.3958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bczUmiz8e8xUC4dvXt7wRmAFvNo9xDfdISnXahCFmydIsFhZxGMBgza8bJhk02kE7DCNMV7DvnqbSV31/q3Mmgm/Q9PDH92pov1zm5z8mhPaHvqwJGXYUoK/O4uXaqz7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9812
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:skhan@linuxfoundation.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shenwei.wang@nxp.com,m:peng.fan@nxp.com,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-imx@nxp.com,m:arnaud.pouliquen@foss.st.com,m:b-padhi@ti.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shenwei.wang@oss.nxp.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38901-lists,linux-gpio=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@oss.nxp.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,foss.st.com,ti.com,lunn.ch];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CADA36C73A1

From: Shenwei Wang <shenwei.wang@nxp.com>

Remote processors may announce multiple GPIO controllers over an RPMSG
channel. These GPIO controllers may require corresponding device tree
nodes, especially when acting as providers, to supply phandles for their
consumers.

Define an RPMSG node to work as a container for a group of RPMSG channels
under the imx_rproc node. Each subnode within "rpmsg" represents an
individual RPMSG channel. The name of each subnode corresponds to the
channel name as defined by the remote processor.

All remote devices associated with a given channel are defined as child
nodes under the corresponding channel node.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 .../devicetree/bindings/gpio/gpio-rpmsg.yaml  | 55 +++++++++++++++++++
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 53 ++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
new file mode 100644
index 000000000000..6c78b6850321
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-rpmsg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic RPMSG GPIO Controller
+
+maintainers:
+  - Shenwei Wang <shenwei.wang@nxp.com>
+
+description:
+  On an AMP platform, some GPIO controllers are exposed by the remote processor
+  through the RPMSG bus. The RPMSG GPIO transport protocol defines the packet
+  structure and communication flow between Linux and the remote firmware. Those
+  controllers are managed via this transport protocol. For more details of the
+  protocol, check the document below.
+  Documentation/driver-api/gpio/gpio-rpmsg.rst
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,rpmsg-gpio
+          - const: rpmsg-gpio
+      - const: rpmsg-gpio
+
+  reg:
+    description:
+      The reg property represents the index of the GPIO controllers. Since
+      the driver manages controllers on a remote system, this index tells
+      the remote system which controller to operate.
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - "#interrupt-cells"
+
+allOf:
+  - $ref: /schemas/gpio/gpio.yaml#
+
+unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index ce8ec0119469..aea33205a881 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -85,6 +85,34 @@ properties:
       This property is to specify the resource id of the remote processor in SoC
       which supports SCFW
 
+  rpmsg:
+    type: object
+    additionalProperties: false
+    description:
+      Represents the RPMSG bus between Linux and the remote system. Contains
+      a group of RPMSG channel devices running on the bus.
+
+    properties:
+      rpmsg-io:
+        type: object
+        additionalProperties: false
+        properties:
+          '#address-cells':
+            const: 1
+
+          '#size-cells':
+            const: 0
+
+        patternProperties:
+          "gpio@[0-9a-f]+$":
+            type: object
+            $ref: /schemas/gpio/gpio-rpmsg.yaml#
+            unevaluatedProperties: false
+
+        required:
+          - '#address-cells'
+          - '#size-cells'
+
 required:
   - compatible
 
@@ -147,5 +175,30 @@ examples:
                 &mu 3 1>;
       memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
       syscon = <&src>;
+
+      rpmsg {
+        rpmsg-io {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          gpio@0 {
+            compatible = "rpmsg-gpio";
+            reg = <0>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+          };
+
+          gpio@1 {
+            compatible = "rpmsg-gpio";
+            reg = <1>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+          };
+        };
+      };
     };
 ...
-- 
2.43.0


