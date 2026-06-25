Return-Path: <linux-gpio+bounces-38902-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hlStG4xPPWpt1AgAu9opvQ
	(envelope-from <linux-gpio+bounces-38902-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 17:55:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C466C734F
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 17:55:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=lPjyfR9c;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38902-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38902-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2C16C303F471
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 15:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F81933FE09;
	Thu, 25 Jun 2026 15:55:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011025.outbound.protection.outlook.com [52.101.65.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD2A3A7587;
	Thu, 25 Jun 2026 15:55:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782402909; cv=fail; b=Bm2M2Tp8oVszDlQLaNmHKRUUTM04diJL9RQhkK8u76uuLrMqf6h8xVXPfz2PdVAL1WdsJ1H3qpXHG5GiLNAe1I/a73cC9k3RJYpSOgqbbXOPqKNRQhFm7UmndeZcxY+ftaE/msNIlJoVe4kryosjH/TkIZCQLckashvajwYuQqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782402909; c=relaxed/simple;
	bh=wWOwgajAmZlhTCoajKBeqMJ55CF8tjhU1fbCVxO6zR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c4yQTdf6u2fukdtgoIyeEVaF+anRVdy5te5ufCRm9ncACFvxs0yn2/Hw7y9vGiNuQ7dQMXWoHyAQd7EsuW9HmX45GElyjWMfTXQmGGZ5oljkv8iLHIzav22xQ1gu2LCeh+asI3kDHVjn8PIng8Pnp4qErp4EAWA7MxrrMYUcC4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lPjyfR9c; arc=fail smtp.client-ip=52.101.65.25
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DELZlFxqvdJEFQDg2uHQgmWCfxf57ltCFwNRT3a1JKiUvvpY9BqjVa3dxiJPtAPMfZG7jQMJqu10mnNZnruUJ6sEJn68HgRGJdx8+q0kx+0Iri2jAFmSGDsmcP7++pOsTLByVkcpODUxIXWrPUcRUB1TivtWkfeS1Ev3LWJqouotGv3t16xvGeO6AeitObealjjbDh9lDPZBhVSUq7D/Pux8EHzQOB2VGt6TVNxT0Ef4+kuq/IOBxXrlIpFM26GFBn+z/eAhYpr72SSYAJcibEGFnAN+/8mSJTOQ0zVF7tU9LH9zHZKvDs/3ZeeuvbkFVscBt+J66kw0Px3lWzf/1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7+0mRJlpvLSO7h2VImKXSnicHE+7r0USCrBx7CDipo=;
 b=UVkRj11HvmeLs8J8dxNnfwNtuFst+VV0bXeAuDY5Dyh1qLs+/PG56EZ3rkXYsYTSf8d36s2ogxh3Xfx+eNjdIlp1ByyHOWmZU/zW6uq1dcWyirUnWo4z8k4VZGzDxpFiRKkOZEFm8tZKYXc0qsCegMvdUAgFAkFHjOMiczRujwgrpVLzBZPcCHREHyiyCrbA8oeaQBxEn5LfOYROYWLTnRmUlfpCD9+8yweikfCpud+8oCQzN+Xzi2Ea/Ctg5/tpsj4OoG0tYNBH6r6V0ajszbrhFSCvQauxGkz/nFaou+zO9DUQRmTNV0bfND3J4/5Szt8SFkLWfnhxkd5RnZ9JmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7+0mRJlpvLSO7h2VImKXSnicHE+7r0USCrBx7CDipo=;
 b=lPjyfR9c0Y56dbbvxNPQXbZCUStZ5TH1VQB5gNskYljXN5yfV0x3rXqfl7rHtqIpKurdPo39FZVwExsl6gCxPihpfLxLth/3Go4ox729kMT+QT3jh2i2h9AbDSPA2U8OhJZiFymSSqFK2yPVG/5u+hJI1TFQdVgdRoAcXCpiN1vnqbgIhrrVNhxqVk4vBgF4w6GXZ5gQFoTyAJsiY/AlcCgWsb19nx6AWcj0t/f4JoWd42dpXkre5J/eAbdfC8uDV43MtDph+LCHl3K4yiSfP/rdpqMTOcGykyaCb50e1ZNJcbv9Ktn74+kOw/8fqih+DevdGpHiwpOCU4hPwGYFUA==
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com (2603:10a6:800:12c::22)
 by VI1PR04MB9812.eurprd04.prod.outlook.com (2603:10a6:800:1d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 15:54:50 +0000
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4]) by VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4%6]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 15:54:50 +0000
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
Subject: [PATCH v14 3/5] rpmsg: core: match rpmsg device IDs by prefix
Date: Thu, 25 Jun 2026 10:54:28 -0500
Message-ID: <20260625155432.815185-4-shenwei.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0181.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::28) To VI1PR04MB7135.eurprd04.prod.outlook.com
 (2603:10a6:800:12c::22)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7135:EE_|VI1PR04MB9812:EE_
X-MS-Office365-Filtering-Correlation-Id: 2448b260-13f9-400d-a064-08ded2d216df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|19092799006|366016|1800799024|921020|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BMwZgGxBqATHqk6UoGidQvyqzewBuE3TqMR77yNxAnjYU0wlale3LlXtcZhEc+AvfOju941CNfwWNz96+N+MPE7+q9CpTFMC/fNpwzp35vIjxnUBa3mppUF/wTXD3o3lVQK3ysul4BE9kdFzrEhAoqkPozLWxgcUVUWkRe5mYt/I7GDRFJ8qPIob5gjdpFUt1anBLO66p3yD6czhPjleDJ1G3kVk9LPm0s/hOLr3yNmEt3ttVf8IKoHoo73K1JscAgh2Oo9t8r6LyWrzQ1ci1M/6N8aWZ1lkpzG1YvcTHgvRMEEdR7rG3Zk8ksDnMK+BJvDrOeKxQ/+mKCFun0LP8DLUaTfSi2CtE18vzCHIBIA4N8365TGErxUU3vJD2drLCC3UYMJ2FJiH8voCzEADFMF5kErHzIG7d2gi/yBnp6t4f/V8Ri+6wVkhQj4fZzG0Qi7yQROq18KLAQWL78PEDpnOkOXCFx9eTsXs/RpX4dBFX6H7DR8F2DkNS7OPQZuItUvFsrPw8OF3F6QNLSSEtmSKv2fowsLVZIVx775Kl5FXqFQ+CA+mq387863hMolypF6GAhSWqN/HkV3fcXw8skj9Wpqho80fPtnWcjfZ2Ds2VBK7h8r9o6VIwShcrg3g3AfcAqb72VXGPiZxZDCsjC4tqduCB2sTuP4BCCsvfvLjHUqmNYxZwp2jPWcsAgfAHLQI8QhqmsTr25FqX9drFg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(19092799006)(366016)(1800799024)(921020)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ILi4Ih94hI3xhnEDMkBp4dfmBIvq5TPCaG7ZwUBOaZirGoDG/7s00e7NyFq/?=
 =?us-ascii?Q?7knNFg+2kWFpjX8gzbp7Kz7Wjl7GQq9U5yZCGO5gAvRMp0GwuJsQvhlQIKcl?=
 =?us-ascii?Q?hJrPJCbEjmb9s3gaQCGZbVkQ0yC8XTAIovV85P6FeszCdDs1NeR8FlkJ3omx?=
 =?us-ascii?Q?MaHTSYiR0WSoVGNmmzafw8htQ6j1Nzo+JosBfJoac7vYnUZ9xVJXSo6jRKOm?=
 =?us-ascii?Q?KM3NeBavav6drUfL3DL0Bv9abWdfH2rwjHfNoemjNSfKu0i5f8FeQF9kRcpl?=
 =?us-ascii?Q?X18+7xg3YlKdbrHLGXkeWCT4815IVC2CIEcXUmKFr8xx0Q0bOpZ4QfPUbtds?=
 =?us-ascii?Q?EIT4xCPYh/QSm76n45fVb0r5qgxbxPSZesuP+3LI/Urn7fjTn/pLth866N9n?=
 =?us-ascii?Q?lEaYi9h5wWl2xMqRNoA14xnptLd2uWgj5iRaRlVe2up/qQDd83WKEqeQ7iIh?=
 =?us-ascii?Q?TFozdtcJ5VVWb63XW2+jOWOquP9W74O40KtW6w3+go2Msmym0rGYVLYVaWno?=
 =?us-ascii?Q?I3H4u8rDJE6zRgqFwNhdrg+Ej3M14r2HhPl3S+LX+MTFFVeSaARBCXNLCMXG?=
 =?us-ascii?Q?+fz2oZEdg5JCp3PSH/QmOfXOmraJNikTCdYV+s8O9imO30MMXJlKttBquUdp?=
 =?us-ascii?Q?92OgJCIzWY9p1VLLVCCxxJv0c79cgpGXJowffTHg++vP1HPvaEZwFYLamgHd?=
 =?us-ascii?Q?zlJYUtVlzRQ5/8DGVkM9RVkGrlFFGnjmuKH7/ydCsrTrwjsnojdV2w0Qg/TW?=
 =?us-ascii?Q?featFOWQR2FspjNLQMV5WVnFid4XKW6lclkMA2DvCfiUssSBHhA6htfA0hzJ?=
 =?us-ascii?Q?j8QZUdV+P+5Ggs7aCuvNnhPYNMqclZzAF4r5WPVwe7zZletB0JXVLZUPG0PQ?=
 =?us-ascii?Q?FB+eOQbPRej6asCXQ9W5r26f27DKPbL+b1gNRpOK8KBhL7J/xTM1HadVMhhG?=
 =?us-ascii?Q?AJ5Nqp7upnMG9QIdTNy6xOVTMt3ax+tc1RD8xM9tkMgoZZZr6jAoc2EoGWXs?=
 =?us-ascii?Q?HQvGbM+PSUqAYKbDAHFp7b1Ft6AjUX2u810/GUI1y3caeE/Kj83BMOC84Us8?=
 =?us-ascii?Q?geA/PqQTPOLhWaBbC/QxmzBKONHxMQewfE0lwzJ9oijJxVGBejmf04KNCkrJ?=
 =?us-ascii?Q?448GxeuomA7x7ECDNYHPd3IKvDHqcl57J1Z7uPOhYDRn+OlPDb8bQtrVv+Uo?=
 =?us-ascii?Q?UO3W2jpAcKyd61h01YsmycHzJnAcox2TRC0USwxMe/xX0t8V7MAYLZ2Ve5Td?=
 =?us-ascii?Q?kHHZkhu34FcXGJOuu0cehCeujNAZO+QU6purBYHcmWDc7H3Q8poApWT/hOK6?=
 =?us-ascii?Q?Xz6GyFV9pev0Ne7jpC8GOIjlfQDqzf+jRL1uD3dCrHaazsB0ILYLqco4M656?=
 =?us-ascii?Q?iSGAhRCRKMt6UKWnQJIgg8xvMYEuVXcd9kFqjIqR/FoahMFSoGT4rLc3JWop?=
 =?us-ascii?Q?ijXzixnzC0nb8XQTgn85c+FnTCRQc2FA/l1wFwnj3s/JHWqpGIMGmXAYZ4NH?=
 =?us-ascii?Q?iSdgPs5o8hZrI94StbkExMGZJwenjQq3CtYYkFwb7pNwppeSlsQt8RJ0sW40?=
 =?us-ascii?Q?PeJu54J9EzG9r38vcntnvsN3pqTEr3XbuGXyhT1AR51+9OD0EjvZqTtQ05In?=
 =?us-ascii?Q?cy+RD2M+bVs2CrIu716SlKFr/kZMgqLKxJKjaI1aox5R2V69gTHcL1KdGbuR?=
 =?us-ascii?Q?WmcljOHfxnWNTkbPgnKmjgDWw9yc96x62CSFRWTFwKdxBPIY8yRq75fY114z?=
 =?us-ascii?Q?kZ7yxPczhvIXoB5lNdVDwXqGrdJnQMZk5xgDTnueudHoRmP9iaOS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2448b260-13f9-400d-a064-08ded2d216df
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 15:54:50.4570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4G20Qhns9lRr76fxO35bmxbykEmuWlvLuze+sUExVizRfh0307hBTybzYPfsYmLIGvb1D4RZDpvBR+Mn+1ZBw+75EtNegs6OrLs+bbJQMhHwCDWQ/roxyXuPzKIOf6iX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9812
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
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
	TAGGED_FROM(0.00)[bounces-38902-lists,linux-gpio=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@oss.nxp.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,foss.st.com,ti.com,lunn.ch];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25C466C734F

From: Shenwei Wang <shenwei.wang@nxp.com>

The current rpmsg_id_match() implementation requires an exact
string match between the driver id_table entry and the rpmsg
device name using strncmp() with RPMSG_NAME_SIZE.

This makes it impossible for a driver to match a group of
rpmsg devices sharing a common prefix (e.g. dynamically
suffixed channel names).

Update the matching logic to compare only the length of the
id->name string, allowing id_table entries to act as prefixes.
This enables drivers to bind to devices whose names start with
the specified id->name.

The implementation is copied from a reply by Mathieu.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/rpmsg/rpmsg_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index e7f7831d37f8..f95bfc9965d4 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -414,7 +414,9 @@ ATTRIBUTE_GROUPS(rpmsg_dev);
 static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
 				  const struct rpmsg_device_id *id)
 {
-	return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) == 0;
+	size_t len = strnlen(id->name, RPMSG_NAME_SIZE);
+
+	return strncmp(id->name, rpdev->id.name, len) == 0;
 }
 
 /* match rpmsg channel and rpmsg driver */
-- 
2.43.0


