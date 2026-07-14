Return-Path: <linux-gpio+bounces-40089-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8HFNKLulVmqM/gAAu9opvQ
	(envelope-from <linux-gpio+bounces-40089-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 23:10:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D302758E05
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 23:10:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=dXUbsnTU;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40089-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40089-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1B37F301833E
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 21:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FE03D8127;
	Tue, 14 Jul 2026 21:10:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011066.outbound.protection.outlook.com [52.101.70.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E18C42BC5D;
	Tue, 14 Jul 2026 21:10:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784063407; cv=fail; b=SB0giCC8xERzRDuXxJ0Xoze2Om8nB2MFirIS4DoNJ5NX+kCDlZxgsVP1z62W7J1kqJnCpKgmOZsv/HCF7QroZGnxiA859KHePCJjQeO5YQiE/IrNrAbpkSUxIJ1/n/7u/7IzgvSQkd1n3UU/0Ccmd3geu4tGeGWgbjT99CWA+Rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784063407; c=relaxed/simple;
	bh=QtovXHqQbrGvi//ZhiZyl/0ySolc75DjK3p7f3BYkgA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QqIC2ynf/toWdHudw3h9Ug4NxOVhmw3Zo7ZYSnGbVyS7SXCEuftoenGmciw3MfErTPW/UzHb6ehDzGPu9txTeNU9LaIV7uj4HqY9nQ8z8umBw5RkkR2+vuFtQpAGTj2Q0iGmpEao/dKErWozXJyfxuIQ9xvE5bvMDfnkYGCwmpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dXUbsnTU; arc=fail smtp.client-ip=52.101.70.66
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kykat1yjmTyqO2qR8dM3UZiNM0FJ6DNea0vI/7DOcfHWDB9vyzaQVPsoIkp7n9WQPdnSt4+SQCRyacRvC06ESIaBQGZZ/m49Ss3AR5pLLhpyxWakE1g8UnrCSwPtKDviewVn+R6nCmvhiKWA69p6N3/uykqtEePltdRnLKNVt1y69pCZEE2F/ZYPSEA5MaKowUhzZHeW3VRNZoYAW9CAh9wXC3c8F3YphCjOeIUbg2dPUeD/ynX89lW9omMVqmo2pZuaq1ccFdLgNeIluELR3A6KUWvl9wn8MqnJEAfKOYuJ5wgkE86+FCkozhJpxrOqvgdB1Sox8n8kcT2K0tRRVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51hqpufEsGFCNBACr1uUKiNF0Xfv39s6lzkZW/FMhR8=;
 b=tYKD0bP7pXPfdaQWmulWueUwpor8OZd3+P+puVYZOwrV7r92Z76Zd4zjDtWa/mKfWKgYsJ30Wid746DMteVTvCoih7pCKLF8E+DOvhCcA8PLnqnamyn4cFSuFE3dr1eKJ1x0clPMJGKT1Jy8bVSaHZOlH0OWAQiXVG2oDWYub+A5ztZ1lDJ+sdDoFSGxSkAKyUHV+10w5+Tdm3PWGRj+FUtoO5+Yz4dGubqgbBcc1y8ueUXrKTYOr6kO6AKhmu2kCOrtV0HjFMs0b1z5+BCBEaaZl6T+8vhnVPGMyYN/rbafDgtOv2IpThLFa8HiW75kjDVEM5AwlPuMlyT6nLEATg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51hqpufEsGFCNBACr1uUKiNF0Xfv39s6lzkZW/FMhR8=;
 b=dXUbsnTUlnDDCiYeBIj0M6IWdFbYVo4CEsorufj03DV7CDLnBMvqm6xTPOxMWhbcuYKJDp7O663s8UEV68PamG2QZ2ic+uxAR70HqTBWzvgmM8qdfxMqcnqZUBhlb9O/OMIst6htvhqftyXSvVY1NQexLbTxzsMWHO6AnpktAQYgjffOsj8UMWyzhnhM5TRjx6u1gfcU6YCaCJqnOtXw4KGc3qr3E2496guO4fmG5ZTs7e5Mf5etP/Cznk2Dliusg75HhoEnk+vTxACfnqTwWnRfPM1wots0KBTuRECTaGlpjovbeA3J5M2sXiBAXS5wkZmMltJEuvIxd8Lbsfjg5w==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GV4PR04MB11852.eurprd04.prod.outlook.com (2603:10a6:150:2dc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 21:10:01 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%5]) with mapi id 15.21.0181.016; Tue, 14 Jul 2026
 21:10:01 +0000
From: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
To: Andrew Lunn <andrew@lunn.ch>, "Shenwei Wang (OSS)"
	<shenwei.wang@oss.nxp.com>
CC: Mathieu Poirier <mathieu.poirier@linaro.org>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, "b-padhi@ti.com"
	<b-padhi@ti.com>
Subject: RE: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Thread-Topic: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Thread-Index: AQHdE9UiiwYvBWdefECeX5whBWF86A==
Date: Tue, 14 Jul 2026 21:10:01 +0000
Message-ID:
 <PAXPR04MB91858B3C5D5E1B74B9291BE289F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-2-shenwei.wang@oss.nxp.com> <alUdg9iTysXCFUa5@p14s>
 <PAXPR04MB918568AE7B2364EC9D16427689F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <68a9dd77-a07b-4ea5-ad66-9e2bda490d20@lunn.ch>
In-Reply-To: <68a9dd77-a07b-4ea5-ad66-9e2bda490d20@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|GV4PR04MB11852:EE_
x-ms-office365-filtering-correlation-id: 5625f509-5b81-47bf-a0b1-08dee1ec44ac
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7416014|19092799006|23010399003|38070700021|22082099003|18002099003|6133799003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 HyEyYJT2HCUGLG9oJad44CdWnwv/ovj3rJYWzrRwHnOpyLP21JKAgPtJUKXQMTobA+FF6Nxxij0Q5s+SHV0rH+rwmhWDlY8BuNtA4fG4a7tS9Od4LGjwOPVQrfdY+mvCcJz2kUTN59Kjudb++RmX/TgrZB34fePAEVMWbiIkgDiHIqUTW4f6KsMLBsNxsjmxBbQ1jQqOW5WV1bbaTeWFPwjZoSWWBD6LNyDWlhvq2flUeRXp9+ShgDI4WsWa4hMq323uU8bHggMvQrv0KDL9pgnMY2j+al/DBm7SKADkUp0fUoKxT4mCanYw5L+4RX4vUhl4sOh6l3HvvRmSfAXRIS72eBB+cJ6odrPxfJiWIZRTCUdeq1h+wL1dtJIjT1wrAwSLrULfG7/1EUrrz8yIHBnppKnLZJAP0+HtBxQ3f2ZJ2UIRyAHkV7JIfJF6JOe8cf7LQ3mGmlrJn9DwqZOzt0fTY6j1F0s3cGkhzzjYLBBd58sMCm3YW6bL1+W4QGlmaxUjIxu8un1JvLyqTzNoi5ib940hndNy16oCw3AeFYN3lLfMhSLEYImMZ32I3519hcDIS2tteJVITqWSt7w6T9tJ86bkxPQF3uwHMslkGt1i7RQoHUEoLFNOEucRNwc8gWSurySJIOxMBzVjpHpGfU+NTvytHmkeIPrXz04T+l9Flpxq3nuzhqBgpNlIBt4nJv+kFwZhnOP/OLf5Kw2LnE3MjznHigDyrFyk5IegQks=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(19092799006)(23010399003)(38070700021)(22082099003)(18002099003)(6133799003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?O2OWYonb75sYzkswomCi/qX6vS9635/NvM/mlrGf5pYTHnYkmT331k4K+2zn?=
 =?us-ascii?Q?AdyV+SfQHK8eJfT7sbfYt5fh76oO1tXkoLGCYf/cPKot5Pe9snr88lzOqmu6?=
 =?us-ascii?Q?25Gm8cS6IUoiSZYyV00v7IRMRt5GGMPmOmRf2Cl7bRuNuR6WL9WKZzrP9OQP?=
 =?us-ascii?Q?6pU+S+4rNe2Cl9rHe8aJirrdkR9cU8y+dVpq3R1hqrG98ysa6Ru5vMblYh3+?=
 =?us-ascii?Q?KndB+X7mO7spN9OgWlu2dbJWSpPVKGyWSICbtsZh+KXc9PhFCzkyULXJk4Y6?=
 =?us-ascii?Q?olGAuXpkr6FFWZu2rrqdNkQzarotkrUOCyNBbxwd124wPdPfIhx4zsQxxe6v?=
 =?us-ascii?Q?wEbhfm2N5N3bKQYX3yR7vo4k9pnbSX2fvN7nBNdq65joEdVRu6y/cA+aQ3dM?=
 =?us-ascii?Q?QtatY+pbYZCk70j2VUklcYejfAtPigvbR2KVGNwRH5TKnk4YXZAsfkkTytp3?=
 =?us-ascii?Q?kODLlsWVT2W+T97a96zYkvJVQRS9iFkw8UMHGuW3m7+Bnv88yufT2serG+yh?=
 =?us-ascii?Q?tAbom059Mpxg43+wsd88hT2lM7UCK93vQDL+2YNiA8bCKy7rLwoi0/IncOOl?=
 =?us-ascii?Q?lfqwnLq1KycU9eS3ZkCf1QUVR5S76b+3+/eULA2VWnfjEX+/lyJEdKV+XPKv?=
 =?us-ascii?Q?36iBIloUWZukYIIZemduUnYTQ6xzFOEsKmxFWBK/pnHmziJTaZihvtBJVwWl?=
 =?us-ascii?Q?fHzBa4NIUmx1ktBvFeeEijhXJEyfQkM5NDxnZsI754DyYMxfJJvNh/2FSwAz?=
 =?us-ascii?Q?KtGapeoAA4FN5faFy4A2b4UmEvouJ2BZ3KefeTYi/gRRXsZxC+MCLtJ54rL6?=
 =?us-ascii?Q?KA1v8NETtS8On4d4jwVUwmiTuPVNm6FYqbhu3WeeSR2O6R2doiJDtzUbRQrF?=
 =?us-ascii?Q?1YQMyiAlK59Q4yuVxi47Hs8/811KE9Uh7ZYNBRMyctcrBqFiEFRvfRaWnb6u?=
 =?us-ascii?Q?0T2EFTlWOrILivxXBrOqpi1nSq/grNS1HD42LMcp/5NjydglupILWjMbFsnZ?=
 =?us-ascii?Q?JvYt41hWvx05sy5mmM761V03cGwa93StZGYI3sci+BQ5rfTU32ZT+deloQSn?=
 =?us-ascii?Q?6e2+NEORjAiZla8YFB4sxgQH/ODK7IyxpzJru6mTbLEb6YWFpWrMx8qiV152?=
 =?us-ascii?Q?EalMrr7e5SN8gp8rtIlNUhfwFwJPGl/3vBor4DzfqwwDeWGl9bTW+xGtqH2o?=
 =?us-ascii?Q?Oa6Cfe7GAt4KpQX4oVu8shjCXmcLFORyLa5uo9r4yHGd3UOmZX1iEwYOQLDj?=
 =?us-ascii?Q?NuauJaEfZQoVS+othFje9E98jbGX62vxNRCuWnm+G34YzKZlDS0dvuVjAjz0?=
 =?us-ascii?Q?cHkcLkpV6e0bjgLso6XhG/6barCf6tw4DVL2HVzoEoPJjgY6ehB+6LCwhRj0?=
 =?us-ascii?Q?eoj0AbzCssCdk90dBnTHHvOkeMgRNVC2uCKc7l98fjPEP/GELWKGy9AEuhDb?=
 =?us-ascii?Q?RI7gXbDcoHJ0kmN2hMVw/2X5bHjF52gL2BIoVEI24SPjGAnaczgQyGmRBCya?=
 =?us-ascii?Q?CYYexjL8gqrZ6jCXdOfYnlNOvo2EKQGIYhEfI2gueqFN9QyVlINZsP7d/Ekd?=
 =?us-ascii?Q?8pp28cwbGzHepdv8Vnvk4zBCdjwZqavVUubLegek9ecCK/m/bmW23jLWk55p?=
 =?us-ascii?Q?Cq5HFkmxA6AGNlLfX65D0CA8zavyC+E9x+3SJdHCo/xg7zsTD3pMs1zYQTmm?=
 =?us-ascii?Q?7hKrgK0L+aP12FYzFvkwq7+ilr74q7dkjW8J8kXmq2WxwnazTpNfrhRj5PBY?=
 =?us-ascii?Q?VwHGdAfNbg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5625f509-5b81-47bf-a0b1-08dee1ec44ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2026 21:10:01.3653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YUz5o5kT7JgCzZ+bjv8tSxWix1vDierJbo6ChIG2i8gcD/xTWsBHm1sRBCBJaqOPlpdP+JTxlY3e83LsQDL+Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11852
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40089-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:shenwei.wang@oss.nxp.com,m:mathieu.poirier@linaro.org,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:frank.li@nxp.com,m:s.hauer@pengutronix.de,m:skhan@linuxfoundation.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shenwei.wang@nxp.com,m:peng.fan@nxp.com,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-imx@nxp.com,m:arnaud.pouliquen@foss.st.com,m:b-padhi@ti.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER(0.00)[shenwei.wang@oss.nxp.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,foss.st.com,ti.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@oss.nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D302758E05



> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Tuesday, July 14, 2026 3:23 PM
> To: Shenwei Wang (OSS) <shenwei.wang@oss.nxp.com>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>; Linus Walleij
> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corb=
et
> <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel=
.org;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; Shenwei Wang <shenwei.wang@nxp.com>; Peng Fan
> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Arnaud
> POULIQUEN <arnaud.pouliquen@foss.st.com>; b-padhi@ti.com
> Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver ov=
er rpmsg
> bus
>=20
> > The two fields above are required for rpmsg-gpio, but not for virtio-gp=
io.
> >
> > In the rpmsg-gpio case, interrupt detection and handling occur on the
> > remote processor. The interrupt information (such as the GPIO line and
> > trigger type) must therefore be sent to Linux through this notification=
 message.
> >
> > In contrast, for virtio-gpio, interrupt handling is performed on the
> > local processor. Since Linux already has all the necessary interrupt co=
ntext, the
> information is not needed.
>=20
> Are you sure about that?
>=20
> virtio_gpio_irq_set_type() sets:
>=20

Why are you bringing up virtio_gpio_irq_set_type() here? The command path i=
s already=20
fully aligned with the existing virtio-gpio implementation.

The gap we are discussing is the interrupt notification message coming from=
 the remote side.=20
That is the topic under discussion.

Shenwei

>         irq_line->type =3D type;
>         irq_line->update_pending =3D true;
>=20
> virtio_gpio_irq_bus_sync_unlock() looks at update_pending and does
> virtio_gpio_req(), passing irq_line->type as type.
>=20
> This then gets filled into:
>=20
> /* Virtio GPIO Request / Response */
> struct virtio_gpio_request {
> 	__le16 type;
> 	__le16 gpio;
> 	__le32 value;
> };
>=20
> which gets scatter/gathered over the virtqueue to the peer.
>=20
>       Andrew

