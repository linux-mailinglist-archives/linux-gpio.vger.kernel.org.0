Return-Path: <linux-gpio+bounces-6127-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B7C8BC864
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 09:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D04BD1F222CC
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 07:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F36284FB3;
	Mon,  6 May 2024 07:31:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2115.outbound.protection.partner.outlook.cn [139.219.146.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAC41EB36;
	Mon,  6 May 2024 07:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714980693; cv=fail; b=MY3mJi0uQFW0Zt2yxClPKC1hWJih5/miejr+QzQK76M9b+0uPW+PqMYuXgVED80pIS0bSy87eQI7V40VN31LzqKnqa9hdmfGXUcbDJPqW3sOIf9URR3d0SB5D8hpSD0rYZpaRtk9SiilbyndUhgaEWAk6GncGw383Hd5DaDnG6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714980693; c=relaxed/simple;
	bh=tVWSRkZ+/yX9uiL+U18w17yddrKj2z7livTR8RpBS/Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mFC6X5KygOV35FIDWT+qDx96Sq97rCFqeOIhtKETWjik9OL/p8smAvs0IrM/urXKZt+UtJlIMZdPEmRhmuZNX1TrUT0i339hhx0Rer9+bo95RDBeEXFz54ZkagLVwiZ2RDCIN25kT3yOhatiLyMOTF0bwZ4moqKsD4LeyiWLpC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3MoqxTs3co+bRwIAzoK4u6KWoXT6FmALQvX1bE8nSLH6m9lCmcaxF4VEHgXYGbxBkXt+c4de2HClHHlzgSohaHrNto0yA4L2mRt/l9yHBqRLSkudMzs2oRpqc/xmcr1YeU4fzLeEYcJz3XRCzZxuU299wgT+p7+H4Os3FsQWuqseuP20w6a5NgT6RfmdCFWU4digllTdPlH/8/hrLKOuAYa1jC9+NVO7uvsDIEutnxKt6N3Oy9fcIJln7TAbxc1bTDWZ4fRLH/xSomePy2hacxSFgUbQfvjigbTzpg/dMZXEO95DuQIIYIv5afQXF52w+tGHcD294x/4Muj+VUNAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVWSRkZ+/yX9uiL+U18w17yddrKj2z7livTR8RpBS/Q=;
 b=AtWe+Gc+jfhyTuuV9XWgq9fg0oe9bwiFMBjPcxS5rQ2RYGRl0r0AqHZVfbpOjkDXrArcB+/pPn8XCHIKkeGvDVB0Vuwmg134ZixAi+K0bXBii56OOgzA3YqSHjE5D5aD6aUj50qaogZl00H9GlLb48MvbqnVClx+CK/aArQFYGW5QX6LJVICQO4SU2ge8UvoH/iSvwqYLXKVlxyhSMjsn0YswBxSzIILVUuh/1uvp+dbxkgLG3Nnw6ucG4pnQZuKn7VfUOx4m+SdtJYIalSmYuv2DJYHqeeQnwkSYo77kF5boxDQfHnvK+rLhDV/uy+H+RY9g+5wkquTHPcxvd7YsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:f::12) by ZQZPR01MB0994.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:8::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.29; Mon, 6 May
 2024 07:31:19 +0000
Received: from ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn
 ([fe80::7020:a48c:b2bd:fe36]) by
 ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn ([fe80::7020:a48c:b2bd:fe36%4])
 with mapi id 15.20.7472.027; Mon, 6 May 2024 07:31:19 +0000
From: Leyfoon Tan <leyfoon.tan@starfivetech.com>
To: Linus Walleij <linus.walleij@linaro.org>, Yuklin Soo
	<yuklin.soo@starfivetech.com>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Hal Feng
	<hal.feng@starfivetech.com>, Emil Renner Berthing <kernel@esmil.dk>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Drew
 Fustini <drew@beagleboard.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: RE: [RFC PATCH v3 0/7] Add Pinctrl driver for Starfive JH8100 SoC
Thread-Topic: [RFC PATCH v3 0/7] Add Pinctrl driver for Starfive JH8100 SoC
Thread-Index: AQHanUsb4QsJhnfcq0uFD901Ke0na7GJxHuAgAAN7NA=
Date: Mon, 6 May 2024 07:31:19 +0000
Message-ID:
 <ZQZPR01MB0979DEF368CB86BB16B538E78A1CA@ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn>
References: <20240503111436.113089-1-yuklin.soo@starfivetech.com>
 <CACRpkdbxzbNedWTpA5i-45AqPc4fA+GeBGkrjrD_OgkxMZRwXw@mail.gmail.com>
In-Reply-To:
 <CACRpkdbxzbNedWTpA5i-45AqPc4fA+GeBGkrjrD_OgkxMZRwXw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQZPR01MB0979:EE_|ZQZPR01MB0994:EE_
x-ms-office365-filtering-correlation-id: 9bebe566-7681-40c4-1177-08dc6d9e85b6
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 r7cIXptijQZBsQB2AblDmovr8wAHPsVwJ7DpBtMu3QVp/+/o00Ypx00C1/pEtBePIi9x0CFYRzUfLlqn8APk2IrgD+EEEC2ipAGFtnEcRIUiuBHVt6dhCZivMtH4JB7CmA8F67VMTAELBzzuJJi3Gz5cWlx24TVy1yYdSmgfhJBrS9l+7UvsrZhN6YtciFLHQmadY4b31KrmwlzpkN6AqL2Jl5UN1McSDJtUMT9NJO2W8qfmuf09nxYgH5sIaFvzJJV/vpYs2VXLo3I0Q+dOyHP1C/0z153oAdV3wandshrmPAFJnXMOmzVv56ceeTFaKhF/Uew1zqRy9nx6MQXqcIFBDoYGi0ublfhlkJHhpxsb9awGsWv7KR0c4TLN/5V8dcLnahYanPdsQ5haShUO5PTIcfkm0eDYTVnIaAELLs69ywc3gGRun/snRdW874SlZ8k6IDd7EpdMj3+xD3c+2L7/W+QyLy9fFaT4aCJRdtHyh4t8UQ/rTEuL7BGqDWmQszk9D79jfDNHGCx8RBF8joKk2GMBpykH51sGNrJRQA1LzHbZOtB/RLZFKbtEiUI8IjxtBhJGmVV2/XVxYuONdGhEk132DsQouwIr+r9S3XXCMBzh4HKAg9kwpezj8a5y
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(41320700004)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QXNtMnQrTUx5SVZiNkEvN3lXVExHTmM1OVN1amZwa2YwSFJ0VU1WYmxyeXQv?=
 =?utf-8?B?RFVFVmRITk4vbEpVL3M0RzFMQ0pCM2E3Wk1HLzFMQ0F0UGE2YTZ0RUpoNkRU?=
 =?utf-8?B?YUR6K2daV0xOQUdDVUt5cEFVY0NBOThJaUNTNkdpQ05RZVJmdXA1SWZWRGtL?=
 =?utf-8?B?S3I0cWY4ZTVpbmluY2pTNnQvL3pEcUwrWWlwRThhdzUvWm9CSWxIWnZzWWFx?=
 =?utf-8?B?NXV4V0ozTE54K0EyOWQvZFFHM0hQV2kwZXZFVkJCTWJveHdFRGUxdmsyd0dK?=
 =?utf-8?B?NG1BemlRY1BDT095RFJTVnRZblN1UU9ndmR2L25qWVFud25OekhjZ2RmMDdN?=
 =?utf-8?B?M3NlYkkydFk2cmphUVFPQ2lxSlpFUU1zWThSMEh5SERZNHRNUWZuREp1TmlI?=
 =?utf-8?B?TGZwVVNLS3AwcGZDWW4vZnRWV3R2MUZrQ0Y0Z2NJbGo0elBXWVVocHpJYzVh?=
 =?utf-8?B?bzRqbDNvczNJZnBLWS9NNmtWaTF4RUxjMm1tN25OZ2hzSGVqWTZRenpTTWlz?=
 =?utf-8?B?YVZsWTdNTkFCQ0ZvMDNadHBtZjJ0VmgyRGJjckJjYmVnTDUyL2h4eXBodE1J?=
 =?utf-8?B?TjZoUWhnUVdGaXg3b1MvWitudEZra3NsdzhBS1IxNTFHeWs5MDNJamsvK2Er?=
 =?utf-8?B?YldnVTdQVGlHVFVROVArT1ZSeWVIZElNaDA2RUpuOER3QnpmVC9lbWFKd0pX?=
 =?utf-8?B?ZzdxSU1Ra2xZVWx5eHFma3ZjQjFZWEdTZjNxWFJNY2JCMEdHUCtOSkFqR3ds?=
 =?utf-8?B?NlRzVjJuaElBdFJqRnFvM3U0UHErSWVCdEx0Y05RTlIxbmp0alFTZHluYldn?=
 =?utf-8?B?QmVCNmdPWlFITFJveFo1THJlOHZSRlByMXBFSzU5MU1rYnBiTTVzbERSWnBm?=
 =?utf-8?B?L1h6WWNtQStIK3N2RjUwWkRlNGo0a2Y0Q0ptenIyMmFCMW02cUtseDF3R2tD?=
 =?utf-8?B?QWZRK0FNV1p4d1ZjUE8vQ0UzSHk5TGpvWitBTXh0YVlpTjRDUk5sQ2VCUnI2?=
 =?utf-8?B?Tk12STFJbEQxWldSdzRkUTFXQlJ1ZzJqbDdTenYxSGhKc0RHRFI0RXp3L2dm?=
 =?utf-8?B?Y0JiY041UFQxbkhWS1d1Q0ZlUEwvbjZ1U2o2ZUkzN2hSRW9RSXVVb2E2M3F3?=
 =?utf-8?B?MTVVak5nd3BhM1ZBUXI3UmdlU3RpT1hvdFRma0VXWFpPcXNMK1krMDVWbjQ2?=
 =?utf-8?B?NXVBRkdNU1p3aTJ1YUUvS0FVRDU2Y2pNeC9JMWFlZ1R1akpXSTlxdFVmbFVT?=
 =?utf-8?B?YmwvSldPQVJtMkdOSHVBL3A3RGNkbHFQM0FMMTdSTWUvbURJNktOY0p1Q0I5?=
 =?utf-8?B?N1g1SmE4RGl0Wlg4Q1pwdFU1ZS9VYU54MnRObkx2RENKcVBFWC9uWVBSSmdk?=
 =?utf-8?B?T2VLdEZ4cFc3amRraFlsc0tkTGZPWDdBL2RaclNOQlpvRTRpRE1wWVV6b0Ri?=
 =?utf-8?B?YVJOcXFqTmRNdThldjBDMGd4WXNyUGlvQVdVaGxCbEtnWGJsS3laQm9NMzNo?=
 =?utf-8?B?L2N5bVdOY2VpNWlLQ2ozV1NLQzJMZThEL0ZyS1lEZFJGQnNwYjdpQmQ1Nis1?=
 =?utf-8?B?bmhmbmltU0RWSHNXQ2xoL0NtNWlobXU1cm9zTjcvK01aOVVlN3VmZUV1bkNC?=
 =?utf-8?B?QWQ0OUlQK0VvYzd3ZFdqcWVwb2VQWVNsQ1BEcWExS2wrZmlFU2trOHpEakpx?=
 =?utf-8?B?UExxU2VjenZSR2ZKQVV2WXhvUi9aa08zK2l4V3FBcVE2bHYzTHR0MTZvSzR3?=
 =?utf-8?B?OHZoYVdHMFJRTUJSaWZoRG1DLys3QzR4TEJXYjcrcE0xa1JhT0w2SGN0QXdw?=
 =?utf-8?B?Z0RlUGo2eWozK0xCMzFHSjd2Rit2TWRERmlodDVaQWw5V2hMeDMzeUZRdm82?=
 =?utf-8?B?ZEZwcjdyQWJWejhZMGw5bzFhYjYrWGZKNkgxZ2pjOGM3S0w0emkrNlVmbEhM?=
 =?utf-8?B?ei9LLzg3eGpUSW9ENjVRS1hNc3QrS3ZIV1hXM2NRUE45SHFJdy9RNkVENi9B?=
 =?utf-8?B?MVNOVEZTWDJDdjVaNW4rdXZTZXFqUVdYMlhJanMzb1pVUlRwZnRiN09Hd01P?=
 =?utf-8?B?UFRhSm9kVzdUTFAza1NwVW9rSndRL1cxZzE4SkxmaS9oYXZ6RzVoL1IyUHVV?=
 =?utf-8?B?VUoxSTBuenB5dDRMaWRUaHNYNUJmWmo5L0kzQ0d6d3I2ellLZkhkRGZ0alYr?=
 =?utf-8?B?SUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bebe566-7681-40c4-1177-08dc6d9e85b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2024 07:31:19.4737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: puegK1czu6kfRl7T4wsSqSQl+nuTCm/BYRasEivUMa9MJzZA+Wy8FbtKcdZ7WDnGH271DiGQ0z5d2hrFy35AEtE1WS8h6ETKdxuQb16P5BI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQZPR01MB0994

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGludXMgV2FsbGVpaiA8
bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KPiBTZW50OiBNb25kYXksIE1heSA2LCAyMDI0IDI6
MzUgUE0NCj4gVG86IFl1a2xpbiBTb28gPHl1a2xpbi5zb29Ac3RhcmZpdmV0ZWNoLmNvbT4NCj4g
Q2M6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz47
IEhhbCBGZW5nDQo+IDxoYWwuZmVuZ0BzdGFyZml2ZXRlY2guY29tPjsgTGV5Zm9vbiBUYW4gPGxl
eWZvb24udGFuQHN0YXJmaXZldGVjaC5jb20+Ow0KPiBKaWFubG9uZyBIdWFuZyA8amlhbmxvbmcu
aHVhbmdAc3RhcmZpdmV0ZWNoLmNvbT47IEVtaWwgUmVubmVyIEJlcnRoaW5nDQo+IDxrZXJuZWxA
ZXNtaWwuZGs+OyBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxv
d3NraQ0KPiA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnPjsgQ29ub3IgRG9vbGV5
IDxjb25vcitkdEBrZXJuZWwub3JnPjsNCj4gRHJldyBGdXN0aW5pIDxkcmV3QGJlYWdsZWJvYXJk
Lm9yZz47IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIu
a2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiByaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnOyBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5j
b20+OyBQYWxtZXINCj4gRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPjsgQWxiZXJ0IE91IDxh
b3VAZWVjcy5iZXJrZWxleS5lZHU+DQo+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIHYzIDAvN10g
QWRkIFBpbmN0cmwgZHJpdmVyIGZvciBTdGFyZml2ZSBKSDgxMDAgU29DDQo+IA0KPiBPbiBGcmks
IE1heSAzLCAyMDI0IGF0IDE6MTTigK9QTSBBbGV4IFNvbyA8eXVrbGluLnNvb0BzdGFyZml2ZXRl
Y2guY29tPg0KPiB3cm90ZToNCj4gDQo+ID4gU3RhcmZpdmUgSkg4MTAwIFNvQyBjb25zaXN0cyBv
ZiA0IHBpbmN0cmwgZG9tYWlucyAtIHN5c19lYXN0LA0KPiA+IHN5c193ZXN0LCBzeXNfZ21hYywg
YW5kIGFvbi4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBwaW5jdHJsIGRyaXZlcnMNCj4gPiBmb3Ig
dGhlc2UgNCBwaW5jdHJsIGRvbWFpbnMgYW5kIHRoaXMgcGF0Y2ggc2VyaWVzIGlzIGRlcGVuZGlu
ZyBvbiB0aGUNCj4gPiBKSDgxMDAgYmFzZSBwYXRjaCBzZXJpZXMgaW4gWzFdIGFuZCBbMl0uDQo+
ID4gVGhlIHJlbGV2YW50IGR0LWJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgZWFjaCBwaW5jdHJs
IGRvbWFpbiBoYXMgYmVlbg0KPiA+IHVwZGF0ZWQgYWNjb3JkaW5nbHkuDQo+ID4NCj4gPiBbMV0N
Cj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjMxMjAxMTIxNDEwLjk1Mjk4LTEt
amVlaGVuZy5zaWFAc3RhcmZpDQo+ID4gdmV0ZWNoLmNvbS8gWzJdDQo+ID4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC8yMDIzMTIwNjExNTAwMC4yOTU4MjUtMS0NCj4gamVlaGVuZy5zaWFA
c3RhcmYNCj4gPiBpdmV0ZWNoLmNvbS8NCj4gDQo+IHYzIGlzIHN0YXJ0aW5nIHRvIGxvb2sgdmVy
eSBuaWNlLCB3aHkgaXMgdGhpcyBwYXRjaCBzZXQgc3RpbGwgaW4gIlJGQyI/DQo+IA0KPiBJIHdv
dWxkIGxpa2Ugc29tZSBwcm9wZXIgcmV2aWV3IGZyb20gdGhlIFN0YXJGaXZlIG1haW50YWluZXJz
IGF0IHRoaXMgcG9pbnQgc28NCj4gd2UgY2FuIGdldCBpdCBmaW5pc2hlZC4NCj4gDQo+IFlvdXJz
LA0KPiBMaW51cyBXYWxsZWlqDQoNCkhpIExpbnVzDQoNClRoYW5rcyBmb3IgcmV2aWV3aW5nIHRo
ZSBwYXRjaGVzLg0KDQpUaGVyZSBpcyBhIGRpc2N1c3Npb24gaW4gYW5vdGhlciB0aHJlYWQgYWJv
dXQgdGhlIEpIODEwMCBTb0MgYmVpbmcgdmFsaWRhdGVkIG9uIEZQR0EvRW11bGF0aW9uIG9ubHkg
bm93LiAgVGhlIHN1Z2dlc3Rpb24gaXMgdG8gc2VuZCB0aGUgcGF0Y2hlcyBhcyAiUkZDIiBiZWZv
cmUgdGhlIHJlYWwgc2lsaWNvbiBhdmFpbGFiaWxpdHkuDQoNCmh0dHBzOi8vcGF0Y2hldy5vcmcv
bGludXgvMjAyMzEyMDExMjE0MTAuOTUyOTgtMS1qZWVoZW5nLnNpYUBzdGFyZml2ZXRlY2guY29t
LzIwMjMxMjAxMTIxNDEwLjk1Mjk4LTMtamVlaGVuZy5zaWFAc3RhcmZpdmV0ZWNoLmNvbS8NCg0K
UmVnYXJkcw0KTGV5IEZvb24NCg==

