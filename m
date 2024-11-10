Return-Path: <linux-gpio+bounces-12778-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDB39C315E
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 09:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 197651F21596
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 08:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E96D1531C5;
	Sun, 10 Nov 2024 08:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UuwtSC7n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011028.outbound.protection.outlook.com [52.101.125.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C597D14E2CF;
	Sun, 10 Nov 2024 08:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731227871; cv=fail; b=qpzRHgcAD3smcqZ7lBJpHAp4jzwga+a81VkelLOaoAzaNWPK0vbtc+dWURU5j0NPgsq5F2O5aDCZO4DDpPq3zyLoXPPyGcSWa08fAZa1wMGS+9EiT9WX4a6a+yGhLkd3tEa4gXasnSQH9SpVOjPMP3OJjBuu7CqtuDvqroxjQMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731227871; c=relaxed/simple;
	bh=9NrJcKwrMTP+v9cmA4mT8hLAeilYw1gdevLplBsXbHc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ig8X7ViTr1UoS8OqEG/uGur3icNLVfjRYON3h7H3Tm82BeIY8Ed+zFfTa22jOtX0OECZKoVWl1SfCal7xUZ/ufvbyx6O1I+hr7fexRUJ+D1PJwrpWgK//AFCbXTJJO2jPPmz+7nLmkJKSz2LbBCgwZNKSv354VF/97h1RNqJsHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UuwtSC7n; arc=fail smtp.client-ip=52.101.125.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qF7JfkGejmnctUfgSu/aiNsG7h7+lpdlP3OoIHeRR3XFOD1zM6Sr7bNB80EgBaWjy0Pg6Ef9zWi8qY0BlhXycPnQ2mN9fO4/W8I8Wc0VbvXAPJOK5BFncfzLgBlp33JIAdbUE++efsXAK8N+L0uAuBp/WxiwNQxYZiuTAtYiUzB07va1LrvLW9bGb19sPSMo321d+kc7y6/ErsCU/9XVstbwNBp50FnjERtLiojrOk2Zcka05VFTPZnMEdGxfG1OxbJp6eXiYSp19tDeNoIYlLpPcdjnsS4O7CIw49lM04rf7C0Od2RIfVTvuALjEwCJWrudR9s7ywMYqVVi4c9jZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pxxv+sxUzwGDQIRZPotyPN8+knTLFaXsRecBgdWu6gk=;
 b=PWzhsHT09qoMahNzLW9Iqd6WLH6m7SyYS1lrBunAa+vBjHPalUOG47cXpMQPFvbtqmT+EftNzwmFyP0RtgInrlmm88TgAIvmTOK0f1rcIR3lu5cPugKED+nAiqTJazN9A/fUZGd/twFUtfigINnp3csGznjvUZBZDPDthEcRsb5qbHbU3pGK4gLebpZqDH7QA2Z+csq7BNY9nLUvZ5OkqFsDdYwUzjRbHFl6AGa2yaLtE5PbBYP2+8yCss3U8zcxURc6INnDHPxd9NaA9Opz460cfS0/WeQO1aXVaZmRBkOTZFQ10vHndfhvpCOyUl2czB62DRK2/ZRzTfHviSzeRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pxxv+sxUzwGDQIRZPotyPN8+knTLFaXsRecBgdWu6gk=;
 b=UuwtSC7nIefQxZvYt5/Cdjo6xZxxK5xnKapx1xBhhrnXFKf/qiQo6EhUvFTfLkQt/fhspX8fXW3LKTIhxJhncEAFHoYp4pkFG1boWEkLjcm9TwpzQ9rwcuWT6Va7XNKQ/fChfb7dRrdVtq2fW2Vm3QsEFxTncoIGZdy2IYxtFRI=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OSZPR01MB7796.jpnprd01.prod.outlook.com (2603:1096:604:1b5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.26; Sun, 10 Nov
 2024 08:37:39 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%4]) with mapi id 15.20.8137.019; Sun, 10 Nov 2024
 08:37:39 +0000
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
	<claudiu.beznea@tuxon.dev>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: RE: [PATCH v2 06/25] ASoC: sh: rz-ssi: Terminate all the DMA
 transactions
Thread-Topic: [PATCH v2 06/25] ASoC: sh: rz-ssi: Terminate all the DMA
 transactions
Thread-Index: AQHbMcwG7S79a8cY7kSvnoQ9PUJlhrKwMvSw
Date: Sun, 10 Nov 2024 08:37:39 +0000
Message-ID:
 <TYCPR01MB1133233B458F3AC5F7C3602B3865F2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
 <20241108104958.2931943-7-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241108104958.2931943-7-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OSZPR01MB7796:EE_
x-ms-office365-filtering-correlation-id: 157eace0-2e7c-45ab-a01b-08dd0162efb3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?urCvzec/ZEHyzAakp2zwqLpTNBh6hnX65oBax6C12BoDh8QPlwq7E36gqL36?=
 =?us-ascii?Q?DZgF921qN3lNYMlhWZ0UvIV/bk0u94upyeTjCRDTGLD2IshUNMFiw7RsLAvG?=
 =?us-ascii?Q?yc/wpieSN97/30/pL/LpoKh9hoNpPXTTENXEDmhlD0ED/Sx+Sxox6N/Xwq5e?=
 =?us-ascii?Q?1zxDsTd2NAdjcN0vTQHgVYB68upAHinKrqJETPeobch3x3blpl7360E6BxSr?=
 =?us-ascii?Q?I6qVCp8APRyIWOGOE9zOUbH0f0kO1MsZTq+dtu0VsDVKcjgfd7rrgM1S8yiQ?=
 =?us-ascii?Q?a3KSn8C5LJrf/V1ckoXy2W10W9kgz5bPY3Bk6bdjR2EMyMusgXdHoqkWT7Ez?=
 =?us-ascii?Q?7qV+Ejdt5m4y7oCq1ChZYPd8shkF3EC4lybYWyvRood4DawHCxVibYVbbmd6?=
 =?us-ascii?Q?VPAQgNdiqh1pdyzx6jW6YdhChjy0HtP/kwLr0PoRO4Kfoo8STDJQYbxlIhtX?=
 =?us-ascii?Q?y6hi0XhZ08orI8juy6cvHqtesHp3RUfoj8sfACCBzBjfNF3q8ySKfm/yF+R9?=
 =?us-ascii?Q?3bUMW1Y1E4nV3eKBcRePdlPqQEfY5qr9/256HFwvRAPYQujJ0CZm35d4st1I?=
 =?us-ascii?Q?Ymy7HhGF4axySGA8quwc9OIuUbwr0KPRQAJ43F2IpIB78KJ1L7tH1naXkER7?=
 =?us-ascii?Q?Ca3RbNG2CgQz7eexP4esWjCt7gk2JfhzfvsN8N5R5b197Gw8U/3rIByoigRO?=
 =?us-ascii?Q?KW2ssvrSq2V7xGqrrvpwPp9V7d70yT+6c2J0BJa1vcu34kD9qyEdO5xwI1Cz?=
 =?us-ascii?Q?Bav2NDVVXey5qDdjPmsfjTDh1GqBIQFKQ8z0/Rss2CX4Mcu2TK4ZtZP8KnpN?=
 =?us-ascii?Q?kzMiCfUgLIwrU9bR4ZoZtxAoi57TgylVZwfPL0v7KGooQCQew07zVVjuHtcl?=
 =?us-ascii?Q?MB8ZSzJpoQM8Lg2CQOlJF1IS4OKU6DhORUkdDzD8v2q98ljnZTPP3zW3frUg?=
 =?us-ascii?Q?a1GQoaSXFnRsmdFGTePj392+mQvfXcf92V5QWsXfYzkkINBtAOun8jHkS9ar?=
 =?us-ascii?Q?8qR3pjL5HWg71iEWmMyHSDPhCy4Wd0gHr04YLtYEvO/dlFOHsCmX+hV451s8?=
 =?us-ascii?Q?lM01yFMcz8Rqq7su4HYM4cpXJ+QRh1Bf7C4M5q9AaidSdP8RGD3clR3lGMPi?=
 =?us-ascii?Q?omEFFTaVA8FAmIoY1GZJakbpLPGSg58c59JD3dJcyUUDjK0gxnnHXHln9nIZ?=
 =?us-ascii?Q?c3Yghs9ezG0ooM6UvmevwwAnbNXw/pQKKOKbzW1lfQHDrUtMnjY0I4L2fZni?=
 =?us-ascii?Q?/lcjCmvoDWqrqa9WNGqbG9cBbftP7NODC85WvYhwDF72uXXwwdMmUo+DZFX3?=
 =?us-ascii?Q?M7uuoBJO3DYtqjdCf7C8wPbKNmuSX7ahvlMTX9rXwcagPeRNS5httBKOVFFe?=
 =?us-ascii?Q?XpL57HJmOI1SxkPhNE2Vahv5CJsi?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?XSnV/TaJoLkm4SFateT8R0MrRvcLM3h9qcV3q6gw2HegJgt/KUioRFugjLBf?=
 =?us-ascii?Q?NU9SIaGrG/WhIe9ILhQwh/yBFsvWKI0J2Qn0eF9S1+mo2QM+ptCDDkN4Fs0N?=
 =?us-ascii?Q?VPyfXQBb2i2vFayxU7m9VW8h77Zh5h8QD/yXICdynp15GoSPVo5s9JfyckX9?=
 =?us-ascii?Q?21RPfTiuPo6mrSWr1HUd0dLMpjS6Wmjbz7bIwmkgbDLz3R8qbOC8eAnQIVAf?=
 =?us-ascii?Q?+8mgfLge4NL0zWRnaJ3LDFQZvrg1CFqJSm6uQaGR8qIVw6cwXRtY2rVpEHz2?=
 =?us-ascii?Q?4MYqn2jEwQI1qafCn1+B9UKxdbjf7cIyGJ9K3X02w/PJzfVC/r0Ta+cFZaZg?=
 =?us-ascii?Q?1lZ2ARedTqtrW3AjlIOvkrKQytkRbalbLZQJiSLi/o+isPx73nLWCH/dFK8m?=
 =?us-ascii?Q?rt/WdlVZ/aG/EAVM609gxQWztQb9Nx0aSGsElp4xzko9/CLckePDUwVvyub4?=
 =?us-ascii?Q?WHzWjwEG3zUNVbJ+BkpUWNgN/X2CdmU0NszLmvJ3qzrNdb90TVo4WX1fH22J?=
 =?us-ascii?Q?iRXtbNWDCIPtLCabxoNWACCP1SdTahoudt/pugHlV/aDfFKQJhRkoPgWPIFk?=
 =?us-ascii?Q?i0SYL2wHag7AtAyqhuda7UhKXt5RCc1z4iMPN0MaNNCFlHLBdG660tHoddxw?=
 =?us-ascii?Q?gdKgZVnvBvzbcrlP657uVfnp3PRYxkq2R9Fs6oVKf8YewNQKcE9rbq53Px7b?=
 =?us-ascii?Q?PglCgpaGTVmk/QX2H702W/+1KnijqtAr+VEhYnPRWctF1meTtMSYcmvZeF0c?=
 =?us-ascii?Q?R/wxAupVhHw2UFwVQKvtLYm9iqu0PqjqBtiaQX0VALx5CUomrXMbDvg3Fual?=
 =?us-ascii?Q?yBVdMuJrFkxzw3lepPyH+70Q/6H6cEUiEy7VLttDbSqeWgU6RAchSTWWmvRT?=
 =?us-ascii?Q?Ai6PvIutI/lJm5SlDUXftbV7EN366hlOqKt4v0X3ZilPjkHPULi6qreoz2XX?=
 =?us-ascii?Q?D67c203NQEpFY25T15E8MXqEAx3H3y9Eg0e4RcH5DkefDyKpluW5MwjVgsA8?=
 =?us-ascii?Q?myTHX9NewpS0XwLk761iwZ/VJQgq+cUi8XvO92Vv3TZRqhSlK8eiStGYZUGD?=
 =?us-ascii?Q?quvW0doCyNk76flLjA2yRmcz3z7LvyPYzi9NQDecGV49L1VT6J6oV+qTwwKE?=
 =?us-ascii?Q?uLOqhOxckYftRcf55PK4Khl26mQlrmWw3+ABmo5+rQ7F6czzfnSKfYsgV6XX?=
 =?us-ascii?Q?/z5IeW12L5n7/66hvRpxYfpmgnEsoVsbkE04xhbsIhoSs3mt3v7OyIiudppJ?=
 =?us-ascii?Q?EdMlR+/TyrlO5vCt0OsgjT0RiSKl9Tc6HFIRwNiEQU5nZKlGhfGlwkhJIDZy?=
 =?us-ascii?Q?J3IcxX8zudMW9vLZqnhcsBGJSfv07fTwlYTfJO98767+Ehm3Z//2yKulqfuC?=
 =?us-ascii?Q?pMtT7RgfAPf3eGw545sbeWikXDFRyb+xP8AMdVOCaMiw4XhYOnyiZ6VoYqxy?=
 =?us-ascii?Q?d4APnFpCsCOGe5Dw0YHx4Vi+Ka59yCKwQwzoJdAlK2Gc2S9VY+FObSUFSG/k?=
 =?us-ascii?Q?BEE6KlDD2NPVHt6DHONG3OEttxrrlOiXefXYLpHOpRCtYBYrRd5eNG7Pe6hF?=
 =?us-ascii?Q?7VtcgIkZAho0Y14ozp8Kv0JjDaEDvfMfRwVTLkbG?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 157eace0-2e7c-45ab-a01b-08dd0162efb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2024 08:37:39.6183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LEJ5yaSswOTlGrMWolSw1khXxn8UkvDNUDad6BefuVHLseF/IOWUdY3Co1X5K7ZQQxTiHorLcPRKcqFuDxa63Sd4r2xXFt846ihmKZTE99E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7796



> -----Original Message-----
> From: Claudiu <claudiu.beznea@tuxon.dev>
> Sent: 08 November 2024 10:50
> To: geert+renesas@glider.be; mturquette@baylibre.com; sboyd@kernel.org; r=
obh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; Biju Das <biju.das.jz@bp.renesas=
.com>; Prabhakar Mahadev Lad
> <prabhakar.mahadev-lad.rj@bp.renesas.com>; lgirdwood@gmail.com; broonie@k=
ernel.org;
> magnus.damm@gmail.com; linus.walleij@linaro.org; perex@perex.cz; tiwai@su=
se.com;
> p.zabel@pengutronix.de
> Cc: linux-renesas-soc@vger.kernel.org; linux-clk@vger.kernel.org; devicet=
ree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-sound@vger.kernel.org; linux-gpio@vger.kern=
el.org; Claudiu.Beznea
> <claudiu.beznea@tuxon.dev>; Claudiu Beznea <claudiu.beznea.uj@bp.renesas.=
com>; stable@vger.kernel.org
> Subject: [PATCH v2 06/25] ASoC: sh: rz-ssi: Terminate all the DMA transac=
tions
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> In case of full duplex the 1st closed stream doesn't benefit from the dma=
engine_terminate_async().
> Call it after the companion stream is closed.
>=20
> Fixes: 26ac471c5354 ("ASoC: sh: rz-ssi: Add SSI DMAC support")

Maybe add fixes tag for full duplex case as the separation of=20
Playback/ Capture is introduced in that patch.

> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>=20
> Changes in v2:
> - none
>=20
>  sound/soc/renesas/rz-ssi.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c inde=
x 6efd017aaa7f..2d8721156099
> 100644
> --- a/sound/soc/renesas/rz-ssi.c
> +++ b/sound/soc/renesas/rz-ssi.c
> @@ -415,8 +415,12 @@ static int rz_ssi_stop(struct rz_ssi_priv *ssi, stru=
ct rz_ssi_stream *strm)
>  	rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TEN | SSICR_REN, 0);
>=20
>  	/* Cancel all remaining DMA transactions */
> -	if (rz_ssi_is_dma_enabled(ssi))
> -		dmaengine_terminate_async(strm->dma_ch);
> +	if (rz_ssi_is_dma_enabled(ssi)) {
> +		if (ssi->playback.dma_ch)
> +			dmaengine_terminate_async(ssi->playback.dma_ch);
> +		if (ssi->capture.dma_ch)
> +			dmaengine_terminate_async(ssi->capture.dma_ch);
> +	}
>=20
>  	rz_ssi_set_idle(ssi);
>=20
> --
> 2.39.2


