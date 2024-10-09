Return-Path: <linux-gpio+bounces-11085-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E23E7995DB9
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 04:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDFE7286B7B
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 02:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BDB126BED;
	Wed,  9 Oct 2024 02:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="aGv6E4fy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2108.outbound.protection.outlook.com [40.107.255.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2832943F;
	Wed,  9 Oct 2024 02:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728440898; cv=fail; b=sphyiJzdRRA4dQMn2AaH48jDJfRd5k1CsLKCjaSLYCsFffnkanPTUo6J6WC2pbkLS3Ljc/OM5tyVfHARBi6WCcJkkFLoojuy/0i6lcTUNNXQ39fdXGyogNpGVDZ25GoRyLJK2qCwAzIi872eQqm02uyjM0cO9vgtdavU7xE/K0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728440898; c=relaxed/simple;
	bh=XcVaxuEaDBs+nkwQc4SxWcX800seU0Hqc0ob1YPbYcU=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gKbKYMheGVbeXOu5PQdnjorjmynNvMv+cBWbQrIalVY2+K2YXPWHYw+5yY6huc6CxExmiLIW//iruwcJ4hLDnTi09a0FuQp/eJ3LDMGv5LpctgACZPjzYMQ3P5npYVFWm11VwCcv72OalYiuJm/AyOiZZxm5lYOr/RP3Lh4KiYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=aGv6E4fy; arc=fail smtp.client-ip=40.107.255.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ri2SCDhdi0JgEb/P4Eeye3tL8NvIoXC3lZrMfT4dQGsRoqz+LOVHoFnBZ1XSMCwR4N7ojOxN9xueDIuCHCCNHI3mM5NUMC5rR9Rjp28EvdH27Ru8aLgXmq/4bQBuFpGJOCVU/v/lMgm2rtr7slwzXhG/FgOaG787czUOrNHX3rJG832oOHeksnVJP/76HzrnHI7tETLaoPPQcbZdMcWm41smyVscHmasnxgji8BVecX+P0yXXIYNK69f9lOsnmH+DMyg5zq/DKNaJGou4xPt+8swEuXnCwDvQDJuXwKXPtNpcGnjZ85Q1y95P87oOPjaCBKfu1ycw9qOlR7xN/qjCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exaOdinAcV2LqE4FM06kgmgnYjRdDJ5J7rlG4GdrgG4=;
 b=pNGwiDHPKpmylV9UShY4bBWlMAHJA1ad1CEbWRLIscxGKMUEWiopx76mlHpHxGlP16PWb8GwQlGG5poQc4tg9ClaXJn5afUbsBk4qy0Dqvfd71i/kEltZzaqVyzM8XMQt0TERlF8QRzpz95g4xUisX4pYvp0IlZzowTyWPv1KmzyjLVoeUWOcc7xZIY0I/cYAgimneQigyt6Ve/rQwinOCSvhpd/0vJElOaczB+/k03Pcl9G+X7fKAUYWEYHfUNdtyUrKJOzSBU0bUWrBoQXj1DTTQMpjNQJd2Ojm1PuiB9j041pqWPUzlKSKZkfYoHJK3/+ZjpMsB88TmbCaKXDRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exaOdinAcV2LqE4FM06kgmgnYjRdDJ5J7rlG4GdrgG4=;
 b=aGv6E4fyE65RKk0ddgKNrEkwvXhNvpfslWKTi82qFvyu+/Yh/RC2eO+ZqJNdSG7yD6rFZ8oGZp4n8FXzMTubgBlLgto8PlTswd2tQy7noeX7sDYSglDjg85xgKccmXMFcaHE5uhD2s0KaB2LTskXXihPQlW4QPF8LjidzbKo307YlECWwjr3rCwkLDxcKUjqLXGOMylRE9jLFKSEokSuLf3ec5yOqL6/+/xdKXnICHRoFDGVlxADmsfRKF/9zyc9vzQOKRY7RoEqmaTo/ysBtLV2B8CXIzp2rw5iQSclbsNRbDcECOTQZOke7QoLWLIwej8LwL5iKxIU0ZHB3yRf6w==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by SEZPR06MB5543.apcprd06.prod.outlook.com (2603:1096:101:cb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17; Wed, 9 Oct
 2024 02:28:10 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%7]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 02:28:10 +0000
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
Subject: Re: [PATCH v7 7/7] gpio: aspeed: Support G7 Aspeed gpio controller
Thread-Topic: [PATCH v7 7/7] gpio: aspeed: Support G7 Aspeed gpio controller
Thread-Index: AQHbGVoqiuu9X8aOoEKtiGkR01zkUbJ9rr0AgAAC+wc=
Date: Wed, 9 Oct 2024 02:28:10 +0000
Message-ID:
 <OSQPR06MB72526C8FE71BF336D8AF50758B7F2@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20241008081450.1490955-1-billy_tsai@aspeedtech.com>
	 <20241008081450.1490955-8-billy_tsai@aspeedtech.com>
 <66e619a9085a2ecb62e3945cd024822de5317f92.camel@codeconstruct.com.au>
In-Reply-To:
 <66e619a9085a2ecb62e3945cd024822de5317f92.camel@codeconstruct.com.au>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|SEZPR06MB5543:EE_
x-ms-office365-filtering-correlation-id: 0084dea0-6ecb-415b-b018-08dce80a04af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?qc48smt1Ept/P1kQGNbHur8Jks3EcB6CxJlcq5Sz4Ta4MNOKx4mL0n01?=
 =?Windows-1252?Q?bNeXcZpwEsKBC2avf+RbNebHW7RJjzAVkpGD7X8Vve0UYIltzYxd8Bi0?=
 =?Windows-1252?Q?//d2MivCHVfdf11QBGU1G7ud3dp63Rb0bszE/xD84OGo3T+VbfJkts9A?=
 =?Windows-1252?Q?koulH/Zubej0Dmw9ThT7lU/YneC/TkLHIxUgap9VBDzVAGyuVSZO4dhp?=
 =?Windows-1252?Q?I4T3ALAXeonTOjjYYNlJjwip1fPexxUVIPYeh1JgB8GyiSlyjbxFAuju?=
 =?Windows-1252?Q?wfZ5IjEcHK/kFTvIr178DdInXheqrn5cGLNC/gK/P4TtkFf8v6T9dIHR?=
 =?Windows-1252?Q?p8HZ3bpZFqpD9CkWLJZF7FE6UJQGvIATWGN7y/TkI3MTz4MHidMhaPu0?=
 =?Windows-1252?Q?X2i98AShG5oilWaK8/H8PIQ6kjW+la1A4ODsO7Mp/fSOFqmBnEtT5wUy?=
 =?Windows-1252?Q?Onetw3bK/GbouAI6j3fILo0aE6GpgKeLpJX4hz1dD9auqDEiyN55GZiI?=
 =?Windows-1252?Q?7MSiOQRzt4xyFgsoW1/sanjUskwOYIYprfS7/SJ+jFrtNRy3cQ6zCqA8?=
 =?Windows-1252?Q?Qpll596vWksRhIKYfbBmP3+yHQp9BFDC50rmukK+htFxSTD+26rqpGvq?=
 =?Windows-1252?Q?53uMP/mbQhU1BTpEsaxWzJPGTDG8Wbt31Bve6N7NC93ydglACs4y8xVp?=
 =?Windows-1252?Q?vhts6h/orIcljDyePCPWeceNB+Z+VQe5AxlSEovysEeiVdWWUZU8B4zV?=
 =?Windows-1252?Q?lTiU2awQHzbjN9VFxMVWH12LdC5A6uHoVG+KZAX0eyADYo3KWx8mTjn0?=
 =?Windows-1252?Q?Kgh8nbv+zLSjRa1oRIZI5twPc5XTxktqYctxbPkAMXj4gbvpLDb2cU9F?=
 =?Windows-1252?Q?0lqMkOQ94Cuv9RYqoc1cfpXqXe4ys2nppRNv9QlUWxP+6sCCm6ZZKQiF?=
 =?Windows-1252?Q?hxUutdW+0vmNrZRDTvvWfcSc4wfaXzQ7YfIkMHyVAjOlCcU75P6ng/X0?=
 =?Windows-1252?Q?6FdhUToPMikDRCJ4l8nZfy3FF3kfTSLKbCw6QTtVLyyIdo1yWLbFbXZK?=
 =?Windows-1252?Q?J2QxiPrnqC1ygvPmJcza9VkcNd/uma2xGTu0RnlxfUuisDEBQ/rHJ7Ml?=
 =?Windows-1252?Q?HlBmPfePo/k3bbGiIGalRNurrxzch6JDvjcraLflWpJDL41BppSmIBQx?=
 =?Windows-1252?Q?PrAeFEyo7aTFuF6cLwlyttlXQPkVz/VQQbldXSQ92a/XSeHkXctefV49?=
 =?Windows-1252?Q?ZKlTyLfW91pfznoiRJHLTJ2YUpoRbhRFn3Tcdh6i0+y1pgVXb1tllUu7?=
 =?Windows-1252?Q?twJPlk9R0+TEmVcxKQz3eyIJ+J2G1Z0JiKVdE+PCGR6kKy0JHefRHgGA?=
 =?Windows-1252?Q?Cgt+GuZ5lXYj5M1F6JtH2YnwGIJV8ebmmfycC1PP8DWGDVgjmTkNCgB1?=
 =?Windows-1252?Q?4xm4Zh3oXhYwzAdaym1c/WUmHpdME24aZ2xKMmuw5Lc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?oEs8d6REO32d9/UJtOF2KhbN9avIyd+SFUH3S9cfIourYihfgB1KYtdB?=
 =?Windows-1252?Q?EhdXVolvvlEyxP50j1Ya3fQaKLpyqrWUwt8jETvOFXJd3MIq7ZqT1oWa?=
 =?Windows-1252?Q?oQrq1JXJJYpsH11kNy4kLc79YOz7/IS+ZR4736L0CKks0TU35H9PVmbh?=
 =?Windows-1252?Q?k1wUHluAJTl9waoxUZ4uqyu3cKFZBZsuN3vK2045OOxYLKPhtFd78nnj?=
 =?Windows-1252?Q?+P11yQsFizXETEgxn5FlWAFvbMMzkV0WrOw+fbg0o63827dE1it6FsGK?=
 =?Windows-1252?Q?+uIIfnaPB/O6xtDqt5QEIuUOXZDKq9QcKAQy5gIxHhrABFyTAUzx/yI4?=
 =?Windows-1252?Q?6VjUy/n/GObt8YfjLelfLnUeBUyLaHwJE4nEaL5M8tx93n4bW+IiKEJq?=
 =?Windows-1252?Q?4OubDnQ7+DUSrxQLaRYeBCRINpFqKBOfTpI2+XU49EEj/h4kynZLjvMH?=
 =?Windows-1252?Q?jpfj/uht7rdtAgLXESAD9KC9eN6LSBRgV5JdFUJGstaLiQEy7P2cbRwG?=
 =?Windows-1252?Q?/kI/DxD7kTXJsLzNXwnOnG1nXTPtga7J/01NIFr/FOHZiw9HuFfPbWWz?=
 =?Windows-1252?Q?1LIFks2tGWDwQ8qxbpMZxeZAzGSo9OccAiafGk++CMW8r6tt/iqGciBe?=
 =?Windows-1252?Q?04KDkNrN5C1YwRRm8BAAR+VeFKqcmGxrmrRv1gUz7rvq6xtE9l86NiW2?=
 =?Windows-1252?Q?RtiHZrx58Mk/kOVyyKgNxe2O+TyEF+/ekEo463LqSLPOosIS/UPThXfk?=
 =?Windows-1252?Q?8iiU702yH86fL26G/SI8iTimsvFxe1IRmQcEl8PsZPiECYLnTZYC9wj5?=
 =?Windows-1252?Q?1dJHTXSaCUb15tyzO6sTcVgrDtbLcHvpHrzQ5kYS71zHILdzKDSElbp3?=
 =?Windows-1252?Q?7XCZaW6/gRr/UqXqGlBwojwtdjYe58B3wH5MLNBgZGux1GOen8Bvv6i9?=
 =?Windows-1252?Q?zVhXcTVdcJsADOyfJH7IAz/vQzANApvGCnyVyTJk1Oz6F9B++Z5bwYVg?=
 =?Windows-1252?Q?e/0a54gFeba8q4OsJUYArdFLSGOyq35NblchUBGeQ+tQ0/LQc8+/7RpM?=
 =?Windows-1252?Q?mdqPNrF0Us3EL7dD43g+js33GsBIOKsX+UEZ5DJDXz5Z/BYKTlugVLwK?=
 =?Windows-1252?Q?3VJEwVzJEj0hwyfXxvtwBYsF6qnYQOiEOQDwhfwlJDGU96udbBTezSz8?=
 =?Windows-1252?Q?63tuVFU/mjXJwLWqIW8zVi5BKA1gm5uB0UuzWpz63PDOHO7pqiTwWHRB?=
 =?Windows-1252?Q?YCrYonrkRmqKY4stuYf5eKnQt+ZAzzWmOqmEnIWck96wmPCOutA0d6kD?=
 =?Windows-1252?Q?1lF7VhLoxC1iln8UAHlsnIWKezv9rZRizuFET3AJWOd9VQ7yEf8f6yYm?=
 =?Windows-1252?Q?QkHnsn0+ci6oI5+3XlY8+Hx1/nfXcQwJld/WPou8HlA5W5SHwoixCDQo?=
 =?Windows-1252?Q?FG1pHzlI0spliECrD2uBFihLwbVO+ogDNtSaytILe4vsZxxOAx+bOa1O?=
 =?Windows-1252?Q?D546wnRawjAFZyFebyWJwVeiQVu73PGm75/zL7CRjKzZc7KRfXU+eg0P?=
 =?Windows-1252?Q?6JjOK36s+5DTy7lg4/FRN07BIUbE3M6+cbio11o2Qnbk14cMLc4BiqAZ?=
 =?Windows-1252?Q?CwfCpvYjfYgHh/puf9/EXtNMEQJP+swvrN5XjnyAHjRH3kqQK74yGCUK?=
 =?Windows-1252?Q?qiwatu9C+lLaH31lD9KNqyGVRURuxM60?=
Content-Type: text/plain; charset="Windows-1252"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0084dea0-6ecb-415b-b018-08dce80a04af
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2024 02:28:10.5696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2j8A3SPFiEb9zRXPUz2rQalhxcwuJxWXQDgci6kN3dSbEyV+orEsNqbr1tHvNllA2LcCYZX9MMII4et/kX0xgWKp+pzRF+RnwtKCPxPHutU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5543

> > In the 7th generation of the SoC from Aspeed, the control logic of the=
=0A=
> > GPIO controller has been updated to support per-pin control. Each pin n=
ow=0A=
> > has its own 32-bit register, allowing for individual control of the pin=
's=0A=
> > value, direction, interrupt type, and other settings. The permission fo=
r=0A=
> > coprocessor access is supported by the hardware but hasn't been=0A=
> > implemented in the current patch.=0A=
> >=0A=
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>=0A=
> > ---=0A=
> >  drivers/gpio/gpio-aspeed.c | 147 +++++++++++++++++++++++++++++++++++++=
=0A=
> >  1 file changed, 147 insertions(+)=0A=
> >=0A=
> > diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c=0A=
> > index 5d583cc9cbc7..208f95fb585e 100644=0A=
> > --- a/drivers/gpio/gpio-aspeed.c=0A=
> > +++ b/drivers/gpio/gpio-aspeed.c=0A=
> > @@ -30,6 +30,27 @@=0A=
> >  #include <linux/gpio/consumer.h>=0A=
> >  #include "gpiolib.h"=0A=
> >=0A=
> > +/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */=0A=
> > +#define field_get(_mask, _reg)       (((_reg) & (_mask)) >> (ffs(_mask=
) - 1))=0A=
> > +#define field_prep(_mask, _val)      (((_val) << (ffs(_mask) - 1)) & (=
_mask))=0A=
> > +=0A=
> > +#define GPIO_G7_IRQ_STS_BASE 0x100=0A=
> > +#define GPIO_G7_IRQ_STS_OFFSET(x) (GPIO_G7_IRQ_STS_BASE + (x) * 0x4)=
=0A=
> > +#define GPIO_G7_CTRL_REG_BASE 0x180=0A=
> > +#define GPIO_G7_CTRL_REG_OFFSET(x) (GPIO_G7_CTRL_REG_BASE + (x) * 0x4)=
=0A=
> > +#define GPIO_G7_CTRL_OUT_DATA BIT(0)=0A=
> > +#define GPIO_G7_CTRL_DIR BIT(1)=0A=
> > +#define GPIO_G7_CTRL_IRQ_EN BIT(2)=0A=
> > +#define GPIO_G7_CTRL_IRQ_TYPE0 BIT(3)=0A=
> > +#define GPIO_G7_CTRL_IRQ_TYPE1 BIT(4)=0A=
> > +#define GPIO_G7_CTRL_IRQ_TYPE2 BIT(5)=0A=
> > +#define GPIO_G7_CTRL_RST_TOLERANCE BIT(6)=0A=
> > +#define GPIO_G7_CTRL_DEBOUNCE_SEL1 BIT(7)=0A=
> > +#define GPIO_G7_CTRL_DEBOUNCE_SEL2 BIT(8)=0A=
> > +#define GPIO_G7_CTRL_INPUT_MASK BIT(9)=0A=
> > +#define GPIO_G7_CTRL_IRQ_STS BIT(12)=0A=
> > +#define GPIO_G7_CTRL_IN_DATA BIT(13)=0A=
> > +=0A=
> >  struct aspeed_bank_props {=0A=
> >       unsigned int bank;=0A=
> >       u32 input;=0A=
> > @@ -95,6 +116,22 @@ struct aspeed_gpio_bank {=0A=
> >   */=0A=
> >=0A=
> >  static const int debounce_timers[4] =3D { 0x00, 0x50, 0x54, 0x58 };=0A=
> > +static const int g7_debounce_timers[4] =3D { 0x00, 0x00, 0x04, 0x08 };=
=0A=
> > +=0A=
> > +/*=0A=
> > + * The debounce timers array is used to configure the debounce timer s=
ettings.Here=92s how it works:=0A=
> > + * Array Value: Indicates the offset for configuring the debounce time=
r.=0A=
> > + * Array Index: Corresponds to the debounce setting register.=0A=
> > + * The debounce timers array follows this pattern for configuring the =
debounce setting registers:=0A=
> > + * Array Index 0: No debounce timer is set;=0A=
> > + *             Array Value is irrelevant (don=92t care).=0A=
> > + * Array Index 1: Debounce setting #2 is set to 1, and debounce settin=
g #1 is set to 0.=0A=
> > + *             Array Value: offset for configuring debounce timer 0 (g=
4: 0x50, g7: 0x00)=0A=
> > + * Array Index 2: Debounce setting #2 is set to 0, and debounce settin=
g #1 is set to 1.=0A=
> > + *             Array Value: offset for configuring debounce timer 1 (g=
4: 0x54, g7: 0x04)=0A=
> > + * Array Index 3: Debounce setting #2 is set to 1, and debounce settin=
g #1 is set to 1.=0A=
> > + *             Array Value: offset for configuring debounce timer 2 (g=
4: 0x58, g7: 0x8)=0A=
> > + */=0A=
> >=0A=
> >  static const struct aspeed_gpio_copro_ops *copro_ops;=0A=
> >  static void *copro_data;=0A=
> > @@ -250,6 +287,39 @@ static void __iomem *aspeed_gpio_g4_bank_reg(struc=
t aspeed_gpio *gpio,=0A=
> >       BUG();=0A=
> >  }=0A=
> >=0A=
> > +static u32 aspeed_gpio_g7_reg_mask(const enum aspeed_gpio_reg reg)=0A=
> > +{=0A=
> > +     switch (reg) {=0A=
> > +     case reg_val:=0A=
> > +             return GPIO_G7_CTRL_OUT_DATA;=0A=
=0A=
> I think a problem is that we want this to be GPIO_G7_CTRL_IN_DATA for=0A=
> reads, but GPIO_G7_CTRL_OUT_DATA for writes?=0A=
=0A=
Yes. So in my aspeed_g7_bit_get, I will change the mask to GPIO_G7_CTRL_IN_=
DATA.=0A=
=0A=
+static bool aspeed_g7_reg_bit_get(struct aspeed_gpio *gpio, unsigned int o=
ffset,=0A=
+                                 const enum aspeed_gpio_reg reg)=0A=
+{=0A=
+       u32 mask =3D aspeed_gpio_g7_reg_mask(reg);=0A=
+       void __iomem *addr;=0A=
+=0A=
+       addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);=0A=
+       if (reg =3D=3D reg_val)=0A=
+               mask =3D GPIO_G7_CTRL_IN_DATA;=0A=
+=0A=
+       if (mask)=0A=
+               return field_get(mask, ioread32(addr));=0A=
+       else=0A=
+               return 0;=0A=
+}=0A=
+=

