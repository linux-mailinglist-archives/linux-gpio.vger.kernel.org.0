Return-Path: <linux-gpio+bounces-12779-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C94A9C316A
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 09:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B708F1C20B3F
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 08:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76E51531EF;
	Sun, 10 Nov 2024 08:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BYNkX2Xt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010059.outbound.protection.outlook.com [52.101.229.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E262F9DA;
	Sun, 10 Nov 2024 08:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731228872; cv=fail; b=WF70wwkRsa9syGg84d3pT9tDUSmE9v92/t8if+IDpmUAOd+UQ+DgbP7kEW/UppM8RkcZg+CWnb2MCq7DKPXj+yCL0fTs3pbjcwojokbUmUYa/NdVBUiOanI1jb/zv6V1ArYDueMIahqtlwRUGnfIKxz/IoS+TaXgA4PysRNuhIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731228872; c=relaxed/simple;
	bh=F1imnkiizKmIOm28MuXwh6CJHn7hfgyzuD8bFIDQJ20=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AcbjVM0G5nggeTRDIgNUHoDwzvlnFmvCa+x5MRRUfeA0WRz8bcksSkfP+xMQnmMDhHozemGj2v8VWoEisd5xYRhrUZuzyeh5tKLSglEc0psnoraXwS+KuZ1ckFlFKQqXbCol65xOsBUw8kf5M/kQ5YUiIIrjY55KOwNmUSQFq1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BYNkX2Xt; arc=fail smtp.client-ip=52.101.229.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h5y8u8CDXkLDc4KY/iqROuAUbAp87t8EdTMmuPz7Qulb3689dVfajRZA34+mNZVrI41WLfr/NOxhjNMFdo2yw2OS20+FsQcYvzs9hRwTZg+t1dhdaTPGzNzwaW32Ldt4hE1tnxkJgjqXKBp5duWW+FQDAA4c1kjT9/FQA+6WuJqPdTA9bY88Oamwm0t2dCq3NcjWO6ACxZo3IDWUl3MwBFtH2zNSRgXGrllU0HtLb5lhbO9doNb4x5c2U8JB/gO8nUyjKspjS4waOrzvg7xUUpCjSxrRB8A1LEQrGKOR7/sJg47Wj6mSu1+KPl8IAoOmfG/mgpM5aGVmmzYNiNxoEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhLgmZoHhH+CZMyq2xeYqkOa427n8qOiIkdS1UtOfdg=;
 b=lzL35K0FiapyhuG4CB0cAkBjjnb0Ki1Cp9WPl2PnieJCQ0/p0sLlh/PCTwOnlM8coFN1zFQBHnut0+/MVOgODoB7MRMiL8ipKNgP+jyfsk1a2uRCgzoWmKe/8KyWvKBXK2wsfbjD3ytWYd3EmjoyD568z+dPUjemKFtv6SPFQnDXfMYLSBQ+xCyhfWQ7qwPrz23YGagKImwm6N62eYFssiZUNDl08yR8znkWNRQ/nC4Ek3+4NJgDLUiFfaahvzekERi9x8c2HxZNOXjgTX2Vyj7Q+OHj8T2aR28jjjp3nJo/TWTWnbXcytquZ7cNWqUzS7DvGLUQ8WGugNbuSO9ofQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhLgmZoHhH+CZMyq2xeYqkOa427n8qOiIkdS1UtOfdg=;
 b=BYNkX2XtquUTIyJBfYnDr+vrQx/89VmmjBDOWCb9lWZBmK2gGAbgBNIOgmfuhz518Rq9NFpdSWtCpck80Bany9SILBuh/2VwzN+OjxgKzIjsMvuakslAbHdzrB9GDZ/Ks2txNkwuGWJg8FsB58gqfC0xd3b1elOm3fERcULG/VY=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TY7PR01MB13707.jpnprd01.prod.outlook.com (2603:1096:405:1ec::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Sun, 10 Nov
 2024 08:54:23 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%4]) with mapi id 15.20.8137.019; Sun, 10 Nov 2024
 08:54:23 +0000
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
Subject: RE: [PATCH v2 24/25] arm64: dts: renesas: rzg3s-smarc: Enable SSI3
Thread-Topic: [PATCH v2 24/25] arm64: dts: renesas: rzg3s-smarc: Enable SSI3
Thread-Index: AQHbMcwk+s13zfsAPEGSqJT9ouqgjLKwN5Yw
Date: Sun, 10 Nov 2024 08:54:23 +0000
Message-ID:
 <TYCPR01MB113329FE5E9E610BEF45DC001865F2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
 <20241108104958.2931943-25-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241108104958.2931943-25-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TY7PR01MB13707:EE_
x-ms-office365-filtering-correlation-id: 888c39fd-179a-4280-73cb-08dd01654640
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?EHUfb/xjyAPk+4AqxI+jkPpHvNHC86jkDWZAviFeKQFAB5Ir704xcDrN9jmv?=
 =?us-ascii?Q?JojH1HJ43tLzcexhSeaXe/Wfi1K2g18F5c5HAbJWFIclQQFxZ1rICrhC0PPx?=
 =?us-ascii?Q?nJ0N9KU6TO/0Dak4GZjF0hNfuBrOY7gbJg2Su25mXgFkzOtsGIq8zugszTSP?=
 =?us-ascii?Q?eASwgJwP0PfEmtGfrNuctl3UdueXzxkOFKTuyRJGEdzXgruDOqPuNs9HjyiV?=
 =?us-ascii?Q?SpG/l/KY1+lbB5gmoRmdgvgUMQpGqVFV62HhCEAVMNU72sLRT3jjcITJq44o?=
 =?us-ascii?Q?inI5+43a5tQP0rzpFJo59xRD1CV2zh7vmGsMVyXohHSy8irOG1GYg5ltvNlx?=
 =?us-ascii?Q?6SAAatiWKOknAGuiHLGDBhnS1mSCw3YopbswCHUT6kwmPemJ6CCZjctWaSGn?=
 =?us-ascii?Q?kvv6XAWm6hw8LZPXujvtjChd0INqf7Yy6K4f5XPEotasDYVd3GdPDzdSlLxF?=
 =?us-ascii?Q?BFNV+LLljzt59UNi8yaTBjSZ9QTS4jZwVsIb1+mQZQLoh4Gy7NwXlvhMltBu?=
 =?us-ascii?Q?SkTjo5jGFYwt6eos4c5WiGQQx4jyN/jVFZV1MTUztgHoVQh3UWrS+khMZRnm?=
 =?us-ascii?Q?nc3hMFajhUBIXoEgS1YeXwiCVbeg2RLewJYsso64KzxQvXYAOdrS/gHOPkEd?=
 =?us-ascii?Q?0jDa+7/PzcN6YIFZcjtHOykdWLwLsQ40AjWWf2uLbbUltVpIaZfPrri8MPcQ?=
 =?us-ascii?Q?t0b/0PdVbj7eQoRPBn5pUenfO1OyGkSfcj+fOX70X1ZDCJyPUrxlgDXsFAe3?=
 =?us-ascii?Q?OzDpd28Sc41UNhTPE7iKMFH+DcBX6/lqgZoL79b4OUc/jUz5/QwTyi2essVx?=
 =?us-ascii?Q?BkHCtzToUdhSmCtO1GqCbCi3fS2I/KOL3UPFWFBng6yczrpJ0BXS/0+KGfIH?=
 =?us-ascii?Q?27c1mmz1bnKoad/l3hmgSQC8FM3AWIVdG/07qPGLz0Pv7ci/1xA+mLB5UL2j?=
 =?us-ascii?Q?4Z/pt0mdX+ixDEglqvI37kG3rsCNclX+DcBsZREiSXhE0x8yQElEXbG4KktI?=
 =?us-ascii?Q?n8C96HCs3WiPQBUFTTPLofkFXWsWn+zdx/LtixCr1mvqyWBC/PIIj72E9h72?=
 =?us-ascii?Q?ztW1kXU5/HhNmzuFgREASGw0hV9bzKUIT2AlDOM771pJlxdaPakboynwtM2T?=
 =?us-ascii?Q?hGXcrjRIJZf5XJl37vfzM6HfZJug9TWJPhx3L6XqvYxZRwYHd73RJB3lTOey?=
 =?us-ascii?Q?AmU4QtvPt+hd6Pz9UPr573r3FpTSUd00ZY+eTc6GXdCMmTgGRqXpZ7YOMFs9?=
 =?us-ascii?Q?42ZFSPY9+Koic1aSos2t8qX/WUWbmLvqaS1T3el9Y5Ckplvywxog8OhkvsKH?=
 =?us-ascii?Q?UR39v3dDE0tTpeQ+AIXVFKqK2F501FQPrMTt9Ru86yJ2r/XGQHQ4XIGlnM6F?=
 =?us-ascii?Q?og9Dod6QRHXDla7IlhgHhLtao4oW?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ug5rbCflnYcD0nPrWQAdhHZ9cH+U62ZRMZItzaZhZZTj3CPds3HXFu1g1+oY?=
 =?us-ascii?Q?0OZ1RKloY02CJXHETIlWpPUB/pGq0xQqgaRNLdB8XhphjWjC55omvn89Mz/I?=
 =?us-ascii?Q?ghRWvG31f7PLSi+z9sxkP3t0SeNMoUCUqw9Ye3Z5ja6XQpU/wgAWcu4nEGLW?=
 =?us-ascii?Q?sLuv6h+3uwdrN/LyIeic9WkWVP5jhF5IgQq7VaROHC0iSWNAW4qNvHKIkrZd?=
 =?us-ascii?Q?Z1HOG0tWaN4qQbdrZvzfoW9sKsCJpuHGrr7fcEj/hFO+LYS/KyOHZEAHlR5f?=
 =?us-ascii?Q?mphBkj4meeLbCdamIAR3RD+RHez8YG5zD/5P8b16/6ec51bLtm9PL1cgWOGL?=
 =?us-ascii?Q?uZycTccyWh1Ki2naKvEoMtPZGJl+Je7upG61GILvG09eK2VJSet6qoAggqZ+?=
 =?us-ascii?Q?seIUF58ul6hsn4F0/UQ95OldQpQ2v5JIzvBUxUQdSg8mExhNv4tanpOK1wtT?=
 =?us-ascii?Q?bVgxGENI+Fzr8IXvZbhZfadt3plL7koFjgEJbY16qorkA/tlXeNNs5fRSqJr?=
 =?us-ascii?Q?GzHUvvJiyOdmZ3VbO+99iiENehBktMNCtB8ZmCcibBwlDhIYesrrAFOPbdA6?=
 =?us-ascii?Q?qwLR2r/00xtddCe0FQvrzgqS1HDjVIXxpEsdQCMpSuxeW5sMDFUuBrBbpRI0?=
 =?us-ascii?Q?86oF7kSpbZyu2lc+1Yzcr1AIKDKoDL/C5uLRIaXNihbQQZB/49skqsgfgtJO?=
 =?us-ascii?Q?jblinesBpF67e3r4BrZS5eFSlmjGrMEOAoLrLfZXgtOWoQhKG17vpmYXuoqI?=
 =?us-ascii?Q?J2S3wJifQu5wNmq6j1AQYucvDKPet6V5YGeQ5hv9Rmdh/VRB8rKhEAVoZ+oN?=
 =?us-ascii?Q?GGzb7CfHiCwvoZavdPXzGBzSIWFoTnISjhlDKhgALDeBv/373tp7XFA/5Ghn?=
 =?us-ascii?Q?HA+qydl5lFdR5nh+UpZEBtZhkBQWNGBannI3fN9HbPfma8fWCSEzlBF9D/fJ?=
 =?us-ascii?Q?chVxUBPzGTjnPWE0ISw9m0aSwI0r6k1KigqZuD/OlACKzFuYtigGR/4w0Hg2?=
 =?us-ascii?Q?bUdiEwQ8crtO5c2v5NMK6vIWhox5C/cal1FCG2OU372ojv8K3oa1fEaFTtPs?=
 =?us-ascii?Q?1JXhszXdPtqHE4G9hJUWZuIGgSEQj6FQUzvbDPZYH5pUf6xnYj+CGyberHt5?=
 =?us-ascii?Q?UYL57M83SMi/YRZnfLyrP744kmrBhaEmrEybYuDCsXuxnltwRegxFBybA9t+?=
 =?us-ascii?Q?BZ3+aPI28hCFEX5PTfevCGgSODwqPsL+qPjVVqxQAczgR8LOgnGYA350CeH7?=
 =?us-ascii?Q?EJMYqhx1lmap65qPIWijqnxYqB1NHeYL/ZW6b9MnR5BkX5fqAEB0tWlfOejF?=
 =?us-ascii?Q?oTQE2WIfKsoK01D7mQmlIWWSqk9ySpzswMDThcyZn6HR+urH1h6HgMuIL1bY?=
 =?us-ascii?Q?dXeYPQxmjBeq2LdBC8IVbvxHwb7sFAAGkXughpP+l2r69zFnKIDpcNRkTdUQ?=
 =?us-ascii?Q?96gCpP/EtNsn7InAbhtlNH1BoJqt6CANe2XxoEPcQ7p1VE7MFL8SrsqV26aq?=
 =?us-ascii?Q?KRbMv1mARPbVKLaoYd2N6YaMemtsygE8JmCJVBDlKD/ICyzF247lIZkHr7qL?=
 =?us-ascii?Q?VCmoe+q4tMc9EgIePnmRpRb07NxtJCUcTmu/o/p6?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 888c39fd-179a-4280-73cb-08dd01654640
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2024 08:54:23.8013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BKA1KgfwbQPFJgiGHISJ3yzXOoCinwhYfOofZY9bYsc79pmpzXOz+SFWoqly7vtyV35Wnka9lTMsDzVypOMLnugNmSnhpV+4coeGTQigCow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13707

Hi Claudiu,

Thanks for the patch.


> -----Original Message-----
> From: Claudiu <claudiu.beznea@tuxon.dev>
> Sent: 08 November 2024 10:50
> Subject: [PATCH v2 24/25] arm64: dts: renesas: rzg3s-smarc: Enable SSI3
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Enable SSI3.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>=20
> Changes in v2:
> - none
>=20
>  arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 26 ++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/bo=
ot/dts/renesas/rzg3s-
> smarc.dtsi
> index 4aa99814b808..6dd439e68bd4 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
> @@ -64,6 +64,11 @@ vccq_sdhi1: regulator-vccq-sdhi1 {
>  	};
>  };
>=20

&audio_clk1 {
       assigned-clocks =3D <&versa3 xx>;
       clock-frequency =3D <11289600>;
};

Maybe add audio_clk1, so that it described properly in clock tree??

Cheers,
Biju

> +&audio_clk2 {
> +	clock-frequency =3D <12288000>;
> +	status =3D "okay";
> +};
> +
>  &i2c0 {
>  	status =3D "okay";
>=20
> @@ -94,6 +99,11 @@ da7212: codec@1a {
>  };
>=20
>  &pinctrl {
> +	audio_clock_pins: audio-clock {
> +		pins =3D "AUDIO_CLK1", "AUDIO_CLK2";
> +		input-enable;
> +	};
> +
>  	key-1-gpio-hog {
>  		gpio-hog;
>  		gpios =3D <RZG2L_GPIO(18, 0) GPIO_ACTIVE_LOW>; @@ -151,6 +161,13 @@ cd=
 {
>  			pinmux =3D <RZG2L_PORT_PINMUX(0, 2, 1)>; /* SD1_CD */
>  		};
>  	};
> +
> +	ssi3_pins: ssi3 {
> +		pinmux =3D <RZG2L_PORT_PINMUX(18, 2, 8)>, /* BCK */
> +			 <RZG2L_PORT_PINMUX(18, 3, 8)>, /* RCK */
> +			 <RZG2L_PORT_PINMUX(18, 4, 8)>, /* TXD */
> +			 <RZG2L_PORT_PINMUX(18, 5, 8)>; /* RXD */
> +	};
>  };
>=20
>  &scif0 {
> @@ -171,3 +188,12 @@ &sdhi1 {
>  	max-frequency =3D <125000000>;
>  	status =3D "okay";
>  };
> +
> +&ssi3 {
> +	clocks =3D <&cpg CPG_MOD R9A08G045_SSI3_PCLK2>,
> +		 <&cpg CPG_MOD R9A08G045_SSI3_PCLK_SFR>,
> +		 <&versa3 2>, <&audio_clk2>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&ssi3_pins>, <&audio_clock_pins>;
> +	status =3D "okay";
> +};
> --
> 2.39.2


