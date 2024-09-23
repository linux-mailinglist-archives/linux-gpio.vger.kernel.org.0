Return-Path: <linux-gpio+bounces-10355-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F00B97E4C5
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 04:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 888911C21035
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 02:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3704437;
	Mon, 23 Sep 2024 02:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="dvI7Tz1s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2120.outbound.protection.outlook.com [40.107.255.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7CD624;
	Mon, 23 Sep 2024 02:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727058072; cv=fail; b=pSUwSbhxKLEKthZtLFwmPH4tDIbK398amj+AfpeDUC35a5D1LRNPqbyu7cV2S4jvtSb8be4TN1ogYwlBVBXjC2bxmtWUIlEU5dL7RT+oYgCOvmj0tQSA0Xi9IR9cN2Y44BzS3hSZkBgXxd/eXbENqTiKoDMWfh32BK7TXaO2VcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727058072; c=relaxed/simple;
	bh=cdOgDIZ2ZRLUbG42PYtS66g/YlmujVcMKSu+x+232CQ=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=COxbIs6GnveqMIqmVXLdWNShzCE6bP8puBSse4TWWKznvNUBi0BUamQeXritchM0tVOqfJx91Y36DZwj4/JF4uMA5SDnTgAgRELV94Q8IaRj51Vu048kl5FNjgwDAe1bmWg74d3tlp1IOXOO+1UjH1wb75Gp9hdzqgc3bLC2dos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=dvI7Tz1s; arc=fail smtp.client-ip=40.107.255.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xET6M1Rcgdx8lU9upZcM+ck3fsAtKHxyi2tqwWyxK0PSLI1EhmW1yLdDxZ5izioxXOIw+WUNoTcPWBcm/kEdL9t8gGh4vmGrgwE7TMjrgAHsOZB26fvTpMQvew9tP0/YRsqGx1o2Fjz3fpsnAfXpTVOECGog+Hcw+SjRDsY11Z9cJUIeVPaET/CFzzLP/vg3HkaogR088wML8rqykweAkevoWPhHOtpZ444NmPAtSOO8mc1By0pin5dpe/gvlelW59ISOAN0YAqgUbLmNZzwXelPA36bkGR8C7zoWGJBtuO/obTdHGakAI5FCMVOaqpHMj2QFhPetozv5ReVIQ/iPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ed9yLmwevoHi9g+TOug02dn/1H1yMDzR89N7x2Mmw0=;
 b=GEwjHVTjjRlltP4GCupeiEQCvCiJ1p0PrFOb/tHKLQXKRULLuEdlqZvgevk0D3xyHyWPU3l3V/PgX4Ji612BT43KUYzIgWRG5VS8Ft2IQU4a19SUmMXG9HzK75XosaTFBCEzpDe3uMLobvuVRyf1pzXnuYngMjvkEBE9WgZ3/Kgr2t3qlNhCQ92OOSSfGYDeyrETIyW7f1P9TEvrSX6eDBvA4vfjCUVe0ngn6ksWiWjbrhZ6xXwkPGu6BGxmwfazDB6Dtl486pl6Y2zeqk9mJz5p/S2YwJPmYcfEHiRDR+qjhjzwXY7wOEDuvYEp3UmA+8uIQbx7xAmBNHAKFe6ptw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ed9yLmwevoHi9g+TOug02dn/1H1yMDzR89N7x2Mmw0=;
 b=dvI7Tz1sr5MHkqgjJlvy3x+KLI+3hAoxLIruVNPDM16rQWJ3Tgu6/KeWCq70vPM0TV7iQy2I64sfqsG1q7nXiydP1WNwrH9ao3IMwoBrOfHjr2PQxPEtvOELsUTqx14F9UlwwD2tdqH9nHaIBCI71B1htI+708SCnh8dTt1tsYv4JcUxhKsufYUmf9Cl9aGoH8UEX7okXEUPNx4kdsIH9+igWRBdx/SOkv2+U+ojnMLPV2m+7BP2Z4GFonwJoAeQkeQFa0FzFjYMm6GInFF3Vmb61n9gxXSe0h8eOOEdMNvpgSjh7ZM8Pq8678XgUGSzMJ7m7YGVbnm//DATghGu/A==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by SEYPR06MB5399.apcprd06.prod.outlook.com (2603:1096:101:8e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 02:20:59 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%3]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 02:20:59 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>,
	"Peter.Yin@quantatw.com" <Peter.Yin@quantatw.com>, "Jay_Zhang@wiwynn.com"
	<Jay_Zhang@wiwynn.com>
Subject: Re: [PATCH v4 3/6] gpio: aspeed: Create llops to handle hardware
 access
Thread-Topic: [PATCH v4 3/6] gpio: aspeed: Create llops to handle hardware
 access
Thread-Index: AQHbCnhtD5uArDhUb0WlW3pTFKO6W7Jf/HsAgABklZuABCqkgIAAHMpR
Date: Mon, 23 Sep 2024 02:20:59 +0000
Message-ID:
 <OSQPR06MB725290B4D7BFC47A26A0E10B8B6F2@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20240919094339.2407641-1-billy_tsai@aspeedtech.com>
	 <20240919094339.2407641-4-billy_tsai@aspeedtech.com>
	 <7aaed8cf171b67300aa5b7e861628278de948a27.camel@codeconstruct.com.au>
	 <OSQPR06MB7252FDD739DCE7D4A44F63248B6C2@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <1333d8dd77c80825cb20bc5a9885a6ced774183b.camel@codeconstruct.com.au>
In-Reply-To:
 <1333d8dd77c80825cb20bc5a9885a6ced774183b.camel@codeconstruct.com.au>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|SEYPR06MB5399:EE_
x-ms-office365-filtering-correlation-id: 468008f5-8922-4977-e776-08dcdb765d31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?okUllR5hCflgp98mEFVyo7LyuI3x911lCrn4G2oDPXGa78uKt+702vJ3+A?=
 =?iso-8859-1?Q?a0exaLHNIPkBq4KqvUfFXSiY0+Z2CYrI6Bu1NV/IIsEetW0Wk6Xry37Q7Q?=
 =?iso-8859-1?Q?rg2j9Nty8Q0DShIXxYYe1ljVDCEjXTvgqexQwqh4gQiedOmadKwoUgcFle?=
 =?iso-8859-1?Q?3Xy+0FNn74l7fSfcPZ+4m927Xz+9MVl5ir/0dImWk0GwPW5YdBPccv18jA?=
 =?iso-8859-1?Q?wMb8jw7xw0CT0+X9tMrdPZEo5gf0FxhUbsscPx8xu7GJ0NnVRyQqDYyzyT?=
 =?iso-8859-1?Q?cGQICSS1CyDRHuIGOTiW5Nt6afz2CHsaiFm/SCJCxbpH3Tu5XfcQNVPBMZ?=
 =?iso-8859-1?Q?zFkT9bbAMbpXxt9g0niWVLUAkbW/YZOoUuHFsyydU5eeVKm0mcOg5V/qPs?=
 =?iso-8859-1?Q?81B98/6LZ37Lo9STOI4eryU/x+j7/oW4UXYBAT1gPu5be/MzfqVFiTkzBZ?=
 =?iso-8859-1?Q?dCmjOR4uQfBcqfSs+ffSVI5xFNVo9VmstGHSKKRdyxXD1ET0ThhQlTBOUh?=
 =?iso-8859-1?Q?4cL9eLI8/7krc7CNsGmv5lGfSk/oqlfkrFXVCBVO1NqwtUDZBuwsyLSyS9?=
 =?iso-8859-1?Q?Ubiq6nAA6u9D5LuPWLH/MbYgGcu+msPHRZBCbyaafQiC7WrKPajOyd4fFN?=
 =?iso-8859-1?Q?0PtsLYHbEGFa0DQ3Ekf6qlwGl+mOyIDIF7BkKKQ70TZVKpln3Qz7507GUW?=
 =?iso-8859-1?Q?1OTvChSWGWcD76z/z1FM3pZxpBKwmLfLn0nx+QS16BWFj1UCTOrlhKOnI2?=
 =?iso-8859-1?Q?VgjpBRUKxHBigmgavTH/CHLpEFoFsBvMxMxKTw4ZxX1bxCn0C14VU2/yuS?=
 =?iso-8859-1?Q?ixWmLQl5EdLPdPzUc9YI3IKAV/e7z72cqpE6oxK1Rs2FYte6VWRhkJh1hq?=
 =?iso-8859-1?Q?WLz21Funusag8L8CGTchVuw9plIBl7SjQRedXWtryRpjN+6sd5oam186Lx?=
 =?iso-8859-1?Q?9idSl59gqckfQxI9gC1H31afIWgSg9m7PzgHVULcwXhW4Ge7spc04IvcEl?=
 =?iso-8859-1?Q?VOQPqB/h43ClIaukLlVbhGTzdxVP82uSpt/h2XbNc5CxCfUFJxAnv3QzdU?=
 =?iso-8859-1?Q?EsSC7zpq1u87Yx0MYA5vTW0b8z59iX+54wctWAfsZpyrGqLE5r2HHCvoc2?=
 =?iso-8859-1?Q?L0RMsB1eSWoAUA/xd0dgzEXi/4dshehKYM0wWb0dfTs2sGeGDlbI2Lwgjf?=
 =?iso-8859-1?Q?Ix8//h3ROT6Vpo35bfB25Te5Ec+imSVxa6sZo3kLO/O4ZFBbGivtGmCh7S?=
 =?iso-8859-1?Q?yyUBrefaYUEmEC0ogRNdfNGEaYgrAE3SQPQgIBSZdCqh/S9jW3MhzCgrjX?=
 =?iso-8859-1?Q?vct27fL6ARqr2D3S22xvvI12p0f6teJ45CW9hiNwGxO2ptwgSfT4pCA2b6?=
 =?iso-8859-1?Q?pvRGVvmzfrcEufhVvoukjwyd7MFvfA8lINk6p0dnBKurkJFvmvDfLkbCj5?=
 =?iso-8859-1?Q?WVEFaG7+w5SBkS1p5l5++gwMKhO6GNS92wIKnfwwrIHnSumyyuJEpxm38t?=
 =?iso-8859-1?Q?g=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1actUZ53NzSkhZmVmebYC4y465/kVo6N3ThO+GlLQQ8aJyG0vn2TR6zkfa?=
 =?iso-8859-1?Q?HKoNgiuQ8Iqx37d4egZZtgVOn6ioxkm3jVjIlpKIB/ebZljKkJXqgtd8dM?=
 =?iso-8859-1?Q?qt3LbWvWgQwQoWSCYarFHU1z9vrFYo6kfTjHOhrYQRecMXPfzY8qvM9H8B?=
 =?iso-8859-1?Q?2mUgXBbhNC4aCyLXusLNLkfBQYfTKoWjbeXdGE69VCYMlmvFwQQHPHYuqU?=
 =?iso-8859-1?Q?8GN20xFn31lHgYBtvNJgBS5PoXh4jSjimcnNLMUFAdx3aHpmI/4kWlXIHq?=
 =?iso-8859-1?Q?SfcxV4AKjQhVIOLvz+EWHWxu7cqrEEb7AePi0mobIiP1URiX447qmszrLJ?=
 =?iso-8859-1?Q?Z1TYvnE/9NU7x8zXmxE6+LtxyLVXQKcKf39WEkKSBukIs0cQ8ebUEZ0g13?=
 =?iso-8859-1?Q?botd3cKH7rPrllJ3KYV6D30ydZXpMp+j7upOX39o24Ia6aqgmMv2CEvYFO?=
 =?iso-8859-1?Q?/FodRuoaOBX8arvBzZqjhkctceqH3B0DcWHLiAuSxbUe81SV9DxswPlxfM?=
 =?iso-8859-1?Q?ybJpQhnA7BeWGV5bO/8OWnaefaLtCgz9aOVJJ0bHnyqRzsShi0oV5twhAm?=
 =?iso-8859-1?Q?mBCDLgqTX1tRNUpHkNLpSF75wfu8lp38veFigjSB0FsSUWv29ilt4ojNJL?=
 =?iso-8859-1?Q?mGbJNPyf0tGftfqUM/8HTZHufWm3jxVN9M99TuKTHON3bWUUL3z6u9biaW?=
 =?iso-8859-1?Q?Hwoxbm0XcNWxm77SQcRMPgiQALDKQcEorGPs9OnOpEzWHpM2qyec4PpZAt?=
 =?iso-8859-1?Q?KCjWC//ubTrX+Qwr6zWqXkS/9qasDvqPqUsj+8LEk2LFJQ5UnZF7NzycNL?=
 =?iso-8859-1?Q?bWBEDELp+7o5QdSNDl8+bbQeq23twDy+y6Ie5oU221IBC7J/8SEduSSuDz?=
 =?iso-8859-1?Q?SyWxaWwZuItHgdr98Qgowmq2QSln/z5zCl2hEVfvEjeWnFzm5aBxQub7NV?=
 =?iso-8859-1?Q?tXNPzWqinpw0gpa/bXELdsUoEKD8pnsYEW14QG3bpEQQTeYij6X9TmET8e?=
 =?iso-8859-1?Q?RuG6B0k/oi8MALHaH1KZKLTk24VrVKXCu9P2XzrCo15Ig4KVx7Xgw8tsQL?=
 =?iso-8859-1?Q?cZnMC0RcmRKjnXbWf2xQ7rx7CL9ksi58xGqiwSgjdNlMOdEVMZUnRwd3zS?=
 =?iso-8859-1?Q?iruOl/KqgIikTbA5Bf1b4oZeRzgjmJvUwrUpbIhbvkKAI+F9OXzPwIG0A8?=
 =?iso-8859-1?Q?G7a5A+zbknMHEfRG3RoXkvs0Nw0oXJU70J5QkxemNcpJz5LriIAw0gtGkF?=
 =?iso-8859-1?Q?8+iUDaDq13Q/fDqa/Rdrvm/USXrppeHid605aZSTnMs9ehZUQMilMhlZ3q?=
 =?iso-8859-1?Q?4VbA75fAQrc4ZDwF+fC1pDrBitVKwNNu2E79hc0yTnXaFhLkRHj1tOw90U?=
 =?iso-8859-1?Q?dSALj0oij7m8LYOqKpiGVersg0Afw1KqE4KsPALPI1tnyJoU+k6izSObHS?=
 =?iso-8859-1?Q?eEk1boj2/vUkiUyDn96rDgnM++fUGMFs/BfHQOGKqhya/muNB10skwG8w2?=
 =?iso-8859-1?Q?5MSk9PJ/uI7Qup1NLxDLsGrELOcKdsViObD81xDiJ+TwmHGgW/1BnfcwhP?=
 =?iso-8859-1?Q?5qPLHZzXwS57/M8NkiGaOOxlJ2S8/aArOXIkFPfc11qHThbeiiQlcGcw99?=
 =?iso-8859-1?Q?qIHrdW51CtEljj1poMJVTrg5k9+8Rv0AFT?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 468008f5-8922-4977-e776-08dcdb765d31
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2024 02:20:59.5570
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5jD0EqALdO2aL5vqAiHhamYCjyoLPBrYf8DMwgzjypLDudjxivCuFbj/NtvFw5A6XtR65nU3Lnrt2bUIs05C25EUlzsd98ABaCq4yYWf65I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5399

> > >=0A=
> > > > @@ -1191,6 +1203,9 @@ static int __init aspeed_gpio_probe(struct=0A=
> > > > platform_device *pdev)=0A=
> > > >=0A=
> > > >       gpio->config =3D gpio_id->data;=0A=
> > > >=0A=
> > > > +     if (!gpio->config->llops->reg_bit_set || !gpio->config-=0A=
> > > > >llops->reg_bits_get)=0A=
> > > > +             return -EINVAL;=0A=
> > > > +=0A=
> >=0A=
> > > This will need to clean up gpio->clk. Perhaps you could move it=0A=
> > > above=0A=
> > > the of_clk_get() call instead?=0A=
> >=0A=
> > How about change the `of_clk_get` to `devm_clk_get(&pdev->dev, 0);`?=0A=
=0A=
> Yep.=0A=
=0A=
> >=0A=
> > > However, looking through the rest it seems we have a few issues=0A=
> > > with=0A=
> > > this leak :/=0A=
> >=0A=
> > This gpio driver doesn't have the reset, is it?=0A=
=0A=
> No, just leaking the resource.=0A=
=0A=
> However, I can't see that we prepare/enable (and disable/unprepare) the=
=0A=
> clock either :( [1]. Do you mind fixing that as well? It would be best=0A=
> if debounce didn't work by accident.=0A=
=0A=
> Andrew=0A=
=0A=
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/include/linux/clk.h?h=3Dv6.11#n527=0A=
=0A=
Okay, I will update the clock API to use the `devm` prefix.=0A=
=0A=
Thanks=0A=
=0A=
Billy Tsai=

