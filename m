Return-Path: <linux-gpio+bounces-17872-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DC0A6C75F
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Mar 2025 04:23:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF6817A6E19
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Mar 2025 03:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB196F073;
	Sat, 22 Mar 2025 03:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="N1J5hgLC";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Q3c9hRmQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCDD136E3F;
	Sat, 22 Mar 2025 03:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742613795; cv=fail; b=aj5+rEQ+nR5ZHZ9w/3oaIfste9aMJZpNFLjXBXfe/lHhebKQXT6Ye3UY0XUJ7mQ6bX80L9uLQECX5bkpfVbEka2SX4fXKYJdDDDCGc3X+veyk+r7ULQOzuaEGsBxlfIYwl1KSwl3sesEApMjMQhyqbzunfUOLhVep7aoL7NCkp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742613795; c=relaxed/simple;
	bh=Vs1BQ94mQrhkXBF69wU1hV19Pw8/yI3UUQFY9R7/ifA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lgBSimH0PQYymN/74xtLKBy7of1M/syffgikbBTEQiF/fFjYEtqiIjre3WYAHyeWaE6Z2PeGrid2z52CRiEN+3u+2W//KC333ZjJYDmqRRl7On3myHbzWdXqBAgk+xv3Cc9Vgem8+KGjY8FmHhTuAzHQhxMHvk/ZakrHZc3T8vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=N1J5hgLC; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Q3c9hRmQ; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f4d0765e06cc11f08eb9c36241bbb6fb-20250322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Vs1BQ94mQrhkXBF69wU1hV19Pw8/yI3UUQFY9R7/ifA=;
	b=N1J5hgLCdFdqo6KSaWkAdj9O8BRyvhn5K7eCjpi6FsXWJvvlSWvBOdV3+BHH4G6kChOab65CoONVlhHq/8XvLp03F8I2sYerilv6ySryKsKqNviTYcXo77newFZyl+6hpxYl47EzVOv1cwIk8x616E4NglNPJ4nXNa6PTgp4/co=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:705ba837-6d0e-46d1-94f7-d07039ab3d2d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:481fa7c6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: f4d0765e06cc11f08eb9c36241bbb6fb-20250322
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 656907089; Sat, 22 Mar 2025 11:22:59 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 22 Mar 2025 11:22:58 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 22 Mar 2025 11:22:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lj04VxJpVhPEPzIexBSf8KEapbjEszv0dFAAWZQBi1x9EMP3GBeriF70xVc4KC7dezuz/lWK0gyx9Sy1AWuuH250EsHzd45dKJiTBLYFkpraCd9oGPL9ybY2YfdTA1DUIsZMpBw0fT/7MgE3Kr9WkyRBVfjnPElfqcKtstsbkFV0tdJZ1zzLT9ZyWILw33xixZ9IzG065c+i0/n1dO3Os5RyRPfOTH+DOSc7DedBZHA+7tUFDDKT7sIVy41bAV943eYibA9cOsYA6JYH1GGci2gX//oARR7ozjQpcggnsaVhVKPmomdf/fmrCZG1PFdXih9/KBh+IYSLkZjnWaFz4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vs1BQ94mQrhkXBF69wU1hV19Pw8/yI3UUQFY9R7/ifA=;
 b=PJp7k9PDrQwkuv7y81roKdFrvWaFDivGcfgkoiaUdATOx7enbKaabHegkf6Nf3zhQrRe7iZFIKnn8mFZOBmr6Aay4AC0bw6FFRh8Ss2QlK5W8Dmxl5M4YUMqO0HDB5ZuQgPNcrXYu+Emve+JcdB2ufFnWyhfbdijwpKq96DzxxZows1pmGH89TpiJyzZetj5oEKm9GO3KZtgIu5Uw0EkVAu/Vkbcwg39gt8sQskZ45/kjA73ByfomAvfhumq6RyhoSQ8TK3C7jEaNJr85nt16/S51eyLDdooK48FEKima+kXa3qDhTF6QqaKKaDGAhNRieArw2CdtZaEST+8Cm5kPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vs1BQ94mQrhkXBF69wU1hV19Pw8/yI3UUQFY9R7/ifA=;
 b=Q3c9hRmQWs2WOui3XZgze/9Ks8axUo2efD4Rjzcw3042sOhw24Dy06TEwg3d+cfYrgKUAbYzuo57/i9AvB8GDK3akT/gNiO5rf/z5kn6ZxehN2MfQlRo4CifvbJVXoMs8jUD5bku/AkSlcxiTzl5dy3JGKTJpRxpQVl4lXuIeno=
Received: from SEYPR03MB7841.apcprd03.prod.outlook.com (2603:1096:101:173::12)
 by TYSPR03MB7308.apcprd03.prod.outlook.com (2603:1096:400:416::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Sat, 22 Mar
 2025 03:22:55 +0000
Received: from SEYPR03MB7841.apcprd03.prod.outlook.com
 ([fe80::aaf1:1155:5a7:a1f]) by SEYPR03MB7841.apcprd03.prod.outlook.com
 ([fe80::aaf1:1155:5a7:a1f%5]) with mapi id 15.20.8534.034; Sat, 22 Mar 2025
 03:22:55 +0000
From: =?utf-8?B?Q2hoYW8gQ2hhbmcgKOW4uOa1qSk=?= <ot_chhao.chang@mediatek.com>
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC: =?utf-8?B?Q2h1bmh1aSBMaSAo5p2O5pil6L6JKQ==?= <chunhui.li@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?V2VuYmluIE1laSAo5qKF5paH5b2sKQ==?= <Wenbin.Mei@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"sean.wang@kernel.org" <sean.wang@kernel.org>,
	=?utf-8?B?SGFua3MgQ2hlbiAo6Zmz5b2l5bu3KQ==?= <Hanks.Chen@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?UWluZ2xpYW5nIExpICjpu47mmbTkuq4p?= <Qingliang.Li@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, =?utf-8?B?QXhlIFlhbmcgKOadqOejiik=?=
	<Axe.Yang@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 0/3] Add EINT support for multiple addresses
Thread-Topic: [PATCH v4 0/3] Add EINT support for multiple addresses
Thread-Index: AQHbh46igWczZ4brqE21pUljyjZnMrNygCiAgAwkH4A=
Date: Sat, 22 Mar 2025 03:22:55 +0000
Message-ID: <94250d48cbb9750ad9cdfff1ddf9d60c3b70a6f1.camel@mediatek.com>
References: <20250225140732.21557-1-ot_chhao.chang@mediatek.com>
	 <CACRpkdYSNMV2jymbHaxRp-PmzbbkEJ_eUcT20whYw3gdhEGOGg@mail.gmail.com>
In-Reply-To: <CACRpkdYSNMV2jymbHaxRp-PmzbbkEJ_eUcT20whYw3gdhEGOGg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7841:EE_|TYSPR03MB7308:EE_
x-ms-office365-filtering-correlation-id: 74f71d7c-1a41-4625-290c-08dd68f0d62c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dGk0K1RPZ0FOR0FWREF2U0ROMmI1REcyU3dZZVpUSi8zd0JZZWcwckwzTjBm?=
 =?utf-8?B?eEViaWwrM0pGY0FBOGwwelp0ekJ2N0JNY2lvelZjQiswZkk0Y2FJYlZlazNC?=
 =?utf-8?B?d0U1YzVGdEFZNnN5cURBaWxKZHg4TW5EZGxhbkpDcktRZjY0TWc3NlZOK1pG?=
 =?utf-8?B?Tys4NXg3d2RjQmNrQ2Zvci9CbHhZRHdEOXUyRmYybFphUXZNcjNiWWpST3NK?=
 =?utf-8?B?VGRsZ2YyeWhEczg3dkpUS0UybXBJeloweFpEZUR1dy9sckpySlZhWHpCQWo1?=
 =?utf-8?B?MEIvckQ3a2Q1MFZEWEN2UVlVbUVsdCszRG5LdHNZQ29GU2xUVFFiTXNIK1Uv?=
 =?utf-8?B?bTZnSnA2cE1jYmtVNVF5TUFudXdBSG5MblB3QThTTmpKcFQ4REFnOWgrWmly?=
 =?utf-8?B?ZSt2YThvSkU4bEwxbWxnRjY1TFRESVVJZ2xyOFJiKzhEaTdsRjd2RXBobkRE?=
 =?utf-8?B?RmhudnJmcnFxOUUrdEZnWjU5RTNXMUwwN2pld3lkVjVWb2ZBb1QrYk1PZnlU?=
 =?utf-8?B?MUp4WTFIRmo0ZUtSUnBFU08rNmpvTmZyVlQxYWpld2dRa24rd0V3RHdpb0N1?=
 =?utf-8?B?NzVXeEpKUFNtbHJtZUora2JDYXhobWtXKzEvZHAwRWJpTHkzd054RnVqUWxW?=
 =?utf-8?B?NEJxYS80czhvZlh6aUMzYmxMWHhlU0ZBSkQ2VjRFQWpwK3ByS0FaeTVoUWdT?=
 =?utf-8?B?VG5TMFpXa01zd0ZCZjhsYUNVblg4dUMzczI2cmFHM1ZwODBOZmt3ekxHaklr?=
 =?utf-8?B?MjhlQytUOE44VVJMZExhSVo3YjA2VXFCd3BNUXIveGN5Z2ZZWXNYUVhtOFJB?=
 =?utf-8?B?aXVWcTNWMXRNSEdsMTFtU0xqcEVHem4vbmExcHlYNDU4Ri9hQjVKV21tN2JZ?=
 =?utf-8?B?aktaMlhNcmdoOHBpeGF0QURPVlMzeGE4enRodVJBamlCVmVNNk9DOStLUjM2?=
 =?utf-8?B?SnUxYXcxdGdGVDc4eDArMEVFTG1rSHY5TkFFSmpLMWY4cEZWWVZQZTA2Ymo5?=
 =?utf-8?B?eVhBZXhTem1zQlYvSVRCQUFzMC9naFBqVUZFZlVBWm5DcjdpTmlKY3Y4ZzhN?=
 =?utf-8?B?VGpObXNwNWphUTUrOVJTdnI0aXowL2RRb1JCRUJvYUUzNTkvdWdEVzB4eUhY?=
 =?utf-8?B?R2tCNSszM0kxNStkVGg4MXlicUFJWks2VkpnTXR1WFFqZDNVc2hQT002aC9B?=
 =?utf-8?B?dTM5UkJrY3Y4aHJlOGlvZXJveUFrWnpleGdXODJ3bW9HNGxza3E4TU9CSmto?=
 =?utf-8?B?Tmc2UVA4YXh1REFoRkQ1OHJPNUx2YTd2SWozSGw5dGhaY1ZTWkcrdEJ5RkdS?=
 =?utf-8?B?TEZkNzFoWmVGOUlWYUtSay96ckRHNHJmbkgybWhkS1pWR1RIVjRIOGlvVXl1?=
 =?utf-8?B?dmd4cjJ6L3drOWIvcjZ3ZnpJcTZ4cGMwWWdDWGhpNno2bG8wUGYzbmkvbmdt?=
 =?utf-8?B?b0RmS0JUNHlhdWhVNXArb0laYnZRWVhXd3BQYlZKT3ZXQXdJSEtmd3hHR3Jx?=
 =?utf-8?B?akZ6cFk3SEl2cFNZMCt6RGNHbnlYdm11ZzRxK2dISFc2V0ZueXdmZUxrSEJt?=
 =?utf-8?B?S3FGYm5mcjVwUWZ1OTlpT3lqalcrdE1BbmU5b1JCVkg3ekIvOG1FQ1Q2bW5a?=
 =?utf-8?B?bFF1Y0VSWG9nL3pOdHh1aVVROEl1RWo0c0VOWTdGaWZhTkxlY0NHelRaNzhz?=
 =?utf-8?B?NHFwcVhyN2gvVitqVE9iWlZQcU5tcE14U1dvdk5mZGZRQVk4OE5CdVlybnRn?=
 =?utf-8?B?dnZCclVjMWdmUFJRUjVtM3B0eEFVekg4UXo3SS9tZHA1MnBVVUlCMk10SFBW?=
 =?utf-8?B?SnBvcmNBQU1NbUxFWjVORTQ0cHdtSXVVaWJFRC9nVDB4NlprcWgwbDZ3WUpW?=
 =?utf-8?B?Vno3RWkzK21WVkVISS95T1o0a0x1OFJPaW5RUG5KRXFBZGpIMittL1ZMdExl?=
 =?utf-8?B?ck1Gc0RPdWFJanNDb2pIcFBLdkU2bUFmM0VBczJrZGkwWFUraUpxdmx5NkVH?=
 =?utf-8?Q?ZryTc+Hf1i53HI9Oh9LCyRUxZKkwWo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7841.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1BXbitXMndXcS9HaU9NWGVubERPZXRqdEdqQ0kyQmZlVi9aSlYxSlBYL1Az?=
 =?utf-8?B?Qjhmdjg0SGd1VkdPQjF0NEpKZHUyQWxQT01SQSsrUnI1MVJ4TmdCN2tGVStu?=
 =?utf-8?B?bnU2SVVKRHNDNWtRb0dpbFBwd1IwTmM5RmY4OHBBbVQxWEErcjJtc2FtWFNS?=
 =?utf-8?B?VURBL1VBU1ROeForNzQ1dUh6a2FrYXpGT2dQWkluZ3pKQWNzckJLV2p6MWtS?=
 =?utf-8?B?SnJqWDBSY2VMbU9iRGgzNnd2M3VIbUVDOTZJQm82cWJVY3Z4c25mMUJ3VGhW?=
 =?utf-8?B?bi9VQk16ODBrVk1MOWZwdGdMaUhZeGJLRzI5UkZVVWI2Y2dGNngvTnBzNnV6?=
 =?utf-8?B?cDZrQkNXcFdLclpsNmRTRHdqV3VKMzhGK3dCMEpieHdqZnV0Q1cySk9peGQ1?=
 =?utf-8?B?cWZhNkRuY1FPVXN2Y2VZUzJMWmZ3ckZEZUk0UmVHcUFxZmZ2b2piMmRSVHAx?=
 =?utf-8?B?cHVLaGc0Tkwwc3c2ZXR1K25zQlBBZ2hVaGdBQ3djTHlRZ1RLTXFoWnhQZUpZ?=
 =?utf-8?B?NmdlQTRTNnZRc1A3WVRsQzJvc1d0T09aMnE3VUc3VTQxL0xGZ3hYeWtBMXha?=
 =?utf-8?B?OXVWaFRmVU02SlFEU0c3T0FxZWlicklsVVQrWktEQlJyR0dzdkFXZEhFU2FQ?=
 =?utf-8?B?RFZ4b0Zibjg1bmp6MUVIL1lobURRRm5FNC85YWhGcGJGZFlJbEJCUERLelFu?=
 =?utf-8?B?aFphQXhmRDdNU1h0N2ZuVmx1WW1WcENBVWVCeWNnenFNMm92bHBpb3RJQURL?=
 =?utf-8?B?VFpDN2FVZjY3Z0FhL3RTQ3k2cDA1aGJ4L1NBVWJKVTc4WkZVV3p3SDlzUjY4?=
 =?utf-8?B?a1RjRXR5bzNsWkNHRlJ4V252blJqODduanpQaTk2Rkp4KzRHa1NLWi9MYVNw?=
 =?utf-8?B?YzJzRGFFeGhGM0JsdTlicEhPY2NTaDJ6SUF3UktlTGVEZjFsaUlmUWxNeUNI?=
 =?utf-8?B?QThZWlcwOE1UbHo3TTQ1OGlLQWlUOTNDd0JWY2pMay9ORUFpYldXMDhmQklP?=
 =?utf-8?B?dDRDdlQxUzdsNXJ6RFpIUG1hWmxUM212Uk9CK0hZaklKT0hhZE1GVUZ5SVhw?=
 =?utf-8?B?STUzK09kc2pxQzNTd1gvRXlPNGx3dlJodjJ4T3AwcFV1L0d0UU9yWnFwZS9a?=
 =?utf-8?B?NEJLMXJ4Q1oxZTA0SHdObnRnQjFQN0dTbUp6YUdmQ29XVVpGM0hFamp0dXlJ?=
 =?utf-8?B?bUdoMzhUTzNHSXFicjFCTGhxS0IrMTErVnJYby9UMEljK0lxVTdTRDNDdVVn?=
 =?utf-8?B?QTljTGVwN3A4eGh6M28xZ0s0dmxEcGIrZVdIaU9LRTAvVzlrbzFaT3pEV1o4?=
 =?utf-8?B?QWZ3RUlNMytWYmJFeUR3aEF1bXJESlpTaVdxdDVOcHE4RjhDbzRQSDUvKzJr?=
 =?utf-8?B?S2Y4TU1zOU5IZnNOSEpua2NIbWtMajhQUjNZUkhndnJVTVVTcmd3ZHFZdWJy?=
 =?utf-8?B?WlFIR212ak9jRlVJdTQxYVJyZ3BPUlJSVUlxT1JpQXVaY2w0Q2Z2SXZRY2g0?=
 =?utf-8?B?a0oxWnEvaUVPUmlucCtnd0g4cXIwMTV0R1RNM2ZzNFpGaG9GTGNQUWtwOFZs?=
 =?utf-8?B?MWlKdHFwQmczSC9HbUhjNHRYUStJR25vd29kTEI0dmFhSkhmNGxDR2NQWUd4?=
 =?utf-8?B?VmZDODVlaVJobU5ielI0akRxZFR4SVN6UjEwalprejVWVytvaC9zMFlqT1VP?=
 =?utf-8?B?c1dzcmhTaE0yLzRGSEU5eTFyQUdwdG1MWFRXVVNQNU9uR2VHWXdCd2Ixc1VS?=
 =?utf-8?B?cWtuRk1tTDZsbXRZVGo4cjVhQS9NaCtYVkVIV0dUcTJpZmczamtLNExtQ1U4?=
 =?utf-8?B?QnI0N24zb1ZtRmpPRjl3OXVqSUcvSHI1ZU9xRFFEY1lLVE8ySlVuRms2TmVP?=
 =?utf-8?B?NUhIQzRkTkwxSUMwMWtUdXZnOGx0QndHR2N1ZFNYYnJDcVkrRk8wOXIyaTIw?=
 =?utf-8?B?UExmN3dYTklObzhJTTVuVW5aTE9GZENDbUQ0Y0VWZ05xc0RYL2xkeW94K0Uy?=
 =?utf-8?B?UVZoRVIwVzUrZmxzdTZmOEhyWFFZQUdCMEMweHpVbEE5MXk3eWxvbkkvejMx?=
 =?utf-8?B?R0FQZkhnbXloUmhZcEpDaWV1SXJCRERoVXk4cGhKVTdraWxncUJLUzdPODI5?=
 =?utf-8?B?NGtYTkhNVTc4d1Rwei8xeTNzejNramxMYTJWZ20zWG9vVDVQTVBCcWdabkhv?=
 =?utf-8?B?ZWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <43EB1E1C6BDD9043BAF4B43C75EE6CFF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7841.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f71d7c-1a41-4625-290c-08dd68f0d62c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2025 03:22:55.0675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xxcGbeCGOcq9uRhCBhLFZyCHuAi+hmARdxaxZq8knBoQ3Wfy9YD69JELa+xNbs4/vZAS5/U/0Mq3QTXQOHRF7eAlCUsGjtPV/T6EDHXrdk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7308

T24gRnJpLCAyMDI1LTAzLTE0IGF0IDEwOjU4ICswMTAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiANCj4gDQo+IEhpIEhhbywNCj4gDQo+IHRoYW5rcyBmb3IgeW91ciBwYXRjaGVzIQ0K
PiANCj4gT24gVHVlLCBGZWIgMjUsIDIwMjUgYXQgMzowN+KAr1BNIEhhbyBDaGFuZyA8DQo+IG90
X2NoaGFvLmNoYW5nQG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+IA0KPiA+IFRoaXMgcGF0Y2ggZGVw
ZW5kcyBvbg0KPiA+IFt2MywyLzJdIHBpbmN0cmw6IG1lZGlhdGVrOiBhZGQgbXQ4MTk2IGRyaXZl
cg0KPiA+IFt2MywxLzJdIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBtZWRpYXRlazogYWRkIHN1cHBv
cnQgZm9yIG10ODE5Ng0KPiA+IA0KPiA+IFBsZWFzZSBhbHNvIGFjY2VwdCB0aGlzIHBhdGNoIHRv
Z2V0aGVyIHdpdGggWzFdDQo+ID4gdG8gYXZvaWQgYnVpbGQgYW5kIGR0IGJpbmRpbmcgY2hlY2sg
ZXJyb3IuDQo+ID4gWzFdDQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9saXN0Lz9zZXJpZXM9
JnN1Ym1pdHRlcj0yMTUwMDgmc3RhdGU9JnE9djMmYXJjaGl2ZT0mZGVsZWdhdGU9X187ISFDVFJO
S0E5d01nMEFSYnchZ1VNbnd2WkxpdjdQTGZCeW51cGZlelVZR093U1dGWGNDdWJoLXRKbjR2b2JD
bmFpU1JSWFJnYWtXY1FCZG9ROHMwVk5jQm9RVXB1RkZobExndEpiLU9BckR3ZkpLY1EkDQo+IA0K
PiBTaW5jZSB0aGUgZGVwZW5kZW5jZSBzZXJpZXMgaXMgbm90IGZpbmlzaGVkIEkgY2FuJ3QgYXBw
bHkgdGhlc2UNCj4gcGF0Y2hlcyBlaXRoZXIsIGRvIHlvdSB3YW50IHRvIHNlbmQgYW4gaW5kZXBl
bmRlbnQgdmVyc2lvbiBvZiB0aGVzZQ0KPiBwYXRjaGVzIHNvIHdlIG1lcmdlIHRoZW0gKmZpcnN0
KiBzaW5jZSB0aGV5IHNlZW0gZmluaXNoZWQ/DQo+IA0KPiBUaGVuIHRoZSBtdDgxOTYgc2VyaWVz
IGNhbiByZWJhc2Ugb24geW91ciBwYXRjaGVzIGluIHY2LjE1LXJjMQ0KPiBpbnN0ZWFkLg0KPiAN
Cj4gSnVzdCBzZW5kIGEgdmVyc2lvbiBiYXNlZCBvbiB2Ni4xNC1yYzEgYW5kIEkgd2lsbCBhcHBs
eSBpdC4NCg0KVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24sIEkgd2lsbCBmaXggdGhpcy4NCg0K
PiANCj4gWW91cnMsDQo+IExpbnVzIFdhbGxlaWoNCg==

