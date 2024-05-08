Return-Path: <linux-gpio+bounces-6229-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD998BF9AA
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 11:41:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFAE81C21AE9
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 09:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0725762D7;
	Wed,  8 May 2024 09:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="fOXsKAVz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2087.outbound.protection.outlook.com [40.107.21.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8394B47F41;
	Wed,  8 May 2024 09:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715161289; cv=fail; b=tKY2Hjs8CBr5y6EIpqBXQHiiVyLl0F7cgXYpolnIcXB1/GmpOGKTcwK2aixrar8A0N75xLYnNA1OizuFTM18bu576cYhfI7S0t4U1ZykPkOfsDcwQL+3M1GhUMG3Pr5ccUnoXYDxxpGMQjNf4hp7XNZeAg1y/0uv+gnwxYS8MHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715161289; c=relaxed/simple;
	bh=PCRbTeWC/gcD7jV58UMX34F+ayl2OewEv/HdA/d34cE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jmbqZPXypbFTcMbfoKJfIyMWYwWsbk1pe/+co6g/he7D7gafUA1YeJVbs6108GNtg45q9OSc+2azewezyZmyPx8Fkqh/bK4Rwaj5v0BxibX2wyUDSgHno4RQd/kl1T3N3We0noXd1NmVcsc+JQV/hqE02AdQ5NH8Tpfecervt0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=fOXsKAVz; arc=fail smtp.client-ip=40.107.21.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GohoXQcoMubFR82OtbzBul3v/m/Mfav3SG7H3rYUWPff3vkgIuF1Anp6zyj0HVpk1yVyScnhiadOknnEQqciBx3lKhYmLATXkPBD0poV+0vYIkCHLH//4LmjwEPMSuOoMlXjezpl6oPelDO7Yd2rpJM01fpDaPe7pFtrAFIyglEm1f76jzQnP6jVxAE5jGCWYvWcWX5GyVLoPNZ8rM5zHAuEidH+Kg3Z8MSa42P74aEUCS42rMPZmnERTFgYn6F9MPLs/XlRqQY+xYMFZlP8oL3YqnW4NXXvWbWyGhO5nbZAHU7K8PwZUSJFNhntZw3kgiavXzPEstWmZ3qza3Z7Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCRbTeWC/gcD7jV58UMX34F+ayl2OewEv/HdA/d34cE=;
 b=lhLn+jOnE14U8UAMcEN814yj3asYiyhPvgdxk10gu16YS2UgU8Lt8d09oXjadhyeeiMYQgKmbzCHAW+o2U9j8ygOzbF0vjbOAslZgcP0O3dI+wNudxayrGP1PcnC39nHiNb2HFo9itcySwvg+Xu39sH5aaZuUA49f2nOEKVfWbWuO+qek6oKBU5f/8eHxnYi5q2kqZGL26xOJPjHtKnBiADAl/g3ZiT9FxrTbO8CIj18o3/LOoV5YIxG3VcsJRuVDolwj3wnvxXeDwnFvOSl1y2ZBn306YdnPxg2B6JJC2H2yRZepArBNYy/PtLKy/Iltmc+Wq25UVIFEKu9JmbLxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCRbTeWC/gcD7jV58UMX34F+ayl2OewEv/HdA/d34cE=;
 b=fOXsKAVzfvePgXBgk2b6azK96qG7KK26A/P9hj8v3bwdvFt0kL0esUNgZC4r0xhdbLcR2b/FtPqh9TcX5Kq+ZD6w6P9NM7uId/OknQQ/IRQe2n5TkxSNjuLQPhcXu2BfdtZaVculLB6rI8F4YXlqpciLFIZoVFHIRkCOGC3H0Nc=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DUZPR04MB9967.eurprd04.prod.outlook.com (2603:10a6:10:4dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Wed, 8 May
 2024 09:41:24 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 09:41:24 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Cristian Marussi <cristian.marussi@arm.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
	Aisheng Dong <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH v5 0/3] pinctrl: scmi: support i.MX95 OEM extensions
Thread-Topic: [PATCH v5 0/3] pinctrl: scmi: support i.MX95 OEM extensions
Thread-Index: AQHaoPc+EplymBzv+UOcaM7zveyY+bGNDeaAgAAFlBA=
Date: Wed, 8 May 2024 09:41:24 +0000
Message-ID:
 <DU0PR04MB94170BB9A2C41DE40C8F575288E52@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240508-pinctrl-scmi-oem-v3-v5-0-6f2b167f71bc@nxp.com>
 <ZjtCGXgwgtZ4X49v@bogus>
In-Reply-To: <ZjtCGXgwgtZ4X49v@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|DUZPR04MB9967:EE_
x-ms-office365-filtering-correlation-id: c22d5a0c-c6f3-4285-151d-08dc6f43066a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|1800799015|7416005|366007|376005|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?cUObl8nziLalXW6DUKFJP11yhWzo27sMDVcWjDJ0xm9d3POWxU0yER3EnXG6?=
 =?us-ascii?Q?v8OK0zgARX33Ru2a/F7+nwaJhLVKde0g7NtMTjyUFdCY2CExWNmsA0nmRog4?=
 =?us-ascii?Q?75R4daNVwb1Cg5Tkqf0tH2RCh7kVbkDNfxwkatmuan1blB0wUFPoiTsjzmSm?=
 =?us-ascii?Q?ZG5bqvsEp2D7hdDdksHPlkgepyMnI882T1AVr7ZLeA4w14v99KjEjnwXUNvq?=
 =?us-ascii?Q?KEgite+P46211SGNQFSACfre1QhS6wGyFjdLd4LjOJ6qSRmuW65P+gWKrHQp?=
 =?us-ascii?Q?mnCIq9M8XneOdJKHqVW0UnPuE4tJigxeWtXbuK6Sh2AoGYyTrIA3C5q+ji7s?=
 =?us-ascii?Q?AxbK+MGyHYpZwkeH2b+MNXvuQeaxNRlGOlPEKIzrYclBBZ9LHccLpemMvIfg?=
 =?us-ascii?Q?NIeDrFPcWDZbl1W8V64qOaQAmsFZEJbEq/VlHt3RobqlIZGnmVRn5SB7z7/M?=
 =?us-ascii?Q?tTaO1zUk5F7dMklSJ3JmzMm679Qytw9H535IUvVdqDgeVqRZG+TELyEKzx/S?=
 =?us-ascii?Q?jZq+BbeAuH2PF6oH52ZwEuTa6WlwWHMduad9zwORTJ0yCHKBiUn8PNArZbYf?=
 =?us-ascii?Q?rciPt0DwBOKqqkuM3BnLi9uki3gXOUD0jvW87tsrMPGT1ES9MWlTikwI0ehb?=
 =?us-ascii?Q?ZnCKxmegY515mtnqDTczSMgTOq4U9r1V8ZhGG/VxOXpwtv+5jyIug/qKHiEd?=
 =?us-ascii?Q?N/xiygwfuQZk9h4jigY+C6EE4D1lY+Ug3z0X/sAF0K9X1u9m+9LUnPjL3JG7?=
 =?us-ascii?Q?pXl5MMhV8d+NNeUPs5nUt/Lpf8P4/czrQVwCy66DHBhtsjk+FIMytkF4abYw?=
 =?us-ascii?Q?CA1F8Ddc65ytZl3Cx9VUUAR/MM6JpcqLqG4N1fN1/w4NmnUD0nd3XU2frzxO?=
 =?us-ascii?Q?+Ntcn2Q01zzSxpv/hXvhlUjk+ZFpw/OJ5yQI8+aUXXKu4Zg3cZM6V6MYYIvQ?=
 =?us-ascii?Q?xYOHGb7yv9PBbHV7TFzKAEj53veu5Ukaj5h6i5slxPU+PEnXFZmdy/3EsOfW?=
 =?us-ascii?Q?YScD2PIiOgysbrz6JILYzewSafyBSdLPJdO55u1dQBXWhMdZBiQKIH6ftDKI?=
 =?us-ascii?Q?VA1g/JRipQ+PJui2l7KVEzaqvGrGPMZNGH5IYsqtigfttyeoVFuAvIjc0gZ5?=
 =?us-ascii?Q?p67PmiIVPGEcAGXuDgO/BAyLXJj8rrQ4lrsdXBFtPI2e6CPo2kWC5VD3CMaA?=
 =?us-ascii?Q?KNQCkpsaFBhHK0Kcmh2C5TG1/26GVoTlpH9L08S/K2Rk008SSIQPJh+QfcuG?=
 =?us-ascii?Q?pMvhTghDhr8zj/7xYLGJBm1klQZ9vZ489rKt/RXk9gw1c91ieVV3hhVcp2Ep?=
 =?us-ascii?Q?pwx1vcJNvsgxsg2xxq/Mi1JiYd91JmHvctj+02XeQA/C7Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BwL/Wv2ccgyTjseo0ZaZK2+LjIOxc+ctPuCF13mu7ciThQqwQkvtHNag+yeg?=
 =?us-ascii?Q?/9fHNobMakXS3+LSq3enJkI9Qkf/zlbARDv5NLhdeP1KaZsf2CXLiDd5NlBo?=
 =?us-ascii?Q?AFmG3Yzkd5CNGjiNqHeD2VJpmXMu/dGHsBL2dfB/wFzLWRQQ2WV0+Pc2W3C1?=
 =?us-ascii?Q?oY6iTepRfEvdqZuC1ojmj6SVi4Qx1GPNDvD7TUFX94Zz/WfaEOHIuxgxABYE?=
 =?us-ascii?Q?RTy4DIzaTfIVyb+KKkAClUCOY9H45BfY3o7QGwrV15qlsiz7hhS6L+hlAJi3?=
 =?us-ascii?Q?hvde7x2CFa01c8j9P3YuWvFb7RujGXmU0e9ykd9PVsVALqjCipCNNcbm0n8R?=
 =?us-ascii?Q?M7K/UBfoxekWSp1kWdIaHS20ABkxNxvv6oOKo7sNOPmlzIkdk7p1/JkvlvEz?=
 =?us-ascii?Q?xkskHDDBfWzvC3H9wcjAuOcMqayV4LJcRD6Al8o0UgVVpMbtIx1IHisrkL1v?=
 =?us-ascii?Q?vt/K/gdD7SHvz+pxpqAWVBu2u8mIJS4aDcCWNVbdc5qRga5j/jr8joQFb7gr?=
 =?us-ascii?Q?tfWMZA0IkB3is0QvoMywtA6/dN+r5Voc9elwyqGZoHuQrxUBt/jh2VeBcKQL?=
 =?us-ascii?Q?6DnuCEeDYIYXV0RntqOA4LFz6w6hXv/5v5+QRL00ITEo4bH5Vp0HBmLRIk1O?=
 =?us-ascii?Q?XdW77IZXZ1gbLS6ya6ZVlCPwII1LGTKdL+SefuQ5PaaiZdvqA9Ma6m/taCl4?=
 =?us-ascii?Q?seA4ZqD2+NS7e4HPDCutOu0dmnphUn+MgZfpWXI1aWP69MqEZq6DHz1BUwhV?=
 =?us-ascii?Q?rauny9TQfiz0iyVjdElb0NJfyeVTsQteZYZkSUnthwAoqr1rsVQxBrxBDmBq?=
 =?us-ascii?Q?RJiRqp3hxvJcfAefvXHDgZyHEeE5NIsh9Outhc4EqkDSpu80TSVjEyJCsW3N?=
 =?us-ascii?Q?wL7TAxwtKONpKki1rXrAQDqa67dGVIzdBpcGsRHM3s/6o9ACH2oSe0MOvIvv?=
 =?us-ascii?Q?ktUuotrQN+ofWkxsrFA6JTcypWytaNv4VX/z9msEwElMfgQexJzaW6E9GHrv?=
 =?us-ascii?Q?AAADjNIKD3JZ0cmC4hUX2AB03Fm4tPaCo2BFRXqXk+1+mHyqrHKtBsCXmyBX?=
 =?us-ascii?Q?a5zBiRDv/YjXwwoRkkcQTa03p7Qexus6yZrdVq9ND9dorhdg1Dbbl0OGIQCt?=
 =?us-ascii?Q?QYrguM+lWeZYzcU+3N+mYD32gd3Evp1apZLfQ789+mcPfBxo8GvqVGz3ka3e?=
 =?us-ascii?Q?eNRlzM+Io4nNwJrSBqJ95WGcsct2LNjWgqkOGEn/33yeZxyeOrLz0EE6Jqz/?=
 =?us-ascii?Q?G79GHWGxnVFAxKQMpWjp+LBjzY19OUarEzXSUbBmdBaP78tmZswS9cuN5gT9?=
 =?us-ascii?Q?zMDxOsc0Y6CM3PtnbZsSYqmpM++pNk+GqPLNBhESNQcL5CKm76lMzp5cQNao?=
 =?us-ascii?Q?YDzpbWbRMxcK50lgRx4TABnZRhux8/iFfQm8YVmhstxGJopKtQmleM3kDJ/4?=
 =?us-ascii?Q?bvqGos1zu2kbg86R3N2WyeXWokMahWHeLON6V/6ByoXouK6WXpUQbVC+Yuaq?=
 =?us-ascii?Q?8m0MZq94T2rysOMViAwWhVaIfnELm6nSQ6MpD7DMY5bsslxjCZUm3BHWrmsF?=
 =?us-ascii?Q?NgBr1T2A7jwDXaEsdwA=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c22d5a0c-c6f3-4285-151d-08dc6f43066a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2024 09:41:24.0634
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8izIXGo0HJPrwaty7PKUjnSR0SBHz5mDF4YT/RUAFJf2iOE7oyjN7dTdNN2V+L80OC55XB/sPSSPYuTQYisVkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9967

Hi Sudeep,

> Subject: Re: [PATCH v5 0/3] pinctrl: scmi: support i.MX95 OEM extensions
>=20
> On Wed, May 08, 2024 at 11:32:01AM +0800, Peng Fan (OSS) wrote:
> > ARM SCMI v3.2 Table 24 Pin Configuration Type and Enumerations:
> > '192 -255 OEM specific units'.
> >
> > i.MX95 System Manager FW supports SCMI PINCTRL protocol, but it has
> > zero functions, groups. So pinctrl-scmi.c could not be reused for i.MX9=
5.
> > Because nxp,pin-func, nxp,pin-conf properties are rejected by dt
> > maintainers, so use generic property 'pinmux' which requires a new
> > driver pinctrl-imx-scmi.c
> >
>=20
> Not a review in particular, but if we decide to merge this deviation, it =
must be
> under the condition that it can be deleted anytime in the future if this
> becomes annoyance(like other vendors using this as a way to deviate from
> the specification). If we can't agree with that, then we better not merge=
 this
> at all.

It is ok for me. I agree.
But actually this driver still follows Spec by using OEM extensions.

If in future, the spec adds something saying pinmux bit field, and pinctrl-=
scmi.c
supports it, we could drop the imx driver.

Thanks,
Peng.

>=20
> --
> Regards,
> Sudeep

