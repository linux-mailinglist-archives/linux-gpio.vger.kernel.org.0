Return-Path: <linux-gpio+bounces-9929-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8698972928
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2024 07:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 467E5286CBA
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2024 05:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13960176AA5;
	Tue, 10 Sep 2024 05:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="os7xTXYT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB09B172BD0;
	Tue, 10 Sep 2024 05:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725947903; cv=fail; b=F474xa/gfNqs0OFT7yPxNKk7/tOVwTyhNWgpyiHCeB/Pju2Jqr1rEQCCXngyY8fI46DXLzBgZntvsEbzyYe0kXX3JpN7FJ1qlIrJ1igumS/BxW6RtkI9baPkd1BYvrSNsIU16bEGRo9ejyziSY1qps0whv9Ftxdi8z5XEScEXoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725947903; c=relaxed/simple;
	bh=iaOuXS+fVSsHhv9j6s6liTK03IUdLk0SOY0hSlnMm+M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=alPIT0EPan8rUIZWapuqCb/pBwP4GS49WSxf76eG2X5R5D6lM2Pf4aIw+5TqdmfKZAsn7a6tvRtdkE8yoyc31L3P7KhDn/DcaoGHNnhV3RT2cuXX/SRskBaXnKsMad1EYA5lzKPde1E1mjsqYom7xpXpryvGzsnY3Fjsfv1SFXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=os7xTXYT; arc=fail smtp.client-ip=40.107.237.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8nOFw+FAsmGT4GklApFKcKd9oigRbpUlJHVTrqF63Uy0yZbD226koAVlHpfawEvmFi1bpoEYM6YmoASXxi2GvyHKn2mIy7qtsQnwhSj9aqTrduNNj9sgekl++xnn2qu2HpJ5sVk/xKdcEIKdkf6K9gXc7zbVEoWmSBKERmyQWyFoPUBpnQxrvUdIaFZRiec2IKQ5Ze7cGsky+tTruYNn0SoRMGhoQwE/7ojpD97fZlkKFgzFxN18S8EGY36S+bPLk+kpuHB4B0OdsT7wwoK5zuESIT8EHNepfz4Pvlj05OEfLkevyt9z7sDMJic814ZMqdBRzCF8xtSvFQJwLPvpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwBdpCbly9MCgfExB4X6EyfILp4tCZsXf2umR7ruAQI=;
 b=QAV/tUyoaTECb0u8KbwA2+tpVaayQq4D4XGKvaPgAhvZxQvszWvDxEvKESAub1unC9xbBbCWO3PtTYGvEWzsA1R92PZddV6ezeHL/S8mfliQmx558zXkNyeZ9arXmacSW/wad7kN55Riw42MDO/dr1psvtKWkxG/Ho0pK+m6lT3KktumBaW4zgnFHrocJDV1cdvqVKCts+xh7aqRBvwjLWLj30ADRDYyUOtL5zFYwD2RAPbCZ79LFVze3PEmeZaN86XLl3qEUdjv0HQm8DkP2gBlivH/isL+Z+5CA+5XmWs4e2Bp774EAjGN3lps5V1yvOtZTRVsMzrDQiW2UYNCEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwBdpCbly9MCgfExB4X6EyfILp4tCZsXf2umR7ruAQI=;
 b=os7xTXYTJCMfFgAXC759bjWdORygCTDPACUI8FIWj6ED+1N0GJ0qUHCBesL8UAP3J4XtyhdVk0m8CsSehMg+tgDVJIFVxO1OeJ+0/Dslr32y7iNQPmhMhLbUCD88LW+VMfpipMPNwS+nj8iUrv8zXtN7TujS12vf77DzISrsH7o=
Received: from BY5PR12MB4258.namprd12.prod.outlook.com (2603:10b6:a03:20d::10)
 by SN7PR12MB7297.namprd12.prod.outlook.com (2603:10b6:806:2ad::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 10 Sep
 2024 05:58:18 +0000
Received: from BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::3228:a925:2191:98b3]) by BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::3228:a925:2191:98b3%3]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 05:58:17 +0000
From: "Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>
To: "Thangaraj, Senthil Nathan" <SenthilNathan.Thangaraj@amd.com>, Linus
 Walleij <linus.walleij@linaro.org>, "Simek, Michal" <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "Buddhabhatti, Jay"
	<jay.buddhabhatti@amd.com>, "Kundanala, Praveen Teja"
	<praveen.teja.kundanala@amd.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "saikrishna12468@gmail.com"
	<saikrishna12468@gmail.com>, "git (AMD-Xilinx)" <git@amd.com>
Subject: RE: [PATCH v5 2/3] firmware: xilinx: Add Pinctrl Get Attribute ID
Thread-Topic: [PATCH v5 2/3] firmware: xilinx: Add Pinctrl Get Attribute ID
Thread-Index: AQHbAEwmSfoYnoTrIkarfEtwQpYksLJPs7MAgADVZYA=
Date: Tue, 10 Sep 2024 05:58:17 +0000
Message-ID:
 <BY5PR12MB42583098D3C9B0879596D571DB9A2@BY5PR12MB4258.namprd12.prod.outlook.com>
References: <20240906110113.3154327-1-sai.krishna.potthuri@amd.com>
 <20240906110113.3154327-3-sai.krishna.potthuri@amd.com>
 <LV3PR12MB92605EC32BE4F5AFA2949359E2992@LV3PR12MB9260.namprd12.prod.outlook.com>
In-Reply-To:
 <LV3PR12MB92605EC32BE4F5AFA2949359E2992@LV3PR12MB9260.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR12MB4258:EE_|SN7PR12MB7297:EE_
x-ms-office365-filtering-correlation-id: ff0315d9-0437-4dc3-9b67-08dcd15d9148
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?KimlCeE3X381mrgWy46B5NgfHT0yuj4bv/L4aK8DcVDWJHqroq6eVn4eR1Af?=
 =?us-ascii?Q?1WsOTxJ5uTdE5IHFuBy0gV6FTOUcSyWOwDBRwHB+W5s98n8L5Fm2Jlk4fcb/?=
 =?us-ascii?Q?NwUhdn8tDTdZb3jMlWuHNc7Ljdu2TRI/+v6pQ+AaDBQ+urojg/Zg9MFZB1RX?=
 =?us-ascii?Q?3OdtSVL9OTIUbHxnQeFRMi95w51s2l5XhClIYPKwQlgRyWTrXWt7bMs+bAKp?=
 =?us-ascii?Q?CcWKm3VJ1SahV1AmJg/QA8P8Gf+si6gdTH20lFgl9ezpWeTpLaxxqv38bR9N?=
 =?us-ascii?Q?Wid+iKbhSuNotYiAWozep9nsIOVEpf4z4R9w5Cz6B+cdK2FV0csetDdktfjx?=
 =?us-ascii?Q?+6cPVZk5l89BHZGTksBH2u7COQgYdxqPpVn3PRnQZf+tQjX7dMxKH+rCLy1m?=
 =?us-ascii?Q?0EIKy7isb2In7vaouYTDHO9frPHi0YFUCBKV3uW5flDyZZ+XVQoYtpCs06V9?=
 =?us-ascii?Q?qaIJs2RJAUau6NG5x8uSO2zd1L3bSm2WwEf3aX5kW63AcsF1ToJsf4rwHmi4?=
 =?us-ascii?Q?88wZmK2xG2L+oC+72JdioEeXHZlyNb0x7R+4XZMkb72wy8rgXCn506gpkNN3?=
 =?us-ascii?Q?mSw4opP5KhDSCdHbC5ujwNFW+1TpPkGm6lYWgyE86GVpDnXKMZCuWU1mAy5X?=
 =?us-ascii?Q?BhZPUyHaDifTWqrmcVUeFMyDzXIb3qP1loRQWWJQYQ2li8G1bNEcMrsPSsR2?=
 =?us-ascii?Q?uC/qfAzI2kYf1Qs6XenK7REPErQYHOFtMRW+IMSG06FwS3ib8oAgRriH/ZwA?=
 =?us-ascii?Q?srCVpSW2V5twpFIGeoXLH1WpZk1ARWV1D93rxNDSOU60m1EjYfeOj6aTLlJC?=
 =?us-ascii?Q?KpZ4LxkDodqXjz00vs2tfiHmIEqFKkM5EsEC4XLCbwBhYhCtrvnxU96MkHzz?=
 =?us-ascii?Q?7oumwVlHfsEpakIuyFXev/5uniVAChR57WMJdRc8JqdL7zjdYJ4Jt3HZDBJp?=
 =?us-ascii?Q?WnSJoLi40vPiQKSz/PS8f6JQhbFRqQBdYwLYiLNe4hgTtCKKEPg5uNUegi4L?=
 =?us-ascii?Q?/liiditWll+nFFfjTVniyQRJy4OZFYcHHVkDR6vmROeUZwoxx4zTXVIDcfkm?=
 =?us-ascii?Q?Tv5Y6c4js/40LWQ3SUmDHFgTQ4kBkcERsmjssxGzF77Bg9gjkuJTCZx55bmV?=
 =?us-ascii?Q?uu0AZQX7GRRWddNefRjTIEOKKFIot9DFp8VwNGWLIWUzLMTHtKSxb4QItcPz?=
 =?us-ascii?Q?CN+V7de2JgynQcnqPNMa9vWN+hxPXb+zY8AlfUux2Sj8hFIdhj1i8ZF987W/?=
 =?us-ascii?Q?uVmz5roFek39h9UFjI5T0YnWX+a4FUW4ggC3cwtA6numoF5xr9FjjXMim0Ki?=
 =?us-ascii?Q?tx59jhvNQUS8X1iiXQAqSoIdMz38d/Ins8qtl4EE9S0LG/c4g2BXNvRG52Ku?=
 =?us-ascii?Q?+Nbmv5Ds8gctikK/pF5WlHLkllBMri3VnukwjDG33dcJJ0/CnhHmnyde6pWk?=
 =?us-ascii?Q?dYZRmX9BZMs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4258.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?AqAenZtdBXYtgU3fkHA+By79Ny20h3KMmpdyuoXLNMh/HIr0378Sro5PakeF?=
 =?us-ascii?Q?IHfy/T/ZzuN+b2DOyeKsJjGFNuFl626FlxRp+u64inUCXm2v8hWBkmLuzLhp?=
 =?us-ascii?Q?S+RiewxzlmeJVNfa4BMsOt+HDJ8O7HiV1YQRblg2OtyopLvcWsC7rZMTJB8+?=
 =?us-ascii?Q?FSVvRT38luIQHPZDpDMLRCbHQqCU7cUcPQVJC2IJKCBpkaPtWqZiceb8gR1X?=
 =?us-ascii?Q?SuDYb3fgjo5Jcw1S86LBEc6+7wMUNZUgyCUu//OXf8cpqvD3c1OLsRW3tGQc?=
 =?us-ascii?Q?nkfnUF4RReKinpEwQCVOpa/CsCe3EJTjmwcsWrflElOfkxDXxby0lmW4cRaO?=
 =?us-ascii?Q?biyOTp0XQjZ0RjI8GAtUyl7+yOtqaQdsHG0n92EGYZJLs5pehe9/foYF7als?=
 =?us-ascii?Q?v24bg9/Bve3FO2zffnpSANI2x8ZvHy0qKM7tctgHydmC8Qn/X+XU5QTE/p2Y?=
 =?us-ascii?Q?EROKZEdb2/pbvTShn7kS33mJUiEa6YMdDw1AE1yo+OeSIwEVBsaqBlqkIHal?=
 =?us-ascii?Q?o7pwxCS2RLvHwHmsKeCDrxa2IySwXZvmrHdBCf6wz0aR7Z4HpVl1mVm+oAgW?=
 =?us-ascii?Q?ENBBhJSPGnzzU0l0VbxJV2hZNmd0H2SK5R0+Lrj9Ly/DjPDITh3ShhjtOX4G?=
 =?us-ascii?Q?YzCgaia0tBg/mJZWxe3qi4pS0XH84AQ+MAIteu0zNopCgErTCYfi0hskQTkT?=
 =?us-ascii?Q?EdRB+edNvQtYxARADhj6XYEq4l0hgDnmx29PmOsU2i6QnZ8l8R60zZ8OGqHj?=
 =?us-ascii?Q?025pgO8ZeDKWSp/Vx3XwABHPxE5xeu9ZaYVKHJRaD12JQtdEX0sdSUkQAMPK?=
 =?us-ascii?Q?21u5zmU29FGY5gPiSMGpvFg/BOOYteZsoAnYwsCQhhDWleHpps15i5j1Sw8R?=
 =?us-ascii?Q?DGJp8QBK0H6KPLt6SJV343rZpVRvXBQHrbIJYNflHXy+fq4ZlYDfpdREUD+q?=
 =?us-ascii?Q?lS9DceO4zc0eq8carT75bRQzYOmJ6+ln9OiyUhWZD4VkfFiNA11EuOoS7E39?=
 =?us-ascii?Q?AAoDiAK5ijJ2w/JbAbbpcl2dKnro/EVUxco9M31yKdGGk3g3jna33QWCE3Jo?=
 =?us-ascii?Q?Y0f/R0I7ENMEiD0EGTAdVUTC1xU1V/m7lXTa30ZuXUa7ga0Ng/XJbpBZ0dkB?=
 =?us-ascii?Q?3QXWrcx1pdJrzryklWUP04M4pJL00xdF5QRwabQzVd3KFGDmCENgYLcEJc3w?=
 =?us-ascii?Q?faABRtwwRy6j1xMDLlhHsCTRYk2/eIpLeOAImQjYJ49bK11gCyAQMoHL5pmG?=
 =?us-ascii?Q?P+jTq+x0PrdVdtqoXs2hRTZY6UIrLX8PbE2arY1Y0L9VuTbn1Roeme8UCqY0?=
 =?us-ascii?Q?u42ak0LLuGqHVCQKdSCw2ebZ76J21gGQ4YYjHFmddQ6/67rnfKgmjwTq/Pib?=
 =?us-ascii?Q?CzIjJ++unBjfEzwIS2Q+Z+3vryupXSJfCUW9JjD6GsfEzkXY/SaTyCquION1?=
 =?us-ascii?Q?eAA00Stp1DVRvOBwXZFM/dS7IiWqtmJ2V70REDtUoorxVHSmcL5GpBAAWUWa?=
 =?us-ascii?Q?+sfSdpL+AHFvZ6ge8X/2Hw5foaHhhqO0VOOhXjrI8PfJcHrhI4erNa1cIlQX?=
 =?us-ascii?Q?qMym3OqOqJsfZGKaYnc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4258.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff0315d9-0437-4dc3-9b67-08dcd15d9148
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2024 05:58:17.8785
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RvASCdbH3Q1XCLqwnuN+FWhoaAXVaOlsA0kPcbq7NJRV1myr0L+NM65PBXx1QlTb3IOKm3riQqjFpCRCgr7g/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7297

Hi Senthil,

> -----Original Message-----
> From: Thangaraj, Senthil Nathan <SenthilNathan.Thangaraj@amd.com>
> Sent: Monday, September 9, 2024 10:33 PM
> To: Potthuri, Sai Krishna <sai.krishna.potthuri@amd.com>; Linus Walleij
> <linus.walleij@linaro.org>; Simek, Michal <michal.simek@amd.com>; Rob
> Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
> Conor Dooley <conor+dt@kernel.org>; Buddhabhatti, Jay
> <jay.buddhabhatti@amd.com>; Kundanala, Praveen Teja
> <praveen.teja.kundanala@amd.com>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>
> Cc: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> linux-gpio@vger.kernel.org; devicetree@vger.kernel.org;
> saikrishna12468@gmail.com; git (AMD-Xilinx) <git@amd.com>; Potthuri, Sai
> Krishna <sai.krishna.potthuri@amd.com>
> Subject: RE: [PATCH v5 2/3] firmware: xilinx: Add Pinctrl Get Attribute I=
D
>=20
> Hi Sai Krishna,
>=20
> Please find my review below.
>=20
> Thanks,
> Senthil
>=20
> > -----Original Message-----
> > From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org>
> > On Behalf Of Sai Krishna Potthuri
> > Sent: Friday, September 6, 2024 4:01 AM
> > To: Linus Walleij <linus.walleij@linaro.org>; Simek, Michal
> > <michal.simek@amd.com>; Rob Herring <robh@kernel.org>; Krzysztof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
> > Buddhabhatti, Jay <jay.buddhabhatti@amd.com>; Kundanala, Praveen Teja
> > <praveen.teja.kundanala@amd.com>; Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org>
> > Cc: linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org; linux- gpio@vger.kernel.org;
> > devicetree@vger.kernel.org; saikrishna12468@gmail.com; git
> > (AMD-Xilinx) <git@amd.com>; Potthuri, Sai Krishna
> > <sai.krishna.potthuri@amd.com>
> > Subject: [PATCH v5 2/3] firmware: xilinx: Add Pinctrl Get Attribute ID
> >
> > Caution: This message originated from an External Source. Use proper
> > caution when opening attachments, clicking links, or responding.
> >
> >
> > Add Pinctrl Get Attribute ID to the query ids list.
> >
> > Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> > ---
> >  include/linux/firmware/xlnx-zynqmp.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/linux/firmware/xlnx-zynqmp.h
> > b/include/linux/firmware/xlnx-zynqmp.h
> > index d7d07afc0532..3b4ce4ec5d3f 100644
> > --- a/include/linux/firmware/xlnx-zynqmp.h
> > +++ b/include/linux/firmware/xlnx-zynqmp.h
> > @@ -238,6 +238,7 @@ enum pm_query_id {
> >         PM_QID_PINCTRL_GET_PIN_GROUPS =3D 11,
> >         PM_QID_CLOCK_GET_NUM_CLOCKS =3D 12,
> >         PM_QID_CLOCK_GET_MAX_DIVISOR =3D 13,
> > +       PM_QID_PINCTRL_GET_ATTRIBUTES =3D 15,
>=20
> Any reason why do you need to skip 14 and use 15 here ?
This is based on the ID defined in the Xilinx Platform Management Firmware.
Whatever the ID defined by the Xilinx firmware to handle this functionality=
,
the same ID is used here. ID 14 might be used for another query function bu=
t
Linux use cases might not be using it.

Regards
Sai Krishna


