Return-Path: <linux-gpio+bounces-18408-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A09FA7F270
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 03:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2B3616F723
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 01:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843821E4BE;
	Tue,  8 Apr 2025 01:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="esXPr3Vs";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Yt/N3h59"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18F32E62C8;
	Tue,  8 Apr 2025 01:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744076819; cv=fail; b=iaLBtT7/Qo2lYb/oV+MhkVu0/M+mlC325valjKTjxLu1H1TJQ4yWu8CgQWjJSoB14n7NchBsDkMJa67uV0x9hB/U/0EjacRgwpDa5hMWAik+tOR0xv79vX1zv9QpD5Ctq+ODvx12e133pLOIIYVmeBtpA69CiB6AOPKpGpEE+Ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744076819; c=relaxed/simple;
	bh=vp/HLgL3qSjXQjI1FyuPvzSzWKHb/eky+XR8xdyTg24=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jdv1WgfapbDTCC5kRE10E027mg1pkAU5TV+cLldLkeYydVrz+gOvMZLtDWeXJ0q0DqP6JPugpDO5kvs35QVb5glmlKvpRL30eihyYRANIf4kTWG7V6sVPa2Qhv2LI1lbsfwZ38qQXXPnGtKrpy9cOjkNAjvjlrwW9D1rgHe0TWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=esXPr3Vs; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Yt/N3h59; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 56962f7c141b11f08eb9c36241bbb6fb-20250408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=vp/HLgL3qSjXQjI1FyuPvzSzWKHb/eky+XR8xdyTg24=;
	b=esXPr3VsvW+yDh11QMn6HccYn3dvbAijr53ZSGEMYVjqEi8zANTOyDA+tTTpAD1rVY1RxLTQLp28BHkIMTlmil7pGu6xCJljoMHVOVKUAKkcEFClOpAXUq0186bnQZJLGDZ8TIKKvmHkBrk4NVqks2NF0F1KfI7n+oWkE/9qSC4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:4ca96ddc-edcb-4069-91ae-8ec78261edf4,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:10404bc7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 56962f7c141b11f08eb9c36241bbb6fb-20250408
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1912046625; Tue, 08 Apr 2025 09:46:49 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 8 Apr 2025 09:46:48 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 8 Apr 2025 09:46:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJm9Fr/i0AugPH9ErOEPh1GwzJqj3PSeuRcMRWk1tkCOGYhLzFIrR1IwNBB3AkFlv6JR9MjLzDVV05wHh2+aOqoc7JphqrYYMoWxlNQ7iAr39L0Q4LILUR8vx/UOAWxFlT75Q6uqViY12Sw2EfiWu+HQNV80cedeLrdPmbCZYdp4wOHT8mTvdBbFHLsxCzXcS4cNTlcNVcpp2WOmz6o4SF+xsS8Yh3Q0cEKzMPpQamMHoTk6bbQrM/SArVE1uA/5/SqF/6RdQDNvUDxHiM7/X+dWgUSJN17L5EBq0VVFQrnpXU8ZUF/t1j4rlN9nRjoVoNC4RZTdLX/B1wy56TztBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vp/HLgL3qSjXQjI1FyuPvzSzWKHb/eky+XR8xdyTg24=;
 b=Zf0gbj0q7r3Zu7N7GVDafRTTtL9RAXEi4uHfAK+Du+WNS1bePYEMdfjQb9MavAcmJhrdpqtsCFhw1wvcaSL0FAzoBj9U9terCpuPPuoz5sBfWEyL3bgaZu/6vlRkx+qja5ZUPxK6vr6X8/xQlWXMaj98itmW0KocE36/SbsHqfM2wxRt53lQiCCrngfG6rkVqxSf6qBej0xL9R3ZATGeiAXiRh8SAH1R2S/aiLyk2QjUWetVF/xW4yr+26n5v7VuxmxX5wNC5BRTJ5Yi3QAmwbb+NF8pYeM5sC24n+sZzSac0uoHaJbk73riRR/Uy4b63t/1IIOQE/FemEOas7/x1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vp/HLgL3qSjXQjI1FyuPvzSzWKHb/eky+XR8xdyTg24=;
 b=Yt/N3h59UzIuLY0Ihii0hwM+omzNyI2wmgansumZhoWZfQkQiEEESgIyKYN9MeAd0TE9Un7NcTFplJAms+FOuIc6Yg9tEriP4F7DMm911cNTRq3Y7wTefO3vTGpp7sifKB+CEANU8JhuUrcpbiSEG7WsNZ29a4zvpznQUsc78p8=
Received: from SEYPR03MB7588.apcprd03.prod.outlook.com (2603:1096:101:146::10)
 by SEZPR03MB7147.apcprd03.prod.outlook.com (2603:1096:101:e7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 01:46:44 +0000
Received: from SEYPR03MB7588.apcprd03.prod.outlook.com
 ([fe80::f427:bd2f:f38d:17dd]) by SEYPR03MB7588.apcprd03.prod.outlook.com
 ([fe80::f427:bd2f:f38d:17dd%4]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 01:46:44 +0000
From: =?utf-8?B?RGFycmVuIFllICjlj7bpo54p?= <Darren.Ye@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"brgl@bgdev.pl" <brgl@bgdev.pl>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"tiwai@suse.com" <tiwai@suse.com>, "robh@kernel.org" <robh@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"perex@perex.cz" <perex@perex.cz>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 00/11] ASoC: mediatek: Add support for MT8196 SoC
Thread-Topic: [PATCH v2 00/11] ASoC: mediatek: Add support for MT8196 SoC
Thread-Index: AQHbp7WwJPgiXJA4hkyCNS/PzIFat7OYK9uAgADU4AA=
Date: Tue, 8 Apr 2025 01:46:43 +0000
Message-ID: <cda669c25e17229632d0af93144b4315b4e4d328.camel@mediatek.com>
References: <20250407120708.26495-1-darren.ye@mediatek.com>
	 <1945935b-9597-476a-93f2-c0527ab77344@kernel.org>
In-Reply-To: <1945935b-9597-476a-93f2-c0527ab77344@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7588:EE_|SEZPR03MB7147:EE_
x-ms-office365-filtering-correlation-id: d8f89b83-b74a-4d85-c1cf-08dd763f3766
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?RHpNT1l6M3NBV1FGZTBWOUNPZzJ1TjZYYThpbjNmaEpUeERoT2p1MWNmZDRU?=
 =?utf-8?B?TVd0UjgwUTFqZk5xU0xFNVhHeDVpc0hWWHo1Q2krOC9kSi9RbmhLcE1yNSts?=
 =?utf-8?B?NHVPWkwrdG1ydTJ3V3dZWUdEaDdBOVJnQjNRTVNFbXlCM2pRVTRBOVlLU0li?=
 =?utf-8?B?NERZNkM4UnhNWGNMUXYrb0tBYko1UkpMZk1OVzkwdXVsZ0pacEN4d2psb0d0?=
 =?utf-8?B?dU95VTdNaHRkcjZlcEMvV1VQVXN2em5Ocyt6Q1Q5bCt4TStnR2FFSVQycWRL?=
 =?utf-8?B?QTNVQTFUNzBXUEJaR3Q5bm56Qzc3K1Q1dkJYdDkxOTEzMlE0eEZkakVmcWQz?=
 =?utf-8?B?ZW9XN0MrSlBwRDBtWm9vcnlXczJNQk45cmk3YUNacXVCZkNrVHZrQWFrc01q?=
 =?utf-8?B?dFduVnhKZ1Fzbzcwb0h2KzM4RDltWlpuMkhsNXFzekdnSjVlR3M4QkVubXdW?=
 =?utf-8?B?bDhaZUdvMGxzb1dTMnpyaHFyeitDY1dhbUFxZU81bDhkWE1SOUhrZTBHanRh?=
 =?utf-8?B?d1ptZndvSlZNejZURTFidUI0YVc4UUFjK1loeENMaUN4WHJ3T3drWXNsU1JO?=
 =?utf-8?B?c3FSbWVweGtuTTgrOWtBL2RBeXJ4djY4WmRmczNVb2JkY1BBaWhRcktUSHJx?=
 =?utf-8?B?Y2swdTZ0L3MzQUt4c212ay9SUUdObmZ1eER6SnY5R0JFS0UyZGREa2VHeVk5?=
 =?utf-8?B?QUFEWVdROUtTcTU0SjNmRXF3NUY5Q0prQlhublZlb1B3QTkxR0RtRlFVeFpJ?=
 =?utf-8?B?eDhaOFFXZGlyT2luQ1FRL2VZL3Y0WHRyWDNtSnVJSEpyeHBKUDc3VkxNQjZS?=
 =?utf-8?B?ZlVmOHVRQ2hVQW8yaG1sSi9Qc3RONFBwV05ucmRNLys4b2J2cEZXa3l2elRI?=
 =?utf-8?B?T3Vjb0grMk1KNVdJeHFMYVFVN243eUpxYm5aeHpOQ2EwM2c0Qys5WFpycnRK?=
 =?utf-8?B?cHE5cWE1QmppVkZyalB1N041OGp5MlowRFN1RktqcmxRT3RHbG5NOXliVFJL?=
 =?utf-8?B?MFJWMWlKdHYwYXI1UXRETmYrRnYwTWhWaHp1M2c5Tmc4K2h1cVY0TENwaU1m?=
 =?utf-8?B?Yld3Qjk2ZWxiYnZEUFdqNXJodzdzaUdDWi83TjNWSTFGRktYcFRDS2xVQW1Z?=
 =?utf-8?B?dzNYOE5RZnh0Rm1xdGE1M3JtSVViMjZSbmlZUzVrb0s1N0NZQ09LMVN0Y2Ny?=
 =?utf-8?B?R2FlaG5qMnRYRmFTZ1FPalJpM1BjSERzV0F5Vmk5UG42SytvZzNKOVJvSkFT?=
 =?utf-8?B?UG1rU042ckk2WFgrRjNDOHJ2Tk1xNktxNmdJVG9WZkcvZWNsbjVyODlaQ2pr?=
 =?utf-8?B?WGhucUpaUzlRZGk5SURiTHRwSHhCYzNnNlV6cVcrWEk0ZzJLdEFJK0lGcEJr?=
 =?utf-8?B?bjV2dHdqTEtMbU5VbHRVeUQxYkdjVkg2aVpHUzN3T3A4eEQvRUJnUGZlZDlF?=
 =?utf-8?B?ZzF3SFZSeE5NbXE5QmtabklKdEptYU9GeWlWVGpNNzhSRDRFTldDZC9Vb1BE?=
 =?utf-8?B?TUNHdGpJaDVxQ0grMnk5TmF1U0dhbGFTOWZYbFMrazFrNERNNjB1RngvZzRh?=
 =?utf-8?B?Z0hmTThtN3RsY1luc0FFa3Qwc015dDArbE1lMVI2Z2dWN0dSb1pBWlBsdkFF?=
 =?utf-8?B?YkRFUkNnczVscHJRS1Evd3FlMmMzbVFyeGVPOEJoTUFXdm9xc2VUQVpaTHlG?=
 =?utf-8?B?VXVCUzh1dk5LRG9NVHRCVFYva1BZeW5oMFdLWXZRUGhnMS9tYXY5M2hYR1gy?=
 =?utf-8?B?dDlwZzIwbnN3ckcyUHhKZVJ3anIwVDZldk1nZDBIZGQwcUM0eHBTbWJVKzVL?=
 =?utf-8?B?U200eUVkdUdrYkxOa0V1NWQxSlJzaVdnbWptMEkwU3Zqam1hUnRRaHJsZEFB?=
 =?utf-8?B?cWhNT0xadmx4M2ZoWldGQnJiWEh2RmtpY243V3p1ckpDTmJBYURhZUxFa2pj?=
 =?utf-8?B?V1VEN1FiTjV6TEVvZTNIQWM2TW1RMUhKMzRPSm53OGh0UEZlbXFmL0xyY25v?=
 =?utf-8?Q?ReynAtL0GL4q5SZUNysXlBgJh5PNpk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7588.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ak0vVEs3RXVVZEdGWWdyUG1TdzVoSUF6RGcrQlJzNFcwbnBBb2toQmRoZTM4?=
 =?utf-8?B?ZzIrSXZDY0o5T3VTaTJSNU1USFhGRVV4a1lPSkdHWlZRT2Qzc0t0cjh6V2Ru?=
 =?utf-8?B?WWRpSWY4TFg3SHk0YWM1cG0zSTZIWGpXbWphVGZ6QzM4QkVWTkdkUFJpcDJU?=
 =?utf-8?B?Z0dLR1BDaHRIQWdPckI5QXdQdmVwRkhBTS80djdDMmZ4K0FZc1lBNEwrOGg1?=
 =?utf-8?B?RThRQjhyZlV5YTlOaWMzSVBuOHRQUTF5Um5WdnJnRlBhS2dwdDEzb21GL3l4?=
 =?utf-8?B?KzB3S3NRZldkMUFmYUdTMllCSlljbWRJWmFKTnpnc2tLdWtiQ0dhK3Z3cHdN?=
 =?utf-8?B?ZWJQZVhWaU1lQlF5eXFiQXhNV1RvSFlaNU02MUwzQ1FVTWlidVNVYzAya25w?=
 =?utf-8?B?M0FtZ2dPSFI0YXRpMUtuQTNaMnRyMDV4eDhYcExwWitvNWNtL0RPd2p4M2NU?=
 =?utf-8?B?QjBqOUdTajM2MWt0ZTQ3NUpYU0J6bkhGNGVKdlNnSEdWZEY1b01xTktidG9k?=
 =?utf-8?B?UUdyWThMTERENlpnQnlYc1drM2RwaUZQdmZIQzZFdTdFSWkrQW5UNW1hUUk1?=
 =?utf-8?B?bm5kdG9tbHcvckhRRlk2ZnZISmZESTJXZm4wdVU0VHVoajU2b2pLQ0IxNHYy?=
 =?utf-8?B?VHNyekZvd2xDOTJBMVkwaU9JQU9FOTZDa3FoZlpBdUtzcFJaTFFGYm5uRjdR?=
 =?utf-8?B?bDI2ZUJxU0NTZGgraGFhYTNvSHlJL0hOb0hKZ0s0MTljWXNOZ0dYMzUzSGlZ?=
 =?utf-8?B?Y2ZQclc5bncwdys4VVVXL1Z4SGJ2ZWZYNWkwN1ZrTVpxYTQxZ0dsNW8rdGxK?=
 =?utf-8?B?S0RzRVBJeTJQQUdueGRYVUhIbHcya1RCSGRGMDY2UTdOY1lBVE16cy85NDE1?=
 =?utf-8?B?REtPSWhlbnJqVjhMNTZVNnI0UWdNQUQ2ZmZ3UTJDNGZxeFFld0tOcXhoWjAy?=
 =?utf-8?B?WVphRFRrWjNyQk9mZ1lWRXJ0NjdTbUdJMVFKNjJUanlON3FaTnhKcjlFYlM2?=
 =?utf-8?B?UGhjRnR4MVJ2MXVzbnNrWUlTY3lOc0xiM2t2RjJaZUtsK281MCtqMERtNkdH?=
 =?utf-8?B?bTVPR1U1Y3l5VDdzdEl1bHhoWFJJMU84cDZTQllTR2lrWmF5ajZEMm1sWlhJ?=
 =?utf-8?B?L0dTY2g2ZzZYVk9nNFVIQ3lsVGcxeGFXTTdXUTBXWmFoKzJ3bjRpVTZWM3Rp?=
 =?utf-8?B?K1NWTTJwZ1JuZjNxZW1lUVBNRXFvNms2L3UvUkwrdmFKNlpOeStqeGp4VFJ0?=
 =?utf-8?B?NEU4UlFiV2ZMNDRraHQ4N1ZjVUlOWTZaRjJjKzk1alZpNmxnWVR0WjZFaUY5?=
 =?utf-8?B?cHhMelVLMG5sZk9WV2tyTFNmZUxab1RXeklCeWdHMWRZMFhYSll0Q1Fja2xj?=
 =?utf-8?B?NXl4SzAreTBoci9xaVcvWFZWYUkzcUFXenZmanhjVkxmbW1jM0RXNjV0T216?=
 =?utf-8?B?NGhzZUZwc3dLT2RZTmZBeFVJZlQ3eHFuM1EwS01lNTNZWVRUSlBIV2hpS0dk?=
 =?utf-8?B?bHZsZmUwd0JPbytrK1QvRHlXV3Z0WDJTenJJZS8wdjlOWXBkNWpnamxVNmFM?=
 =?utf-8?B?SGFGSitGUVJ4S3QwcFg3UUlwb3dPUnp1WFUxa0xLV1h1QnJ5Tm9tdHlyc0lx?=
 =?utf-8?B?TExTd0VFUGVnYXA0dkhJR3Q3TXd2L25HSkpjay8rS1FUWk5iNnlrL3dCamxS?=
 =?utf-8?B?aFBFekkyakhZM2R0TjFzYjU0cmtKMnBKYjM0SjBCbVdJUDFEZlZESHhHZHlm?=
 =?utf-8?B?ajRMWWY3UU1Qa04vaXlKQVlHN01VYmJTcnRNaktaRldkY3EvcldHMXNSclkr?=
 =?utf-8?B?bTE1VjFkcmZsa3RYdUViWkhTcmpiVnVOQVFrcHdvU2RSWjJ4VjJLVzNDclFE?=
 =?utf-8?B?R3JnalEzQWJpdk5IVGVKOFA4Y3pCNVQxTDFSdmUwbFJ1RG5RUVpZakIrQVhl?=
 =?utf-8?B?R2cybnZQeGtYNEZLQys3VkFnL0NjaXFPMTVTV1lHVGI2blMxbnJtWG9HOXVU?=
 =?utf-8?B?ZDBkcVE3SGxxWVc0ejlaT2tmc25kYzE1UnNFQW9pUFdQaHhJeGs1R0EwUm0v?=
 =?utf-8?B?K3lHTUZ1YkRuaVcyR2E3cmdLam9mTGJabUt3RmNzTW5tZDFXNHBxMHBFQ2tO?=
 =?utf-8?Q?052ZHju8JDsZmNsMx1/Ogcv0L?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <829B075A1682DD40ADAB8A17D7916A3B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7588.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f89b83-b74a-4d85-c1cf-08dd763f3766
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 01:46:44.0610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bQqH6BgTgAhe692/wb9jknx+63s1gayiBCX3cYDUBa2K8oJGmY5dKSH8lvb+aKkfbaI+UNeGGc/Z0YwYRSH6Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7147

SSBhbSBzbyBzb3JyeSwgdGhlIGZpcnN0IGxvc3QgdjIgbWFyayB3YXMgc2VudCB5ZXN0ZXJkYXks
IHBsZWFzZSByZXZpZXcNCnRoZSB2MiB2ZXJzaW9uIGRpcmVjdGx5LCB0aGFua3MuDQoNCkJlc3Qg
cmVnYXJkcywNCkRhcnJlbiBZZQ0KDQpPbiBNb24sIDIwMjUtMDQtMDcgYXQgMTU6MDQgKzAyMDAs
IEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZl
cmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gT24gMDcvMDQvMjAy
NSAxNDowNiwgRGFycmVuLlllIHdyb3RlOg0KPiA+IEZyb206IERhcnJlbiBZZSA8ZGFycmVuLnll
QG1lZGlhdGVrLmNvbT4NCj4gPiANCj4gPiBUaGlzIHNlcmllcyBvZiBwYXRjaGVzIGFkZHMgc3Vw
cG9ydCBmb3IgTWVkaWF0ZWsgQUZFIG9mIE1UODE5NiBTb0MuDQo+ID4gUGF0Y2hlcyBhcmUgYmFz
ZWQgb24gYnJvb25pZSB0cmVlICJmb3ItbmV4dCIgYnJhbmNoLg0KPiA+IA0KPiA+IENoYW5nZXMg
c2luY2UgdjE6DQo+ID4gICAtIG1vZGlmeSBtdGtfbWVtaWZfc2V0X2NoYW5uZWwgYW5kIG10a19h
ZmVfcGNtX3BvaW50ZXIgaW50ZXJmYWNlcw0KPiA+ICAgICBhcmUgaW1wcm92ZWQgdG8gc3VwcG9y
dCBtdDgxOTYuDQo+ID4gICAtIHJlbW92ZSBkdXBsaWNhdGUgZGVmaW5pdGlvbnMgaW4gdGhlIG10
ODE5NiBjb21tb24gaGVhZGVyIGZpbGUuDQo+ID4gICAtIGNtIGxvZ2ljIGlzIG1lcmdlIGludG8g
dGhlIGFmZSBwbGF0Zm9ybSBkcml2ZXIuDQo+ID4gICAtIG1vZGlmeSBhZmUgY2xrIHRvIHJldHVy
biBqdWRnbWVudCBsb2dpYyBhbmQgcmVtb3ZlIHVzZWxlc3MgY2xrDQo+ID4gc291cmNlcy4NCj4g
PiAgIC0gcmVmYWN0b3IgdGhlIG10ODE5NiBhZGRhIGRhaSBkcml2ZXIuDQo+ID4gICAtIHJlbW92
ZSB0aGUgZ3BpbyBtb2R1bGUgYW5kIHVzZSBTTkRfU09DX0RBUE1fUElOQ1RSTCB0byBtYW5hZ2UN
Cj4gPiBpdC4NCj4gPiAgIC0gcmVtb3ZlcyBDT05OU1lTX0kyUyByZWxhdGVkIGZ1bmN0aW9ucyB0
aGF0IGFyZSBub3Qgc3VwcG9ydGVkIGluDQo+ID4gaTJzIGRhaSBkcml2ZXIuDQo+ID4gICAtIGZp
eGVkIG10ODE5Ni1hZmUueWFtbCBhbmQgbXQ4MTk2LW10NjY4MS55YW1sIHN5bnRheCBpc3N1ZXMu
DQo+ID4gICAtIG1vZGlmeSBsb2cgcHJpbnRpbmcgaW4gYWxsIG1vZHVsZXMuDQo+IA0KPiBZb3Ug
anVzdCBzZW50IGl0IHRvZGF5IGFuZCBpbW1lZGlhdGVseSBzZW50ICgyMCBtaW51dGVzIGxhdGVy
KSB2Mg0KPiB3aXRoDQo+IHNvIG1hbnkgY2hhbmdlcz8NCj4gDQo+IEdpdmUgcGVvcGxlIGNoYW5j
ZSB0byByZXZpZXcuIE9uZSBiaWcgcGF0Y2hzZXQgZXZlcnkgZmV3IGRheXMuDQo+IA0KPiBCZXN0
IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K

