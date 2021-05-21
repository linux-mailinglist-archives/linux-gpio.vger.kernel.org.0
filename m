Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D16C638C5E3
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 13:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235001AbhEULnO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 07:43:14 -0400
Received: from mail-vi1eur05on2083.outbound.protection.outlook.com ([40.107.21.83]:17322
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234948AbhEULnJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 21 May 2021 07:43:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyvTtoOx6aB8gWM6hXf69QyIA2E0UDmiqWwl+ewcQ/vGwMNnS8r3SU9koIvK+PEoSUYOx1jWrlf10+O7xP+1LZP6WD52GkV74XGKKsM9WbHQjlPBscFkcGL1of2CIHo6kjWJRhrFxEGiUKYU7PMmckX7RNT4DJUsa1IfHNBOdSLOnwQX+0Aq/DNZDZQQWsZfxkD9cinuD3qHid3XMXu/iE4jZE0lMUeRMGZ4uYTbOgn+Net5DzjZTKExZv3zI/RMgGLrWRdym0T6dtX2o0llcaxa6LmuNDExZPZDeg+xP17iJCSY5GXybCX+itcUwOFepafSy9dsPd3yuezMTwwJZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZsLZbl+fYuIIWc2smxtC5XanDq0fPtXlsVLeiCn984=;
 b=C1AAW7m9DWN/+mBJOVGH2lK2KKCMuDUC8uOvWZZWCvBP/XhTHYA1/Rt+bl4BsdY+RXvE3BacAuotezE5guBjn59qWhkr+nwcTFB8Hkej144B6VkbPMI8yuoHTLwzcW+llOiZy4vKlEPg3W3t6/KsXI1QXjnJc43pZdaWEAYQz6kN0w8rCp/+q1zR9x1FqinGpx9LTDQ47/0KA02ck4o2qjOKszYSAvxgGiAyFRyrXV52sl/IGthtJ9UhiS7efnT8qAan0iVhoe44wiZDE3+CHUqrnVJoJELZsGsghlI7p3rL9ajVYohUSk8zt0++1prIgcpzmnmfksQVxn67j/Pvjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZsLZbl+fYuIIWc2smxtC5XanDq0fPtXlsVLeiCn984=;
 b=C5Lwfb9d32/SnCG6ZlB55cLwTxM/wD6FSxaumIX5Wp3ApEX1seLV+gHF1+WI6qM7Tp18D/U00rR8QBM289+c/Qi0sdXZBfMxrIw6Lc33lHh4kLKhFcamVgVtfptwGeV84yeCJ0a3dFir4FiE9LSBVaZnff8ghBYK4/DEgGSTVQA=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0302MB2761.eurprd03.prod.outlook.com (2603:10a6:3:f0::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.26; Fri, 21 May 2021 11:41:41 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::89f0:ff95:a73a:cf4b]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::89f0:ff95:a73a:cf4b%7]) with mapi id 15.20.4129.033; Fri, 21 May 2021
 11:41:41 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "michael@walle.cc" <michael@walle.cc>
CC:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] gpio: regmap: Support few IC specific operations
Thread-Topic: [PATCH v2 1/3] gpio: regmap: Support few IC specific operations
Thread-Index: AQHXTgpu4aWqZZ8ASUmBHpkD9gskvKrttrqAgAACwoCAABDbgIAABhyA
Date:   Fri, 21 May 2021 11:41:41 +0000
Message-ID: <236f3000b2bf90a626c77582c30cf5c62fe4d6ce.camel@fi.rohmeurope.com>
References: <cover.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
         <6e319c22b41747e3911c7a5cad877134cabc9231.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
         <CAHp75VcZwYdA5R=peC+8jHVT6UDsAT9msSs=W6C7rgfyjGPtXA@mail.gmail.com>
         <8c048bda0ace591d7e91c07ed9155338@walle.cc>
         <CAHp75VdbomvbAY42Bje7F8qjWfgeSnU8i2ULJRXpYKA+oTmwrg@mail.gmail.com>
In-Reply-To: <CAHp75VdbomvbAY42Bje7F8qjWfgeSnU8i2ULJRXpYKA+oTmwrg@mail.gmail.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [213.255.186.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93ea8694-e107-4fca-3a19-08d91c4d6720
x-ms-traffictypediagnostic: HE1PR0302MB2761:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0302MB2761F27AD24EABD3CC0EFFA1AD299@HE1PR0302MB2761.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0Gru/cUKbePHlO7b1w+03wYjzJPA1fOl6H8jmV2mD6XPW2zpTH2nbIlOION4U27e4tX0y1xcFYVVOCdRm2aKaE4TQ42ollIl9kAylKQ46wnRzKQOHIg2KUkmhr4wZSHqx7OiBN8TK1AE9w9iiNfjJpxpF84F8OkYuX4aRXiuUj9clnqNCVaK0VMOqmEZhbKLsXREEDlEVy143ompwk8Gu2PME7eSAWPHsMMsKEJyAJ4SJrs4KfhTaPj2NPwwVkSUuBuzmqI9yAN7xMLyRvC9i+m+FOBBpN9AlnQOLUWb6LGHbbrxi48GCQMbJumfxilCbpxR1g0TLyID7zsEGL2SBG14DFMIc5/WKeZMx/m2pPUT0UhA7WInLh7kWcXqoKGGW2/k9XuNqOl6eYdv6W/FnyF+lStMAF/CES1tyPFWf7shugO4QUdieUbI9kbSVQwJw2nJhAffbBR1Yu9tZPDGSphDM6fc22g0/PPe8iXHsshDACg/MG17E7sIvWOlrvD8yBsGiTzrQoSsB6157/KcWkA+3FrGBF1NaMOo7aDq4ge7HEhLm1HoeyDXGPxqh/WkZZnZqUGZZOgRtLaQ0gwHQbAe0ZFoVg4BMv58bUTR9xo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(366004)(39840400004)(110136005)(83380400001)(8936002)(76116006)(478600001)(54906003)(122000001)(186003)(86362001)(6512007)(2906002)(38100700002)(4326008)(53546011)(71200400001)(316002)(6506007)(26005)(64756008)(66556008)(66446008)(66476007)(8676002)(5660300002)(3450700001)(66946007)(2616005)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?UmcyVjlkUU9UU1BERmMzMW5MVmZVdTdCRSsrNTRTZys3TWJPaGJack1WUnMz?=
 =?utf-8?B?czloOVAwbFQ2d0RIRlRGSmE5WENINytmMnFPSlRKTWdPanNQMmpSeTBiamFS?=
 =?utf-8?B?TnZXMThnWmMvZ21wNnM4d1Z4TjR0Z3U1U1pvWVZjRmlENmNodkVFY09hVzdO?=
 =?utf-8?B?aWZoUkpneUUzaTJZQkdGcnE3dnFtVVNDVzYrQ2padXAwUVJ3cnByYVpkQnVv?=
 =?utf-8?B?eWxBc0hvdlozWk5LR01idjQxazNWdk5DTS9YelZ1VjE5MjBIWUtiWFNEcVRT?=
 =?utf-8?B?UEdHS0RxV1RsUWtwZmw0K0dsRUJ5eXFsMWEvTkYvSXRIYXpZN2ZINElMK3A5?=
 =?utf-8?B?RVRyRnd3NjQ3RW1jZE9PMW1HVm9FMHZHaWFENFZIdU5rNTVsay9QMUhLbXQ0?=
 =?utf-8?B?YWFURjFPYnhNT3BxYnJkRFBOLzRIWEVxbkZXd1RrM1BwK2x0Sm9kMEdKUGdT?=
 =?utf-8?B?SkJJQXV3ZmFZRTFzTEFyQVpxQ3ovNEUvZGVTNUpWZFR2ZzY5Q3ZXbVIwUEor?=
 =?utf-8?B?MmlTSDZCaWFKWVZLQVJ0RFI0Z2ZBb1N0MzUwOTRMT3QxL2N5TmwxNzVqTzJT?=
 =?utf-8?B?cDBUbWZNZWZuOHZWVm1tNFY1NGdHV0RnbkZnM2JvMTVtdTIrejEzT1VKK1ZG?=
 =?utf-8?B?NDh3dU5BYW5VMUxFN2srVHBwR3Jqdm15Wmwrc2tySWl6OVJucmZKazhMSUZk?=
 =?utf-8?B?elNqTzFha2p3cW55eVhiTXM1VW9EUTllNCtBTU5BTTNHL1JGeExIRUNNVWR5?=
 =?utf-8?B?cnVBL0tWVDBMN1N1aC9YWnNIQlRLejhwSUpTa0czTERpT3BPUXMzMERuYjVM?=
 =?utf-8?B?ZXE0UVFYOTVFZDk0MW5mcTUrMkJOOElHd2NaS204ZEM2TmZyZFZ4cGNXdHIy?=
 =?utf-8?B?amkxdlZxYWhjOW5zMVRDaWZHeE13dlFQeGUwdGt2NTloUUdVQTA2cGVjOGNL?=
 =?utf-8?B?Uk43SFNNeXBVWmJDalowWGRzaEVOYytTMmNXMnljTU16SU1pWENDa0xwM0lM?=
 =?utf-8?B?dUM0ZjhuVkJneStxUEF4V2E4SWxSUVZYd3pBMHhNcVlMMXNpbnhobVN3aHNJ?=
 =?utf-8?B?OFUxUTJGelNnTG1WKzZyUmYwbVpMUXI5cmNydDAybHV5bTFVOHcwZThwYVh4?=
 =?utf-8?B?MDVkejc2QTlYbHFqbHhQZFdOZFBlWDBXZnYzN1VXaU5xdTZvU045L210T0ls?=
 =?utf-8?B?NXhpUnBIZEdaUnFWSU1tNXdSdTc3UXJYanZhWmswbnBlQURRT2J5YXR3UUxl?=
 =?utf-8?B?MWw1ZmhoV25WcFVWSllrQ0ZSRWhsZWJjT1ZRRW9sTFordGdMdmUxenJWNmdU?=
 =?utf-8?B?RXQyY0RscUVzM3BGck1acWdqWFIrVWc5dTlHT3NoT2x2NGQxRFhITmRCck51?=
 =?utf-8?B?MVBFa2RDYm0ydmgrdXljVDE3Y2w5dk1kL3VUQzVvQlI0OTNUSkZRd1ZLZjFI?=
 =?utf-8?B?UFBLZ0I1a2hnV1M1c0QyN0NPVW5Md2FPM2YzcUtYK0s5S3ozWCs0dzczcHdO?=
 =?utf-8?B?bGFsNEkxQUo3SGpDeFd6K0FCM0k5WWNLdEgzU3U4a29xNnNkN1dVMVZEOHFn?=
 =?utf-8?B?QjVGeVNMMHB5dHRER2d2SDk3VE0yanY3WlhVbTNscXU0MFFsMzc3ay9Odldv?=
 =?utf-8?B?Wk5MM09Rd3c0SVdxMXhjR3MraXM2Z2xUVi9BREozUEU2enUrZVJVOGV4VEhO?=
 =?utf-8?B?QWZHT1NZZythTno2WWVxakk2NitWSmdVd2VOQ1V0L2lLSzVEYStsVFVNM05x?=
 =?utf-8?B?TzlhWWdwcVRhZ1Z6WjMzL2lBU0ZzZHhyMHNjQmJYQmdnSnV5dDlISVJ0alJt?=
 =?utf-8?B?cFZodnEwdTUyUUpqZWJ1Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <484E7E5A4CFDC0499C8DD7E40E63452A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ea8694-e107-4fca-3a19-08d91c4d6720
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 11:41:41.6383
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N54kRjLL9JdHPaF7kB9+5unspeomsK/UnX+VY0J2a/DV7uySeyrZKj4Woi2G2YcG1i+5rvkuHasmAnrBsG/cRkW2Ti5vsPBxUHcOrAmGhzjtMuGx310NSaxoDq0g/eov
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2761
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBGcmksIDIwMjEtMDUtMjEgYXQgMTQ6MTkgKzAzMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90
ZToNCj4gT24gRnJpLCBNYXkgMjEsIDIwMjEgYXQgMToxOSBQTSBNaWNoYWVsIFdhbGxlIDxtaWNo
YWVsQHdhbGxlLmNjPg0KPiB3cm90ZToNCj4gPiBBbSAyMDIxLTA1LTIxIDEyOjA5LCBzY2hyaWVi
IEFuZHkgU2hldmNoZW5rbzoNCj4gPiA+IE9uIEZyaSwgTWF5IDIxLCAyMDIxIGF0IDEyOjUzIFBN
IE1hdHRpIFZhaXR0aW5lbg0KPiA+ID4gPG1hdHRpLnZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNv
bT4gd3JvdGU6DQo+ID4gPiA+IENoYW5nZWxvZyB2MjogKGJhc2VkIG9uIHN1Z2dlc3Rpb25zIGJ5
IE1pY2hhZWwgV2FsbGUpDQo+ID4gPiA+ICAgLSBkcm9wIGdwaW9fcmVnbWFwX3NldF9kcnZkYXRh
KCkNCj4gPiA+IA0KPiA+ID4gQnV0IHdoeSBkbyB3ZSBoYXZlIGdwaW9fcmVnbWFwX2dldF9kcnZk
YXRhKCkgYW5kIHdoeSBpcyBpdA0KPiA+ID4gZGlmZmVyZW50DQo+ID4gPiBub3cgdG8gdGhlIG5l
dyBtZW1iZXIgaGFuZGxpbmc/DQo+ID4gDQo+ID4gRWcuIHRoZSByZWdfbWFza194bGF0ZSgpIGNh
bGxiYWNrIGlzIGp1c3QgcGFzc2VkIGEgInN0cnVjdA0KPiA+IGdwaW9fcmVnbWFwKiIuDQo+ID4g
SWYgc29tZW9uZSBuZWVkcyB0byBhY2Nlc3MgcHJpdmF0ZSBkYXRhIHRoZXJlLA0KPiA+IGdwaW9f
cmVnbWFwX2dldF9kcnZkYXRhKCkNCj4gPiBpcyB1c2VkLiBBdCBsZWFzdCB0aGF0IHdhcyBpdHMg
aW50ZW50aW9uLg0KPiA+IA0KPiA+IFRodXMgSSB3YXMgYWxzbyBzdWdnZXN0aW5nIHRvIHVzZSAi
c3RydWN0IGdwaW9fcmVnbWFwKiIgaW4gdGhlDQo+ID4gbmV3ZXINCj4gPiBjYWxsYmFja3MuDQo+
ID4gDQo+ID4gSSBkb24ndCBnZXQgd2hhdCB5b3UgbWVhbiBieSAiZGlmZmVyZW50IHRvIHRoZSBu
ZXcgbWVtYmVyDQo+ID4gaGFuZGxpbmciPw0KPiANCj4gQ3VycmVudGx5IHdlIGhhdmUgYSBzeW1t
ZXRyaWNhbCBBUEkgdGhhdCBpcyBnZXR0ZXIgYW5kIHNldHRlciBhZ2FpbnN0DQo+IGEgY2VydGFp
biBmaWVsZC4NCj4gTm93IHRoaXMgY2hhbmdlIGRyb3BzIHRoZSBzZXR0ZXIgYW5kIGludHJvZHVj
ZXMgc29tZSBvdGhlciBmaWVsZA0KPiBzb21ld2hlcmUgZWxzZS4NCj4gU291bmRzIHRvIG1lOg0K
PiAgLSBlaXRoZXIgdGhpcyBoYXMgdG8gYmUgc3BsaXQgaW50byB0d28gY2hhbmdlcyB3aXRoIGV4
cGxhbmF0aW9uIG9mDQo+IHdoYXQncyBnb2luZyBvbg0KPiAgLSBvciBzb21ldGhpbmcgb2RkIGlz
IGhhcHBlbmluZyBoZXJlIHdoaWNoIEkgZG8gbm90IHVuZGVyc3RhbmQuDQo+IA0KVGhlIHJhdGlv
bmFsZSBiZWluZCBwbGFjaW5nIHRoZSBkcnZkYXRhIHBvaW50ZXIgLyBzZXR0aW5nIGluIHRoZSBj
b25maWcNCnN0cnVjdCBpcyBhdm9pZGluZyByYWNlcyBpbiBjYXNlIHRoZSBkcnZkYXRhIGlzIG5l
ZWRlZCBieSBvcGVyYXRpb25zDQpjYWxsZWQgZHVyaW5nIHRoZSBncGlvX2NoaXAgcmVnaXN0cmF0
aW9uLiAoSWYgdGhlIGRydmRhdGEgaXMgbmVlZGVkIGZvcg0KZXhhbXBsZSBhdCB0aGUgc2V0X2Nv
bmZpZygpIG9yIGluaXRfdmFsaWRfbWFzaygpKS4gUHJvdmlkaW5nIHRoZQ0KZHJ2ZGF0YSBvbmx5
IGFmdGVyIHdlIGdldCB0aGUgZ3Bpb19yZWdtYXAgZnJvbSByZWdpc3RyYXRpb24gaXMgdG9vDQps
YXRlLg0KDQpJdCdzIGFjdHVhbGx5IGhhcmQgdG8gc2VlIGFtIHVzZS1jYXNlIGZvciBkcnZkYXRh
IHdoZXJlIHByb3ZpZGluZyBpdA0KYWZ0ZXIgZ3BpbyByZWdpc3RyYXRpb24gd291bGQgbm90IGJl
IHJhY3kuDQoNCkdldHRpbmcgdGhlIGRydmRhdGEgZG9lcyBub3QgaGF2ZSBzaW1pbGFyIHJhY2Ug
Y29uZGl0aW9uIGFzIHNldHRpbmcgaXQuDQpUaHVzIHRoZSBBUEkgZm9yIGdldHRpbmcgaXQgaXMg
T2suDQoNCkJlc3QgUmVnYXJkcw0KCU1hdHRpIFZhaXR0aW5lbg0K
