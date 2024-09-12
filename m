Return-Path: <linux-gpio+bounces-9997-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA4B9763B4
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2024 09:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1EAE1C23305
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2024 07:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F16818F2D1;
	Thu, 12 Sep 2024 07:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="rNhDxPmU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2105.outbound.protection.outlook.com [40.107.255.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28DC11712;
	Thu, 12 Sep 2024 07:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726127877; cv=fail; b=mCP1qZSaHwfmdJdJphEnMZNL9ZeOo8kQC7UTOc657N+8MD8QjjNIn382/G2K3kPnTczpLP9OobbvNqctpM9HL6xgtU3oVzF/lsGyE0XYbcdNwVdklNnwNiM76k3DFIZzAfr/bzdeXAI0SqMHc4zjTx04TC9LIcQw/Iw54ZR/NMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726127877; c=relaxed/simple;
	bh=eW2c72oYBSqtAI2t2YbxlejM+1oofciNRJrae/V+hk0=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AQ2Ap/FCq3MShPOMdz3ET/6hJ+bAWi3LxAzFwttRIQNunft1uk+js4IT/HGN89m7Ig9Gl/CLhQ11ZlLL598/o6SuyR5lMfpn83wQXSKek+27eUbuiqWVX6pI7w2Orj6KWEft/giQc/t2+4AMrVx/u7i65aeUZJJwtrrSx/5VqVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=rNhDxPmU; arc=fail smtp.client-ip=40.107.255.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRIgsg215BZ2g6dyNSaLw1IzKN6Pz/V1Qd+HR4d44K2cJ/qr5YypaIta4rAhdab+ngCruCU1vfONB7CG3dWnN1Yd6HVOMF9PWngRwp3v4OkV+2E3l4sekXGPgOdoKem3wpam71yygNtu72HDe5L6X/GJLBMF58iHUumoRd5G/RUNlIvGIWOTUuFmoPReXrglmWh7R2AgBF2nCitlKpyB0OCzqzvqIYgt1xbl9XbC0lbFxgcykplMeHKrNleXO2BakhTHIfQGLwwx6WyQ6sWGdwF36SktEckJh9ibdrVlLBmqeYdmg1uKunmwX6PcGdE0NBln4gciTEbZUxGvFmzzqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/LC5+xUr5tZWlHQTub9LH/z+/FF277zeHD+HwwPty4=;
 b=dTFEOhUcFp8bDobAQ7zZKEhUDDihKF26EZ5hWIS05ZtFpZ2uVmr0YbSrJLFDIIjuJ3gc5gSv5G5joNizj+O2vF4eYZvXClmu+fYHKkrXAF4E6QU/6YZ7g1WR/AUYT7FLZBkUH+bJO05mtZpF16Az2yjMadR7qglcjTL22TttAEMyNJ43r6DLu+PV33FPVm944jzdtt5/jRu/PQcnjANfAGw5kvUHsCXILE6YVP31ISZs46d4fiTKKJkghT+pG90BQvZ66seyentYh4qVbRYIbgu7c7tfgpizRSK6zGZ4hR1iWzv2ptlDPP5yVnQI33MsBwDNbQstm0CPJZYBqxMybA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/LC5+xUr5tZWlHQTub9LH/z+/FF277zeHD+HwwPty4=;
 b=rNhDxPmU1fu/PL3NlYlxLR8iUxrfeWeYMgrQhSE/DhfsJdGEUDU5rAx+0eRFe7dI6QwPJP0a89hq+ydTBnncohcmeMZfdyw0x1TLMhDhXRrhJyeo8ZiyQfF7Es5xOip7+fBorGFuzfstazVdUvBzoOZDtHZMFKCbjDb0/uDZsqOvmsSPMJeFT7EfGHpZ/WxVvVNdZHoDEiryb22Kq+D8SMp744HFZsKaoe/SBPdbE/cBVwtPwzlXj3gv1DfcLb8c+1ZgmZskVhqRrSrbRLNmPOjR6NTUjxeS90Bhj8Qb2ergGpQZEXAFku613QeSOXB8ELdQv4YvI93C7vebzF+w4A==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by TYSPR06MB6574.apcprd06.prod.outlook.com (2603:1096:400:483::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 12 Sep
 2024 07:57:49 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%6]) with mapi id 15.20.7939.022; Thu, 12 Sep 2024
 07:57:48 +0000
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
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v2 2/4] gpio: aspeed: Remove the name for bank array
Thread-Topic: [PATCH v2 2/4] gpio: aspeed: Remove the name for bank array
Thread-Index: AQHa+o5rAS0ABtM/z0+zkypfekkFAbJT3AeAgAABR5U=
Date: Thu, 12 Sep 2024 07:57:48 +0000
Message-ID:
 <OSQPR06MB7252F641E8A1C6C705A41EEE8B642@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20240830034047.2251482-1-billy_tsai@aspeedtech.com>
	 <20240830034047.2251482-3-billy_tsai@aspeedtech.com>
 <7e2643f7586a7ed5d3cc90630d78fb3abd813a54.camel@codeconstruct.com.au>
In-Reply-To:
 <7e2643f7586a7ed5d3cc90630d78fb3abd813a54.camel@codeconstruct.com.au>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|TYSPR06MB6574:EE_
x-ms-office365-filtering-correlation-id: 38ebfcd2-1def-4ed7-650a-08dcd3009840
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?lsRiYr+7NNDHHRgGpu2kR2Qfaq684gLe8oSmxhwlOvo7P5f++Gy5u4SDXG?=
 =?iso-8859-1?Q?aluNQgd9hMQmXBCDBVE6nWpHJXvOuaUPrv2VoJcJWMezJ0mID8dUVV0t+l?=
 =?iso-8859-1?Q?7aBxTGKRk8NiJ6A2vlCf/cpxigmx1qhHbEts4P8r7osdCTWxvIxJwI4V0l?=
 =?iso-8859-1?Q?Z1U8E/z7GMMA+N3I3NJDz+u2xCV3nVO8Zc4jdIo5jsyQi5BchVygjkJKWz?=
 =?iso-8859-1?Q?Rny3KDCMJNCcXsU+3CbD4+Riawlye1Uq2ZOIOKOunXdGEa6UKBQam7U6Jz?=
 =?iso-8859-1?Q?i8cygbIfVazbuDgdEJRJ/NootTavpDyZn/+pEYG5XR7l/BBesHXdVVuCsH?=
 =?iso-8859-1?Q?816ZQ+bu493TESCGytIAyQ5k5dMI5zKp/hUTO90OlAbFg3SJKMiMF+2Fpw?=
 =?iso-8859-1?Q?hAUxH+ou9hXNW+SszpjtpYjyau9Hc/6rb/ZI6LLcSdafSGjkePNY0T0451?=
 =?iso-8859-1?Q?+jWjigUnjiAOL96UEFdGXvqZ4omlOHUWpZGyBfCKlnADhsZlowdib1T1MK?=
 =?iso-8859-1?Q?YI5ydESxSCEpmCmp7fS375uupgbtuAqRCFpQhOyMQzkEITF971rj3RFSDn?=
 =?iso-8859-1?Q?Lu1TjmUBwcATOeNb0Kg0pSF6UIr3rj3vyyDAgUAJY/fko7UjGH5Pxk79Ez?=
 =?iso-8859-1?Q?IWtEH8W4cF1yx7bm/jEO/6N0G3jPtSW98HpLe1NFQBBZsF9AghLwfpB2NU?=
 =?iso-8859-1?Q?//9aCVf/ymx/LADk9bhBsOIwH8PLZdJ4kw2zahtCSoCCpNts/0Hks1Uyi7?=
 =?iso-8859-1?Q?51upI4cf3/+HxdcAiNj6vombM4q5LkNh5OvxjhU7UOOcB9lWLsFTVo/Pjk?=
 =?iso-8859-1?Q?hoF/3aRekIhsMb28eV5XP/jhq/wyj4UOOFOC0G44SOC87kabToaHny99Bo?=
 =?iso-8859-1?Q?LrbUSkNIF4Yv/4O2LxRuRzXb4qh5XjUqYl1s4nCkcav8BxYJ2aDlIcb1Qf?=
 =?iso-8859-1?Q?hmoh7tJaZHPn/0QuhbZSj7GJjoOEjDRn4M5g87rBLbL6mKPf80NaY4Lm+z?=
 =?iso-8859-1?Q?jbmRFaJrk3fEctsWo64rrzKJISr8he/0MTtQ6G4KtMMxjbBU3P7pwzK2iw?=
 =?iso-8859-1?Q?6FVAsmNxJAvSiaV4Xe4FQOmvJpjQ8w+YTy0mbJ2ytstB+Zgb6ue1kR7D5/?=
 =?iso-8859-1?Q?ZwErzSs70uEMjgReyCrzhGTS3GwmxE3WOVKGhRFg3y2QVYQIpT2h3CDtT0?=
 =?iso-8859-1?Q?0LXIW9m9GYAej3FPGb0Z5mUvAPe7ypseSLfuGDEBJZrNUBXM9jrF/bggu2?=
 =?iso-8859-1?Q?50USgkb6RiZwrQKtyAaGDwq/B8TxPIkjpHlIxQ78/p3aEYuHb+RyniSu1i?=
 =?iso-8859-1?Q?lfAO5486p2MjhPz13gX3oy28aGap0DauRUWNJq+IJp0MlDCaegt3XQ3lmM?=
 =?iso-8859-1?Q?Tad8ID105Zlj84IYVuEuC4vrnrsaw4QONpMOj1pfmo6C0B4ftUi+26pw7e?=
 =?iso-8859-1?Q?7weoFMNEe3OrcagQORVRapfKUB0hsGkA2SZ7ylhz6AKmniQH1YU3vNUXwj?=
 =?iso-8859-1?Q?A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/Y+K3QafqIZBEQaPxjiQqbvEal+ISI2in63FhdR0HheOMgtiTTkWHegrk/?=
 =?iso-8859-1?Q?XMwLLSlxUrfn9jPwaj5Iw4dGYCDh5XBoPYSpKQ5Ux2zKBW7BcyZ8oB2KiJ?=
 =?iso-8859-1?Q?PY0ihSAya40qn/B2pt6mV415P77O3OylDsdWeYglhV/TeOWUItijYn445c?=
 =?iso-8859-1?Q?+uA3XDzEdaMsK5kyQMGkhvQma3UJKpdDEg3R0KqZ29nbM5ojpF2EpBMwal?=
 =?iso-8859-1?Q?Us35tBxxdW4ssVy80xhxvh4tOnYFio7GUKCB5ld0hxNFxX5IejwiEme6CR?=
 =?iso-8859-1?Q?7M0KYe68hx34jxIMO+0nwUpB6VIbYR3IrIQ5otCAYWkRhstZtyNwZpcC7V?=
 =?iso-8859-1?Q?bJv5An7OL50w7lVLxgnLwzcpkgqJaFGrMIe9fozD2F2P943TJ0FB7lEvkQ?=
 =?iso-8859-1?Q?kzgt63YXr4tRVI9JAqM1m3jeqXXN/eHNM0mqlvTQrYZ5z+Khh49vD0qkpb?=
 =?iso-8859-1?Q?QXWlgdU/RvgE84c12k9B1A7PkCujZSEAm7qaY5dYv/vt38xvgzypbD25cF?=
 =?iso-8859-1?Q?1WoxFkvwhokeoKCJNSnhsT+V8l/pNZJiznx1tLwGLFyKx19amPgSYY0aK0?=
 =?iso-8859-1?Q?Qk+zlcZPMHnqrdbIyZeOUiyjB4Ipy/RK+EsSeq7I9lSit0TXDn8ojfiKV+?=
 =?iso-8859-1?Q?imSKFbS2F7p+9nkCkR+JBxYn1za625H5mfVNvICdaoT3lqj3cTVhxDxenC?=
 =?iso-8859-1?Q?ABYsj1hV62AR+MeGXYxZlxwXLK689oOMyQYns0XwjqVaxC8f7Aq8rL+08r?=
 =?iso-8859-1?Q?z/Xhhc0kFdVo4Mw8zE1zSxMND2C6TsetFRpJX7dRVjTHP1oTXvKb770zZK?=
 =?iso-8859-1?Q?akv1vucF5ICg+AMXdG/7kb5+updwN1P8ruNB0OChh05bDGma/ewAK0CRQY?=
 =?iso-8859-1?Q?OmfX7WVpRVaWv48fWiks907pN3a1hlZAK4Xb0PseDe9aX1YDw0b9jXBuij?=
 =?iso-8859-1?Q?Og5bXbIjARJ3RLIn10qtOlb/FW+JcpIQaZwFr5ET7v+cF5QsUaBMQEb29/?=
 =?iso-8859-1?Q?Suk8MMciEvb00SH+mKTQiI9OZFOR3zSNMUHkhvsES7C5JKAse39zfpTq7B?=
 =?iso-8859-1?Q?L936VonEu1B6UIA9ZqHbNZt1s5lsXP/2xz7gNb4ao6PFnOpNax7zFQ8t2K?=
 =?iso-8859-1?Q?otH/KfWZ7NRz9mMFPoOWvuan7QMpYHX1E/2TeqK1I6YnloTZEnmMFW6nXJ?=
 =?iso-8859-1?Q?FCN5SEMHFLBYpT8NLJVs574ydEsZ4VKnmmCxeqOFJUDGBzMdt4e34XjUtz?=
 =?iso-8859-1?Q?L1RClpr40UFh9uc+6TZNXgbg4Gz159YwJvqiScDP3jNCrZSVy43/IXhArj?=
 =?iso-8859-1?Q?kCeaQ6uWwdCg6uwLTjjteAaOgICPW+30lIyZ3Uv0EYsX5xw2htGMf/8Cso?=
 =?iso-8859-1?Q?9DFwy2XAW5fLWlIbokISCTNS0l8Hsr0hp903PR/rFB7c0J/WX2HkW3HRJM?=
 =?iso-8859-1?Q?+DRN2eKsq3oEJN2tVAtMc8jtUbaobp9xdX80aY39X0t+ZlqSE2bNIrdULJ?=
 =?iso-8859-1?Q?MEN2/DKXBJqNXI7LzlLrmbIDh02ShHdCT4+IiJZK5BHrHLHlv4Z6OFJPv2?=
 =?iso-8859-1?Q?EpmKGomD9i0+vVOn9AFfPz7CF/CcWAdKNWfCWg1FD7cMhPGcygrLyIGre0?=
 =?iso-8859-1?Q?GYnGGJrbOk60brA6hu+Xt+d62snuvWDDRj?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ebfcd2-1def-4ed7-650a-08dcd3009840
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 07:57:48.7453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xgvI2MiqQT8VIVzLoyHZwYtYhHuvXFdRuh5v5wFvOvkOGBuZkdVQ7J0388oqSdCOriYwmbp9N2UNStCiy9SQRmD8wrDjDVbb5vA5kEqtWbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6574

> > The bank array name is only used to determine if the GPIO offset is val=
id,=0A=
> > and this condition can be replaced by checking if the offset exceeds th=
e=0A=
> > ngpio property.=0A=
> >=0A=
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>=0A=
> > ---=0A=
> >  drivers/gpio/gpio-aspeed.c | 17 ++++-------------=0A=
> >  1 file changed, 4 insertions(+), 13 deletions(-)=0A=
> >=0A=
> > diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c=0A=
> > index 04c03402db6d..24f50a0ea4ab 100644=0A=
> > --- a/drivers/gpio/gpio-aspeed.c=0A=
> > +++ b/drivers/gpio/gpio-aspeed.c=0A=
> > @@ -77,7 +77,6 @@ struct aspeed_gpio_bank {=0A=
> >       uint16_t        debounce_regs;=0A=
> >       uint16_t        tolerance_regs;=0A=
> >       uint16_t        cmdsrc_regs;=0A=
> > -     const char      names[4][3];=0A=
> >  };=0A=
> >=0A=
> >  /*=0A=
> > @@ -104,7 +103,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_ba=
nks[] =3D {=0A=
> >               .debounce_regs =3D 0x0040,=0A=
> >               .tolerance_regs =3D 0x001c,=0A=
> >               .cmdsrc_regs =3D 0x0060,=0A=
> > -             .names =3D { "A", "B", "C", "D" },=0A=
> >       },=0A=
> >       {=0A=
> >               .val_regs =3D 0x0020,=0A=
> > @@ -113,7 +111,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_ba=
nks[] =3D {=0A=
> >               .debounce_regs =3D 0x0048,=0A=
> >               .tolerance_regs =3D 0x003c,=0A=
> >               .cmdsrc_regs =3D 0x0068,=0A=
> > -             .names =3D { "E", "F", "G", "H" },=0A=
> >       },=0A=
> >       {=0A=
> >               .val_regs =3D 0x0070,=0A=
> > @@ -122,7 +119,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_ba=
nks[] =3D {=0A=
> >               .debounce_regs =3D 0x00b0,=0A=
> >               .tolerance_regs =3D 0x00ac,=0A=
> >               .cmdsrc_regs =3D 0x0090,=0A=
> > -             .names =3D { "I", "J", "K", "L" },=0A=
> >       },=0A=
> >       {=0A=
> >               .val_regs =3D 0x0078,=0A=
> > @@ -131,7 +127,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_ba=
nks[] =3D {=0A=
> >               .debounce_regs =3D 0x0100,=0A=
> >               .tolerance_regs =3D 0x00fc,=0A=
> >               .cmdsrc_regs =3D 0x00e0,=0A=
> > -             .names =3D { "M", "N", "O", "P" },=0A=
> >       },=0A=
> >       {=0A=
> >               .val_regs =3D 0x0080,=0A=
> > @@ -140,7 +135,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_ba=
nks[] =3D {=0A=
> >               .debounce_regs =3D 0x0130,=0A=
> >               .tolerance_regs =3D 0x012c,=0A=
> >               .cmdsrc_regs =3D 0x0110,=0A=
> > -             .names =3D { "Q", "R", "S", "T" },=0A=
> >       },=0A=
> >       {=0A=
> >               .val_regs =3D 0x0088,=0A=
> > @@ -149,7 +143,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_ba=
nks[] =3D {=0A=
> >               .debounce_regs =3D 0x0160,=0A=
> >               .tolerance_regs =3D 0x015c,=0A=
> >               .cmdsrc_regs =3D 0x0140,=0A=
> > -             .names =3D { "U", "V", "W", "X" },=0A=
> >       },=0A=
> >       {=0A=
> >               .val_regs =3D 0x01E0,=0A=
> > @@ -158,7 +151,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_ba=
nks[] =3D {=0A=
> >               .debounce_regs =3D 0x0190,=0A=
> >               .tolerance_regs =3D 0x018c,=0A=
> >               .cmdsrc_regs =3D 0x0170,=0A=
> > -             .names =3D { "Y", "Z", "AA", "AB" },=0A=
> >       },=0A=
> >       {=0A=
> >               .val_regs =3D 0x01e8,=0A=
> > @@ -167,7 +159,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_ba=
nks[] =3D {=0A=
> >               .debounce_regs =3D 0x01c0,=0A=
> >               .tolerance_regs =3D 0x01bc,=0A=
> >               .cmdsrc_regs =3D 0x01a0,=0A=
> > -             .names =3D { "AC", "", "", "" },=0A=
> >       },=0A=
> >  };=0A=
> >=0A=
> > @@ -280,11 +271,11 @@ static inline const struct aspeed_bank_props *fin=
d_bank_props(=0A=
> >  static inline bool have_gpio(struct aspeed_gpio *gpio, unsigned int of=
fset)=0A=
> >  {=0A=
> >       const struct aspeed_bank_props *props =3D find_bank_props(gpio, o=
ffset);=0A=
> > -     const struct aspeed_gpio_bank *bank =3D to_bank(offset);=0A=
> > -     unsigned int group =3D GPIO_OFFSET(offset) / 8;=0A=
> >=0A=
> > -     return bank->names[group][0] !=3D '\0' &&=0A=
> > -             (!props || ((props->input | props->output) & GPIO_BIT(off=
set)));=0A=
> > +     if (offset > gpio->chip.ngpio)=0A=
=0A=
> Should this be `>=3D`? ngpio is a count.=0A=
=0A=
Yes, it should be `>=3D`. I will fix it.=0A=
=0A=
Thanks=0A=
=0A=
> > +             return false;=0A=
> > +=0A=
> > +     return (!props || ((props->input | props->output) & GPIO_BIT(offs=
et)));=0A=
> >  }=0A=
> >=0A=
> >  static inline bool have_input(struct aspeed_gpio *gpio, unsigned int o=
ffset)=

