Return-Path: <linux-gpio+bounces-16754-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 86002A48EFF
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 04:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 690B07A6FDA
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 03:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A44186294;
	Fri, 28 Feb 2025 03:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IV25HCSu";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="v2kpNOon"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE1D17A2F4;
	Fri, 28 Feb 2025 03:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740712325; cv=fail; b=hD81goZ1D+29fNnG828OkQvHXB341+rjoCB7Zzvlo3QoagpHTzf+DhPFI3jeT+j0ThhviTprR5kQswavrOdlmcM7MqA1i6j/jrBPpZGzb8dfuoZJQh47YWTdXVyEw0z5RAMMBGpKX/xWOjxxQ2JspdoAUIrdpuGJgYf8s5dsyLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740712325; c=relaxed/simple;
	bh=LfZHxHES5mH7z33baFbQXEO2oKwLZihUXkGlW1GM8fI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SL+xYwt7WY9U9oM8LwxTJ2Qk4h7HVuibA264s2zUK3NQu9ozF4tNm901eD7XeWFp3COa6kbqrVszCUWjqojfeEJuMTbvG+j1OMDmlo32uE9rdFxKx4U31lMJsUZf3toiYn6C46Yz/fYu9BOPasVj++NI6+hNZJ8Kt4hToJLmIEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=IV25HCSu; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=v2kpNOon; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: be580242f58111efaae1fd9735fae912-20250228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=LfZHxHES5mH7z33baFbQXEO2oKwLZihUXkGlW1GM8fI=;
	b=IV25HCSuZB86fvBrLICNS5hr2Haeof/le7kO5LFMai9fETHCKct32Yc7nRSYN5SiuZHNQ3Y7DtUAAnhC+VC9NCvQWSqoJsZXP624hfG6zrTvwjkiAe7f2afCxHhug+jOBNKPt3gF1djhfd01iBeK1DnIoknZb2KvIdTIbTI2q5Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:94ef50f0-4ee8-4113-a53b-a01df52de70a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:1a99a7a4-5c06-4e72-8298-91cabc9efadf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: be580242f58111efaae1fd9735fae912-20250228
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 268938774; Fri, 28 Feb 2025 11:11:46 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 28 Feb 2025 11:11:45 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 28 Feb 2025 11:11:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hs/DRO3592LJKzMw0Jc41+KLmuexgzXxF5UB4IfiYvr5fzkG9K0LbFQZlKs9zkzz+afi1bioMLlfFwsgwdew1/CmmZ1haht8BO+ILl5cgOdthtCJ5FmdNQWae+44sCaMaiMyVMeLEazzohCS7Jw9iseWyEhSrUYq112q3F+Wprgg5E2zxu6UFxItZU2wl9AbfKzdeTmNX8bpKANF+ME+IdcTXqwKSLl9dYMYQVHr8ArK1kusfxVVPXuR+E0ZkTVmmoXD/LBluzBwsRGC+LLbbhkNVj5F40nnQnNcbG++KWzp2NlxEBRrSqKJC6KVdX7lPfnQfuDfV2wYhtAzuR1xMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfZHxHES5mH7z33baFbQXEO2oKwLZihUXkGlW1GM8fI=;
 b=ZrODolZAShYbCcO00tjsKWkzLbNDKztc/qalXDTNrzWwu4hliI45j8JtsG38yh3Es2oRcncUv/36F8+ozTuLjlP3GOCPRVJv2K1ytFzMB8Bn7n2incYFK0d7Xdok2Wjx0ja+Dxhi5o8Q3gnYn+NjYjxPHegntCgl9W2gS/ULQJvJ7qMjWkfHvtTz/UeyeUwGyLPN34hBPPjE9m6wj+VgnqD+KtM+BvBwYp6m0KP9AGz2AVblAqNGPTB8DLCqvOIFJXc4tsTdXRgrjGpFq9AFyXUiQqlgagWKGPXXKRMpxhie7/dx7M2py0xsvYO1mVMW8bnT1QFdFxtd8wFQnM6RGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfZHxHES5mH7z33baFbQXEO2oKwLZihUXkGlW1GM8fI=;
 b=v2kpNOonFmVx2x0y1gRWvxnRWOIY4/uSyGYyr2zFJYhTUwJznJLaS5TYdZuSd+uheeN5V2BNF8K1oE2GP64U0Gm3T3KF39jMESjOobm5V7g4N2ikagibgNWqYw6V79JDIpvTXzBOKrUxJmVkJ+0MUq8jgo+HCEbQ6fpJrWxDIq8=
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com (2603:1096:820:70::6)
 by SEZPR03MB6849.apcprd03.prod.outlook.com (2603:1096:101:94::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Fri, 28 Feb
 2025 03:11:42 +0000
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a]) by KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a%2]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 03:11:41 +0000
From: =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?= <Lei.Xue@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?V2VuYmluIE1laSAo5qKF5paH5b2sKQ==?= <Wenbin.Mei@mediatek.com>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	=?utf-8?B?R3VvZG9uZyBMaXUgKOWImOWbveagiyk=?= <Guodong.Liu@mediatek.com>,
	=?utf-8?B?WW9uZyBNYW8gKOavm+WLhyk=?= <yong.mao@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "sean.wang@kernel.org"
	<sean.wang@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?QXhlIFlhbmcgKOadqOejiik=?= <Axe.Yang@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8196
Thread-Topic: [PATCH v4 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8196
Thread-Index: AQHbiX7EGXUdi4vVl0yAUIn/baARnLNb/UqAgAAMsAA=
Date: Fri, 28 Feb 2025 03:11:41 +0000
Message-ID: <d5bf6e1b6c277e6431cffeef66a4766f59f94fe5.camel@mediatek.com>
References: <20250228011702.16493-1-ot_cathy.xu@mediatek.com>
	 <20250228011702.16493-2-ot_cathy.xu@mediatek.com>
	 <174070957527.867625.13463640154036333781.robh@kernel.org>
In-Reply-To: <174070957527.867625.13463640154036333781.robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5683:EE_|SEZPR03MB6849:EE_
x-ms-office365-filtering-correlation-id: 0a8edcb1-430f-421c-e778-08dd57a59f76
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NWlienB1ZHBqbC8vQ1JYVmJrWXVadzZvU0YrcXMxaGIyYmVrYjRPeTdTUm1P?=
 =?utf-8?B?SnJQWnZLazZWRnV2dXd0a0YzUTE4c1dSRlZzZENzUUxWNUlqL0VOM2hFMDhW?=
 =?utf-8?B?VjlVaklHb2ZMVHFmOGN6bWpNZnV4dnhpdEtKdmJFRWZuSXB4d3FlbTB0R0dB?=
 =?utf-8?B?SjZzUElZSVlHTjgzS3JtVzF6OHRIaEpzTXQva2NPV2FBN04rTmtDRytGUzFs?=
 =?utf-8?B?SmZHU1JFQlNMZkF5TW1yRzhvcllRZ05mRE01L0dPMFFLK3lkVCtKWTNhNTN1?=
 =?utf-8?B?dU1LbGdKcmtpTDVia0dxR1pka2E4SmJuOUVCemc3UlU4YkZ0WCs0T2VXbG9T?=
 =?utf-8?B?SzlCUmczNXo3QnVWV1VVODA3WW16QmRhbWxjdDRaNWdkbzd6bjkxU05RTUVB?=
 =?utf-8?B?TW0rd3E5aTh6UGh4MWlDYjY4TkwrdEY1bzBkOEJtU0h5RE5pTkdHRkxWK2NX?=
 =?utf-8?B?bGpFd2pZMFB3dkN4RDNtbU5Za3NsWUl4Y0JuMDBQRlY1NEFneEpkbC9PaFQ0?=
 =?utf-8?B?TkZ5TmlSVzRJUDhKaXZzYkFJK2d3bFJuSlpVVkMrd2lGcGttUE1IZVJtRWdN?=
 =?utf-8?B?MUE5WDk3YmhXTmtpNFpGZzJyR3J2N1hkZFRNWVlJK0lyUkl0elVFd1NWbUhh?=
 =?utf-8?B?Tyt1NUVzcTFlQUdLUXdGeE1BcnFwWVpSRFRTQTdlclZvbFJsamFLOVdSaXdi?=
 =?utf-8?B?VERlUll3M0xoekcxK2J6YWFHN3BlYkNTRmxGUHdjVHd4SDZRSVhIcGRMTnhJ?=
 =?utf-8?B?Zk5TYnNkbEl1RzBicTEwVGIrZWVzT3FEcE5YQlJFb0VpOEhCYVVUc2NjSjRJ?=
 =?utf-8?B?Y0U2TUc3SXZSVFNQb21wcm16TW13aFE4VjR1M2d3SVFvOHg5SXlyWEJEVkJi?=
 =?utf-8?B?bnJ0dkcrSnE4SXk1dVNvcTU4SkpJWkVLbGxQRDFRTytaK1lUTDVkbk83aW10?=
 =?utf-8?B?Vk5pNWRKYkdHL29oNFd0TnlHQ3ZoYTBNTEdRbHoraE1TTE0wc3kxbnpuVExi?=
 =?utf-8?B?RC9jcnBhTHNITEV4VWt4c1MrWlBqVjQyS1d6bTFTRmZHdmNoUXR2ZXNScThl?=
 =?utf-8?B?S1A2Y00vSXFFeXpOQW1UZ1dvLzcxb29XYkR2TjhmVyswZG4xdStCbUdEc2FO?=
 =?utf-8?B?REtmZVh0ejZ1cnNtSnpuM2pwaWJqU1ZscmNyYmRuak5xU1dFbUpkdjZQREZX?=
 =?utf-8?B?LzdEaUtkWHh6Z1dLMEV0QWlNMjV0cEtYcEkvQkRkeFVNeUVYTmpYdVZNRTRB?=
 =?utf-8?B?bklING5qamRyUjNubGFjYTc5Zmlib29kbUhyNXczR3pWNCtSRldIVEltMnVa?=
 =?utf-8?B?cDAyYXBNSkxtWlhEUkI0YUwyNE9mWDJGY29FZ0hpcWZocVRTWFVCZ2F3ZnpK?=
 =?utf-8?B?OXRkSko1Y1dnaUdkWEZHUldUMEFUOUZwNHFTYU1yazdPNUdUQWJHbFZGbnBi?=
 =?utf-8?B?dFhicDU0dUlHY1NkM0hCeTVYcmhsQXJ2VDFqa2QrTUw4QkNpcHlXVGFMditj?=
 =?utf-8?B?V0FQS3lrM2p3bjhmcVkwK1RWYjE5U2VsN3laOUJXZnZaNXNsRU5wb3JHRSsw?=
 =?utf-8?B?NGlOWFU5Q1R1dFdvaVVLTFMxaHkzUlRMR1lhRGYwcEJTWjNjZzdWTERlUUV3?=
 =?utf-8?B?SUpWeVlPL2wwSnppQWI1a0VKNTlYQzk1WXdpbXcvVVJtU1g3ZlBJRE5vWUpu?=
 =?utf-8?B?ZFhiOC9EZ0x1ak5OT0d1UlBsVnFSQ3FyRHQxYjd5bGt5OHA1RVFHV2VhVjQ4?=
 =?utf-8?B?eFlxLzV6MXcrMGxSRjBaZXdEMzNUNFd2QXpiWVNrWVE1ejBuYktKcWhieGJN?=
 =?utf-8?B?dkNQVDdnWTk1SWhiUWlwSXluR1A5Y2tnSklab0VYVkZkSUVnK1Z1Z2ZjVm9u?=
 =?utf-8?B?ZnFVcTZTRytUc20wYklLb2FaWWRpWG9xZ3lDTkFqbUI3YlE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5683.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHdCRW1Hb2RNVjRiWlRjMGlVcXdvQlUzY1NoVHZsWHZldFBpR2hpcE1iSkpE?=
 =?utf-8?B?ajFrMWJCNitFME92TU1wZEVtLzFuTWUvUW5UZTlJbjJROVBNMjA1ZWtFdXhC?=
 =?utf-8?B?MHdTMTlGanljTnlBbmY3N2NtVXFONnZWd0diZDAzeStFZG5BeGxSSDV3Tktl?=
 =?utf-8?B?WnhCV3FoMFpnOUJ6cVZBTSswNVpWbmtRZUVpQzloMXZzZ09UVTQ0S3pPWk51?=
 =?utf-8?B?VUM3UmJ3M0FzTDIrakxWRTNCQWhKZVZ2bkZuUENSeTcxZVI0aDk0OGY4VlZx?=
 =?utf-8?B?VkVQWG1tb2ZobUx6L0JBRFlpclo5Z2dyck5KWTFCWXFXdjEvZjVaallDTGN2?=
 =?utf-8?B?alBSTlhsWEIvaGNpUE1lRnFZdVVxdVJ2ZnZWV3pVdFBnQWdScXlEdXdZU21V?=
 =?utf-8?B?NWpCb0Zvc0Z2bExaM1ZLc3AwZUUzZFZIKytLellGRDNBM0VmMXV5M3lTRkJG?=
 =?utf-8?B?ZWtpWGRuVURBOENOQU5ORmdVazdFS1hwMm9hMElkQkFOUEExNWRteUpNeHhP?=
 =?utf-8?B?MFduY1A0VzRKZXNRNm5Fd0dSWjVxdkpnbmk2TnExbEpNQTdCazlNTTNSdXd1?=
 =?utf-8?B?UVIwNGQrNGVhNm5CUHJWNUVxQ1RPK0ZMd2VIelN1Zk9Tc3dKbHVtVWM5b08w?=
 =?utf-8?B?aGhFRGY0b2x5dWVheXBjcGdUTkVOaXB1ZGxDYVFZR0grbjJRcmJMMFJFRW9C?=
 =?utf-8?B?anNiOHFQbkFVK3E3QmlqUnZyQjJkc1h5Ym9mZVlGQTY5bUx1aE5XaldTZlBv?=
 =?utf-8?B?S2hITDE4b1R4aXV4SGpQbEtEUjBWY3oxNHlMTG9LUUJQblI3M0tLOTBRKzc4?=
 =?utf-8?B?REFaeUhTb25rRTl4V1V5d2t2Yi90Qjg1VWhiQ0UyeXBDOC9zT3hZSHJTQ3VE?=
 =?utf-8?B?azAzbWxGamVndHJTeUgrb2hDRWtBcVJXWVprSEZuTC9Xbm1PM1RQMmVYaDlr?=
 =?utf-8?B?VUlkeE9VYkdOeWZZeGNFNXJyZUVmcW1sdmpYbThnd25hYnBHaERwNGJQbk5z?=
 =?utf-8?B?bG1aSW9RTEFNbnZsNXpRYWxyenJQY1JsMDhzdzY1NWFNNTZjbHNVSWFrRDd6?=
 =?utf-8?B?OGJoVS9TNDVSNGdUcTBZQnBEYjdjZ0JZb3BlSVc1MUpDUWp1cXBBWDN1enNO?=
 =?utf-8?B?djZCR01JVW9rSVVzOFJvbTlid1lIUHlEcnJKR21lT1ZKd240MnoxdDV5RWFJ?=
 =?utf-8?B?N3ZJVzlxNElpY0ZWK2dMRE1xU2hqSlc4RW4vU2RTZExOSDMyTmgyOE9EMU8w?=
 =?utf-8?B?VlMwd3pKN2xRVEJna1JvSHh2cDVReDNnTm9Sb1RZdXppUGtUcHBSTUQvRjBK?=
 =?utf-8?B?bDQ1K3FCTWNLZTJJQlIyZlhQZGNWd0pKSUFMS0hRV1VaZ2NSQlJRZDd1TjVo?=
 =?utf-8?B?SXRSS3lKdkRuMktPblkvTkwxK1E3eklGMDEzVng0Vm1hMU9rd2FoRXFkeElr?=
 =?utf-8?B?dnJIQ0FDc0xFVGhxdXNWT3YxMUV4aDlZTVIybm9ZY1RCb2R3RVV3cEpmeFZD?=
 =?utf-8?B?THRTMC9mVmp1TmlqUEVwMmZhNitYMHNHSU01aEFwQVpLZHNPVURCTDNCaUs1?=
 =?utf-8?B?NVpSS1JkL2VhbVNwUjBTNHk1NEp1WU1JRnpiQUtPRG1ZaG9HV21UUUhLbUNi?=
 =?utf-8?B?RVFKeGYzWFJTRVI2S21JM3ovc05nK3JNeTRIOEh6ZU02dVJMVGY3bFNIZXl2?=
 =?utf-8?B?bDRKMFFXeUFudE1INmVsUHNVQzdpUklZMzVWN2orZXdMU3hHbGQ1VEdPQTkv?=
 =?utf-8?B?VnhFNjhiOGpRZ1RWUmVuUjd2NUk1d1NWbGg3QkNxVkRSNno5MkU3aTlzME5Y?=
 =?utf-8?B?NklSQmUxejNLK2U0d1lvMzN5dWV3NWpYZEhFYkFrQUFZSlFRVlcxczNxZEpB?=
 =?utf-8?B?QUQ5VmFYdHhaQktSR2FZb2h4Y1pwNWppdFJFSkprOEJ1MXAxenNkV1RmOGZP?=
 =?utf-8?B?cDNDSVZOVDlDcVZwMnlMNUp1VEsrOXlRcExRdUl5Y2NIMzZ1YWIyL1NMRDRv?=
 =?utf-8?B?eWUwMS94Y0tndktUTTViV21ndytSQjRjbW5INkhWR2VJeEhrTkNCTjdJRDhF?=
 =?utf-8?B?UXVOVGZjRzcybUdiSENCcjNPQVhCY1laZmhXUFpMUm5YSE1ybWMwUlFRb2U4?=
 =?utf-8?B?UWVmR1ArcVJXUmFyRHg2Ri9iSlMxSS9paUtZdFJxWVg0a3pYTExjalBZZ1NB?=
 =?utf-8?B?ZVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A7B60F21655D5C4B97B994492440A3CD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5683.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8edcb1-430f-421c-e778-08dd57a59f76
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 03:11:41.2484
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qFXTBrLCluIEyPUv5O4fQ+XC0JHOXwfHZdZmvr8wHZT6WrW3cZDu4GaZ4dVH/Ila0dS9/+Gx8hL9TJE0Bt33Vkz4y4kh1G5dLSEiI5AyTU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6849

T24gVGh1LCAyMDI1LTAyLTI3IGF0IDIwOjI2IC0wNjAwLCBSb2IgSGVycmluZyAoQXJtKSB3cm90
ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUg
Y29udGVudC4NCj4gDQo+IA0KPiBPbiBGcmksIDI4IEZlYiAyMDI1IDA5OjE2OjI1ICswODAwLCBD
YXRoeSBYdSB3cm90ZToNCj4gPiBBZGQgdGhlIG5ldyBiaW5kaW5nIGRvY3VtZW50IGZvciBwaW5j
dHJsIG9uIE1lZGlhVGVrIG10ODE5Ni4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW9kb25n
IExpdSA8Z3VvZG9uZy5saXVAbWVkaWF0ZWsuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENhdGh5
IFh1IDxvdF9jYXRoeS54dUBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9waW5jdHJs
L21lZGlhdGVrLG10ODE5Ni1waW5jdHJsLnlhbWwgICAgICB8IDI0MQ0KPiA+ICsrKysrKysrKysr
KysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjQxIGluc2VydGlvbnMoKykNCj4gPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bp
bmN0cmwvbWVkaWF0ZWssbXQ4MTk2LQ0KPiA+IHBpbmN0cmwueWFtbA0KPiA+IA0KPiANCj4gTXkg
Ym90IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIG9uIHlvdXIg
cGF0Y2g6DQoNCiAgU29ycnksIHRoaXMgcGF0Y2ggZGVwb25kIG9uIGFub3RoZXIgcGF0Y2g6DQog
IA0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3Bh
dGNoLzIwMjUwMjI4MDExNzAyLjE2NDkzLTMtb3RfY2F0aHkueHVAbWVkaWF0ZWsuY29tLw0KICBJ
biB0aGlzIGNhc2UsIGRvZXMgdGhlIGR0LWJpbmRpbmcgc3RpbGwgbmVlZCBnbyBmaXJzdD8gSWYg
c28sIEkgDQp3aWxsIGluY2x1ZGUgdGhlIGRlcGVuZGVuY3kgaW5mb3JtYXRpb24gaW4gdGhlIGNv
bW1pdCBtZXNzYWdlIG9mIA0KdGhlIG5leHQgdmVyc2lvbi4gVGhhbmsgeW91fg0KDQo+IA0KPiB5
YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6DQo+IA0KPiBkdHNjaGVtYS9kdGMgd2FybmluZ3MvZXJy
b3JzOg0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9tZWRpYXRl
ayxtdDgxOTYtDQo+IHBpbmN0cmwuZXhhbXBsZS5kdHM6MjQ6MTg6IGZhdGFsIGVycm9yOg0KPiAu
Li8uLi8uLi8uLi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Ni1waW5mdW5jLmg6
IE5vIHN1Y2gNCj4gZmlsZSBvciBkaXJlY3RvcnkNCj4gICAgMjQgfCAgICAgICAgICNpbmNsdWRl
DQo+ICIuLi8uLi8uLi8uLi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Ni1waW5m
dW5jLmgiDQo+ICAgICAgIHwgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPiB+fn5+fn5+fn5+fn5+fn4NCj4gY29tcGlsYXRpb24g
dGVybWluYXRlZC4NCj4gbWFrZVsyXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmR0YnM6MTMxOg0K
PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9tZWRpYXRlayxtdDgx
OTYtDQo+IHBpbmN0cmwuZXhhbXBsZS5kdGJdIEVycm9yIDENCj4gbWFrZVsyXTogKioqIFdhaXRp
bmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4NCj4gbWFrZVsxXTogKioqIFsvYnVpbGRzL3JvYmhl
cnJpbmcvZHQtcmV2aWV3LWNpL2xpbnV4L01ha2VmaWxlOjE1MTE6DQo+IGR0X2JpbmRpbmdfY2hl
Y2tdIEVycm9yIDINCj4gbWFrZTogKioqIFtNYWtlZmlsZToyNTE6IF9fc3ViLW1ha2VdIEVycm9y
IDINCj4gDQo+IGRvYyByZWZlcmVuY2UgZXJyb3JzIChtYWtlIHJlZmNoZWNrZG9jcyk6DQo+IA0K
PiBTZWUgDQo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9kZXZpY2V0cmVl
LWJpbmRpbmdzL3BhdGNoLzIwMjUwMjI4MDExNzAyLjE2NDkzLTItb3RfY2F0aHkueHVAbWVkaWF0
ZWsuY29tDQo+IA0KPiBUaGUgYmFzZSBmb3IgdGhlIHNlcmllcyBpcyBnZW5lcmFsbHkgdGhlIGxh
dGVzdCByYzEuIEEgZGlmZmVyZW50DQo+IGRlcGVuZGVuY3kNCj4gc2hvdWxkIGJlIG5vdGVkIGlu
ICp0aGlzKiBwYXRjaC4NCj4gDQo+IElmIHlvdSBhbHJlYWR5IHJhbiAnbWFrZSBkdF9iaW5kaW5n
X2NoZWNrJyBhbmQgZGlkbid0IHNlZSB0aGUgYWJvdmUNCj4gZXJyb3IocyksIHRoZW4gbWFrZSBz
dXJlICd5YW1sbGludCcgaXMgaW5zdGFsbGVkIGFuZCBkdC1zY2hlbWEgaXMgdXANCj4gdG8NCj4g
ZGF0ZToNCj4gDQo+IHBpcDMgaW5zdGFsbCBkdHNjaGVtYSAtLXVwZ3JhZGUNCj4gDQo+IFBsZWFz
ZSBjaGVjayBhbmQgcmUtc3VibWl0IGFmdGVyIHJ1bm5pbmcgdGhlIGFib3ZlIGNvbW1hbmQgeW91
cnNlbGYuDQo+IE5vdGUNCj4gdGhhdCBEVF9TQ0hFTUFfRklMRVMgY2FuIGJlIHNldCB0byB5b3Vy
IHNjaGVtYSBmaWxlIHRvIHNwZWVkIHVwDQo+IGNoZWNraW5nDQo+IHlvdXIgc2NoZW1hLiBIb3dl
dmVyLCBpdCBtdXN0IGJlIHVuc2V0IHRvIHRlc3QgYWxsIGV4YW1wbGVzIHdpdGggeW91cg0KPiBz
Y2hlbWEuDQo+IA0K

