Return-Path: <linux-gpio+bounces-35724-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAZsOnrl8GmoagEAu9opvQ
	(envelope-from <linux-gpio+bounces-35724-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 18:51:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 453C0489592
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 18:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1368322AD2A
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 16:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09ABC325716;
	Tue, 28 Apr 2026 16:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="D7yT/Thh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012055.outbound.protection.outlook.com [52.101.66.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE70545039;
	Tue, 28 Apr 2026 16:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777394184; cv=fail; b=uyyJXoJ8rOytoIXBQHGbJWBm+ZfUYAA23gWojrJ7+OSeh39+/penl7uX2EVQ0H8vBH49bwlgG7ObdY7oo3ipDfTHA8JC/t2hRvYQ0Y0lQhi0W78+1DpqEwuAqMoHAN3/FfxDq0HPVIAJ1DqASvXDh7t8hgiUk0sNkzbUDiRZcis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777394184; c=relaxed/simple;
	bh=i/adgY7CVt1fMwtM1gfd6XvlpEkDkdTlZco3hhq6JEo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nK8QXJvtVhWUBrjpQ8HqQ4qng9ecA+hRZZJP5KB4l463VqyMJRFp9L8McOpajjgE0W7a0XCvs/GTTDJ3thmXVe9xuJsiyZI1GWDDs7Lw/iQOdFBpcDHslIW6PpWE1ljwR0PDOLKy5XJpeNYaNmzACulOwu7BK09DjK3eGohLIuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=D7yT/Thh; arc=fail smtp.client-ip=52.101.66.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KeVDKhojuZ5FihL2Gh1Dzej6TRwSa10U+ql3pBQQJmtlUH4TklWfMa7LU5mm+PJ4IYAHp1GxK9f7Eo+iVs30TgTQ4xtE7vXlQtRexiraveD8afGdJmzWi5FjbH02nTUkZ3XM17pL7oNIO47ASw0C4DOb5ddWwuU4fvbdnxZBWzcMKom4b9IYn3Nfxmncp7hnSZ82smA9hRVi3uh9hsDwt3K8xhFOg4SVEyuvpBP0gvnlmrHAJR0X8MdBrZ0zf4ECIwHJ1/U8CBnZKNLZa0tg30mqwvQ3ZPj6juhiKyWFeVH3uKKLxhMzP9S4M/gUjDZEEEqRmOfkE3pK3LeuBBtn9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBFZDcmrnhT3Om894Po0V720gXBPGinpgGBmDQ0WZ9k=;
 b=FjLvNGRYA6PjHhv8zl0Uz8q13hCc0W52fCBAM9Km2CtWc84jqLXgrMigrMGfuX0AjrcjhhF+US2dQuImQ5KL0eUTDUjFpJRSVR1tM0nlA4rg+KToeljODhxNBibHx0hqaFTX1uBsfyV8efx5hZTOybhYmd2vJOiu8k8xUwQ1lQ8MPdxoOzZYUZLR8UTz4f47SE5uoMZD/lJ3tStvX4F05TuT+UVtzqty5y1PGW2MypEmjaTEitovVBKJGJ4nI2yJrrZXcMlcU/3YoMBP0FwKQVxdhWeyRsdRqaGklUfm9CWIijNqxg/o/lnbVNnc7rcFBV4uw+49qeYgTrvFb1K8Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBFZDcmrnhT3Om894Po0V720gXBPGinpgGBmDQ0WZ9k=;
 b=D7yT/Thhr4t/lto8cgsZV0Bgj6+C3CRKYvM+TgsU+fsu50sBTNiviO6USMh2oZFhGGwOOdG5NrVVBR46ZL1txr+9NE4zohj2/HtAPa+G6ON9tp1wb8uz+RqNbwc36m8DAumwIBPEzkd6AdK7gnlqljm1KbSl167PuQpTFYdnANa7pYjtiQZEEAcr6lfup8jcMsoOKak7sXe5rmN/rgRVUlHoZVVY291rn9hxPoJwAEQC6zHWkKYuLqkucUCHkVVLZBNomFsOKN+rDLzzLFvWEkqe6EjLSH9sCrYDG+apQlRp53ynROPD5DnmUMiJDjjy5pSBp6snJXKYooEjoXMORA==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by VI1PR04MB6942.eurprd04.prod.outlook.com (2603:10a6:803:136::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 16:36:18 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 16:36:18 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: "Padhi, Beleswar" <b-padhi@ti.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>
CC: Shuah Khan <skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHc1y0jvFA11n28QUCTjU6fNbLbbw==
Date: Tue, 28 Apr 2026 16:36:18 +0000
Message-ID:
 <PAXPR04MB91858D4F2549FA068D7ECCC289372@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <29485742-6e49-482e-b73d-228295daaeec@ti.com>
 <PAXPR04MB918568939EC7DAEB4BB6C8F989372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <32c119af-96ad-4da0-86f2-cdc4ba57ef0b@ti.com>
 <PAXPR04MB9185C7741DCC422212F952CD89372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <8c8cefaa-7d9e-4b73-b92f-40cb52b37f2e@ti.com>
In-Reply-To: <8c8cefaa-7d9e-4b73-b92f-40cb52b37f2e@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|VI1PR04MB6942:EE_
x-ms-office365-filtering-correlation-id: 4c42d29c-5e46-4bb8-97a6-08dea544460f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|921020|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 vojYnOucAqgrlHBm4cpCOF73ysaq+F7MJtpQBpEqgs9ISGdH1V+7RvVW0ijX9ock+TRjeZ5zQ41M+0yq+RiKUtPwqFC7saKIyikteHaTbdAqMLXO/rTWnbqZDn4+t+fube1jFmTANnWvze61C5Bnhgkor2ihHDsAWkMq1zKZblYpIuXMIOVisAYP9V6AYfb87d6DL7wY9QfB2z8rXKSzRQtQHFC0U4tYFuWYwMNJXmOpNA3PPOKr4gzrSiIc7tXoaEoNQT2W1J+Eelog80Bp+qU6mi5geQ65+68rzaUib8CiDO60TbQBI27ZgWBhcR4mvmTAehNh9TC0nx7ehoA5122EVAZxRzNiDzc4nP0zqzU7SPmYm+elUtdiKJJdSBKjyIifnm95dBZXxSKAFMWR8xWbplLLvgOAMLdStRB+rxn8lSamt+A9V8KkWSTXit4m2eS9xJGZipY9qcTQTpQ5aNL8AjFs3rb6kec+K7FCWfgpTOa7nYpj/LoiBghKu0AQLqVBzLk7avh5dxUz/6RdYYxMJ12UytPYjsumBOCWUsJrX6QI6mrsiSksoq1KqCokl5dgfNDtflUvJm1+Quo9OutyQDJ4FDg03wPOrtRF/Gd5y73znXCPZdOa/SwnjJf3bfCobvvZQ8V/pjbCGfU65HBuhVmsL1hDsdlFA3WxwzyEszfsayyBZyXUiktT5KFwfbulAeTgcOLeYQnAgs0U8kFI1TXr12XT3defpMBXyUNKIlODjwfS05ZHWSW2OCeWXvRc9meEeRRMAZ6IjjqOJqCCZanYnVO0MmmUHKONIJ9jLRnSi0m3bOhmP+Sfkqsx
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(921020)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3TA+I6sRj4brZwx/UNCtVNCAKDuWkY26iNUKMqsfqoXZ0i/4SV80ishX2FNh?=
 =?us-ascii?Q?CbvlTMtnRosxxFJbW2cGvGundsCMhXOkb74C4ifxau13/5nQ7W4zcThIte3r?=
 =?us-ascii?Q?F94S6Wq1tc67eJsViWCrLll0ndWIXmzI2fCbbrsd8XRj9HxcqTiH1V/6ElVu?=
 =?us-ascii?Q?c2SYsgBFYj0AOr7kEq+RGKU6yMOFY6o3OU7adbbPJNfIobEtf2opf9il7quD?=
 =?us-ascii?Q?R/Gxijq2TnCiVta/woekpLDv0Vnx4i7C+QEWzzLepCOFDKqKn/svj9YSbKVC?=
 =?us-ascii?Q?xqoBRSFqDnJK/PY1a1o1FKMmfxIDibDwQC8+nYyxRR9NGQhpMXo6knRSP6ey?=
 =?us-ascii?Q?3WrFwuTRQsUa1eLLP/JyAczWPkaw4GpAP/L94UUezRAP6Ggb5NYkp83Ec9xv?=
 =?us-ascii?Q?gqBIscJ4BylcvrLwXOUTKyHbscHBXet3CXwZRRtenrCNWSCGswnmjKVKF7hN?=
 =?us-ascii?Q?36KOkpLEtLphDuRESGfDYraFJJW3jLLNUfPiyl541hdi1+L4N1Ya2V5ftZbC?=
 =?us-ascii?Q?UHg+sYGIPzYN1MALvKl//kzxXLN+QXIB2D6l4SHjumlh/QrJftC2r0ImPv5k?=
 =?us-ascii?Q?e8dZXD7Sx1Fpo98sdrUL1aNSPCrfneLXlewOcrg4Bo0hoeD4bB7q0tL0RQFS?=
 =?us-ascii?Q?zzdqHmgIOHJg/PBUV1PeRMZLf397C7HvOL5AxjCLe4tg7CqGCaHeOzitOPOO?=
 =?us-ascii?Q?585bPmN3/79Gd7s9EmiAfWbfKk/wTPE5W2IdYu0w74USz76gMkwVYbMjD0ch?=
 =?us-ascii?Q?GVmNTEvMSXdyFqpMDDDvLC2eBGvcT1391yn39fMVsFIQm+rpIuFPmWvi4+wW?=
 =?us-ascii?Q?aiEI64b8J4Qy4dF+j6p3iKrt54mnaJwWRM60BpnmhYwGZ8ewGaH6lEAW7wQc?=
 =?us-ascii?Q?/vPhy/SgMtuPYFFc5D644B1AHJRP7Brt8RWf2M1SG4DwRu6uLvhOudsGIcuc?=
 =?us-ascii?Q?9sx3jJjrlVh7iOzG5jZg3eeO1IhxlMSlv7Nq7Xtm60Xcaa4xWbRXuDYL5v57?=
 =?us-ascii?Q?40Qdwr1QVxf2DD8dW6646ou9vT371RmVAT/GhflkYVPsuxfs8y6Scb49p4c6?=
 =?us-ascii?Q?bKl6mJ2xD4i3ytULrcP5ir8PYZLOt1ElW9EM9Q/L5PWJ0r4oUBOwu8rkom8s?=
 =?us-ascii?Q?vE5/B2vKxeI4Namx9c/6ud/VnzPAuit4oFL4N2d0cPK8iPExmGAc18zohk0p?=
 =?us-ascii?Q?Ogb3KUh+VPC+fXWWv28cWQIQQ9JDP0q79oFk2cwZJ73Y5KEFsLHUCf0IWnuX?=
 =?us-ascii?Q?IM2j+U7grWeFxqgtccwI0VYleldm4PKSdW1cCeYDRtV7s3F01/y9MfbMZmlb?=
 =?us-ascii?Q?OKk9GjmbfFd56B/4hpwRCaI7/YzOAcbzQhqbpo7UYFuzIOzlgL1FqwZfBaMd?=
 =?us-ascii?Q?jfuM2yw1tYpo7gN/+g+h8VtuHmraR9+ZOANkKFNYgTmGs9F22KEJoKzskzfw?=
 =?us-ascii?Q?I+wPGp34SU+QEbQF980Qcy458QfAyRGUs1nxgOhteCqj4PbhCEc4ILOzMXY4?=
 =?us-ascii?Q?xk1Ozis28aSh9S+sqPI4bKr22qnp+uzB7GXmf2BwwH4RnHiG1gwQcQS+HlYE?=
 =?us-ascii?Q?k4/PZkPbLWx4s6Mf0ecPyB7ckkkX2r4pHFUCsprftOxf59NkdBrqEPgfD9Kg?=
 =?us-ascii?Q?4cdB5LtfE4UFhuhEWWqCLPC+RooU0g7EImpY1uJYTv0E6DP81aWWCiEc69kG?=
 =?us-ascii?Q?M9LKH7kj2ME7K7hToKTFWtbnTOw5YsfkqCcOHPSwgGiktqFn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c42d29c-5e46-4bb8-97a6-08dea544460f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 16:36:18.4243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ByrfzpsIPzfy2rWi0afGiugB80C7qYXHa04sM2gbkVkOnRlAgcfSApCtmxCitYm/7AHvo+2dcHpWaAtxg6kdBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6942
X-Rspamd-Queue-Id: 453C0489592
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35724-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,bgdev.pl,lunn.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]



> -----Original Message-----
> From: Padhi, Beleswar <b-padhi@ti.com>
> Sent: Tuesday, April 28, 2026 10:53 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>; Linus Walleij
> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corb=
et
> <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Fra=
nk Li
> <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shuah Khan <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; l=
inux-
> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Tea=
m
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> Golaszewski <brgl@bgdev.pl>; Andrew Lunn <andrew@lunn.ch>
> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO dr=
iver
> >>
> >> Nothing extra in my opinion. rpmsg_create_ept() just creates a
> >> dynamic local endpoint address for Linux's usage. The firmware just
> >> has to make sure to reply to the same endpoint address where it
> >> received the message. This should already be in place IMO, because
> >> currently you are sending all messages in the default
> > Since rpmsg_create_ept creates a new local endpoint address on the
> > Linux side, how is the remote system expected to learn and use this
> > new address for communication if no additional logic is added on the re=
mote
> side?
>=20
>=20
> Remote side learns the endpoint when it receives any message from Linux f=
rom
> the dynamic endpoint.
>=20
> Lets say rpmsg_create_ept() allocates a dynamic local ept of 1026. When y=
ou
> send the message from this endpoint, the standard rpmsg header would have=
:
>=20
>      85 struct rpmsg_hdr {
>      86         __rpmsg32 src; // 1026
>      87         __rpmsg32 dst; // rpdev->dst (e.g. 400)
>      88         __rpmsg32 reserved;
>      89         __rpmsg16 len;
>      90         __rpmsg16 flags;
>      91         u8 data[];
>      92 } __packed;
>=20
> Remote side tracks the dynamic endpoint by reading src =3D 1026. And whil=
e
> sending the response it fills the header as:
>=20
>      85 struct rpmsg_hdr {
>      86         __rpmsg32 src; // 400
>      87         __rpmsg32 dst; // 1026
>      88         __rpmsg32 reserved;
>      89         __rpmsg16 len;
>      90         __rpmsg16 flags;
>      91         u8 data[];
>      92 } __packed;
>=20

This explains how reply messages work in this scenario: the remote side can=
 simply send=20
the response back to the source address of the incoming message.

How does this work for notification messages initiated by the remote side? =
Should the remote=20
system need to add additional logic to track the source address based on th=
e GPIO instance?

Thanks,
Shenwei

> Note: Remote firmware can also send messages from dynamically created
> endpoints on its side, and Linux can learn those in the same manner. The =
dynamic
> endpoint address is passed to the callback as 'u32 src'. So you could pas=
s on the
> 'src' from rpmsg_gpio_channel_callback() to
> rpmsg_gpio_send_message() as 'dst' and call rpmsg_sendto(port->ept, msg,
> sizeof(*msg), dst) to reply to the dynamic endpoint on firmware's side.
>=20
> Thanks,
> Beleswar
>=20
> >
> > Is this handled automatically by the rpmsg stack software, or does it
> > require explicit support on the remote system to exchange and track end=
point
> addresses?
> >
> > Thanks,
> > Shenwei
> >
> >> endpoint (rpdev->ept) which is also dynamic[1] and is created when
> >> the channel is created. And you receive the responses correctly.
> >> (Unless you have hard-coded the default ept address in the firmware)
> >>
> >> [1]:
> >> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
t
> >>
> hub.co%2F&data=3D05%7C02%7Cshenwei.wang%40nxp.com%7C057bf7f0976749
> 5bcc3
> >>
> 108dea53e43f7%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63912
> 98840
> >>
> 26686251%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiI
> wLjAu
> >>
> MDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C
> %7C
> >>
> &sdata=3DiSxGWEvYSyu29loP9b1R2bw8bvwR7pbzQ7D%2FGeB%2BUYE%3D&reser
> ved=3D0
> >>
> m%2Ftorvalds%2Flinux%2Fblob%2Fmaster%2Fdrivers%2Frpmsg%2Frpmsg_core.
> >>
> c%23L480&data=3D05%7C02%7Cshenwei.wang%40nxp.com%7C4ec06bf01bb14dd
> >>
> 2625708dea5387471%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6
> >>
> 39129859078622527%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRyd
> >>
> WUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%
> >>
> 3D%7C0%7C%7C%7C&sdata=3DOUmjqOdWqiXSTjPDv1TUvrjKP1YTx9ji44SdGlIR2n
> >> Q%3D&reserved=3D0
> >> (chinfo.src is RPMSG_ADDR_ANY)
> >>
> >> Thanks,
> >> Beleswar
> >>
> >>> If the remote side does not need any extra support, this would be an
> >>> excellent
> >> solution.
> >>> Thanks,
> >>> Shenwei
> >>>
> >>>> 3. Send msgs from local ept in rpmsg_gpio_send_message() by:
> >>>>       rpmsg_send(port->ept, msg, sizeof(*msg));
> >>>>
> >>>> 4. Get the port info in rpmsg_gpio_channel_callback() by:
> >>>>       struct rpmsg_gpio_port *port =3D priv;
> >>>>
> >>>> Which also eliminates the need for struct rpdev_drvdata as you can
> >>>> just do
> >>>> rpmsg_get_rproc_node_name(rpdev) from rpmsg_gpiochip_register().
> >>>>

