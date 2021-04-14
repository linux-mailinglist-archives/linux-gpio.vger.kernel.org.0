Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A930E35F97F
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Apr 2021 19:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234184AbhDNRKV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Apr 2021 13:10:21 -0400
Received: from mail-eopbgr40073.outbound.protection.outlook.com ([40.107.4.73]:63463
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232990AbhDNRKT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Apr 2021 13:10:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eb16ucFyejAgvT3ImP6YaCTqeEQ/9oVXqQ0keSZZ82X9WuOhMQQrPhf65ywgvoG8m3P/H8HVOAEUXQAIUdrYylA5jr7AsxJdk28/qY/tA6KsePYnpM6rp4q7AZiaPLx/sIV4MCh0+Vzob9cQS78jq4HuZsT6qS1sCKkp7PkrJPqXqyonnRndO5XL+Y1c4OGpQcy+LbFm9KNA4uR7vQHSc4Ul0QIX7Qw9hWzkys1ib4MDUsSGD3NtMEmumvFTVh8R45mh2kg/ch7MLGaFxbnNaxK617x51n3E4MhWxvcnT2njsceIdDTfm4bPROD0ITjwLcAHeZdrx2Og+EcZYrTuHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wpIaUxWowAa7hXvekBTC+cgDL8UIOgddLANICYk8kHQ=;
 b=KLUhGfdlV+LXePmiODVwyJgDqyRaJm3oxuDgOW43bsWVswpuW437c+Pd5QCGrGAzu936s3xyMx7qKL2jUyxsVjVr9S+wWBhI+zJ1ZCR5UVSAA/Tv63ZH6x2lzExLrNDhqVrKqdJs/X4hvpzmUchk9UJW2TMJe4p2bR03ckA5/PTDMsM0NOWY942RLKn061RgOODcVhHG6abmK1mhNY7zXfQKz9m/1RPOtsxS+EeOHuPfOmFDDnwHedS14p63a/gBBqt9ivLblKw3yCbCebXIAhxHaiUtDBZPpXbd+DhQszp7GxuZ8TdiXrjzVQVJYEfvC4T5AawkKbJtp8wXVeiVpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wpIaUxWowAa7hXvekBTC+cgDL8UIOgddLANICYk8kHQ=;
 b=E1oOiWJDmDOweea8w6OyVamlx4xMhEOocZqV+zRpnT0o5LNYkzRX7t0Uxfz8ganIrPduS7RcbFpdF+YmsHMsTzesRprJOqGGSSaealLSdxjqfkss3AMHvFJ8UJ9cjYbtu6og+MhjImPE1ou27bnBuw+kU5IXz43aAqTED6P5bgw=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB3065.eurprd03.prod.outlook.com (2603:10a6:7:60::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32; Wed, 14 Apr 2021 17:09:54 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f4d0:ee66:d5fb:9cdd]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f4d0:ee66:d5fb:9cdd%3]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 17:09:54 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "lee.jones@linaro.org" <lee.jones@linaro.org>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [GIT PULL] Immutable branch between MFD, Clock, GPIO, Regulator
 and RTC due for the v5.13 merge window
Thread-Topic: [GIT PULL] Immutable branch between MFD, Clock, GPIO, Regulator
 and RTC due for the v5.13 merge window
Thread-Index: AQHXMS/C0b5/USayxkend/+minUP5aq0GY+AgAAmCYA=
Date:   Wed, 14 Apr 2021 17:09:53 +0000
Message-ID: <43131cbebdd04a3abc51e05de5170c583006e2d2.camel@fi.rohmeurope.com>
References: <cover.1617616855.git.matti.vaittinen@fi.rohmeurope.com>
         <20210414131158.GN4869@dell> <20210414145345.GO4869@dell>
In-Reply-To: <20210414145345.GO4869@dell>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [2001:14ba:16e2:8300::6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4581463a-9bdb-4178-8daf-08d8ff681f53
x-ms-traffictypediagnostic: HE1PR03MB3065:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR03MB3065AA5E5A88866A9C5A1C8FAD4E9@HE1PR03MB3065.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zLdRx10Y6rYQPf334oybZHemmpr00jGyv2O+O/8v+JrKk+s38wxatzl5vLed6Zz9YwDwEiyEuIELyw6mgyPDGQbDagqtWtRfq7CUvmLH/eY86dYAS4kg6+rFJuPCCda0qpGfCmVrVdspBgS/5mDI8vh5CnbgQb7tqW810/rPRJg/i1EOqfKODL/aA9/EgsvCJIyYS/fHjx8hU0ASTfZrO7vgq/8Uhr2hQ1FM/Fx+8DDKp6cqSdHc6wtQ7oI/VJkkwyxyLKkqyeRgxLXhFYgahCGsspR+sYUIDNMw3aVpaOIvcIHK/04phoocY71gL4w296evVawJNYSdMlTVcpCf+0dtC4Hp2BwDzL96BkwwQNBtOIJKnPAhcu7lCmZW3TmsQ9E7vJbM9w+xwsy7Co9FlwP+dN2rGTmHgJmrsu2y1M6uTf1JsAuZvKl6zNS0zyzKxigsELAM4eyaiA6BRkKbbLcvA5hK5loNWe79BWbcUlvjYVlMzBo4e0jqnHxiyszRijekVLyWXSQWYH8Qbxsx+O9xxVzSYTg0xLnZLidLUxK9g962R1rNGBZKwt2K0qLait/s0EGNojQil7F/aEfmpdM5qzxFeWh1OKcEulJ5wAs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(346002)(39840400004)(376002)(8936002)(5660300002)(3450700001)(86362001)(2616005)(478600001)(54906003)(76116006)(6506007)(6916009)(71200400001)(186003)(8676002)(38100700002)(6486002)(2906002)(83380400001)(66476007)(4326008)(64756008)(66556008)(66446008)(66946007)(7416002)(122000001)(6512007)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?a1FxRzQyTzlBTU9ubnVRYjM2RDBDSUZsTHF5cVkrUklOWWE4RzduSytRNW5C?=
 =?utf-8?B?M0VnWG5VdFQ1aUljVTU3dVFzVFlXdkdCT0pWUytZL1VJYmhYM0ZTbklGMUVE?=
 =?utf-8?B?Y21nUkhTdDloaWFLeDFrZ0JhRjI1VkNMUjBGeXpRbzZYT2J1dTh4dEdFemVV?=
 =?utf-8?B?ZGZOeDlqc09ER1ZNdU4vdml0R2tHZTNWQkJQdnNqUGxpVkRMMWV2bEZUT2o3?=
 =?utf-8?B?ekxuc2hsUWo1bm45SFJWS21yQnBxZndlWHFXaXdMNGJyUWxXTVNFZHM4dVdC?=
 =?utf-8?B?VTVBcGZNR0NUNEpuVmZaSVlYSUc1TVZnWHJycHZtQkN3dzF2SXl4MUkvSHVs?=
 =?utf-8?B?NWtVOWRFcGlVcy9qQlZHM09TWXBCUFh4U0hUUjlkNkNsQTNINWZWU1Z3eld5?=
 =?utf-8?B?SnUxVHh1WG1CZGZUOU82V2ZjY3QwcW1id0loRStObCt6SzFDeGxRaGZnRVAr?=
 =?utf-8?B?OEhFOW4vRE51akRIcWRPMnN4OHhUTEpPNXdsWFo0aDVnZWZ5YUU4VVhyRTlG?=
 =?utf-8?B?S2N2dG9nYUkrVjFzYVYvb0R2MCtaZ1RMR056Um4yRGFYd3RkK2FYYzRiS1Jo?=
 =?utf-8?B?L2JadmlmRVNtdlJyQkQzTFI1Sk1RaXBKNTFFem9IQWtnbWI4VDdoUjFKa05G?=
 =?utf-8?B?eGlMQ0ZIZTc0ZnN0RkQrTVRXYXkxbGVGRVd3MVZoVzI0bDhZZUwyVTZPOERR?=
 =?utf-8?B?L2dxU0lwU2J1ZTcrMzlwY2J3Ny9KcTQreFM5RjNnYzE1MU9ERkIyWHVCUnd2?=
 =?utf-8?B?Q2xtQnZNSW4rNWJTSEpFeFJQUElFUXg1SysyUVVaQ0ovb0hyUlhBKzRhRHph?=
 =?utf-8?B?OGpGaythR2owYWxSdndhL1hoeXBEQStISDhLZ0wxQ1Q5bTZpMHRQR3REME9B?=
 =?utf-8?B?Um1XcXROelBqbVVyZTRWZkZXTUZnK3IyakdaQ3J2NkhyRXNhUUJJdUpjWUhu?=
 =?utf-8?B?TGR2OWJONjNzZm9zWVVyOC9KQW0rOW1uS1ptNy9IMzVyeFNqdklrQlpLdFhL?=
 =?utf-8?B?WklNWlVUYm5aZXRSZ3BXREpmNkM2ZTIyV0QyaDh0RlcrVEV0dWR6WlhTTEZv?=
 =?utf-8?B?elVKS1N4VFVPZ2UxeVpsd3dsd3RZWk44WmEzQnRQVjJsOUR0QlVLeUFZRFVU?=
 =?utf-8?B?TVFyaCsrclFnVU5vT1gwMHJyQXBKaVNZSFdqbHliN3B1alhKcjcvTS9qSHd1?=
 =?utf-8?B?NHZPWTRnbkgveTNBdmYxQjg0Q1cwQUVCcVVwRWsxclVibXhEM3Vka051VEFL?=
 =?utf-8?B?SC9LMFp4cEZjNFpPSldRN25wQkd5anhwVjBZQU04NWlyV1dTdEg5U3NYZW1t?=
 =?utf-8?B?MUU0ejhBS0oyd2VoWVFHcFBkK1JxTlEra1FSUFBCU2FjQ2Z5bWl0bGRIdEpH?=
 =?utf-8?B?MlN4ZnFQV0lNb0srNFovditpZlYycW1GWGdlaG1nbU5iWjJyTXIxMUJuak1q?=
 =?utf-8?B?NlgxUEFVL1MrVmZGdXQwNmpzSUg3cGtsM081dm1nT0FhaFlVTS9VSDk3cnYz?=
 =?utf-8?B?S0J6ZjRZV21Cc2VEek5JWUpESXE1QkcrQmxMM29LQmNLTkJFZWE4dk5nWTV4?=
 =?utf-8?B?Q1JiSkhmZUNKTlpWYk16M3NvVmxvaHI0U2VUbVdDeE13ZjFaUm44RzlKbWJs?=
 =?utf-8?B?ZXFkVVgyaWJKRVBlQUZGTDU0T2R4elBaRURpU24vOEdwZkFMOHB2TGdIS0VF?=
 =?utf-8?B?WU9CamRma3JKQVQvaHNOekVpeWl5NCtlR0Ftb2lPU1pIWTh2QlZZNlcxTTRX?=
 =?utf-8?B?ZktsbS9GUDlYcnpnOGN3SjV6cFhQVTQ5ZEh4dUFkQnlEYVpYNFF0L25ldmll?=
 =?utf-8?Q?1AdJY+0gWcriMth9CTNgfPX9Sr35ylaX1RVPo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <38916E370C99BC45A640525C6D0216FA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4581463a-9bdb-4178-8daf-08d8ff681f53
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2021 17:09:53.9006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dXd0XS8ao9Yr7he+NoPPhp+/Z55pr7rXDemfFyCmzsC0z/wgpNeb33nI7iixrgzpLVmbBHDP14WO79d6L7HNVUnllfLgo7FR5DJzfd5TLv8opTts5hBT2zcnivFlMMIV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB3065
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTGVlLCBNYXJrLCBTdGVwaGVuLCBMaW51cywgQWxleGFuZHJlLA0KDQpPbiBXZWQsIDIw
MjEtMDQtMTQgYXQgMTU6NTMgKzAxMDAsIExlZSBKb25lcyB3cm90ZToNCj4gT24gV2VkLCAxNCBB
cHIgMjAyMSwgTGVlIEpvbmVzIHdyb3RlOg0KPiANCj4gPiBQbGVhc2Ugbm90ZSB0aGF0IHRoaXMg
UFIgd2lsbCBicmVhayB5b3VyIGJ1aWxkIHVubGVzcyB5b3UgaGF2ZSB0aGUNCj4gPiByZXF1aXJl
ZCBSZWd1bGF0b3IgQVBJIHVwZGF0ZS4NCj4gPiANCj4gPiAgZmI4ZmVlOWVmZGNmMCByZWd1bGF0
b3I6IEFkZCByZWdtYXAgaGVscGVyIGZvciByYW1wLWRlbGF5IHNldHRpbmcNCj4gPiAgZTNiYWFj
ZjU0Mjc1NiByZWd1bGF0b3I6IGhlbHBlcnM6IEV4cG9ydCBoZWxwZXIgdm9sdGFnZSBsaXN0aW5n
DQo+IA0KPiBMb29rcyBsaWtlIE1hcmsgaGFzIHRoZXNlOg0KPiANCj4gIGdpdDovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9icm9vbmllL3JlZ3VsYXRvcg0KPiByZWd1
bGF0b3ItbGlzdC1yYW1wLWhlbHBlcnMNCj4gIA0KPiA+IFB1bGwgYXQgeW91ciBwZXJpbCEgOikN
Cj4gPiANCj4gPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0DQo+ID4gYTM4ZmQ4
NzQ4NDY0ODMxNTg0YTE5NDM4Y2JiMzA4MmI1YTJkYWIxNToNCj4gPiANCj4gPiAgIExpbnV4IDUu
MTItcmMyICgyMDIxLTAzLTA1IDE3OjMzOjQxIC0wODAwKQ0KPiA+IA0KPiA+IGFyZSBhdmFpbGFi
bGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KPiA+IA0KPiA+ICAgZ2l0Oi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2xlZS9tZmQuZ2l0DQo+ID4gdGFncy9pYi1t
ZmQtY2xrLWdwaW8tcmVndWxhdG9yLXJ0Yy12NS4xMw0KPiA+IA0KPiA+IGZvciB5b3UgdG8gZmV0
Y2ggY2hhbmdlcyB1cCB0bw0KPiA+IDVhOGE2NGQ5YTM4YjlkMzc5NGY5ZjVlMTUzZmMwMzU4Yjg1
OGNjMjQ6DQo+ID4gDQo+ID4gICBNQUlOVEFJTkVSUzogQWRkIFJPSE0gQkQ3MTgxNUFHVyAoMjAy
MS0wNC0xNCAxMDoyMTo0MyArMDEwMCkNCj4gPiANCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gSW1tdXRhYmxl
IGJyYW5jaCBiZXR3ZWVuIE1GRCwgQ2xvY2ssIEdQSU8sIFJlZ3VsYXRvciBhbmQgUlRDIGR1ZQ0K
PiA+IGZvciB0aGUgdjUuMTMgbWVyZ2Ugd2luZG93DQo+ID4gDQo+ID4gLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+IE1h
dHRpIFZhaXR0aW5lbiAoMTYpOg0KPiA+ICAgICAgIHJ0YzogYmQ3MDUyODogRG8gbm90IHJlcXVp
cmUgcGFyZW50IGRhdGENCj4gPiAgICAgICBtZmQ6IGJkNzE4eDc6IHNpbXBsaWZ5IGJ5IGNsZWFu
aW5nIHVubmVjZXNzYXJ5IGRldmljZSBkYXRhDQo+ID4gICAgICAgZHRfYmluZGluZ3M6IGJkNzE4
Mjg6IEFkZCBjbG9jayBvdXRwdXQgbW9kZQ0KPiA+ICAgICAgIGR0X2JpbmRpbmdzOiByZWd1bGF0
b3I6IEFkZCBST0hNIEJENzE4MTUgUE1JQyByZWd1bGF0b3JzDQo+ID4gICAgICAgZHRfYmluZGlu
Z3M6IG1mZDogQWRkIFJPSE0gQkQ3MTgxNSBQTUlDDQo+ID4gICAgICAgbWZkOiBBZGQgUk9ITSBC
RDcxODE1IElEDQo+ID4gICAgICAgbWZkOiBTb3J0IFJPSE0gY2hpcCBJRCBsaXN0IGZvciBiZXR0
ZXIgcmVhZGFiaWxpdHkNCj4gPiAgICAgICBtZmQ6IFN1cHBvcnQgZm9yIFJPSE0gQkQ3MTgxNSBQ
TUlDIGNvcmUNCj4gPiAgICAgICBncGlvOiBTdXBwb3J0IFJPSE0gQkQ3MTgxNSBHUE9zDQo+ID4g
ICAgICAgcmVndWxhdG9yOiByb2htLXJlZ3VsYXRvcjogbGluZWFyIHZvbHRhZ2Ugc3VwcG9ydA0K
PiA+ICAgICAgIHJlZ3VsYXRvcjogcm9obS1yZWd1bGF0b3I6IFN1cHBvcnQgU05WUyBIVyBzdGF0
ZS4NCj4gPiAgICAgICByZWd1bGF0b3I6IGJkNzE4eDcsIGJkNzE4Mjg6IFVzZSByYW1wLWRlbGF5
IGhlbHBlcg0KPiA+ICAgICAgIHJlZ3VsYXRvcjogU3VwcG9ydCBST0hNIEJENzE4MTUgcmVndWxh
dG9ycw0KPiA+ICAgICAgIGNsazogYmQ3MTh4NzogQWRkIHN1cHBvcnQgZm9yIGNsayBnYXRlIG9u
IFJPSE0gQkQ3MTgxNSBQTUlDDQo+ID4gICAgICAgcnRjOiBiZDcwNTI4OiBTdXBwb3J0IFJUQyBv
biBST0hNIEJENzE4MTUNCj4gPiAgICAgICBNQUlOVEFJTkVSUzogQWRkIFJPSE0gQkQ3MTgxNUFH
Vw0KDQpJIHRoaW5rIHRoZSBvcmlnaW5hbCBpZGVhIHdhcyB0aGF0IExlZSBjb3VsZCBnZXQgdGhl
IFRhZyBmcm9tIE1hcmsgYW5kDQp0aGVuIGdldCBhbGwgdGhlIGNoYW5nZXMgaW4gdmlhIE1GRCB0
cmVlLiBJIGNhbid0IHNheSB3aGF0IHdvdWxkIGJlIHRoZQ0KYmVzdCB3YXkgdG8gZ2V0IHRoZXNl
IGluLiBJJ20gb3BlbiB0byBhbGwgc3VnZ2VzdGlvbnMgOikNCg0KQmVzdCBSZWdhcmRzDQoJTWF0
dGkgVmFpdHRpbmVuDQoNCg0K
