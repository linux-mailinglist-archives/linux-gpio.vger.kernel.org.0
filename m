Return-Path: <linux-gpio+bounces-16113-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5119EA37EE0
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 10:46:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7329316BA26
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 09:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDCA21638A;
	Mon, 17 Feb 2025 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="i+ZNzSwF";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="HFr0q1/x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E19118FC72;
	Mon, 17 Feb 2025 09:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739785531; cv=fail; b=AKECQXELFwxZQefvnQMCKmhntrv+IlSHhN7kML+9lr/Pwo3dSUSVmZ8eXO5qwpCyS6gJnQr8E4KHk7XK42gWBN7LHZtggT5PPhKO+jL9McopNY1uI8H57T5Y9glZB8IYNHJxvPznAioqOWKBlTckL1dc3wRASbH9EC10k9yKW5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739785531; c=relaxed/simple;
	bh=k5s6aPhz9bm4Z691ghZJXU03kjuSloqNGx89KKMDFrM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dB09IokLeCaiGsOCXcmTO78F4urSpAfOjmzh8cy5Kbz0wLLo+4CxnGPmah5L+oUS4SSV6vJzPEDX4Mza/VMk7oPfmPgG/ad1mejboa7VMCRHZ1x1QKPuH8HL7KDaEBZLCL8bwSpMUV95VmktypUi71Zb/fJWd9De5H9STdoxM9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=i+ZNzSwF; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=HFr0q1/x; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: e9821870ed1311efaae1fd9735fae912-20250217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=k5s6aPhz9bm4Z691ghZJXU03kjuSloqNGx89KKMDFrM=;
	b=i+ZNzSwFlMxqBZFkLnPOD18gAoLASEFDBxOUOuvIZ4mp+4FyMSeyGFkvJ7u88ZKjS3pKZjve9lZwWbdlKwiQoFNhvKDR/MmPWZQ9Ycz9Bc5rSyKiGQwRmWMAucbOUm68MqsAh13kBhtaZDUMCWjOvTe2qjtbbM/IqTTiGSXSLEU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:43df4443-8a8d-4f2d-849c-7e70a0f263ba,IP:0,U
	RL:0,TC:0,Content:6,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:6
X-CID-META: VersionHash:60aa074,CLOUDID:817de124-96bd-4ac5-8f2e-15aa1ef9defa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:4|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e9821870ed1311efaae1fd9735fae912-20250217
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1535899678; Mon, 17 Feb 2025 17:45:24 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 17 Feb 2025 17:45:23 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 17 Feb 2025 17:45:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HjtoBTB8UkVW2/GwL2Mlr2vU2XISeSSRPxxYOebSw8E+cTwpIeGuYhtdRFfKolRgsKlG5VGmsBC0pWn5LQ2y3gmc1uwUCWEZOgNvxxVjOOVePR559IaVwZfkcv4zFbLYbSBVn08/lyK+aPcK55XadEhoIpFM5/RkmVoUIWdC4J4WmvxBX2UU6GyxFE/P4kjRfavtCwdhr0p2s8dEQjxyfGodd5JwT9jUG1v+I8xBpGIpSJVDl1UanlyAec/9InTTQ4E9QVcwSYKg+FdV55Oi3Teor253mzgKojVIl8nYJ4O24xAORa3kl3sNivZMdrhLnk6dMnfQ0oYdOpiGve6WOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5s6aPhz9bm4Z691ghZJXU03kjuSloqNGx89KKMDFrM=;
 b=XXQLiJM7K+LPGkJbAwJcJ8RCSDnhJLRF98uD/AUszlvIMhWERZLV/rog66CdYA+gzHrsXCbmaEEYijij7tKpEJiS6SaII9340QT/dcHhQTSrQvtvKucKyRTd267DzfDD6uC6ZzUkl8/IMLq75DCHg77H2YVEdkxyVSAPm1ZjOm7zzRPpUj9kAf0uJUrXr7+ChSQop9o3tLlifhEva61yggg1RVasixL6Rb/h+vAlRcsFaVOHbaPrEU+8yExrH27OMLn27Zdw5zC3P4vyih8r435L0vvppFqrLdOz4O8phBmKdbh8xbBT3gdAgB+c/ubt++nQ2ACYSCG43uk3CVFlZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5s6aPhz9bm4Z691ghZJXU03kjuSloqNGx89KKMDFrM=;
 b=HFr0q1/xo7k7po5xrwKDlGiylVOTwEgRj94orEgzZIopPpqaS5aIZ6LFZIGaLZOQoZuZ9Z6UTeWFDRgzzi5IaPvuwTkTwKXL7m0iQ7qOdLkeRxF/r2wTfjgbfZOKfgBOw0iSYs+WPSloCeGVhIMBVJ5U+55bkzjwVL+qkQKAfZc=
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com (2603:1096:820:70::6)
 by SEYPR03MB7397.apcprd03.prod.outlook.com (2603:1096:101:13b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Mon, 17 Feb
 2025 09:45:20 +0000
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a]) by KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a%2]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 09:45:19 +0000
From: =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
To: "wenst@chromium.org" <wenst@chromium.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?= <Lei.Xue@mediatek.com>,
	"krzk@kernel.org" <krzk@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, =?utf-8?B?V2VuYmluIE1laSAo5qKF5paH5b2sKQ==?=
	<Wenbin.Mei@mediatek.com>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, =?utf-8?B?R3VvZG9uZyBMaXUgKOWImOWbveagiyk=?=
	<Guodong.Liu@mediatek.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "sean.wang@kernel.org"
	<sean.wang@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: mediatek: add support for
 mt8196
Thread-Topic: [PATCH v3 1/2] dt-bindings: pinctrl: mediatek: add support for
 mt8196
Thread-Index: AQHbZxfJWswQS8bGo0GLMRlAoA/hErMXl4qAgAEUwQCAAFYhAIAADccAgAAiDYCABjfigIAAORsAgAFkCoCAAAIQAIAqacaA
Date: Mon, 17 Feb 2025 09:45:19 +0000
Message-ID: <81368f21fabb9d6a6ee29bba0542e921b3636016.camel@mediatek.com>
References: <20250115063555.32492-1-ot_cathy.xu@mediatek.com>
	 <20250115063555.32492-2-ot_cathy.xu@mediatek.com>
	 <nmyxygrya6cpalmirsunvkx32uox3kjxd4l5ggdhjtj7edyizz@yodolm5ktboo>
	 <f7ba63c8afcef1d1925d51e35e4b81f0d0e773ff.camel@mediatek.com>
	 <d04bc250-2104-4e02-9bf8-5785f4444c8d@kernel.org>
	 <d11076d3eb2f92018fd3e26cae665a47f71ca838.camel@mediatek.com>
	 <b212d05d-de3b-41b2-bc48-c6b79ae54a8b@kernel.org>
	 <bec17d1e215a11daa1fdede78c8070c8e1763c72.camel@mediatek.com>
	 <e7d49bda-8aaa-4897-8117-ab889fb27be0@collabora.com>
	 <8ca2e369be804697ef71491dfd366cf6afcca9bd.camel@mediatek.com>
	 <CAGXv+5EYMM=hn8nKig3iHqD3KhxHVQyteweL-OiSoCV8mD2iew@mail.gmail.com>
In-Reply-To: <CAGXv+5EYMM=hn8nKig3iHqD3KhxHVQyteweL-OiSoCV8mD2iew@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5683:EE_|SEYPR03MB7397:EE_
x-ms-office365-filtering-correlation-id: 9486b57d-bfb5-498b-84fd-08dd4f37ca6f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aGhxbU44VTdCUjJUYWNKdE1TU25yVEJ1dzVCRVE1Wmd0bTN2djcrT2QweU10?=
 =?utf-8?B?bG12eEU5RUtTczd1eG5lL0dZNE5mMU1ndWNXZTNtOURrYjltanJBaDl5cVcy?=
 =?utf-8?B?Q2Y2U3FpWWs5dFVEZy9FWHRwWXJHUXJwYTZ4Nkg0d0dEc1NCMnFqTXJOQ3hO?=
 =?utf-8?B?OG9UWVV5dlA0VzNDSDRVWHpVUDMreFVycWxuZExqQmp2VTd4SFdEVkx6UUE1?=
 =?utf-8?B?dEZ5OStzdzQ1QmEyYlFZYlpSZ3RjT2VPdVl6bUdiZnVNMVRqaFRDM1NGckVD?=
 =?utf-8?B?eFBVdkY0UGZXdFAxL0FzblhjVm1pazNyMjN1ZDljNjQvUnQvVDFXa0FlVW5W?=
 =?utf-8?B?UCtSQUxsQjdBdld5VGNnZTEwcWVQQkZ2SXo0UWs3UENsVzdLSzV2bEhLNXR1?=
 =?utf-8?B?alVUMHJHOHhLZkNMaTZ2QzZ3Q0E2OUFvNEtNeThhWE9PU0N4ZklqRzRRQkR5?=
 =?utf-8?B?ZlhDWVprZDBQK0JoOVhVbFU0MXcxSXZBempNVmozVTZyU0REUEt1R01FZ2tQ?=
 =?utf-8?B?dVRPRUlObU81UlhmNGxUMkExVm9qWFgvR0FleHljazNqemp1WDBoUm9xRnpp?=
 =?utf-8?B?MmkyMk1Ibm1FN3dSbm1JY21KSEtVbnhHT1ZVeFVHTmg0cVM2Y0tzU3lRVit3?=
 =?utf-8?B?WDJxMmtsK3FWb05yOWpzNWUwYWx1ckZkN0dYVk5sdEl5VXowcHBHKzlSUzhS?=
 =?utf-8?B?YVo3QmNGVm5tOFR1OHhLSU1BSnNpYVZ2Q3M3RGp3aGhhbTg4TnRNNXp0MEJR?=
 =?utf-8?B?bkxRd2JDZUVoWVlkUkxFRk83cmJoMG5FMmNWOEttMm5lRGRwSXRLcUZBOEdo?=
 =?utf-8?B?SVF4QnJMeVJFdHVNbmFDeHBhZmgxbVdabFl3bWNkMnRTSVlIRGU3U29weTB1?=
 =?utf-8?B?blBnT3JYRG8wZ1NPR3Q5bTNLY215WTBPQ3pYUWpDek02UXVWblgrRlQvUjlC?=
 =?utf-8?B?TE9PeXZIMTNMVmk3SGJWeUVUcDRrVFpiczBRL2hwUUNQSzIxdXduU2tpdGl4?=
 =?utf-8?B?TFZvTTFucUpEeE85N2lIanB1c09vK3JOOXFydWltV0ZJL0VnaGNPU3I4dG16?=
 =?utf-8?B?bmx5OVFXSndnbUFrTml6V0c4Ym5RM3MrZmxiWTFJRUdUVUpZb1I5aWpKUlBZ?=
 =?utf-8?B?YjZUTFhSTGQ4V1RZNTAyeVZ6SDhaTDlUK3pUdnRsZHVraWY3L0l0d3lwbk03?=
 =?utf-8?B?SnNBZXhNYlFMY29nMEFQQ2NRK3JHM3R2U2dSZVdOZjlEYWNNYWJnTGprc0Nv?=
 =?utf-8?B?Qk5aS2tzc2cySXNLTVNkQTFkZFIyaFJYNDhaeVZGalB2a2l4bWV3OUtkYVp4?=
 =?utf-8?B?OFZMV05mK2VRdjY0S01pZWc5ZUtCSzkxZElDejQ3MWN2Vld0alhNeXFibG8v?=
 =?utf-8?B?N2Y3MHNOOFNlUTlDbUxPakk3RnR6YkkzbzYrUUhnaEk2Z1JvNkw3MGpTc3ZB?=
 =?utf-8?B?ZEtWSHFzS3FsR2J1U0xSYzIwTnJwaVNtN3dYMXBCVHc3cG5VUmdnSStNRURz?=
 =?utf-8?B?d04yUEM5K1BjalhtdXpHV2djblBvVDR0L3VQTlAxL0V1dXlOL0hoQzU0YWNG?=
 =?utf-8?B?elBtb2FwSzhEU1MzdFlIWTBnMnRVME5PcFNHWC9vUkJlcURGVXF5dTNUZHpi?=
 =?utf-8?B?YTI4VDdnR0l5eFJmNmhNWDg1ZE16TDJuQms1cElOVGRITTBaOUJFSEdNZHJG?=
 =?utf-8?B?dk14MzZ2ZkFJcGR5em54VmpBazNrRC9UTE5IbDY0d0VMV3NKSCtBQTFzQmhI?=
 =?utf-8?B?OHRuQ2o5UHhQeFdXckNCbXcycEV1SndaQkhEcm1QcWhDaEw4VjRya2kxMW5u?=
 =?utf-8?B?LzRNVk4wTjhnTERueEU0NkFaeXdVY3RMUTNLdzA2MWNITnVYendvMjVpSklH?=
 =?utf-8?B?ZU4xVnkvYUI0ZXVnVkduTEc0NS9IQy8xMEFMOFJHSk1DSXBYMkluZ3hlSEpq?=
 =?utf-8?Q?iw++OM8k9scLlrzlub5MbD7XCitgsDnn?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5683.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFVNemRiS0ZaMzBrMU91Y3lDZGVVSmlXYlZnU2hHTEJnc3VJUi9MdlUyQkRv?=
 =?utf-8?B?Y1p4S0lQZ3JSRm1mVS9mQ2lMb3hjYXJQZVIzSXdZV3lUWHB6SHZvMU9Bb29L?=
 =?utf-8?B?amhTL0hZK3BVR0VvR2twN3BkdUlVb0hoOGg3dklxQm1tbWR3VC9XYnB0WjJi?=
 =?utf-8?B?ZnMyZU0vbGVJd3F1bzI2czdXMG9BTVNzaW82UC9QWEdqSFg0UzhSZFZzZUMy?=
 =?utf-8?B?OWRRWUZEeHZ0TjIzVDB2K2UwV3VMWHFEd0hwQ3ZmdFNGOVRabHltRGJuUWxC?=
 =?utf-8?B?R2hQeTViMHYvbWNRVEJqUHIzQlVhVzlBNFdnb25BYzEzckRLbHoxZ0JEZy80?=
 =?utf-8?B?UWdzOUs0TEhDUUVWUHhLbitlS2xCRTBma3d4WHl6ZWpKckVwU1RoY1U5N2E0?=
 =?utf-8?B?b3dieXA2WFA5Mk1xbUNBcUlXRk1CZGhqZ2N4cDRzMWFITTBzQzlaZFpXMURS?=
 =?utf-8?B?NXB0Wi9oMmpPWFl1Z092ZTNtNHU3N3owMEdUYnRwbWh5MTZkaHFDdXljd3pZ?=
 =?utf-8?B?SUxjUEFkUjh2bk9DcllmdU4yVmM1VEtQUVg0eUUyYi92UGtZVERVVmdMcXRU?=
 =?utf-8?B?a2VvVTNqQTlnTjFOa0txaGJpWUJjSkJRUVloNFRaYml0dmd3eHVtZ25iUk1s?=
 =?utf-8?B?SGxsTDVKaFNaek9UbUIyT1hOakFJcUtoNFAwYktwNjNnUU5RSUhaRkRoODZq?=
 =?utf-8?B?WEs2WXdxVHp3MjZRZnhFNEdneXZQVUV0K2ZuTG96dDdwekkyK3AyT1ZIaGR3?=
 =?utf-8?B?ZDlDZ0ZrTnVNc1Qzb3M1cHdwdVcwYWJGZVJwZFR4aVJwVlNBV1o3dHZNOUFF?=
 =?utf-8?B?cVpuWnQrQk4wdkFPTHBBVG8yZm1RcFN4aEd1NXlERCt6S201MWtTTU5DaVky?=
 =?utf-8?B?N0s1RTY4TWl4LzVHK0VUK0Q1cnEyM1h4UWRrT0NNK3djajBMUktweEs2Y29u?=
 =?utf-8?B?UXhQR0lTRGZrblNRbmVENnJmNDU2Vnc3QUNkRWtIUzF3ZlVVZE9qUjVZYWwz?=
 =?utf-8?B?S3E0YUpxTTFtRXQvc2pqRXp6VG5PcmRsYjdIVExXSXFRVEdMZG5SK2xVZTgz?=
 =?utf-8?B?aDBHUnBlVVY0VFBuV1Q3aXFMeE5Zb1hmbEF4ZXdmcWV0VERaYy9jY0NxeXhz?=
 =?utf-8?B?NDVZQW4xcGtnbGk4VTUrYXhOb0UwRnI1OVZIbVplaW80UjMzUUpqUnBnbXFv?=
 =?utf-8?B?bVdPMkpTeVhYaU5lRXl0bjFFY3E4aE5nT05rQlpvYmk3endtK2FTd2Q4Mk5O?=
 =?utf-8?B?ZVJST1ZETTd0ekFrM1lpM01WRkY3ZW15dlFsWXR6M0dkbGNZdWVvMHEzTE9p?=
 =?utf-8?B?S3JJWHNFdkFkbm9NOWh1SmhZemhLMzZrT082VzdNNUthSmZZYUZwQ2ZBaUZF?=
 =?utf-8?B?K1NvTXJ3M1J5S1NQMDFZeGd5aTJOMWVTZUtwTnZpc3F4dVFia2xnMmYwOVZG?=
 =?utf-8?B?R28wNFpGQmJGOVI0blZiZ0FsZkVMZnFjNnA3ZmdLSnRFZ2RYaGl0TGViMXNY?=
 =?utf-8?B?WDZ1d25leWJJQ3QwdHl2RHhyYUNvczIzZjFuQXpjdHVYUW4rTGplRklDMzhH?=
 =?utf-8?B?UW41cHBnL0tLajFaMXluWXpHWHhnZXppT2RXQm9KeTZQTWpUa1phMDdMTFNQ?=
 =?utf-8?B?T1YrczhIZEdhZVRtdUlZQ3gzalp0QzVoZ2ZJZS80YjB0TTZmSEl3RGFoTFYw?=
 =?utf-8?B?bnhMN3A4QUZuRlR1RFBjMTREWEtPUmtnNzhtZFRBNGFsK3J5dldFaW00dVZY?=
 =?utf-8?B?cFE5OTRBRHVrbk5FdTBWUk5HdUtKcGtEQW1nVkt5WWR3MGhwcUZ5YXVSRll6?=
 =?utf-8?B?OExjZGpSN0k4Z2IrRVl3SEFIci9TMFNLQlFMSTNGc1UxLzVTUmlMSHJ4bWxO?=
 =?utf-8?B?MGFSRi9JVEN6YkdkaDhiMWZnRFMveGF5QlVHdGhzeDdJd093SDAwU1FtVjd2?=
 =?utf-8?B?cFZyMktZcCticHpxL1F0RWpCYzE1TWhPTUxjVVJkeGRuTjh3YkYxWjZxR2Vl?=
 =?utf-8?B?NkF0M0gyd2hsNzdjTDFhR3BEMzllNlJoQlhQSGM0VHpWVFgvc3dIMi9RTFFw?=
 =?utf-8?B?bVZnd1ZraFhpK2ZsRm9sSVJ6bHpLdDJEbkJMQy8xdE9OakErTHFZcVZWUVhI?=
 =?utf-8?B?QUM5OWJGT293M2h3eGIzQ3RhZk9HTWZ0cHVJRmE0MWtRNktMcXpOTndHeXUy?=
 =?utf-8?B?SHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <236CA0F5E5024F4EA86F1A4E6DAE4F6C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5683.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9486b57d-bfb5-498b-84fd-08dd4f37ca6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 09:45:19.3893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2UP2bG3eJ+zQWngAxceGh2YLSzNljmrHS+TP8qqiB9ZINKmM1Pi289iKobKWuP9ftIFCJu7xhzD5p2a0tFCFKNWvI75VTc7iXUhD7M+/5es=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7397

T24gVHVlLCAyMDI1LTAxLTIxIGF0IDE4OjAzICswODAwLCBDaGVuLVl1IFRzYWkgd3JvdGU6DQo+
IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFj
aG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRl
bnQuDQo+IA0KPiANCj4gT24gVHVlLCBKYW4gMjEsIDIwMjUgYXQgNTo1OOKAr1BNIENhdGh5IFh1
ICjorrjljY7lqbcpIDwNCj4gb3RfY2F0aHkueHVAbWVkaWF0ZWsuY29tPiB3cm90ZToNCj4gPiAN
Cj4gPiBPbiBNb24sIDIwMjUtMDEtMjAgYXQgMTM6NDIgKzAxMDAsIEFuZ2Vsb0dpb2FjY2hpbm8g
RGVsIFJlZ25vDQo+ID4gd3JvdGU6DQo+ID4gPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cw0KPiA+ID4gdW50aWwNCj4gPiA+IHlv
dSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ID4gPiANCj4gPiA+
IA0KPiA+ID4gSWwgMjAvMDEvMjUgMTA6MTcsIENhdGh5IFh1ICjorrjljY7lqbcpIGhhIHNjcml0
dG86DQo+ID4gPiA+IE9uIFRodSwgMjAyNS0wMS0xNiBhdCAxMToyMCArMDEwMCwgS3J6eXN6dG9m
IEtvemxvd3NraSB3cm90ZToNCj4gPiA+ID4gPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3Blbg0KPiA+ID4gPiA+IGF0dGFjaG1lbnRzDQo+ID4gPiA+ID4g
dW50aWwNCj4gPiA+ID4gPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IE9uIDE2LzAxLzIwMjUgMDk6
MTgsIENhdGh5IFh1ICjorrjljY7lqbcpIHdyb3RlOg0KPiA+ID4gPiA+ID4gT24gVGh1LCAyMDI1
LTAxLTE2IGF0IDA4OjI4ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpDQo+ID4gPiA+ID4gPiB3
cm90ZToNCj4gPiA+ID4gPiA+ID4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNr
IGxpbmtzIG9yIG9wZW4NCj4gPiA+ID4gPiA+ID4gYXR0YWNobWVudHMNCj4gPiA+ID4gPiA+ID4g
dW50aWwNCj4gPiA+ID4gPiA+ID4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUg
Y29udGVudC4NCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBP
biAxNi8wMS8yMDI1IDAzOjIwLCBDYXRoeSBYdSAo6K645Y2O5am3KSB3cm90ZToNCj4gPiA+ID4g
PiA+ID4gPiA+ID4gKyAgICAgICAgICBiaWFzLXB1bGwtZG93bjoNCj4gPiA+ID4gPiA+ID4gPiA+
ID4gKyAgICAgICAgICAgIG9uZU9mOg0KPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAg
ICAtIHR5cGU6IGJvb2xlYW4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgLSBl
bnVtOiBbMTAwLCAxMDEsIDEwMiwgMTAzXQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAg
ICAgICAgIGRlc2NyaXB0aW9uOiBtdDgxOTYgcHVsbCBkb3duDQo+ID4gPiA+ID4gPiA+ID4gPiA+
IFBVUEQvUjAvUjENCj4gPiA+ID4gPiA+ID4gPiA+ID4gdHlwZQ0KPiA+ID4gPiA+ID4gPiA+ID4g
PiBkZWZpbmUgdmFsdWUuDQo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgIC0gZW51
bTogWzIwMCwgMjAxLCAyMDIsIDIwMywgMjA0LA0KPiA+ID4gPiA+ID4gPiA+ID4gPiAyMDUsDQo+
ID4gPiA+ID4gPiA+ID4gPiA+IDIwNiwNCj4gPiA+ID4gPiA+ID4gPiA+ID4gMjA3XQ0KPiA+ID4g
PiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgIGRlc2NyaXB0aW9uOiBtdDgxOTYgcHVsbCBk
b3duIFJTRUwNCj4gPiA+ID4gPiA+ID4gPiA+ID4gdHlwZQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiBk
ZWZpbmUNCj4gPiA+ID4gPiA+ID4gPiA+ID4gdmFsdWUuDQo+ID4gPiA+ID4gPiA+ID4gPiANCj4g
PiA+ID4gPiA+ID4gPiA+IE5vdCBtdWNoIGltcHJvdmVkLg0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+
ID4gPiA+ID4gPiA+ICAgIEkgaGF2ZSByZW1vdmVkIHRoZSBjb250ZW50IHJlbGF0ZWQgdG8gJ3Jl
c2lzdGFuY2UNCj4gPiA+ID4gPiA+ID4gPiB2YWx1ZScsIHdlDQo+ID4gPiA+ID4gPiA+ID4gdXNl
DQo+ID4gPiA+ID4gPiA+ID4gJ1JTRUwnIGluc3RlYWQgb2YgJ3Jlc2lzdGFuY2UgdmFsdWUnLg0K
PiA+ID4gDQo+ID4gPiBUaGlzIGlzIHdyb25nLg0KPiA+IA0KPiA+ICAgU29ycnksIEkgdGhpbmsg
SSBtYXkgbm90IGhhdmUgZXhwcmVzc2VkIG15c2VsZiBjbGVhcmx5LiBXaGF0IEkNCj4gPiBtZWFu
dA0KPiA+IGlzIHRoYXQgdGhlIGF0dHJpYnV0ZSAnbWVkaWF0ZWsscnNlbC1yZXNpc3RhbmNlLWlu
LXNpLXVuaXQnIGlzIG5vdA0KPiA+IHN1cHBvcnRlZC4gSW4gdGhlIGR0cywgY2FuIHdyaXRlIHRo
ZSByZXNpc3RhbmNlIHZhbHVlLCBmb3IgZXhhbXBsZToNCj4gPiBiaWFzLXB1bGwtdXA9PDEwMDA+
LCBidXQgY2FuJ3QgdXNlICdtZWRpYXRlayxyc2VsLXJlc2lzdGFuY2UtaW4tc2ktDQo+ID4gdW5p
dA0KPiA+ID0gPHh4eD4nLg0KPiANCj4gYG1lZGlhdGVrLHJzZWwtcmVzaXN0YW5jZS1pbi1zaS11
bml0YCBpcyBzdXBwb3J0ZWQgaW4NCj4gZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwt
cGFyaXMuYw0KPiANCj4gQW5nZWxvIGlzIHJlcXVlc3RpbmcgdGhhdCB5b3UgY29udGludWUgdGhh
dCBzdXBwb3J0IGFuZCBtYWtlIGl0DQo+IGV4Y2x1c2l2ZSwgaS5lLiBub3Qgc3VwcG9ydCB0aGUg
UlNFTCBtYWNybyBtYWdpYyBudW1iZXJzLCBhbmQNCj4gX29ubHlfIHN1cHBvcnQgb2htIHZhbHVl
cywgaW4gdGhlIGRldmljZSB0cmVlLg0KPiANCj4gQ2hlbll1DQoNCiAgVGhhbmsgeW91IGZvciB5
b3VyIHJlc3BvbnNlLiBDYW4gSSB1bmRlcnN0YW5kIHRoYXQgaW4gbmV4dCB2ZXJzaW9uLCBJDQpz
aG91bGQgcmVtb3ZlIHRoZSBSU0VMIG1hY3JvIG1hZ2ljIG51bWJlcnMgYW5kIGFkZCBgbWVkaWF0
ZWsscnNlbC0NCnJlc2lzdGFuY2UtaW4tc2ktdW5pdGA/DQo+IA0KPiA+ID4gPiA+ID4gPiANCj4g
PiA+ID4gPiA+ID4gU28gdGhlIHZhbHVlIGluIE9obXMgd2FzIHJlbW92ZWQ/IEkgYXNzdW1lIGFi
b3ZlIGRvIG5vdA0KPiA+ID4gPiA+ID4gPiBoYXZlDQo+ID4gPiA+ID4gPiA+IGtub3duDQo+ID4g
PiA+ID4gPiA+IHZhbHVlDQo+ID4gPiA+ID4gPiA+IGluIE9obXM/DQo+ID4gPiA+ID4gPiANCj4g
PiA+ID4gPiA+ICAgIFllcywgdmFsdWUgaW4gT2hucyB3YXMgcmVtb3ZlZCwgbm8gY29kZSBoYXZl
IGtub3dtDQo+ID4gPiA+ID4gPiB2YWx1ZS4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBEb2VzIHRo
ZSBoYXJkd2FyZSBoYXZlIGtub3duIHZhbHVlIGluIE9obXM/DQo+ID4gPiANCj4gPiA+IEl0IGRv
ZXMuDQo+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+ICAgIFdoYXQgZG8geW91IG1lYW4gYnkgJ2hh
cmR3YXJlJz8gV2hlbiB3cml0aW5nIHRvIHRoZSByc2VsDQo+ID4gPiA+IHJlZ2lzdGVyLA0KPiA+
ID4gPiB0aGUgdmFsdWUgd3JpdHRlbiBpcyAwLTcuDQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiBI
YXJkd2FyZSBtZWFucyAidGhlIHBpbiBjb250cm9sbGVyIG9mIHRoZSBtdDgxOTYgU29DIiA6LSkN
Cj4gPiA+IA0KPiA+ID4gQW55d2F5Lg0KPiA+ID4gDQo+ID4gPiBUaGUgUlNFTCByZWdpc3RlcnMn
IGZ1bmN0aW9uIGlzIHRvIHNlbGVjdCBhIHNwZWNpZmljIHJlc2lzdGFuY2UNCj4gPiA+IHZhbHVl
DQo+ID4gPiB0bw0KPiA+ID4gcHVsbHVwL2Rvd24gYSBwaW4sIG9yIGEgZ3JvdXAgb2YgcGlucy4N
Cj4gPiA+IA0KPiA+ID4gRGV2aWNldHJlZSBiaW5kaW5ncyByZXF1aXJlIHRvIHNwZWNpZnkgdmFs
dWVzIGluIGtub3duIHVuaXRzLCBzbw0KPiA+ID4gaW4NCj4gPiA+IGRldmljZSB0cmVlDQo+ID4g
PiB5b3UgKm5lZWQqIHRvIHNwZWNpZnkgdGhlIFJTRUwgcmVzaXN0YW5jZSBpbiBPaG1zLg0KPiA+
ID4gDQo+ID4gPiBZb3UgY2Fubm90IHNwZWNpZnkgUlNFTCByZWdpc3RlciB2YWx1ZSBpbiBkZXZp
Y2UtdHJlZS4gVGhhdCdzDQo+ID4gPiB1bmFjY2VwdGFibGUuDQo+ID4gPiANCj4gPiA+IFJlZ2Fy
ZHMsDQo+ID4gPiBBbmdlbG8NCj4gPiANCj4gPiAgWWVzLCBJIHVuZGVyc3RhbmQgd2hhdCB5b3Ug
bWVhbi4gSG93ZXZlciwgSSB3YXMgcmVmZXJyaW5nIHRvDQo+ID4gd3JpdGluZw0KPiA+IHRoZSBy
c2VsIHJlZ2lzdGVyIGluIHRoZSBkcml2ZXIsIG5vdCBpbiBkdHMuDQo+ID4gDQo+ID4gPiANCj4g
PiA+ID4gPiANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiANCj4gPiA+
ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICBkZXNjcmlwdGlvbjogfA0KPiA+ID4gPiA+ID4g
PiA+ID4gPiArICAgICAgICAgICAgICBGb3IgcHVsbCBkb3duIHR5cGUgaXMgbm9ybWFsLCBpdA0K
PiA+ID4gPiA+ID4gPiA+ID4gPiBkb2Vzbid0DQo+ID4gPiA+ID4gPiA+ID4gPiA+IG5lZWQNCj4g
PiA+ID4gPiA+ID4gPiA+ID4gYWRkDQo+ID4gPiA+ID4gPiA+ID4gPiA+IFJTRUwgJiBSMVIwLg0K
PiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICBGb3IgcHVsbCBkb3duIHR5cGUgaXMg
UFVQRC9SMC9SMQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiB0eXBlLA0KPiA+ID4gPiA+ID4gPiA+ID4g
PiBpdA0KPiA+ID4gPiA+ID4gPiA+ID4gPiBjYW4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gYWRkDQo+
ID4gPiA+ID4gPiA+ID4gPiA+IFIxUjAgZGVmaW5lIHRvDQo+ID4gPiA+ID4gPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgIHNldCBkaWZmZXJlbnQgcmVzaXN0YW5jZS4gSXQgY2FuDQo+ID4gPiA+ID4g
PiA+ID4gPiA+IHN1cHBvcnQNCj4gPiA+ID4gPiA+ID4gPiA+ID4gIk1US19QVVBEX1NFVF9SMVIw
XzAwIiAmDQo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICJNVEtfUFVQRF9TRVRf
UjFSMF8wMSIgJg0KPiA+ID4gPiA+ID4gPiA+ID4gPiAiTVRLX1BVUERfU0VUX1IxUjBfMTAiDQo+
ID4gPiA+ID4gPiA+ID4gPiA+ICYNCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAg
Ik1US19QVVBEX1NFVF9SMVIwXzExIiBkZWZpbmUgaW4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gbXQ4
MTk2Lg0KPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICBGb3IgcHVsbCBkb3duIHR5
cGUgaXMgUEQvUlNFTCwgaXQNCj4gPiA+ID4gPiA+ID4gPiA+ID4gY2FuDQo+ID4gPiA+ID4gPiA+
ID4gPiA+IGFkZA0KPiA+ID4gPiA+ID4gPiA+ID4gPiBSU0VMDQo+ID4gPiA+ID4gPiA+ID4gPiA+
IGRlZmluZSB0byBzZXQNCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgZGlmZmVy
ZW50IHJlc2lzdGFuY2UuIEl0IGNhbiBzdXBwb3J0DQo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgICJNVEtfUFVMTF9TRVRfUlNFTF8wMDAiICYNCj4gPiA+ID4gPiA+ID4gPiA+ID4g
Ik1US19QVUxMX1NFVF9SU0VMXzAwMSIgJg0KPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAg
ICAgICAiTVRLX1BVTExfU0VUX1JTRUxfMDEwIiAmDQo+ID4gPiA+ID4gPiA+ID4gPiA+ICJNVEtf
UFVMTF9TRVRfUlNFTF8wMTEiICYNCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAg
Ik1US19QVUxMX1NFVF9SU0VMXzEwMCIgJg0KPiA+ID4gPiA+ID4gPiA+ID4gPiAiTVRLX1BVTExf
U0VUX1JTRUxfMTAxIiAmDQo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICJNVEtf
UFVMTF9TRVRfUlNFTF8xMTAiICYNCj4gPiA+ID4gPiA+ID4gPiA+ID4gIk1US19QVUxMX1NFVF9S
U0VMXzExMSINCj4gPiA+ID4gPiA+ID4gPiA+ID4gZGVmaW5lIGluDQo+ID4gPiA+ID4gPiA+ID4g
PiA+ICsgICAgICAgICAgICAgIG10ODE5Ni4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9tdDgxOTYtDQo+ID4gPiA+ID4gPiA+ID4g
PiA+IHBpbmZ1bmMuaA0KPiA+ID4gPiA+ID4gPiA+ID4gPiBiL2luY2x1ZGUvZHQtYmluZGluZ3Mv
cGluY3RybC9tdDgxOTYtcGluZnVuYy5oDQo+ID4gPiA+ID4gPiA+ID4gPiA+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0DQo+ID4gPiA+ID4gPiA+ID4gPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uYmYwYzgz
NzQ0MDdjDQo+ID4gPiA+ID4gPiA+ID4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ID4gPiA+ID4g
PiA+ID4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsL210ODE5Ni1waW5mdW5jLmgN
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gQEAgLTAsMCArMSwxNTcyIEBADQo+ID4gPiA+ID4gPiA+ID4g
PiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLQ0K
PiA+ID4gPiA+ID4gPiA+ID4gPiBDbGF1c2UNCj4gPiA+ID4gPiA+ID4gPiA+ID4gKi8NCj4gPiA+
ID4gPiA+ID4gPiA+ID4gKy8qDQo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgKiBDb3B5cmlnaHQgKEMp
IDIwMjUgTWVkaWF0ZWsgSW5jLg0KPiA+ID4gPiA+ID4gPiA+ID4gPiArICogQXV0aG9yOiBHdW9k
b25nIExpdSA8R3VvZG9uZy5MaXVAbWVkaWF0ZWsuY29tPg0KPiA+ID4gPiA+ID4gPiA+ID4gPiAr
ICovDQo+ID4gPiA+ID4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyNpZm5kZWYg
X19NVDgxOTZfUElORlVOQ19IDQo+ID4gPiA+ID4gPiA+ID4gPiA+ICsjZGVmaW5lIF9fTVQ4MTk2
X1BJTkZVTkNfSA0KPiA+ID4gPiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiA+ID4gPiA+ICsj
aW5jbHVkZSA8ZHQtYmluZGluZ3MvcGluY3RybC9tdDY1eHguaD4NCj4gPiA+ID4gPiA+ID4gPiA+
ID4gKw0KPiA+ID4gPiA+ID4gPiA+ID4gPiArI2RlZmluZSBQSU5NVVhfR1BJTzBfX0ZVTkNfR1BJ
TzAgKE1US19QSU5fTk8oMCkgfA0KPiA+ID4gPiA+ID4gPiA+ID4gPiAwKQ0KPiA+ID4gPiA+ID4g
PiA+ID4gPiArI2RlZmluZSBQSU5NVVhfR1BJTzBfX0ZVTkNfRE1JQzFfQ0xLDQo+ID4gPiA+ID4g
PiA+ID4gPiA+IChNVEtfUElOX05PKDApIHwNCj4gPiA+ID4gPiA+ID4gPiA+ID4gMSkNCj4gPiA+
ID4gPiA+ID4gPiA+ID4gKyNkZWZpbmUgUElOTVVYX0dQSU8wX19GVU5DX1NQSTNfQV9NTw0KPiA+
ID4gPiA+ID4gPiA+ID4gPiAoTVRLX1BJTl9OTygwKSB8DQo+ID4gPiA+ID4gPiA+ID4gPiA+IDMp
DQo+ID4gPiA+ID4gPiA+ID4gPiA+ICsjZGVmaW5lIFBJTk1VWF9HUElPMF9fRlVOQ19GTUkyU19C
X0xSQ0sNCj4gPiA+ID4gPiA+ID4gPiA+ID4gKE1US19QSU5fTk8oMCkNCj4gPiA+ID4gPiA+ID4g
PiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiA+IDQpDQo+
ID4gPiA+ID4gPiA+ID4gPiA+ICsjZGVmaW5lIFBJTk1VWF9HUElPMF9fRlVOQ19TQ1BfRE1JQzFf
Q0xLDQo+ID4gPiA+ID4gPiA+ID4gPiA+IChNVEtfUElOX05PKDApIHwNCj4gPiA+ID4gPiA+ID4g
PiA+ID4gNSkNCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyNkZWZpbmUgUElOTVVYX0dQSU8wX19GVU5D
X1RQX0dQSU8xNF9BTw0KPiA+ID4gPiA+ID4gPiA+ID4gPiAoTVRLX1BJTl9OTygwKQ0KPiA+ID4g
PiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+
ID4gNikNCj4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gSSBkbyBub3Qgc2Vl
IGhvdyB5b3UgcmVzb2x2ZWQgbXkgY29tbWVudCBmcm9tIHYxLiBJbg0KPiA+ID4gPiA+ID4gPiA+
ID4gdjIgSQ0KPiA+ID4gPiA+ID4gPiA+ID4gcmVtaW5kZWQNCj4gPiA+ID4gPiA+ID4gPiA+IGFi
b3V0DQo+ID4gPiA+ID4gPiA+ID4gPiBpdCwgc28geW91IHJlc3BvbmRlZCB0aGF0IHlvcHUgd2ls
bCBjaGFuZ2Ugc29tZXRoaW5nLA0KPiA+ID4gPiA+ID4gPiA+ID4gYnV0DQo+ID4gPiA+ID4gPiA+
ID4gPiBJDQo+ID4gPiA+ID4gPiA+ID4gPiBkbw0KPiA+ID4gPiA+ID4gPiA+ID4gbm90DQo+ID4g
PiA+ID4gPiA+ID4gPiBzZWUNCj4gPiA+ID4gPiA+ID4gPiA+IGFueSBjaGFuZ2VzLg0KPiA+ID4g
PiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiBTbyBleHBsYWluOiBob3cgZGlkIHlvdSBy
ZXNvbHZlIG15IGNvbW1lbnQ/DQo+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+
IFRoZXNlIHR3byBleGFtcGxlcyB3aGVyZSB5b3UgY2xhaW0geW91IHdpbGwgY2hhbmdlDQo+ID4g
PiA+ID4gPiA+ID4gPiBzb21ldGhpbmcsDQo+ID4gPiA+ID4gPiA+ID4gPiBidXQNCj4gPiA+ID4g
PiA+ID4gPiA+IHNlbmQNCj4gPiA+ID4gPiA+ID4gPiA+IHRoZSBzYW1lLiBJIHNraXBwZWQgdGhl
IHJlc3Qgb2YgdGhlIHBhdGNoLg0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ICAg
IFRoYW5rIHlvdSBmb3IgeW91ciBwYXRpZW50IHJlc3BvbnNlLCBoZXJlIGlzIG15DQo+ID4gPiA+
ID4gPiA+ID4gZXhwbGFuYXRpb24NCj4gPiA+ID4gPiA+ID4gPiBmb3INCj4gPiA+ID4gPiA+ID4g
PiB5b3UNCj4gPiA+ID4gPiA+ID4gPiBxdWVzdGlvbjoNCj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+
ID4gPiA+ID4gPiAgICBJbiB2MSwgSSB1bmRlcnRhbmQgdGhhdCB5b3UgbWVhbnQgSSBkaWRuJ3Qg
c2VudCBhDQo+ID4gPiA+ID4gPiA+ID4gcmVhbA0KPiA+ID4gPiA+ID4gPiA+IGJpbmRpbmcsDQo+
ID4gPiA+ID4gPiA+ID4gYW5kDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiANCj4gPiA+
ID4gPiA+ID4gVGhlIGNvbW1lbnQgaXMgdW5kZXIgc3BlY2lmaWMgbGluZXMsIHNvIEkgc2FpZCB0
aGVzZQ0KPiA+ID4gPiA+ID4gPiBkZWZpbmVzDQo+ID4gPiA+ID4gPiA+IGFyZQ0KPiA+ID4gPiA+
ID4gPiBub3QNCj4gPiA+ID4gPiA+ID4gYQ0KPiA+ID4gPiA+ID4gPiByZWFsIGJpbmRpbmcuIFlv
dSBzZW50IHRoZW0gYWdhaW4sIGJ1dCB0aGV5IGFyZSBzdGlsbCBub3QNCj4gPiA+ID4gPiA+ID4g
YmluZGluZ3MsDQo+ID4gPiA+ID4gPiA+IGJlY2F1c2UgdGhleSBhcmUgbm90IHVzZWQgaW4gdGhl
IGRyaXZlci4gTWF5YmUgdGhlIHVzYWdlDQo+ID4gPiA+ID4gPiA+IGlzDQo+ID4gPiA+ID4gPiA+
IGNvbnZvbHV0ZWQsDQo+ID4gPiA+ID4gPiA+IHNvIHdoaWNoIHBhcnQgb2YgaW1wbGVtZW50YXRp
b24gYXJlIHRoZXNlIGNvbm5lY3Rpbmcgd2l0aA0KPiA+ID4gPiA+ID4gPiBEVFM/DQo+ID4gPiA+
ID4gPiA+IElPVywNCj4gPiA+ID4gPiA+ID4gd2hpY2ggcGFydCBvZiBkcml2ZXIgcmVsaWVzIG9u
IHRoZSBiaW5kaW5nPw0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiAgICBJIGdvdCB5b3UuIFRo
aXMgYmluZGluZyBkZWZpbmUgbWFueSBtYWNyb3MsIHdoaWNoIHdpbGwNCj4gPiA+ID4gPiA+IGJl
DQo+ID4gPiA+ID4gPiB1c2VkDQo+ID4gPiA+ID4gPiBmb3INCj4gPiA+ID4gPiA+ICdwaW5tdXgn
IHNldHRpbmcgaW4gdGhlIERUUy4gVGhlIHVzYWdlIGxpa2UgdGhpczoNCj4gPiA+ID4gPiA+IA0K
PiA+ID4gPiA+ID4gICAgYWRzcF91YXJ0X3BpbnM6IGFkc3AtdWFydC1waW5zIHsNCj4gPiA+ID4g
PiA+ICAgICAgICAgICAgICAgICAgcGlucy10eC1yeCB7DQo+ID4gPiA+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGlubXV4ID0NCj4gPiA+ID4gPiA+IDxQSU5NVVhfR1BJTzM1X19GVU5D
X09fQURTUF9VVFhEMD4sDQo+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgPFBJTk1VWF9HUElPMzZfX0ZVTkNfSTFfQQ0KPiA+ID4gPiA+ID4gRFNQXw0KPiA+ID4g
PiA+ID4gVVJYRDANCj4gPiA+ID4gPiA+ID4gOw0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiAg
ICAgICAgICAgICAgICAgIH07DQo+ID4gPiA+ID4gPiAgICAgICAgICB9Ow0KPiA+ID4gPiA+IA0K
PiA+ID4gPiA+IA0KPiA+ID4gPiA+IFRoYXQncyBEVFMsIG5vdCBkcml2ZXIsIHNvIG5vdCBhIGJp
bmRpbmcuIERyb3AgdGhlIGhlYWRlcg0KPiA+ID4gPiA+IGZyb20NCj4gPiA+ID4gPiBiaW5kaW5n
cy4NCj4gPiA+ID4gDQo+ID4gPiA+ICAgIFNvcnJ5LCBJIGRvbid0IHF1aXRlIHVuZGVyc3RhbmQg
dGhlIHJlbGF0aW9uc2hpcCBiZXR3ZWVuDQo+ID4gPiA+IGJpbmRpbmcNCj4gPiA+ID4gYW5kDQo+
ID4gPiA+IGRyaXZlci4gRHJpdmVyIHdpbGwgcGFyc2UgdGhpcyBtYWNybyB0byBnZXQgZ3BpbyBu
dW1iZXIgYW5kDQo+ID4gPiA+IGZ1bmN0aW9uLg0KPiA+ID4gPiANCg==

