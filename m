Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F29B2F0D2A
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 08:29:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727269AbhAKH1E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 02:27:04 -0500
Received: from mail-eopbgr00054.outbound.protection.outlook.com ([40.107.0.54]:46788
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725897AbhAKH1E (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 11 Jan 2021 02:27:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afVAOD90K3SSh8uV4d3kbV8YYJwq23357upFEX4Z6kkeztD88CvTO3RpLc/s/UFYib4Q16RdGBMZyXsz1kRRhV/CH/K6HyAeV9dpqB/uQQT4XxoVCKbMP031gXzO+aoD+rT//j+cCEzeWl9JrhVfAXJt3Mw9QBTpGd+4zE8b7Mu4bzgAAUiHndgdgGJDUF7cIt8AxZ6yLGIgslkko37Qi8FMFtZOscnOGlrLcbM5dILKTibnU1WcBUpFLkB2gA7ufum3I7ZFb0gXfuCpEvC2pYRpSHC4a46SV1Ed59hBi2rj1aqcXFvE+vUxYZqc0oR3e5YeyoUxwIHnFu3hFFXUdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyltUWA16Y1XK0wsowf/hdOQD1NEHBQsg5joADjU+aA=;
 b=hvuaBW0sLcpurS/KD/aGXrmbgHtyCsmLGLO7a2JH2vXxzLXPByM3Y09wiOb7GZCYHhitBBiqPcAKNmAERAFbmwP4Wp5LlR/4zNvpJGruVBXQEYMEluqIKWU99mKd4ai80hSRtaljMdBXMNNreDKoAG6j0jAkvx0U0kBsoszJxhud4z9LQu9PEAXQXKVoJ3AJQD8qIfgYuzAhWO+y0EEhqrX9SHDtV4P/nWSGYGRRUgNmRTDif5OFuvay9jfohKC0V5huH3pYHqmbE8YdZ1x8NdvoQQXlOi8rCpuocoMdpkzG58ui1VBFC/4y+zARvfpn1qxFXGN88/AHvTRhLQ+omg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyltUWA16Y1XK0wsowf/hdOQD1NEHBQsg5joADjU+aA=;
 b=ZN5mSp19iega8zoyV9wC3/6S9dPNiVB2yAKntvuZgWsix+IByPmjJ1JPSMBRB0sV03Z3CS5ilKWU5xefdu2uqPeAaTWuchyGqYxDswCPaEZEDGZz1OYQ/7DiubU+wQZnLzQr1ftdcA85W4cJcCYFvcZjGoPa3PyQ0KLv8l7q3E4=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2281.eurprd03.prod.outlook.com (2603:10a6:3:22::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.8; Mon, 11 Jan 2021 07:26:13 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::6558:57bb:5293:f3d3]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::6558:57bb:5293:f3d3%3]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 07:26:13 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
Subject: Re: [PATCH 09/15] gpio: support ROHM BD71815 GPOs
Thread-Topic: [PATCH 09/15] gpio: support ROHM BD71815 GPOs
Thread-Index: AQHW5cO9yEI6D70rRkiVC0B0L8VULqoedgUAgAOA2wCAABOrAA==
Date:   Mon, 11 Jan 2021 07:26:13 +0000
Message-ID: <2fc1c3310c8af9d0a07858f4624b12ed57303d78.camel@fi.rohmeurope.com>
References: <cover.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
         <e7c5919cc0d95aca09807a828fe3c0018af8828b.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
         <CACRpkdb4CW0D86dmEOjtuFpTcO2oUZC50MhNQQtfoEQT7G_PFQ@mail.gmail.com>
         <c098c546f3051c52fa6d55b42fe3e22423520597.camel@fi.rohmeurope.com>
In-Reply-To: <c098c546f3051c52fa6d55b42fe3e22423520597.camel@fi.rohmeurope.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ccd4ac13-1aac-4a33-c7a0-08d8b6022d27
x-ms-traffictypediagnostic: HE1PR0301MB2281:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB22811E57F3F548C5EB0B4B53ADAB0@HE1PR0301MB2281.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c8909Jbx5DW9RfxgffbNmI8jfw9zfQ9rO1rzUITmAuAYaDgBBGlL8rRaiDMObpQEIqnZFEql6N6qZmTa9n6Ed5fIsMm6YzyjQLrCVmBGquaDKcLLBdQc7leAAtHPe2pKfVFJXhPWgA/Zff3KXBzipYX2YLfb5yn0OnR9GA4CZjIOMmxdJd0SAVYpU+LcQsIch3KgVmM5vBV4NUbUyDGaNYP2r7qsv5VvCxBGC8E7UkkAG9TQGEpuF7h8zwjC92CCNCddYPtiiR2clVNw7hBxDzL4cjvxzeIPjD+ajXoFDJaKsaPutFLT3RNvmdjgU2wpdkNv48mQwa3fS3Lx8gqB6ogBebXvjfrF1kHcf455xbbVTqcWqzbQrortbnCJgzHXBVuaaTSXCM4FFp9QjHZKGw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39830400003)(366004)(396003)(136003)(66556008)(66946007)(6486002)(66446008)(76116006)(66476007)(5660300002)(6916009)(86362001)(8676002)(64756008)(83380400001)(54906003)(4326008)(2906002)(3450700001)(186003)(71200400001)(2616005)(316002)(6512007)(6506007)(53546011)(26005)(8936002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?MDNYSG42VUFzL2dQc1V0RzRxR0VTYmhrZllYT0J6TWdJTlNNY1l0UE56UzBy?=
 =?utf-8?B?ZzlJZ3VtdDIybDdYVzl4aWFISDNhV0lJY3BUMWN0NkEwVE1TS1piNHpEdUN6?=
 =?utf-8?B?ZTZrSTNvQTBTbDJ0cWtWZy9VejA1b1oxZXhqekR0RkpLdmZDQy9TZ1FSVG1v?=
 =?utf-8?B?eGFra3pDRGdGL0JsRVNxRUorMk9CTmpBV3c4Ynozb0txazRjblJ5MlVRbFVX?=
 =?utf-8?B?UFB0SU1hWkFpbFRTYWdIeUpqazc4bDZaR1RONlBORjFYNHYzVWZVcUl0NnZX?=
 =?utf-8?B?cDJOS0ZxSkRTL3ZFVmdEdVd5cmtnUTZFRlVjTktwZUNyaXpWYUs4SHlvZFlF?=
 =?utf-8?B?ZHRYNUJYYWJYMUlMY1psVEJFdGt5d3JmbENJSElqMHFEZnZYZHlnQk9xQmJh?=
 =?utf-8?B?QkZaRGxDLzZaUGh1azlvd3ZMbnhuelp1bzVNc3B4R2NzZjFxL0lzMWs4eWNt?=
 =?utf-8?B?ZWtMYktLSTI5U2NPZ25jV1Q5NUtQYWtIbFhBdW8yR1Z2VTZKQWRPLzU1RlpW?=
 =?utf-8?B?RkpXaGx1bHlmbVFkNU1SYnU5d0l0Z1lOTWFZM09tbHFwU3hjbUp2Tk9kTjJn?=
 =?utf-8?B?MTBNWEhxRmQwMVliSTV1VmdKNE96aTFzNFo1MmZ1eURlUkFVL3JRbFhQbFZr?=
 =?utf-8?B?OTNNNTJ3a3ZGL0U2SGQyS01JUlBRWGNoWHVHdFcvVXVsTndVMXJ4dk93MjFU?=
 =?utf-8?B?VXhoUFYvVys5R3BoNVl5SmhRODJ2SmxHcEpXWHhhb2Zlbk0vL1RUcTZRZ3dK?=
 =?utf-8?B?M2xXTGYvdVl3RFJHUlRjbDZHcE13cHlMSmpnejlBMUdPcEdyK25GZTBsTS9R?=
 =?utf-8?B?aVNqTG5JUW8yQmN2clNveTB3b0dnZUpQa3EwTTZoZmpWeUl0VE9tUEZQUlZk?=
 =?utf-8?B?Z01ENzRYQjB6OTF5OHVmOVlSaWZ3RTJzMTBsaWpvK2Z6ZFh3REZyYS82UFJD?=
 =?utf-8?B?WEJGNkFlVjErRjA1d3NNaXk0K0lQRHdMdUNFMTlMMFRPczBocjZjazJIL1Rx?=
 =?utf-8?B?Z3dCUnlUWGd2SlpRSWtmM0RKRDFIQTIvemx2RExMWE0xY2RYME1ER29KQU5G?=
 =?utf-8?B?bWFGVGN6ZlZtNzlKV3QzU0VLRVQyVWNhM2Y2MEVmNmdSQnlPaXhyci9sK29Q?=
 =?utf-8?B?NjM2M2l6c3Y0Vk5SWmdIek1qei9FUlhFNzFZSEtMRUl1Z1V5Z3RUNzNKL0wv?=
 =?utf-8?B?Y2h2OVU4aEZxaXNzLzRQQVFGYTQyN2JnV2IyUHZtR2VPVmhIUXdzMjlnMzhN?=
 =?utf-8?B?Z01Nb3ZwRHdNY0RWSitidkY0UGlnMWNrUVl6K000Z1htbzFSUjc1dVk2UkQy?=
 =?utf-8?Q?gNMK5Y58V992ZF5A+Cu+FNce+N4Il6kV/6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D31C5DC6BE4A044EAAE35E6E921E3107@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd4ac13-1aac-4a33-c7a0-08d8b6022d27
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2021 07:26:13.5447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jAyuhdx5Xhf80Dpd0HuX+rl2Sjle+5/m+OCRnZ1Z4FzkabVm8Qk5Xl20KdXArStz0KFFfvryUUuNK0uwtyxWt7BXQQn80fypfYyfHF8aJh9etXbqaW2B8mmOZXwGr9bD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2281
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBNb24sIDIwMjEtMDEtMTEgYXQgMDg6MTUgKzAyMDAsIE1hdHRpIFZhaXR0aW5lbiB3cm90
ZToNCj4gT24gU2F0LCAyMDIxLTAxLTA5IGF0IDAxOjQ1ICswMTAwLCBMaW51cyBXYWxsZWlqIHdy
b3RlOg0KPiA+IE9uIEZyaSwgSmFuIDgsIDIwMjEgYXQgMjozOSBQTSBNYXR0aSBWYWl0dGluZW4N
Cj4gPiA8bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPiB3cm90ZToNCj4gPiANCj4g
PiA+IFN1cHBvcnQgR1BPKHMpIGZvdW5kIGZyb20gUk9ITSBCRDcxODE1IHBvd2VyIG1hbmFnZW1l
bnQgSUMuIFRoZQ0KPiA+ID4gSUMNCj4gPiA+IGhhcyB0d28NCj4gPiA+IEdQTyBwaW5zIGJ1dCBv
bmx5IG9uZSBpcyBwcm9wZXJseSBkb2N1bWVudGVkIGluIGRhdGEtc2hlZXQuIFRoZQ0KPiA+ID4g
ZHJpdmVyDQo+ID4gPiBleHBvc2VzIGJ5IGRlZmF1bHQgb25seSB0aGUgZG9jdW1lbnRlZCBHUE8u
IFRoZSBzZWNvbmQgR1BPIGlzDQo+ID4gPiBjb25uZWN0ZWQgdG8NCj4gPiA+IEU1IHBpbiBhbmQg
aXMgbWFya2VkIGFzIEdORCBpbiBkYXRhLXNoZWV0LiBDb250cm9sIGZvciB0aGlzDQo+ID4gPiB1
bmRvY3VtZW50ZWQNCj4gPiA+IHBpbiBjYW4gYmUgZW5hYmxlZCB1c2luZyBhIHNwZWNpYWwgRFQg
cHJvcGVydHkuDQo+ID4gPiANCj4gPiA+IFRoaXMgZHJpdmVyIGlzIGRlcml2ZWQgZnJvbSB3b3Jr
IGJ5IFBldGVyIFlhbmcgPA0KPiA+ID4geWFuZ2xzaEBlbWJlc3QtdGVjaC5jb20+DQo+ID4gPiBh
bHRob3VnaCBub3Qgc28gbXVjaCBvZiBvcmlnaW5hbCBpcyBsZWZ0Lg0KPiA+ID4gDQo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBNYXR0aSBWYWl0dGluZW4gPG1hdHRpLnZhaXR0aW5lbkBmaS5yb2htZXVy
b3BlLmNvbQ0KPiA+ID4gPg0KDQovLyBTbmlwDQoNCj4gPiA+ICsgICAgICAgZy0+Y2hpcC5wYXJl
bnQgPSBwZGV2LT5kZXYucGFyZW50Ow0KPiA+ID4gKyAgICAgICBnLT5jaGlwLm9mX25vZGUgPSBw
ZGV2LT5kZXYucGFyZW50LT5vZl9ub2RlOw0KPiA+ID4gKyAgICAgICBnLT5yZWdtYXAgPSBkZXZf
Z2V0X3JlZ21hcChwZGV2LT5kZXYucGFyZW50LCBOVUxMKTsNCj4gPiA+ICsgICAgICAgZy0+ZGV2
ID0gJnBkZXYtPmRldjsNCj4gPiA+ICsNCj4gPiA+ICsgICAgICAgcmV0ID0gZGV2bV9ncGlvY2hp
cF9hZGRfZGF0YSgmcGRldi0+ZGV2LCAmZy0+Y2hpcCwgZyk7DQo+ID4gPiArICAgICAgIGlmIChy
ZXQgPCAwKSB7DQo+ID4gPiArICAgICAgICAgICAgICAgZGV2X2VycigmcGRldi0+ZGV2LCAiY291
bGQgbm90IHJlZ2lzdGVyIGdwaW9jaGlwLA0KPiA+ID4gJWRcbiIsIHJldCk7DQo+ID4gPiArICAg
ICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiA+ICsgICAgICAgfQ0KPiA+IA0KPiA+IEl0J3Mg
YSBiaXQgY29uZnVzaW5nIGhvdyB5b3UgdXNlIHBkZXYtPmRldi5wYXJlbnQgZm9yIHNvbWUgc3R1
ZmYNCj4gPiBhbmQgJnBkZXYtPmRldiBmb3Igc29tZS4NCj4gPiANCj4gPiBXaGF0IGFib3V0IGFz
c2luZ2luZw0KPiA+IA0KPiA+IHN0cnVjdCBkZXZpY2UgKmRldiA9IHBkZXYtPmRldi5wYXJlbnQ7
DQo+ID4gDQo+ID4gYW5kIHVzZSBkZXYgZm9yIGFsbCB0aGUgY2FsbHMsIGl0IGxvb2tzIGxpa2Ug
aXQnZCB3b3JrIGZpbmUuDQo+IA0KPiBJIHdvdWxkbid0IGJpbmQgdGhlIGxpZmV0aW1lIG9mIGRl
dm0gZnVuY3Rpb25zIHRvIHRoZSBwYXJlbnQgZGV2aWNlLg0KPiBJDQo+IGFtIG5vdCBzdXJlIGlm
IGl0IHdvdWxkIHdvcmsgLSB3aGF0IGhhcHBlbnMgd2UgYmluZCBsaWZldGltZSBvZiBYWCB0bw0K
PiBwYXJlbnQgZGV2aWNlIC0gYW5kIG5leHQgY2FsbCBhdCBwcm9iZSBmYWlscyAoZm9yIGV4YW1w
bGUgd2l0aA0KPiBERUZFUlJFRD8pIEkgX2Fzc3VtZV8gdGhlIFhYIGJvdW5kIHRvIHBhcmVudCBp
cyBub3QgcmVsZWFzZWQ/DQo+IChQbGVhc2UsDQo+IGRvIGNvcnJlY3QgbWUgaWYgSSBhbSB3cm9u
ZyEpDQoNCi8qDQogKiBCaW5kIGRldm0gbGlmZXRpbWUgdG8gdGhpcyBwbGF0Zm9ybSBkZXZpY2Ug
PT4gdXNlIGRldiBmb3IgZGV2bS4NCiAqIGFsc28gdGhlIHByaW50cyBzaG91bGQgb3JpZ2luYXRl
IGZyb20gdGhpcyBkZXZpY2UuDQogKi8NCmRldiA9ICZwZGV2LT5kZXY7DQovKiBUaGUgZGV2aWNl
LXRyZWUgYW5kIHJlZ21hcCBjb21lIGZyb20gTUZEID0+IHVzZSBwYXJlbnQgZm9yIHRoYXQgKi8N
CnBhcmVudCA9IGRldi0+cGFyZW50Ow0KDQpNYXliZSBhZGRpbmcgZGV2IGFuZCBwYXJlbnQgdmFy
aWFibGVzICsgY29tbWVudHMgd291bGQgY2xlYXIgaXQgdXA/DQoNCg0KQnIsDQoJTWF0dGkgVmFp
dHRpbmVuDQo=
