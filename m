Return-Path: <linux-gpio+bounces-14697-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D9FA0B343
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 10:41:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 273333AB0CF
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 09:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E1B235BF0;
	Mon, 13 Jan 2025 09:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WfKfN8sB";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="jkpVxM0h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6078C23A56D;
	Mon, 13 Jan 2025 09:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736760779; cv=fail; b=nMJ5FidMZLoMPm3it3n9+BguSvmta1MaWnYhGK73Zfjkw2+PrgOVUscj4u8vauxtQOM/0gWNJmwfXItnaDNWI47NnuiWcbggX9Qz7AjV0o3881Z8un6Ypfn58opYGlOJ4Z5+osCx4u1SVT2gvff43D28zevCdJcsIOontiMpBoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736760779; c=relaxed/simple;
	bh=hQ0EANdDNvc8Wdd8a3KS7Uqgpe8lXenhVUod+uZbX0U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CHEYWsD60vOamSV8X38W/ZaKsqTbopqcIUaZ35iw4+Gi7Tqbnp6or+985k5HM48jk/nxdrfvlq/2obwJuMh1WKQY5hhYCU/WqJwroF9cdd9bZXA9kC0DmqoPVLZrhkYz7nn1Kut11qG1grt1jyWQswSg6m5+1rRyK8+8ouCkBC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=WfKfN8sB; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=jkpVxM0h; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 5a85adbed19111ef99858b75a2457dd9-20250113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=hQ0EANdDNvc8Wdd8a3KS7Uqgpe8lXenhVUod+uZbX0U=;
	b=WfKfN8sBimH/8lKbFLhcXuUf3GcofyRCgkJcF7eal443WnFpe/2CsttiARZ8AGJa3rZmru0n0oiALN55VYzd96M1+wqAoz0ax7GpSSJvakaJOrxbhvJhtXjGro/KgJ9X9HSpm3As3DbeDtPM+nHAU3ga2yPxDNI2sOUmSuKOlW8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:88f016e1-ddcd-4d3b-851c-75d172714288,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:adc0cc37-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 5a85adbed19111ef99858b75a2457dd9-20250113
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1844265665; Mon, 13 Jan 2025 17:32:49 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 Jan 2025 17:32:47 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 13 Jan 2025 17:32:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1/ZFmVq4t487fcA5jwtvOE8J8fEvK+qV1LqHRgI5U3Jhf3wANEhaKVLvcFmY4DBWR/424WIQgDIpamxSMm4xrhD7NDW1z5WbAMaG9Qec7wefyz4eeVOdDWEPOc/fsAAZkdWlgMc+Q4zN1o3RUBpsgixIUe8V6mMwBpGTSQWrM6ZXljvFSvFCTgI5yi69Nwxct+hEBjJO9b9oQ5n8ZJP0E/NU1b+W6yRD6b6CAUHL1kkUlz7wN3HuTPLENRZFYfXWL8fHu7UCGGPYeo5t/BKC3FHPAAbyO1gBkSUBavjpxtcprhgMpDnr6coIevLXyvbKYCFM2CCuXjafuBA4vmAuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQ0EANdDNvc8Wdd8a3KS7Uqgpe8lXenhVUod+uZbX0U=;
 b=GFh5b/L5ZuZe1yhjulQT4cnw5g9u0+kL7RBsy6U6VSJ26VJ/shvrFrdoZ6rYCPXihWdZWeuLX1qwMIEfr582kI2z0PodoEswyM7Ban35i1euW8LU6GObquXS3V0qyRc4LHlMkcq8qAGkaw+atKs0TTIe2SyIzXY84CbUIdooDQvJF8F8OZnC3IHjDQ2uaWvSLa45KFOimL7LbiJx3CI5YSIOGM+iXigPZoNhflryb2M0Po7ZVHBfb4zZiYEGAKrhEjAwxUAYe7SMOC/jGd5124E1JFI1E8SPh+zyfK88VhXOJ5j1y19Z2uIDnX45likvxgcImwR/RhBq9u4iDI2WqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQ0EANdDNvc8Wdd8a3KS7Uqgpe8lXenhVUod+uZbX0U=;
 b=jkpVxM0hVV0U2K4RMSoeyqOAs7yZwJ54Kce/G8ywZeLFnXib5C0+YK5rXqGbHr/viVutk57j5k8jSem/jKo1newKakhHGP+QIXBOIsCDAS+F2CmOm0BAQ39QQFXNr18kN/JoeGnjIxnPklm3j4JysJDqW5ZDUJZYnEUI9v9Jr+M=
Received: from PSAPR03MB5688.apcprd03.prod.outlook.com (2603:1096:301:88::14)
 by SG2PR03MB6778.apcprd03.prod.outlook.com (2603:1096:4:1ba::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 09:32:45 +0000
Received: from PSAPR03MB5688.apcprd03.prod.outlook.com
 ([fe80::d976:8c60:38aa:d1dc]) by PSAPR03MB5688.apcprd03.prod.outlook.com
 ([fe80::d976:8c60:38aa:d1dc%6]) with mapi id 15.20.8335.012; Mon, 13 Jan 2025
 09:32:45 +0000
From: =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "sean.wang@kernel.org"
	<sean.wang@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	"guodong.liu@mediatek.corp-partner.google.com"
	<guodong.liu@mediatek.corp-partner.google.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, =?utf-8?B?R3VvZG9uZyBMaXUgKOWImOWbveagiyk=?=
	<Guodong.Liu@mediatek.com>
Subject: Re: [PATCH] pinctrl: mediatek: Add pinctrl driver
Thread-Topic: [PATCH] pinctrl: mediatek: Add pinctrl driver
Thread-Index: AQHbND8Z0ceBiMFMO0Kz/ALR4pUu7rMU07OA
Date: Mon, 13 Jan 2025 09:32:45 +0000
Message-ID: <00529b74cd1a98984a793fbc37fb6e9ac984afcb.camel@mediatek.com>
References: <20241111074030.25673-1-ot_cathy.xu@mediatek.com>
	 <73756cb5-6bd4-4c4e-9d91-1b9c1ca96a37@collabora.com>
In-Reply-To: <73756cb5-6bd4-4c4e-9d91-1b9c1ca96a37@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5688:EE_|SG2PR03MB6778:EE_
x-ms-office365-filtering-correlation-id: 505a853a-68b5-460f-06a7-08dd33b53ca9
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bi83dzltZWwwZEJaWEdkL2lwaktyVCtibDBTRytXN085dlg4YUUvRkUzWkJm?=
 =?utf-8?B?MmtwdEpZQlByZ2krL1N0UjBESzlleTVCQmVTU2ZmbGtuUXg4UE54QnFtT3NG?=
 =?utf-8?B?dGpFYjBTL1h4cDQ4WFRybG5tZE9qNENjY0p1VWlqMzhGUVpEQU84KzU2dEpS?=
 =?utf-8?B?RzE3ZmpOQlRXUUw2SDZWaXExSW9KRGZ5UlFPRE5RTHFtSng4bE8yOWdxRUpE?=
 =?utf-8?B?ZDAycVB4c3FlODVZQXlaNkFiR25ld1ZlOFpwcFRud05YSThoUnVZYlFxMW1k?=
 =?utf-8?B?c2lJanZFY2pIRTRzMkVCRHpiYXlQc2psSkRzR3Z4T2xXbGJpSmtyeXVDV1lj?=
 =?utf-8?B?Ri96SG5nWWliTE9tOFFmOTdFZDM4T0hiMlBXWmZwV3RwcmFiR3FWdjloRWdr?=
 =?utf-8?B?S0ZDMldTdWpob3hpRkxJaHZnVHpUazQ0amdCUk90TDR3ZUsrVEpxcHNHamNm?=
 =?utf-8?B?S0IxNWt0RWErbW9KUE4weklveG42UDljVnN3bk85ODJ3U0lNN21pbW1xYkF1?=
 =?utf-8?B?bVNzcklmV1hicE0yUmgyS2l0VEduSEk1MW5kMXNXaUl6dktHcVE1K3M5K2Jx?=
 =?utf-8?B?RXN5WmRWTnhIcW92dk1RbHhHNFlKb2ZDOXZHVlp5V0I0ME1TR0RMdTVIaXV5?=
 =?utf-8?B?NWxEM1Fud2xHeUFJR200VFhZL0dJS0dvSkFXRm94YlhqSWcwZWhEczJESHhu?=
 =?utf-8?B?L3BTWUNrTU9uUVV5RUFhbjdlR0ZqTkJaOGl6Tzd0YXRKRUpGOVl1MDBpaGpU?=
 =?utf-8?B?dW1SRU1zdlRqNTNZVzJmZ3dPS25ySHpZMmI5Qm8xRG9XSjhvY1BodHlHd28w?=
 =?utf-8?B?bTN1c3h6c0VxYzM4NVVTcVlZazg3bG56WXJkOHVRK1htclYxeEhlV01vaG43?=
 =?utf-8?B?b2dEbTUvb01DT2srdWNoRG9oVGpGRmRlQW01WGREd0ZsVXl5UW40MmNtb3Rx?=
 =?utf-8?B?UExabnhGTjBxMzdvZ2FLR2VSdTh3ZVFPT3RWaHZaa21iakluSlJmaUpTK3Bs?=
 =?utf-8?B?dXhPL1Fxa09lM2dIMys2Z1NGSCtxOXNyMVgyR3ZRR2lTTm82c01BM0tyWXlJ?=
 =?utf-8?B?WTBDTThxR296UDk5Y3FDY0xWR3dmSVJUcmlFM1JraHc4YVgzYWZGeVVZMmVX?=
 =?utf-8?B?Qmx0c0JGRUZKOFJ4ak1zSk9rZjhwTUViYWZJU0dYMlFQRk1JOFNUWlhrTkVk?=
 =?utf-8?B?dC8xUVB2TWkxTHFGQ09aTWlsVTVETGNBVTFha3Fkb09xVnpuZVVoK1VOZk1p?=
 =?utf-8?B?anlBOGtZRjA1bU5weVY4TWM1c3c3STV0d3NkUFhGQnJwUTd2NXp4VjMydXRi?=
 =?utf-8?B?Y29IQU9NdnRBcHluRlF4QjJkRmFUWjljQzZtWGxFTk5tNnNEM2cvYi9lT0R1?=
 =?utf-8?B?d3NueVl4dm1zWEs4eFdKOC9teGx2cmt5dUpXRU41Q3FQUHowWHhsRmczMU5w?=
 =?utf-8?B?QlFXeXpTVHNrNGdHOEZSQzlyT1U4SWI0ZkhYS1FuV0tGRmRqdGRoY0lsS1ht?=
 =?utf-8?B?UVUvc0h5aFRZaG9ZMUt0N2hTcmpSUDYvaWhqSklSQUY1WlN6ZE9FOUZKenVz?=
 =?utf-8?B?SFpkS3g1V1pxdDNLTXRtcnhlbC91c1UwYmY3V0xyYStYa2JyRVp0bjNtRWQz?=
 =?utf-8?B?Rkx0SFp2dzBxdmxrOFA1V3ZBa2htdjVlcTlycHozdVZPZ05VZmRzZDNNNkEx?=
 =?utf-8?B?ZG05UkRuOFVndDJ1MytuRW1SNVp4K3J3bGVxbUVaaFJLeXlGc1FmbzhabW43?=
 =?utf-8?B?NGpXN2xXRmhpRWxqUXA5SWZGUXJnRkwwUTRKS1EycVlxLzg1Q3dYeFZmaDRE?=
 =?utf-8?B?dDV5SXRMcUhiSUlQaHU2MHEzK0dGVVZ3dE00TC9jYXdEK1l0ZDl6RCtjb0VS?=
 =?utf-8?B?NDlEOXJlVWd4TjBXc0NBUXozc3BLVWJ1emY0OXhYVEp6ejYwN2VESENPV083?=
 =?utf-8?Q?1WvHt7QpJStSWn7NP0tYIViYeMhyHzAV?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5688.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1R0aGF5Q29MNm9iUXY1bWR1Mm5McDczTkhoa1BzaHRsTjBnbzVkaUJYbzBO?=
 =?utf-8?B?aFRxWnVqSUhjSmhyU1hBZXRzNnUwQU81OHc1TWlkSHVBZWxJaXdXZE5iOFJp?=
 =?utf-8?B?czI2Y3VLdUF5YmFZRHplUlFsdW9Rd1lCZzJPU3hxb2taVXhxRkoxRHRrSGw0?=
 =?utf-8?B?QU04NGJUUWVVSVJjMEMxY0laakx1a2d0THRyKzdObVV0Y2hMcjhTT1I1SmIx?=
 =?utf-8?B?QUZXbHQyLzF6Q3NHekNiM0hGbmJUUGk5c0pydHdtaVV6c0xjT1NjdzE0MlJU?=
 =?utf-8?B?amdGNVc2NW5CMDBYOTMvYmZvN3FUemNISmVJMUN5aVE3U2plMktRUlZta2x6?=
 =?utf-8?B?blFnaXZPNWRTTVVvdTNxYjhuM3ppNkJSUkFIMDJzZitLekU5NmRmUmdEcjl1?=
 =?utf-8?B?TC9Rby9XM053elFJK1NKOVlES0VxUTRwTHpUZmZVa3BrTk40bVhmdm1XYmpZ?=
 =?utf-8?B?RWNTZFF1RGtvdCs4NFNBUEh0VDQrQnA1SFVJSmVpYStWMFphVzlGcUFkN0JS?=
 =?utf-8?B?SjM0eGFRU3V6MUhoUTJQT1IraWdWNi9adk93bTJIZm54Y2lFdmF5ZmMxRklh?=
 =?utf-8?B?RW00L3A2M1VCTFNYb2hPSE5jS1RRTWU1emNJeGdoeHd4dFVuL2IwRW5Gc24y?=
 =?utf-8?B?V2dqSHh5dnArZVJkbUFydzJyQ1liUVJmZGEwYXV1cjUwdjRWRS92b1lqUFQ4?=
 =?utf-8?B?OHdIWVBhRk1NVXE3cEptaHhyaFZOZkowbjVjQnZSNHpYNjIwNnExMXpSWG42?=
 =?utf-8?B?WjFRVnQxemhNZ29RekJGc05aSk1zS3ZLL1lVZ0tZSVd5dWNmditKZjhnelc2?=
 =?utf-8?B?aE1OOHRwTGJpSDRxQ1ZvMUl5Sk5IdjhoM3YralNNekZCcTBFVmQ5akVvWmhX?=
 =?utf-8?B?SUVvV2lSVzNHSjh1QWhWSkMxWjl3TjFWdEY0OURoZWpaNVdsWW9DVkRvUTk0?=
 =?utf-8?B?Ny9KNGRKcVRpUzdEUGluT3IxRGsrc1hpMkNwNEZMbjdVRFFqRDgyOUlYS21C?=
 =?utf-8?B?cStrcldIZ3BBeWMrcGRSeXZ6eW5paTJaQWlsRHh5Mm1OcnRSVlpiaC9zTGdS?=
 =?utf-8?B?N3JkSEFhSG5CbExuSTJCQW95QkpCdmxxV0FHdkVjVDF4U1phSjBMbWtNQUl5?=
 =?utf-8?B?dENsa0ZlcWM1VDdPbXFjaVlWWVZ4K01JcmZOUjdKZCs1anhlVi8raEdZbXFh?=
 =?utf-8?B?Uit3d01lMzNhNjFMTnVkdjJLTHhSdEFlOHJMeitVcTUwcFRNVWdSVnQ3Qjdk?=
 =?utf-8?B?R1dWbmc0aG05UE4wUElHdlZNaTUza2JPRlRacWtEWGpBYlhOOWFZZmJYd29a?=
 =?utf-8?B?cGFxUzhTMm8xWlFBaG9HcVQvM1lySitHQjYydHNzVDhqUG13dExKRWc1YllC?=
 =?utf-8?B?blVNU2ViaUFLc2JsVEl4YlVBcnEzdksvS1ZPVHpOcTQ4TzlROFpnbzZVL2xW?=
 =?utf-8?B?aS9GaDMzVGJEczlzM0twTWpQRVFQS2F4R01aZkxHWWxOSWFRMk00UEliOWZY?=
 =?utf-8?B?M0RxZExva2dHdjNuWlB2VXhYc0JaUVIrbUgxSGxmMnJBZ0hEa1pseS9BcjNH?=
 =?utf-8?B?N2gyRy83czQzMFlXYnhYTVY3LzZPUG5ta2RpcE15YXhpUnBBYWhBcEJuMllZ?=
 =?utf-8?B?L3JMNm5FbnpYZktYejFtN0lLT2haK1V5MmdpSHJoemhVaXNEL2JBdUxUMjZK?=
 =?utf-8?B?bVJTQ0hSSTVSU1lyc3hhZ2tQalV0aGRKZ1dSbTVTUEJxZ1FHZGVyMURTMkR5?=
 =?utf-8?B?NGFkbkFaMnp2SG5HcGVvbisrYnRhTTlnbXJWd05Gc1lqemJrTk0vQkozVFpC?=
 =?utf-8?B?V1BHQUorVUxyVVJ0cXd3OG9XK1R3WjNVcHAwZHFUREl5QjRuYWJjeXJISFhl?=
 =?utf-8?B?TXFVRWhDQTZrSGhLTVF3UFNJR25ONkx3ODRBZzAwZXM2UHdLRmRCQUFVQVdl?=
 =?utf-8?B?bFFZTnlLODhkbXphdENtbldVREpvMklTUWhaRFZPQmFqWHZMc2ZnQUh5ZFkz?=
 =?utf-8?B?Tmh6K2NiQnZLL0dkNUZwVTRuWGdXSUM4T2ZHMlhpeExaTzFjUzZnUFM2djJl?=
 =?utf-8?B?ckp1YUY1WUZTaTN4VFVXZ0RIcENSNDAxaUN4QWJBV3hjY0JxdklNZVFlUzcw?=
 =?utf-8?B?ODFuYXhZYnJ3UTJVajFNY2tLeU9zY2V4UVQweUYxYnBDK2JPeTZrNmU3Rit4?=
 =?utf-8?B?NEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <81DC3207BE97B14D97FA6F52A491B84B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5688.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 505a853a-68b5-460f-06a7-08dd33b53ca9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 09:32:45.5732
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MXkjaMldq2909bmxldhSzUA+T8OIPjZ2SFsetlStr4jteWS7UUzuSscJdd5yszi+CPH8spBJzaQJbSRF3kExXVdyF4enqb0jlNSRtmZe9jQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6778

T24gTW9uLCAyMDI0LTExLTExIGF0IDE0OjM5ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAxMS8xMS8yNCAwODo0MCwgb3Q5MDcyODAg
aGEgc2NyaXR0bzoNCj4gPiBGcm9tOiBHdW9kb25nIExpdSA8Z3VvZG9uZy5saXVAbWVkaWF0ZWsu
Y29ycC1wYXJ0bmVyLmdvb2dsZS5jb20+DQo+ID4gDQo+ID4gQWRkIHBpbmN0cmwgZHJpdmVyIGZv
ciBtdDgxOTYNCj4gPiANCj4gDQo+IFBsZWFzZSBmaXggdGhlIGNvbW1pdCB0aXRsZSwgYWRkIGEg
bWVhbmluZ2Z1bCBkZXNjcmlwdGlvbiAuLi4gYW5kDQo+IGFsc28gcGxlYXNlIGZpeA0KPiB5b3Vy
IG5hbWUsIGFzIHlvdXIgZW1haWwgaXMgc2VudCBieSAib3Q5MDcyODAiIGFuZCBub3QgZnJvbSAi
Q2F0aHkNCj4gWHUiLg0KICBUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3Lkl0IHdpbGwgYmUgZml4
ZWQgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEd1b2RvbmcgTGl1
IDxndW9kb25nLmxpdUBtZWRpYXRlay5jb20+DQo+ID4gQ2F0aHkgWHUgPG90X2NhdGh5Lnh1QG1l
ZGlhdGVrLmNvbT4NCj4gDQo+IFlvdSdyZSBtaXNzaW5nIHRoZSAiU2lnbmVkLW9mZi1ieTogIiBw
YXJ0IGJlZm9yZSB5b3VyIG5hbWUuDQogIEl0IHdpbGwgYmUgZml4ZWQgaW4gbmV4dCB2ZXJzaW9u
Lg0KDQo+IA0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL0tjb25maWcg
ICAgICAgICAgICAgIHwgICAxMiArDQo+ID4gICBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvTWFr
ZWZpbGUgICAgICAgICAgICAgfCAgICAxICsNCj4gPiAgIGRyaXZlcnMvcGluY3RybC9tZWRpYXRl
ay9waW5jdHJsLW10ODE5Ni5jICAgICB8IDE3NTcgKysrKysrKysrKysNCj4gPiAgIGRyaXZlcnMv
cGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ay1tdDgxOTYuaCB8IDI3OTENCj4gPiArKysrKysr
KysrKysrKysrKw0KPiA+ICAgNCBmaWxlcyBjaGFuZ2VkLCA0NTYxIGluc2VydGlvbnMoKykNCj4g
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1t
dDgxOTYuYw0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcGluY3RybC9tZWRpYXRl
ay9waW5jdHJsLW10ay1tdDgxOTYuaA0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Bp
bmN0cmwvbWVkaWF0ZWsvS2NvbmZpZw0KPiA+IGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL0tj
b25maWcNCj4gPiBpbmRleCBhNDE3YTAzMTY1OWMuLjE0OWE3OGU0MjE2ZSAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvS2NvbmZpZw0KPiA+ICsrKyBiL2RyaXZlcnMv
cGluY3RybC9tZWRpYXRlay9LY29uZmlnDQo+ID4gQEAgLTI1Niw2ICsyNTYsMTggQEAgY29uZmln
IFBJTkNUUkxfTVQ4MTk1DQo+ID4gICAgICAgZGVmYXVsdCBBUk02NCAmJiBBUkNIX01FRElBVEVL
DQo+ID4gICAgICAgc2VsZWN0IFBJTkNUUkxfTVRLX1BBUklTDQo+ID4gDQo+ID4gK2NvbmZpZyBQ
SU5DVFJMX01UODE5Ng0KPiA+ICsgICAgIGJvb2wgIk1lZGlhVGVrIE1UODE5NiBwaW4gY29udHJv
bCINCj4gPiArICAgICBkZXBlbmRzIG9uIE9GDQo+ID4gKyAgICAgZGVwZW5kcyBvbiBBUk02NCB8
fCBDT01QSUxFX1RFU1QNCj4gPiArICAgICBkZWZhdWx0IEFSTTY0ICYmIEFSQ0hfTUVESUFURUsN
Cj4gPiArICAgICBzZWxlY3QgUElOQ1RSTF9NVEtfUEFSSVMNCj4gPiArICAgICBoZWxwDQo+ID4g
KyAgICAgICBTYXkgeWVzIGhlcmUgdG8gc3VwcG9ydCBwaW4gY29udHJvbGxlciBhbmQgZ3BpbyBk
cml2ZXINCj4gPiArICAgICAgIG9uIE1lZGlhVGVrIE1UODE5NiBTb0MuDQo+ID4gKyAgICAgICBJ
biBNVEsgcGxhdGZvcm0sIHdlIHN1cHBvcnQgdmlydHVhbCBncGlvIGFuZCB1c2UgaXQgdG8NCj4g
PiArICAgICAgIG1hcCBzcGVjaWZpYyBlaW50IHdoaWNoIGRvZXNuJ3QgaGF2ZSByZWFsIGdwaW8g
cGluLg0KPiA+ICsNCj4gPiAgIGNvbmZpZyBQSU5DVFJMX01UODM2NQ0KPiA+ICAgICAgIGJvb2wg
Ik1lZGlhVGVrIE1UODM2NSBwaW4gY29udHJvbCINCj4gPiAgICAgICBkZXBlbmRzIG9uIE9GDQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9NYWtlZmlsZQ0KPiA+IGIv
ZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL01ha2VmaWxlDQo+ID4gaW5kZXggMTQwNWQ0MzQyMThl
Li5iNGEzOWMxYmFmYjcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVr
L01ha2VmaWxlDQo+ID4gKysrIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL01ha2VmaWxlDQo+
ID4gQEAgLTM1LDYgKzM1LDcgQEAgb2JqLSQoQ09ORklHX1BJTkNUUkxfTVQ4MTg2KSAgICAgICAg
ICAgICAgICArPQ0KPiA+IHBpbmN0cmwtbXQ4MTg2Lm8NCj4gPiAgIG9iai0kKENPTkZJR19QSU5D
VFJMX01UODE4OCkgICAgICAgICAgICAgICAgKz0gcGluY3RybC1tdDgxODgubw0KPiA+ICAgb2Jq
LSQoQ09ORklHX1BJTkNUUkxfTVQ4MTkyKSAgICAgICAgICAgICAgICArPSBwaW5jdHJsLW10ODE5
Mi5vDQo+ID4gICBvYmotJChDT05GSUdfUElOQ1RSTF9NVDgxOTUpICAgICAgICAgICAgICAgICs9
IHBpbmN0cmwtbXQ4MTk1Lm8NCj4gPiArb2JqLSQoQ09ORklHX1BJTkNUUkxfTVQ4MTk2KSAgICAg
ICAgICs9IHBpbmN0cmwtbXQ4MTk2Lm8NCj4gPiAgIG9iai0kKENPTkZJR19QSU5DVFJMX01UODM2
NSkgICAgICAgICAgICAgICAgKz0gcGluY3RybC1tdDgzNjUubw0KPiA+ICAgb2JqLSQoQ09ORklH
X1BJTkNUUkxfTVQ4NTE2KSAgICAgICAgICAgICAgICArPSBwaW5jdHJsLW10ODUxNi5vDQo+ID4g
ICBvYmotJChDT05GSUdfUElOQ1RSTF9NVDYzOTcpICAgICAgICAgICAgICAgICs9IHBpbmN0cmwt
bXQ2Mzk3Lm8NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0
cmwtbXQ4MTk2LmMNCj4gPiBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ODE5
Ni5jDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjZk
MmJlZTcwNjcxOA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL3BpbmN0cmwv
bWVkaWF0ZWsvcGluY3RybC1tdDgxOTYuYw0KPiA+IEBAIC0wLDAgKzEsMTc1NyBAQA0KPiA+ICsv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+ICsvKg0KPiA+ICsgKiBDb3B5
cmlnaHQgKEMpIDIwMjQgTWVkaWF0ZWsgSW5jLg0KPiA+ICsgKiBBdXRob3I6IEd1b2RvbmcgTGl1
IDxHdW9kb25nLkxpdUBtZWRpYXRlay5jb20+DQo+ID4gKyAqDQo+ID4gKyAqLw0KPiA+ICsNCj4g
PiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+ICsjaW5jbHVkZSAicGluY3RybC1tdGst
bXQ4MTk2LmgiDQo+ID4gKyNpbmNsdWRlICJwaW5jdHJsLXBhcmlzLmgiDQo+ID4gKw0KPiA+ICsj
ZGVmaW5lIFBJTl9GSUVMRF9CQVNFKHNfcGluLCBlX3BpbiwgaV9iYXNlLCBzX2FkZHIsIHhfYWRk
cnMsDQo+ID4gc19iaXQsIHhfYml0cykgIFwNCj4gDQo+IEl0IGRvZXNuJ3QgbG9vayBsaWtlIHRo
ZXJlJ3MgYW55IHNfcGluIHdpdGggYSBkaWZmZXJlbnQgbnVtYmVyIGZyb20NCj4gZV9waW4gLSB1
bmxlc3MNCj4gSSBhbSBtaXNyZWFkaW5nIHNvbWV0aGluZywgeW91IGNhbiBjaGFuZ2UgYHNfcGlu
YCB0byBiZSBuYW1lZA0KPiBgc2VfcGluYCwgc28gdGhhdCB3ZQ0KPiBzdG9wIGRlY2xhcmluZyB0
aGUgbnVtYmVyIHR3aWNlOyBtYWtlcyBpdCBhIGxpdHRsZSBtb3JlIHJlYWRhYmxlLg0KICBUaGUg
ZGVmaW5pdGlvbnMgb2YgdGhlIG1hY3JvcyAnUElOX0ZJRUxEX0JBU0UnIGFuZCAnUElOX0ZJRUxE
JyBib3RoDQogIGNvbWUgZnJvbSAnUElOX0ZJRUxEX0NBTEMnLCB3aGVyZSB0aGUgc19waW4gYW5k
IGVfcGluIGluICdQSU5fRklFTEQnIA0KICBhcmUgZGlmZmVyZW50LiBUaGlzIHdheSwgdGhlIGNv
ZGUgb25seSBuZWVkcyBvbmUgbGluZSB0byByZXByZXNlbnQNCiAgdGhlIGFkZHJlc3NlcyBvZiBh
bGwgcGlucy4NCg0KICBQSU5fRklFTEQgZGVmaW5lOg0KICAjZGVmaW5lIFBJTl9GSUVMRChfc19w
aW4sIF9lX3BpbiwgX3NfYWRkciwgX3hfYWRkcnMsIF9zX2JpdCwgICANCl94X2JpdHMpICAgXA0K
ICAgICAgICAgIFBJTl9GSUVMRF9DQUxDKF9zX3BpbiwgX2VfcGluLCAwLCBfc19hZGRyLCBfeF9h
ZGRycywgICANCl9zX2JpdCwgX3hfYml0cywgMzIsIDApDQogIFBJTl9GSUVMRCB1c2U6DQogIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX3Bpbl9maWVsZF9jYWxjIG10ODE5Nl9waW5fbW9kZV9yYW5n
ZVtdID0gew0KICAgIFBJTl9GSUVMRCgwLCAyNzAsIDB4MDMwMCwgMHgxMCwgMCwgNCksDQp9Ow0K
DQo+IA0KPiA+ICsgICAgIFBJTl9GSUVMRF9DQUxDKHNfcGluLCBlX3BpbiwgaV9iYXNlLCBzX2Fk
ZHIsIHhfYWRkcnMsIHNfYml0LA0KPiA+IHhfYml0cywgXA0KPiA+ICsgICAgICAgICAgICAgMzIs
IDApDQo+ID4gKw0KPiA+ICsjZGVmaW5lIFBJTlNfRklFTERfQkFTRShzX3BpbiwgZV9waW4sIGlf
YmFzZSwgc19hZGRyLCB4X2FkZHJzLA0KPiA+IHNfYml0LCB4X2JpdHMpIFwNCj4gDQo+IFNhbWUg
aGVyZS4NCiAgU2FtZSBhcyBhYm92ZS4NCg0KPiANCj4gPiArICAgICBQSU5fRklFTERfQ0FMQyhz
X3BpbiwgZV9waW4sIGlfYmFzZSwgc19hZGRyLCB4X2FkZHJzLCBzX2JpdCwNCj4gPiB4X2JpdHMs
IFwNCj4gPiArICAgICAgICAgICAgIDMyLCAxKQ0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0
cnVjdCBtdGtfcGluX2ZpZWxkX2NhbGMgbXQ4MTk2X3Bpbl9tb2RlX3JhbmdlW10gPSB7DQo+ID4g
KyAgICAgUElOX0ZJRUxEKDAsIDI3MCwgMHgwMzAwLCAweDEwLCAwLCA0KSwNCj4gPiArfTsNCj4g
PiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX3Bpbl9maWVsZF9jYWxjIG10ODE5Nl9w
aW5fZGlyX3JhbmdlW10gPSB7DQo+ID4gKyAgICAgUElOX0ZJRUxEKDAsIDI3MCwgMHgwMDAwLCAw
eDEwLCAwLCAxKSwNCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRr
X3Bpbl9maWVsZF9jYWxjIG10ODE5Nl9waW5fZGlfcmFuZ2VbXSA9IHsNCj4gPiArICAgICBQSU5f
RklFTEQoMCwgMjcwLCAweDAyMDAsIDB4MTAsIDAsIDEpLA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAr
c3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfcGluX2ZpZWxkX2NhbGMgbXQ4MTk2X3Bpbl9kb19yYW5n
ZVtdID0gew0KPiA+ICsgICAgIFBJTl9GSUVMRCgwLCAyNzAsIDB4MDEwMCwgMHgxMCwgMCwgMSks
DQo+ID4gK307DQo+ID4gKw0KPiANCj4gLi5zbmlwLi4NCj4gDQo+ID4gK3N0YXRpYyBjb25zdCB1
bnNpZ25lZCBpbnQgbXQ4MTk2X3B1bGxfdHlwZVtdID0gew0KPiA+ICsgICAgIE1US19QVUxMX1BV
X1BEX1RZUEUsLyowKi8gICAgICAgICAgICAgICBNVEtfUFVMTF9QVV9QRF9UWVBFLC8NCj4gPiAq
MSovDQo+ID4gKyAgICAgTVRLX1BVTExfUFVfUERfVFlQRSwvKjIqLyAgICAgICAgICAgICAgIE1U
S19QVUxMX1BVX1BEX1RZUEUsLw0KPiA+ICozKi8NCj4gPiArICAgICBNVEtfUFVMTF9QVV9QRF9U
WVBFLC8qNCovICAgICAgICAgICAgICAgTVRLX1BVTExfUFVfUERfVFlQRSwvDQo+ID4gKjUqLw0K
PiA+ICsgICAgIE1US19QVUxMX1BVX1BEX1RZUEUsLyo2Ki8gICAgICAgICAgICAgICBNVEtfUFVM
TF9QVV9QRF9UWVBFLC8NCj4gPiAqNyovDQo+ID4gKyAgICAgTVRLX1BVTExfUFVfUERfVFlQRSwv
KjgqLyAgICAgICAgICAgICAgIE1US19QVUxMX1BVX1BEX1RZUEUsLw0KPiA+ICo5Ki8NCj4gPiAr
ICAgICBNVEtfUFVMTF9QVV9QRF9UWVBFLC8qMTAqLyAgICAgICAgICAgICAgTVRLX1BVTExfUFVf
UERfVFlQRSwvDQo+ID4gKjExKi8NCj4gPiArICAgICBNVEtfUFVMTF9QVV9QRF9UWVBFLC8qMTIq
LyAgICAgICAgICAgICAgTVRLX1BVTExfUFVfUERfVFlQRSwvDQo+ID4gKjEzKi8NCj4gPiArICAg
ICBNVEtfUFVMTF9QVV9QRF9UWVBFLC8qMTQqLyAgICAgICAgICAgICAgTVRLX1BVTExfUFVfUERf
VFlQRSwvDQo+ID4gKjE1Ki8NCj4gPiArICAgICBNVEtfUFVMTF9QVV9QRF9UWVBFLC8qMTYqLyAg
ICAgICAgICAgICAgTVRLX1BVTExfUFVfUERfVFlQRSwvDQo+ID4gKjE3Ki8NCj4gPiArICAgICBN
VEtfUFVMTF9QVV9QRF9UWVBFLC8qMTgqLyAgICAgICAgICAgICAgTVRLX1BVTExfUFVfUERfVFlQ
RSwvDQo+ID4gKjE5Ki8NCj4gPiArICAgICBNVEtfUFVMTF9QVV9QRF9UWVBFLC8qMjAqLyAgICAg
ICAgICAgICAgTVRLX1BVTExfUFVfUERfVFlQRSwvDQo+ID4gKjIxKi8NCj4gPiArICAgICBNVEtf
UFVMTF9QVV9QRF9UWVBFLC8qMjIqLyAgICAgICAgICAgICAgTVRLX1BVTExfUFVfUERfVFlQRSwv
DQo+ID4gKjIzKi8NCj4gPiArICAgICBNVEtfUFVMTF9QVV9QRF9UWVBFLC8qMjQqLyAgICAgICAg
ICAgICAgTVRLX1BVTExfUFVfUERfVFlQRSwvDQo+ID4gKjI1Ki8NCj4gPiArICAgICBNVEtfUFVM
TF9QVV9QRF9UWVBFLC8qMjYqLyAgICAgICAgICAgICAgTVRLX1BVTExfUFVfUERfVFlQRSwvDQo+
ID4gKjI3Ki8NCj4gPiArICAgICBNVEtfUFVMTF9QVV9QRF9UWVBFLC8qMjgqLyAgICAgICAgICAg
ICAgTVRLX1BVTExfUFVfUERfVFlQRSwvDQo+ID4gKjI5Ki8NCj4gPiArICAgICBNVEtfUFVMTF9Q
VV9QRF9UWVBFLC8qMzAqLyAgICAgICAgICAgICAgTVRLX1BVTExfUFVfUERfVFlQRSwvDQo+ID4g
KjMxKi8NCj4gPiArICAgICBNVEtfUFVMTF9QVV9QRF9UWVBFLC8qMzIqLyAgICAgICAgICAgICAg
TVRLX1BVTExfUFVfUERfVFlQRSwvDQo+ID4gKjMzKi8NCj4gPiArICAgICBNVEtfUFVMTF9QVV9Q
RF9UWVBFLC8qMzQqLyAgICAgICAgICAgICAgTVRLX1BVTExfUFVfUERfVFlQRSwvDQo+ID4gKjM1
Ki8NCj4gPiArICAgICBNVEtfUFVMTF9QVV9QRF9UWVBFLC8qMzYqLyAgICAgICAgICAgICAgTVRL
X1BVTExfUFVfUERfVFlQRSwvDQo+ID4gKjM3Ki8NCj4gPiArICAgICBNVEtfUFVMTF9QVV9QRF9U
WVBFLC8qMzgqLyAgICAgICAgICAgICAgTVRLX1BVTExfUFVfUERfVFlQRSwvDQo+ID4gKjM5Ki8N
Cj4gPiArICAgICBNVEtfUFVMTF9QVV9QRF9UWVBFLC8qNDAqLyAgICAgICAgICAgICAgTVRLX1BV
TExfUFVfUERfVFlQRSwvDQo+ID4gKjQxKi8NCj4gPiArICAgICBNVEtfUFVMTF9QVV9QRF9UWVBF
LC8qNDIqLyAgICAgICAgICAgICAgTVRLX1BVTExfUFVfUERfVFlQRSwvDQo+ID4gKjQzKi8NCj4g
PiArICAgICBNVEtfUFVMTF9QVV9QRF9UWVBFLC8qNDQqLyAgICAgICAgICAgICAgTVRLX1BVTExf
UFVfUERfVFlQRSwvDQo+ID4gKjQ1Ki8NCj4gPiArICAgICBNVEtfUFVMTF9QVV9QRF9SU0VMX1RZ
UEUsLyo0NiovDQo+ID4gTVRLX1BVTExfUFVfUERfUlNFTF9UWVBFLC8qNDcqLw0KPiA+ICsgICAg
IE1US19QVUxMX1BVX1BEX1JTRUxfVFlQRSwvKjQ4Ki8NCj4gPiBNVEtfUFVMTF9QVV9QRF9SU0VM
X1RZUEUsLyo0OSovDQo+ID4gKyAgICAgTVRLX1BVTExfUFVfUERfUlNFTF9UWVBFLC8qNTAqLw0K
PiA+IE1US19QVUxMX1BVX1BEX1JTRUxfVFlQRSwvKjUxKi8NCj4gDQo+IFBsZWFzZSBmaXggdGhl
IGluZGVudGF0aW9uIHRvIGJlIGNvbnNpc3RlbnQuDQogIEl0IHdpbGwgYmUgZml4ZWQgaW4gbmV4
dCB2ZXJzaW9uLg0KDQo+IA0KPiA+ICsgICAgIE1US19QVUxMX1BVX1BEX1JTRUxfVFlQRSwvKjUy
Ki8NCj4gPiBNVEtfUFVMTF9QVV9QRF9SU0VMX1RZUEUsLyo1MyovDQo+IA0KPiAuLnNuaXAuLg0K
PiANCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX3Bpbl9zb2MgbXQ4MTk2X2Rh
dGEgPSB7DQo+ID4gKyAgICAgLnJlZ19jYWwgICAgICAgID0gbXQ4MTk2X3JlZ19jYWxzLA0KPiA+
ICsgICAgIC5waW5zICAgPSBtdGtfcGluc19tdDgxOTYsDQo+ID4gKyAgICAgLm5waW5zICA9IEFS
UkFZX1NJWkUobXRrX3BpbnNfbXQ4MTk2KSwNCj4gPiArICAgICAubmdycHMgID0gQVJSQVlfU0la
RShtdGtfcGluc19tdDgxOTYpLA0KPiANCj4gV2hlcmUgaXMgZWludD8hDQogIEl0IHdpbGwgYmUg
YWRkIGluIG5leHQgdmVyc2lvbi4NCj4gDQo+ID4gKyAgICAgLm5mdW5jcyA9IDgsDQo+ID4gKyAg
ICAgLmdwaW9fbSA9IDAsDQo+ID4gKyAgICAgLmJhc2VfbmFtZXMgICAgID0gbXQ4MTk2X3BpbmN0
cmxfcmVnaXN0ZXJfYmFzZV9uYW1lcywNCj4gPiArICAgICAubmJhc2VfbmFtZXMgICAgPQ0KPiA+
IEFSUkFZX1NJWkUobXQ4MTk2X3BpbmN0cmxfcmVnaXN0ZXJfYmFzZV9uYW1lcyksDQo+ID4gKyAg
ICAgLnB1bGxfdHlwZSA9IG10ODE5Nl9wdWxsX3R5cGUsDQo+ID4gKyAgICAgLmJpYXNfc2V0X2Nv
bWJvID0gbXRrX3BpbmNvbmZfYmlhc19zZXRfY29tYm8sDQo+ID4gKyAgICAgLmJpYXNfZ2V0X2Nv
bWJvID0gbXRrX3BpbmNvbmZfYmlhc19nZXRfY29tYm8sDQo+ID4gKyAgICAgLmRyaXZlX3NldCAg
ICAgID0gbXRrX3BpbmNvbmZfZHJpdmVfc2V0X3JldjEsDQo+ID4gKyAgICAgLmRyaXZlX2dldCAg
ICAgID0gbXRrX3BpbmNvbmZfZHJpdmVfZ2V0X3JldjEsDQo+ID4gKyAgICAgLmFkdl9kcml2ZV9n
ZXQgID0gbXRrX3BpbmNvbmZfYWR2X2RyaXZlX2dldF9yYXcsDQo+ID4gKyAgICAgLmFkdl9kcml2
ZV9zZXQgID0gbXRrX3BpbmNvbmZfYWR2X2RyaXZlX3NldF9yYXcsDQo+ID4gK307DQo+ID4gKw0K
PiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdDgxOTZfcGluY3RybF9vZl9t
YXRjaFtdID0gew0KPiA+ICsgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk2LXBp
bmN0cmwiLCAuZGF0YSA9DQo+ID4gJm10ODE5Nl9kYXRhIH0sDQo+ID4gKyAgICAgeyB9DQo+IA0K
PiAgICAgICAgIHsgLyogc2VudGluZWwgKi8gfQ0KPiANCj4gPiArfTsNCj4gDQo+IFJlZ2FyZHMs
DQo+IEFuZ2Vsbw0KPiANCg==

