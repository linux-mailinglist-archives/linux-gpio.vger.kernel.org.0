Return-Path: <linux-gpio+bounces-14754-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D72D7A10183
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 08:47:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E55D1168291
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 07:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B07233548;
	Tue, 14 Jan 2025 07:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tYsTQcwo";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="uZr0HtYs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E4C1C3C1D;
	Tue, 14 Jan 2025 07:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736840852; cv=fail; b=XT9Hc7nV9di0Dm/pQTUByoaHtqeJ+lLYzSosFyvooo6oT5pYcg8k04+DxQuFSgeSFVf1zgMjk+Ias2K8nhTwCu6E+DlEsnAe4ZsbYjBV5WIhsL602hWDYSQsuH1GJ9cIWe/NlQw3EA7ZFoVt/l7UQp0WqX1iRBh1i5lSrpB8+7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736840852; c=relaxed/simple;
	bh=kOZrY30jwrDM20RBzmSAJkV2xodz+dL5+BMo/dLsRwY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=soKgJZoEadc6THQfL29A6IOZ09A6iesLzM7i3vIDBZffKsiEPnp66Ix/eJBNv2DagOVp0b3PA5BqtFnla9GBp4SJGB5q6pdJLKwhvvDTSRGzcdHLdgcjAppW8FkfxDXiCfcvTy+1RWeXOtx1jjegI74+2ajflBAV7eKOSq0BOeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=tYsTQcwo; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=uZr0HtYs; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c278a0f6d24b11efbd192953cf12861f-20250114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=kOZrY30jwrDM20RBzmSAJkV2xodz+dL5+BMo/dLsRwY=;
	b=tYsTQcwovBPAiKGkm3a0eEPVuVdHGnIQ8IKRHmEj+61eIlZtwIj1WG6vh1NLjiCFxvyUO8buJllQkw6eMN4scC43RJSas8agMA0Xn1GpSi1DPbLTkdf9qtRsqDBEmWhmOK8VHMWHaDXnasSNaOY4hseLyoaQwHq336mOCj21Qdc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:b26b873d-5300-43b5-9f5d-8e85895742d7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:44a1da37-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: c278a0f6d24b11efbd192953cf12861f-20250114
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1865026570; Tue, 14 Jan 2025 15:47:09 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 14 Jan 2025 15:47:08 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 14 Jan 2025 15:47:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMuPCxwjWnoVHS8qt7Me4e58VL3sT0L9dvidVIFyBBkVT4jr/7LbGEFE7gjoLZSC0T+7j/ziyVCwYIE/25HzZjFUDD57Gs1nHslTKFqZ+R7U2rfLrQmiLJoiIbQchbL4ZB4XAf5JGmwxzr3JgqGQQw35KZDC+kCjEgHqTmV7XH7WCkJEtzzngLiT6Ms2tgxgTYsoAPmRYaKSpqn5K9ymkX1i5uYpekX2jLJ8HxNZMmMAjCCkuUZGUDO7QHLT14vnTW58Un8abiniiLZzDGjsGN5ZMzAzMf/b0XIoTx9KWCRksGrCxKvU7dHQ40ET+VmIsuoM4Aq5CdBa/AaiyDAzYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOZrY30jwrDM20RBzmSAJkV2xodz+dL5+BMo/dLsRwY=;
 b=mvFEOBvwDWOxk93jVViJuS5ESlEdpjbW5zdDK95aRS3rkSWBZBuT90Sx/eilfjjj188BMUXcrhgF3i5IL6g+Vov9acZY/UH0r/0aa+CnyUo9lLgHTs2tC5BI1NY8CndIUlio9m9Nvox2Q0UdqGXAFye4xObawRUnvIwvGQVF3tIx4XOyvdcIrS264sn2z4wrJxWEUxS4BV3F+kgz1ur47xNwmm6DYkJjZsHW4huLPWTddQtZOLPe34IHUJ+dQHB4LNOs6OVisROATBZkZB8+QJL4wp69dLYVehJUB4+bqBSXbGIO2DDSrfq/yaTCPxpf0JQL5L3ZI6oKBpNPJPWScQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOZrY30jwrDM20RBzmSAJkV2xodz+dL5+BMo/dLsRwY=;
 b=uZr0HtYsiyMUsP+xRDDLwL7L1MEXyWWfcBhU6IJVngMoJ+NTMVkgEatXpNKVhFrNkODOvxy39ek/4mRj+6ZBmZu1mejk2sIYx378UKC4qhhTjK1XGTeBnVQY0zz9NypXsWeHgfwAnE7WgyxgSDBZY60LTwNDOLLlq5ixNJJNejg=
Received: from PSAPR03MB5688.apcprd03.prod.outlook.com (2603:1096:301:88::14)
 by SEZPR03MB8444.apcprd03.prod.outlook.com (2603:1096:101:221::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Tue, 14 Jan
 2025 07:47:06 +0000
Received: from PSAPR03MB5688.apcprd03.prod.outlook.com
 ([fe80::d976:8c60:38aa:d1dc]) by PSAPR03MB5688.apcprd03.prod.outlook.com
 ([fe80::d976:8c60:38aa:d1dc%6]) with mapi id 15.20.8335.012; Tue, 14 Jan 2025
 07:47:06 +0000
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
Thread-Index: AQHbS5G1QCqlKfF0XEOZLxq3O6L9SbLgrUEAgDVsnoA=
Date: Tue, 14 Jan 2025 07:47:06 +0000
Message-ID: <8ed4a30710a3dc56595898417d00c2eca0659f75.camel@mediatek.com>
References: <20241211055454.17120-3-ot_cathy.xu@mediatek.com>
	 <2a773ddb-2836-40cf-a08b-ac47430aeb78@kernel.org>
In-Reply-To: <2a773ddb-2836-40cf-a08b-ac47430aeb78@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5688:EE_|SEZPR03MB8444:EE_
x-ms-office365-filtering-correlation-id: 68c0b1ff-e505-43a8-cf5c-08dd346fa48d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?a3k2dVo5ajBWVEc1U09mTUpVRlRQUlpSOWlXL3grT01xVG1xZml2cDVIbFN3?=
 =?utf-8?B?bWVJQkV6ZDFmT3FqZlplbWwzcndDYUFhWWdGaEgzM293WEkrN0FEZkpRNmI0?=
 =?utf-8?B?NEt1QktVbnpEckpQQm9iQThBcXNRY3VLVGVzMkgvTzNzQ3FEWXkxdWNWdmRQ?=
 =?utf-8?B?aHpERnZTdTJGb1dycmRrRGJMdm9KUEEyUFN5WnNtV3M5ay8wZWFHVWtZSHpK?=
 =?utf-8?B?ZGNpVEU5NWZWTUNjakpES2FocDhiQzRVbzZFbnY3MmQrODFyek9SVkQ5UkVq?=
 =?utf-8?B?OHBzem10eDdvbXRlN1ZaU1h3UE5WcXdLZ1JHdloyaEs3STUxZzd5aXdzQnJj?=
 =?utf-8?B?aDJ5ZVplQVdJN0JZQnFiSTZwU1JMVXRvZ3d5dTdDVDFsMTM4dzBjMUtIZVFn?=
 =?utf-8?B?UGZ4eE4xWitjdG5tTHVkVzhTMncraEV4Y1RUbG1ZbkdwdU1oSmg1UzI2YklW?=
 =?utf-8?B?WStnN3Z5WGtUTXg5Y3dsS3hMWThrbmE3T1UxdmtBUjhsYjgyOGIvUUIvcnZl?=
 =?utf-8?B?Nzl5WWRLR1FjcWNocUN2bGM5SStKR09MU2Z0SlNmdGxJdFVpTGc4VVJCTHBy?=
 =?utf-8?B?RUc2eE1uUHRvOWpaaGZIOVJpQWFDd1k1Z0NwMjh1OFJnMktZenVBam1lR2xv?=
 =?utf-8?B?V0lPL21EUk1ud1l6ZkJSWXVWeVZDcVVZbU1Kd1FLQVZFcHFMbVMwQnNzYnJP?=
 =?utf-8?B?azgwZmFkMHIrc3hMV0s3a0g1NTRCbkFMdGtBRGR4Z1R3NXYxazlRZ1dEbFc2?=
 =?utf-8?B?dUZrZzkxaytsam9Id1RQSWRsVGk5d3l6anZuTUhmVEEzeWRuT21wUDJpd3Bi?=
 =?utf-8?B?RU14dXkzamlyWFRTbTRLV1pvWFlmcS9UdXpVYzVIcGZQaU05bEszR1NTTmli?=
 =?utf-8?B?MHo4QmZEaXM4cVJrdlNUUi9veXhiL3FKVzF4b3BOemZtd0JhWWhyL1FCdXBK?=
 =?utf-8?B?OFZTWW45THk1SktMcHdidDZKN2V2VlNIaUFySEo4UnNKTU84b1NWNEJ1V2xV?=
 =?utf-8?B?TG0veWZuL1ZaT0xaWGtkYldjaThuN0ovVXlPbXQ4dks4TlBHZHllVHFldEFv?=
 =?utf-8?B?aUE4RjQ0eGFJaFFRb1VrTUlpd0NNb2JuWU9lY1FKaEJuM25rWEhCdjRPdXFo?=
 =?utf-8?B?MWEvWFMxaU94WkgyVjhtODBFKzlHbUgveTZsdzZPQ3BCYXI0UlRQZVF4dnpn?=
 =?utf-8?B?WnZRR1dGNzU2QkxzV0pnT3ExVTlleWxFWEI2Y0doYkEzUjl2MkRjQWp5UWtj?=
 =?utf-8?B?QThDZ1dQNGVIUzZLM2lZUVJrWkxobWJYc3l6bGdUNGlEZUdSVmgyVlJUYTFu?=
 =?utf-8?B?M0hlLzd5emhwcnB5c1pja0VUK1k1UFQ0M0lZaStPZW5DcHlFTVhqQmx4Y3kz?=
 =?utf-8?B?MlNyNXNvOElYR05HdFgxZkdPbEVJVnV6amJGMGhGcTRsZTdCdDhLY3BKYlN1?=
 =?utf-8?B?S0w2azh5a1pUazlJMXFmTGpoV3p4cUVxamZ6MVNIRHR4M2RRY0RldWNqNU0v?=
 =?utf-8?B?bG01TzVrUlA2YnorZVdhMTBCcXZjbytTZ2JIaUh2OEczUEtqVzU1RUVZZkh3?=
 =?utf-8?B?OUFFVkpEQXljQXNBUmoyM2s2azI2ZU5PVXVPdStQNGlhSHgxRWpCWXIwNyt1?=
 =?utf-8?B?eXNpdk5UNGIyRW0zbE83SmFzdzV1S21NdUd0OTZualVTbTBGWmdYWDZqWnQr?=
 =?utf-8?B?NHBkdS9uU0JXMDNIbTMwMDVXWW9Tc3BRT0p5SWtKQTN5cmQwbkV6VWFFV2dE?=
 =?utf-8?B?Yml6YS9BVmpqaUprc1U2eEZkSlFQWkVuWWZYeVoxMCtJRmtaVkEzcHNiOC9M?=
 =?utf-8?B?WkxmTDc3bFppbEdDanVYREl6UFFHN2RKV20rN2IyWHJDd0VwbDFNcFUxNVdm?=
 =?utf-8?B?NkFqRVFiNUtEcGQyTFpOeUJ4VWFWM0RXRmVDem05NW5Uc0V2QzgvUHRKR0RB?=
 =?utf-8?Q?23TB8dYHJn7+pt9JMF96qDUTwvjY98bg?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5688.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0pVaUk5d3BCeGxyK09YRDRwaFY5RzZFdFo0Nyt2NFN6a2RJNDBUT1lCdWEy?=
 =?utf-8?B?U3RNUGV1eXkxL3oya05MY1BqalpOcXFQeXhxK0lPcTk0cHh5YWlyZmNnckhX?=
 =?utf-8?B?TG5tODFFTWJMV3hsUkE1RWFsTXZienZnbE1TQWQ3QjkwN1BOUFZSSDhzTnhv?=
 =?utf-8?B?UFdRN1JTY3FaakU3NjUyblUrUUkwajZuSWtTWVJMRnY5OTQ4elp4MDBQd1E1?=
 =?utf-8?B?OEpwV3BWYk9UVDJhZkZ5TDBNMHJ6Sis2TWh6RFpvYnoyaDJjQ0ozL3pRL2lW?=
 =?utf-8?B?aHV5R200cmoxaHEvUzZ3RklCSm5LZDF6WndhVTlPa1YwVHE1cGtvQkhZYlN2?=
 =?utf-8?B?dEZuNTdvMUFzWmJyT1gvZ0ZXaXhIWWJQMERjK3RGYjBQYWs2cEhpU3RiS1pw?=
 =?utf-8?B?R1hkUlRIVWVucXNqUW12bmNZMXk4dHduaFp5TzdTcjlYWmdFaEVFUDd6cUla?=
 =?utf-8?B?VUM2WEtPelFXUS9UVUhmTVdHeDVSQyt1eG5GblhuM1ZLeHU1WDdhMFNPd1BF?=
 =?utf-8?B?VDJNLytNVi9Fak1mTFQySlJWejRTOCs0QjJCRDRUSzN1QmNSWHMrdUplVVhI?=
 =?utf-8?B?QVpUNWlSUC80NGVIbTg1TnFKRDcxNHl1QjNvczRVMGZCWmhFbk5UYzdNdUNn?=
 =?utf-8?B?NWJQcmRmZ2lhNVZkZG5VcEFLaTZyMTZxdkgyUGwzOEZWUmlRQ2doSU9HMnZr?=
 =?utf-8?B?NHM3dWlLOHQvaGx0Z1o2aVNFb3plVHVzTTRjYVQwSXcvOHZHOFJtQXlNMmo4?=
 =?utf-8?B?S3N5a0QyNUZCVFkrTkFXKzloa1ZqNTVXZ2Rhaysxa3hZYlh4OTBFbDhtd0xH?=
 =?utf-8?B?bDVQQ0ZwS1JKVnE4eHIxQlM3V2ZQQzdCWDZYSW5idjV1M1doc0d4dEI2QXA4?=
 =?utf-8?B?TkU5aVNnMmpSeEtTZVhqWC9wemJqa0c5WEtHd3Y4d2xIZGp1VzRXMW4remJT?=
 =?utf-8?B?UDduRTJwRWtENzVrQ1lkSSszWUVRR0FqWlcwZlBVcWtDMjAwSThwWVczVDhT?=
 =?utf-8?B?cnpwczlnK3NDdStkdmp2a0JwQk5Wdm9kbDhKZVpjWUljcW12T0JTNkltNEpN?=
 =?utf-8?B?WFdyWFd0UnpWOXBYZTNHTkw0UEsxYW82elY2SHcxS3ZuWlg2TVZuMWxUbzlF?=
 =?utf-8?B?WFBFcjk2ejVPWVpsZVNmcHVwVjdNaHZNeWJDcGdrMnMxVFdpRUNpRVYyVjdT?=
 =?utf-8?B?ZDR5YW5pQXZKR2c0STc3aW5VZU5hUVY3TWhEM1VvZVlMWlExZmlXRkJRQk9u?=
 =?utf-8?B?dDRSU0MrY1pMZEJnZU5lMmpmY05VNVZRR0xIYmh3cGJEME15RG5TalBoOTlN?=
 =?utf-8?B?dTJZS3gwUFdOZXlnOURFVHdpVVppaFdQOW1Ta0g5SXRKOFlrbHJMb2xNcUFX?=
 =?utf-8?B?SU9hMTlvRmJwS012bm9jREdyTmdEdHZIS0tPelY2SHZ3c1kwZEZGSFlsNmtH?=
 =?utf-8?B?ZUNzS2xoVFRVR01ISHR6Y2twNW1qcS9VQVZ4a0k4L0RHQTh1dVZ4Tm9JTThD?=
 =?utf-8?B?M2hKdVpVTlZzb2tHR3VKdHoxa05PV3ZxWXV5KzdBT2NqMXU2MmRpUmFEOWRl?=
 =?utf-8?B?aWJoTTRNa29rMXJlclZ2S0RKR0JBWlRDaWJjMlRDNWxmTFMzREhKTElETVA1?=
 =?utf-8?B?dG5DVG44MHJNMVQ4Y1hCWVpnV0VSNk5nVTlkQjdDVk13WXFZbW9rb0JQSm9w?=
 =?utf-8?B?ZTA2V3pvUkJTZW1seTBLdVVzekxLMkF1V3BJVmo1cEZxNUFOL01meFUvc0JE?=
 =?utf-8?B?YzhYcytyZVRENDFlYXNETnhWUGpmVDBUd3JpTnpFa0x5UThoM2FWcElwa1ly?=
 =?utf-8?B?aS9FNTg1TG9ldTVEbnhPbkVVUVBtbmFKV3FNeGdINU9PYW40Q1ZScnJLMnJo?=
 =?utf-8?B?WVZub0NHR2lXWUpxdGNMK1RtWlRXQ1VoNVdZVlU3dzZ0ZjFIUWVwUHRFanRZ?=
 =?utf-8?B?a1lhQVE1MHA5cjN4RmdoS0NwMnpzMGpDbzR3aUxwOW5vM0VqNWFMMkVGaXVa?=
 =?utf-8?B?dTgwK25CSnJoZk40dlFKVHVOcHdldzhRMkY5Nk5pcnh5Q1l5V204d1h1c3ox?=
 =?utf-8?B?RGwwbktzWW5EOHcxckRhWHRCUWEyN01NME9YSVNCSEJHOUM3T2dxUXhKR3Ew?=
 =?utf-8?B?V3ExcVN5Rk0yM09uaEs0UitSRmNaamd3eml3WHZpVVNSbWU1dkJ6enpsWGN6?=
 =?utf-8?B?Nmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <451AB76779D03347A88D0EAF937AD417@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5688.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c0b1ff-e505-43a8-cf5c-08dd346fa48d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 07:47:06.2972
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MTNTS1FJE5+xbbFLWDTPWVOoqrd1cPEuo+J27Rac07bRdG9hwksN9jkpTRaLoKgN9sLXPCiDjz09ZAjtlvylmU6hmXO13XMkD7SvIBgWtUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8444

T24gV2VkLCAyMDI0LTEyLTExIGF0IDA4OjU2ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDExLzEyLzIwMjQgMDY6NTQsIG90OTA3MjgwIHdyb3Rl
Og0KPiA+IEZyb206IEd1b2RvbmcgTGl1IDxndW9kb25nLmxpdUBtZWRpYXRlay5jb3JwLXBhcnRu
ZXIuZ29vZ2xlLmNvbT4NCj4gPiANCj4gPiBBZGQgcGluY3RybCBkcml2ZXIgZm9yIG10ODE5Ng0K
PiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEd1b2RvbmcgTGl1IDxndW9kb25nLmxpdUBtZWRpYXRl
ay5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogb3Q5MDcyODAgPG90X2NhdGh5Lnh1QG1lZGlhdGVr
LmNvbT4NCj4gDQo+IA0KPiBQbGVhc2UgdXNlIHJlYWwgbmFtZXMsIG5vdCBsb2dpbnMuDQo+IA0K
PiA8Zm9ybSBsZXR0ZXI+DQo+IFBsZWFzZSB1c2Ugc2NyaXB0cy9nZXRfbWFpbnRhaW5lcnMucGwg
dG8gZ2V0IGEgbGlzdCBvZiBuZWNlc3NhcnkNCj4gcGVvcGxlDQo+IGFuZCBsaXN0cyB0byBDQy4g
SXQgbWlnaHQgaGFwcGVuLCB0aGF0IGNvbW1hbmQgd2hlbiBydW4gb24gYW4gb2xkZXINCj4ga2Vy
bmVsLCBnaXZlcyB5b3Ugb3V0ZGF0ZWQgZW50cmllcy4gVGhlcmVmb3JlIHBsZWFzZSBiZSBzdXJl
IHlvdSBiYXNlDQo+IHlvdXIgcGF0Y2hlcyBvbiByZWNlbnQgTGludXgga2VybmVsLg0KPiANCj4g
VG9vbHMgbGlrZSBiNCBvciBzY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIHByb3ZpZGUgeW91IHBy
b3BlciBsaXN0IG9mDQo+IHBlb3BsZSwgc28gZml4IHlvdXIgd29ya2Zsb3cuIFRvb2xzIG1pZ2h0
IGFsc28gZmFpbCBpZiB5b3Ugd29yayBvbg0KPiBzb21lDQo+IGFuY2llbnQgdHJlZSAoZG9uJ3Qs
IGluc3RlYWQgdXNlIG1haW5saW5lKSBvciB3b3JrIG9uIGZvcmsgb2Yga2VybmVsDQo+IChkb24n
dCwgaW5zdGVhZCB1c2UgbWFpbmxpbmUpLiBKdXN0IHVzZSBiNCBhbmQgZXZlcnl0aGluZyBzaG91
bGQgYmUNCj4gZmluZSwgYWx0aG91Z2ggcmVtZW1iZXIgYWJvdXQgYGI0IHByZXAgLS1hdXRvLXRv
LWNjYCBpZiB5b3UgYWRkZWQgbmV3DQo+IHBhdGNoZXMgdG8gdGhlIHBhdGNoc2V0Lg0KPiANCj4g
WW91IG1pc3NlZCBhdCBsZWFzdCBkZXZpY2V0cmVlIGxpc3QgKG1heWJlIG1vcmUpLCBzbyB0aGlz
IHdvbid0IGJlDQo+IHRlc3RlZCBieSBhdXRvbWF0ZWQgdG9vbGluZy4gUGVyZm9ybWluZyByZXZp
ZXcgb24gdW50ZXN0ZWQgY29kZSBtaWdodA0KPiBiZQ0KPiBhIHdhc3RlIG9mIHRpbWUuDQo+IA0K
PiBQbGVhc2Uga2luZGx5IHJlc2VuZCBhbmQgaW5jbHVkZSBhbGwgbmVjZXNzYXJ5IFRvL0NjIGVu
dHJpZXMuDQo+IDwvZm9ybSBsZXR0ZXI+DQogIFRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcuIEkg
d2lsbCB1c2UgcmVhbCBuYW1lcyBhbmQgcnVuDQpzY3JpcHRzL2dldF9tYWludGFpbmVycy5wbCBv
biByZWNlbnQgTGludXgga2VybmVsIGluIG5leHQgdmVyc2lvbi4NCg0KPiANCj4gDQo+ID4gLS0t
DQo+ID4gIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9LY29uZmlnICAgICAgICAgICAgICB8ICAg
MTIgKw0KPiA+ICBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAgICAg
fCAgICAxICsNCj4gPiAgZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ4MTk2LmMg
ICAgIHwgMTc1NyArKysrKysrKysrKw0KPiA+ICBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGlu
Y3RybC1tdGstbXQ4MTk2LmggfCAyNzkxDQo+ID4gKysrKysrKysrKysrKysrKysNCj4gPiAgaW5j
bHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsL210ODE5Ni1waW5mdW5jLmggIHwgMTU3MiArKysrKysr
KysrDQo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgNjEzMyBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDgxOTYuYw0K
PiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwt
bXRrLW10ODE5Ni5oDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdz
L3BpbmN0cmwvbXQ4MTk2LXBpbmZ1bmMuaA0KPiANCj4gUGxlYXNlIHJ1biBzY3JpcHRzL2NoZWNr
cGF0Y2gucGwgYW5kIGZpeCByZXBvcnRlZCB3YXJuaW5ncy4gVGhlbg0KPiBwbGVhc2UNCj4gcnVu
IGBzY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1zdHJpY3RgIGFuZCAocHJvYmFibHkpIGZpeCBtb3Jl
DQo+IHdhcm5pbmdzLg0KPiBTb21lIHdhcm5pbmdzIGNhbiBiZSBpZ25vcmVkLCBlc3BlY2lhbGx5
IGZyb20gLS1zdHJpY3QgcnVuLCBidXQgdGhlDQo+IGNvZGUNCj4gaGVyZSBsb29rcyBsaWtlIGl0
IG5lZWRzIGEgZml4LiBGZWVsIGZyZWUgdG8gZ2V0IGluIHRvdWNoIGlmIHRoZQ0KPiB3YXJuaW5n
DQo+IGlzIG5vdCBjbGVhci4NCiAgU29ycnksIHRoZSBvdGhlciB3YXJuaW5ncyByZXBvcnRlZCBi
eSBydW4gYHNjcmlwdHMvY2hlY2twYXRjaC5wbCAtLQ0Kc3RyaWN0YCB3aWxsIGJlIGZpeGVkIGlu
IG5leHQgdmVyc2lvbiwgYnV0IGl0IGRpZG4ndCByZXBvcnQgdGhlIHdhcm5pbmcNCmhlcmUuIENv
dWxkIHlvdSBwbGVhc2UgdGVsbCBtZSB3aGF0IHdhcm5pbmcgeW91IGFyZSByZWZlcnJpbmcgdG8g
aGVyZT8NClRoYW5rc34NCg0KPiANCj4gDQo+IA0KPiA+ICtzdGF0aWMgY29uc3QgY2hhciAqIGNv
bnN0IG10ODE5Nl9waW5jdHJsX3JlZ2lzdGVyX2Jhc2VfbmFtZXNbXSA9IHsNCj4gPiArICAgICAi
aW9jZmcwIiwgImlvY2ZnX3J0IiwgImlvY2ZnX3JtMSIsICJpb2NmZ19ybTIiLA0KPiA+ICsgICAg
ICJpb2NmZ19yYiIsICJpb2NmZ19ibTEiLCAiaW9jZmdfYm0yIiwgImlvY2ZnX2JtMyIsDQo+ID4g
KyAgICAgImlvY2ZnX2x0IiwgImlvY2ZnX2xtMSIsICJpb2NmZ19sbTIiLCAiaW9jZmdfbGIxIiwN
Cj4gPiArICAgICAiaW9jZmdfbGIyIiwgImlvY2ZnX3RtMSIsICJpb2NmZ190bTIiLCAiaW9jZmdf
dG0zIiwNCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX3Bpbl9z
b2MgbXQ4MTk2X2RhdGEgPSB7DQo+ID4gKyAgICAgLnJlZ19jYWwgICAgICAgID0gbXQ4MTk2X3Jl
Z19jYWxzLA0KPiA+ICsgICAgIC5waW5zICAgPSBtdGtfcGluc19tdDgxOTYsDQo+ID4gKyAgICAg
Lm5waW5zICA9IEFSUkFZX1NJWkUobXRrX3BpbnNfbXQ4MTk2KSwNCj4gPiArICAgICAubmdycHMg
ID0gQVJSQVlfU0laRShtdGtfcGluc19tdDgxOTYpLA0KPiA+ICsgICAgIC5uZnVuY3MgPSA4LA0K
PiA+ICsgICAgIC5ncGlvX20gPSAwLA0KPiA+ICsgICAgIC5iYXNlX25hbWVzICAgICA9IG10ODE5
Nl9waW5jdHJsX3JlZ2lzdGVyX2Jhc2VfbmFtZXMsDQo+ID4gKyAgICAgLm5iYXNlX25hbWVzICAg
ID0NCj4gPiBBUlJBWV9TSVpFKG10ODE5Nl9waW5jdHJsX3JlZ2lzdGVyX2Jhc2VfbmFtZXMpLA0K
PiA+ICsgICAgIC5wdWxsX3R5cGUgPSBtdDgxOTZfcHVsbF90eXBlLA0KPiA+ICsgICAgIC5iaWFz
X3NldF9jb21ibyA9IG10a19waW5jb25mX2JpYXNfc2V0X2NvbWJvLA0KPiA+ICsgICAgIC5iaWFz
X2dldF9jb21ibyA9IG10a19waW5jb25mX2JpYXNfZ2V0X2NvbWJvLA0KPiA+ICsgICAgIC5kcml2
ZV9zZXQgICAgICA9IG10a19waW5jb25mX2RyaXZlX3NldF9yZXYxLA0KPiA+ICsgICAgIC5kcml2
ZV9nZXQgICAgICA9IG10a19waW5jb25mX2RyaXZlX2dldF9yZXYxLA0KPiA+ICsgICAgIC5hZHZf
ZHJpdmVfZ2V0ICA9IG10a19waW5jb25mX2Fkdl9kcml2ZV9nZXRfcmF3LA0KPiA+ICsgICAgIC5h
ZHZfZHJpdmVfc2V0ICA9IG10a19waW5jb25mX2Fkdl9kcml2ZV9zZXRfcmF3LA0KPiA+ICt9Ow0K
PiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXQ4MTk2X3BpbmN0
cmxfb2ZfbWF0Y2hbXSA9IHsNCj4gPiArICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10
ODE5Ni1waW5jdHJsIiwgLmRhdGEgPQ0KPiA+ICZtdDgxOTZfZGF0YSB9LA0KPiANCj4gDQo+IFBs
ZWFzZSBydW4gc2NyaXB0cy9jaGVja3BhdGNoLnBsIGFuZCBmaXggcmVwb3J0ZWQgd2FybmluZ3Mu
IFRoZW4NCj4gcGxlYXNlDQo+IHJ1biBgc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tc3RyaWN0YCBh
bmQgKHByb2JhYmx5KSBmaXggbW9yZQ0KPiB3YXJuaW5ncy4NCj4gU29tZSB3YXJuaW5ncyBjYW4g
YmUgaWdub3JlZCwgZXNwZWNpYWxseSBmcm9tIC0tc3RyaWN0IHJ1biwgYnV0IHRoZQ0KPiBjb2Rl
DQo+IGhlcmUgbG9va3MgbGlrZSBpdCBuZWVkcyBhIGZpeC4gRmVlbCBmcmVlIHRvIGdldCBpbiB0
b3VjaCBpZiB0aGUNCj4gd2FybmluZw0KPiBpcyBub3QgY2xlYXIuDQogIFNvcnJ5LCBpdCdzIHRo
ZSBzYW1lIGhlcmUsIG5vIHdhcm5pbmdzIHdlcmUgcmVwb3J0ZWQgaGVyZS4gQ291bGQgeW91DQpw
bGVhc2UgcG9pbnQgaXQgb3V0PyBUaGFuayB5b3V+ICANCg0KPiANCj4gPiArICAgICB7IH0NCj4g
PiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG10ODE5Nl9w
aW5jdHJsX2RyaXZlciA9IHsNCj4gPiArICAgICAuZHJpdmVyID0gew0KPiA+ICsgICAgICAgICAg
ICAgLm5hbWUgPSAibXQ4MTk2LXBpbmN0cmwiLA0KPiA+ICsgICAgICAgICAgICAgLm9mX21hdGNo
X3RhYmxlID0gbXQ4MTk2X3BpbmN0cmxfb2ZfbWF0Y2gsDQo+ID4gKyAgICAgICAgICAgICAucG0g
PSAmbXRrX3BhcmlzX3BpbmN0cmxfcG1fb3BzLA0KPiA+ICsgICAgIH0sDQo+ID4gKyAgICAgLnBy
b2JlID0gbXRrX3BhcmlzX3BpbmN0cmxfcHJvYmUsDQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0
aWMgaW50IF9faW5pdCBtdDgxOTZfcGluY3RybF9pbml0KHZvaWQpDQo+ID4gK3sNCj4gPiArICAg
ICByZXR1cm4gcGxhdGZvcm1fZHJpdmVyX3JlZ2lzdGVyKCZtdDgxOTZfcGluY3RybF9kcml2ZXIp
Ow0KPiA+ICt9DQo+ID4gK2FyY2hfaW5pdGNhbGwobXQ4MTk2X3BpbmN0cmxfaW5pdCk7DQo+ID4g
Kw0KPiA+ICtNT0RVTEVfTElDRU5TRSgiR1BMIik7DQo+IA0KPiANCj4gLi4uDQo+IA0KPiA+ICsj
ZW5kaWYgLyogX19QSU5DVFJMX01US19NVDgxOTZfSCAqLw0KPiA+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2R0LWJpbmRpbmdzL3BpbmN0cmwvbXQ4MTk2LXBpbmZ1bmMuaA0KPiA+IGIvaW5jbHVkZS9k
dC1iaW5kaW5ncy9waW5jdHJsL210ODE5Ni1waW5mdW5jLmgNCj4gPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uNzE3MzUxYjEyMjU1DQo+ID4gLS0tIC9kZXYv
bnVsbA0KPiA+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9tdDgxOTYtcGluZnVu
Yy5oDQo+ID4gQEAgLTAsMCArMSwxNTcyIEBADQo+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlICovDQo+ID4gKy8qDQo+ID4gKyAqIENv
cHlyaWdodCAoQykgMjAyNCBNZWRpYXRlayBJbmMuDQo+ID4gKyAqIEF1dGhvcjogR3VvZG9uZyBM
aXUgPEd1b2RvbmcuTGl1QG1lZGlhdGVrLmNvbT4NCj4gPiArICovDQo+ID4gKw0KPiA+ICsjaWZu
ZGVmIF9fTVQ4MTk2X1BJTkZVTkNfSA0KPiA+ICsjZGVmaW5lIF9fTVQ4MTk2X1BJTkZVTkNfSA0K
PiA+ICsNCj4gPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3BpbmN0cmwvbXQ2NXh4Lmg+DQo+ID4g
Kw0KPiA+ICsjZGVmaW5lIFBJTk1VWF9HUElPMF9fRlVOQ19HUElPMCAoTVRLX1BJTl9OTygwKSB8
IDApDQo+ID4gKyNkZWZpbmUgUElOTVVYX0dQSU8wX19GVU5DX0RNSUMxX0NMSyAoTVRLX1BJTl9O
TygwKSB8IDEpDQo+ID4gKyNkZWZpbmUgUElOTVVYX0dQSU8wX19GVU5DX1NQSTNfQV9NTyAoTVRL
X1BJTl9OTygwKSB8IDMpDQo+ID4gKyNkZWZpbmUgUElOTVVYX0dQSU8wX19GVU5DX0ZNSTJTX0Jf
TFJDSyAoTVRLX1BJTl9OTygwKSB8IDQpDQo+ID4gKyNkZWZpbmUgUElOTVVYX0dQSU8wX19GVU5D
X1NDUF9ETUlDMV9DTEsgKE1US19QSU5fTk8oMCkgfCA1KQ0KPiA+ICsjZGVmaW5lIFBJTk1VWF9H
UElPMF9fRlVOQ19UUF9HUElPMTRfQU8gKE1US19QSU5fTk8oMCkgfCA2KQ0KPiANCj4gDQo+IFRo
ZXNlIGFyZW4ndCByZWFsbHkgYmluZGluZ3MuIElmIHlvdSBkaXNhZ3JlZSwgcG9pbnQgbWUgdG8g
dGhlIHVzYWdlDQo+IGluDQo+IHRoZSBkcml2ZXIuDQogIFNvcnJ5LCBJIG1pc3VuZGVyc3Rvb2Qg
dGhlIG1lYW5pbmcgb2YgdGhlIGJpbmRpbmdzIGVhcmxpZXIuIFRoZQ0KcmVhbGx5IGJpbmRpbmdz
IHdpbGwgYmUgdXBsb2FkZWQgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+IA0KPiANCj4gDQo+IEJlc3Qg
cmVnYXJkcywNCj4gS3J6eXN6dG9mDQo=

