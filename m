Return-Path: <linux-gpio+bounces-14698-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A1FA0B333
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 10:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 422D518888A8
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 09:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E5023ED52;
	Mon, 13 Jan 2025 09:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JJSU58b5";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="QHf/jTW7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BAF235C07;
	Mon, 13 Jan 2025 09:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736760853; cv=fail; b=BaBTP/JABKsUpqZnIWhfD8bhaVnkLRtSBGJHgHTtgC7iR8ViMJqze/g03Hm0p3hkBjHDqAvGPscwksPXo1ZkulVm/8kAbSKhtiUT1n4ucRBt6r2inq/o/pwpusqaIOQDetySI+dA0gEclo6bVSkAlkoFrjtiiyeYMBsNLc54tFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736760853; c=relaxed/simple;
	bh=50hlA6fCUkYaPU0nYzjLLz25Pd91ih6E5QngtgYA3II=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HzMRFSvbUa5z943ZrKjPDBxleLFK9z34gRZLS4FLKS1Gm6aM+f6bitJJlWaRhSoGssxaZEc6wwAnXA7MeJYq5a8u95PUAsoxJnwnkbZJWMN4X/Yufdw92k7ngF9AcIj3q/9hSD8mvgFdeJt22wshk6XKZRhz5zGRLI5aZDouaVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=JJSU58b5; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=QHf/jTW7; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 88abcd68d19111ef99858b75a2457dd9-20250113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=50hlA6fCUkYaPU0nYzjLLz25Pd91ih6E5QngtgYA3II=;
	b=JJSU58b5PY30HeWJ7gix2IUpPAY4NUwLBhIOEZUAj8+uo24gU1MYlThxoIyXhxAgZSL9TB9ydbVY198NLm9Scy7WHwhsKHCtbspIrG6WyqGDGEZMCBbj1reuU4O2TFNZ79+Zl1iQhQTRlXgrjMOQvmBdYBrkQwpa0mYpV7QdsUc=;
X-CID-CACHE: Type:Local,Time:202501131732+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:62122bbc-e620-4749-a843-a9ea36fdd619,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:adc0cc37-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 88abcd68d19111ef99858b75a2457dd9-20250113
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 939546942; Mon, 13 Jan 2025 17:34:06 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 Jan 2025 17:34:05 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 13 Jan 2025 17:34:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJ2z8nVTx22M72LbYrFlPRFEKzKXek/ZS5cKe0UaTZoNNJG7zkIZgjCcAb04wOM8EC1AkwBqSYpBia1/4bmrWA0T/GaLq2JlRXpXKwbz5nEp/QW2z5O7r9yT9JZkj9HoFP6pFV8QIYEssX/n0ZnufObwhj6ob1BgvuO5v7tjSrAJwPK3Eq6NQfYUuJd3DsJqC/qKhJ308h2/ZKGTe2KiaDbY/8/oHZldNMwue8qYe8N+pWL70dFzIvTZAmHKQkiQmvPmoyrpBvNTdKIMo5nMWtlso7vr1KrXjc616wg9skQO646fjx5qzTCS+SJYfIyyLO3LSiF73pKf1QkaCD0eFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50hlA6fCUkYaPU0nYzjLLz25Pd91ih6E5QngtgYA3II=;
 b=ubs+GYH1wAFldRydIQ2hxgkvXvr6dLuXP0EvR/tWil7njZ6ZhLl5hEe0d6FzAbyHnHlc6rPAKM3p/5OCgSwWcVah1p0evFD5o3nFzVqL9oHzTTZENmHc2Z/fG3tjcc+dMJ08WswjTbLg3m31M71LXlxgq0htE6m15i9XpDLH7w2ZMuWKfRZkl//js5PZUyMYrfRtIooXGzx/LZvNJnbRH3ENKbPeq25uZNGH6Fpw+9nQuUP6iS+rteHZ66c9fis6Cz41SzW86wlFp6C66WkkvY9HWNakcJ3aTWBZ7/wdQx2P3jvU31OCSgo731WwcYH1wTVgUEqkueikiu5uoKhmIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50hlA6fCUkYaPU0nYzjLLz25Pd91ih6E5QngtgYA3II=;
 b=QHf/jTW7ifXxYBdC0+fTVc3CmydMlDWikmxe/M8/Pph0brsBRZpLtfywbdSgayciCerUgN0x0a2gXDWquuG+KbDwUWoiIHJEcN3CBVxuFGy5z2l+xIe+oW9i5gtSriFLbiavLWTdfnN8pSpHlEZ1folb9WPfLid/8fQmyMU7vpU=
Received: from PSAPR03MB5688.apcprd03.prod.outlook.com (2603:1096:301:88::14)
 by SEZPR03MB7513.apcprd03.prod.outlook.com (2603:1096:101:130::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Mon, 13 Jan
 2025 09:34:02 +0000
Received: from PSAPR03MB5688.apcprd03.prod.outlook.com
 ([fe80::d976:8c60:38aa:d1dc]) by PSAPR03MB5688.apcprd03.prod.outlook.com
 ([fe80::d976:8c60:38aa:d1dc%6]) with mapi id 15.20.8335.012; Mon, 13 Jan 2025
 09:34:02 +0000
From: =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
To: "wenst@chromium.org" <wenst@chromium.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	=?utf-8?B?R3VvZG9uZyBMaXUgKOWImOWbveagiyk=?= <Guodong.Liu@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"guodong.liu@mediatek.corp-partner.google.com"
	<guodong.liu@mediatek.corp-partner.google.com>, "sean.wang@kernel.org"
	<sean.wang@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] pinctrl: mediatek: Add pinctrl driver
Thread-Topic: [PATCH] pinctrl: mediatek: Add pinctrl driver
Thread-Index: AQHbNA7A0ceBiMFMO0Kz/ALR4pUu7rMU1HCA
Date: Mon, 13 Jan 2025 09:34:02 +0000
Message-ID: <91c30d77f75cd59fa93f788c4be906288ed5b14d.camel@mediatek.com>
References: <20241111074030.25673-1-ot_cathy.xu@mediatek.com>
	 <CAGXv+5GC1zoTnSQueDOtH8JRB6R5cg6mBMzAoRTsWPKVWAxGyQ@mail.gmail.com>
In-Reply-To: <CAGXv+5GC1zoTnSQueDOtH8JRB6R5cg6mBMzAoRTsWPKVWAxGyQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5688:EE_|SEZPR03MB7513:EE_
x-ms-office365-filtering-correlation-id: 341db27b-8bdf-4ad8-086e-08dd33b56a9b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bXFaeXIvOTJ3Wjh2MjNMM0s1K0tiYUhkSzh3Rmx2VFErWms2NllCOE9EZXdR?=
 =?utf-8?B?c2hMOEdJSkIxc1R5YTZHRy82WFV2VmpnMXlOUzl5b3I1UU83UnFvcnd6WkJ3?=
 =?utf-8?B?bmlpSXFCS214VkRJQ0dMUmU5QWU4TkRwdllsckY5cjlOS1dxT2Y4SHNtV042?=
 =?utf-8?B?MTJ1YWNQNHNHcTJpcm9nd1RiNkx0NXA1dTNZQWlOdmp0VkY0bGFBVTdkMnpu?=
 =?utf-8?B?MnVHMmJOZ3piTExHVi85QlU2RitraVkweGxjeWI5dmpSNjNKYUlEeW00eHRv?=
 =?utf-8?B?b2dFUkV2WVhUeExqSEdYNEN4OThQSjU0cFJUUThlN2ZyS2tJem5iSDlqS0J2?=
 =?utf-8?B?Z1huZXo3RXJJRWxWaDY5NzFHcUVibGltSHF3ZWNwcTBWZmZmWWhWeEpCTk12?=
 =?utf-8?B?VVp6VmhLNXYyS0dVSEw3cWUvMUVETFhteWZwNFoyc1U4VE1kckVyenlHdE96?=
 =?utf-8?B?aDVwVk84VTh0VmVudGI4cUlwK2x5NW5MRGQxTzE4V0lvc3QwNFZjbndmZzF1?=
 =?utf-8?B?S0JqTmJmMGU1bDFWMjI5bzlySGV3Nkw5L21LNy9BLzdrc3ZjSklyeEZsdVVi?=
 =?utf-8?B?RWRySFVUeUxCWW1jdmNLcDh2ZXdWQ2U3YjdXYkhYTUh3a0tLcWx3WHFFRmcw?=
 =?utf-8?B?TDlBYy96ZkdkNEJYa2lpa0ExTURDKytFKytOU3BNZXkxTWppMXQ4aTNmYVRr?=
 =?utf-8?B?MEtlcFc4R0RDbkdweVRkZW16eS9jVWJ3VWdUSXVtK1dIcnl3TGlJU2VkZ0F6?=
 =?utf-8?B?aUVLMkJqU3hYZHZ0ZHZYZURQdEdLU0dtQVlENHY3YXFGSjhXc0plQ1dBM0ZX?=
 =?utf-8?B?UWkvQklQQ01hUkNIMWFuYWM3ams4bnhnbU5NK3A1dWdGay9OdXVRWTI4dnNk?=
 =?utf-8?B?WE8vMnl4TEd5MVpsUXZXc2JXVHZMYWk1SFZvWlYzaXFxdkZxdmhXZWQyc01M?=
 =?utf-8?B?ak5JcDJBL2gwR0pPSTN0VUx1cVF1Ym9IdldYSSs0ckNid0RkdHIrSW5SMmUx?=
 =?utf-8?B?WHRuU2g3b2FMN3FydWdWY0gyRldpcGxYdlJjVms1WGxVejVMRmNPeUN2Rm5v?=
 =?utf-8?B?dVY1OWh2bHBvbW1HWk1BSUg2WkdEMFZsRVhPR3psck9UbGhXVzBQbTBoZWhq?=
 =?utf-8?B?WHUwN0t5VDd6M3hlU3JTMzlLV2FCbmV0Z1JDbzJqL0IxZ2U1M1NIYnM4RUw2?=
 =?utf-8?B?V1NVNjk4ZHNvSnBIWWVLZmV5cnRQbU1pWXd2NTBqeU5NaFkwM1ZsbnVpM2d4?=
 =?utf-8?B?ODJJMGRuaFNtMldBeEpMNVNaZ0lDRVZGRS9SVm9DTkQ3TExQc05leFJDeXVv?=
 =?utf-8?B?NzM5NjY0d3ZHZEYxRzF6VG9ZNzBscG9ZUzRnMkNsMVBuZGI1OWV4eGRSN2Rx?=
 =?utf-8?B?cTVndXVhazVncTRVcm5KYmZxRldsdXcxcHhSOTFFVHNFTHU5ay9hVzRkVCsx?=
 =?utf-8?B?OXlmT0xIdHRoT1l1SEd5blpUSGIzMk1FbmU2dVZsOHRiUW41WXpCaFBKWVcv?=
 =?utf-8?B?UU9XdlhuUSs0cmJiNVpCVDYydXVseUlVZ3kvb21tWXFaamNuSGlORkNTRkJB?=
 =?utf-8?B?STY0bm9RWnVLV3FUWUI0MTBhWXpaOXVnTFA4VEduWXNHZVY4SXlHOTNDcGpM?=
 =?utf-8?B?N3A0L0VTdTMwYzl5bXVlYXNIWHNheFNsQ2taM3lZQ0dDaXJyMTIxckhoT1BX?=
 =?utf-8?B?NEtTRkdnVUtpWXd6OFEyaDBiRkpPWWZqVXFyQTBXV0VJYzZ6LzRBSFJxc1NB?=
 =?utf-8?B?VGc3ekdPaExTK1NaUTJwb3ZqSHFRQnZCOXV1emlYN1NQNGxMSHA1RENNK2ZB?=
 =?utf-8?B?YnlKYlRadHVXcithQnR4cWhuclFKRUVtTEtBUmREYWRXcVNURHRDK0xsenpw?=
 =?utf-8?B?VHhvMDQvOEV4c05rK1lPUXJpckViL2ovZWMxbWt0MkowWlR0QnBxdzB6SFdq?=
 =?utf-8?Q?Cw0omXfGdo1tD2ZTRoz4B+pDUujmjkwb?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5688.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkNUSDk3U09pRDVFcnpYdlFVRXV3ZWRjZDdkK1UrQkQ4eDlXMTBTRkJjTG40?=
 =?utf-8?B?TjREeXovN25RdTFmbi9WY3FOYTFINXE1eUdibGZyVGh3cy9BdnNlRGRINGVi?=
 =?utf-8?B?QVd2TGFlczh5cXBsS3VFTzJrTGZxZzZyOSsvaUl5MzhweEFjVDlFajJ3eUIr?=
 =?utf-8?B?UG9uY1dlM1dKams0dmZpVWNJSzYvNkRkRG5zOVNDTTV0K2VIQ3UwTTE5M0RR?=
 =?utf-8?B?elVaK0UwWFNIQy9hN2tOZlVOMmZkTElZNTZ2b2RRRWluVzJGQXJuSjlyMjVi?=
 =?utf-8?B?Q05Ka0YvaXErVmhPSE44aFNNbHd5Ny9xeGVlMHNzek5EakU1M0QxRGIxa0J6?=
 =?utf-8?B?VGdUcVdyVG8zbUtMT3c5blZ3NlQ5MVpkYndNbm5panlhUkdNQ2ZGTVM1M0cz?=
 =?utf-8?B?SktaUldoSk1UalVYeFBxdWd1RU5JK0N1VVhkc0ZwME5DSUZiQkt0RE5jSGF3?=
 =?utf-8?B?VE5xMWpkUElwQ0hUb1o1ZkRvZFU5TTN0RHEvbjZ5cG9CSG05dlRLSWx2dG9x?=
 =?utf-8?B?cGxkTzNabGtVWEhQZDRlZVZidkRENGx4akhVSlNSeTZaVldYWnArQUVXblB1?=
 =?utf-8?B?dWZwMXFjTmE0ZGNCcEw1d1kzQ3FlTGVldmg4MjM2UW9ZUFg5TjlDUHltYjNq?=
 =?utf-8?B?dVFNV2V0cDZSN01KZ01lMTBZNGVGMngwWlhTRWtHL3NlWTRYMjhHZ0o3Z1Bm?=
 =?utf-8?B?KzlDUHBCWkhDT3R1Vlhyems4emh2T01jOWl5OHZQQUJVNHpmSG9jL0U0T2RN?=
 =?utf-8?B?RDR0eCtaMnc5OHpueWd0SmxiY1Z2S0xTZHlwL3RYNEVCZzdrNythSlhEZnRF?=
 =?utf-8?B?K1psSndScU5McEZCdWFoTjZxMXNickt6NFpoenByUDZCVGFtWGZQdGhCZ3Ro?=
 =?utf-8?B?RHRLWiswMVp4Vno2NFg0ZnZXdmFtb2tEeFdVcUZML0U5M0YyVFlQK01OWlo0?=
 =?utf-8?B?alZHZ2xkS0pSQnpUN1p6S09IalNBY1J5RzdyY0d3VnkySHM3YmgyS2VmNkJV?=
 =?utf-8?B?SHY0NXBUeHh5MXl4cVFKY3g3WU5Fa20wai90WUxza1VlQXVoaElOb3ljaEpr?=
 =?utf-8?B?cVRsNGtrNFhreXZIYWh2UFVka1NndEk3ajVuTkYzTE5UNEw4bXJaUUttdXFD?=
 =?utf-8?B?RkYvUXhBQ2ZLRHhvSXVlUXUybHlCNkpRYk0ydDc0aGZEZGMvNWZ0WUg2amUy?=
 =?utf-8?B?RytEbm1jaGkzZEo1Y1ZmbyszYmhjRWsxays1M2ovOWJEblpqYmwyL1lEYUNa?=
 =?utf-8?B?WmlvNko5VVJxS25OdTNYcngzQ2p2K3F1WnFmWk41Z2h0dHBRL3ZRNjJVTTNp?=
 =?utf-8?B?S2c1bC82ZmJhYnhReTE5Qy8vc3FDQ25iVlhrYUxYR0pzbHdZdTdjemtUN0xi?=
 =?utf-8?B?bHFLVmVocWFPWHlUa3dRdllvRXhhWnJzbkx2SDIxVktUY3pEK3cyUXk2Ylow?=
 =?utf-8?B?Q1h4M3ZvU3FqOXBhRHdGeldycS9kRCtLRjdVSUpEa1dKMTBKbS9TQkxXTWV2?=
 =?utf-8?B?NVBjSzEzVTZOcWoxZExKK3N1QlFrVjM1OG05elpuSTRZbTdXRzVuNnkxZmtj?=
 =?utf-8?B?Ynp0ZVFaZStTb2NTRGJwMTlsY2pvYzRXbzNLQXNlMlZnZW45YkN6N1NVRkZP?=
 =?utf-8?B?NWRyVHRRTkZxcjVWeXFWMmtzbm9FbGltRU5VTTkyK1JULzE3OWxpUDd3Yncy?=
 =?utf-8?B?eHZvcVJoTXRmaW5WME1DVjlkVmpoNThtb1R1K2RjaTF1SFI5aWQ5SVF0a3Jm?=
 =?utf-8?B?VzZkNUZzUm9XNE82NVpuYlp2ekwzUXcrYm44SFM2bEQ5WUxzTTIxbzBJVVFG?=
 =?utf-8?B?dmEwUElJNGZleWtQV2t3N0hjSVU4REl6VWtSc0I4WU1ETTNqQ21RWkF5RmJQ?=
 =?utf-8?B?alhyRDhNdERDRDFMU3ROZkhXVkdpSHBrVHNWUkJRaUNmTVNOUTdTUzUydThH?=
 =?utf-8?B?UDBHMkVaV1Y4WWthK01yVjZGMVcwbWdhS0dRWWJvRWFmL2FpM1NzUWx6aEZB?=
 =?utf-8?B?d0xzdjNyNVVVTitLYmdFVFE5eWhhb0VUUkZxTDFnczIzT1VNbFdOUjNOV0JC?=
 =?utf-8?B?TWVLbnJBa1hIRE5Dd01vSEp6ajYyNEZMSDRUeEJDOG15OW9KRUlnQWlHU2ly?=
 =?utf-8?B?MmlkTi9PeGNpWGZCMWw5eWNBM0tSSUk5ZEIra2V0alhxdFhraVF1TnpRYjBo?=
 =?utf-8?B?emc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5DEB32999EAA904EA659988402982C6D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5688.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 341db27b-8bdf-4ad8-086e-08dd33b56a9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 09:34:02.7099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P9grgO++fSo7E087GLuFzZJVbdmGydwKoiTdJEjscLOqzC9LVIZWzIFjHzQJqvQCu22vDWGi+UZ0nMOVBURt/ZxfHR0umKjEND0Rxp+ACmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7513

T24gTW9uLCAyMDI0LTExLTExIGF0IDE1OjUyICswODAwLCBDaGVuLVl1IFRzYWkgd3JvdGU6DQo+
IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFj
aG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRl
bnQuDQo+IA0KPiANCj4gT24gTW9uLCBOb3YgMTEsIDIwMjQgYXQgMzo0MOKAr1BNIG90OTA3Mjgw
IDxvdF9jYXRoeS54dUBtZWRpYXRlay5jb20+DQo+IHdyb3RlOg0KPiA+IA0KPiA+IEZyb206IEd1
b2RvbmcgTGl1IDxndW9kb25nLmxpdUBtZWRpYXRlay5jb3JwLXBhcnRuZXIuZ29vZ2xlLmNvbT4N
Cj4gPiANCj4gPiBBZGQgcGluY3RybCBkcml2ZXIgZm9yIG10ODE5Ng0KPiA+IA0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEd1b2RvbmcgTGl1IDxndW9kb25nLmxpdUBtZWRpYXRlay5jb20+DQo+ID4gQ2F0
aHkgWHUgPG90X2NhdGh5Lnh1QG1lZGlhdGVrLmNvbT4NCj4gDQo+IE5vIHRhZz8NCj4gDQo+IFBs
ZWFzZSByZXdyaXRlIHRoZSBzdWJqZWN0IGFzICJwaW5jdHJsOiBtZWRpYXRlazogQWRkIHN1cHBv
cnQgZm9yDQo+IE1UODE5NiIuDQo+IFRoZSBjdXJyZW50IHN1YmplY3QgaXMgdG9vIGJyb2FkLg0K
ICBUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3LiBJdCB3aWxsIGJlIGZpeGVkIGluIG5leHQgdmVy
c2lvbi4NCg0KPiANCj4gQ2hlbll1DQo=

