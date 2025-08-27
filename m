Return-Path: <linux-gpio+bounces-25008-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7C7B37795
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 04:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82C561B64C2A
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 02:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396DE24E4C3;
	Wed, 27 Aug 2025 02:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rkL0kuE1";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="tmPDQSff"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C58224DD17;
	Wed, 27 Aug 2025 02:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756260790; cv=fail; b=Zt8GePsamH9t1hEvzWdPOsWOFmW4t7E1CIpO5BYnhp1nICY8LuLa4HrE8PUt9CKUEsFy0Zj8e3H1wxMO7XiR0SHkSS8EbvSV6+fvUXRTpusIgE4rUPPeZhg+lctCADU3/VEYN2RhhEJTj4iMlmCqQTAL0jChN1o+ryWnoWrq7X8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756260790; c=relaxed/simple;
	bh=oOJKqOKPTJ1luFtDuc2hZBXfJQRdJDvCXromaLQc8JQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Fcljob+zvCnGYel4k+W/h7Sk/QG0WBYsf0zjKR7+H1ooGknwur97WjVm1vP94Dm3SNFg0pIi+pKgzoULhOlvrcAY5GpR6h5pyjdjra9ayZHKnn/d97QvqydE4OhwjHJCdGZo8wWBkMlLFaiB+/FycckuCesZ4NxQmNso5OoxiK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=rkL0kuE1; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=tmPDQSff; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 5cdd937c82eb11f0b2125946c7b33498-20250827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=oOJKqOKPTJ1luFtDuc2hZBXfJQRdJDvCXromaLQc8JQ=;
	b=rkL0kuE1+Kgd0IAKFifyKpqmHytivbcYGebYjQ0iot7tZr5F/F96YRMWYrv8OOQovIIrsvEHsiGgZYiNMSncu3c2D7ehMOJfWk3Ea9Z3O9QaTits6oJX5YKW1OhFKpdsCJHyzJYEz/gvjRsB12mwZo/HxG9TYnca0FWi/dcnnLY=;
X-CID-CACHE: Type:Local,Time:202508271008+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:718dcd9b-ff12-4d12-bf6a-c26a2d06a460,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:be1c8b20-786d-4870-a017-e7b4f3839b3f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5cdd937c82eb11f0b2125946c7b33498-20250827
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1188251609; Wed, 27 Aug 2025 10:13:03 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 27 Aug 2025 10:13:02 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 27 Aug 2025 10:13:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lev6TDGSHKVjyJPx0dPGW19IpnP6v0GxoPar8R003hcjPAPXzkfF4N+hmKdOi+keqR6aqFUqfMCMDg387ZLKAGqi/Wr8bugfpV/+k1+0wBeoRCEKZDrzp6yj8iTYe+eRMknpcfxhLXMk1cimcoDAMB1vjwoLYBNAMFy+VOmzfiPboDk4kgHdZX20eKzG/T9QPuYU+6Puramu/z8PftKzCIhbXYPdvRnH7xAFm+/fb1sYamiIvVRxialUK4Us42CQPPFou1S0PYzELP0rT4beTVSkfsYT3UugYG3hGgdY+vjRpDCse7B9zcwEOlS/uslvDWNyYsk33deHHxhwqqh+Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOJKqOKPTJ1luFtDuc2hZBXfJQRdJDvCXromaLQc8JQ=;
 b=kMhVEL4BDy1PTaGlLNB2OAtrIphP/iBQg82GWnPuQ/Om7ZHbw5zi/jAerPVqQQVK2FQ4BuOB+lQC4w/SP9AvKmO97Mlkyn8kEMD2gdxKHGlcPR4Ory6aigQd2XpM37C+BZbZptnDjE/bOsKudBEUUiIkL/dFWtocyT4fkAmuKCZVb+9YXoF3icZ3hNxG6FjW0syB3383X1OC4waGFzwRAbKkGzpvI/2Ey29/9lVkDSyF2Dq/gPOO4OtJ7+9LjCDSqBEi8eWO7GaOifAzYEaRXreqKDH+3X0Q6MBhq5CoDXzuQzCvzF/yBnWhCabTtZFGiuH4hQ3V+HEMyqhLHROT6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOJKqOKPTJ1luFtDuc2hZBXfJQRdJDvCXromaLQc8JQ=;
 b=tmPDQSff1AhvxEY+U0yq+B48fJay5queXheFKgSgV+hvwsNicLx1rr3VZxK/PZbq10k74lZ+VyQnYo5qmSmwQvPDFj3K18U23yq5Ckb0Dc2JHhWtUpM75p9+D5pB3+VQj3U/4Wmn9Xpi7XmPib80l1JQF3zLAwlIFxuOuY5nyiI=
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com (2603:1096:820:70::6)
 by TYZPR03MB8104.apcprd03.prod.outlook.com (2603:1096:400:464::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Wed, 27 Aug
 2025 02:12:58 +0000
Received: from KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a]) by KL1PR03MB5683.apcprd03.prod.outlook.com
 ([fe80::c413:8d96:8ae:370a%7]) with mapi id 15.20.9052.013; Wed, 27 Aug 2025
 02:12:57 +0000
From: =?utf-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"sean.wang@kernel.org" <sean.wang@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?= <Lei.Xue@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?V2VuYmluIE1laSAo5qKF5paH5b2sKQ==?= <Wenbin.Mei@mediatek.com>,
	=?utf-8?B?WW9uZyBNYW8gKOavm+WLhyk=?= <yong.mao@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, =?utf-8?B?QXhlIFlhbmcgKOadqOejiik=?=
	<Axe.Yang@mediatek.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: mediatek: mt8189: Add pinmux macro
 header file
Thread-Topic: [PATCH v2 2/3] arm64: dts: mediatek: mt8189: Add pinmux macro
 header file
Thread-Index: AQHb8kieMQL1hVirskiQC+R96+sQ3bQ3emSAgD6RPgA=
Date: Wed, 27 Aug 2025 02:12:57 +0000
Message-ID: <86543aedd6537e5b3068653761218944352a0461.camel@mediatek.com>
References: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
	 <20250711094513.17073-3-ot_cathy.xu@mediatek.com>
	 <987aeeef-6f3e-4ba3-b04f-a60e0cf201ac@collabora.com>
In-Reply-To: <987aeeef-6f3e-4ba3-b04f-a60e0cf201ac@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5683:EE_|TYZPR03MB8104:EE_
x-ms-office365-filtering-correlation-id: 2a3baf47-7a31-4455-b961-08dde50f3d4e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QWNvV3d0TS9Xb1pheTBuY1VRQ051Z0JSeXAzZCtaa1N0dDlnTkVHbi9leDJF?=
 =?utf-8?B?bElLYzFweWxZMkltMGNwUTYzalU4YzVqN0tBY0VqcmhZVDBvdUc2d3pFRlli?=
 =?utf-8?B?RE04NHhDWnloS2ppMUx4WmFhOEU3NjM4VGNYcDdIdjI5L1Q3cnI5SnVVbWht?=
 =?utf-8?B?NlVpbzl4OXhnenJVVFNoQlA5WHRBN0xMSytMZTEwelhOQS9GY0hpbFliZk01?=
 =?utf-8?B?RUFZYXBHaEU1RERSYXRlUVZsK0Y4RnBLenE2QUczVFNwS1U3QlFBSmV2VTFa?=
 =?utf-8?B?L1JCQnpyK2t0cWM2SzZ3NHZYYjhpOFZPNXBMMXlmZDA4Sm12Mzh0S3duQ2Iz?=
 =?utf-8?B?SGIwenlFWEx0MEFzVnhSaDhkdWgxV0FoVlhXc2YraEdiaGE0dExQdm0vZTFx?=
 =?utf-8?B?ZWhmMkVvbUJjTE1taStaSkRWaDBKWjk4U2xqdi9YUTdPOXZhV0loVU9QUC91?=
 =?utf-8?B?UU9PTUh2RnM2QUlGdzhQVzBTK3pwTHRnRC84YkNLQXFybmJESE9kb1lUakx3?=
 =?utf-8?B?VS9lYnVNS1NXeXoxN2NJL1RaempFKzJtYXZUMytaaGp6bFN5TjFZS2NRWVVE?=
 =?utf-8?B?TXdLUHFuWGpFOGh1Y09hZFptdkh5VFpxSXJ5Q3NMMjU3a0twMXN5MDlmclNQ?=
 =?utf-8?B?VWpuRE9PWGxBeVZ2R2ZSU2FWWFhvajd3bzFCanB0ODJLRlJCN2FvQzhMM0tr?=
 =?utf-8?B?Tm04K2l2SE5NLzNvY054OEdzeU4rdWNRSXJ3Mm55SEhmdkUrZEd1YXhNeEF0?=
 =?utf-8?B?QVlIbEJXNU1xSmJyeDJMMDdNaTZGVlJPU05KK2w0Umk0aUFFZExmRDJ5bzhI?=
 =?utf-8?B?WTFhQW9WRUxKdE80R2lXL3p6bVhhU3BSL1NYM2pDTmg4WTM3ZkJuczJWZ2hu?=
 =?utf-8?B?RDMyNU90RXY3VnJNWFlCajF6ejhiZ0JtbGlUaGlrU2czbk8vRVA5Umx0Vjlm?=
 =?utf-8?B?VHlPWUd5RTh3b1p4UVQ0dit2YmlwL1hiSVNTUGRQOUlpMDk3eThwU1c5ODNv?=
 =?utf-8?B?ejRZVDcyaDVnZzdaczU3allzc05MUUhWWFo4TnhWNk1jcFhaZXpEYTFKM01B?=
 =?utf-8?B?Y1REVFNFWWk2Ynk4VXRxWjlLbnY1c3ZiVllBaG5IR0FLK1hYa2dxTk9sVE1S?=
 =?utf-8?B?dXNCSkFNWFAzdUg5SzVzbElUUUlOaW5tUGJHR2RSNUhDV0w5dEJxOGJzQjRo?=
 =?utf-8?B?RGZ2NWkyVElHTmg4bEdlb0lmQW1nNExWd3k4Z2ZCdWk0eFJjT1VWbXR2NTl6?=
 =?utf-8?B?RGdCUG5QTHdRKzJLWXRKeU1qaGp2SzhwTWpxRXlaTVY1YWtJR3pKenVqN3dM?=
 =?utf-8?B?L1RsR2gvMTVzSlppRVRGWkdUY2JNWEF2UWNoYmczNEtPZ1JWVGYvWEU3TXV3?=
 =?utf-8?B?aUlid25wMHhUR0ZhNFpvZnV6NHcrL1gwMlFXekJBK3Ixb0R1TUpUUEhVNENU?=
 =?utf-8?B?YVZkZVAzbGM3ZC8zTE9jb1pNc2tzN2w4SVl2NkcxaUdrb2pYZ0hIS1VsTGlm?=
 =?utf-8?B?Z0UyWE5nS0ZRUGVYa1NhMXgrUFJLazQxZ3FrZ09KU1F6VndTRFRYVjkweVBO?=
 =?utf-8?B?d09jVDRZSXF4L0UvTkNpM21JY3FhQS9OYmFQM0hsaVF2cHcwYXB6OUhjcDEw?=
 =?utf-8?B?MnFIUXo2MGk0RU0vT2dHcjhYV3RpU25DV3o5cVhtSjhxU0RRNVFsc1BHK0h6?=
 =?utf-8?B?UmRZYkRXekJyL1VpQkMwYXhzZWJQTTdEY0dCY1RxSFlKOFo2bWhWTGtRanJV?=
 =?utf-8?B?dFRJTjF0SVh2anRUdjhFeU13SEY0STBZQkUyd0ZyS0k0WXN1MUxaUjM5S1VN?=
 =?utf-8?B?REc0TE5DTitXSVJoQmtaZ0VmR2xZa2ZuZHpTcmh5K0l6aUkxMXIzNEFKdTUr?=
 =?utf-8?B?Z3BMVWI1YnRlbjVtdFRySFUrQU5Wcy9aQ05Ka2RqaW5VQVlqdnZzTjdvRkpn?=
 =?utf-8?B?TEI1dzJWVm5JK1dLcHZLMGtCZ3oxeXVTVkFMWXUrSHdsbU1UVEhPTjM0M3pp?=
 =?utf-8?B?RlIxY0NiMGpRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5683.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTFneWVxekpWVnQ1eXJWekdEbk1COWQvTXQvQVcxY0FSeVlDdTZ4aDRyaVNi?=
 =?utf-8?B?eWZna0ZaaW1uaDlGL0loV2ExYTZYVS8vaEhsQWEzL2RoUkM1dnNqTmNOVjB4?=
 =?utf-8?B?MFovVUJCRjBYOHVtVXJjUm5HK3VmaG5CV2NOU09TbzV6MkpjaUhFaVl3ZXZu?=
 =?utf-8?B?YXYzL3lJMWdjMksrSkdiQXlVYU4zMTJ4L3o5cXZyRElkOVZ0TVYySVU2cTgx?=
 =?utf-8?B?Q2tTTjJGNStRSC9rUHl5M05lV29HbU5IeFU1ZlkxR3J0WDg2ZzRUU20vSzdR?=
 =?utf-8?B?Q0F2OEVENTlGeHRXejJVdy9jeDZnOGZSL2w0YTRtcWZzbHVvelNmZitLSzYy?=
 =?utf-8?B?MU93MzdQS2E5VTJlN09TQ3YvckxUNzlmazNHaWsvQW5XNUt3ZlF4M0RhdjFJ?=
 =?utf-8?B?YjEvLzF0eG41ZzRoNk9YSnVXRnVxMExiNUNiODZGRkthZlZNQlFpR0hPeXBG?=
 =?utf-8?B?NUlDc251V0c1dTZoT29iZEFXZnNNTGdjR3N4dFRleUtXbVhTWC9OQlVTeXVx?=
 =?utf-8?B?RzJLb0lmQ1ovQjV5aUdPazQvUTdLUFFFVTVSK0UzTjhXQTVZUDlwNVhBcFhB?=
 =?utf-8?B?YkVGQjMzcldLa3JraWJJdjFvbmM0UmlSci9wQnNJbzdNN3RCOVJTSkZiQlcx?=
 =?utf-8?B?WmdUbnlSU1FlekFkRG45MENrMUJRcnpJY2hIQTBDSUZBcCswNUpTZkF4VEZi?=
 =?utf-8?B?aFdBRlE5elg5bTlzQ3RPMnNNWlJRemZlV3E1Uk5hblNVdlJ3ZlZFSFFEdVJn?=
 =?utf-8?B?a0h2V3dOdjByVHc4MG5OYjliU3VMNUhjcjJxMlo4RS9jRzBRSEhlR1duUGJu?=
 =?utf-8?B?a2JhQStaQW51OFEyOTMxK3VLOC8rUXdObnZyWVJPcXB4N1lQUGFqNEtsMWtM?=
 =?utf-8?B?WjE0ZFQ4UDRyeDVubXI3TFQ0UFJrVnFDcVEzOWlaVE1WNHJMQUo2RXc3Z3la?=
 =?utf-8?B?WWRmV0hmOU1kcUlzMmNDR1c2Q05ZTWhBY1cyYjVXRGhvM0pHdnB4a3RLeHBh?=
 =?utf-8?B?bWNJTG1YNkMrWHh4Q0ZuczJSQVFDQ3VLQU5sUU5oM3N3ajZUbWtsdFpRRmtS?=
 =?utf-8?B?Rkk4cHFpbnBIS2taZzlKazIzZnBIcG43Q3lqdXpNdlpYWURKTWFmcHBkSnFs?=
 =?utf-8?B?bTAyRDJpUVVYRnRrYjBHcWU4UkYvWVpBOW01eDdXVnp5Q3VHUDBkRVRuYmRi?=
 =?utf-8?B?UllIRWphOWR5a0hmb01rYit0eDQ2b3RZRGFBTE44cDVTSmtWM0M1clRpYVM3?=
 =?utf-8?B?M0V3ZlQ1VkxzYjJJdEVhR2ZSWlZBeTBjc2tvczFUa0tNYitSOXFSNFJSVVhY?=
 =?utf-8?B?OUQva1FLV1NrbEwwYU5vMlNSQy90SE1MbVIwandmM2JhNE5ocFk3RUJnN2JJ?=
 =?utf-8?B?NWV4ZTk5YWlsVEtxdWYrN01RNFB3ZDdiY2ZjVlZkN1NtOWdZdWt0WU5QVnY3?=
 =?utf-8?B?ZHVja2hLVkR6TnFGNmp5OTNmYzdBQUJUSXVTUDBKZzZiUEp1Q3pMZVcxRE5U?=
 =?utf-8?B?MFIwTmd6TGU5dzQ5WXlDVEt0N1diNmYzazd6cThUdkUySndGdVoyT0Yxczdk?=
 =?utf-8?B?R0xlUlM1TFNFMitGV3drVkFqUDZHRHk0RnpYOXFuQ0h5R3hFekdwUlM3T1ZL?=
 =?utf-8?B?bmRoVVp1ZFVWT3lsM2xrS3phMm10dE5JRzVVRVZFcDk4RFo2ZGh2SmQzcXVO?=
 =?utf-8?B?WlZrTUx1ekp5U1hqM0h2Vm5OL3kxcWdLcnk2c2J3TW1KYll6VzE2eXoxNGZT?=
 =?utf-8?B?RWJTRStxL0FsQVlUb0hMT0VaV1FVVWt3Y2dBaWw0aE83VE56SjJrY0VCRk1i?=
 =?utf-8?B?bW9OallNZG1GcFpwOEFpTEVaZi90NmRRUjZFM0ZINEhjSkFXb0ZrUFF4Vjhw?=
 =?utf-8?B?TjZHb3FDNTVRM3B5MWlxc0xKQzdWZ1JnWmJralNHOHpYdjJFTWZrNGtiOGo3?=
 =?utf-8?B?Sm5HN3U2cWxGVmY4aEdVYUt6WjZYV1lGWGJzd2Q3Qi9qUGdBWlUrbkp6K3ln?=
 =?utf-8?B?MVV5T1hZQzBleGcvU1R4UUJxYTd4MlNSdjhjanFvQlhmOEZMV1lPQ0hHR2Js?=
 =?utf-8?B?clErck80czdRcWErM0xwT2c2SmJGMVpyU1RkYW11NnJydnQxYU9ZVVU2cUF1?=
 =?utf-8?B?S3VIT1g5bW9uWXZwUE04bUhwZGlzMTREYkhjN2J5alNsTklVSWkyTkkxdGto?=
 =?utf-8?B?eEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <08609C42E333F444B12E0BC9EF183D05@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5683.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3baf47-7a31-4455-b961-08dde50f3d4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 02:12:57.1811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ChLRb0CsF9RA9ZM2KcFN/DZ/h1mQgE9WjoYZ7fSTp5629ss2nGFKAkRpT37oZclWnM18ee5aaKw2TGnr+AHVZZq7q9xOh8L9Gz71V73s9ps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8104

T24gRnJpLCAyMDI1LTA3LTE4IGF0IDA4OjQ0ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAxMS8wNy8yNSAxMTo0NCwgQ2F0aHkgWHUg
aGEgc2NyaXR0bzoNCj4gPiBBZGQgdGhlIHBpbmN0cmwgaGVhZGVyIGZpbGUgb24gTWVkaWFUZWsg
bXQ4MTg5Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IENhdGh5IFh1IDxvdF9jYXRoeS54dUBt
ZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVr
L210ODE4OS1waW5mdW5jLmggfCAxMTI1DQo+ID4gKysrKysrKysrKysrKysrKysNCj4gPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAxMTI1IGluc2VydGlvbnMoKykNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4OS1waW5mdW5jLmgNCj4gPiANCj4g
PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODktcGluZnVu
Yy5oDQo+ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4OS1waW5mdW5jLmgN
Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZjljMjcw
ZWJhYjg5DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
bWVkaWF0ZWsvbXQ4MTg5LXBpbmZ1bmMuaA0KPiA+IEBAIC0wLDAgKzEsMTEyNSBAQA0KPiA+ICsv
KiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLw0KPiA+ICsvKg0KPiA+ICsgKiBD
b3B5cmlnaHQgKEMpIDIwMjUgTWVkaWFUZWsgSW5jLg0KPiA+ICsgKiBBdXRob3I6IExlaSBYdWUg
PGxlaS54dWVAbWVkaWF0ZWsuY29tPg0KPiA+ICsgKiAgICAgICAgIENhdGh5IFh1IDxvdF9jYXRo
eS54dUBtZWRpYXRlay5jb20+DQo+ID4gKyAqLw0KPiA+ICsNCj4gPiArI2lmbmRlZiBfX01UODE4
OV9QSU5GVU5DX0gNCj4gPiArI2RlZmluZSBfX01UODE4OV9QSU5GVU5DX0gNCj4gPiArDQo+ID4g
KyNpbmNsdWRlICJtdDY1eHguaCINCj4gPiArDQo+IA0KPiAuLnNuaXAuLg0KPiANCj4gPiArI2Rl
ZmluZSBQSU5NVVhfR1BJTzI3X19GVU5DX0dQSU8yNyAoTVRLX1BJTl9OTygyNykgfCAwKQ0KPiA+
ICsjZGVmaW5lIFBJTk1VWF9HUElPMjdfX0ZVTkNfRFBfVFhfSFBEIChNVEtfUElOX05PKDI3KSB8
IDEpDQo+IA0KPiANCj4gPiArI2RlZmluZSBQSU5NVVhfR1BJTzI3X19GVU5DX21iaXN0cmVhZGVu
X3RyaWdnZXIgKE1US19QSU5fTk8oMjcpIHwNCj4gPiAyKQ0KPiANCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eDQo+IFBsZWFzZSBmaXg6IHRoaXMg
aGFzIHRvIGJlIHVwcGVyY2FzZSBhcyBtdWNoIGFzIHRoZSBvdGhlcg0KPiBkZWZpbml0aW9ucy4N
Cg0KICBUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3LiBJdCB3aWxsIGJlIGZpeGVkIGluIG5leHQg
dmVyc2lvbi4NCg0KPiANCj4gDQo+ID4gKyNkZWZpbmUgUElOTVVYX0dQSU8yN19fRlVOQ19NRDMy
XzBfR1BJTzAgKE1US19QSU5fTk8oMjcpIHwgMykNCj4gPiArI2RlZmluZSBQSU5NVVhfR1BJTzI3
X19GVU5DX1RQX1VDVFMxX1ZDT1JFIChNVEtfUElOX05PKDI3KSB8IDQpDQo+ID4gKyNkZWZpbmUg
UElOTVVYX0dQSU8yN19fRlVOQ19DTVZSRUY0IChNVEtfUElOX05PKDI3KSB8IDUpDQo+ID4gKyNk
ZWZpbmUgUElOTVVYX0dQSU8yN19fRlVOQ19FWFRJRjBfQUNUIChNVEtfUElOX05PKDI3KSB8IDYp
DQo+ID4gKyNkZWZpbmUgUElOTVVYX0dQSU8yN19fRlVOQ19BTlRfU0VMMCAoTVRLX1BJTl9OTygy
NykgfCA3KQ0KPiA+ICsNCj4gPiArI2RlZmluZSBQSU5NVVhfR1BJTzI4X19GVU5DX0dQSU8yOCAo
TVRLX1BJTl9OTygyOCkgfCAwKQ0KPiA+ICsjZGVmaW5lIFBJTk1VWF9HUElPMjhfX0ZVTkNfRURQ
X1RYX0hQRCAoTVRLX1BJTl9OTygyOCkgfCAxKQ0KPiA+ICsjZGVmaW5lIFBJTk1VWF9HUElPMjhf
X0ZVTkNfbWJpc3R3cml0ZWVuX3RyaWdnZXIgKE1US19QSU5fTk8oMjgpIHwNCj4gPiAyKQ0KPiAN
Cj4gc2FtZSBoZXJlDQoNCiAgSXQgd2lsbCBiZSBmaXhlZCBpbiBuZXh0IHZlcnNpb24uDQoNCj4g
DQo+ID4gKyNkZWZpbmUgUElOTVVYX0dQSU8yOF9fRlVOQ19NRDMyXzFfR1BJTzAgKE1US19QSU5f
Tk8oMjgpIHwgMykNCj4gPiArI2RlZmluZSBQSU5NVVhfR1BJTzI4X19GVU5DX1RQX1VSVFMxX1ZD
T1JFIChNVEtfUElOX05PKDI4KSB8IDQpDQo+ID4gKyNkZWZpbmUgUElOTVVYX0dQSU8yOF9fRlVO
Q19FWFRJRjBfUFJJIChNVEtfUElOX05PKDI4KSB8IDYpDQo+ID4gKyNkZWZpbmUgUElOTVVYX0dQ
SU8yOF9fRlVOQ19BTlRfU0VMMSAoTVRLX1BJTl9OTygyOCkgfCA3KQ0KPiA+ICsNCj4gDQo+IENo
ZWVycywNCj4gQW5nZWxvDQo=

