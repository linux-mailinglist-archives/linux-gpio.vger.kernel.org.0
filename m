Return-Path: <linux-gpio+bounces-9975-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77673975912
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2024 19:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CD291C218FF
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2024 17:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF73B1B1D5F;
	Wed, 11 Sep 2024 17:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FwThThCp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAB4156993;
	Wed, 11 Sep 2024 17:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726074652; cv=fail; b=Iay5STfZBMcVKsY/ztrg+85IIx9Kw6I2hBb5cL8NlPkVi57Rpun34/OlXTwr2l7IfVq3GPnOqC4nhL3jaP4o6scCWRJC1gwAE9+lgyDz6t4XxypCfuI9+mwUfSwPQVrmfqCzY68ZEdfjeIg47HQsaSQ1GxAapISj2F13kcu+n+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726074652; c=relaxed/simple;
	bh=YAvtGvK9VMyEAcY/40aVtu+JQe+2FCGRTbNFKkXbN7U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=S82h3DQFSfoUTmEivnF8+fpHel8Q6HXK/dr+f3fDsSRR5RxawLRWx9V6kfxIVm4H/we2xuJgX86i3freavwNIcAKTeJH2gDFdFg89NMWZJOeysvZWjpCQvcQpMTwZtudxx9mNoBXIfTcDKXm7fNYtB4sz+z7tUzX7BYvQY+o29A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FwThThCp; arc=fail smtp.client-ip=40.107.93.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qoYbj1AJTNYm1bql5Vg/MbKKdp7Yil8kxK+OZr+16VIJYTatW0Ajw3ApnZ7vd5qQToxys4kQzvgg4rjiWceYAmzfFgEQ6fFsjHDjunOJgF2eWWjajKeZoqE6mLfuiE0z9berCYw/VvuiJh4Jma4eOhKiIDSzoOZzOSEzYSfG2D06kdaBqL0gWelJEfaWzFR7gaDgIqs8k8cNbml4Vst4tAGWa5EUG1MoZMXAWtA70unzSmXrmHSSOfEzFtBzdblqQJpT+dcYWD3UBIb6VivXqczBljlbQSWD8rbnURV/WeYFcNwrWi1pCTvFv4n33DQMv12VQruOwVwXlgFjrN9W3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPWfj9NUwUTmKjLCZkQhyM3nTyJBDmfQMPPCqYfBP7g=;
 b=kuvk+0A+PXRHfsRiGlfuVwhRBnROpnIESELawIV6GvlZZpGfqkK4gN0X00OBAE0aUTLq8Zwqxs9wncFkdNgKFDSUjI1F46N+nkZYeRWDzq1gEpPmx4XWczHkiz0TZLjKep0AkmPV69qCDfcAb9jjRqAnpOClBgQn61F7fa2TGN8SJD/B73VAYMyZ/rRcHDAfLxn1llXO+xP8DILWDXEjT3R504u0gNNjucuxEFf1uKcCtwl6ZHzbjInkCUaS0PY/xvOXw3g+/3ADDPr47zbdyxSFThBSk6LCfhhd4M9x6akRTfT9PeCKTeFmldl0dHZTp5oLfZ9yuiSwtB77SIvJuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPWfj9NUwUTmKjLCZkQhyM3nTyJBDmfQMPPCqYfBP7g=;
 b=FwThThCp0TtmgqEMhzCmOjUV4jruLcPKW14kLl1gpiIjZcf8NHmBJdb5sNGL6FJ2+OWIYBos51l8Y2+duMUfCpuLO8JvR+YuKyCK8G9Jwp8BrAPWViMidKLKTViGoZwb1Zj063CsBvLw/1qyUXqJ2vnK7pZkef29QnWX2MUjFmU=
Received: from LV3PR12MB9260.namprd12.prod.outlook.com (2603:10b6:408:1b4::21)
 by DS7PR12MB9043.namprd12.prod.outlook.com (2603:10b6:8:db::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.24; Wed, 11 Sep 2024 17:10:47 +0000
Received: from LV3PR12MB9260.namprd12.prod.outlook.com
 ([fe80::e5c3:25dc:f93:cb99]) by LV3PR12MB9260.namprd12.prod.outlook.com
 ([fe80::e5c3:25dc:f93:cb99%4]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 17:10:46 +0000
From: "Thangaraj, Senthil Nathan" <SenthilNathan.Thangaraj@amd.com>
To: "Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>, Linus Walleij
	<linus.walleij@linaro.org>, "Simek, Michal" <michal.simek@amd.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, "Buddhabhatti, Jay" <jay.buddhabhatti@amd.com>,
	"Kundanala, Praveen Teja" <praveen.teja.kundanala@amd.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "saikrishna12468@gmail.com"
	<saikrishna12468@gmail.com>, "git (AMD-Xilinx)" <git@amd.com>
Subject: RE: [PATCH v5 2/3] firmware: xilinx: Add Pinctrl Get Attribute ID
Thread-Topic: [PATCH v5 2/3] firmware: xilinx: Add Pinctrl Get Attribute ID
Thread-Index: AQHbAEyJrT3v9unufkywBhnPEm58+rJPsvOwgADZUICAAk4MEA==
Date: Wed, 11 Sep 2024 17:10:46 +0000
Message-ID:
 <LV3PR12MB9260FA686E776F856F4779C8E29B2@LV3PR12MB9260.namprd12.prod.outlook.com>
References: <20240906110113.3154327-1-sai.krishna.potthuri@amd.com>
 <20240906110113.3154327-3-sai.krishna.potthuri@amd.com>
 <LV3PR12MB92605EC32BE4F5AFA2949359E2992@LV3PR12MB9260.namprd12.prod.outlook.com>
 <BY5PR12MB42583098D3C9B0879596D571DB9A2@BY5PR12MB4258.namprd12.prod.outlook.com>
In-Reply-To:
 <BY5PR12MB42583098D3C9B0879596D571DB9A2@BY5PR12MB4258.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9260:EE_|DS7PR12MB9043:EE_
x-ms-office365-filtering-correlation-id: 57aa3d94-8102-49b7-aadc-08dcd284ad88
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?PgPKWYgjDrT7gnin2IyGCwageRb3VyH9wqwmnBBFRjkQeAStu1/YA6i5xFJc?=
 =?us-ascii?Q?cScU6fkCDkkkJSOT5PhGcdFBb83utpCfeih97C7v7A7Goer8INFGO8PIW1xG?=
 =?us-ascii?Q?0uvX5m9PQY/HVm5R1vwL0tf4v15LBSZaA0ly+ElDen6Gu2lkwKjDJ/sUDJlp?=
 =?us-ascii?Q?AoCJZM8zb+UAjzAiB/aWF7pO0tUCCN934gXU36UxRdKtQ86cSVdyZoELfdEn?=
 =?us-ascii?Q?cBPVyNBX9MB/il5zGMr/JJFb3o3hekaE1wg/2eSKKk6zmCtEe9qP3WH/yoRQ?=
 =?us-ascii?Q?fRDugmSQD+Hb78yqGNNk7TCrJhDtRsh0I32dZLi3YARqvh+Caeopi4I3gHZH?=
 =?us-ascii?Q?DYmPDAWokKLudvcBPhiKkYYM+1lasKKPkc2jg6LxnepZotsvoZSAlD9It2BX?=
 =?us-ascii?Q?MYPHliuOn2Uy3aZBfrAO2N+WkJgc0RGutih3h4GmMV+6U57HJTxzA8dthMaw?=
 =?us-ascii?Q?6vHj9hmdjUehkgTbwPrhFu3zvdFcvEmXzVmH1YDK1OM/KErAYPNmV7rPumdd?=
 =?us-ascii?Q?HzYA7T8dgM+ai/ixQ7bhkpt4CYseF5dWC4kClp6w6ZhiREhhFUrOAdszypXQ?=
 =?us-ascii?Q?wN91wgV58k0QXexND1EKhCEXqf4vdhW7fX8zGpISxY4zXz2OSP8uo3bELEQM?=
 =?us-ascii?Q?gNmFGHFovpdYw1KnyCe4HeHw+ioTnXYkl5RGmqaUKL8aThbYhvteX5s2F8aG?=
 =?us-ascii?Q?ZjKMVkW8D6uWi4oO49+lV2O3in++f7HQSlOgtVr9CVKv4fS0T35j/OQXMkl8?=
 =?us-ascii?Q?uRMwCDeUSBc6/dnuw1tWBpxQM08MG/AIl6ipZzqENBEstqVw4joCbz0uS9IR?=
 =?us-ascii?Q?QqPiLyZW0H+Y20XqpQ3l6gqjIseR1SBuY8/pLRwf3u/dWUIDIaXx4SiIHr/n?=
 =?us-ascii?Q?+Vu2DBNd+AnxLkdOFWYMabn+diFxn/IEe0auUnoE8MOUVjbJm+pd/aWiM4S/?=
 =?us-ascii?Q?bY5MhkFWzawfh7Gtjja2iJ9Os0Zqm8X8/lqBBxM7SScegdKxwEnhTOhm6BuS?=
 =?us-ascii?Q?XPf1bARYSpT+RGgaa57L48xPBVYGX/ZKtyvf9/rt6DOEowE/6dbG8GR8rua/?=
 =?us-ascii?Q?8ZdbTDj1utrBicaxHEdziqCuLjQkR4/rpaCxlxbaNZ4cntV/+9+opLXCUCSU?=
 =?us-ascii?Q?L0lZQM7+g8IbpKhj8eNnJCaNSibe6lTXoNWCrMkUfHSIF21VH5/16p2UJLi8?=
 =?us-ascii?Q?zvw9IKGPiiou+G9EU4RTnP1NZxqWwtKO51QbyzkG+F3MV5cc8WWImobvobak?=
 =?us-ascii?Q?+HcX40SiAugwGBz3dy8H9U6yBy9EXuzjySVmltvofZuNU1bnewCyFaLJ4WPL?=
 =?us-ascii?Q?zX/fJsMGeTtnSUVgIKPkJnChL3Ut2D05+cx49khr8VMBTSw3+IFwCdMO8rQH?=
 =?us-ascii?Q?kidA0pNQR7eTXEO/+ROhY1XsPlYjUYVjfb23YlK9vKTvKsfExRf19vnj0wg8?=
 =?us-ascii?Q?wUaBZH/Mirw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9260.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VKCI2Xog5GnFAcmsZfjECyWzHRnDBQo3IGJ9iqpaN9qi78Agp4adhW/MqGte?=
 =?us-ascii?Q?m//4s+Nb/o8VLCjdqDtuHh8SZkRSwURVOmn30y0KL//7VA+7rm93TI6QLYHk?=
 =?us-ascii?Q?R9nmd2BWX58zd05BbNCFZ31DfoXAnmgP3e1elF88lcucw6+rNLOvrgu5cjep?=
 =?us-ascii?Q?pC89qHWMh4/oIfgeyHg1ObNVvY5a6xwS8CFIYjB+ml8ss6AxoHsKkdt9QOy0?=
 =?us-ascii?Q?5XEPeVzOajvyX+RIF8IzTTBTizeA0NpCVE8wdBBAIMXoZY6K1+QNUVHv/KsS?=
 =?us-ascii?Q?jgSjIVWdjQFKt9E7T/3UNLMHJbGI3NXOOelNGRIfe8L+MExYbCGDFQ84qYU6?=
 =?us-ascii?Q?/NbWjAC4AHopCUrkYFmgkEp/KviFVrwJ1qV132OWxSuPahsELXDQmSFNjpa7?=
 =?us-ascii?Q?brbAyzvHH1sylFoYo/BgYCGc61qMsvEmDN7u+vB2KUAKSYHpqqzGGfpR0124?=
 =?us-ascii?Q?FOtVsNc3cDJjQDa66qJhiAv+O2xi0vqRFE442f5wLv8kKRP4r0vdjokBuzlc?=
 =?us-ascii?Q?DxYea+3c1TIdfvqCswgq3FhYzJby55hKug/sgp1x2j7N7Fb4rE4oAtmuWJhp?=
 =?us-ascii?Q?hwJxVQySf6YqGAcYkIW66DwnY0EQ4EWuoBy5wnh3NeftlelbKxkNuZVKq7UB?=
 =?us-ascii?Q?PAlkueuSoKx1ITkKl+0Drm071RbAiUxsYx2ykCNF708vLTH4fcZW1FkXB2lv?=
 =?us-ascii?Q?RK0DqbOY7+/JsGTVv9EZxqUoBQou1Mk1HnvlRWnvkS3dDgVkuoqw80n9LIKB?=
 =?us-ascii?Q?vObO/uOHfYaehsjQcgBfCIUsC8p2SH9+P3/xjcnCeehIQL3xJBziZfA/9BJU?=
 =?us-ascii?Q?+4bn3bySW/KdS8JTQODjqOafs70LaVi4V8LRiHrSooHKyYVUYO1Brmx6cqYL?=
 =?us-ascii?Q?hwGAyEAOa+bzwnX3wmXfh/IUDSsZWZdMP4xsD2h5vTbMvWDWtOp0GEImHVln?=
 =?us-ascii?Q?pcLLREHtqp9dKLzjeXV5Hsr5nMACSJxXlr3g/m1nAcXUR6RGSq9PfKNSgU9u?=
 =?us-ascii?Q?KlBtyD4u8A/YRDC6vaAAKs5uUdUCm7877suE+1h7kwJjfDSUnVnXbnlKaCSl?=
 =?us-ascii?Q?4ar9C2MQ7yCE4TwhzaYiUBU8pCWqZtvJ/ijDSpb9Z/BCP4EGGN7y0CMfY0vY?=
 =?us-ascii?Q?UhFjTJ2X70PrgijcFz9FtKfz4WjtnB3kG9VZA2C94YlLegM8hDAlTnW4wA5c?=
 =?us-ascii?Q?s52gNPCQ4Rf8fFWwcZu0O21veOrr4cRjQ5d74Jx+OSH+6bqrKOXnNywaHjHp?=
 =?us-ascii?Q?MPSTZyqE+7lO2/1IMVENr78JZ4GIBXUqXKKyxxRN0MjNn4v2aeftZD3nwtub?=
 =?us-ascii?Q?n2Wzt2sQaCYcNFDTUnhU9QGYTGN/QOYBSbjmQsCxIK1lls1d0SCCOW2jeO2h?=
 =?us-ascii?Q?5oyau63II70UWxImgLNjuXd2pKP2w2Zi+IcKc20IuzhaAMtELX/L7IRfFbYp?=
 =?us-ascii?Q?saDIFJ9nujDvXkcUlOI4cPKWoAcUiDNjK67K4WiZBR0fxr/kx1rEqCmRy7yE?=
 =?us-ascii?Q?mEmTfM8KgM2vzqJSanuH/q9k1PnPfhMYBpWKl9xT1GbkHITCsPSiNtP0S9GD?=
 =?us-ascii?Q?vbp34vPlCaUR3v0GvvU=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9260.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57aa3d94-8102-49b7-aadc-08dcd284ad88
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 17:10:46.8365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JS8WG8eMYJWx6jQ6/IAEHfsBJJshQQXX59QpSp+An7rnSwqoZa/zui/TXmwm1J9XX1+QCn4xEoBnuvhWWMDHMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9043

Got it, LGTM thanks.

> -----Original Message-----
> From: Potthuri, Sai Krishna <sai.krishna.potthuri@amd.com>
> Sent: Monday, September 9, 2024 10:58 PM
> To: Thangaraj, Senthil Nathan <SenthilNathan.Thangaraj@amd.com>; Linus
> Walleij <linus.walleij@linaro.org>; Simek, Michal <michal.simek@amd.com>;
> Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
> Conor Dooley <conor+dt@kernel.org>; Buddhabhatti, Jay
> <jay.buddhabhatti@amd.com>; Kundanala, Praveen Teja
> <praveen.teja.kundanala@amd.com>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>
> Cc: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; l=
inux-
> gpio@vger.kernel.org; devicetree@vger.kernel.org;
> saikrishna12468@gmail.com; git (AMD-Xilinx) <git@amd.com>
> Subject: RE: [PATCH v5 2/3] firmware: xilinx: Add Pinctrl Get Attribute I=
D
>=20
> Hi Senthil,
>=20
> > -----Original Message-----
> > From: Thangaraj, Senthil Nathan <SenthilNathan.Thangaraj@amd.com>
> > Sent: Monday, September 9, 2024 10:33 PM
> > To: Potthuri, Sai Krishna <sai.krishna.potthuri@amd.com>; Linus
> > Walleij <linus.walleij@linaro.org>; Simek, Michal
> > <michal.simek@amd.com>; Rob Herring <robh@kernel.org>; Krzysztof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
> > Buddhabhatti, Jay <jay.buddhabhatti@amd.com>; Kundanala, Praveen Teja
> > <praveen.teja.kundanala@amd.com>; Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org>
> > Cc: linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org; linux-gpio@vger.kernel.org;
> > devicetree@vger.kernel.org; saikrishna12468@gmail.com; git
> > (AMD-Xilinx) <git@amd.com>; Potthuri, Sai Krishna
> > <sai.krishna.potthuri@amd.com>
> > Subject: RE: [PATCH v5 2/3] firmware: xilinx: Add Pinctrl Get
> > Attribute ID
> >
> > Hi Sai Krishna,
> >
> > Please find my review below.
> >
> > Thanks,
> > Senthil
> >
> > > -----Original Message-----
> > > From: linux-arm-kernel
> > > <linux-arm-kernel-bounces@lists.infradead.org>
> > > On Behalf Of Sai Krishna Potthuri
> > > Sent: Friday, September 6, 2024 4:01 AM
> > > To: Linus Walleij <linus.walleij@linaro.org>; Simek, Michal
> > > <michal.simek@amd.com>; Rob Herring <robh@kernel.org>; Krzysztof
> > > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
> > > Buddhabhatti, Jay <jay.buddhabhatti@amd.com>; Kundanala, Praveen
> > > Teja <praveen.teja.kundanala@amd.com>; Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org>
> > > Cc: linux-arm-kernel@lists.infradead.org;
> > > linux-kernel@vger.kernel.org; linux- gpio@vger.kernel.org;
> > > devicetree@vger.kernel.org; saikrishna12468@gmail.com; git
> > > (AMD-Xilinx) <git@amd.com>; Potthuri, Sai Krishna
> > > <sai.krishna.potthuri@amd.com>
> > > Subject: [PATCH v5 2/3] firmware: xilinx: Add Pinctrl Get Attribute
> > > ID
> > >
> > > Caution: This message originated from an External Source. Use proper
> > > caution when opening attachments, clicking links, or responding.
> > >
> > >
> > > Add Pinctrl Get Attribute ID to the query ids list.
> > >
> > > Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> > > ---
> > >  include/linux/firmware/xlnx-zynqmp.h | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/include/linux/firmware/xlnx-zynqmp.h
> > > b/include/linux/firmware/xlnx-zynqmp.h
> > > index d7d07afc0532..3b4ce4ec5d3f 100644
> > > --- a/include/linux/firmware/xlnx-zynqmp.h
> > > +++ b/include/linux/firmware/xlnx-zynqmp.h
> > > @@ -238,6 +238,7 @@ enum pm_query_id {
> > >         PM_QID_PINCTRL_GET_PIN_GROUPS =3D 11,
> > >         PM_QID_CLOCK_GET_NUM_CLOCKS =3D 12,
> > >         PM_QID_CLOCK_GET_MAX_DIVISOR =3D 13,
> > > +       PM_QID_PINCTRL_GET_ATTRIBUTES =3D 15,
> >
> > Any reason why do you need to skip 14 and use 15 here ?
> This is based on the ID defined in the Xilinx Platform Management Firmwar=
e.
> Whatever the ID defined by the Xilinx firmware to handle this functionali=
ty, the
> same ID is used here. ID 14 might be used for another query function but =
Linux
> use cases might not be using it.
>=20
> Regards
> Sai Krishna


