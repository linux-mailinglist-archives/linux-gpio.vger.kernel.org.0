Return-Path: <linux-gpio+bounces-10254-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED8797C423
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 08:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5ABC528351D
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 06:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C3217B506;
	Thu, 19 Sep 2024 06:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="J4BAm7Yv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2122.outbound.protection.outlook.com [40.107.117.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7285617ADE1;
	Thu, 19 Sep 2024 06:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726726040; cv=fail; b=cm5Uc5VZB+aI1HU3m97LpJ1HT/RlMosSZKVlrdP2cXPbyuESO9eCchdbmbBvPYhqc3LgwSm5KS6O0NrrL3Dc+WVKb+BkUgC+2OUy1SsWGqg3wobM2y6KclI/I+GxpbHIBdsEFrRgQ5QEVVR/0vKEygeDarJNlQL4/QEz+Ju7ru4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726726040; c=relaxed/simple;
	bh=453brNVhqnRIHLESR9vpSUdbsR476eb33wn9bOocwUs=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Qni65EqB236+0bOpuZOxs/FFa4cDSK19G6q82i/DyEVh25359XL6aRYaBFLdBWEasguGuqKd7G8yNvW8RJ2KcIXf8oKszWvTYsAdQEodjGFuR295THMy9cPNaGyPiR+WoKGtIsn1Yh9zSUZkK6MR6a5Up0GqjJ4TqSEa3cEEJw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=J4BAm7Yv; arc=fail smtp.client-ip=40.107.117.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2ZPTvcg67x/Jk9VfUqxkfVjsa6PhaMnhFsjP5nBQvMUyv6ggd2nD+T7FPLTtdNtOP/KBw/5XOb6gi1Qgom7uRV2SLGpxWLv8kVxPXr9DFni3i2LSubqigV3c29tqvf6DyQafPWzVqfy17dvcsLfNtLmn9sQtZXgw2VEgIfpp2yRskIPhKUdWe+7Nx8E9cFrJsDcl0RLdEwzADcw4hyC1c5EKSIeGawwFnWIvKRC10Qdx5kkMTkH3u7GcWmdlVOeqdY4jzHN1Jp1d4I51dcbkfjys5/vUXSxHaDcAa/VYkYzgTZZtBskPvTg5hw7oSZpVgZ0beBCgSkLpfgG/KMbbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=453brNVhqnRIHLESR9vpSUdbsR476eb33wn9bOocwUs=;
 b=nncXE1ji1ZDcrS70S+qi3+wuGcm1vfBDTfEngspCsvbAb34l6J1BlhfpRv81Ni2C2LMPAEvAf9VGgZBiyJqqOQiptTKqHnFo3+bIPJfAALAdI8Ntcu4ZXl3gb1SDTnMs8ZOP6RQg3kO48Oz2oxIAkqbXwcbMnRwMIOcRNgRvhubz9WU/zVlLYPTdogelcDeXtWL7LiARQFKmtv1/1DHiu7O0wqfbluOBKa+Fc7x8k40ym3aMV2imRazhlPEqx2qTXvCiN8jQi1+mZVU4jU/AyzPVC3CKuXSthhDN91CqPjLXnD7YxCvC9OVUVRPzLmNwygJuoFzQf3G9ysv+NL8LVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=453brNVhqnRIHLESR9vpSUdbsR476eb33wn9bOocwUs=;
 b=J4BAm7YvMKFfpLV4Xy9plcChihVlFS8RNjC0IijTZV3lPoqMN0RouSio6ES3UQ3dgjaLyxj1eHUI+JXq8wOM56UGFkVfdkcee2tNPHGtagVk0nQT8pOnKzVhL3S6s2oH8RByy1g7aaMgpsecx+D1GpLWZuLDNeDCptyUdoyZqPcSeQOIOLqiDxmwCEfkY/pXyAXP+9ByLBCGqDS9k8qCRVvz+F970pJgk0HPtFutyTSqcNl0CFIwbehL/YxIl9SB4mfNjITMerq4nanD7on3qKt2DwpgdgB5oR385ri0mqZeSBYdDuiuxqV/ThMDDqD68gbXc4lpAvl/dtXn2eqMrQ==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by SEZPR06MB5222.apcprd06.prod.outlook.com (2603:1096:101:75::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 06:07:11 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%3]) with mapi id 15.20.7982.018; Thu, 19 Sep 2024
 06:07:10 +0000
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
	"Peter.Yin@quantatw.com" <Peter.Yin@quantatw.com>
Subject: Re: [PATCH v3 6/6] gpio: aspeed: Add the flush write to ensure the
 write complete.
Thread-Topic: [PATCH v3 6/6] gpio: aspeed: Add the flush write to ensure the
 write complete.
Thread-Index: AQHbBbCklnKbclZOhkmIyCk6TQtm3LJZvooAgATpWm0=
Date: Thu, 19 Sep 2024 06:07:10 +0000
Message-ID:
 <OSQPR06MB7252E3D6D693BB5A920EFE798B632@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20240913074325.239390-1-billy_tsai@aspeedtech.com>
	 <20240913074325.239390-7-billy_tsai@aspeedtech.com>
 <7433f7d95a0a51eb54ea0b1c9db102adb029f946.camel@codeconstruct.com.au>
In-Reply-To:
 <7433f7d95a0a51eb54ea0b1c9db102adb029f946.camel@codeconstruct.com.au>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|SEZPR06MB5222:EE_
x-ms-office365-filtering-correlation-id: a3548a0a-740d-4a39-cb9a-08dcd8714c8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?auAJ52qTCTclRY+ISyOaGNJ6sbw87hWOFokI305ZtjU3ijUNRQinEiax?=
 =?Windows-1252?Q?7/eJv8p/lT8dtgakc1JvCCcCZyCkWU6+Jd3I2s0N14DHlb8YgrAS8MPN?=
 =?Windows-1252?Q?rVa/CN7hJ9wBgKWkmQ6TBKsWvvUBH2yBnLe1Y+/gClEZvFRe0jZN2/PL?=
 =?Windows-1252?Q?ZePNl+o7BH/oFR4r3Rl5oCeyS0kZLKnhEDY6K3t9ZFQ8L7I706ZTtY/c?=
 =?Windows-1252?Q?+TqVP4v+cXU00Bl1Hvsm5z1WFeZ2FefoKnwBRH3TRJyosZweDW9DVCSX?=
 =?Windows-1252?Q?Y8jMqp0V0jJLLjxfHh6o4msBRgYR9rT/EkqnQrDMpndPTEOSvgxTqJkQ?=
 =?Windows-1252?Q?lDzGWVlmSa6SuPscr1/FTCPHCbNvP+OX62fUTUvJC44l4pDQxrFqZQ8V?=
 =?Windows-1252?Q?PgdXHCxnGH3n7ZcAV3RFZvjBBVYSIgAgMtcve9lJmIBq/bKy169okCrU?=
 =?Windows-1252?Q?6cZ+ldxaZ4wX1nP3f15GGREankLjtyWsVX5oPXxEeRdmqFSfejdhelAZ?=
 =?Windows-1252?Q?fteP1cvKDImH06iOsPQ6t+7F5MwrvxUcPCvhYpE36dtEf/oJ8n3aNrOD?=
 =?Windows-1252?Q?42aYLLni73vjXGpUV7UpdnkBNIvFfbCAJojypaitk38bF6xpxAEccOmJ?=
 =?Windows-1252?Q?AJtJO32kSICnBArKwjdnroMBEkgHDt19ucgIr1C8r3fwz77rNCcgHZYa?=
 =?Windows-1252?Q?7T3iNRlG7Sj+TQ83Ukojnl1nAagF5W66FSWMRkH4llONMmweHEejuQHW?=
 =?Windows-1252?Q?VmjbKGPthXN2fbeYUy7GMi4ebf+op0/X1CMP9/rt3cyvaUnyvfSPpftT?=
 =?Windows-1252?Q?M0RrYUQB+nA33NsrC2u4i2//rOra7MtNyJJmoXfcXLc79TiVB7h1WMp9?=
 =?Windows-1252?Q?KH9+PeWkIZMPWhiTmLEJaCzuigmmF7loxsUumyM2OAm3PE1AKFS+0VSl?=
 =?Windows-1252?Q?RKeNwXzi1HP//46qdCOKf1HErp0JirSBhcLxvvRC41kRUj1ZOHkOtrfQ?=
 =?Windows-1252?Q?a0sOPY7QCX1VVXkbxbOZqWBbufeoC77M7z4gH8RJnRKO8nqxZIdDOj8y?=
 =?Windows-1252?Q?lnpu+qfm+Y+J9/ViZ0Ykk/oYyTRLpZYOzgyh87zJ6wPJFhHKaXkRPtki?=
 =?Windows-1252?Q?HjgjeG/fx3U0kxQodytWhPPORxvwhOhLP5AeDODencjHj9uXV2X7kMh5?=
 =?Windows-1252?Q?twg+sKDnofGh6tSlKddwP0WSw19UNvL9VSP8XH6VVw7mOnTMAE+Drkv2?=
 =?Windows-1252?Q?oDzdkue7x6zw53pIgY5CVY0EQa6w+K/HIjOlc2cOdKW/52i0ZABd5mPz?=
 =?Windows-1252?Q?tGHZUmG89cFuwdNGGY1rPawx8XxjyIBiPQT5K8QvER6xUT+J7bA4jQZm?=
 =?Windows-1252?Q?pcj2U077G3CZGYcBnfbGdp4mzIJZvfdDxQHTW1Qlg1n7v/TrfPvS7IB0?=
 =?Windows-1252?Q?Kxpv1XJYOBZFbHHaEXFP/8f+c26cs0hkIbwQRXfrADsfCTs45RI/OxX6?=
 =?Windows-1252?Q?/vM1CW/zS7TDDjmSfheZhzGMaPJ0o47jtWhxAnqkyaLaolIdM18=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?Eh9Etp2gVNJGaLvhJEzsTJtnElVuL4eHWQwpKP4+H/VM1ScyP6/eyy8O?=
 =?Windows-1252?Q?2pyGViaxJku+Kl8HkhdRTnk7FdVAQq2ajhGsTWaA3AgqGCKd6LHCCXBJ?=
 =?Windows-1252?Q?72uyXkpmZQQcT4oXSFcPuosknT6iIdGxkUhxN4ecaoLw2KYfU1vGtNUU?=
 =?Windows-1252?Q?VrFhH4KuoiRL4SmdMckY48hAi0d1bmq1Kyet2PZivdEnCdwvyy7FxySX?=
 =?Windows-1252?Q?HqhHKRQTbQNfS3xS64SIg8H9tWVcg+JcVqi3bY0UHDWic8VQvwhdvkRT?=
 =?Windows-1252?Q?sRl5URTGt8oN1iO2CnSMxTslvXm50I2bDOW08gi/ExAMtX4UYuiTPOEc?=
 =?Windows-1252?Q?bQjhnsT79ArC2GVNTZ1ECbxG5g5hbvp16MJcepC+Ibk1tHt5J/YRDHny?=
 =?Windows-1252?Q?yXA0dm20Ge6AZg/Iix78G7g69yVt/yJlxz72pMkCJp0On4JH+IhW5NCr?=
 =?Windows-1252?Q?BK4OzHe1W0U5DSavhrIJSbzThkMyfZ3ycVvxuPPvrDKwGR8VdEpp5rdr?=
 =?Windows-1252?Q?pdZucBqeeAMn89Xq5uWQeiMwLFIXSF/Yd5tYxbuADFVJWeK+i7xy3pxB?=
 =?Windows-1252?Q?Aaowf3MZTvGCz1DA+OmPHHOmJsJgJo2gApI4LUIH9AnAIQ1n92M0oNkb?=
 =?Windows-1252?Q?6ofPk6hdkNOBYD6WonxwIKJwt+ChIgdylgRcJ5n08j5NW5sxmq6EoFw5?=
 =?Windows-1252?Q?U197ORNBNj0F6ZxyfC43xKdCehI88znHF1nOPBBK+NLaXLFnsUtuBv1B?=
 =?Windows-1252?Q?Hmn1rWjzNxXB4vWwKFf2YQjjkq66S5UJCrEsALusHZNGJ9JFCoq8gfIt?=
 =?Windows-1252?Q?Q73Hx7HRodR4kkqplr+F6goMEpTRyHutkANFVD2cYIYB/Km8MPP7hND/?=
 =?Windows-1252?Q?IArUqJbpTMFE0SyuCDVkYIpwTCOwo5ElS8d86IIkX6IRUKwHtmAAOSin?=
 =?Windows-1252?Q?SzsodiAwlRbxtZl2JNgZ199EBzL2NYf0RnLYo/GtvstRWLlJZfYENVQG?=
 =?Windows-1252?Q?YPl6u8tyJBh+wr/zSQdValLOeI3cFZ93tVfvPYEXcJfko/2DClmPlpF4?=
 =?Windows-1252?Q?62K+7kSFp8eDlIMXR+l/OeN6rpplgQB89ZG91XnjzOT0t6QDi50Z/XqV?=
 =?Windows-1252?Q?CpqcQX+cuei3nUDx9PF6kAgK6NXGCIb2vhpI7B6UtRVmyyOe77pRPyUO?=
 =?Windows-1252?Q?e+vGsKT8YxQemmPu6oUDeLKiIFfbvRjSytn4vOwViV/JxQo93TNAceeI?=
 =?Windows-1252?Q?OwC1d9RV9eomg7py//VGqMYhASSGl4cEjLv29AJmTQMS7qLuDbkO2jGM?=
 =?Windows-1252?Q?QVfczVKtS4o5Z3pcwRs146yqdMAaGQur5hoW4t5R064EE/5R2dy26Ko0?=
 =?Windows-1252?Q?5vFdYBw8kkAGZoVmn7jWgeMHtIwRPPtE4r+a4EAbqdjvPs+V08jPejoJ?=
 =?Windows-1252?Q?cdb+SUVoU7MV8NX5MD5sclPxKcojSbn93Apjs0ho3PeSM8Fd/VxUmuwM?=
 =?Windows-1252?Q?GuYR3cg9dgh745geEMx6FVLuG1edG0tcdCESm5EH/8YRkBGLN9YWcQLo?=
 =?Windows-1252?Q?c70rp6D90++T2Ngc3mmzGrvFvTqe/qIgFDV0IqpNQbOjI4/Q9W/X1LfI?=
 =?Windows-1252?Q?goSfAcX4RDeuCDwlL6BrfFnEMb3kC4WAXqjeH5kSFxBK1ZmUg/CpgyPb?=
 =?Windows-1252?Q?AX2EO7VROypkl9VI5atC19UfLCev/CTD?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a3548a0a-740d-4a39-cb9a-08dcd8714c8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2024 06:07:10.6451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vIiI0RVM9Kvl95Xh2m/32823svNRFAh4Xv/rQnf1eb/HA7OXVaZEek5sD5Q4qCR1VVNdJMyjYF4COgc2+iTCJ8NF0NXVZ0cUJ5VN6024860=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5222

> > Performing a dummy read ensures that the register write operation is fu=
lly=0A=
> > completed, mitigating any potential bus delays that could otherwise imp=
act=0A=
> > the frequency of bitbang usage. E.g., if the JTAG application uses GPIO=
 to=0A=
> > control the JTAG pins (TCK, TMS, TDI, TDO, and TRST), and the applicati=
on=0A=
> > sets the TCK clock to 1 MHz, the GPIO=92s high/low transitions will rel=
y on=0A=
> > a delay function to ensure the clock frequency does not exceed 1 MHz.=
=0A=
> > However, this can lead to rapid toggling of the GPIO because the write=
=0A=
> > operation is POSTed and does not wait for a bus acknowledgment.=0A=
> >=0A=
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>=0A=
=0A=
> ... are you aware of any other driver concerns of a similar nature wrt=0A=
> the architecture of the SoCs?=0A=
=0A=
No, we are only aware of this issue with the GPIO controller, which affects=
=0A=
the output pin behavior immediately after register write.=

