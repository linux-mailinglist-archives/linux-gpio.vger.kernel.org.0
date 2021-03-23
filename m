Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 870CD345B77
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 10:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbhCWJ5m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 05:57:42 -0400
Received: from mail-vi1eur05on2052.outbound.protection.outlook.com ([40.107.21.52]:49888
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229448AbhCWJ5H (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Mar 2021 05:57:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nrg9Z0Hhffa4tNJDa6rpQOgW2nxEMeU1DSyGfdXrCbGy1KZmskSGNsXP0LNi9wgQx0jQdKYNI7LB8CTA82bKN0ZwxRS24MXiQsSl0vnU0GFhzVkqwGW0CtTXf+gfuQD1ArB90v0Xa2hTSOqFWIu0pAKNZpxdOKN7imXHM4dS6AfU9Yk/+PP23qZ9X5ztkt0Jkj4gm5tj+4MjVjKuoEkO4JbFo4hpQ/7VvPnYCijL3A6kuoJLoKOJ4sgc8RflNfhbhqysg+cTcwM9aK5mSPdQiY7GpJU8mtSLcLjmafzYURpduwVsxDi+X1EfGFIXx38ZGpFX5HLIwiwgNP8vVF70mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yd3z2rKK+xdnyzNqsWY7YtiZNDxvoGyw+xDpe2dJZeY=;
 b=BAugt4/+k9mJQovKoS3hsXTscgVPRN253SofJ89teOqcYk44A2QGF70BHJKVBBlhKnAmkFfoRxZdbhyJGW4XVsj/mddXUgv6Pfww+O33MLSX30rUZqZry8mPt5M2nfisSvA1nGZyKdI2x4FM2m+uMYrso7Hzii1k9YW3jc+7G0BW6lqky6PL263DfaTUe8136qlWZd2PocnVo0FGxbOAjimWvSIIHRUBkjKXEw8MfwzlE5mYo3bzkfXL25ET4+h98VxAx6WzsqMxaOG/pGORGXiLOFZj/qSwA2AKUsP4UV9FsBZtkd6TnVQm/SMN+j8BhpM7Qq+148PBXHiWOk5upw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yd3z2rKK+xdnyzNqsWY7YtiZNDxvoGyw+xDpe2dJZeY=;
 b=UF/2lGpwht2GDpr5C1MkNNLMQHaFWsnOxQ8xIm+lK07pIecd3kHVxeLZo2wQd3pm5f1kVm/xgE2OgA6q7FC7CUAW0HJ1q83uPsa/RC5/yuTb4U4dR66Kng/+sLll6TDFFoa/LkD/I+vhn+8n85zLSnOqau5hA5QA51POCEyrV4k=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2393.eurprd03.prod.outlook.com (2603:10a6:3:68::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18; Tue, 23 Mar 2021 09:57:03 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f4d0:ee66:d5fb:9cdd]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f4d0:ee66:d5fb:9cdd%3]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 09:57:03 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 10/17] gpio: support ROHM BD71815 GPOs
Thread-Topic: [PATCH v2 10/17] gpio: support ROHM BD71815 GPOs
Thread-Index: AQHW7jP1aCOdIjy6aUiaKgV7fuUEzqouyhYAgGLvQAA=
Date:   Tue, 23 Mar 2021 09:57:03 +0000
Message-ID: <afaff71f75cd476c828671779acd1a3f8b66b62c.camel@fi.rohmeurope.com>
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
         <50f72f1f7f28e969a1e0353712fcc530bce9dd06.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
         <CAMpxmJVjnAMig16qWkjpaHwQ+4Ld9yEc-gg-CGv28QQYBB6gNg@mail.gmail.com>
In-Reply-To: <CAMpxmJVjnAMig16qWkjpaHwQ+4Ld9yEc-gg-CGv28QQYBB6gNg@mail.gmail.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [2001:14ba:16e2:8300::2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11e102c9-2757-43c6-61c3-08d8ede202c3
x-ms-traffictypediagnostic: HE1PR0301MB2393:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB23931200BAAFD518F8A180BDAD649@HE1PR0301MB2393.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C9s1tMMnjUOAYkOWMpeZkXvog1hoHFGR5bmrOhFW8+nYwXDKA9DFPBXmk/QF9QcPNDvtDzlxlnF3H6pxQ8HPNj3/dVjdf2iyUzt115SCsUIPj24ypSA/nVo5ZoVISe/6bTOZLaavE/gP8MafOdRNvEX9OcH2R08JDYNqsC03gunXNGbNNNSO6KPgoXwIKOJVj7BbDQGyXGX8PEWsyqUtmfz6wm7yPAbp5zZrotohumRfvIZz5aT/XzpxnIRQJmR0r1wAjUh06xhPQ11nX3QL1M9ktpDZRagAuIT7FOF5mHq8kfmEpAi5ETjnXCrE2lOmheMav4ehIu3jpD4B+a6/GZlG3TQLtmegDDLyql8sVTAQHSju6Sg8vi+vbmqs6TYH0wmcdRxnvGDDoKbqgUjDF59nt3zV63D/OkN+hOAIHcY2rnwpJimWpUkRoAa99kU74yIro5xhRZkSU3/okpDJfKMWzAQ/Y5kqfdOjhLHcYp8CSxU/tOjjRAp88xWfxdC+B5N9GJzcXvDvsup+JLTdFZ37Qxb5K+jSY2cEA7iLhTcdj4IF3qYk5b5fGKDZ17VQE3swZoJgn24kVnrcmeFF4jyB+woibjKYjAdlA7IzgP7nKX3Mzt+yQPrODLm7IbdNGATbBKvCO5QrWijtb1MXnIXQ6RewNVfzzz14hhGZU5U=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39850400004)(6506007)(53546011)(4326008)(7416002)(6512007)(3450700001)(76116006)(66946007)(6916009)(186003)(66556008)(2906002)(8936002)(64756008)(71200400001)(8676002)(478600001)(2616005)(6486002)(66446008)(38100700001)(86362001)(316002)(4744005)(5660300002)(66476007)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?L0EvbmRtVDIrYVBtSjVrVDg5Q2tQYmtHZ3ZVWlhxbHp0cGpqT1FuTnNpWWhz?=
 =?utf-8?B?VHpNeHdLZG9IOXRpTE9VLzJCZHUzNjFiM0xJRkxrZjVYdE5pWjc2ck5uQlBM?=
 =?utf-8?B?clVIQmNxT1B5NEJIZklKQU42R2swdUozdm9TL0dETnVKcGJGT3BORFczWk9w?=
 =?utf-8?B?VFFBaXlMWUxPZHdueEJWcnFUeGdMSHpLMGJrTHZUc2U3OEdWTXJvQVR5Qmp6?=
 =?utf-8?B?MUpjZFlaUWE4MzFXNVp3WE9JdVptVk1IVmZZa2tHS2NvaDhpSHlUeGlUVUlR?=
 =?utf-8?B?UnZCQ2JaTEFGTU1LRkxHR2hJM2NBM2syek5OYXBpQnAvOU9ScGhYSDBYazBh?=
 =?utf-8?B?UUNrVUtic3BYenZYU05VWHJDcmh5OGJLa2xxSDhVMHo5UkwwTXI0bjdzVSsx?=
 =?utf-8?B?Y0RhOE1XcUo5Z0RtZUhaamJITkFnOUd0UUVxcUlhdCtURkhHQjJEYmY0VDB2?=
 =?utf-8?B?RXI4WWZJWitUQWR3aktSdzB2bHRqSkVseWM0MXVGYkFWcGtVMjRncW1DaWhq?=
 =?utf-8?B?akJ6VXhOZWQwT3ZFOFNYZkxJQVRMKzR3anpGUS9oRjFvVEtrdjNnMk5WNy9p?=
 =?utf-8?B?Rzk0RG05UThVdnUycndVa3c1aTFsYmZaSTB4elFyT0ZUSzBXeGl4S2crcExC?=
 =?utf-8?B?bHdIMk91ajFyL1E2Q0kyQ2xBYWJyM3hRM1puMXN2cVJMYTlDUmxBbG1STkhj?=
 =?utf-8?B?azJ4QWlwZmdUa2lDWHMzWi9LbkFsTEFhekc2aHBEY1pTa1hLVkpyRFphdWNK?=
 =?utf-8?B?R3lWRXdJVnV6Y294STl5QXlBTHAyUUpnNXRJcEtvVGgwTnpXUlhMVHZVa1A1?=
 =?utf-8?B?NjFJSlJlUHArTHpTcjdHcEpGS1NGYWdxUWxTc3VTZXFBZ0s3TDhpZXorTElE?=
 =?utf-8?B?YXZWVU5BTnZFRXIyU1N2YUozVWNFcHdOajVRd1ZuNGw3czhNMFdOL2dQRzEv?=
 =?utf-8?B?bGJ5ejNkVUJWTzYzNTM2UHNvSllwakRFK2JnQ1lXYXJVKytXa3NUb1BUSDZI?=
 =?utf-8?B?c1NQeEVKQnQ2N1A4YmdjVGV4aVVsczJBc3R0UUpQcGVETENmeWI4OFNMTWhh?=
 =?utf-8?B?UjVNQmNzTXp1VkVtYnU3WUl1YWlKaGhheHVWN253ZUx3eWtMeCtxYzJZZEJo?=
 =?utf-8?B?VnpXeElKMUlrTURiWE5RVFRFWFhmYzgyd0doeVhaY3hBdWdETVF6c0psRWZE?=
 =?utf-8?B?eTRRZlJUVG1rd09IdkFQRzJLMkFuaDNaTHBWZnZlbythTkw3SzlzajdMdTF3?=
 =?utf-8?B?cmxXKzJMMVJFMU51SFAvZU5aeTM1KzlEQXVlQzh0b1F6NWpkMDE1c2dlU0NJ?=
 =?utf-8?B?TEIwblpTbXRFenRWbklnTnNtRFZiR2ZRd0JrMXJ2K2twcE1ScGRnSytZbmZG?=
 =?utf-8?B?VHJhUnFkeHVQSGpSYWRhaE90UkpDQlh0RTNxNjFjdmZ0OFdyYVFDcmIzL1Rq?=
 =?utf-8?B?Mk1HNS92UzZ5czZTbjAwaW9YR1hzK1FRVDJ3MkE3OU13K3JOR3R5WTh2M2Mr?=
 =?utf-8?B?L3BQY0UvV0xXMHVWWVFHVHVodmdmRGR2TDc0aUppMm9SL21UY3FvSTVJN1Nt?=
 =?utf-8?B?ZlFPcTNmMVBTWnVoZndIMnNWNy9JRUJlUUxvVzBmZDh1K0c2cU5nUXVvU3dK?=
 =?utf-8?B?SVJXQzVwbS9ObTBNK1FvTnNUdlN6NWp4L0JkUWpKbHB6b0k0c0RCd1NwQ0Rp?=
 =?utf-8?B?aEhrdDk4Q0JLN3JpYnNrZFFHSDRFSFZUeWNvWjVzcHc0MUpNdVJoZ2xZUXAx?=
 =?utf-8?B?WThrY3p6d0c3K0szam5sdTJkaVRITktZNFExUHlkN2ZjeHN0QllVNk1CMlFn?=
 =?utf-8?Q?kda/AslAi9J75REqkm1OKOXziXqGAZYBevHJc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4855FB3848B2F4F8B3A345BAA7895D8@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e102c9-2757-43c6-61c3-08d8ede202c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2021 09:57:03.5747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hzZJdPp0rOHPuTMs4JJyq+bUth54A7UD8sO3TdYKAcD80Gj00pXlRIWUZ/4s3Cg8q8EnhD81wTk+BTWdplS8wor8/ZDJ1vzixGbK3krZWO2NGL7UJePCeTQSjP+qHfJe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2393
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBUdWUsIDIwMjEtMDEtMTkgYXQgMTI6MDcgKzAxMDAsIEJhcnRvc3ogR29sYXN6ZXdza2kg
d3JvdGU6DQo+IE9uIFR1ZSwgSmFuIDE5LCAyMDIxIGF0IDg6MjMgQU0gTWF0dGkgVmFpdHRpbmVu
DQo+IDxtYXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+IHdyb3RlOg0KPiA+IFN1cHBv
cnQgR1BPKHMpIGZvdW5kIGZyb20gUk9ITSBCRDcxODE1IHBvd2VyIG1hbmFnZW1lbnQgSUMuIFRo
ZSBJQw0KPiA+IGhhcyB0d28NCj4gPiBHUE8gcGlucyBidXQgb25seSBvbmUgaXMgcHJvcGVybHkg
ZG9jdW1lbnRlZCBpbiBkYXRhLXNoZWV0LiBUaGUNCj4gPiBkcml2ZXINCj4gPiBleHBvc2VzIGJ5
IGRlZmF1bHQgb25seSB0aGUgZG9jdW1lbnRlZCBHUE8uIFRoZSBzZWNvbmQgR1BPIGlzDQo+ID4g
Y29ubmVjdGVkIHRvDQo+ID4gRTUgcGluIGFuZCBpcyBtYXJrZWQgYXMgR05EIGluIGRhdGEtc2hl
ZXQuIENvbnRyb2wgZm9yIHRoaXMNCj4gPiB1bmRvY3VtZW50ZWQNCj4gPiBwaW4gY2FuIGJlIGVu
YWJsZWQgdXNpbmcgYSBzcGVjaWFsIERUIHByb3BlcnR5Lg0KPiA+IA0KPiA+IFRoaXMgZHJpdmVy
IGlzIGRlcml2ZWQgZnJvbSB3b3JrIGJ5IFBldGVyIFlhbmcgPA0KPiA+IHlhbmdsc2hAZW1iZXN0
LXRlY2guY29tPg0KPiA+IGFsdGhvdWdoIG5vdCBzbyBtdWNoIG9mIG9yaWdpbmFsIGlzIGxlZnQu
DQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTWF0dGkgVmFpdHRpbmVuIDxtYXR0aS52YWl0dGlu
ZW5AZmkucm9obWV1cm9wZS5jb20+DQo+IA0KPiBIaSBNYXR0aSwNCj4gDQo+IGxvb2tzIGdyZWF0
LCBqdXN0IGEgY291cGxlIG5pdHMuDQoNCkhlbGxvIEJhcnRvc3osDQoNCkkgdGhpbmsgZml4ZWQg
YWxsIHRoZSBuaXRzIHRvIHYzLiBDYW4gSSB0cmFuc2xhdGUgdGhpcyB0byBhbiBhY2s/IChJDQp3
aWxsIHJlc3BpbiB0aGUgc2VyaWVzIGFzIEkgZ3Vlc3MgdGhlIHJlZ3VsYXRvciBwYXJ0IG1heSBo
YXZlIGZhbGxlbg0KdGhyb3VnaCB0aGUgY3JhY2tzIHNvIEknZCBsaWtlIHRvIGFkZCB0aGUgcmVs
ZXZhbnQgYWNrcyA6XSApDQoNCkJlc3QgUmVnYXJkcw0KCU1hdHRpIFZhaXR0aW5lbg0K
