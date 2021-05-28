Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6412C39454D
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 17:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236713AbhE1Po2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 May 2021 11:44:28 -0400
Received: from mail-eopbgr70043.outbound.protection.outlook.com ([40.107.7.43]:15886
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235056AbhE1Po1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 28 May 2021 11:44:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyomM9mqK4BWEc7sqdJ7XZ8+VTSNb/vP2VnJ8mDzcMOiRS/UUKwurGF8Vj9fPSbV1IHel+mzPY4FwlkglgP19GbDN9r4sVDQetnchmbmsXjtZd+ggvx5sYo10aW1lBmD+5U3BwuBEZdsM/2bO9JDfI1WXLbU6WvpM2i0MjOqDj8jFPV+6sLy6jZIs2cwl9Ga46X8YKCOPcVT21CMiwEXm2YJ+fzlYUSI2vRgKanOQlE2Tv7kg6zJ4Vsq73uwuQM3D6AGJ1GMj2J7GBaO+ptb5uBgR2iYah5zjBomWtLQZ5X/19EFv18ULndpcZ7gFYQr22eVdbEATAi2XuLTo8+sIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bw1I4NLPuuHJGrNIPep/v61WZblbCB0lzlzAZJKNDvg=;
 b=nuUDrotKBgMv/TLo62GyKBvDC/6qnERZ99fg56kTMSemNjTlwELY8QoIsyKuIrfx59uPtmgfRKxm2vlQg4LIuFijItwP8ZQGoDvfibc68TxAZycBuSUoCiBPaZNPN0QeYHruhBO5eBVXzldM7FwOLcadCzDJN1IE2YkwkV+ZCd/AnnMwtO72Tm20OgvdlgnMU/p2nKHVfnH7WQJozy6VvpK3udT4dmYkSUS705AgJqdDdhR4F198GJ+X+zA3XhDskhuO4MCyi+87OKPFJ1I0+CriP6hPm6LeICfJvQ0kf5ZGohg1wNgemLWNANC/ilRCvUJWeV+AP3tlfJrUr2PGcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bw1I4NLPuuHJGrNIPep/v61WZblbCB0lzlzAZJKNDvg=;
 b=FiKLkEYGvJmgHKG5hhj7p50Q9BJXB5svqogY62h3GBwaUM7oHMGXkNXCw7Uz6RsELxBxVSO8pO9tDNIh9zYjPPtrnO/97b+ObL3D/h0zRpbKe9kCCNVz5DSCa0VRInCV3yOGW7QbNew3SukS418NZUzu8ot9+f+Cmqde5Cit5E4=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0302MB2809.eurprd03.prod.outlook.com (2603:10a6:3:f1::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.24; Fri, 28 May 2021 15:42:50 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::a88a:6fa9:ab7f:4a44]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::a88a:6fa9:ab7f:4a44%4]) with mapi id 15.20.4173.026; Fri, 28 May 2021
 15:42:49 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
CC:     "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "jonas.gorski@gmail.com" <jonas.gorski@gmail.com>,
        "noltari@gmail.com" <noltari@gmail.com>,
        "michael@walle.cc" <michael@walle.cc>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>
Subject: Re: [PATCH v4 0/3] gpio: gpio-regmap: Support few custom operations
Thread-Topic: [PATCH v4 0/3] gpio: gpio-regmap: Support few custom operations
Thread-Index: AQHXUfTMWdGKRh/nT0q8zsRZfWZU3Kr2XhQAgAG1tuWAAF74AIAAhauAgAAT4QA=
Date:   Fri, 28 May 2021 15:42:49 +0000
Message-ID: <93578f0271fba68429f911c74acc1b7bd5610644.camel@fi.rohmeurope.com>
References: <cover.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
         <CACRpkdaSr_CV1pKS44Ru15AEJ0-1429+6E7Lei2sPHdaijr9iw@mail.gmail.com>
         <0c2a8ffab666ef31f5cee50b8b47767285dfe829.camel@fi.rohmeurope.com>
         <CACRpkdZ2GdrGr8-XnVvf59O4AVBueBjX0PHYGtOeOdGXi=iE4A@mail.gmail.com>
         <15d9e565021c115eec268c7fca810799eb503a90.camel@fi.rohmeurope.com>
         <CAMpxmJVJAX8jPrYg3=jkG4JqEEnUfpexfn+cFKWJQYpdRJaRUA@mail.gmail.com>
In-Reply-To: <CAMpxmJVJAX8jPrYg3=jkG4JqEEnUfpexfn+cFKWJQYpdRJaRUA@mail.gmail.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [2001:14ba:16e2:8300::4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7cb5eb4d-1b2a-4fda-42bb-08d921ef3f86
x-ms-traffictypediagnostic: HE1PR0302MB2809:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0302MB28092F724D2B5E46770D6CFFAD229@HE1PR0302MB2809.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 23ueMbwrgBw/h8MjIDs1OvmJpDfavCHfD8X9Bzohf1pKuB2RR2bbwu3P2+jOuXlglaOWKEDcN4bcNJatEKMjX5HEhkD62huYZbp0w5iAuDtVF1vFivdO1OG9CEnVzSYAWCDnBPuoVE54tcDDndBLujCvGX0nMtN8GiPjfkfw5ppXORWFYTNZlhehq/2o7nv/ajDoCGqq2OXf7HuHFHUID7nY09N8OlrqySfGDg7jobVF2DEybX9OT1P1nmVxvmXup1BNgFTp4i7gD0oEyH7hK4HoLAjNff4e2ik//0gRqb4/J6ig6675Eoz8vywrKAqNTW7GoAilr2x/+hDe3C5x/fvhzJCLQeltrA21elzY6otQpmUOArlmz5vV8HT64E3sZFTn10lANheU7NVlOFcaM3wXVcx1WpbtD8Yu8zNCAqsAoCQy+CjX452q9Ss41W3W3McAU6hjG8BDopaZiqvL3v4n1VfRNWYQrHVuQ7iiVpIMZUv6bYdoZI04e5iMKWJEDRnyPOp68KfB6vlEQfIwDNzdoZn4aSFmyeF828FpKCUtqGSCMqCz9cPQWnTPck7DxfpaBPzqvTHip7CPlkLzAAkY0/V48wAS82tIiIz6U58=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(136003)(5660300002)(3450700001)(2906002)(8936002)(8676002)(508600001)(38100700002)(86362001)(6916009)(6512007)(6486002)(71200400001)(6506007)(53546011)(54906003)(4326008)(186003)(2616005)(122000001)(66446008)(66556008)(76116006)(7416002)(64756008)(66946007)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SFUxZ25XQXk0d28wMXI5M1pkbzFScmVtZEVDeWlRV3plTVAxRTc1U3VSOFVO?=
 =?utf-8?B?cVNKYW5YRkdxa2lRaGFaQ2VidCtkbW4zTlFTb21nR2dDQm1hTGE5MCsxR0Fu?=
 =?utf-8?B?SmxzZ092SHc3MUFXZ0ttL04wYUswa2J3YURTc2dzV1FsZGxFUWhvZjBVQVlp?=
 =?utf-8?B?ZTEwajFudTdFaVhqd2t4VEorT01wYmM1Z21yem5nbnFlZHpDbDVld24wYmJP?=
 =?utf-8?B?enpvN1dxclVMK3A2VVpUNHRXVklhOHE0Mk96YWhrV1VqUGw2aTZ3bHM5ckVN?=
 =?utf-8?B?cC9VT1pkUHFnK2hZRERnUEkxeExwcGNOcnFxSThDbHpTOUdCMW9Tbm1CbXha?=
 =?utf-8?B?ejA1M1JySlRWMzh2bUJQQURiZ0FhaE1SbVhOQitxeWt3WmJYdnJGV2R4cjBD?=
 =?utf-8?B?VktSV0hORnhjcTMrRGVPVDNPVmdqN3lETFNJTHJibmlTVUxHaXVEZSs2dUlm?=
 =?utf-8?B?aEk4bUlsdjhPOGE1c3FzSzgvZERmdWJqMmlTSGJVdTVXbnhFNUVOWS84c25q?=
 =?utf-8?B?NGt2ZmtkcnRsU291NlF0WE4zNXk5WWlueVJLcThUN3h0cHBWb1pOcnZ2RDZl?=
 =?utf-8?B?RGtodks4Q3ZLVXZNVlg2dUJFZ3J4UU40SE9nYi9nVmNhZWZqOEJqSnBXQytx?=
 =?utf-8?B?WmpwS3FPREVoMFRGd09zQmVjL0xLYTI4aDF2ZVhvSkNpMlR5OEdaYVVNVUJi?=
 =?utf-8?B?MXJlaGlOaVhGZHhBZGtEWm9ZcU5qQWIxcnZFeERvQmhFMnZkWVRnWCsvOFlo?=
 =?utf-8?B?Nm1PKzRKS0wySWllS0NXa1BGcWlkaXJwUTVqdTM5RmFTamFLRnMxTkxEWVlG?=
 =?utf-8?B?a0wyNmZrZW1rSFMxTkpUQ1Y2NDdkZWNlTXFTQnF2bXpOem9Pbmt2cVR5VzB0?=
 =?utf-8?B?TTF0S1Jaa05Ka2tZeXExd2lXcnpERFY4TFFDdWV1bmdtRXFTbGxZZFMwTEhG?=
 =?utf-8?B?NW5PMTN6QlREczcxNFM1SFdGRzZ4VDFLb1dYWFlvSUhnQlRnbU52TUI3OCsr?=
 =?utf-8?B?SjRwM2JxUTVXODVyME1PY1dwb3Y2N3FKRkY2bTlmdE9jN0NQbjIxNGFmbkhE?=
 =?utf-8?B?Q2xxaVk4aVdjMHpnQUwwMEFBcnZSb2k5bCtsY09CNVVNdC84K1JxTk1RSzYw?=
 =?utf-8?B?a2RtalFFbnpTbEEzMkJnS2puZzVHZ2hNRm9pOVJYMnBmanViV3FJUlZqN1Ir?=
 =?utf-8?B?VTBxVUhWbGdrOWIyejlvOTdNYmFGcWkza2xtL0E4SXJtcG9NYjBZT3g0K0dn?=
 =?utf-8?B?UDQ5enU3ek52UTFkV1F2S3U3eXFuajduU3ZZdmdBUUxhbndZdjVISnVOdTFy?=
 =?utf-8?B?TjJ4dCt6MWQyc25tRjdSZ2RMbTZaZGczQlA0MDBRNDJteWtEVHN5ZVB3ZmRO?=
 =?utf-8?B?dWdmWWc5akxjZlFWekxDTUp3QzgrTTh3MC9hWEF4YXJHTHRIRm9pVWRSK1lI?=
 =?utf-8?B?bWdVVXNCQkswRHRaendlMEdwaTR2OG5mOEhLcGVEWnlsa0o3NHlGaDFLMW9x?=
 =?utf-8?B?bTVnR2tQSFg2TmlFbHVZRjZwT3h2Wjhlc0Yzc0pqT0ZmdG9xeEc4WXRsaFZr?=
 =?utf-8?B?RXphSjBrT3VJeXhSb1RJQzlZQ0lHSFlZeU5jTU5xZmVZTi9ya2l3a00zRG9w?=
 =?utf-8?B?SXlvdzJsNWNRcGs3bmwzTGZzbjdKK040MkF4djRneUpSTitYdFNpaHVITGJ2?=
 =?utf-8?B?ZTVIcHNQSFpkMUh3a1IxZHdaMFJDdVBnTTNyT1gvNWxVYmdlakZYUVFwdkUw?=
 =?utf-8?B?VDRlSmMzK25SMDNYMGx5eXliSkV5TDZrcW9sR0hSUGxjaHZVSlVuTHJocitl?=
 =?utf-8?Q?etKBxH8rk5ltfNTtBa0Ub9Px8/cr5gW4jzSSo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE6B71AB75D6474D9469566EE56B5048@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb5eb4d-1b2a-4fda-42bb-08d921ef3f86
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2021 15:42:49.4890
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8E1wGESwzLQX6lVDln/OUsZw8O5uuwuCrP0/Jled6WpFi5jR84+9rF34ZV6aQBOZQEOFNuXVfDc/8pQHcNFh9HVw0+DnDCZdc3gKspZa0SaHgloSNHTVto/cVEBPPpvp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2809
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgQmFydG9zeiwNCg0KT24gRnJpLCAyMDIxLTA1LTI4IGF0IDE2OjMxICswMjAwLCBCYXJ0b3N6
IEdvbGFzemV3c2tpIHdyb3RlOg0KPiBPbiBGcmksIE1heSAyOCwgMjAyMSBhdCA4OjMzIEFNIFZh
aXR0aW5lbiwgTWF0dGkNCj4gPE1hdHRpLlZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4gd3Jv
dGU6DQo+IA0KPiBbc25pcF0NCj4gDQo+ID4gPiBXaGF0IG1ha2VzIHRoaW5ncyBlYXN5IGZvciBt
ZSB0byBtYWludGFpbiBpcyBhY3RpdmUgYW5kIGhhcHB5DQo+ID4gPiBkcml2ZXIgbWFpbnRhaW5l
cnMsIHNvIGl0IGlzIHBhcmFtb3VudCB0aGF0IHRoZSBmaWxlIGxvb2tzIHRvDQo+ID4gPiBNaWNo
YWVsDQo+ID4gPiBsaWtlIHNvbWV0aGluZyBoZSB3YW50cyB0byBrZWVwIG1haW50YWluaW5nLiBU
aGlzIHJlbW92ZXMgd29yaw0KPiA+ID4gZnJvbSBtZSBhbmQgQmFydG9zei4NCj4gPiANCj4gPiBJ
IGFncmVlLiBXaGVuIHNvbWVvbmUgdGFrZXMgY2FyZSBvZiBhIGRyaXZlciwgaGUgc2hvdWxkIGJl
IGhhcHB5DQo+ID4gd2l0aA0KPiA+IGl0LiBQZXJpb2QuIEFuZCB0aGFua3MgdG8gTWljaGFlbCBm
b3Igd3JpdGluZyB0aGlzIGRyaXZlciBhbmQNCj4gPiByZXZpZXdpbmcNCj4gPiB0aGUgcGF0Y2hl
cy4gUmV2aWV3aW5nIGlzIGhhcmQgd29yay4NCj4gPiANCj4gPiBPbiB0aGUgb3RoZXIgaGFuZCwg
SSBkb24ndCBlbmpveSB3cml0aW5nIGNvZGUgSSBhbSB1bmhhcHB5IHdpdGgNCj4gPiBlaXRoZXIu
DQo+ID4gQW5kIGFzIHRoaXMgcGFydGljdWxhciBwaWVjZSBvZiBjb2RlIGlzIG5vdCBhIHBhaWQg
dGFzayBmb3IgbWUsIEkNCj4gPiBkbw0KPiA+IHRoaXMgZm9yIGZ1bi4gZ3Bpby1yZWdtYXAgaXMg
bm90IG1hbmRhdG9yeSBmb3IgbXkgZHJpdmVycyBub3cuIFNvLA0KPiA+IEknbGwNCj4gPiBqdXN0
IG9wdC1vdXQgZnJvbSB0aGlzIGNoYW5nZS4gSSdsbCBoYXBwaWx5IHVzZSB0aGUgZ3Bpby1yZWdt
YXANCj4gPiB3aGVyZQ0KPiA+IGl0IGZpdHMsIHdoZW4gaXQgZml0cy4NCj4gPiANCj4gDQo+IEkg
dGFrZSBpdCB0aGF0IHBhdGggMi8zIGlzIHN0aWxsIGdvb2QgdG8gZ28/DQoNCkkgZG9uJ3QgdGhp
bmsgaXQgaGFkIGV4cGxpY2l0IGFjayBmcm9tIE1pY2hhZWwgeWV0IC0gYnV0IEkgdGhpbmsgaXQg
d2FzDQpub3Qgb2JqZWN0ZWQgZWl0aGVyLiBJIGNhbiByZXNwaW4gaXQgYWxvbmUgaWYgbmVlZGVk
IGJ1dCB3b3VsZCBoZWxwIG1lDQppZiB5b3UganVzdCBwaWNrIGl0IGZyb20gdGhpcyBzZXJpZXMg
KGFzc3VtaW5nIGl0J3MgT2sgZm9yIG90aGVycykuDQoNCkJlc3QgUmVnYXJkcw0KCU1hdHRpIFZh
aXR0aW5lbg0K
