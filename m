Return-Path: <linux-gpio+bounces-16213-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA5FA3B308
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 09:03:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A20716B191
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 08:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EAA71BC09F;
	Wed, 19 Feb 2025 08:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XCU+Crww";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="OTARwrwJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B82101DE;
	Wed, 19 Feb 2025 08:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739952174; cv=fail; b=sGax0KRZEofTktWo2S1Dt47BJin9+X6IVZN7LnJslUSpBhfmayBKQhE0BK2jqsBplRzM50UDurgzL8UHR6G52eE9gAhO4IZ9ToPqInvuw8T4Jk0uvv7Peuv9h8HshjuZ/HG5hc/UvOlFMnu0zD4vGpAhBjL5ht+7E93d6Y6+Emw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739952174; c=relaxed/simple;
	bh=ybD16yoKdlG+sIcrJVxcl58I17suLIzv9B+ivaDuV9c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AC/zk7+TfrzfO/Atlrz46FWTvvdsbCxTWjoyWwtjCzl0WpR9mASx9Mogqws74SD3pfSCuoepBi0QKyX+f9Ox0G07Ca1yUgTn1NsuOvykmUzyiR1c7+bGFPQtVr2eMGf7hLWzYxyFEF+RUUyGaYtnWN+tjwKFRqimP0N1iSLA7MM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=XCU+Crww; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=OTARwrwJ; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: e3c370b6ee9711ef8eb9c36241bbb6fb-20250219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ybD16yoKdlG+sIcrJVxcl58I17suLIzv9B+ivaDuV9c=;
	b=XCU+CrwwSjdfT8o7qiDUqabSg53vhgApZcTlkbyg3L9aPJwDWaGFLusSeAY1wY0zHOXIl9goHHPL0SH6ajGUjpim4zJQgyzVyE7I3xlCRKftEu38nAltn7kF9aGISkixkZJ1M9d5VrkHNoIsW4/p6aq7bzWiJOpZJm1VJmZMoyY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:1daca68d-0a18-45c0-a022-b3c815aa5835,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:0e6050b5-a2a1-4ef3-9ef9-e116773da0a7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e3c370b6ee9711ef8eb9c36241bbb6fb-20250219
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 817816961; Wed, 19 Feb 2025 16:02:40 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 19 Feb 2025 16:02:38 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 19 Feb 2025 16:02:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myUGZBiHCcrBTUagx1pmr+BKNPWYyU9zdL1V0S91yxWzqgqfurqTufS7GQyzGPo34huEusrO8AaPpI+0lWySZQZpqeRGLE1lxfRis0G6SIO+/6KZPMotCZzS6S3yasyvmXIVjEU41W4op+7hQiV5V+k7T6WDHzJLjxArkokIwAodbHHZv5GNU3To9WrFYmXUsZbncIU/Jn/N+drujNHGUpqzQrfjhoq46aN6UuK+L4ERTHTyJLD0oxe8KFfZw0fxfZvrnKOVrBok7aT7aHHJTa7AJwL7n/9clOR7ArTCiEjxEmF7ngJx8MvFmtAEOWXv+3Rdaxd0mey0D2xphWvfyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybD16yoKdlG+sIcrJVxcl58I17suLIzv9B+ivaDuV9c=;
 b=q0oOmtYUC4fTSS1boxcOb1M+GG1cUEzZpn9VElZTMDJrEA0SBAJTdsbz7pxg/O4C8l+1j5134l1sNBF+ppMkURESEayvs9XAZKnlvE4zACvYZUfWOu+9Bbh9Vwkyiy6oQA6y/diFJAZw7mZO/OIGuuh4BjyNTl1yrnW9UfF2z1RArE9tBHbhP7TJkd6c4uVCoG5gGFeEfqkBtHRQoGFOyqIPBMP3hAh1mN7m5KkzS0S1wxgVCcATGzsGQih4LHiViHvqSytLOykWkRkPSdXUA7lLIEwiJ8JJRqeNSnqiWNsy0x6pSpGvfsB7Hf/7YDSSGDasxsVuKwZzEwYeZuuCBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybD16yoKdlG+sIcrJVxcl58I17suLIzv9B+ivaDuV9c=;
 b=OTARwrwJ5U/KB2zDoYwwS+mi/IvG0LK7r7eeroLDadFdWPJGL7NMJQJYkSqx/s6RdJ3p2n9bsXY96xitRU/NMWjBUeM30SHxu4leqTV8M5jkLRXjuuYg99H+1AaNq4g0P7osJwr2XQl8D+chECCrbpZ/faXKEp/Ti6OZWDh3tzE=
Received: from SEYPR03MB7841.apcprd03.prod.outlook.com (2603:1096:101:173::12)
 by TY0PR03MB8247.apcprd03.prod.outlook.com (2603:1096:405:10::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 08:02:36 +0000
Received: from SEYPR03MB7841.apcprd03.prod.outlook.com
 ([fe80::aaf1:1155:5a7:a1f]) by SEYPR03MB7841.apcprd03.prod.outlook.com
 ([fe80::aaf1:1155:5a7:a1f%5]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 08:02:35 +0000
From: =?utf-8?B?Q2hoYW8gQ2hhbmcgKOW4uOa1qSk=?= <ot_chhao.chang@mediatek.com>
To: "wenst@chromium.org" <wenst@chromium.org>
CC: =?utf-8?B?Q2h1bmh1aSBMaSAo5p2O5pil6L6JKQ==?= <chunhui.li@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?V2VuYmluIE1laSAo5qKF5paH5b2sKQ==?= <Wenbin.Mei@mediatek.com>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"seann.wang@kernel.org" <seann.wang@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, =?utf-8?B?SGFua3MgQ2hlbiAo6Zmz5b2l5bu3KQ==?=
	<Hanks.Chen@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?UWluZ2xpYW5nIExpICjpu47mmbTkuq4p?=
	<Qingliang.Li@mediatek.com>, =?utf-8?B?QXhlIFlhbmcgKOadqOejiik=?=
	<Axe.Yang@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [RESEND v3 2/2] pinctrl: mediatek: adapt to multi-base design
Thread-Topic: [RESEND v3 2/2] pinctrl: mediatek: adapt to multi-base design
Thread-Index: AQHbbtQbeP3hDe2dmkmw7M1P7Az3/rNOaPyAgAACnoA=
Date: Wed, 19 Feb 2025 08:02:34 +0000
Message-ID: <2576c8002ce50d1501c7cc35fc409a84a211ace2.camel@mediatek.com>
References: <20250125025145.14405-1-ot_chhao.chang@mediatek.com>
	 <20250125025145.14405-3-ot_chhao.chang@mediatek.com>
	 <CAGXv+5HLmmNV9WZFjOoJdLQNvEW6-FVdgCDrgv2LCoYUrd2Bsw@mail.gmail.com>
In-Reply-To: <CAGXv+5HLmmNV9WZFjOoJdLQNvEW6-FVdgCDrgv2LCoYUrd2Bsw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7841:EE_|TY0PR03MB8247:EE_
x-ms-office365-filtering-correlation-id: 67176222-bf05-44ed-9cc0-08dd50bbc4ed
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QVBxWlVMTWxBRW45MFQwNk9kVWc4cC9yQjNUSldZL0VYSzRRTWVTWEoxSkhw?=
 =?utf-8?B?VXZyb1c3S3BMNHdoOHVwbkllTzluSUJvRFhxRmM3eFZzUkFJbkJYM3Q3QTc1?=
 =?utf-8?B?UDBsOXozOUFMT1Z2aFE3ODh1TVdjL2tneHNGRllaSzdBZ3lINUdPNGFxZDVQ?=
 =?utf-8?B?WW1FbnF1N0RlL3ZWZWZ6dTA4ZDRZQTJoak1hZFMwdFU1b3k1aXJYSzRkMmZs?=
 =?utf-8?B?ZS91bFY1akgycnhFVTZCS2F2QWtVOU94dHBKaWFPMGtFV3hVK0NKdXl5Smh6?=
 =?utf-8?B?cGNrajNxeis2c2RXUzVYTHkzSi9XRFR1dmd5RW1RUWY3Z3pqMEpyVm10YWoz?=
 =?utf-8?B?MjBFa3FnSnozWkJwRWhZVENxa21kUW9tT3VTaHp5TGUvdjFSQ1lEdVRaMzFC?=
 =?utf-8?B?b0RkM09tMGFTS25pRUtZRUVvNThyck5rMXg2RU1wK0ZPQzJORkVDb0x1ODNk?=
 =?utf-8?B?dk9nZzFvQXZxVzFlYmZ4S25vYWtRZHE1bzVVeThtQitjVE4vaDZXTlpPdFI1?=
 =?utf-8?B?eVZGbXFBSUpPSDBMNlY0ZVFBK29FTFpMcXkrVzh0OENSREFLa3oxdzk1QmIr?=
 =?utf-8?B?bWc1M0UwRVpmL0dFN0tUV0NKRFpiMTNWN1V4ZVpPWHppbERNRTJDRmM4R0ZF?=
 =?utf-8?B?RE1icEpyZndBbmpUb1FKOUhSZnh1SFJkZkRBcHhqS2EzVTlqdW5jR3RPSnpi?=
 =?utf-8?B?R2FKaVlPRkhnKysyQmpFcUVPc1ZYQVRVYUhHdGZpWjRFVnI5MmpNYmxOb2g1?=
 =?utf-8?B?eGZ2dnEvajVZMjd0QW5Zb0ZpeVVYZFFQaGVIUGtkWHBzRnUxV3gxMjlpSW8v?=
 =?utf-8?B?ZVZtMUNqNnhrSFljMTRBak0xdC9kdVNadElkY25kSE1BOVhlL2VsSUQ4S2lY?=
 =?utf-8?B?K2U5OTVpTFVZL1lhRW1DU0lGT2hSUmJta200b2RmdFlaeFRPMlBkc2gwWHJy?=
 =?utf-8?B?REtkQk9vaHRnU2JYTzRnRGh4dFh1VzFaV0E4UDBjUHFWQWF2VG8rSllENDNI?=
 =?utf-8?B?OXRQN21uWklkZ3gxRlgxVFM5d0t6R3pSaURCYnpkSFh3SnpqTC92SkxLMHpR?=
 =?utf-8?B?eUZYWHhNeCtocTZnNExtUUtuVmduTHZWcDRIdEVRd1BPMmhvUk44L2V5dFkr?=
 =?utf-8?B?a1A1cHVXNXRTdHAyOUZ3MHR0ME90YmhUZ2k3TCtRU3JTTkpVQVViZHpuYzNJ?=
 =?utf-8?B?b09lQ1NndGJqWkdvSWV4VUJLYWo0Q0ZQYzZSb0JKUCtzZEVlZ1M1S3dYd0pS?=
 =?utf-8?B?elFTL1Y1dmMyR3Y2YWU1cHJ6UWpKMmpHNlNzT09PU3RMdTY0TFFGdFVjYUhn?=
 =?utf-8?B?aVZpR1JmM3lPd3k5bkJOMi84bDJHM0REbnpZVjNsU0ZESExsTExvYTdNQUsx?=
 =?utf-8?B?RDI2N294QjhYUlFTSVdsMm5YM0I3VytrYmNhWjlQQkdxR0I1NktmZUxMM1Z4?=
 =?utf-8?B?TG5SN2xKR1gzUVk5alpjdXRQaE9NQ1VDcWdGYjJ4WkhaUlk5QitSSFMxTjJK?=
 =?utf-8?B?K1dGY0Jhak1nUE1pUXdXMlhXRWwva1NGTHRVM041ZTFwRzVJZTNQOTZRVkdn?=
 =?utf-8?B?QnpEV0c2dkJCR1hDYm5Ya3k5d2dMd2QyMkt1dG54VlMwR2FUQ2Irbm1ETFpr?=
 =?utf-8?B?T0NIQ3ovQVEyNEU1Nis4dTRtUmx6ZUhnOC85b2N1U1VSRlNmenZjNFZ6aDhJ?=
 =?utf-8?B?T1FINnZpci9LVnpKcG96MzJCSFdhYk04K2doM09ndmZVS2dTMVNMRnAydWpk?=
 =?utf-8?B?N2FLSmU3MTRlcmhsNjJQUW9mQmlDeWpMZ2tiZTRLVFRObjdSUWZZY3J1cDVJ?=
 =?utf-8?B?dDdXMGcydE9HdzF2SVNGNHRtb1A5MmRob2ZiUk0rT1ZudzM0M0cyTGhkZ3Uw?=
 =?utf-8?B?dDkxOWZ3WCtnWUh2ZEdjWDRPMTNFMnMzSzR5d1hkNE1xNUpPRVBkaG1BTk5H?=
 =?utf-8?Q?FzrdDiU4O/IcCU9bKWDhCU/D8JTbMBmk?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7841.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1o4U0p0WUdnNXJQazFLd3hSUFZQZVBxVVFoYm9nU1R5TitkSE5mZHlNdGFp?=
 =?utf-8?B?SE1McUczQ1kyZ2FXRkRjQlg5Q3VBUUFDYnV3V3lGcXhzR1RCcnlGRExhM1ZT?=
 =?utf-8?B?UWNmWVFsajNkekcxY3ZJTzRkQXp2UGl2Yml3WWcvdGR0SlRqWGNKaUxjcVpC?=
 =?utf-8?B?cE9qVmpscjZoclQwbXI0U2grUGhCanNvRmM2SFpobW16eWhLZlgzR3o4SGh5?=
 =?utf-8?B?NjZvNUVxK1dwU3BuUHJLcFJEZmtSMG5nUGdmQ3ZsSFk0MXZqTWFIMVUxRlJF?=
 =?utf-8?B?L3JJb202d09HaUZ1a2FtbU11WXNwVCt4Smh3V2N2bmd6ejd4S2FqbkxaVlg3?=
 =?utf-8?B?ems3OFp0RXJiek11UlhsaUZxTnNOOFRGTzVJUXVoejBLOXFzZGEyOHFhMVVM?=
 =?utf-8?B?ZlJWTXlRWUJweGtRN1JCTG91d1cvTElhZXJCaXlZbEczUlpCcUdTNy9SRzEx?=
 =?utf-8?B?TTlLaDVhM1JBelZCUjRwR001S2pOUnJUL1BvUEs0YWJIRituazV4SStMMmlw?=
 =?utf-8?B?bTg2TnZaL1BXSU52S2l5SXF5dWRJV3RKL29FSjRSaTRHK2lFKzI0dTVLblFz?=
 =?utf-8?B?a1hFbFU1c3J6MWEyZWsreTMrajh2VTFsNkwrT2tUdW0wdTU3Q05zZUFmTTA2?=
 =?utf-8?B?N0R6NWptd0hzeis2dUFtNHdUMWR0WW1HeFlzYmRoSzQwTXNBSnloN3BVbytt?=
 =?utf-8?B?ZHEzVFVqVERadU9IdGRiSE92MmVjbjRnZ1BiY1BVM203RUd4WGdYcGlvU0FN?=
 =?utf-8?B?cWxyUkdNUU9KZlMvQjBleGFidk02RjFubG04QldTSGsrcjJhUk5TOTRNbko4?=
 =?utf-8?B?VFk2d0JkKzZiWUR1RXRwb3dvT2sxMTUwbzAxTk95bmhaMDdEbU9UemdFRXhY?=
 =?utf-8?B?cWVLYmwzeEtHVmZpeUN1Z3JBNjFvNDArTjNNNGNkZ29pZDZaMWcvamhyZS8z?=
 =?utf-8?B?L0E4YTlQOHdGcUFacG5SVlJBbHd6eXlRTGw4a2M4Ym9QRW5xaUExd0NsdG9W?=
 =?utf-8?B?alpWRDZJdmJUd3crejZtVzNiNFRXZThXK2Z6U09uR0dBRlBaN0d4Wm5oc3N0?=
 =?utf-8?B?RldDWnVDWG91MFhTWFZiREF1a2RKakVLclZQVUQzK202dTcrRUg4ZEowM1kx?=
 =?utf-8?B?Q3o2R0tna0MwMElVNnlCaisrT0J3NHQzSHB2TWw0SlFTSGhwaVNGRUgxNHFQ?=
 =?utf-8?B?ZExENzNPcC9QRzROWFRSR1ZZQlN5Q2t4N2QwNHpqa2ZLVFdTSk9ZYVVwKzFI?=
 =?utf-8?B?RTZYUnVjRlVwUXdCS3F5bjBFYmlDdWdRTmk5OGh5TDBDTDlybEpCQm1lWDl3?=
 =?utf-8?B?T0UycG5rQUZ3eFhIWUY1eWhNNzRKc1lkeTI2RGw4U01wcVVxWTFPczdSMmFF?=
 =?utf-8?B?a21INW1pK2Flb29vd2hRYzQ5UldwL2JOSUtSMktiZXBOSTNyOWh2d3hFS3dK?=
 =?utf-8?B?anR4N1lVeFp5bE1uYTdkaEpJMUFpM1REWDdGdDVjdU56L211RmNiQ0xta3lp?=
 =?utf-8?B?WUhhN3VveHl6ZjdkUDZLdStPVmNsQ3BlZTRYT0lrdXovdVU0bTNTb1h6d0NX?=
 =?utf-8?B?N2dWYTNRWEJ4azhITG54Y0wvMXRzUUtTaTBHZ3VCTWZYNkNwNlB6MzE2ZWZZ?=
 =?utf-8?B?bUgzaWp6YXduRmRHTGsyT1pJeUJGQkNJZ0JMM0F2NWhHWlVtSTdXbGFoaGx2?=
 =?utf-8?B?Snk0RXdybzdRTmROTS9KSXo4NitLaVRESTZYSlNsTmViNHZuU29uVjFSS0JO?=
 =?utf-8?B?RTZqdk9VRkFDZEpWNDNvdlliV1djMVorNXRhclBsbk1qSGRRQXZwZERWN0ZR?=
 =?utf-8?B?ZXZua2V6SGIyTi9RNXZBZUwrbXgyQ3VUd1VWSHBnRis3RlN6M1FFbUYzOVBI?=
 =?utf-8?B?R2M1TSt3a0lVMXlaMGR1RG5uN25rOVZ6UnA4aVowLys0amtoMXZKS2dXSjNG?=
 =?utf-8?B?eFVTL0I1WkZ0NldRZFlpT0VGWUJ2MFl6Yk9GLzdQemhBZ2xDZzM1MldMb1p0?=
 =?utf-8?B?NEtYVmZOdHlNRms0YkVEaVB0NzVWL0JLbVVhbVF5MWtrMHA3bWVRYWc1N2RW?=
 =?utf-8?B?UkNBeDAxR2ZHMEhFNmhXcGdMelJQOE5NM3pnM3dabDE5ZC9ZNkZ2QVcxSFo4?=
 =?utf-8?B?YXZydDZhczd4QWl5K1lkeGEwUlg5V2t5Lys1aDVtWldycGZSVExTUXBHbEJw?=
 =?utf-8?B?WEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E51CB7EFF2C58245922E906C2F7F0653@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7841.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67176222-bf05-44ed-9cc0-08dd50bbc4ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 08:02:34.8907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SCu6ibToAQg4XrIVrvFB6upmAG/uPerjg/LVcjxg7By8eSnTP5II5rHomFJ+8hdAj0dOtRlz+BhGjUWcSE9VcQ4fNwdQI0xQiZhkcx4s3eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8247

T24gV2VkLCAyMDI1LTAyLTE5IGF0IDE1OjUzICswODAwLCBDaGVuLVl1IFRzYWkgd3JvdGU6DQo+
IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFj
aG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRl
bnQuDQo+IA0KPiANCj4gT24gU2F0LCBKYW4gMjUsIDIwMjUgYXQgMTA6NTXigK9BTSBIYW8gQ2hh
bmcgPA0KPiBvdF9jaGhhby5jaGFuZ0BtZWRpYXRlay5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IFRo
ZSBlaW50IG51bSB3aWxsIG9idGFpbiB0aGUgb3BlcmF0aW9uIGFkZHJlc3MgdGhyb3VnaCBwaW5z
Lg0KPiA+IENoYW5nZSB0aGUgdHJhdmVyc2FsIG1ldGhvZCBvZiBpcnEgaGFuZGxlIGZyb20gdHJh
dmVyc2luZyBhIHNldCBvZg0KPiA+IHJlZ2lzdGVycyB0byB0cmF2ZXJzaW5nIG9uZSBieSBvbmUu
DQo+IA0KPiBUaGUgY2hhbmdlIG9ubHkgY292ZXJzICJlaW50Iiwgc28gcGxlYXNlIGFkanVzdCB0
aGUgcGF0Y2ggc3ViamVjdA0KPiBwcmVmaXgNCj4gdG8gInBpbmN0cmw6IG1lZGlhdGVrOiBlaW50
OiAuLi4iLg0KPiANCj4gPiBDaGFuZ2UtSWQ6IEkzOTYyYjc4MDQyZDMyNTAxYTczMTUzMjAxY2Rk
ZjUyYzZiNjJhNjk1DQo+IA0KPiBQbGVhc2UgcmVtb3ZlIHRoZSBDaGFuZ2UtSWQgd2hlbiBwb3N0
aW5nIHRoZSBwYXRjaC4NClRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLCBJIHdpbGwgZml4IHRo
aXMuDQo+IA0KPiBDaGVuWXUNCg==

