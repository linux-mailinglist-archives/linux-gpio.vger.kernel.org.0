Return-Path: <linux-gpio+bounces-20189-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F511AB7C85
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 05:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1C737B2FED
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 03:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E4328E580;
	Thu, 15 May 2025 03:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eG1F4hwk";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="hJYkja9n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7771C84B3;
	Thu, 15 May 2025 03:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747281486; cv=fail; b=NwX3yw62zM6HDmSaqwcyb78m4vZRhSZSDd0vBQYRnOiruW1fQZGlh/WJ7pYCPiCcDyLIoiWQeuOfQL84q3xnzjTFFNFVOPQ+epbOmS5Z9Zdm/ujj4M2hiOF/tCRl8cr62KjCuMNREZz5fAlo55LucJfVkOG6PD8HJn46UEnJzFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747281486; c=relaxed/simple;
	bh=WoC5Auk2Tyh9QGFUqlGzQeOw4EGiuH65+IVguXkg5JM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QDqLS82dPGGqRkgMZfRu7Nc+9j6AvsV7lpMw8YCSBkPj1h+YEMwMLHMRCpNsTtN32oDlGkJn/rwKaNxWW5Opy4hClSEJE1K3ZIW9tqbZAQF4NetpiSQ/g+/RHN5OWbJKYaBFdfky5/PXTE386DqNs/pEfYNRun+aNsEqnMQQbgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=eG1F4hwk; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=hJYkja9n; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c8d1d284314011f0813e4fe1310efc19-20250515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=WoC5Auk2Tyh9QGFUqlGzQeOw4EGiuH65+IVguXkg5JM=;
	b=eG1F4hwkJ4rJtDrA7AuP0S1X42ViX4qQQA1+Cl4XhLgM/hGmC6OfsA7WDDIMdl+vtaee/IWUedtE26FojADshA7bo4b00WQx9ux3EZnWZB/HNtOCHS/QnI3N0ARIxQMF0ZbrhufYNjOuJIeLN1AjnzfWTEUKlmgS+y723d5IQa8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:e31e1578-cf7c-4adc-8830-f11a2526c210,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:99f1c773-805e-40ad-809d-9cec088f3bd8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:99|80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: c8d1d284314011f0813e4fe1310efc19-20250515
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1472216594; Thu, 15 May 2025 11:57:56 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 15 May 2025 11:57:54 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 15 May 2025 11:57:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoU5M70qiYYIbAc9n8r3Xsc9no21bzstjswreeytvaPOGKAFMdKf/6Cza5YrRalG6oMp+jPaLhe4vIBMGZDbM1cz2p6mDXagSuLdwz2QRbGk0d+zufzPQfAcM7EL9sUtTJ1+JQqyUbRjM3QdHqiWwyovhwxqcaA0vE5XnrQlTcKOSxSzrv+Po8Oz71z5dSp/ZmgOZPRa802aLPfTzjC/dI1VCiqkSLA9lq5sI0oD7TIwRYCpsGmIxZ++ZnVyozWIN+bJE7udA6VLeKZXFANObtTU4MjbI3kHM2O5q9uJcb/ym5kCv9CtIyReec13E6taTrUplhz3EQ/DQe2iUYjIPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WoC5Auk2Tyh9QGFUqlGzQeOw4EGiuH65+IVguXkg5JM=;
 b=svzVjudrnj9Mv9DVFdTkqKA80qtbwXD25XE5mHlqEtX1U2vD516o7ZUpaqfmClCFABZlWP3b3GcFmiJLecvBXnMNvHPmLtYMFzrWx8RYYSpaHwu5p7+oK0kTMfT6ARzZ0AAYEaKlOlkGoFNpPYxBZ9uWyG4Kx6MFuDaQOs/8jhO2vLWEi/XN2RBesKibcEmACyKGq4bdTb+4b3tAu8eGLlvcXKopuU8wAA3rPxHt0myAZwGAl0GByasnH4or7pEkJ1dqfNuc4HFAsFIrfqF057XinBrBPhM0BKj5HceLqTPzlh+XZ7CrYWYBKr2JOoBc86C/chgTDQKlSPZEnxAgHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoC5Auk2Tyh9QGFUqlGzQeOw4EGiuH65+IVguXkg5JM=;
 b=hJYkja9ngAdsgXqcIlV8YQvZRG/qHD5Usfre2RBJFcYBhYh/ltki+mEdNdRVA8NGzUbOwDE3pLz7B5kUFbwmlP2erERbhetaC+tMl9Ny2UKWT8fYGyOdWGb5Pso4AASme32Y57dkgXeaRbooZDOZbSayCII2dQ0zBWbIDnWp6vk=
Received: from SEYPR03MB7588.apcprd03.prod.outlook.com (2603:1096:101:146::10)
 by SEYPR03MB7009.apcprd03.prod.outlook.com (2603:1096:101:b1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 03:57:51 +0000
Received: from SEYPR03MB7588.apcprd03.prod.outlook.com
 ([fe80::f427:bd2f:f38d:17dd]) by SEYPR03MB7588.apcprd03.prod.outlook.com
 ([fe80::f427:bd2f:f38d:17dd%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 03:57:51 +0000
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
Subject: Re: [PATCH v3 08/10] ASoC: dt-bindings: mediatek,mt8196-afe: add
 audio AFE document
Thread-Topic: [PATCH v3 08/10] ASoC: dt-bindings: mediatek,mt8196-afe: add
 audio AFE document
Thread-Index: AQHbxKgldFlQJpkhMUWGq86WL79BDLPR870AgAEeAAA=
Date: Thu, 15 May 2025 03:57:51 +0000
Message-ID: <01c01a1e0571b88935ad666675b74f40b4cd4a46.camel@mediatek.com>
References: <20250514081125.24475-1-darren.ye@mediatek.com>
	 <20250514081125.24475-9-darren.ye@mediatek.com>
	 <e74d82b3-ed4a-433b-9305-a80b68130a6f@kernel.org>
In-Reply-To: <e74d82b3-ed4a-433b-9305-a80b68130a6f@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7588:EE_|SEYPR03MB7009:EE_
x-ms-office365-filtering-correlation-id: 25821922-3bdf-491e-3b26-08dd9364aa0f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?cUVMaE5naVZUMFRXYjdzUDVDV3VLL2ZBanZHQm9aWjFIeXl0MUJRV0pnOEVE?=
 =?utf-8?B?UExhcXMxdjlsS0FnUEU3Y1ZVVlo4dDIvdVNFTGFDWnNMeHhiR0p6NHpzRjdr?=
 =?utf-8?B?VXRoRFBGa05Iek9HSDF3YVdIQTFMTVJBWmRRYy9yV3JFdTM2TUtFQi9USUtw?=
 =?utf-8?B?U001TkZINHJxRWJpcUxCWGpIbmR5NGNvM0NaRnVUbnpkVlpkY2FSRmtzRlpw?=
 =?utf-8?B?ZHorYVdhVjZNd3lEWTJ1YlVpaUhmU1RzMFBFdWxWWWxxQXUvWnNXUnVDN0Fs?=
 =?utf-8?B?dDZWb3JoWGdvVjNTdGgrckFvZkpCbklXb1BJYlNWTnlQWnhNU3VDRHBBSmJk?=
 =?utf-8?B?UkhDQXJvZnBqenErU05OZFBNREdkYXNsRFk3L29WUkFDQzNLOVdwQU9iSVRR?=
 =?utf-8?B?UEN6VW9JYWxLYzJwdnNDZkdHczZFNTMybHY1NkJBNUs4YldURGtXSzh6K1Q4?=
 =?utf-8?B?V3lqc05rVzd4WnNkMVNFMkJYUXNLT081VnF0QUFWZTN1M1dNS0tFL0JoNDlu?=
 =?utf-8?B?MWtkSEFaRjMxRkZTZi9zdDMvQnhQeG9EakJKUWRHZU9lWnMrVFJpMm4vazk3?=
 =?utf-8?B?Y1Qrb1FsZlZTeWFRK2ZRcHJwWGdLd2ovNHpxYzAvaTFYUU5TUm8yUEhSK0Mz?=
 =?utf-8?B?amFKKzk4ZEN4dUJ0a1AzV1V1b1hOL2plZzQ2VzlrcFdaV3BrSTFNbmt6ZlRZ?=
 =?utf-8?B?K2hvb3ltSlFaSi8wNUE1Q1NDWFphaTJUUVVETDFEM054cEd3SzYwNGNRUEN0?=
 =?utf-8?B?R0MyQVA0K0R0LzlRQTllN3o4R0g1SkNMNnF6S3JvOXJGR3BoSlcycTkzdVVz?=
 =?utf-8?B?eDVvVVZjaGl5WHE0ZXNDQkVhdmt1ZGhHR3FyRGZHRU93ZFpnNlNmeHk2Tk9S?=
 =?utf-8?B?ekt1akpwWnphSkZLcGpSZHhJVnRzRWU2WXg3cExVdEY0WVJSSlNlSTNENW4x?=
 =?utf-8?B?MDhCQ0UxZVpTelQvamMwVHVaOSt0V1plUG5mSFRlRHg2M3MxN25kTXVudk13?=
 =?utf-8?B?ZzhxczRzU0Rwd2I2UWtEQkhaN3pNam5Fb1AwTzlWdGg0Vml4dDRLZXkwSTBG?=
 =?utf-8?B?ZHpRWDhYT3d4b2tUUWV6clU2OCtFWTNENmJCaHA4VW93RzU5Q05MVTB1TkRj?=
 =?utf-8?B?SzkycUNaYnozbi9nS3V0bktsamZMSzlMQTUwbjV4YnY1Y05pMlpTOStqTm51?=
 =?utf-8?B?SGVTT1Zhb2YyaktrN0wwT2ZYZ090a0gyRDVTTG10MnlVcmgvOHQ3VlU5bVRB?=
 =?utf-8?B?dkY1WWEvVE9ZREpHVkhEUWFrN2FERHdBalFpQUhNZ3Q5L3I4WUhZL0JzVXhY?=
 =?utf-8?B?Q2FlazlDTEFDMEl3UUlnOUQ3eEMwYVpNRjJuMlc4bGMyOVpmRmtoKzhqTmhi?=
 =?utf-8?B?YmVFYURYcTZyb1V2RVlXRzJTQ0tNdkI2TDJsY0puakU0ZG03aDZxVkF5ejNr?=
 =?utf-8?B?TDlranBFR29VL3JxVUkxQVcrU0lPOVozYzdSMkVMakVvUkpISkdSMTNKVytV?=
 =?utf-8?B?WlRkVnhGL1ZhZm1JSVNNdUJJQmE5d1FaczhtQWFnU1FPTUh6aGpuOXBSK1Bt?=
 =?utf-8?B?WFJQdk1NUnJqRldMUzZPRGxZcWdqd3ZHVDNUQXliUTlsdk9iZ053QmdQV2Ez?=
 =?utf-8?B?Z3BybmwreERJeWhqS29ldEpwZHNyWkNnMkx4cU5tcTRoOGgwbnNBa1hDWlQ2?=
 =?utf-8?B?eVgrbEFEcnBKblRpV01TbEtJNDJzdWZnK05DUXJWaFozb0pETVpRbUltRmFR?=
 =?utf-8?B?dEhIYit2MWZtY2tDOUh1dHJ0d3BYeGVFVVZYZk5oNGkrSGdySG1wU3B1YXU5?=
 =?utf-8?B?SWxoNE1MOWNzUUFOYTl1OTR2bjR6MWdPTU5lSU8xV0NoNTVUdDV2YU5wY291?=
 =?utf-8?B?dStsRmRJWnZZOFdncnhDTXhVZnFyZ2llVC9GbmFoRzlPUVBCMVNJVUhOS2ti?=
 =?utf-8?B?cTgwWjJSWnNFNDlMeFplNTg4NGpRcVowMCsxVHg0eVV2c0lSQkNMNnhtd21D?=
 =?utf-8?B?MnFaQm9FdlNBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7588.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWEwN2lKdWl4eitDWlBFMjlxcnZMZWwzSUhnMjFzeDVNOWVaZG5NdkRBV3A1?=
 =?utf-8?B?TGFiRy9NMFBCQzU5VGxpYmY2WXBmSUhkNkxic0s5T1V3cllQZDNiRnFuNWto?=
 =?utf-8?B?a2tBOHhoWXQ4elIxbkQ4TmF6T1pkSGlWcnhXWnB3QSt4bGQ2ZlcvTVp3WGh2?=
 =?utf-8?B?ZXZpTzJ3aTAzQVJTYzlPWXBzTmgzemIxNkNqMERKQkFGVHlHVVlGRDlFNDg5?=
 =?utf-8?B?RzhpdE0yNlhKdXZ0YzNLejBRTWUrY1hidjVkQ0k3K3oxSGFQSzIreHhkU3Ix?=
 =?utf-8?B?NjFQUHJhYndBLys1T04wVXVPUGx3MlJEMUx6QzdBUDBiZzVxbHdvZTlzS3Ew?=
 =?utf-8?B?bit1TXlkNXV5UVVwYllKRDBib1FnY1E5aVp0L0tyZWswTS9ydk1nem9PY0Fu?=
 =?utf-8?B?TXZ5dFoxSzMzSW5sOWQzaUdqbWt4TXVTQUZVN0JrNUNjWGlUSnN0cHV5YjR3?=
 =?utf-8?B?RFNlbVZpS3c5TTduNEYyVzZkZ3Zod1VxS2Urb3ZjbllTcFE1YmJnZ3JobGRa?=
 =?utf-8?B?Q3FDdWxUcVJnMXoxZHVLdlBqTFZyM2h3dGV0aGxobXNMdE1DS21oQThpQ012?=
 =?utf-8?B?RDVycExJVmxydTJteDBSMTJreVBiUmxJWFVzTFA4MnNDbnZ6REFPRVRqdTI5?=
 =?utf-8?B?OFY5NVdQZ0tibFYxeExmbmhEUW1idXkybi83QTRYUUpTR1AxNEpydFJaSVhq?=
 =?utf-8?B?WDV3QVo1eVFlaWRlL2s3UGJYVGgzUEZMRjVrY0FiS0dTQWZiRks3RHd4Nk9j?=
 =?utf-8?B?Q2dNL1FGTlVpcDRMT1hIZzRIQlFhTExKVHBKc2J2TVZCR1IxTkdRN2FuRVFZ?=
 =?utf-8?B?TXBjd0ZXVFRjeXQ1SGRXM3B6UnB2VWEvYWxzYllnb3JaYW1tQkp0Vm9Uc3FR?=
 =?utf-8?B?b0Irb3N4TmpieElySk11RUN4R3JWZGR0bE92Z1p6ZUg3SG9FUWFFaTlpNHZz?=
 =?utf-8?B?T3dSUk5RVTdEVnZneFBvWE11SHpqTHBNRTZCaDlPOC9ZMHhUZlhRSUVMRkMy?=
 =?utf-8?B?ZUxVMEcvQ2lOQ0QxTzlwZW0zQnFyMGlUR01TN2JMSlcrV1RaY1c5cmJGTE9I?=
 =?utf-8?B?Z09lR2VPcjZaRUE2ODRoYWVaZ00zeE41dTBQSWxQUVo4aE9sU2VaQ2hkendE?=
 =?utf-8?B?SS9BT0lQRUIyRjZ4b2hoc05vclVqSHhWbmJnQTZ1aHowdCtLaXZJeXd0am9H?=
 =?utf-8?B?MlMwWmc2NkVheE5aSGRQb0tOaitBSVNmQkFLd0dUcitLV2IwOHpic1JUbmtQ?=
 =?utf-8?B?Wmd2RHIzc3gzcFN6N0FLZG9MbEE5NkFBS2FnS3VqaVBRa3JnZTFvMHptdENn?=
 =?utf-8?B?d29CbXdXR3FyU3BFWmRtdmNTK1JSMSs5UGpCSW1QRkRTQXIrbCt3Z3FLWThD?=
 =?utf-8?B?L0NIRllLc1RzQW56VGpHZDdZVTlwY2JDUE5QYTJrSUZ3eHIraXhrZEZoYVNw?=
 =?utf-8?B?ZnVnK1g2dUdnOVEyMEh2Z3kzcGVhQkNHRXVmQ0s0M3Q1a1JDanFBUzhJeTNQ?=
 =?utf-8?B?V0NSUjU1UFZqR0EzamJ2SHRweTNqSzZ4YW5zZlNOSE5kZExSNnR1YzFQNUZo?=
 =?utf-8?B?NzZITWhRWmxpMDRPb1RqRlpVcGhZTXBPRkpkTmI2UUJyamZ3U0tyYUJ6TTlW?=
 =?utf-8?B?OWlLZ1c4eFRNZUxTU1BvbnM1dlhPVklNUWJyWEgzcUFnRUJtYkd5SGtlOFZs?=
 =?utf-8?B?MCtxT2hMc0dZRDlHTHRRTnhSSjAycjlzSDMvTmQxWnhERHVEeFBxN0dvbS9V?=
 =?utf-8?B?eEhVSjNLRWp1Q3ZLck55V0JSZG8zMlNWOHJSS2hWY3VqQzVIOHFmenZyYmR6?=
 =?utf-8?B?ZWI0cklFUDNZSWVUN3ZmRXRaUFV6OEFydVNyUEhnaXpSVlRvLzBueUtUYnFJ?=
 =?utf-8?B?MHpoRGZodmVqMllxZFdsN2YwUTcxVUJjWlNnaytlNlh5WDNubjEveUNGVmVR?=
 =?utf-8?B?VzlhdjZXZjE4UkJoaXJWVjFlSDBVeS9zeFowOWhNR2YvSG1lc29jZkR4TnNE?=
 =?utf-8?B?R0VaK2ZrQjBGeFI4RkV5Qmx2NFo2WVh6Q3AyUTBaT1pOL1Yyek54b1JYL1p3?=
 =?utf-8?B?eU1nQThaMmNDS0kvcG5NZ2doYTR3Q0M4QUNobUw4ZUJlMGxORktIQ2ZnQzJr?=
 =?utf-8?B?cms5eUNrRGF1QjF5SGhHNko1L3pUeFd1SnJkbmVweXRyS2xhSW4zckNQaC82?=
 =?utf-8?B?cGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <28CF62C23A358E45BA47EAEEF952A0D4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7588.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25821922-3bdf-491e-3b26-08dd9364aa0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 03:57:51.5314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gsNbEm93Xg2GwI00Vw/zDCw/p/mq/H26hDUhKJtNRvTa00NqSfRLhfBC5S/OzIeW7ac+Aq7mRarK0gkt1NVtsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7009

T24gV2VkLCAyMDI1LTA1LTE0IGF0IDEyOjU0ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDE0LzA1LzIwMjUgMTA6MTEsIERhcnJlbi5ZZSB3cm90
ZToNCj4gPiBGcm9tOiBEYXJyZW4gWWUgPGRhcnJlbi55ZUBtZWRpYXRlay5jb20+DQo+ID4gDQo+
ID4gQWRkIG10ODE5NiBhdWRpbyBBRkUgZG9jdW1lbnQuDQo+IA0KPiBBIG5pdCwgc3ViamVjdDog
ZHJvcCBzZWNvbmQvbGFzdCwgcmVkdW5kYW50ICJkb2N1bWVudCIuDQo+IFNlZSBhbHNvOg0KPiAN
Cmh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2VsaXhpci5ib290bGluLmNvbS9s
aW51eC92Ni43LXJjOC9zb3VyY2UvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3N1
Ym1pdHRpbmctcGF0Y2hlcy5yc3QqTDE4X187SXchIUNUUk5LQTl3TWcwQVJidyFpU1FsNl9XTVg4
UTZ3c0JqNHBWZTdUZG5iZDJ6cFB3U21ITVNtNGhsaGtEMGxPN2g1SlNBcjI4LWRVal9Ed0xyWGhV
X0lCeXlfUVdRR1EkDQo+IA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IERhcnJlbiBZZSA8ZGFy
cmVuLnllQG1lZGlhdGVrLmNvbT4NCj4gDQo+IA0KPiAuLi4NCj4gDQo+ID4gKw0KPiA+ICtyZXF1
aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIHJlZw0KPiA+ICsgIC0gaW50ZXJy
dXB0cw0KPiA+ICsgIC0gbWVkaWF0ZWssdmxwY2tzeXMNCj4gPiArICAtIHBvd2VyLWRvbWFpbnMN
Cj4gPiArICAtIG1lbW9yeS1yZWdpb24NCj4gPiArICAtIGNsb2Nrcw0KPiA+ICsgIC0gY2xvY2st
bmFtZXMNCj4gDQo+IA0KPiBLZWVwIHRoZSBzYW1lIG9yZGVyIGFzIGluIHByb3BlcnRpZXM6Lg0K
PiANCg0Kb2ssIHRoYW5rcy4NCg0KQmVzdCByZWdhcmRzLA0KRGFycmVuDQoNCj4gDQo+IFJldmll
d2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5v
cmc+DQo+IA0KPiA8Zm9ybSBsZXR0ZXI+DQo+IFRoaXMgaXMgYW4gYXV0b21hdGVkIGluc3RydWN0
aW9uLCBqdXN0IGluIGNhc2UsIGJlY2F1c2UgbWFueSByZXZpZXcNCj4gdGFncw0KPiBhcmUgYmVp
bmcgaWdub3JlZC4gSWYgeW91IGtub3cgdGhlIHByb2Nlc3MsIHlvdSBjYW4gc2tpcCBpdCAocGxl
YXNlDQo+IGRvDQo+IG5vdCBmZWVsIG9mZmVuZGVkIGJ5IG1lIHBvc3RpbmcgaXQgaGVyZSAtIG5v
IGJhZCBpbnRlbnRpb25zDQo+IGludGVuZGVkKS4NCj4gSWYgeW91IGRvIG5vdCBrbm93IHRoZSBw
cm9jZXNzLCBoZXJlIGlzIGEgc2hvcnQgZXhwbGFuYXRpb246DQo+IA0KPiBQbGVhc2UgYWRkIEFj
a2VkLWJ5L1Jldmlld2VkLWJ5L1Rlc3RlZC1ieSB0YWdzIHdoZW4gcG9zdGluZyBuZXcNCj4gdmVy
c2lvbnMNCj4gb2YgcGF0Y2hzZXQsIHVuZGVyIG9yIGFib3ZlIHlvdXIgU2lnbmVkLW9mZi1ieSB0
YWcsIHVubGVzcyBwYXRjaA0KPiBjaGFuZ2VkDQo+IHNpZ25pZmljYW50bHkgKGUuZy4gbmV3IHBy
b3BlcnRpZXMgYWRkZWQgdG8gdGhlIERUIGJpbmRpbmdzKS4gVGFnIGlzDQo+ICJyZWNlaXZlZCIs
IHdoZW4gcHJvdmlkZWQgaW4gYSBtZXNzYWdlIHJlcGxpZWQgdG8geW91IG9uIHRoZSBtYWlsaW5n
DQo+IGxpc3QuIFRvb2xzIGxpa2UgYjQgY2FuIGhlbHAgaGVyZS4gSG93ZXZlciwgdGhlcmUncyBu
byBuZWVkIHRvIHJlcG9zdA0KPiBwYXRjaGVzICpvbmx5KiB0byBhZGQgdGhlIHRhZ3MuIFRoZSB1
cHN0cmVhbSBtYWludGFpbmVyIHdpbGwgZG8gdGhhdA0KPiBmb3INCj4gdGFncyByZWNlaXZlZCBv
biB0aGUgdmVyc2lvbiB0aGV5IGFwcGx5Lg0KPiANCj4gRnVsbCBjb250ZXh0IGFuZCBleHBsYW5h
dGlvbjoNCj4gDQpodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjYuMTItcmMzL3NvdXJjZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3Vi
bWl0dGluZy1wYXRjaGVzLnJzdCpMNTc3X187SXchIUNUUk5LQTl3TWcwQVJidyFpU1FsNl9XTVg4
UTZ3c0JqNHBWZTdUZG5iZDJ6cFB3U21ITVNtNGhsaGtEMGxPN2g1SlNBcjI4LWRVal9Ed0xyWGhV
X0lCenZrR3BXS2ckDQo+IDwvZm9ybSBsZXR0ZXI+DQo+IA0KPiANCj4gQmVzdCByZWdhcmRzLA0K
PiBLcnp5c3p0b2YNCg==

