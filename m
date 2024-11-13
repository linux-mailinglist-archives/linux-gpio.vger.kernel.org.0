Return-Path: <linux-gpio+bounces-12967-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9C89C719E
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 14:58:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DDAE2890C3
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 13:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DFAA1F5824;
	Wed, 13 Nov 2024 13:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TelbHHu8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010055.outbound.protection.outlook.com [52.101.229.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA0918FDA7;
	Wed, 13 Nov 2024 13:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731506244; cv=fail; b=Hos5dWTcT0jQOy6WoAaaFstPkdyngAZIKYsAewzoFswOI+rHL0iqA3XU5I1ev4pAiNccQpd3hqcXRThY8vmT/MdAKStENEOOA4q1qAAwZfdJckOEuyPh27mR8FtWzwyONW3VvLgvg22XHdlMacnwxgrujTJYGvEdBNAFq7pOfQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731506244; c=relaxed/simple;
	bh=ba3gO9xQGLHD4F1WUmck0KUS2sLWQ3SsG1JfQgX1xMY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F2MLyJ5ooyrHlxo4fMFSVUQvm4FHw9K0sxPTlmAOFLg70Jq35Ul0GQCh607NDbm3NkZnOgtVmD0Z+C0ofMw/ca7tap/e18ReX1LRpvafFIKIO144XpL7ONfrB5s9hXpYVtY+nHNR+XijIJEk+1pefQI7dMAL4twyYVPxYy2k80o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TelbHHu8; arc=fail smtp.client-ip=52.101.229.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vvkRoZ4iP+OMzPQTLjLuHQDYWCYY/wRdRlKoMhsDt7o90hyfSRciWhCCLJuVxjTRbkBAqvJDoDiz71CTTPOs5ZJgoRj6t4+vlsFy+nBcOyW04ODPO1HYQRy7GvFw4HC4/vG3DUfS1nGNxiiT2L0PXBjdk1xs3OCXGPq1u1YJK+OTQizJCeMZiC0GdnoA77cKpUSEj0FgdHJY8raHKtZn4+FlR2A2/43aLBzkGdutiY8ICpu7NEEwI+MWFBNiOkBuyfSBT4CAfsfnC6Di6DQ4IAiifKVnVEZG6RK8EIf50hlimwlCRjRX9UYxPF8xl1Sp+EZ5+TbnGF2q4BrxDFaH0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UnEgmQKolrQM1bbSjPyotfVh+Ex+sH6VJcZcb27OPs=;
 b=Au/ARIheZ/gc/22pUsgpf21au4LFTexKt3USVb6FNkwhB+pmhBMgeH8IqsYppzod/m6mGeoMxNtTK7EZRX6XIwJg2cAW90kIjXNwvxVl6tN21efKe74vKuawM1d4/6gb6KN90Hy+EbmonJ0zuTDo+L1CLWW0hoMwQyLChWGlgUR4hOYqGXXnUV7lWVJn+HGF8kn/fDGbLCzA1L5aYkVz7dkXgx6Z+S+RKSIqLO4H+zG0IXIWXU0wWqWte76Jqo68yIxJxk+r8fcxEGumyw8G3lbOVqxBSK1whViWvMH6lz1kJMM0Up8VEByHx9fSX/yoySX0XrRcYgGRSj0fmpNlIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9UnEgmQKolrQM1bbSjPyotfVh+Ex+sH6VJcZcb27OPs=;
 b=TelbHHu8tl/VorDLbWucoUZjluV0Fh6lxZnBe4eRLKNwNHhAyaASokhzuBM0LEECiEae+EN8ju8CH1DtjoP8ix35DHCx275NNf1/ULIHuS6z7Ue0abbID4vOqH7Jstn9xSjOAOLnjVPIG47x5XdBM5C8UQnTjt5lT6JoETjWoJ0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB12948.jpnprd01.prod.outlook.com (2603:1096:604:33d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 13:57:13 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 13:57:13 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Claudiu.Beznea
	<claudiu.beznea@tuxon.dev>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v3 22/25] arm64: dts: renesas: rzg3s-smarc-som: Add versa3
 clock generator node
Thread-Topic: [PATCH v3 22/25] arm64: dts: renesas: rzg3s-smarc-som: Add
 versa3 clock generator node
Thread-Index: AQHbNdENjbc2bhyfPk2tyShsRv97WLK1PApQ
Date: Wed, 13 Nov 2024 13:57:13 +0000
Message-ID:
 <TY3PR01MB1134612541062EEE2D45E336B865A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
 <20241113133540.2005850-23-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-23-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB12948:EE_
x-ms-office365-filtering-correlation-id: b4f1440e-c371-41f7-996d-08dd03eb1332
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?j/KMim6e1a52PnkUtzQ4SOl05rzWsFdJDjrPkrb4fKO2DTABMV9Eb/dIyum7?=
 =?us-ascii?Q?Yy5dOevX2f+g74jftPRud9AUPH1INustzp8ZZQY/NW8tE97ZoZ131uVXgUR5?=
 =?us-ascii?Q?3XcWrM/qQtaDUeTR46Zc4Ex8JX904knO6M+meuzYBjAE0fpHGTcngUm28Cpj?=
 =?us-ascii?Q?zA0ohIxAy7x5gICPRjUIO2PxcdlI8VrzBz/PxMM2+bn8BKiPcbsmCTNok50T?=
 =?us-ascii?Q?zw3aDLFcJCCPWIvuvDNIdjOIzxywG1saoV9MWNUutsGqFuEGDl9v5X2t/ULR?=
 =?us-ascii?Q?BV6Qr2Z8xyQbpPvQ6ilvOJyvg/2fWyrTXFe3QrSc0lBpNnDj6Om4anaxBd42?=
 =?us-ascii?Q?xgk0yJesx4agK1y3+K6lb/CPXGkXK8xRYbW/IAB9EvY/+P9TLXSEweQmq60j?=
 =?us-ascii?Q?oSM3J9F/kq5Otws+t6TK8yYmJADARJcJIsuV+BZDU3zbomaq+7I+t2FdoxrR?=
 =?us-ascii?Q?hPWpoVjYxn0x5p+Qgi0MPJUM409ODPmoBkKHPMMYfttc94MwQ0X1ZbNXoFf8?=
 =?us-ascii?Q?RGtb5Tb3QzthfyKmUjrqEpE1H33t6pSIuvA6SxIu+tlPebN2l+M9z1JHZS5f?=
 =?us-ascii?Q?AP56kKi6xNIOEDs9r3I85fIlD5Ejx1zlNrb0ocNJKAd16wtJTy9cBm0EbxG0?=
 =?us-ascii?Q?1u/dm7uBp4Al7Hcxkn4XvnyDr0/8waiQ+/BE6m/Shx+hNFl1jJ7Gf2odN5E3?=
 =?us-ascii?Q?D9TAY5FeWTZ/oudjVFJigqtFxmCXkDEXB5HILfW+DmoNiLLQlAR3BH3TD39q?=
 =?us-ascii?Q?ddlxFQq0FlDX2h4aW1JIW1wjP0oicjr2T7CCMDnvxtuF+gw/m97E/hF7m1T6?=
 =?us-ascii?Q?G9fsGTPYfqguP1aeKDEYvXLXdNx11YCSnYrsajphDkj/NEUxRSfF2oC14T7b?=
 =?us-ascii?Q?SJfqCy6M4IFfW4fzQsK7nTMLbHCtVB8/CRk4mCaksQRo6CYl3jn9qP61PjBz?=
 =?us-ascii?Q?77sN/ARAzFRXgt/CgHcHIC/RstuTYEe5xzY2koM5WnAw69/vYagPquRP3Kwd?=
 =?us-ascii?Q?FOnQxNDZbyOHCDq+TDMMKbaonIquw0rLQP7AKl+N+LqG6TL5l2JRw2Xz0qdM?=
 =?us-ascii?Q?btQI1mAGVLbbBfYkDFzBSWMKG10szkqNSpVIP9WNoRT/NXYwrjFjOxt67Rdi?=
 =?us-ascii?Q?uKLiG0cS/vAU4lf7ZCT5BGuIfL7tjWfPcPKO/GmoYmLyHPijaOUM5gd6jKn0?=
 =?us-ascii?Q?0n+IYYpzWqFGxNOxwF8CSlEQbiKgX3Ar19w2OIuEQUgJpOEea7X/B81u5LM9?=
 =?us-ascii?Q?6TKQbmw0yvQtXpHFhZLO54WYbP7sv4OsEudic/MRPt0DjcvUdH3PY0GURzA3?=
 =?us-ascii?Q?dW4GHWBf621NZkYjX0FAy4yaqLxWlwXeVMTPuJliCIMlslRO9FePPkTBji19?=
 =?us-ascii?Q?xEqnThyEEU2WWqe62U8tdMH0y1Ib?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BNYKi4hJvUylPh5mFm26Am/U+FAlkMWUy9ZTLGSJyurDimTSCSTTMwr4nFIK?=
 =?us-ascii?Q?sQnyLebDjS4wwtuRBE8IxHqEunCUbUJEna8/lMJtC0BYibSFeCS5Jv/zx1I7?=
 =?us-ascii?Q?bpeYCTnAaPdwS1Xl5Yx43svBbYecQVFRCaMtQCOLpayBi0ZaXCKhA8TP9e2l?=
 =?us-ascii?Q?eclsz8KS6m0JlHNSaklMWyDvv8g7Eg2vwU9GXX/APjwFqeWs2rMuG+iPNiey?=
 =?us-ascii?Q?okSBEoeRgCHHSLWfI5YskqeAj3BbSJpHq0yAF0cq2p6/Lz8q2O1MGLKo7TnF?=
 =?us-ascii?Q?Am5s0ApAc/UvxuP8qB+kt957qRVwEuCdC6w23vApUR1VPygS0rs5h1Kde9YT?=
 =?us-ascii?Q?6pKhA8R/ePjwnuTSZzmMGTfLBHCMXawdkbyopGhy3uIrhf6NttNgRIEtu8JD?=
 =?us-ascii?Q?TIGhyTvhj2C81A+hQgC6Q2AUKi+xDGGDdQuIZWcs/nwzIfLnDtivqovoW2em?=
 =?us-ascii?Q?OfOdPglnoOY4nyUovfhh5qXMGI89mPfh8Hhp6yNX2ByZiyKmBzfJWP0TautC?=
 =?us-ascii?Q?ult3VX51TEHIT+SNdR5SF/Y8Bak9QlwmWAvgINrDBGfWPbWOYa5Bw8iQ0/u8?=
 =?us-ascii?Q?7yKR/p6dIiAYwF3XxVu/HcR8RYAGHS1H978YG7NRowWddw2NSLPuKXH7g8cc?=
 =?us-ascii?Q?Nt/bAesLtJzfypUKE++jhv73RmUatVp1lHSwaLH/gWmSFedJqNAkxl3jFidx?=
 =?us-ascii?Q?VsQjNJbSbWbGsmfFACdhb6D0md67l51XuIdSKWHbV+xg1X9C4CtkCeZ2lq4g?=
 =?us-ascii?Q?ZC02wv0DtNKWnOZsi7P2chmgqVr8eFZbSbjFsdW1qZPAtDUzfBpmGdfr7E0e?=
 =?us-ascii?Q?SsCSOoHpuKB6SBqp4WQLKmh3dVFJzqH3ZYmb4Xh3BsAr8e3eT2f/hoe4geyc?=
 =?us-ascii?Q?Qm662xkDt1XaHui6yVmH3imUJvjsDnylu5KHnOKbAJ2DnLr7hy4ND2BIqMbz?=
 =?us-ascii?Q?YDpDRG/4v8C4WGqaJXuD4K9hMBqCm3aYsWBupHEkpBth3B58NMK26fiPCLsi?=
 =?us-ascii?Q?Cs1S0raDN/6EP0U2HVtkP2oju/EzWB/eTRyflUvqUHxvvE9Xi23Pu48L6d7/?=
 =?us-ascii?Q?rm+j2O9SVwpf327SD/bTLgE5I5YyZmmqzhvJyajH66IiOm7mEuZvwITU65WR?=
 =?us-ascii?Q?83poTVCQH3XtQP+s6sSv1h0i/3eCkrYReiR1nFFM31ZkKsAZK7tsOmQyR/7D?=
 =?us-ascii?Q?J3uz+Fj5SKhY26j3sgVup5qw38A6y81LKnCWQyK6Gmffq2xK9guJQgyS3bUH?=
 =?us-ascii?Q?hfnBVxT+YCJHF7i+jPxv0QNdS8azwq1KoST73cvY3+og8mzMRTlofvrn4e+j?=
 =?us-ascii?Q?W4YNT7ra5yxvKuHFL/czsRVZGonSt2p2rvtjvFJo6IHVXI3pGzNp4JZcHy5F?=
 =?us-ascii?Q?31qM0i+uiGCgQKYdiLqdA36svbwxUydEUV/Mpl69nh+TW1msRBDsCQaOB84y?=
 =?us-ascii?Q?BmBYiEFa4e4Z4gORcHc5KvRHHFZG33o5yaPWffPJXjQmpx+KUr6txgH66bsa?=
 =?us-ascii?Q?K8liW8bY2mhSuActoKbbkt/Ou4w4+5qYrI2CUvjIZ2JSJeUVThITodKqaLWM?=
 =?us-ascii?Q?bneHsjP5ei5mePECQYlm7f8F+n3HmnIuOSe9qPJO2WoQgpGnqUrrDMPAMXet?=
 =?us-ascii?Q?kw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f1440e-c371-41f7-996d-08dd03eb1332
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2024 13:57:13.0346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6FV1B/Dz9KUxzSUFPQLuYvMpEHdrRmGCSvYhoQZvF3QWgQMbXrfbBxbw668aGILx8g0MQH/zz/UpmsSywbp1U+RHB7LixCzdMICLDBL8MUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12948

Hi Claudiu,

> -----Original Message-----
> From: Claudiu <claudiu.beznea@tuxon.dev>
> Sent: 13 November 2024 13:36
> Subject: [PATCH v3 22/25] arm64: dts: renesas: rzg3s-smarc-som: Add versa=
3 clock generator node
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Add versa3 clock generator node. It provides the clocks for the Ethernet =
PHY, PCIe, audio devices.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>=20
> Changes in v3:
> - none
>=20
> Changes in v2:
> - none
>=20
>  .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm6=
4/boot/dts/renesas/rzg3s-
> smarc-som.dtsi
> index 2ed01d391554..6e58d47d85b0 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> @@ -92,6 +92,12 @@ vcc_sdhi2: regulator2 {
>  		gpios =3D <&pinctrl RZG2L_GPIO(8, 1) GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
>  	};
> +
> +	x3_clk: x3-clock {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <24000000>;
> +	};
>  };
>=20
>  #if SW_CONFIG3 =3D=3D SW_ON
> @@ -152,6 +158,30 @@ &extal_clk {
>=20
>  &i2c1 {
>  	status =3D "okay";
> +
> +	versa3: clock-generator@68 {
> +		compatible =3D "renesas,5l35023";
> +		reg =3D <0x68>;
> +		clocks =3D <&x3_clk>;
> +		#clock-cells =3D <1>;
> +		assigned-clocks =3D <&versa3 0>,
> +				  <&versa3 1>,
> +				  <&versa3 2>,
> +				  <&versa3 3>,
> +				  <&versa3 4>,
> +				  <&versa3 5>;
> +		assigned-clock-rates =3D <24000000>,
> +				       <12288000>,
> +				       <11289600>,
> +				       <25000000>,
> +				       <100000000>,
> +				       <100000000>;
> +		renesas,settings =3D [
> +		  80 00 11 19 4c 42 dc 2f 06 7d 20 1a 5f 1e f2 27
> +		  00 40 00 00 00 00 00 00 06 0c 19 02 3f f0 90 86
> +		  a0 80 30 30 9c
> +		];

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> +	};
>  };
>=20
>  #if SW_CONFIG2 =3D=3D SW_ON
> --
> 2.39.2


