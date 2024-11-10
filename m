Return-Path: <linux-gpio+bounces-12774-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B279C3146
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 09:31:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63D061C20990
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 08:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8539614EC5B;
	Sun, 10 Nov 2024 08:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="sM6pYka1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010001.outbound.protection.outlook.com [52.101.229.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151F514B06A;
	Sun, 10 Nov 2024 08:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731227509; cv=fail; b=q0qzFBQd2+KDr+FPjmBO12oIbBGcnztBVDmvJMJJfe5DCzbgO3FDP7DWraDJPV+Voj2vOFsCsrHDEhW760uTFrFe/lcrLxUyOzP763a9TJ1dP8MEZisMMsFNGhGzwt6gR/xMg+MkKifJmtKVBli9aJf9O5LS/yOB1jjnAaBS3Dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731227509; c=relaxed/simple;
	bh=4p+Ark1HPcXKrhMoYHx5WfjowAY5f2IbQoZxWhIdtQk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Gm3F/s58M7xmkwergP7eHmlRH2qnMjgdA93hMnYeM4dtmorvdPg7WGQ4uyXNIZB1FTqB8j93gyEV+qEfEw9bHnkuNhe3CeInYExnRC3GVCcrgaK5H0BeEZhqyhzBq16qZpQPhf1Sd7FH9SW+C9cCzEiWab9m1y5Dzgbh6tifyOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=sM6pYka1; arc=fail smtp.client-ip=52.101.229.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjYwnCuQpQd+cgMjq3gPHbek2y9nWYHpuQOIiFJjyctyc66PTjky7iEPdsYzusIfIjCt29Dhy09K1iS2gpJvlNc205z3MLx3TyAqXtxmplt5V+M5AEe9cTI8qXhEKdfw6Tjc7Q4gACfQaJG0L06heSu0UUxNoDbE6P1uSM6OXkniWQzG8Dnxs79pyJ0tPbN+5gKo2sjfMQRTRl7RnrzRKUX6aHjHubJLJaPR8R3/4cuDBAEsoLwhp8YMTsofXT/J4+UPziVdUH2ar1CR4O9pH1XnzMhzZCf6r0/lEOrbPEh7vlVQdsH5natkJ1YpxTQPal9Iy+XETEeCPN6nHHoTFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pYnaFcFfW8r5yznMZ+DuYyCOb44+Wlha1G1XEqiylg=;
 b=pVgn/i0Hzby1SOsHPkJazvZRCpUDE8gbdNz5Q69lwfS/fEZ18uCML0iLepRDDGxzz4NlzuXIG/aLUc1KMxvXvNJRXQfI22am9JmO3j9cOsjXvftp/rt1s70NHfz5FZa72qOvJMvIdOcK2SY7VSY2AGEMa+h8rt+efEyrVLxiPBz7xyniT5z+BksiOPohKMcQ4QVrHTgSx2dOxkeLtX/efMT4GryhetqGnepxpOOIoT7ngTeUDn9bDiGi1o2z9jH4D3tyxap2u63kcLFDCKsUMolDd8ae3AaZ2daXBjT0Fl9OmLxfMvjZFnFgAFj7lxLmOPESRYAqiie92AmeYqlitQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pYnaFcFfW8r5yznMZ+DuYyCOb44+Wlha1G1XEqiylg=;
 b=sM6pYka1wNqgyjHtFOZhDGZjGzdXw+eN3UISoGn1dpinoHbPfvbuupsRXu8THmu4KUZ0qr/cItc2tNr1ezCskcXcFLgaOHb9oz22Cx4OjeOtsxB3xSPLy36iYoOkqSIBDhnbXPkbZIcPhsdIiGxTf+Wjut5ZB4Nk57oux24+Ciw=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYWPR01MB8807.jpnprd01.prod.outlook.com (2603:1096:400:16c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Sun, 10 Nov
 2024 08:31:43 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%4]) with mapi id 15.20.8137.019; Sun, 10 Nov 2024
 08:31:43 +0000
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
Subject: RE: [PATCH v2 01/25] clk: renesas: r9a08g045-cpg: Add clocks, resets
 and power domains support for SSI
Thread-Topic: [PATCH v2 01/25] clk: renesas: r9a08g045-cpg: Add clocks, resets
 and power domains support for SSI
Thread-Index: AQHbMcv/QLBJFz2pvEW928/aH9HT6bKwMjAw
Date: Sun, 10 Nov 2024 08:31:43 +0000
Message-ID:
 <TYCPR01MB11332190D259907C1B3CBF61C865F2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
 <20241108104958.2931943-2-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241108104958.2931943-2-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYWPR01MB8807:EE_
x-ms-office365-filtering-correlation-id: 5a1804eb-af88-4981-d076-08dd01621b59
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?0a5oKnGjf+JdkWyVDNZAMNBdsMSKYW9FJk/iqYd8uCGyxKfLZNFYZ+w45yEV?=
 =?us-ascii?Q?zk7OZ7tIsn7JR5OI/AtTyJ/dPIfRJZ8JRfn0frsyJypo5gtZKDrKSh+i4gpP?=
 =?us-ascii?Q?FAh9JHUx9ZD8/Lu5itvICC/HZ1HVvFXuIHKTu/60GfJe5y/OpFpLUJ8PV+tJ?=
 =?us-ascii?Q?o5vodO9UqiEcfFgcCm4jzw5k1+ODkDuHyB4kJopqcn9IOkqAU1fA3zYkc9i7?=
 =?us-ascii?Q?/2zWtdWPHDX7/AxnCteDon2fvAp4dtl2JW+rCDfm00gzoO/0BBpetROa2BTC?=
 =?us-ascii?Q?mn1Jpqr7flQK6XiBTJxO/sdTE7W7e3iR/loulKAUSYduo3Wz9IsmD963hEvf?=
 =?us-ascii?Q?38qbeFNnnw5H8viHhITpZlFQOYIfCL82kWc8kRjLYfObLB/Sb6dd9ev3zdiI?=
 =?us-ascii?Q?Y/+A03sYTQe/+uT12EW9nRvJKu947hob0jWtf6OSjVC16MmARiy3XXp+bsaB?=
 =?us-ascii?Q?6CLt7APVoFpEEIMvhe9/k1PxJ/CdcvIuBgDrC2anJo6Kvnf35zf2oXCx0RxK?=
 =?us-ascii?Q?B1uk7Ueo2PkYc+felDYnvXqclyuMnClOob5owemxZZXcv8fMEv6AJp80W1SP?=
 =?us-ascii?Q?zdNJ6SrCnXeD9wXQIe4r+2pXghqiCvqXmV13sIQCP2yPzZzf2WlJGKr4O9s2?=
 =?us-ascii?Q?o5RpWwyaJFuN3xajFRyzKlXM/QXCpR1HdmQjhPc+T6oYGmCmSk1JjJO9ACcV?=
 =?us-ascii?Q?UD3bM+E0zMl0OQhuk/SAzvfyZ8tAxRNjvyuz1nC8VE3+vVycusAPHVLYK571?=
 =?us-ascii?Q?IABxEb/nKB/kUYH1JkWLIT+RsvJzMzhZyGfWC5GtMahYjuo0SEItjnr0kVxc?=
 =?us-ascii?Q?NNXS8TuM3MbuzHp2ueUSKtgiCc1kwpcMiKJlkybO5sCha+XjmNVbLq9DVeMu?=
 =?us-ascii?Q?9+XGr4OuTkT3xVwPSZxK9fT1GRWuWfL3pHNLJRM1WYLVsmaS+5MIUM+H9Zna?=
 =?us-ascii?Q?sf28aUehIKCcbpgtBS01n3iuKRpuSVzytR/GdCzHorkxEt3H8J1/dVM19hd8?=
 =?us-ascii?Q?g4/u9KRjE5J73kfJ8S70MYkwKznNX4WhMr5YjNTmxLFgp6LVCYGgZ9jCHHFz?=
 =?us-ascii?Q?IoFzwuJglPFfsZTm4sSDJXFovGTkPfbCP5nHIhOV2hxGAsVVBmEY7ORr+i92?=
 =?us-ascii?Q?OgoW0i4n8lBaJULZCLFV65NYua+rtIoUh5XMxnNMwok9uGM0qg+uo9fKl4Sr?=
 =?us-ascii?Q?6Iau041VZLQQfCkPy5Jcq9U2RrKI3BOjqgDWwG54ELy4ddFR8uQ5HwFMTC6H?=
 =?us-ascii?Q?YhceUoQTrd7XLcMC9VmDeabf92YpLeEJbAV/rs6+BJq3vI4kyjbA177Z7gHT?=
 =?us-ascii?Q?eb6lSsL9sTwDXYZG85d8uinhR+9JKTvCmFkKd1JPQnOJSAnkrjDej7Y/ReR+?=
 =?us-ascii?Q?r76ykK83IWZD+plnYTiRy/FgWjhD?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pfD/VqRR30jH+NOZSjsjcvWb1ajIZFhtkcWUUR3mmVfwgVFgLTfZnGM5gw0+?=
 =?us-ascii?Q?VN2i25TTzLDss31TaHdVoVxf3pvLLeC92geyQLbna1XHH9CZCjuvP+wwEhpC?=
 =?us-ascii?Q?aFHcT42M/DjhGIx0tH34fXTZInektnxolN8fdfPAkoAcWhXL06azLI5e1n+B?=
 =?us-ascii?Q?j0t1HAEhyj2toS8qVZdR044j9pplTQfdGPp1D1ZdDvFTPIJv1iK3l9CyRvcm?=
 =?us-ascii?Q?s7knbLNMtwOoNr93ABZe4rlf7AGVyjZynbd8x/lhVt/rbwqGTCHkvngNH0bz?=
 =?us-ascii?Q?nPTXuQEjDICS6Gh08m//bgjOo9SXejWDY/F1Vhf+xKb1m1mdqZFl5FLZQcuS?=
 =?us-ascii?Q?dAPTJt1SweKTbXiCdvMmYNZjBdnumis8G7vwXQaxIzkNXu4qDEp4uJtuVrhd?=
 =?us-ascii?Q?igIyrRq9Om+5RWA7d2Dsff3HdjWWSp8F9OLNm8cWEsmKs1aPLaFP/+VytRSz?=
 =?us-ascii?Q?VXa2HrtOFAbp+kuQt9XTDzqLKaAGqtCuk1fIxaOufIx05pCotLxcf9J/WXXl?=
 =?us-ascii?Q?g6ao97VbsDn6vqDJFPUpdWEtzhR6bpMFwxw+6LQUYfapU5+RK1prcKqd/Wq1?=
 =?us-ascii?Q?XDmkvyj39YPTT45wKMO/DTDEHbtLbvpHWEI53bxtc6xE4FCqdbHDINSIArs1?=
 =?us-ascii?Q?deZENgycaqFq3HCU/v2oUCQKzrnXSIwKBWZT9yi9dyKPwESWN7GkQwpjx2aF?=
 =?us-ascii?Q?am8LAG2EqAL4Rxxehoa+urn6PxOoj3c14nTzOEcePoo1jDzzaShju4Rlikk0?=
 =?us-ascii?Q?5U0RIxhtQIoexI04agmw9PooOWfOJS6uMjSdYm81zne05lXw0ZuaegZzQFVR?=
 =?us-ascii?Q?jkZSS7oCSJAO9pf7CYxXekNtyF47Vs7OIQryk4hZ13i+sTMNwv09917AVlyq?=
 =?us-ascii?Q?Zvv4Zvd/k3EH6oBdeJuH5e+6r7dSauB2cRMmYYvmEBlLJCYKXDd+gmVIab3Q?=
 =?us-ascii?Q?A/6yfOJSAsouMOiYnKA0ci0f41TtOD7lMFWUx22GvJk8Ia4R4qe9CGuS7V+b?=
 =?us-ascii?Q?c4SUKsI7vwIEfT5/oQ0Qbts4pMJWxd6qoY1QoSJpKbhg2kJk7UBU1dBqfZ/a?=
 =?us-ascii?Q?rMEVcTO2K7VpFJBEqVzndnNn/YfF3H4h/ehSp5zLstlZbGYRiIFmjT2LyryU?=
 =?us-ascii?Q?5S8HIvSg1/c+j3AurCR9J478BMR44tM0nB8sfKEqU0GkBNWewKfkXBaHwFN6?=
 =?us-ascii?Q?Uwr5JomKRXen5q2Zj68WFy5xjdgEC35KpNQgNuxMRtxLVhxH2t/NUqKtZyjF?=
 =?us-ascii?Q?nhJvEstKyka3vJRETJdgN4aVFxp1UAXS/4epobg+SYIIkCZJU2cCI+8f477J?=
 =?us-ascii?Q?ad48E18p2tZq1cLdbVXKaaClvKtoIfI+OyofFkEdqJB7AKDjKZ8H7lApLC9Z?=
 =?us-ascii?Q?lYbhG8K7K/r6FaaY/tMHe1u4HSOQGY2zH40ZFrGIw+XKANkf6NZT0y2wy99i?=
 =?us-ascii?Q?ZTjDT04D1P75CTvYbt+UyU9xG1Y42ToK9TvfxahpyuBt6G7PgiMCg5UG69NR?=
 =?us-ascii?Q?H/WE/6h4fHkROdsUT39FCrF7b7jCwJZ+b1aSKyIsuQXCWMj1s8J1DrbUEVjX?=
 =?us-ascii?Q?DBMLomG0Tb1jExgpoXTe1saDNR1sY6HC/EJumVJ802mBcLsW7b1gqHrbaBzA?=
 =?us-ascii?Q?Hg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a1804eb-af88-4981-d076-08dd01621b59
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2024 08:31:43.3368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9pu0zqM4bt+ggFafa5pvxlDY8JpnZOOYGAKDFAaChSWCfApx4QH/D8/y8qzd/k39D4MUwDrVhY2rV8L957SSio43ADr+8w7RYB1gf8/1Z9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8807

Hi Claudiu,

Thanks for the patch,

> -----Original Message-----
> From: Claudiu <claudiu.beznea@tuxon.dev>
> Sent: 08 November 2024 10:50
> Subject: [PATCH v2 01/25] clk: renesas: r9a08g045-cpg: Add clocks, resets=
 and power domains support
> for SSI
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Add SSI clocks, resets and power domains support for the SSI blocks avail=
able on the Renesas RZ/G3S
> SoC.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju
> ---
>=20
> Changes in v2:
> - none
>=20
>  drivers/clk/renesas/r9a08g045-cpg.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9=
a08g045-cpg.c
> index b2ae8cdc4723..d71e77624fac 100644
> --- a/drivers/clk/renesas/r9a08g045-cpg.c
> +++ b/drivers/clk/renesas/r9a08g045-cpg.c
> @@ -209,6 +209,14 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks=
[] =3D {
>  	DEF_MOD("sdhi2_imclk2",		R9A08G045_SDHI2_IMCLK2, CLK_SD2_DIV4, 0x554, 9=
),
>  	DEF_MOD("sdhi2_clk_hs",		R9A08G045_SDHI2_CLK_HS, R9A08G045_CLK_SD2, 0x5=
54, 10),
>  	DEF_MOD("sdhi2_aclk",		R9A08G045_SDHI2_ACLK, R9A08G045_CLK_P1, 0x554, 1=
1),
> +	DEF_MOD("ssi0_pclk",		R9A08G045_SSI0_PCLK2, R9A08G045_CLK_P0, 0x570, 0)=
,
> +	DEF_MOD("ssi0_sfr",		R9A08G045_SSI0_PCLK_SFR, R9A08G045_CLK_P0, 0x570, =
1),
> +	DEF_MOD("ssi1_pclk",		R9A08G045_SSI1_PCLK2, R9A08G045_CLK_P0, 0x570, 2)=
,
> +	DEF_MOD("ssi1_sfr",		R9A08G045_SSI1_PCLK_SFR, R9A08G045_CLK_P0, 0x570, =
3),
> +	DEF_MOD("ssi2_pclk",		R9A08G045_SSI2_PCLK2, R9A08G045_CLK_P0, 0x570, 4)=
,
> +	DEF_MOD("ssi2_sfr",		R9A08G045_SSI2_PCLK_SFR, R9A08G045_CLK_P0, 0x570, =
5),
> +	DEF_MOD("ssi3_pclk",		R9A08G045_SSI3_PCLK2, R9A08G045_CLK_P0, 0x570, 6)=
,
> +	DEF_MOD("ssi3_sfr",		R9A08G045_SSI3_PCLK_SFR, R9A08G045_CLK_P0, 0x570, =
7),
>  	DEF_MOD("usb0_host",		R9A08G045_USB_U2H0_HCLK, R9A08G045_CLK_P1, 0x578,=
 0),
>  	DEF_MOD("usb1_host",		R9A08G045_USB_U2H1_HCLK, R9A08G045_CLK_P1, 0x578,=
 1),
>  	DEF_MOD("usb0_func",		R9A08G045_USB_U2P_EXR_CPUCLK, R9A08G045_CLK_P1, 0=
x578, 2),
> @@ -238,6 +246,10 @@ static const struct rzg2l_reset r9a08g045_resets[] =
=3D {
>  	DEF_RST(R9A08G045_SDHI0_IXRST, 0x854, 0),
>  	DEF_RST(R9A08G045_SDHI1_IXRST, 0x854, 1),
>  	DEF_RST(R9A08G045_SDHI2_IXRST, 0x854, 2),
> +	DEF_RST(R9A08G045_SSI0_RST_M2_REG, 0x870, 0),
> +	DEF_RST(R9A08G045_SSI1_RST_M2_REG, 0x870, 1),
> +	DEF_RST(R9A08G045_SSI2_RST_M2_REG, 0x870, 2),
> +	DEF_RST(R9A08G045_SSI3_RST_M2_REG, 0x870, 3),
>  	DEF_RST(R9A08G045_USB_U2H0_HRESETN, 0x878, 0),
>  	DEF_RST(R9A08G045_USB_U2H1_HRESETN, 0x878, 1),
>  	DEF_RST(R9A08G045_USB_U2P_EXL_SYSRST, 0x878, 2), @@ -286,6 +298,14 @@ s=
tatic const struct
> rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] =3D {
>  				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(1)), 0),
>  	DEF_PD("sdhi2",		R9A08G045_PD_SDHI2,
>  				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(11)), 0),
> +	DEF_PD("ssi0",		R9A08G045_PD_SSI0,
> +				DEF_REG_CONF(CPG_BUS_MCPU1_MSTOP, BIT(10)), 0),
> +	DEF_PD("ssi1",		R9A08G045_PD_SSI1,
> +				DEF_REG_CONF(CPG_BUS_MCPU1_MSTOP, BIT(11)), 0),
> +	DEF_PD("ssi2",		R9A08G045_PD_SSI2,
> +				DEF_REG_CONF(CPG_BUS_MCPU1_MSTOP, BIT(12)), 0),
> +	DEF_PD("ssi3",		R9A08G045_PD_SSI3,
> +				DEF_REG_CONF(CPG_BUS_MCPU1_MSTOP, BIT(13)), 0),
>  	DEF_PD("usb0",		R9A08G045_PD_USB0,
>  				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, GENMASK(6, 5)), 0),
>  	DEF_PD("usb1",		R9A08G045_PD_USB1,
> --
> 2.39.2


