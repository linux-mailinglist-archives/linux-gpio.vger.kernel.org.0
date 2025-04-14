Return-Path: <linux-gpio+bounces-18760-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 175EEA8786C
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 09:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5959E3AD913
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 07:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7329F1B4132;
	Mon, 14 Apr 2025 07:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qDu4C4Fq";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="PatWKH+D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6911A08A6;
	Mon, 14 Apr 2025 07:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744614511; cv=fail; b=Q6sIab1sW2YASfCF8VGKwtl+urnxFF6szD23s3g7FBbWuaSdIgSeyNV9ZFMd7s9yGy9ta1K7WCO4RHEGqio4YjwMvgtiMu8lHg4kKYqj1x4E8qJwd2No+zHGyNyT/HOnzQOBr3WMDp2eEsQ55N6IlNVyBAjb5T7B0h3o1NYtfTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744614511; c=relaxed/simple;
	bh=Je19i0pr41lAPSIPGj+PkUSizmUTZlgR/3YkAghbocU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s1UdEIyhal8ZyM6htDzEHn4XWG7RuGOn1HAW3f8r8NbyHDaGB+7lAbdrWEUUtX9kbAsIOTMdUtFM+huvIOn2czAoypO1U8n755ADoZg101FxQg4nnW6WUBhiJiJs6ZUSrIyJEYVO/bTzJPN4zINYoxXgbYvrI2Fi0N8E0DpfRBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=qDu4C4Fq; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=PatWKH+D; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 411d6ac818ff11f0aae1fd9735fae912-20250414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Je19i0pr41lAPSIPGj+PkUSizmUTZlgR/3YkAghbocU=;
	b=qDu4C4FqJlAMXKSTgvxM1oqA9QhNEAnKHa5VeS3R0h9/THO430e8pp9CTqavJmvlUdfcA8GpYMJE4ae0qkkKmu1wWZaEqMdk3u5P3MPKd+XTqGCL+UEJw2lAhWiG/vRcKiIiPxS/1Q2/TVg4sAzHlVd3zxJ0pQQDdr4EdrAt9sY=;
X-CID-CACHE: Type:Local,Time:202504141508+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:91a8fbb3-43c7-4e6c-ae85-7d0785de0875,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:3eb40ba6-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 411d6ac818ff11f0aae1fd9735fae912-20250414
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 611435624; Mon, 14 Apr 2025 15:08:23 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 14 Apr 2025 15:08:17 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 14 Apr 2025 15:08:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JTEHjOjKkP/4HnP45uyTCu6JOtXAlbPVXVlDE8wP+5om5cwJ5osxqxFUcqMDQh7qgjNBiaP27hbXyN+wIqS4vOK8nARfoqYQN7gDLoO3am1KE1/GGrvUho1uWiVl8fN43yNRNsqqrDqhA7RmujKw5iMw5ulY9NV9kbQJa8ZMc5g878ciVYpc4QD6eOrmk8cn684K8TVaCp9u1mhhQ3l4QWkfGlDFb+1XwYAzZaUT4JdrAyWM49JF6tk1UGkjEx5mlK9KAjPEczym5vYTvNhOhKfMQsZw+in6K87ByvJ9KWIFq2LBcQvEHYZZ4yHlTHkQAUW8ba7j+ujK4T3kKPLlxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Je19i0pr41lAPSIPGj+PkUSizmUTZlgR/3YkAghbocU=;
 b=B+rlVzybnQfU1AYdJtam5MbBvmqXpMLDBnyxbS1lhT8sXYxVlD8IRiwEy+sGdM+snejQqTljKKjecSId6AZOzNokZO/eJI9GjNk+pt24znSgcMIYQUJXGsxpBkjlhgMGaYxRqmrOqQ3TJrZPS6c7VkEa81c4tOVMmmSQM0ZX3xj6nEH1bXHgLQUx1+vTAyxol+Ux9+Bn9TikiURvl8YUpc3BjOYDP8RoqxZaHoH07NXTfCHrGfkML6/i8BFU2Vq2TvmTQP+X6Qchh/Qyga2CvYWahBRTANU/OsBOL7x1OEJGoOt3F/LqUTIoJGYPdt0zJFzYazCmtRdF0LZrEygj9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Je19i0pr41lAPSIPGj+PkUSizmUTZlgR/3YkAghbocU=;
 b=PatWKH+DgTomeMgHPWB5eW1QwtS25ylUQ4w9wBUELfKTXag/ltr0xJULy+sqTThKw7P78Lo6h7zAkp7LYE8lIhwY7BPiGcgsJfc4X1QDIaOjf2MAPRNN5gBFvQXN0u8p59Y+/2tqxKIxS5Fl55xOpMclr7LccWQNm8tYkV6jnbc=
Received: from SEYPR03MB7588.apcprd03.prod.outlook.com (2603:1096:101:146::10)
 by SEZPR03MB6666.apcprd03.prod.outlook.com (2603:1096:101:7d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Mon, 14 Apr
 2025 07:08:15 +0000
Received: from SEYPR03MB7588.apcprd03.prod.outlook.com
 ([fe80::f427:bd2f:f38d:17dd]) by SEYPR03MB7588.apcprd03.prod.outlook.com
 ([fe80::f427:bd2f:f38d:17dd%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 07:08:13 +0000
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
Subject: Re: [PATCH v2 11/11] ASoC: dt-bindings: mediatek,mt8196-mt6681: add
 mt8196-mt6681 document
Thread-Topic: [PATCH v2 11/11] ASoC: dt-bindings: mediatek,mt8196-mt6681: add
 mt8196-mt6681 document
Thread-Index: AQHbp7ZSsWzeuVpKoEKwWEyQWlI0hrOYLh+AgAqabAA=
Date: Mon, 14 Apr 2025 07:08:13 +0000
Message-ID: <b67a231529c2f8cf0053d8180df95da94ef6d6d2.camel@mediatek.com>
References: <20250407120708.26495-1-darren.ye@mediatek.com>
	 <20250407120708.26495-12-darren.ye@mediatek.com>
	 <6a9bd37e-ffec-4365-891a-64259c0cc115@kernel.org>
In-Reply-To: <6a9bd37e-ffec-4365-891a-64259c0cc115@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7588:EE_|SEZPR03MB6666:EE_
x-ms-office365-filtering-correlation-id: e46eccdc-9772-4d66-28d2-08dd7b231f2a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?Tzh4OHZ5Vkt2dGF4RmhGSlhETGlRTXBFNTMwa05Pekpqem8yS2x5VytrWG0y?=
 =?utf-8?B?Q1F5UDQwVzkvTC8zZWd6dE96TEVURlJwRXIyZTMwcmFPN3Zua2ZsVkJLaTk4?=
 =?utf-8?B?MTMza3FraHdiM1hyZFoxVlpQZDUxNEg2M1Nua3lxYnZFdnhKQkd3cnZ4VW8y?=
 =?utf-8?B?TGlraU1HZ01BeG5PcXQyZW1wZ0MwcW8zRzl5R2dyaXowNm4rbUx0UGxxSzlJ?=
 =?utf-8?B?T2lUeW9pK3hNVE1sMVFEQ3lmbjVuTEZHWE5qaExxMXk0cGlub012ZTdQV0E0?=
 =?utf-8?B?NFN4WXo4OEJoY2xxV2hQTU52L0Nsc0U5Rm54dmlDTzJMNWZHd2V2MnNzZ3Av?=
 =?utf-8?B?RTUzbEU4T3cxWVNXYmJsTGtIUlZDYmFTYmZJQTdWbi9XOW42Q3BiWnlBZkdW?=
 =?utf-8?B?VzBNQzFwSDVTMktlcTFiTTRDMk5zZE8xc1k3S3JIWGQ0VEwra3ZMQjcxdDdW?=
 =?utf-8?B?TEx4bGJqcVJkT1BXbkhJRFQwVFF2T3ZlejFkNWlhWDNtejkrOGtIdEZoYk1p?=
 =?utf-8?B?U1l4M3hnM05IdlBVSEcrL09sbXZaNCs5c01ZbTk0ZlA1ZGx3dG9aSmtVK0VV?=
 =?utf-8?B?ZElleUwwVS81Y2Z1VXlrNWJxdnZBV1lLUllrcWV4WHBCNEFET2FKOURUNkZM?=
 =?utf-8?B?cHg3bUZONXNxd0RZdzlEazBndTd6S3lMRDhwYi9pYWVtNy9naXJqbWsxVFlw?=
 =?utf-8?B?SUtJK0hvY1Uva3VJcWxpYkxoaHdGUTNBTmdudTZoZmkxSDhSRTArYnN5YWg0?=
 =?utf-8?B?aGZaMkI0V2ViRERMTitPM280NDZQM3FJM1N3elpoanl3Uit3OFl5R0ZVV05B?=
 =?utf-8?B?ZEovZk9lelRvVkk2VkdjK1VZM3FkdlFIdldCTjE3S0lUZEdmQXNmQWE1WThx?=
 =?utf-8?B?WmhaZmVRY0VyTW45QSsrdG44Uno4VWxycTdjdXBuV3NMZktLQzR0V21INTZY?=
 =?utf-8?B?VmZ2Mm56REVQczRxVElvdmVEZkR4NkdTYlV0UXFyWWdXUVZlUFRYOE1KalQy?=
 =?utf-8?B?dDUwQ2lJZnFkNk10Y29xdlpJbm9URmMxS1IxWk0xMEpURXF5SVlxTXpncG1z?=
 =?utf-8?B?bEFzOVNmUXh5RE9YL2kyUkN3TkV0UDQyOXliTUpYeVB3UFp4aWpLU3JObjdw?=
 =?utf-8?B?S1I0cVQxQWRHWEFoTWgyb0ZSODFRalhUaTZ3aEhpTEU2bGlWeVNUdUpLelIz?=
 =?utf-8?B?OWthYWtPN2xGSisvQXBraGlrOVRNVFVPbGE3c3hGcG1CbVB0Wi9WOHN6YU1h?=
 =?utf-8?B?SHVtTFNmTkFCY3dGMEtrVjZjYWcyRGtuSmVaM3lXdVJsWW5oLzRjTDN3L1lj?=
 =?utf-8?B?L0RXbTBYU3JrK3lUMmNaRVdjTUxXbVBObDlqbzNLZVcwWnVhMG5Qa1NEV0Fv?=
 =?utf-8?B?UCtnZ2ptZ1piR2hNYkF6YUJJUy9IcFRFLzJ2aTcwNVEwSkQzYWJveHJsYUV5?=
 =?utf-8?B?am9HcHY3OEdRNm1SN0V5dCtQY015MUI2OVROVXU1ZDRFK3VMTVVGazU1SVE3?=
 =?utf-8?B?VGN5SEZDL1RIaWU0RmJqY3hVMFZwSVRodDNlSmp5V0Nmcy80U2M3WXBZbkpR?=
 =?utf-8?B?OSs2bUYzeXZwNjE5eXljak1oMHJLTS9WS1RaeUVkTEs1ZmwzakQrVDl0dEtp?=
 =?utf-8?B?NCtndUovNURiNVd2Z254bXdkWTFpZGF1VTRTblVEZ0RNblBGY1VUbXZDeDFC?=
 =?utf-8?B?VjA0OUZLQ3RCUmpLUGU4QUdWVVBSRVM5WXBSTWdwdE1Wa0w1RkVkUWdnbG1Z?=
 =?utf-8?B?Nlp2eUhLaTdPWDVsYy84RzdaeWpRSStEaVRSZ1B5UjlLWU1qQzVreEZ6U3Np?=
 =?utf-8?B?dDJpOE5MV2drVDJ2NzZwd040elVIQVVFODBZTldOc3A0bDdEL3BGcEFKVzhB?=
 =?utf-8?B?bnI3YWJXSnJmcVRGeGEzOFU5ZlZ1anNRcmdvODA2ZkFkWk9Vb0xrUDdrcXRY?=
 =?utf-8?B?cUtGU1NKdHU5YUtsOHlEM0hxMnpJMHJYeFZDbENTSXg3OUszeDhIMk1Md1FI?=
 =?utf-8?Q?PVBRC/AIguOZ18flIwWQDHRiw9tTvc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7588.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmJVVHg1WDdrekRxcnlxektnS2Z1eW02V3prdzhUK21sUUFQOTh5eHNOYWFZ?=
 =?utf-8?B?U0hVVWlKTStlZ0dXZHNOMDJvWExRRThZQ2svWklSVWFITk15Y295c2FvQjZ5?=
 =?utf-8?B?N09hRFJIaU83TjlOdndzSlgrNVFuSWxJcEIvZ1VBbE9nQjZxQWdoREpjcjBm?=
 =?utf-8?B?TWNWRjNIVy9PamViY1hSeGIvenA0aWtTY2oxVTJPMmNvazlHS0ZNN1d3MkQw?=
 =?utf-8?B?YXpmeTQ2TzcvNFNRSlQvYkkrS1BVTk5GMVJSdndzYWF6S1ozQ0Y3akFId0xu?=
 =?utf-8?B?N25ocFl5SXAvMnNkOVNKRWpYSXNkT29HNTdPK0Q5ZTVsTHU0WGlyakZkMlp2?=
 =?utf-8?B?QnZURDZDTFBjbkVlNFFmZGtDR3ZlWU84ejVKS2pwcTdCZndMekpFUG1wVXox?=
 =?utf-8?B?R25hcDE1cERwa2dYVmZlNllncm1ZaDgxUG8xREcySW1vZ2dNRG5jaFFHL1Az?=
 =?utf-8?B?bHUvYVlZVzlsdTEvVDdITUl6Q09MNXd0VnMvaXJwd052ZytKS0JMVGYyRzFB?=
 =?utf-8?B?Y0h0TWtEVE1SMCtBMjFhcXZtVHRWRVRmdGNTbjFSZm9KMnBiK1RmTzFJWlph?=
 =?utf-8?B?ZklMdUp2VGEyM0ZpOWVZak05OXdnMVNqemJreEZWMGFZS3BpczlFVjNHMWx6?=
 =?utf-8?B?N2lyT0U5MUFha1M5VDE1bGM0MTlhRll0bDhPem1GZTZScGdxRG90S3hNdWF2?=
 =?utf-8?B?YTFGMU1ucWdQYUg0aWVzZEtjSkVNV0lXSEdETytPOFZmWXIxYTlNck43Z0Y2?=
 =?utf-8?B?Rm9ERVdBYngvNDNwQWFMYW5uYVVjazRXZmhITktnc0ZGZ2dybFBUbnJ4Y213?=
 =?utf-8?B?Zk8xZGw1ODdsMVJJVmVtSzlVMjVkK2xmdUJnZC9yenV6emVGMHZvWHFIcTV5?=
 =?utf-8?B?dXVETThiNisyOTExK0I3ZFp2cVUwRFY0Z3lxQjEvb1R4MkZGdnJtZGRYWkYr?=
 =?utf-8?B?blVNL3orWXRqdDdHTlZGM01EaFBFc0ZNN3RGK2Q2VHhyMDQ4L0FNNm5aMEpE?=
 =?utf-8?B?eUV0b1pNSklTVkpPVzRDOWFGLy9nWjd3R2FEaHVWZXlqMXdQamFUSUxKSWtV?=
 =?utf-8?B?NEZNVEpMVStwR3FpbXl6eGp6Y0ZVVEc1WDJ2VlFqL0JiLzFNNXp6N1BRN2Nh?=
 =?utf-8?B?Y21GSXVzc01VN1JDTk1JT2hRRXpkMUNhalhzWGdlZ1Zkd0pCc1NVUFRQUkQv?=
 =?utf-8?B?akRDUGFVZHpTcUNXWG1QVXhpVlcyLzVFTWwzMjY0UkU5VWlDa0FpTndpODhU?=
 =?utf-8?B?QjFwdWtxcFQ2UGRaelpmUk16ZTJGRkFNck5HSUc2T1FKQm1LRHVPMHYzUDhJ?=
 =?utf-8?B?ajZLWXU1TVFiQmRlcWxiMk9qMnI0aVlLNzZBSkt4UWtBNHdmUnE2SEdnTTFt?=
 =?utf-8?B?eGFyU3ZpS2NuS1NFbVM1TFkxaHVlTlBwV29pUm9PaEh4UEtTQ0NMS2tPTFIv?=
 =?utf-8?B?WitwVXFsdWRDcTlPbDJqOXl6dGw3UGpsNkVNSW9POFFqOHQxMHJmQjZ5ejFv?=
 =?utf-8?B?aUhjeCthMzYramFsWmRZbXRYN3phSk51bU1BV2JsOC9HSVhZVGhZWXpIQldi?=
 =?utf-8?B?eVdKWS9IMzRJY0RLZS90cktiVjV3Q09ycEFVcG5Vd0dMWms5citoSTZaZEpN?=
 =?utf-8?B?Q2c4SjlJNS9aSG54VmNxQUFTTTliaVExU21tanZBZnV2aloxa0ZDcmRHYXJn?=
 =?utf-8?B?VWF1bFdYSTdubjFwQ28rdlRwRjFLa1c5RU54QzYzeWpWM05wM0txdVJ4QUR6?=
 =?utf-8?B?R05MSVJkcGhOYVJHZ3hEKzhzTFhCb1ZBQkJERmdTSWo5cDBSOXZwajY5ZGQ4?=
 =?utf-8?B?eG1iaXFSQ09QZDFZOXlTNmdvOVNnMkFlYmJrbzNKeHhoNG05emhpQU9YRkt3?=
 =?utf-8?B?VkUxQ2RPaXViMkQ2SGZEa3A2VXFuNkEzS1d4d1lEMUZrRFBidmIzbHE0WS81?=
 =?utf-8?B?L2pCbmh0em1wVFpVVi9uUUhFdUxmeVpLOGFGUjhsWC9BWDhBU1NkU3NFREQz?=
 =?utf-8?B?VldVeCtjNFZ3Y00wNm9aZTlyOXFQN0NpUGttR1QvOGliQThIdmlteHNGVTcy?=
 =?utf-8?B?RDY2U1BTR0x3STVYb3ZhRWxMTDAzN3huUmo3SDF5Y1dLSGw3VmZiT1g5aThH?=
 =?utf-8?B?b3gxMmFsVWd0d0x2Zzc3dlpGaURjQTRBUmZqYmwrRndFdmQ2aGFLbkl5eTBP?=
 =?utf-8?B?TUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <952D326F87567640BB97A9D959A7F007@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7588.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e46eccdc-9772-4d66-28d2-08dd7b231f2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 07:08:13.3013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LPCE64XQQBoMjSud8080MOj6QHSb0qLNmoU2fzz/Re5Ko4Xil6TYru+d59XSsu6RrIWcONBXFgHsHbfKHK9taA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6666

T24gTW9uLCAyMDI1LTA0LTA3IGF0IDE1OjEyICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDA3LzA0LzIwMjUgMTQ6MDYsIERhcnJlbi5ZZSB3cm90
ZToNCj4gPiArDQo+ID4gK2FsbE9mOg0KPiA+ICsgIC0gJHJlZjogc291bmQtY2FyZC1jb21tb24u
eWFtbCMNCj4gPiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiAr
ICAgIG9uZU9mOg0KPiANCj4gRHJvcA0KDQpEcm9wIG9uZU9mID8NCj4gDQo+ID4gKyAgICAgIC0g
ZW51bToNCj4gPiArICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTk2LW10NjY4MS1zb3VuZA0KPiA+
ICsgICAgICAgICAgLSBtZWRpYXRlayxtdDgxOTYtbmF1ODgyNS1zb3VuZA0KPiA+ICsgICAgICAg
ICAgLSBtZWRpYXRlayxtdDgxOTYtcnQ1Njgycy1zb3VuZA0KPiA+ICsgICAgICAgICAgLSBtZWRp
YXRlayxtdDgxOTYtcnQ1NjUwLXNvdW5kDQo+ID4gKw0KPiA+ICsgIGF1ZGlvLXJvdXRpbmc6DQo+
ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAgICAgVmFsaWQgbmFtZXMgY291bGQgYmUgdGhl
IGlucHV0IG9yIG91dHB1dCB3aWRnZXRzIG9mIGF1ZGlvDQo+ID4gY29tcG9uZW50cywNCj4gPiAr
ICAgICAgcG93ZXIgc3VwcGxpZXMsIE1pY0JpYXMgb2YgY29kZWMgYW5kIHRoZSBzb2Z0d2FyZSBz
d2l0Y2guDQo+ID4gKw0KPiA+ICsgIG1lZGlhdGVrLHBsYXRmb3JtOg0KPiA+ICsgICAgJHJlZjog
L3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQ0KPiA+ICsgICAgZGVzY3Jp
cHRpb246IFRoZSBwaGFuZGxlIG9mIE1UODE4OCBBU29DIHBsYXRmb3JtLg0KPiA+ICsNCj4gPiAr
ICBtZWRpYXRlayxhZHNwOg0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVm
aW5pdGlvbnMvcGhhbmRsZQ0KPiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4gKyAgICAgIFRoZSBw
aGFuZGxlIG9mIHRoZSBNVDgxODggQURTUCBwbGF0Zm9ybSwgd2hpY2ggaXMgdGhlDQo+ID4gb3B0
aW9uYWwgQXVkaW8gRFNQDQo+ID4gKyAgICAgIGhhcmR3YXJlIHRoYXQgcHJvdmlkZXMgYWRkaXRp
b25hbCBhdWRpbyBmdW5jdGlvbmFsaXRpZXMgaWYNCj4gPiBwcmVzZW50Lg0KPiA+ICsgICAgICBU
aGUgQUZFIHdpbGwgbGluayB0byBBRFNQIHdoZW4gdGhlIHBoYW5kbGUgaXMgcHJvdmlkZWQuDQo+
ID4gKw0KPiA+ICtwYXR0ZXJuUHJvcGVydGllczoNCj4gPiArICAiXmRhaS1saW5rLVswLTldKyQi
Og0KPiA+ICsgICAgdHlwZTogb2JqZWN0DQo+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAg
ICAgQ29udGFpbmVyIGZvciBkYWktbGluayBsZXZlbCBwcm9wZXJ0aWVzIGFuZCBDT0RFQyBzdWIt
bm9kZXMuDQo+ID4gKw0KPiANCj4gRXZlcnl0aGluZyBsb29rcyBoZXJlIGV4YWN0bHkgdGhlIHNh
bWUgYXMgbXQ4MTg4LW10NjM1OSwgZXhjZXB0DQo+IGFjY2RldC4NCj4gQXJlIHlvdSBzdXJlLCBy
ZWFsbHksIHJlYWxseSBzdXJlIHRoZXNlIGFyZSBkaWZmZXJlbnQgYW5kIHlvdSBkbyBub3QNCj4g
aGF2ZSBhY2NkZXQ/DQp5ZXMsIGl0J3MgdGhlIHNhbWUgYXMgbXQ4MTg4LW10NjM1OSwgYnV0IG10
ODE5NiBwbGF0Zm9ybSBkb24ndCBzdXBwb3J0DQpwbWljIGNvZGVjLCBzbyBkbyBub3QgaGF2ZSBh
Y2NkZXQuDQoNCj4gDQo+ID4gKyAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICBsaW5rLW5hbWU6
DQo+ID4gKyAgICAgICAgZGVzY3JpcHRpb246DQo+ID4gKyAgICAgICAgICBUaGlzIHByb3BlcnR5
IGNvcnJlc3BvbmRzIHRvIHRoZSBuYW1lIG9mIHRoZSBCRSBkYWktbGluayANCj4gPiB0byB3aGlj
aA0KPiA+ICsgICAgICAgICAgd2UgYXJlIGdvaW5nIHRvIHVwZGF0ZSBwYXJhbWV0ZXJzIGluIHRo
aXMgbm9kZS4NCj4gPiArICAgICAgICBpdGVtczoNCj4gPiArICAgICAgICAgIGVudW06DQo+ID4g
KyAgICAgICAgICAgIC0gVERNX0RQVFhfQkUNCj4gPiArICAgICAgICAgICAgLSBJMlNPVVQ2X0JF
DQo+ID4gKyAgICAgICAgICAgIC0gSTJTSU42X0JFDQo+ID4gKyAgICAgICAgICAgIC0gSTJTT1VU
NF9CRQ0KPiA+ICsgICAgICAgICAgICAtIEkyU09VVDNfQkUNCj4gPiArDQo+ID4gKyAgICAgIGNv
ZGVjOg0KPiA+ICsgICAgICAgIGRlc2NyaXB0aW9uOiBIb2xkcyBzdWJub2RlIHdoaWNoIGluZGlj
YXRlcyBjb2RlYyBkYWkuDQo+ID4gKyAgICAgICAgdHlwZTogb2JqZWN0DQo+ID4gKyAgICAgICAg
YWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKyAgICAgICAgcHJvcGVydGllczoNCj4g
PiArICAgICAgICAgIHNvdW5kLWRhaToNCj4gPiArICAgICAgICAgICAgbWluSXRlbXM6IDENCj4g
PiArICAgICAgICAgICAgbWF4SXRlbXM6IDINCj4gPiArICAgICAgICByZXF1aXJlZDoNCj4gPiAr
ICAgICAgICAgIC0gc291bmQtZGFpDQo+ID4gKw0KPiA+ICsgICAgICBkYWktZm9ybWF0Og0KPiA+
ICsgICAgICAgIGRlc2NyaXB0aW9uOiBhdWRpbyBmb3JtYXQuDQo+ID4gKyAgICAgICAgaXRlbXM6
DQo+ID4gKyAgICAgICAgICBlbnVtOg0KPiA+ICsgICAgICAgICAgICAtIGkycw0KPiA+ICsgICAg
ICAgICAgICAtIHJpZ2h0X2oNCj4gPiArICAgICAgICAgICAgLSBsZWZ0X2oNCj4gPiArICAgICAg
ICAgICAgLSBkc3BfYQ0KPiA+ICsgICAgICAgICAgICAtIGRzcF9iDQo+ID4gKw0KPiA+ICsgICAg
ICBtZWRpYXRlayxjbGstcHJvdmlkZXI6DQo+ID4gKyAgICAgICAgJHJlZjogL3NjaGVtYXMvdHlw
ZXMueWFtbCMvZGVmaW5pdGlvbnMvc3RyaW5nDQo+ID4gKyAgICAgICAgZGVzY3JpcHRpb246IElu
ZGljYXRlcyBkYWktbGluayBjbG9jayBtYXN0ZXIuDQo+ID4gKyAgICAgICAgaXRlbXM6DQo+ID4g
KyAgICAgICAgICBlbnVtOg0KPiA+ICsgICAgICAgICAgICAtIGNwdQ0KPiA+ICsgICAgICAgICAg
ICAtIGNvZGVjDQo+ID4gKw0KPiA+ICsgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+
ID4gKw0KPiA+ICsgICAgcmVxdWlyZWQ6DQo+ID4gKyAgICAgIC0gbGluay1uYW1lDQo+ID4gKw0K
PiA+ICt1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtyZXF1aXJlZDoN
Cj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIG1lZGlhdGVrLHBsYXRmb3JtDQo+ID4gKw0K
PiA+ICtleGFtcGxlczoNCj4gPiArICAtIHwNCj4gPiArICAgIHNvdW5kIHsNCj4gPiArICAgICAg
ICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Ni1tdDY2ODEtc291bmQiOw0KPiA+ICsgICAg
ICAgIG1vZGVsID0gIm10ODE5Ni1tdDY2ODEiOw0KPiA+ICsgICAgICAgIG1lZGlhdGVrLHBsYXRm
b3JtID0gPCZhZmU+Ow0KPiANCj4gTWFrZSB0aGUgZXhhbXBsZSBjb21wbGV0ZS4NCm10ODE5NiBw
aW5jdHJsIGluIG10ODE5Ni1hZmUsIGRvZXMgaXQgaGF2ZSB0byBiZSBzZXQgaW4gdGhlIG1hY2hp
bmUNCmRyaXZlcj8NCj4gDQo+IA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==

