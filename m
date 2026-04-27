Return-Path: <linux-gpio+bounces-35538-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wG/jLXca72lx6gAAu9opvQ
	(envelope-from <linux-gpio+bounces-35538-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 10:12:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C0846EE1B
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 10:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23870300F51E
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 08:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B3339A058;
	Mon, 27 Apr 2026 08:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GPzaoh4Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013035.outbound.protection.outlook.com [52.101.83.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E86274B2B;
	Mon, 27 Apr 2026 08:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277537; cv=fail; b=b4JVb2uMD7wMS4ZpWymrWrAOkLoVr1cdHYycWaxm9Q+h2Wmvjqcjj9fXwRO4RGxA6EDkQ72Ze42ebtCamH7T7A/KlMpoEgQvXQSW1fGd3ELFvgrf7UCvFaF9GGPogsGnGhgtGA7SPVAPdpQ1Foc5uYb1Amcck4bTVbMP6bdbNPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277537; c=relaxed/simple;
	bh=GuNZmFHay4Sd1/lBFcwC5eisaWdM/+tUE3uzg70bQmY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pEOUGWkOHkIArYE/G/rEi8nDcrVbg9ndwBj9gOLvwRDJ9RPthyENOjFJ9QYImvLzMVEsRg5UeF0Q4OND1WY/965oLYvygy1njsdhmjYBLExYQZufzJYehSZagP5GEvzgdWxxeGVvAFsda23tFOl/7bTdtsRfWBz8u4Zf9bf9bCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GPzaoh4Q; arc=fail smtp.client-ip=52.101.83.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cjcIum+8Nj+eMmbItoPf7tHah4NpLbYc5LKSUz0Uc6+5aNfSqyXXMO0xPZULYyKNYmgxedshI7gHvX8zOszFSmsQJXj5L8X3uXVxBJQo/cnGzE1mInn4ewbFLAOtms1i1sticSUiGae3LSXUJWa7pAdKQ0hVou6w8WWUZ/+udXWj6vZlF1Q8DtSmDPM+yI91v3PzU8lB9XAc4i/7uZ78WDTKw8pkzPr2MysZOqjFamch3D32yIxEMT3GkHT4YfWlJNd0w0OCfrlhItJz+FDvY55YAFNrDwh/YU+Emx84HrrIY8VXWXz7FpSha3nFSmuWzpsmvigGU4Uo5sXD3+XP1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYQi5M7RpOYiTk3DMW5x5Woxfmwnz4QjrTnu+btPZRA=;
 b=k3mnrIlqGpi9FTKOq2FFpQkvaZ+6bEyfUJ7CFsTFU48Svr9YLw4IAaKyt7xjYtGLfK9+VSRkV3bzLkcF1TSM7hXi9OZtYVb+y+NL8ZgUFSJhou/NiuQTzlDAGzqrCsDaHGBBMw+h0pnZsVAVPK9EtjbtflOOP4CAVI9j3x4CWtbshc4mipC+gNWOdXmKPv+ltV3OmQLJxFuqSxyBfm7rpDnmmVHo3rgSzAIEGAxsChD4wLf7AwkN/7WecQkW10BwlwxXFYg5K1GdDaeYf2DU+Jyc7keMGr82mr/Ykx/RYdk0nm/yjWY7i1WbeHKaX+rxwib9ZPfJSujOYNZWdtNG1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYQi5M7RpOYiTk3DMW5x5Woxfmwnz4QjrTnu+btPZRA=;
 b=GPzaoh4QoMQYRiL1xvaf/YRouja/2sCldqI+5HdAgoa6cpSQ1z3jZJuRHfN/iXhdMgt6mnInu7yVDDs4uHG7dM3KWfLyXL0cY0RYGMEHIOdJB6CiL8EhiU24mRPnsxuR3KJ9eMiX1ympgUPYnX2NJWIbEEu9PxVbtwn6o9DOebC32BCQoiA5Eo3GXHiUbxQk+udfFSzGJwB2/wQIRvniBJ7PCBxLBXmKlWnIHQ6vx9/waQT4ZefDFSYaK6Z1BG8dpJFbEQa9TlzZkJ3aP1MpBG3+10il8zoQqd7YR7ydx1aMTKZyJ/g1bv44ZWKngOnd6TJHPNhgDAke6Ebzl8TO1g==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA6PR04MB11715.eurprd04.prod.outlook.com (2603:10a6:102:525::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 08:12:11 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 08:12:10 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Conor Dooley <conor@kernel.org>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li
	<frank.li@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "G.N. Zhou" <guoniu.zhou@nxp.com>
Subject: RE: [PATCH v6 1/4] dt-bindings: media: ti,ds90ub953: Add support for
 remote GPIO data source
Thread-Topic: [PATCH v6 1/4] dt-bindings: media: ti,ds90ub953: Add support for
 remote GPIO data source
Thread-Index: AQHc1h2M1MkEbrlROUK3NS1D6gBP5A==
Date: Mon, 27 Apr 2026 08:12:10 +0000
Message-ID:
 <AS8PR04MB9080CEB000F4F1C9043E8C21FA362@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20260424-ds90ub953-v6-0-7a84efbab316@oss.nxp.com>
 <20260424-ds90ub953-v6-1-7a84efbab316@oss.nxp.com>
 <20260424-reshoot-postage-7bfe0a5eca80@spud>
In-Reply-To: <20260424-reshoot-postage-7bfe0a5eca80@spud>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PA6PR04MB11715:EE_
x-ms-office365-filtering-correlation-id: 89cb056c-616a-4082-9c25-08dea434aea3
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 O/aPqUnVBetYXHK3ywQwTXYwoELlB/6bAfY5w1NRn0h6CSiabzKBAlDgHCcwOsHeCOvMs7oVuC3WPQyVYZk9GMnpabqcRkjbIEMyQApPaADGLkeaJgInP0K+MLtVoc8TdELvJdZHgrtHVQsff/IRzYsjlrW91j5TCOXndR5o2qq8RqZmLTW/YF1sqSwGUCbpsmR54Y6S3m9w62gz41AzGd6g7e8kNmv1Au1M0vk4BqxrRRw6GnVHnUPBH3Rs1TatYSfiP70ziYQ8U6Pu+uZzPcQ3sKAg2FJANUKooED/n5Zvft++wh4eYtVVKAuwEG1YKLlGwQLyD+dXUhnH6Krhx9H7rzuDdcPtVpGIaw1yytvZPyqapoxqG+ao2w77VXU2N43/FUs6N/YCT2UZ3OGDgeQ4bsWlPsqbofev4S++wucJ7GE6/FA7+pas79OvOPTyDTa2Hkgod7JHIHhRrPIfCe8ViA61tKFuyeeikExWRWa5yniTVntwFPTfPKt4JIxB1vQ4c/jCVz+W0ztsn1yEYQeOSwrnOHvfUaJL0x511AeHnZQ24M5xIZE6tOjgeMdRRvs2gdQZZbyDgzKG9NDeIHTVckJclY/78QbxmYBer/heSKLdjTYnaaa3+/+NTid/TlOkYLBebe86KsG5bmlCfv6Kg9Oce8CjJL7XD8P9ABtrvgoSUpC8k3FCAkwiwmHsencqJLd0BnjVhtMPigzDC3vVRQtcwWaGCfAD7YjDvYBlG8uUdP3M90kC6VJD2hs7FZ8LqZJxxto24LWNi+BlhKNzDM6u0RQn6b5po8IEtTg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?YVl4kxKrcH0csQIBXP/OzTgHsYaTyIa4uK+3I5+3qJvKeQicVKvCx3UVPKU0?=
 =?us-ascii?Q?bHOz5zbEgxNCAKKk4xL4S22/AK75UQPUEKsHiBHC+kkNlTXm8N79/wQKEJ2G?=
 =?us-ascii?Q?UXKPhDVS4MbEVYDAvPj1qZqbAHa5+Ua2/rQANB35lHwM1hK0tdr9hTE9Hrzw?=
 =?us-ascii?Q?4vJBFhdLNYZwLINP9UeztEJ4+EitBn5SGXjN/AJTXpO1HvdGK0J9F/RiRYjk?=
 =?us-ascii?Q?ODkVj0K7fzEVubK5CLRxxWoLQxCtHswMaCHrUWGSkxEWiyExHz0zMhxngVBZ?=
 =?us-ascii?Q?DMTsBC6FvngqPoKd8IqGVBpHiHL4OPg4QefFW0Kfq8lC1ZSaxO8fbk4w6KE6?=
 =?us-ascii?Q?maRkf2gK8BKW8328KsXZPBRSzLqup1x1ekTnh/tS1PnGkVuwxoO5y3+TyV5O?=
 =?us-ascii?Q?yuXtHJ2gHXuy/XCSm1U02/jNcCOJLPCXOoSQatmfb/42O7FFgNiu075+VCBD?=
 =?us-ascii?Q?IKHGhpNnC6qesnB8PprFUg5fflPH6Ewonx/K+V7baLxpU5OogatPpnAucvIe?=
 =?us-ascii?Q?cfesdGRIrhXKQc1bypkZybti7+3rkWsSmKMSi3s0vmwEQX1BshdPpmtZA5o/?=
 =?us-ascii?Q?lNvir//1OCoqD23iia226V0TneuDLgn9zVwRllS/c+6EkRafW7kaSJ3/ZRyY?=
 =?us-ascii?Q?BynDZjh00cc20mbQbxfkPt2vQ5TrwrqC4JAB4FAtuIEhuAqPqq8zzqDpM/Lh?=
 =?us-ascii?Q?bOFK5BjgjQOaRr0fTyAbcjylvnrvqBI6CoPpp7hoMvDx4DYpghg701lr+M16?=
 =?us-ascii?Q?rk/URTBsYUN8wt+5eZ4OZkt1Xq3zEldBNCHz9hbjrvpVgWfdVROSJqAR+Mn/?=
 =?us-ascii?Q?jBObdrQ63pNup9EG1Cyano/mERNcLxQ1kL6aCjx8l+jy4YfnWGeCDbt2sYyd?=
 =?us-ascii?Q?vjfHPEVWaT04CgADM3TW3wcYRU+QV9jE8VdqgA568+hCgItBI7GnUhodL5GA?=
 =?us-ascii?Q?4he5uwY6824aPoH2nV63i/OrInFWsHZ4QK3kbz5d6XqGBXzxiXh9dI0tu7Ns?=
 =?us-ascii?Q?ty8yKdFBnlGmejqbefr/m9N9mMUzdu1WxyP13igIjOVykAiVJWZNcsUNzL2z?=
 =?us-ascii?Q?4dx276g8LzGgOlpOCao8jJDcDmve7IaB9L6uR9X/ckad5beg3V6T5MOjrNqg?=
 =?us-ascii?Q?tuykTmBTBkr2nzSeTN9b06jM+Pvsg3wz4vJOU3A1a9VORPx9JhSAJ0x+YWCk?=
 =?us-ascii?Q?1Rwwsh+iQXhFkdmG/gTXW/kDIMCV+LdkGA/aNZCn/txBO15j+77Q7FPaeHvp?=
 =?us-ascii?Q?FILXJ3fQ6A6/1lMYAG6R3cnZzgVVxVT+04py3tHJRgOdzZmeA/g1E+97vnQF?=
 =?us-ascii?Q?CHUgF4MER6Gf+mzBFDfnWig3fXn2fYx5vi63pAQzLYwNCLvsLZh5KVR30HKF?=
 =?us-ascii?Q?WAtXouReBHKvd9dEHwD4N/1Bx6By+kyrLEc/hK0lIJyJPkle09uKvyIjsY5N?=
 =?us-ascii?Q?LLXep3zB8/yfgz9vmTdfExIlSdfB1v9zaQpFSTTWmtV3MXFZdhPTviGest+1?=
 =?us-ascii?Q?MzHOx/T63Nlc15kllDUTXDx4xwku6AUlunK4YFsUbzE6cGIWSd9E+4nSauHe?=
 =?us-ascii?Q?nnfRiPnU1dkLjMtz5mvw3NDRyM+jHKmdyZjoczwB2PoisSnieZISlnsPQWUF?=
 =?us-ascii?Q?9fBj5WROoTzUnwku4npVzJM51iPoWwDKsM1y+Sozws5kgjwI5kE635NFKIYf?=
 =?us-ascii?Q?AAluAaOQt7NIja2pQt3Wg6+o7ZHP/0LUXMIYFVxmbsETSI/iMym2ehZXWTS8?=
 =?us-ascii?Q?kY7brzEV4Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89cb056c-616a-4082-9c25-08dea434aea3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 08:12:10.8035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JiNfVFgsNOBEYsAwb0ZBf/f2emYltZ1py8EU8kH8pCLZjOZW07fVlPpdlQU6K6WwpqzHLJAaiDFQcYjeuiKmIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11715
X-Rspamd-Queue-Id: 56C0846EE1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35538-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Conor,

Thanks for your review.

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Saturday, April 25, 2026 1:09 AM
> To: G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>; Mauro Carvalho
> Chehab <mchehab@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Frank
> Li <frank.li@nxp.com>; Vladimir Zapolskiy <vz@mleia.com>; Linus Walleij
> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; linux-
> media@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; imx@lists.linux.dev; linux-gpio@vger.kernel.org; =
G.N.
> Zhou <guoniu.zhou@nxp.com>
> Subject: Re: [PATCH v6 1/4] dt-bindings: media: ti,ds90ub953: Add support=
 for
> remote GPIO data source
>=20
> On Fri, Apr 24, 2026 at 09:42:24AM +0800, Guoniu Zhou wrote:
> > From: Guoniu Zhou <guoniu.zhou@nxp.com>
> >
> > The DS90UB953 supports four pins, GPIO0 through GPIO3. When enabled as
> > an output, it can be programed to output local data or remote data
> > coming from the remote compatible deserializer.
> >
> > Add GPIO flag in second cell to select remote GPIO data source.
> >
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > ---
> > Changes in v6:
> > - Added GPIO_DATA_SOURCE_REMOTE flag to dt-bindings/gpio/gpio.h
> > - Updated dt-bindings documentation accordingly
> > - Dropped Reviewed-by tag from Rob Herring due to significant binding
> > change
> >
> > Changes in v5:
> > - Improve the description for "#gpio-cells" as commented by Conor.
> >
> > Changes in v4:
> > - Use folder block instead of literal block for #gpio-cell property des=
cription.
> >
> > Changes in v3:
> > - Make GPIO range from 0-3 to 0-7 to support GPIO data from remote
> >   compatible deserializer suggested by Rob instead of adding third
> >   cell for GPIO controller.
> >
> > Changes in v2:
> > - Remove new property ti,gpio-data
> > - Add third cell for GPIO controller to select GPIO output source.
> > ---
> >  Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml | 6 ++++=
-
> -
> >  include/dt-bindings/gpio/gpio.h                               | 8 ++++=
++++
> >  2 files changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> > b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> > index 2e129bf573b7..da63771bc236 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> > @@ -21,8 +21,10 @@ properties:
> >    '#gpio-cells':
> >      const: 2
> >      description:
> > -      First cell is the GPIO pin number, second cell is the flags. The=
 GPIO pin
> > -      number must be in range of [0, 3].
> > +      First cell is the GPIO pin number (0-3) and the second cell is u=
sed
> > +      to specify flags. See <dt-bindings/gpio/gpio.h> for available fl=
ags
> > +      including GPIO_DATA_SOURCE_REMOTE for remote GPIO data source.
> > +      Flags can be OR'd together.
> >
> >    gpio-controller: true
> >
> > diff --git a/include/dt-bindings/gpio/gpio.h
> > b/include/dt-bindings/gpio/gpio.h index b5d531237448..d04a494d96ad
> > 100644
> > --- a/include/dt-bindings/gpio/gpio.h
> > +++ b/include/dt-bindings/gpio/gpio.h
> > @@ -42,4 +42,12 @@
> >  /* Bit 6 express pull disable */
> >  #define GPIO_PULL_DISABLE 64
> >
> > +/*
> > + * Bit 24 indicates the GPIO data source is from a remote device.
>=20
> Why 24, not 7?

Good question. I chose bit 24 for the following reasons:
- There is no clear guidance in the documentation on how to add custom
   GPIO flags, so I wanted to ensure sufficient separation from the generic
   GPIO flags to avoid potential conflicts.
- The generic GPIO flags currently use the lower bits (0-6). By using
   bit 24, I'm leaving ample room (bits 7-23) for future expansion of
   generic flags without risking collision.
- This also reserves space (bits 25-31) for potential future custom
   flags that may be needed by this or other drivers.

However, if there's a preferred convention or range for driver-specific
GPIO flags that I'm not aware of, I'm happy to adjust this.

>=20
> > + * This is used in serializer/deserializer setups where the GPIO pin
> > + * on the local device (e.g., TI DS90UB953 serializer) reflects the
> > + * state of a GPIO on the remote device (e.g., TI DS90UB960 deserializ=
er).
> > + */
> > +#define GPIO_DATA_SOURCE_REMOTE		0x01000000
>=20
> And why the divergent formatting compared to other defines in this file?

You're right about the formatting inconsistency.

The existing decimal notation (8, 16, 32, 64) works well for lower bits, bu=
t
16777216 (decimal for bit 24) is much less readable than 0x01000000. It's
also harder to verify correctness and more error-prone.

If consistency with the existing style is preferred, I can use decimal, but
I'd suggest considering updating all these defines to use BIT() hex for bet=
ter
Readability and maintainability. What's your preference?

>=20
> > +
> >  #endif
> >
> > --
> > 2.34.1
> >

