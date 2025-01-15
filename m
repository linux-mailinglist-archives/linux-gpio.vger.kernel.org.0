Return-Path: <linux-gpio+bounces-14801-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FB4A1167E
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 02:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50773167740
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 01:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0D735968;
	Wed, 15 Jan 2025 01:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ie4J03Pk";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="E0o6Gg3D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056FD635;
	Wed, 15 Jan 2025 01:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736904324; cv=fail; b=n9mIkCXzOvgDV9AxqALPbSaW3ErDmLJ5+J/ilkh1N5PxJPs3CAgxLjdZ45gLsTVRc9RBMzs5FIA8nqSk95x/cdIWq4dPB0U7VSRDJ/maYQwGez2O7mdYx+z4pAhMyNqzJHFGhpyKarXDQswsSd1tBBIO9XKXe6XnJ9L7kg1HC90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736904324; c=relaxed/simple;
	bh=pN2600YvsXjKEOKflG4RYSm9ZrJVfBeclYR8A776/Zs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fY1XcP3b5hNHNJOk3b2pdfJjQ1kFWwjwAQu9bP1w+U84OEHMHRJ23ycVWrcdIopLnEwQoe/VxYDckKV0S9AC51WlrxlAZOhLIpsYICkPk6N09c599Zh9ZlzPHvfO8JNf405IMvlXK42vIDOsSnHW0co+/vrRD5Kmyrw05Lqb5eU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ie4J03Pk; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=E0o6Gg3D; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 9346a24ed2df11efbd192953cf12861f-20250115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=pN2600YvsXjKEOKflG4RYSm9ZrJVfBeclYR8A776/Zs=;
	b=ie4J03PklCv2e6NsucU4kUr3hPcsZ5gN2M+JpswFUVY8RZpNsAzfl2yk5mghiSbPziiy8ZsrKGWL7vAnPXGZbq4nbSo4CPyYzIj4nqlYfRNQ0C1Nn7KsNJxU+aqYsydjZXvtNTzDzmxrEmVpy94b42/gJqLlmvTRHLFtG8edD5o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:f50a83a7-e52e-4671-89f9-b6094770a099,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:7ff0e50e-078a-483b-8929-714244d25c49,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 9346a24ed2df11efbd192953cf12861f-20250115
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1631076795; Wed, 15 Jan 2025 09:25:16 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 15 Jan 2025 09:25:11 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 15 Jan 2025 09:25:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGqmCHshMKFxRTMLanvLk1WGQkRkKjcPIV5zka4gMrE5xmx1du7xnafMnHaSN27tz04pgloR88Gan2HKw2yDhqhH6Jws8N38497+0FEK4nXl9lT2+KoFsEtNADCh+aoKumxV8llim4nsJxkARs1cbslGIxRvhToeUWSrmE1CLgRQtbUj/IeS438QWxnTNhJBLBDHEhZ0hNVIhw6y/jW3/OlIO9EEEogoQqBUxtaIwtlkVa9ykx9h2pHfMNmNca1IYXtTL0P4uqoTr8KhQdomdejBC6t2Gy/FnCfURYuFudyQM0obD068Cw1G/QDwGiIdomEK/+mFhjpBdjNxyVOmbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pN2600YvsXjKEOKflG4RYSm9ZrJVfBeclYR8A776/Zs=;
 b=SGexWfdln3V73UlBDW365cGrojx9RAmRpqilFMAZ6des/g35itT89PChX33pvp9mMvNiI7GxVykUFJyCGRm8GXSnf3+TKrheG8XkNx0Dg66VPfp5WkUTyBrO6I6BeE7SRsNYicfoHK5mL/PtE2ZcvURSLxWtp17r5n4t6M83CXHIUwqS8piY396reoNQU/iz4+imzCcTHb9FVPz9tJnuiYiiZ3G2IvH2XkhjcKKwAeCjU1vgGXU3+SXNzWbtr1bodT/ytEeF08zPImrV0SdRr2xjgt8nye2NvW5fsOTpxEUG5ljuVgtTUaBQ8rIOiBHYN9MXpfG0vQFHw4Mor+fN8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pN2600YvsXjKEOKflG4RYSm9ZrJVfBeclYR8A776/Zs=;
 b=E0o6Gg3DZNs0T6yBQr8HjeMLLRRxD4797XdWQmbjXDycwWskXMergghTAZXvUcbJ6dGrKFeuYDfvNLo3SOSP7CXDFHEt7rlQ9UKQgNnTgtXZb2D38yk3HfrqM+35paObWW1cfrfJmD38EEJ64+hFjlImijEy0ikuOtRN9H6wCN4=
Received: from PSAPR03MB5688.apcprd03.prod.outlook.com (2603:1096:301:88::14)
 by SI2PR03MB6712.apcprd03.prod.outlook.com (2603:1096:4:1ec::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 01:25:07 +0000
Received: from PSAPR03MB5688.apcprd03.prod.outlook.com
 ([fe80::d976:8c60:38aa:d1dc]) by PSAPR03MB5688.apcprd03.prod.outlook.com
 ([fe80::d976:8c60:38aa:d1dc%6]) with mapi id 15.20.8335.012; Wed, 15 Jan 2025
 01:25:07 +0000
From: =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "sean.wang@kernel.org"
	<sean.wang@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "krzk@kernel.org"
	<krzk@kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?R3VvZG9uZyBMaXUgKOWImOWbveagiyk=?= <Guodong.Liu@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: mediatek: Add support for MT8196
Thread-Topic: [PATCH] pinctrl: mediatek: Add support for MT8196
Thread-Index: AQHbS5G1QCqlKfF0XEOZLxq3O6L9SbLgrUEAgDVsnoCAAD0EAIAA6paA
Date: Wed, 15 Jan 2025 01:25:07 +0000
Message-ID: <5fc60d39bfb6f0c87d26381afd2d777b075a8b70.camel@mediatek.com>
References: <20241211055454.17120-3-ot_cathy.xu@mediatek.com>
	 <2a773ddb-2836-40cf-a08b-ac47430aeb78@kernel.org>
	 <8ed4a30710a3dc56595898417d00c2eca0659f75.camel@mediatek.com>
	 <9e64fea2-0136-4447-b560-bb6c10146f47@kernel.org>
In-Reply-To: <9e64fea2-0136-4447-b560-bb6c10146f47@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5688:EE_|SI2PR03MB6712:EE_
x-ms-office365-filtering-correlation-id: 8172fed1-6791-4891-db2d-08dd35037227
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZzhLMnFnUUpmSFdvSzJhN3Q3UHVCbTE3TDAyb0MvMGJTT1Q5aVJhcVVqNzRt?=
 =?utf-8?B?YWFnVEJ2VU5uQVBzYm45S3F2dGFzSTRqTC9tU3lDb3N6VDRXRXhjaVZMdGky?=
 =?utf-8?B?cTdGTEdGL0dZV3VyS1ZGdXVPYjBRUVgvb1h3TzJKZEpoWVYwbDhha0pLeTVz?=
 =?utf-8?B?cCtIVGx6R3JLb3d1TS9MRDJnSW9sRlgvZWtMSXVmUTVYRjZPWlQrWUw4elZx?=
 =?utf-8?B?blZlOG1uWkJ5MkJoZXV5dEFSWEhMZHRiNkNuY0xETDk5Tjc5ZzZsTXpPbHVt?=
 =?utf-8?B?RFVBRjV4RkRsTnovUHdpU3BmenlubTRybDIzN0F0Wjk5Z3ROUG9YVU9PaDhE?=
 =?utf-8?B?cFRkVGtJaVU2NitqblkwL3hSUDYrd3h0QVJ4TXZGZmdIMU1IK1ZhZjJ0QVRz?=
 =?utf-8?B?Vmd2Q1VsQjByMytMZFNhbGtIYmNqc1FPTVNWNVZpV1JiU1IzYVFNZ05McWdF?=
 =?utf-8?B?ZHMvRUNrYUkva0VvRkNLWkhXVHBEM2ZxOFdaQ2N4dlUza0N0T0o4R2c5TGU2?=
 =?utf-8?B?dytHRFFlaU9jVERrT1JlUjhlWnBMdkkvdllXWHhVZDVVSkprQ2tmblJVWXJW?=
 =?utf-8?B?NmgzNStUcGMvRW1jRm4vejIzd2NIdFdtSDRrZnVrYlk2Z3d4N3dqV1pxeCtW?=
 =?utf-8?B?Zk80RG9EV3BYK0lGNlQ3TjkwVEV0KzRBSlQ0NjU0NGtmOE5ralJFOEViVEtr?=
 =?utf-8?B?S092Sk1ieEUvK0laMm9uaHF1SHFKQ2J3d0lFdHV4SDltcGV2N3FETVYwZHdN?=
 =?utf-8?B?R004anJodnE3YWcxKzVVNENaMEVtL1YzYktBSVlYcDdnRVhRWnE3aHFQckw3?=
 =?utf-8?B?UzFnV3N4SUJpalQrUml2T2pZdHlLcFd1QlYzcGpHR0JZSGpmeGJkeXl0d1Ns?=
 =?utf-8?B?K2hGZDNWY1U1ZzVmNXVwaW1aRU9LZkxvTXAzQ3hNOERUelZNNjRlek5jVlFE?=
 =?utf-8?B?UTFpMjhFWGkxRHZFeVk1b2x0b3FKeUFacXYyV0ZndnR1RkhEb3JiQ3djdEhB?=
 =?utf-8?B?MzBHUGFJYmlvZzlEQ0pEaFpGOTk3WU5pY0pJcjljeTEwNGI1cmlScXNrSnBn?=
 =?utf-8?B?ejlTNVF5cFRkMmdNcUp1SnF6U1Z0Y051dnV0bXk3M2tVVmQ3RC9yajZqY2xh?=
 =?utf-8?B?Q0lwRldKNGpDckRXK05JL2dTRVpoUFFlK2tvT0YybGRkdzV2eHUxTENnRUJw?=
 =?utf-8?B?Wk53Z1lkN3E4clVka2NveGp1NjV4NUZ3Ym9NWFRURGFwOTFkb2JOUnU4b0Z1?=
 =?utf-8?B?T2xrdVM1SVlzTnh6cHg0WHJvT2VPaTNrRU4wODZTd2dLWHBUenhheW4xNXFJ?=
 =?utf-8?B?bGFPL0lOcGEvdFRtdWNYNDFlOUw2N3dzZml5YkhHRy9WR3ZnTEFzeS9CdTV3?=
 =?utf-8?B?azRVYXBWOHpYWkdOa1pKd3EyTUtoZ0h0M2ozQlVqYVBjZmNqckFZU1hNdE8w?=
 =?utf-8?B?bGh6WkhnNFdNcGdIb1RlZzVVTFM2T0JDU05aZ3ladXF0M3psdGV4b0QxcmFw?=
 =?utf-8?B?ODk1N1FzeXRGOEhyeFJNY1Q4WFY1MUMxV1YvOWxQc2c4aEpiSnc0MTM4ZklV?=
 =?utf-8?B?WE1lbEdsME9JOFJaZ1B2QzNkV2d6S2ZaZ01rTlM1OG1aTUtEU243Z21uV1hQ?=
 =?utf-8?B?YWx1UWVmekRneTN2RUxuaTNuNUZ6U3lscWIyajlqOXZQME56REx4UjVsU0Fx?=
 =?utf-8?B?ME0zQ2tHb1pYQzFQMnNwQ2dFdFZpQW04RStiMTBFZ3dOR3YxOEhLb1I5MHpx?=
 =?utf-8?B?MnBrWGFJWHhWZ0FpZGVjS09ySVJ4T0gyM1J4bnRlK29adjF3aGRpR0hzOXdS?=
 =?utf-8?B?SDhlalkyL0VRK1VWQndaOHBLZ29NWmphd1dOa0lDWDNKZzJKZm5tNFBaRVVy?=
 =?utf-8?B?SFdTRXJlRW80ZFRwMnJlaGV6THNmV1RFYUJMWjVBK0x4Z1ZHRktLTjIzSnEv?=
 =?utf-8?Q?TiINbiYLQoQynDh/E3mZRD+xbR1HjR1o?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5688.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TURSUTJ1am5zd29GaWFXa0xUajdUTThkQ3U2TXNBUnd4WmJST2grWGVXNUQr?=
 =?utf-8?B?TDU4eXU5MmlHV1V3TStoWisvVFNaSW9BVkFSL0E2YlBteDVvRi82VXZuZ3Bs?=
 =?utf-8?B?WWRuZHM4K3liS1hMNlNNRkZmSzFHUEkwRks0MHNxaGN5aDJKSnppWXY1OUhk?=
 =?utf-8?B?MkpYdzY4NGVsdVBHdkcyemdGMzJ0TmhCMW5PbTlTejdVeUdpR1pBeFJhS2Nn?=
 =?utf-8?B?SjFBT3N4NU9oSTJESVZIVkJUNjlYYzFTL1ZFNzMvNXI1M0RqUXo3K1VHSTdp?=
 =?utf-8?B?bU5kaGZUMzNVN21URktnN3Z2WGF6djFqYVdGL21iMTJ1UDNsb3hqblBlVnY5?=
 =?utf-8?B?RFlNMkIzNW1IVlp4L2ZVMUY3SkNqREpWZjd0ZTRiWVB5UTRTZ2FLcDZNU1RK?=
 =?utf-8?B?Y1NneHNWRzd3MGJyQ04reW1QZlZXbEpBaEovTlBvS1d6NFZmSHE1UlMrdXd5?=
 =?utf-8?B?YURlSnJvcnh3VHZ5Nzd6V2Z6cFl6Vlp4TzdDS2RyVTJjV3FtUkRHNnZkQXhJ?=
 =?utf-8?B?U2JlTlRmeE9mZWFJczR5M01lKzI2ODN4TjZSbzQ5MVlzLzdEY1loV08zY1cr?=
 =?utf-8?B?bTVuYmVIRkJjSWRZYlRya0hvNU5qMHVKVlZwQm5vYkJtVEd6cDBBajhmU3c0?=
 =?utf-8?B?WVlMMjdvSmVGREJhalRxZ2ZUWnFUd2o3UXdjZWRrL2x5Q04wVjFKektqUVdn?=
 =?utf-8?B?WGlQUnpudTdZRXVCVkhLbndacE1RdGpoQk5LVmUxckJGZUFIMjRUMFNQMndX?=
 =?utf-8?B?ZFo0RU93RzY3SW4rNHpzN1Q3WEtkK0YySFRMS1YxQlF1M1djNnpMMTBBTTdC?=
 =?utf-8?B?ZVNzL1IweHNxdTBGNHRSSEN3OXRYK2JrMlFRSWJqYlFPZXdLUG82dFpLbUVh?=
 =?utf-8?B?VWszZmhPUkRMYVhUU2ROcDZmbTZYUHhsTzVEcStQYzg1blhpemV3TVFGZ1ov?=
 =?utf-8?B?QnErZHNGUlBxalZBbC93Wi9SY0hQcVV2UDBtMWNLbmpVcCthWTlacHAwU3pn?=
 =?utf-8?B?QnIxTjl2SHNtd2pDbzdFYW03UmZKRVFqbC9tUWxueERpQUhrOWpqZFovek1x?=
 =?utf-8?B?WkFuOUZ1VmtlWUNFbis4UUU4d2dGYk9mbTdkQWdiYWlPekEzc05hcWNOVEs1?=
 =?utf-8?B?RDVoRFpONlBOcTVBaUNlTGdhMFVqRlBZZ2hxbmx0Y2RHaFBaczk3RnUzL0Fu?=
 =?utf-8?B?cWhrWmd1ZzNLUkNQd2FKTmF1MXJGVlBGOWNBb2lYZFAyWXNCa0g2Z3dQREcz?=
 =?utf-8?B?QUZiRk9YQU9TYkxqMFErTVFualB2TlhvMVdFdms2ZGhoNkhyb0d0ckxFUTc2?=
 =?utf-8?B?aXJFdytwUlJySWNwUkhKT3FVTXJnajZUVmNZV244YmtxSmQ0WXpkUzR4MlBr?=
 =?utf-8?B?cG56OEZMaGZMVFlkdTVxcUxKUWxiQ2ZNYThHSnVyNk1KVy9TR1lyL0FnenE3?=
 =?utf-8?B?Nkp1UUhqemp5Rjc0ODByNFIrcDJTVkN1bW1ERkZzZHdWaGVNNk9YNURDaEtK?=
 =?utf-8?B?YnJ5b3EzSk5SNDRVYngwbEppV01USUxrOU1YS0I1aVZIOEltSDdNbUNab2c2?=
 =?utf-8?B?THRvOEc5cXRwYnBPdmlFZFlFRnlhaDFUSzN6YXRuajFBak84N3UrTWtyaHFW?=
 =?utf-8?B?RjV4OW10YlY2M2ZmaXZZeGIxSVpjNXFJSWp1WXVCZjVoTGpJTldpWnhpQlVj?=
 =?utf-8?B?RDFucDhyS1gwTXRpc29NNHRFd0JyYTBLUDV2MXBCOGRWWHAxTDNVSTlkLzFL?=
 =?utf-8?B?QkpkWkRWK3hJWTVURGNkaHd3SDJyaUFQL1dFaXBYYk8zZGZpbzNwYVprUS9D?=
 =?utf-8?B?c2dEeE8wOWNZalFqSVQzUExpT1oxSDdnNm4yZHpCQUhhQmdsMGttaEVzS2pP?=
 =?utf-8?B?Y3dwNkdwSTN5WWhSdmNmNStNQ2loYStTVGlXdkhwenpQTDlxdGhHelpXQjJQ?=
 =?utf-8?B?YVVxdlMxdFV1SVRWbHZ4VFd6ZzlpNThYMVRxUG5lUHNaL3RrTTUwVzhqTld5?=
 =?utf-8?B?UUlRQjkrYWJ5NUVCZ1RTek93NzRCYXJSbGZXRU5RMkJvVHFzLyt0SVRQMkhY?=
 =?utf-8?B?bnRPanVoenBEdFhTUjlGZENvcjNITlZocVArSHVYSTdjemZGOFlPdkRLZHho?=
 =?utf-8?B?TzZrVlI1SnZFdVNTZFlZdWRZNis1SW9YaUs1TlFaU3pwUy9mR1h0aWN4dFhB?=
 =?utf-8?B?OEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D3A9EF08613634FBADCBD6638E51A8D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5688.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8172fed1-6791-4891-db2d-08dd35037227
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 01:25:07.2845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ow/IUrWa3kZjtxHuDWgC7dcdSYMvJ6X7LR43i3VhZkzEAZHQskHHNPizIQFuUtVXFAqhFTMAJaOKeyPvIW/sLEYHGppOZ4iqubihH/slMjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6712

T24gVHVlLCAyMDI1LTAxLTE0IGF0IDEyOjI1ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDE0LzAxLzIwMjUgMDg6NDcsIENhdGh5IFh1ICjorrjl
jY7lqbcpIHdyb3RlOg0KPiA+ID4gDQo+ID4gPiBQbGVhc2UgcnVuIHNjcmlwdHMvY2hlY2twYXRj
aC5wbCBhbmQgZml4IHJlcG9ydGVkIHdhcm5pbmdzLiBUaGVuDQo+ID4gPiBwbGVhc2UNCj4gPiA+
IHJ1biBgc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tc3RyaWN0YCBhbmQgKHByb2JhYmx5KSBmaXgg
bW9yZQ0KPiA+ID4gd2FybmluZ3MuDQo+ID4gPiBTb21lIHdhcm5pbmdzIGNhbiBiZSBpZ25vcmVk
LCBlc3BlY2lhbGx5IGZyb20gLS1zdHJpY3QgcnVuLCBidXQNCj4gPiA+IHRoZQ0KPiA+ID4gY29k
ZQ0KPiA+ID4gaGVyZSBsb29rcyBsaWtlIGl0IG5lZWRzIGEgZml4LiBGZWVsIGZyZWUgdG8gZ2V0
IGluIHRvdWNoIGlmIHRoZQ0KPiA+ID4gd2FybmluZw0KPiA+ID4gaXMgbm90IGNsZWFyLg0KPiA+
IA0KPiA+ICAgU29ycnksIGl0J3MgdGhlIHNhbWUgaGVyZSwgbm8gd2FybmluZ3Mgd2VyZSByZXBv
cnRlZCBoZXJlLiBDb3VsZA0KPiA+IHlvdQ0KPiA+IHBsZWFzZSBwb2ludCBpdCBvdXQ/IFRoYW5r
IHlvdX4NCj4gDQo+IA0KPiBNYXliZSB0aGVyZSBpcyBubyB3YXJuaW5nLi4uIFNvIEkgbWVhbnQg
dGhhdCBiaW5kaW5ncyBhcmUgYWx3YXlzDQo+IHNlcGFyYXRlLiBUaGUgYmluZGluZyBoZWFkZXIg
YWx3YXlzIGJlbG9uZ3MgdG8gdGhlIGJpbmRpbmcgZG9jLg0KICBVbmRlcnN0b29kLCBpdCB3aWxs
IGJlIGZpeGVkIGluIG5leHQgdmVyc2lvbiwgdGhhbmsgeW91Lg0KPiANCj4gQmVzdCByZWdhcmRz
LA0KPiBLcnp5c3p0b2YNCg==

