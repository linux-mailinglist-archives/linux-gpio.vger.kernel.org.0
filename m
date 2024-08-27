Return-Path: <linux-gpio+bounces-9194-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C8295FF4A
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 04:46:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3B91B21C4B
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 02:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD671401C;
	Tue, 27 Aug 2024 02:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="Tel23FvY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2102.outbound.protection.outlook.com [40.107.255.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B7F38B;
	Tue, 27 Aug 2024 02:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724726759; cv=fail; b=R8oyLsfu9qjZqFBUswG3ORMDKLkWKB2JVu/0SaUVvLkkMyPG678Sd8z32E726Zi4Y1Puxo590DKKu0D4bhtlb/Z45K8Gm1k9Fb99K9pdSShHZA5YVREdAd7278nw0L3ncjnXU//zAYtH0egwz+UC7VO1Nsqf6Z3RNB64oti2at8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724726759; c=relaxed/simple;
	bh=K+Sp0XOqcoW3gbCRA32sAaM0wymhDhKGTI/jfE8pqBI=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NjjzabdUkcahrRGNOVUyGRslVrTpgfNInaG8UPIiGkDlCH7LNowXH+OZ71kkqxMgKeJ0Qa31vcuUe5lOwWBg5mP8o+vjp339t//4s9If8iNPl+KlAhccYVFYP5uqUvEqhWlitkwQ9S24mTG9Hn6lj7UpLeyeA288+jhR9JzETJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=Tel23FvY; arc=fail smtp.client-ip=40.107.255.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQMImKEXGSoL62zLeSSEzGpN3HIx9a/uULsigK7FkENiy8oHaRUSYLsfsOU+99VHPOATsHrkyQniysLUET+Za4njkKE4zqIjjkPER6XWcC4DC0ykYc7JaNal3SwSzR69HqzbN/s3ewU/SNoyKIu4rkwmoXPzJeIhYJ8KI9Jl35t3Fs3KEgqYlrX/enBlZNM7/AdPREgr9dEHzyYF4F7aVkUWn4kilePPYYeZjJOUStMmy6KVaFK8zdx3a841KOHPMrKPHkktnclGcg5FIHDDhTl69h3twcL7IeFEOsVHpvsOYL4GSxzCh3tyzc2Ry/RaE4sRQSh8Gol1QwRIJZNVRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28fyUK/mw0AN1HNp7NcnHHKulWQL7eW2LVToReOnyX4=;
 b=dBvZ7ZSrACYg0w9ot6uK7uaKaEqA/2qCXbkgrE1V+emnr7+qm+jKZeaWkZBaebftrLmi1pvQOFuRh+BXUo6Ns5ctDiY6fWgUCfAcMNXw0SLsXv3LNsl09AAyJJJbcLcSuEmP4lMKklOOb85wLuKUW/gnP699Ng+0kEdK/7geffyKMMAWi5w0MQ28x/c7LxMp0MWwsW6AhbMUPIhkX4aq3yzH3KQ826YkI3GvvXJVxy8UrwVdmw5Wpinzuiwp1ltzJYu7SuiCAurpoUB4Pt9D2/SaUs8Qo1rVRNnxAXSfupasWLJE1ULAmzsDiObroYEEFjgsT4xNrZt1PTnCotFTmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28fyUK/mw0AN1HNp7NcnHHKulWQL7eW2LVToReOnyX4=;
 b=Tel23FvY5IS58BKhXKQ4CZ8L14iuYGmYqgJ6MM+V+Mxgeea7lZSl6LU4SiuJ5NiKGi3UAyQzEBUyM+v9HwylVh1OvXJFx73JPBRe2B9I/y745r2OvmU7QrNywYHt/OhSEMocNuPQIIpJNmhnpdASp/ifRarGoMgJJp3TU8gXRYS0q0vWXinuHxctmZds4BmISRbJFdaZbtTO+9VzGwI6qnDTKVKckuMxwzV6+YlGZmBqw3ve8ZiShLsFzAas3uAJNxSf7KkE7zPTfUdBDNpDEDfF9dVwzaSXIqCvaNPRIyoWrVzTB6E4PdENwi3iquLdAlz9E4gJGUHmHt5eOveCnQ==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by JH0PR06MB6917.apcprd06.prod.outlook.com (2603:1096:990:67::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 02:45:49 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%6]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 02:45:49 +0000
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
Subject: Re: [PATCH v1 2/2] gpio: Add G7 Aspeed gpio controller driver
Thread-Topic: [PATCH v1 2/2] gpio: Add G7 Aspeed gpio controller driver
Thread-Index: AQHa85jW3giFtrQL+EeXEX8rz+LNzbIyfuSAgAbXd+c=
Date: Tue, 27 Aug 2024 02:45:49 +0000
Message-ID:
 <OSQPR06MB7252CBAEBF1DBE2C613F24748B8B2@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20240821070740.2378602-1-billy_tsai@aspeedtech.com>
	 <20240821070740.2378602-3-billy_tsai@aspeedtech.com>
 <cf92b3ab4b171e7c7c07cada066dad6323c5dace.camel@codeconstruct.com.au>
In-Reply-To:
 <cf92b3ab4b171e7c7c07cada066dad6323c5dace.camel@codeconstruct.com.au>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|JH0PR06MB6917:EE_
x-ms-office365-filtering-correlation-id: 97fa230c-5acf-493d-d3f1-08dcc6425c23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?fpSNjwSODAUW7NocjycVbQKXhLbOPac36b6YkjBBCH7K+Fa4aw6/peJh?=
 =?Windows-1252?Q?RHB33hsBgFf1wZDBYglKPzAQ8zzF9crAWyVfLRRqtjepyil2zhGsf9hh?=
 =?Windows-1252?Q?zTypdmYXkNZJlQ4isdhOVV3apyVuRoGHYKACb7b8pBDiyuuAqskSa9W6?=
 =?Windows-1252?Q?EbgTIW36g6fCr6lw1E59yDqCYhH5IaE1FntkS/H11mMrIdlQwvZlZavH?=
 =?Windows-1252?Q?PwnpQ3xKT+bm73xZxLeR7j3jm1t8Wj/8xGpNpKj0oGj8IoEEY+Fb8Dl8?=
 =?Windows-1252?Q?+8xpU5jGPJfkCDrCFHXIjJ33avXRUfxcUi/HpgfjQvkSyX5kkCINdctd?=
 =?Windows-1252?Q?FcI8SjRcfC3F6xUlpVtB7y36VnejWel3whG3FJEMdG9X0jSjt7zlQzcC?=
 =?Windows-1252?Q?LC9rHQl053Xqp+IHNW8u4T0QscBxDQdTmzDR9XPhGtyNR0BkrqgTvw6B?=
 =?Windows-1252?Q?k5sFWEwvn8XBMBrKjHj/skIxzRMpir1VOr78tYUyTT99qYM9qmLbMBTS?=
 =?Windows-1252?Q?8kgh30XvmAVA06pyN6Ndrb+LF4yl6mFBa7o/CRKbgEZewpUxKeN7lGK4?=
 =?Windows-1252?Q?wAJMO6Owe/hR9vsro2ZgLsVvWA6oJ3UUebczylWGnTUIOk/U6SXwXm/H?=
 =?Windows-1252?Q?bzcUilCeq4SrE7W5y/H7Jgsj3eCDgAQDB6HhZwAqO809la9V/VwP7z/L?=
 =?Windows-1252?Q?K7Xp/L74qN8sjOjqVCtO57/W9zbKe85/+bUl+nrPlfFftfFpKyDvIdXb?=
 =?Windows-1252?Q?NonXllRNSIt9+p/fE3wqyaqn67iQwQb8uAY1ImwDRaMaZFDhJ1aDpMGz?=
 =?Windows-1252?Q?4fdJW1vwXOzVO7ZPEJRCPaEKVmcRpIbpkqSsh0bYwIZHga0PN7veQIlu?=
 =?Windows-1252?Q?xwWe2D5BLDruQoaSfj3gzlV1ZgM2Y5uFkoUnujEx42458II6xOZ/YxmX?=
 =?Windows-1252?Q?keddGhKuDpGACloLDmdxVNxD2LcQgsLP0SoETzCEwab05BI8eOXEW9of?=
 =?Windows-1252?Q?wAYqAEJW6mpy7Iou+HJ+sK2HE4tKa4AqnASVSsqNx4buZk5ycPZobnD6?=
 =?Windows-1252?Q?38Y3WpVTxufoM/IFf7WC9oFfTZhtP5Fl4h0vnC9UftTytlrjzvBG+sz9?=
 =?Windows-1252?Q?iV0RSPxfOk5XO1du0h+jY1iF1mT1+6LlmGlavYJiMNgkXDXqq8oqmRGz?=
 =?Windows-1252?Q?0ddXS94Js7QagC51ANmbmrljdOLNviQFXLY4lVkMODUJo0QYDZip7hmH?=
 =?Windows-1252?Q?w7S7dO2WsNJQAecuHztABJQVV5AyVLgbINC6RdJXHdC9i7ObDfVXLR3F?=
 =?Windows-1252?Q?cHPhMScD4eFq/IJAeW46YzIbcsRSyaob91h+qJaxmCihc35G+wcTbylm?=
 =?Windows-1252?Q?VfsFeJ673jgaLXqsW3Fikqrrm2tPxImGWsNHUElsuXFFk7iBZxUOgG46?=
 =?Windows-1252?Q?fHL7NkRk8MT/bLXm4mWlidFocxghP0ptV2JlDcNQXDXIeFEwTc1YZFDP?=
 =?Windows-1252?Q?XbEI1ZdHKAEB/WKtdE+ws+w0Vg3Twlqf1Qb7vQeghK4G6HFrUto=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?LMwTan7nNqzQ3z0YpHKEspVC8ZO4kOqkzNVUW6oDnA6X0FRmNfmlyno+?=
 =?Windows-1252?Q?e2wzTG0tQXVaV+mkk+YYbQOZbxtE5CRczUZ+tqWjJ90jzQyPee8MVRe1?=
 =?Windows-1252?Q?lnrAYqrepTitwd61OoEzwRZfZzAVAmPp4ukNnyOC/YPBp4SVMTGkDF/Z?=
 =?Windows-1252?Q?tWV+XMayDx+UtCLoqxS/JokmyDHHFXC63WePxuP8PK5fA0zp9InqNVqA?=
 =?Windows-1252?Q?g/sBErz5yX9S3BA3sNeUKIr7VizWVoAU217KOeDw19yRzLj/Dd5neg/x?=
 =?Windows-1252?Q?8Ns/ntaQPdvlknNXObH82QBWMHw2q8+vEHCDz6nBz825Da90pr793L2Z?=
 =?Windows-1252?Q?MeIU8i03aB6W1o+eOzuDr6W5oY1YXnzugl6xpLaDi1KCvn7ePOo5ssTO?=
 =?Windows-1252?Q?5Qm3cThKys+eexi9xnJLaeYBicFRayat0cbwVrjtryrluPd0jN6VcRbD?=
 =?Windows-1252?Q?J1TCU2qMFhmlZBlc2j8N/LpN/Gt3+UydtAoKIOwGFZrhPzH5R/PjsF01?=
 =?Windows-1252?Q?Zl94MhbIKWDlBrtT9jTR3ZFbd381LVHKx2fvCRHmYsxISQ9I7ctTvcbR?=
 =?Windows-1252?Q?MdJZfYUjYqe8gOu6YfdenXEan+qkREwEEQEoDkjd37q2LK6a/7sWqDFD?=
 =?Windows-1252?Q?BWu16Z4GfWccJpQL02yrwWNdCrRHHfb1MV6WcxJGdEbbgM4Nk+6wolJT?=
 =?Windows-1252?Q?xJVLnWq5k8GRaZqiXMuAAmQvI8rAgRVkGe28JKOFANhkVb3LwcJAlb89?=
 =?Windows-1252?Q?vRY8SWx9AAFl3MwNPUMEF3ahwwNR+6+sDj3hWrM2Ayc04Vd84tOoVJyq?=
 =?Windows-1252?Q?Fd/nS8X//4aeiLb/B66VYZU8EPVgo7jG2HGIrB0WSBr1FjKPb6bCINo8?=
 =?Windows-1252?Q?08GNT6VHTgJYuJIfrDEwdT24KWLARdEjcuUUY05W0SHl5c0hyZb+PHoc?=
 =?Windows-1252?Q?e0UiXCPDYq0qs+b0B/w1IUGn+u5iX3d6un+Uu0T2o01CLzqC0cf63unN?=
 =?Windows-1252?Q?uMI56rVP3atw8lyxX3HZTJgauEco4BTr1IaHQmNtMZ2/IvRJkbiORhVy?=
 =?Windows-1252?Q?bAoKXsMCnzDcc6GOZ8JW8Jm8o4FZq42U9dxa+EeqDJlt7WSVzO2RN8/8?=
 =?Windows-1252?Q?Ffs/xOcGglwSs0f7v1TzvFSIBzvTVwkpNvLwKsq3/zWesQbkPjyLCVsZ?=
 =?Windows-1252?Q?w4empBVibEmZ3Y/S5guF7CvNnHmEnEj2EOXBu35xc4VYkuHqiqfqgXcZ?=
 =?Windows-1252?Q?yT/e+zYVXKQSb54Dn8H8hraRnqHb7C42MDHZy9lH6yVm/QpGSnLcY6LC?=
 =?Windows-1252?Q?+7Gaw9hRu5aF9iax2J5KKC5YC5sOpHpbecE63MMOqpnsC4zVqS3XvMzP?=
 =?Windows-1252?Q?pQuocxLOi8hHQ0RpKipZJixVJe2xdJA2zrQt3SJlxZ4W7fNoImHSgP9r?=
 =?Windows-1252?Q?LJHjQ7AzYwzK0JYg9n2sdxaohwdKwZfS0UASAhhftnwJAityLOaSC310?=
 =?Windows-1252?Q?oVy6xAw7LzL45RZXv9cuwWctmUPhlA7TtKhL/FY+bqgLyn6Naz3fNbC4?=
 =?Windows-1252?Q?664QcigEn9d19DxVcBcsdJjsD+gU2DNyZP0oHemq1Cg5cY1g2es2HTl3?=
 =?Windows-1252?Q?zSMRUiVNCEgPWZCo8ecW1lim29SPjj53BGV3QswTQaDOWBL5hlVmXq5I?=
 =?Windows-1252?Q?v1CCafZcsycBvXK2bSudbenWFLFWNgRA?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 97fa230c-5acf-493d-d3f1-08dcc6425c23
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 02:45:49.5321
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sr8gkG4Q+SViYjt0/YYdIZKB78mEFHBMA8UwMZ5jAadM5RFaFXZBFgLeK2fXLPi3TBMixujPvK9q4moo/6kpRXvgGuCXIobH9NIDj9PuyH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6917

=0A=
Hi Andrew,=0A=
=0A=
Thanks for your suggestion. As I understand it, you=92re suggesting that th=
is driver should share the=0A=
common parts with aspeed-gpio.c, correct?=0A=
However, I don=92t think that=92s necessary. You can treat it as a new GPIO=
 controller because the=0A=
register layout is quite different from aspeed-gpio.c.=0A=
If I try to make it common, the driver could become too complex, potentiall=
y requiring a separate=0A=
gpio-aspeed-common.c and necessitating changes to the existing aspeed-gpio.=
c=0A=
Maybe the discussion of merging aspeed-gpio.c and this driver can be postpo=
ned until after this one=0A=
is accepted?=0A=
=0A=
For Others, please see the reply inline.=0A=
=0A=
Best regards,=0A=
Billy Tsai=0A=
=0A=
> > In the 7th generation of the SoC from Aspeed, the control logic of the=
=0A=
> > GPIO controller has been updated to support per-pin control. Each pin n=
ow=0A=
> > has its own 32-bit register, allowing for individual control of the pin=
=92s=0A=
> > value, direction, interrupt type, and other settings.=0A=
> >=0A=
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>=0A=
> > ---=0A=
> >  drivers/gpio/Kconfig          |   7 +=0A=
> >  drivers/gpio/Makefile         |   1 +=0A=
> >  drivers/gpio/gpio-aspeed-g7.c | 831 ++++++++++++++++++++++++++++++++++=
=0A=
> >  3 files changed, 839 insertions(+)=0A=
> >  create mode 100644 drivers/gpio/gpio-aspeed-g7.c=0A=
> >=0A=
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig=0A=
> > index 58f43bcced7c..93f237429b92 100644=0A=
> > --- a/drivers/gpio/Kconfig=0A=
> > +++ b/drivers/gpio/Kconfig=0A=
> > @@ -172,6 +172,13 @@ config GPIO_ASPEED=0A=
> >       help=0A=
> >         Say Y here to support Aspeed AST2400 and AST2500 GPIO controlle=
rs.=0A=
> >=0A=
> > +config GPIO_ASPEED_G7=0A=
> > +     tristate "Aspeed G7 GPIO support"=0A=
> > +     depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO=0A=
> > +     select GPIOLIB_IRQCHIP=0A=
> > +     help=0A=
> > +       Say Y here to support Aspeed AST2700 GPIO controllers.=0A=
> > +=0A=
> >  config GPIO_ASPEED_SGPIO=0A=
> >       bool "Aspeed SGPIO support"=0A=
> >       depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO=0A=
> > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile=0A=
> > index 64dd6d9d730d..e830291761ee 100644=0A=
> > --- a/drivers/gpio/Makefile=0A=
> > +++ b/drivers/gpio/Makefile=0A=
> > @@ -34,6 +34,7 @@ obj-$(CONFIG_GPIO_AMD_FCH)          +=3D gpio-amd-fch=
.o=0A=
> >  obj-$(CONFIG_GPIO_AMDPT)             +=3D gpio-amdpt.o=0A=
> >  obj-$(CONFIG_GPIO_ARIZONA)           +=3D gpio-arizona.o=0A=
> >  obj-$(CONFIG_GPIO_ASPEED)            +=3D gpio-aspeed.o=0A=
> > +obj-$(CONFIG_GPIO_ASPEED_G7)         +=3D gpio-aspeed-g7.o=0A=
> >  obj-$(CONFIG_GPIO_ASPEED_SGPIO)              +=3D gpio-aspeed-sgpio.o=
=0A=
> >  obj-$(CONFIG_GPIO_ATH79)             +=3D gpio-ath79.o=0A=
> >  obj-$(CONFIG_GPIO_BCM_KONA)          +=3D gpio-bcm-kona.o=0A=
> > diff --git a/drivers/gpio/gpio-aspeed-g7.c b/drivers/gpio/gpio-aspeed-g=
7.c=0A=
> > new file mode 100644=0A=
> > index 000000000000..dbca097de6ea=0A=
> > --- /dev/null=0A=
> > +++ b/drivers/gpio/gpio-aspeed-g7.c=0A=
> > @@ -0,0 +1,831 @@=0A=
> > +// SPDX-License-Identifier: GPL-2.0-or-later=0A=
> > +/*=0A=
> > + * Copyright 2024 Aspeed Technology Inc.=0A=
> > + *=0A=
> > + * Billy Tsai <billy_tsai@aspeedtech.com>=0A=
> > + */=0A=
> > +=0A=
> > +#include <linux/clk.h>=0A=
> > +#include <linux/gpio/aspeed.h>=0A=
=0A=
> I think you should either drop this include or rework the existing=0A=
> implementations so the coprocessor handshake works correctly.=0A=
=0A=
The coprocessor handshake will be implemented later, so I will remove the r=
elated include for now.=0A=
=0A=
> > +#include <linux/gpio/driver.h>=0A=
> > +#include <linux/hashtable.h>=0A=
> > +#include <linux/init.h>=0A=
> > +#include <linux/io.h>=0A=
> > +#include <linux/kernel.h>=0A=
> > +#include <linux/module.h>=0A=
> > +#include <linux/pinctrl/consumer.h>=0A=
> > +#include <linux/platform_device.h>=0A=
> > +#include <linux/seq_file.h>=0A=
> > +#include <linux/spinlock.h>=0A=
> > +#include <linux/string.h>=0A=
> > +=0A=
> > +#include <asm/div64.h>=0A=
> > +=0A=
> > +#define GPIO_G7_IRQ_STS_BASE 0x100=0A=
> > +#define GPIO_G7_IRQ_STS_OFFSET(x) (GPIO_G7_IRQ_STS_BASE + (x) * 0x4)=
=0A=
> > +#define GPIO_G7_CTRL_REG_BASE 0x180=0A=
> > +#define GPIO_G7_CTRL_REG_OFFSET(x) (GPIO_G7_CTRL_REG_BASE + (x) * 0x4)=
=0A=
> > +#define GPIO_G7_OUT_DATA BIT(0)=0A=
> > +#define GPIO_G7_DIR BIT(1)=0A=
> > +#define GPIO_G7_IRQ_EN BIT(2)=0A=
> > +#define GPIO_G7_IRQ_TYPE0 BIT(3)=0A=
> > +#define GPIO_G7_IRQ_TYPE1 BIT(4)=0A=
> > +#define GPIO_G7_IRQ_TYPE2 BIT(5)=0A=
> > +#define GPIO_G7_RST_TOLERANCE BIT(6)=0A=
> > +#define GPIO_G7_DEBOUNCE_SEL GENMASK(8, 7)=0A=
> > +#define GPIO_G7_INPUT_MASK BIT(9)=0A=
> > +#define GPIO_G7_IRQ_STS BIT(12)=0A=
> > +#define GPIO_G7_IN_DATA BIT(13)=0A=
=0A=
> Can you please add `CTRL` into these field macro names so it's clear=0A=
> they relate to the control register?=0A=
=0A=
Okay.=0A=
=0A=
> > +/*=0A=
> > + * The configuration of the following registers should be determined=
=0A=
> > + * outside of the GPIO driver.=0A=
=0A=
> Where though?=0A=
=0A=
The usage of the following registers hasn=92t been implemented yet, so I wi=
ll remove them for now.=0A=
=0A=
> > + */=0A=
> > +#define GPIO_G7_PRIVILEGE_W_REG_BASE 0x810=0A=
> > +#define GPIO_G7_PRIVILEGE_W_REG_OFFSET(x) (GPIO_G7_PRIVILEGE_W_REG_BAS=
E + ((x) >> 2) * 0x4)=0A=
> > +#define GPIO_G7_PRIVILEGE_R_REG_BASE 0x910=0A=
> > +#define GPIO_G7_PRIVILEGE_R_REG_OFFSET(x) (GPIO_G7_PRIVILEGE_R_REG_BAS=
E + ((x) >> 2) * 0x4)=0A=
> > +#define GPIO_G7_IRQ_TARGET_REG_BASE 0xA10=0A=
> > +#define GPIO_G7_IRQ_TARGET_REG_OFFSET(x) (GPIO_G7_IRQ_TARGET_REG_BASE =
+ ((x) >> 2) * 0x4)=0A=
> > +#define GPIO_G7_IRQ_TO_INTC2_18 BIT(0)=0A=
> > +#define GPIO_G7_IRQ_TO_INTC2_19 BIT(1)=0A=
> > +#define GPIO_G7_IRQ_TO_INTC2_20 BIT(2)=0A=
> > +#define GPIO_G7_IRQ_TO_SIO BIT(3)=0A=
> > +#define GPIO_G7_IRQ_TARGET_RESET_TOLERANCE BIT(6)=0A=
> > +#define GPIO_G7_IRQ_TARGET_W_PROTECT BIT(7)=0A=
> > +=0A=
> > +static inline u32 field_get(u32 _mask, u32 _val)=0A=
> > +{=0A=
> > +     return (((_val) & (_mask)) >> (ffs(_mask) - 1));=0A=
> > +}=0A=
> > +=0A=
> > +static inline u32 field_prep(u32 _mask, u32 _val)=0A=
> > +{=0A=
> > +     return (((_val) << (ffs(_mask) - 1)) & (_mask));=0A=
> > +}=0A=
=0A=
> So linux/bitfield.h provides a lot of APIs along these lines, perhaps=0A=
> use them instead?=0A=
=0A=
I will use FIELD_GET and FIELD_PREP to replace them.=0A=
=0A=
> > +=0A=
> > +static inline void ast_write_bits(void __iomem *addr, u32 mask, u32 va=
l)=0A=
> > +{=0A=
> > +     iowrite32((ioread32(addr) & ~(mask)) | field_prep(mask, val), add=
r);=0A=
> > +}=0A=
> > +=0A=
> > +static inline void ast_clr_bits(void __iomem *addr, u32 mask)=0A=
> > +{=0A=
> > +     iowrite32((ioread32(addr) & ~(mask)), addr);=0A=
> > +}=0A=
> > +=0A=
> > +struct aspeed_bank_props {=0A=
> > +     unsigned int bank;=0A=
> > +     u32 input;=0A=
> > +     u32 output;=0A=
> > +};=0A=
> > +=0A=
> > +struct aspeed_gpio_g7_config {=0A=
> > +     unsigned int nr_gpios;=0A=
> > +     const struct aspeed_bank_props *props;=0A=
> > +};=0A=
> > +=0A=
> > +/*=0A=
> > + * @offset_timer: Maps an offset to an @timer_users index, or zero if =
disabled=0A=
> > + * @timer_users: Tracks the number of users for each timer=0A=
> > + *=0A=
> > + * The @timer_users has four elements but the first element is unused.=
 This is=0A=
> > + * to simplify accounting and indexing, as a zero value in @offset_tim=
er=0A=
> > + * represents disabled debouncing for the GPIO. Any other value for an=
 element=0A=
> > + * of @offset_timer is used as an index into @timer_users. This behavi=
our of=0A=
> > + * the zero value aligns with the behaviour of zero built from the tim=
er=0A=
> > + * configuration registers (i.e. debouncing is disabled).=0A=
> > + */=0A=
> > +struct aspeed_gpio_g7 {=0A=
> > +     struct gpio_chip chip;=0A=
> > +     struct device *dev;=0A=
> > +     raw_spinlock_t lock;=0A=
> > +     void __iomem *base;=0A=
> > +     int irq;=0A=
> > +     const struct aspeed_gpio_g7_config *config;=0A=
> > +=0A=
> > +     u8 *offset_timer;=0A=
> > +     unsigned int timer_users[4];=0A=
> > +     struct clk *clk;=0A=
> > +=0A=
> > +     u32 *dcache;=0A=
> > +};=0A=
> > +=0A=
> > +/*=0A=
> > + * Note: The "value" register returns the input value sampled on the=
=0A=
> > + *       line even when the GPIO is configured as an output. Since=0A=
> > + *       that input goes through synchronizers, writing, then reading=
=0A=
> > + *       back may not return the written value right away.=0A=
> > + *=0A=
> > + *       The "rdata" register returns the content of the write latch=
=0A=
> > + *       and thus can be used to read back what was last written=0A=
> > + *       reliably.=0A=
> > + */=0A=
> > +=0A=
> > +static const int debounce_timers[4] =3D { 0x00, 0x04, 0x00, 0x08 };=0A=
=0A=
> This is all largely copy/pasted from gpio-aspeed.c. Can we split it out=
=0A=
> and share the definitions?=0A=
=0A=
Do you mean moving them into the common header file? =0A=
The structure is fine, but I=92m unsure about the debounce_timers. =0A=
It=92s a static array, so I don=92t think it needs to be shared with gpio-a=
speed.c.=0A=
=0A=
> > +=0A=
> > +#define GPIO_BANK(x) ((x) >> 5)=0A=
> > +#define GPIO_OFFSET(x) ((x) & 0x1f)=0A=
> > +#define GPIO_BIT(x) BIT(GPIO_OFFSET(x))=0A=
> > +=0A=
> > +static inline bool is_bank_props_sentinel(const struct aspeed_bank_pro=
ps *props)=0A=
> > +{=0A=
> > +     return !(props->input || props->output);=0A=
> > +}=0A=
> > +=0A=
> > +static inline const struct aspeed_bank_props *find_bank_props(struct a=
speed_gpio_g7 *gpio,=0A=
> > +                                                           unsigned in=
t offset)=0A=
> > +{=0A=
> > +     const struct aspeed_bank_props *props =3D gpio->config->props;=0A=
> > +=0A=
> > +     while (!is_bank_props_sentinel(props)) {=0A=
> > +             if (props->bank =3D=3D GPIO_BANK(offset))=0A=
> > +                     return props;=0A=
> > +             props++;=0A=
> > +     }=0A=
> > +=0A=
> > +     return NULL;=0A=
> > +}=0A=
> > +=0A=
> > +static inline bool have_gpio(struct aspeed_gpio_g7 *gpio, unsigned int=
 offset)=0A=
> > +{=0A=
> > +     const struct aspeed_bank_props *props =3D find_bank_props(gpio, o=
ffset);=0A=
> > +=0A=
> > +     if (offset > gpio->chip.ngpio)=0A=
> > +             return false;=0A=
> > +=0A=
> > +     return (!props || ((props->input | props->output) & GPIO_BIT(offs=
et)));=0A=
> > +}=0A=
> > +=0A=
> > +static inline bool have_input(struct aspeed_gpio_g7 *gpio, unsigned in=
t offset)=0A=
> > +{=0A=
> > +     const struct aspeed_bank_props *props =3D find_bank_props(gpio, o=
ffset);=0A=
> > +=0A=
> > +     return !props || (props->input & GPIO_BIT(offset));=0A=
> > +}=0A=
> > +=0A=
> > +#define have_irq(g, o) have_input((g), (o))=0A=
> > +#define have_debounce(g, o) have_input((g), (o))=0A=
> > +=0A=
> > +static inline bool have_output(struct aspeed_gpio_g7 *gpio, unsigned i=
nt offset)=0A=
> > +{=0A=
> > +     const struct aspeed_bank_props *props =3D find_bank_props(gpio, o=
ffset);=0A=
> > +=0A=
> > +     return !props || (props->output & GPIO_BIT(offset));=0A=
> > +}=0A=
> > +=0A=
=0A=
> This is all common as well.=0A=
=0A=
Moving them into the common header file?=0A=
=0A=
> > +static int aspeed_gpio_g7_get(struct gpio_chip *gc, unsigned int offse=
t)=0A=
> > +{=0A=
> > +     struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(gc);=0A=
> > +     void __iomem *addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offse=
t);=0A=
> > +=0A=
> > +     return !!(field_get(GPIO_G7_IN_DATA, ioread32(addr)));=0A=
> > +}=0A=
> > +=0A=
> > +static void __aspeed_gpio_g7_set(struct gpio_chip *gc, unsigned int of=
fset, int val)=0A=
> > +{=0A=
> > +     struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(gc);=0A=
> > +     void __iomem *addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offse=
t);=0A=
=0A=
> The rest of the implementation of this function is broadly the same as=0A=
> in gpio-aspeed.c. The main difference is accounting for the address to=0A=
> access and the bit to whack. If we define some callbacks that replace=0A=
> GPIO_BANK()/to_bank() and GPIO_BIT() that can account for the=0A=
> differences in register layout, perhaps this could be common?=0A=
=0A=
> The trade-off is some complexity vs copy-paste, but there does seem to=0A=
> be an awful lot of the latter with only minor changes so far.=0A=
=0A=
Do you mean I need to create a gpio-aspeed-common.c, define the necessary c=
ommon APIs,=0A=
and have gpio-aspeed.c and this driver hook into those APIs? =0A=
=0A=
> > +     u32 reg;=0A=
> > +=0A=
> > +     reg =3D gpio->dcache[GPIO_BANK(offset)];=0A=
> > +=0A=
> > +     if (val)=0A=
> > +             reg |=3D GPIO_BIT(offset);=0A=
> > +     else=0A=
> > +             reg &=3D ~GPIO_BIT(offset);=0A=
> > +     gpio->dcache[GPIO_BANK(offset)] =3D reg;=0A=
> > +=0A=
> > +     ast_write_bits(addr, GPIO_G7_OUT_DATA, val);=0A=
> > +}=0A=
> > +=0A=
> > +static void aspeed_gpio_g7_set(struct gpio_chip *gc, unsigned int offs=
et, int val)=0A=
> > +{=0A=
> > +     struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(gc);=0A=
> > +     unsigned long flags;=0A=
> > +=0A=
> > +     raw_spin_lock_irqsave(&gpio->lock, flags);=0A=
> > +=0A=
> > +     __aspeed_gpio_g7_set(gc, offset, val);=0A=
> > +=0A=
> > +     raw_spin_unlock_irqrestore(&gpio->lock, flags);=0A=
> > +}=0A=
> > +=0A=
> > +static int aspeed_gpio_g7_dir_in(struct gpio_chip *gc, unsigned int of=
fset)=0A=
> > +{=0A=
> > +     struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(gc);=0A=
> > +     void __iomem *addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offse=
t);=0A=
> > +     unsigned long flags;=0A=
> > +=0A=
> > +     if (!have_input(gpio, offset))=0A=
> > +             return -EOPNOTSUPP;=0A=
> > +=0A=
> > +     raw_spin_lock_irqsave(&gpio->lock, flags);=0A=
> > +=0A=
> > +     ast_clr_bits(addr, GPIO_G7_DIR);=0A=
> > +=0A=
> > +     raw_spin_unlock_irqrestore(&gpio->lock, flags);=0A=
> > +=0A=
> > +     return 0;=0A=
> > +}=0A=
> > +=0A=
> > +static int aspeed_gpio_g7_dir_out(struct gpio_chip *gc, unsigned int o=
ffset, int val)=0A=
> > +{=0A=
> > +     struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(gc);=0A=
> > +     void __iomem *addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offse=
t);=0A=
> > +     unsigned long flags;=0A=
> > +=0A=
> > +     if (!have_output(gpio, offset))=0A=
> > +             return -EOPNOTSUPP;=0A=
> > +=0A=
> > +     raw_spin_lock_irqsave(&gpio->lock, flags);=0A=
> > +=0A=
> > +     __aspeed_gpio_g7_set(gc, offset, val);=0A=
> > +     ast_write_bits(addr, GPIO_G7_DIR, 1);=0A=
> > +=0A=
> > +     raw_spin_unlock_irqrestore(&gpio->lock, flags);=0A=
> > +=0A=
> > +     return 0;=0A=
> > +}=0A=
> > +=0A=
> > +static int aspeed_gpio_g7_get_direction(struct gpio_chip *gc, unsigned=
 int offset)=0A=
> > +{=0A=
> > +     struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(gc);=0A=
> > +     void __iomem *addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offse=
t);=0A=
> > +     unsigned long flags;=0A=
> > +     u32 val;=0A=
> > +=0A=
> > +     if (!have_input(gpio, offset))=0A=
> > +             return GPIO_LINE_DIRECTION_OUT;=0A=
> > +=0A=
> > +     if (!have_output(gpio, offset))=0A=
> > +             return GPIO_LINE_DIRECTION_IN;=0A=
> > +=0A=
> > +     raw_spin_lock_irqsave(&gpio->lock, flags);=0A=
> > +=0A=
> > +     val =3D ioread32(addr) & GPIO_G7_DIR;=0A=
> > +=0A=
> > +     raw_spin_unlock_irqrestore(&gpio->lock, flags);=0A=
> > +=0A=
> > +     return val ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;=0A=
> > +}=0A=
=0A=
> On top of handling the differences in the register layout as I=0A=
> mentioned above, the main difference in these get/set implementations=0A=
> is dropping the calls through the coprocessor handshake APIs. If you=0A=
> stub out the implementation of the coprocessor APIs I think it's likely=
=0A=
> these can be common. To do that you would need to make them use=0A=
> callbacks into the SoC-specific driver. To stub out the implementation=0A=
> you could leave the callback pointer as NULL for now.=0A=
=0A=
Same as above?=0A=
=0A=
> > +=0A=
> > +static inline int irqd_to_aspeed_gpio_g7_data(struct irq_data *d, stru=
ct aspeed_gpio_g7 **gpio,=0A=
> > +                                           int *offset)=0A=
> > +{=0A=
> > +     struct aspeed_gpio_g7 *internal;=0A=
> > +=0A=
> > +     *offset =3D irqd_to_hwirq(d);=0A=
> > +=0A=
> > +     internal =3D irq_data_get_irq_chip_data(d);=0A=
> > +=0A=
> > +     /* This might be a bit of a questionable place to check */=0A=
> > +     if (!have_irq(internal, *offset))=0A=
> > +             return -EOPNOTSUPP;=0A=
> > +=0A=
> > +     *gpio =3D internal;=0A=
> > +=0A=
> > +     return 0;=0A=
> > +}=0A=
=0A=
> You do have different data-types here (struct aspeed_gpio_g7), but=0A=
> possibly with appropriate struct definitions and use of container_of()=0A=
> by the caller, this could be common too?=0A=
=0A=
> > +=0A=
> > +static void aspeed_gpio_g7_irq_ack(struct irq_data *d)=0A=
> > +{=0A=
> > +     struct aspeed_gpio_g7 *gpio;=0A=
> > +     unsigned long flags;=0A=
> > +     void __iomem *addr;=0A=
> > +     int rc, offset;=0A=
> > +=0A=
> > +     rc =3D irqd_to_aspeed_gpio_g7_data(d, &gpio, &offset);=0A=
> > +     if (rc)=0A=
> > +             return;=0A=
> > +=0A=
> > +     addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);=0A=
> > +=0A=
> > +     raw_spin_lock_irqsave(&gpio->lock, flags);=0A=
> > +=0A=
> > +     ast_write_bits(addr, GPIO_G7_IRQ_STS, 1);=0A=
> > +=0A=
> > +     raw_spin_unlock_irqrestore(&gpio->lock, flags);=0A=
> > +}=0A=
> > +=0A=
> > +static void aspeed_gpio_g7_irq_set_mask(struct irq_data *d, bool set)=
=0A=
> > +{=0A=
> > +     struct aspeed_gpio_g7 *gpio;=0A=
> > +     unsigned long flags;=0A=
> > +     void __iomem *addr;=0A=
> > +     int rc, offset;=0A=
> > +=0A=
> > +     rc =3D irqd_to_aspeed_gpio_g7_data(d, &gpio, &offset);=0A=
> > +     if (rc)=0A=
> > +             return;=0A=
> > +=0A=
> > +     addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);=0A=
> > +=0A=
> > +     /* Unmasking the IRQ */=0A=
> > +     if (set)=0A=
> > +             gpiochip_enable_irq(&gpio->chip, irqd_to_hwirq(d));=0A=
> > +=0A=
> > +     raw_spin_lock_irqsave(&gpio->lock, flags);=0A=
> > +=0A=
> > +     if (set)=0A=
> > +             ast_write_bits(addr, GPIO_G7_IRQ_EN, 1);=0A=
> > +     else=0A=
> > +             ast_clr_bits(addr, GPIO_G7_IRQ_EN);=0A=
> > +=0A=
> > +     raw_spin_unlock_irqrestore(&gpio->lock, flags);=0A=
> > +=0A=
> > +     /* Masking the IRQ */=0A=
> > +     if (!set)=0A=
> > +             gpiochip_disable_irq(&gpio->chip, irqd_to_hwirq(d));=0A=
> > +}=0A=
> > +=0A=
> > +static void aspeed_gpio_g7_irq_mask(struct irq_data *d)=0A=
> > +{=0A=
> > +     aspeed_gpio_g7_irq_set_mask(d, false);=0A=
> > +}=0A=
> > +=0A=
> > +static void aspeed_gpio_g7_irq_unmask(struct irq_data *d)=0A=
> > +{=0A=
> > +     aspeed_gpio_g7_irq_set_mask(d, true);=0A=
> > +}=0A=
> > +=0A=
> > +static int aspeed_gpio_g7_set_type(struct irq_data *d, unsigned int ty=
pe)=0A=
> > +{=0A=
> > +     u32 type0 =3D 0;=0A=
> > +     u32 type1 =3D 0;=0A=
> > +     u32 type2 =3D 0;=0A=
> > +     irq_flow_handler_t handler;=0A=
> > +     struct aspeed_gpio_g7 *gpio;=0A=
> > +     unsigned long flags;=0A=
> > +     void __iomem *addr;=0A=
> > +     int rc, offset;=0A=
> > +=0A=
> > +     rc =3D irqd_to_aspeed_gpio_g7_data(d, &gpio, &offset);=0A=
> > +     if (rc)=0A=
> > +             return -EINVAL;=0A=
> > +     addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);=0A=
> > +=0A=
> > +     switch (type & IRQ_TYPE_SENSE_MASK) {=0A=
> > +     case IRQ_TYPE_EDGE_BOTH:=0A=
> > +             type2 =3D 1;=0A=
> > +             fallthrough;=0A=
> > +     case IRQ_TYPE_EDGE_RISING:=0A=
> > +             type0 =3D 1;=0A=
> > +             fallthrough;=0A=
> > +     case IRQ_TYPE_EDGE_FALLING:=0A=
> > +             handler =3D handle_edge_irq;=0A=
> > +             break;=0A=
> > +     case IRQ_TYPE_LEVEL_HIGH:=0A=
> > +             type0 |=3D 1;=0A=
> > +             fallthrough;=0A=
> > +     case IRQ_TYPE_LEVEL_LOW:=0A=
> > +             type1 |=3D 1;=0A=
> > +             handler =3D handle_level_irq;=0A=
> > +             break;=0A=
> > +     default:=0A=
> > +             return -EINVAL;=0A=
> > +     }=0A=
> > +=0A=
> > +     raw_spin_lock_irqsave(&gpio->lock, flags);=0A=
> > +=0A=
> > +     ast_write_bits(addr, GPIO_G7_IRQ_TYPE2, type2);=0A=
> > +     ast_write_bits(addr, GPIO_G7_IRQ_TYPE1, type1);=0A=
> > +     ast_write_bits(addr, GPIO_G7_IRQ_TYPE0, type0);=0A=
=0A=
> Can we write them as a field in the one call? They're all in the same=0A=
> register, which was not true in the previous controller register=0A=
> layout.=0A=
=0A=
Okay.=0A=
=0A=
> > +=0A=
> > +     raw_spin_unlock_irqrestore(&gpio->lock, flags);=0A=
> > +=0A=
> > +     irq_set_handler_locked(d, handler);=0A=
> > +=0A=
> > +     return 0;=0A=
> > +}=0A=
> > +=0A=
> > +static void aspeed_gpio_g7_irq_handler(struct irq_desc *desc)=0A=
> > +{=0A=
> > +     struct gpio_chip *gc =3D irq_desc_get_handler_data(desc);=0A=
> > +     struct irq_chip *ic =3D irq_desc_get_chip(desc);=0A=
> > +     unsigned int i, p, banks;=0A=
> > +     unsigned long reg;=0A=
> > +     struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(gc);=0A=
> > +     void __iomem *addr;=0A=
> > +=0A=
> > +     chained_irq_enter(ic, desc);=0A=
> > +=0A=
> > +     banks =3D DIV_ROUND_UP(gpio->chip.ngpio, 32);=0A=
> > +     for (i =3D 0; i < banks; i++) {=0A=
> > +             addr =3D gpio->base + GPIO_G7_IRQ_STS_OFFSET(i);=0A=
> > +=0A=
> > +             reg =3D ioread32(addr);=0A=
> > +=0A=
> > +             for_each_set_bit(p, &reg, 32)=0A=
> > +                     generic_handle_domain_irq(gc->irq.domain, i * 32 =
+ p);=0A=
> > +     }=0A=
> > +=0A=
> > +     chained_irq_exit(ic, desc);=0A=
> > +}=0A=
=0A=
> The only thing that's different for the IRQ status handling is the=0A=
> spread of the registers in the layout. In terms of the bits in each=0A=
> bank's IRQ status register, the layout is the same. By implementing the=
=0A=
> means to locate the status register as a callback this code could be=0A=
> common between the drivers.=0A=
=0A=
> > +=0A=
> > +static void aspeed_init_irq_valid_mask(struct gpio_chip *gc, unsigned =
long *valid_mask,=0A=
> > +                                    unsigned int ngpios)=0A=
> > +{=0A=
> > +     struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(gc);=0A=
> > +     const struct aspeed_bank_props *props =3D gpio->config->props;=0A=
> > +=0A=
> > +     while (!is_bank_props_sentinel(props)) {=0A=
> > +             unsigned int offset;=0A=
> > +             const unsigned long input =3D props->input;=0A=
> > +=0A=
> > +             /* Pretty crummy approach, but similar to GPIO core */=0A=
> > +             for_each_clear_bit(offset, &input, 32) {=0A=
> > +                     unsigned int i =3D props->bank * 32 + offset;=0A=
> > +=0A=
> > +                     if (i >=3D gpio->chip.ngpio)=0A=
> > +                             break;=0A=
> > +=0A=
> > +                     clear_bit(i, valid_mask);=0A=
> > +             }=0A=
> > +=0A=
> > +             props++;=0A=
> > +     }=0A=
> > +}=0A=
=0A=
> This is the same except for the change to use `struct aspeed_gpio_g7`?=0A=
> Can we make this common?=0A=
=0A=
> > +=0A=
> > +static int aspeed_gpio_g7_reset_tolerance(struct gpio_chip *chip, unsi=
gned int offset, bool enable)=0A=
> > +{=0A=
> > +     struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(chip);=0A=
> > +     unsigned long flags;=0A=
> > +     void __iomem *addr;=0A=
> > +=0A=
> > +     addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);=0A=
> > +=0A=
> > +     raw_spin_lock_irqsave(&gpio->lock, flags);=0A=
> > +=0A=
> > +     if (enable)=0A=
> > +             ast_write_bits(addr, GPIO_G7_RST_TOLERANCE, 1);=0A=
> > +     else=0A=
> > +             ast_clr_bits(addr, GPIO_G7_RST_TOLERANCE);=0A=
> > +=0A=
> > +     raw_spin_unlock_irqrestore(&gpio->lock, flags);=0A=
> > +=0A=
> > +     return 0;=0A=
> > +}=0A=
> > +=0A=
> > +static int aspeed_gpio_g7_request(struct gpio_chip *chip, unsigned int=
 offset)=0A=
> > +{=0A=
> > +     if (!have_gpio(gpiochip_get_data(chip), offset))=0A=
> > +             return -ENODEV;=0A=
> > +=0A=
> > +     return pinctrl_gpio_request(chip->base + offset);=0A=
=0A=
> pinctrl_gpio_request() takes the chip and the offset value separately.=0A=
> It looks like you've developed this patch against an older kernel tree?=
=0A=
=0A=
I will fix it.=0A=
=0A=
> > +}=0A=
> > +=0A=
> > +static void aspeed_gpio_g7_free(struct gpio_chip *chip, unsigned int o=
ffset)=0A=
> > +{=0A=
> > +     pinctrl_gpio_free(chip->base + offset);=0A=
=0A=
> Same as above for pinctrl_gpio_free().=0A=
=0A=
I will fix it.=0A=
=0A=
> > +}=0A=
> > +=0A=
> > +static int usecs_to_cycles(struct aspeed_gpio_g7 *gpio, unsigned long =
usecs, u32 *cycles)=0A=
> > +{=0A=
> > +     u64 rate;=0A=
> > +     u64 n;=0A=
> > +     u32 r;=0A=
> > +=0A=
> > +     rate =3D clk_get_rate(gpio->clk);=0A=
> > +     if (!rate)=0A=
> > +             return -EOPNOTSUPP;=0A=
> > +=0A=
> > +     n =3D rate * usecs;=0A=
> > +     r =3D do_div(n, 1000000);=0A=
> > +=0A=
> > +     if (n >=3D U32_MAX)=0A=
> > +             return -ERANGE;=0A=
> > +=0A=
> > +     /* At least as long as the requested time */=0A=
> > +     *cycles =3D n + (!!r);=0A=
> > +=0A=
> > +     return 0;=0A=
> > +}=0A=
> > +=0A=
> > +/* Call under gpio->lock */=0A=
> > +static int register_allocated_timer(struct aspeed_gpio_g7 *gpio, unsig=
ned int offset,=0A=
> > +                                 unsigned int timer)=0A=
> > +{=0A=
> > +     if (WARN(gpio->offset_timer[offset] !=3D 0, "Offset %d already al=
located timer %d\n", offset,=0A=
> > +              gpio->offset_timer[offset]))=0A=
> > +             return -EINVAL;=0A=
> > +=0A=
> > +     if (WARN(gpio->timer_users[timer] =3D=3D UINT_MAX, "Timer user co=
unt would overflow\n"))=0A=
> > +             return -EPERM;=0A=
> > +=0A=
> > +     gpio->offset_timer[offset] =3D timer;=0A=
> > +     gpio->timer_users[timer]++;=0A=
> > +=0A=
> > +     return 0;=0A=
> > +}=0A=
> > +=0A=
> > +/* Call under gpio->lock */=0A=
> > +static int unregister_allocated_timer(struct aspeed_gpio_g7 *gpio, uns=
igned int offset)=0A=
> > +{=0A=
> > +     if (WARN(gpio->offset_timer[offset] =3D=3D 0, "No timer allocated=
 to offset %d\n", offset))=0A=
> > +             return -EINVAL;=0A=
> > +=0A=
> > +     if (WARN(gpio->timer_users[gpio->offset_timer[offset]] =3D=3D 0,=
=0A=
> > +              "No users recorded for timer %d\n", gpio->offset_timer[o=
ffset]))=0A=
> > +             return -EINVAL;=0A=
> > +=0A=
> > +     gpio->timer_users[gpio->offset_timer[offset]]--;=0A=
> > +     gpio->offset_timer[offset] =3D 0;=0A=
> > +=0A=
> > +     return 0;=0A=
> > +}=0A=
> > +=0A=
> > +/* Call under gpio->lock */=0A=
> > +static inline bool timer_allocation_registered(struct aspeed_gpio_g7 *=
gpio, unsigned int offset)=0A=
> > +{=0A=
> > +     return gpio->offset_timer[offset] > 0;=0A=
> > +}=0A=
=0A=
> The above functions have all been copy/pasted, can we make them common?=
=0A=
=0A=
> > +=0A=
> > +static void configure_timer(struct aspeed_gpio_g7 *gpio, unsigned int =
offset, unsigned int timer)=0A=
> > +{=0A=
> > +     void __iomem *addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offse=
t);=0A=
> > +=0A=
> > +     /* Note: Debounce timer isn't under control of the command=0A=
> > +      * source registers, so no need to sync with the coprocessor=0A=
> > +      */=0A=
> > +     ast_write_bits(addr, GPIO_G7_DEBOUNCE_SEL, timer);=0A=
> > +}=0A=
> > +=0A=
> > +static int enable_debounce(struct gpio_chip *chip, unsigned int offset=
, unsigned long usecs)=0A=
> > +{=0A=
> > +     struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(chip);=0A=
> > +     u32 requested_cycles;=0A=
> > +     unsigned long flags;=0A=
> > +     int rc;=0A=
> > +     int i;=0A=
> > +=0A=
> > +     if (!gpio->clk)=0A=
> > +             return -EINVAL;=0A=
> > +=0A=
> > +     rc =3D usecs_to_cycles(gpio, usecs, &requested_cycles);=0A=
> > +     if (rc < 0) {=0A=
> > +             dev_warn(chip->parent, "Failed to convert %luus to cycles=
 at %luHz: %d\n", usecs,=0A=
> > +                      clk_get_rate(gpio->clk), rc);=0A=
> > +             return rc;=0A=
> > +     }=0A=
> > +=0A=
> > +     raw_spin_lock_irqsave(&gpio->lock, flags);=0A=
> > +=0A=
> > +     if (timer_allocation_registered(gpio, offset)) {=0A=
> > +             rc =3D unregister_allocated_timer(gpio, offset);=0A=
> > +             if (rc < 0)=0A=
> > +                     goto out;=0A=
> > +     }=0A=
> > +=0A=
> > +     /* Try to find a timer already configured for the debounce period=
 */=0A=
> > +     for (i =3D 1; i < ARRAY_SIZE(debounce_timers); i++) {=0A=
> > +             u32 cycles;=0A=
> > +=0A=
> > +             cycles =3D ioread32(gpio->base + debounce_timers[i]);=0A=
> > +             if (requested_cycles =3D=3D cycles)=0A=
> > +                     break;=0A=
> > +     }=0A=
> > +=0A=
> > +     if (i =3D=3D ARRAY_SIZE(debounce_timers)) {=0A=
> > +             int j;=0A=
> > +=0A=
> > +             /*=0A=
> > +              * As there are no timers configured for the requested de=
bounce=0A=
> > +              * period, find an unused timer instead=0A=
> > +              */=0A=
> > +             for (j =3D 1; j < ARRAY_SIZE(gpio->timer_users); j++) {=
=0A=
> > +                     if (gpio->timer_users[j] =3D=3D 0)=0A=
> > +                             break;=0A=
> > +             }=0A=
> > +=0A=
> > +             if (j =3D=3D ARRAY_SIZE(gpio->timer_users)) {=0A=
> > +                     dev_warn(chip->parent,=0A=
> > +                              "Debounce timers exhausted, cannot debou=
nce for period %luus\n",=0A=
> > +                              usecs);=0A=
> > +=0A=
> > +                     rc =3D -EPERM;=0A=
> > +=0A=
> > +                     /*=0A=
> > +                      * We already adjusted the accounting to remove @=
offset=0A=
> > +                      * as a user of its previous timer, so also confi=
gure=0A=
> > +                      * the hardware so @offset has timers disabled fo=
r=0A=
> > +                      * consistency.=0A=
> > +                      */=0A=
> > +                     configure_timer(gpio, offset, 0);=0A=
> > +                     goto out;=0A=
> > +             }=0A=
> > +=0A=
> > +             i =3D j;=0A=
> > +=0A=
> > +             iowrite32(requested_cycles, gpio->base + debounce_timers[=
i]);=0A=
> > +     }=0A=
> > +=0A=
> > +     if (WARN(i =3D=3D 0, "Cannot register index of disabled timer\n")=
) {=0A=
> > +             rc =3D -EINVAL;=0A=
> > +             goto out;=0A=
> > +     }=0A=
> > +=0A=
> > +     register_allocated_timer(gpio, offset, i);=0A=
> > +     configure_timer(gpio, offset, i);=0A=
> > +=0A=
> > +out:=0A=
> > +     raw_spin_unlock_irqrestore(&gpio->lock, flags);=0A=
> > +=0A=
> > +     return rc;=0A=
> > +}=0A=
> > +=0A=
> > +static int disable_debounce(struct gpio_chip *chip, unsigned int offse=
t)=0A=
> > +{=0A=
> > +     struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(chip);=0A=
> > +     unsigned long flags;=0A=
> > +     int rc;=0A=
> > +=0A=
> > +     raw_spin_lock_irqsave(&gpio->lock, flags);=0A=
> > +=0A=
> > +     rc =3D unregister_allocated_timer(gpio, offset);=0A=
> > +     if (!rc)=0A=
> > +             configure_timer(gpio, offset, 0);=0A=
> > +=0A=
> > +     raw_spin_unlock_irqrestore(&gpio->lock, flags);=0A=
> > +=0A=
> > +     return rc;=0A=
> > +}=0A=
> > +=0A=
> > +static int set_debounce(struct gpio_chip *chip, unsigned int offset, u=
nsigned long usecs)=0A=
> > +{=0A=
> > +     struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(chip);=0A=
> > +=0A=
> > +     if (!have_debounce(gpio, offset))=0A=
> > +             return -EOPNOTSUPP;=0A=
> > +=0A=
> > +     if (usecs)=0A=
> > +             return enable_debounce(chip, offset, usecs);=0A=
> > +=0A=
> > +     return disable_debounce(chip, offset);=0A=
> > +}=0A=
=0A=
> These are all copy/pasted, save for changing to `struct=0A=
> aspeed_gpio_g7`. Can we make them common?=0A=
=0A=
> > +=0A=
> > +static int aspeed_gpio_g7_set_config(struct gpio_chip *chip, unsigned =
int offset,=0A=
> > +                                  unsigned long config)=0A=
> > +{=0A=
> > +     unsigned long param =3D pinconf_to_config_param(config);=0A=
> > +     u32 arg =3D pinconf_to_config_argument(config);=0A=
> > +=0A=
> > +     if (param =3D=3D PIN_CONFIG_INPUT_DEBOUNCE)=0A=
> > +             return set_debounce(chip, offset, arg);=0A=
> > +     else if (param =3D=3D PIN_CONFIG_BIAS_DISABLE || param =3D=3D PIN=
_CONFIG_BIAS_PULL_DOWN ||=0A=
> > +              param =3D=3D PIN_CONFIG_DRIVE_STRENGTH)=0A=
> > +             return pinctrl_gpio_set_config(offset, config);=0A=
> > +     else if (param =3D=3D PIN_CONFIG_DRIVE_OPEN_DRAIN || param =3D=3D=
 PIN_CONFIG_DRIVE_OPEN_SOURCE)=0A=
> > +             /* Return -EOPNOTSUPP to trigger emulation, as per datash=
eet */=0A=
> > +             return -EOPNOTSUPP;=0A=
> > +     else if (param =3D=3D PIN_CONFIG_PERSIST_STATE)=0A=
> > +             return aspeed_gpio_g7_reset_tolerance(chip, offset, arg);=
=0A=
> > +=0A=
> > +     return -EOPNOTSUPP;=0A=
> > +}=0A=
=0A=
> This is copy/paste, save for the call to=0A=
> aspeed_gpio_g7_reset_tolerance(). Can we make it common?=

