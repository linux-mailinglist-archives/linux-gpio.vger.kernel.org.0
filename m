Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB292DBBBD
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 07:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbgLPG4n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 01:56:43 -0500
Received: from mail-eopbgr150058.outbound.protection.outlook.com ([40.107.15.58]:29957
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725947AbgLPG4n (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Dec 2020 01:56:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XGYHonltKEoykezCzZ481MwlbDM1bQ2HGKeGU1Gd9vlJePOgHJT6KSyuX96rwLWx2qmOsCyaVyuATJsc4k8Tbp9MSK7noGyVtTiKv9iXjH3x8BJI5uL+xABP94eVQjfcQAigL21pOrLFVavd9yoUNUl2LyU78Z/b9rZFdGXcDKLL7uV7tjP6KQQXUndrN/tAhT73acmFPBW4D8x3dAwFAFAdPm54C/MOF90wEdNqtHt+tricr8Vhmgd4XOSf6sd5JgT8yqTTFzYecY3KAu9QOgrxSpkXJO8mn7Gtj0GrauY0Y3dfh9XlYIHMTdFLkGo2Z8sVq1ezuVpTFmTlRmTxRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huzos8o/1Tqfh5l7GcPsLeg4jrYuM4SIeKbZUBMDyqU=;
 b=gcL5K58VNTe4dRtXLRDiixoyfEgUwvsMP3LZRZ0Xd6rivfIEzPwAsidtmxDjFXe4i8F6jy7CTNgWDQfxdSAMY076zBpJwueqjmRQQXD5gKSEYQAiez4vkecmmtoJW/dta1J+bZlMmG6pyzrzK1L/lIgM6IAB/Pr8JtO5keFwBqwShmku+2h9GR8K9PPGZ+UK0l3JI3DM9mWfP/cFwS4vMD54TE5i1QY/Nm6KQ4pokynoXwdOcWuZ87BNGHuq4xLL/JMRFZq0zsiIVAEpBDA9bxfcMovL3bd/4U7SmMkGX03/20r0GYjvBbD3+dsvO44d5SzyDh+kmY68Omwat+I9QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huzos8o/1Tqfh5l7GcPsLeg4jrYuM4SIeKbZUBMDyqU=;
 b=ot92p/H9qwsjAqzrD0mU4qYvYtQh3/iUfNcHYULDgAsW1+PMku1M2YIJ7wbTtS/BneSyzuMrmq7wRJXfGu1DswDm+LalooXLVzwpoO5q+HWpl5luLrEB0Ga6R72vWxA0MUxXyKeNaxXlXGOeGOO5GYxcKnxjSbpKxt1x6+q2ens=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0302MB2665.eurprd03.prod.outlook.com (2603:10a6:3:f0::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.13; Wed, 16 Dec 2020 06:55:52 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87%7]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 06:55:52 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>
CC:     "khiem.nguyen.xt@renesas.com" <khiem.nguyen.xt@renesas.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH v2 03/10] regulator: bd9571mwv: rid of using struct
 bd9571mwv
Thread-Topic: [PATCH v2 03/10] regulator: bd9571mwv: rid of using struct
 bd9571mwv
Thread-Index: AQHWz7CxfZ5oTbAwpEyuKA+JrO+HVKnxyvwAgAaNCwCAAALugIAAp9sAgAA/NgCAAAhTAIAABzmA
Date:   Wed, 16 Dec 2020 06:55:51 +0000
Message-ID: <8f390a4e24aea0163d1756c1df11e213f75f3269.camel@fi.rohmeurope.com>
References: <1607686060-17448-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1607686060-17448-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <cbb8c9b1884ea5e535bcafda1218b941bd665c21.camel@fi.rohmeurope.com>
         <CAMuHMdVgo1fuY9jPpxUJiCOmN4Ahs7YXddzUfKH+4106i1xiuA@mail.gmail.com>
         <CAMuHMdWuoRMsNMPKgni3HENRT7RnCTyEjs5Zy2r4gw9f2B0Cng@mail.gmail.com>
         <TY2PR01MB3692684E65CD04B38BD0B69BD8C50@TY2PR01MB3692.jpnprd01.prod.outlook.com>
         <0c6d88d25ae3d8cbed169c0efe5918844d8f47d9.camel@fi.rohmeurope.com>
         <TY2PR01MB36922F60FD7C2C0E4683C6A3D8C50@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB36922F60FD7C2C0E4683C6A3D8C50@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3044d6c-d8cf-4a64-e0ec-08d8a18fa0ae
x-ms-traffictypediagnostic: HE1PR0302MB2665:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0302MB2665CD54BFCD0AEBF3EB709DADC50@HE1PR0302MB2665.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0wLFVFQ51kj1o6uah/4paR+gvE0yUFnJbJplWp8/YECUww7uxICe/+1e5fQNsOCNCRXAX0g4bU0DdLG9Lg2zzv3KrtXCEMqXiNU16B4hkHGa40L258k+LOffRfX861XNtGb0P02vtcuBakfsWxt8pWsy+xyyqgFV6DFMyeEhj8Z+nLW/+TDZR68pwP9qMgNLNLyqHwWxQnoNA1fL4Bh7GX0+12NWCv9G2pdW6lQBFCbUtwjKOV9kzeLou7kzrgDppnVMw0eUD69uzOwQfuHJN+jT6BZJLKonqfwVlzCzAvjSQKfvYpCcx4XkxKvcKy9oSjakXRABNr6K/BxirMh3gg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(396003)(366004)(136003)(5660300002)(66476007)(7416002)(54906003)(76116006)(86362001)(2616005)(64756008)(6506007)(66446008)(83380400001)(53546011)(186003)(110136005)(4001150100001)(71200400001)(316002)(6512007)(6486002)(2906002)(478600001)(66556008)(3450700001)(8676002)(4326008)(8936002)(26005)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?aVJRcU9wZXpzdFNSbmV4VEt1Sm11NFVlRDNrdGpBNmo5VFpHU2tqaDZkQUtD?=
 =?utf-8?B?STFuVnNMbVJJTmg2czJNMGpJSVZjMW5VYTBqVStQVTRIRi92RUNYRkFudGpE?=
 =?utf-8?B?VGZ2eExFOWRnL1hGWlVhczJmZ3dLUFZwc1JqL281TGdCYnN3cVRkT2l1aGRM?=
 =?utf-8?B?b0FKdW5aNWI0MnA4TExISVpTZGRFLzZqOEJYV2Z1cUhkVjJQdFpXSHFHMXp5?=
 =?utf-8?B?N2hrUVZJRUVCc25zbXVhZUs3KzJiZEI3L0Q5S3FYdHEzWng0VFhOa1dQWGcr?=
 =?utf-8?B?TVlRVTFLTkQ4U29lK3lDMmFMUDhteTdpSzR3dWFma3B3ZjVQL2lvRm5adzNj?=
 =?utf-8?B?NklMZjV3NlVPckpodDBtc3pnb3BKT1RqdFdvRUpTSlpjWDRvTzRXdDJIRHhy?=
 =?utf-8?B?TWJWWGRJMkxqYS9vWTZuM0Q5VklEVUlnYTFmM1ZaWjQ4cnhVaVRKWENCZmxO?=
 =?utf-8?B?bzVMRGtwY2VXMWdTVTJIRU5CWDh2ZHV0VW5jM2R3ZWVtejlsM0V0R05Oa1hQ?=
 =?utf-8?B?T3I4REVWNEdkOFpjeVVEcUZteGEzdUQ4Mm1naE9SMjF3eVlSdWw4ak1xZWJW?=
 =?utf-8?B?MFRDUmpmajk1V1VKcFNBR0h0MTMxZ1M5SHFRR1o5K29OY2hieXBLWGpSNWRK?=
 =?utf-8?B?MWFIcGVLYUg0VGFvUTdtSjE1SXhYNTl5YXN6SDByL2JoVHFPdU9SYnBjUWlZ?=
 =?utf-8?B?cGtrOVUxUWJReTdNNXJOU1JuUmU4RjgrN1BMaUEwVDF2UEVJMU1LTVNJQVEw?=
 =?utf-8?B?N056QmxFWEx3dkJnWlhYTE5uR3NOYzVNS0ZpWnora0ZZMWJnVEhLL256WGNB?=
 =?utf-8?B?UDAvSjJDUklvcTVDQ0d3K3hPUWEzekE3Tkd3aDdhdVpIOFJwQzBKRTJlV1hq?=
 =?utf-8?B?bUJmUjRGZG8yNkRTbU1iNW4wa0w2Ti9oVnFTZFlpTUV6M0h3SGMvZ1R5ejJJ?=
 =?utf-8?B?MjYvVzJaTGNNMzlIZDBQZFpEdFU3QU0zSVVUU2lGSHgvMERLWXdacmVQL0JS?=
 =?utf-8?B?c0FwTTUxZElJcFZZeXdBL1JzN0VUd0xPOUpaM2VkekdEMWVFTm5ablRNa28y?=
 =?utf-8?B?bDF6M2RCa1FXWFBwV2FXajBvYUFPblRDMy9LMVJqR0UyaEtmWU1hd0NxQlQz?=
 =?utf-8?B?aW5iUUZRVko0NVJva0hhN1NxdFFIeVYzV21ZbjhZV0FWVGxxd2NCZXo4NXB6?=
 =?utf-8?B?QXFSVnJ2U0piRk9pNFRnNHV5UjRSWm8xOEhNakV6dWZ1aisyWjBRaVo4amRy?=
 =?utf-8?B?VGRPaEM4RFhQNEI4eHdZMWVuK0Fwb0lUbmJRVUhiaW5DeHk4d0dMbm1KQXQx?=
 =?utf-8?Q?8FNoDjK8PEktQ2rOcho7A3NZqou7VBbSUw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB2BB1916E544341B7C6499A625D4E07@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3044d6c-d8cf-4a64-e0ec-08d8a18fa0ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 06:55:52.0276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ltgNCnuQy17m36ESArbXZOMV5dj7BspSYVk56hghhsf/DoN9/3jBRg1igiOsAqKUT+l2qlzXjXeOwCgKbR6rwUUJISrsN/9ugUbvmAFu7xH8q3Wslba+y/jSxqrpNeLW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2665
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBXZWQsIDIwMjAtMTItMTYgYXQgMDY6MjkgKzAwMDAsIFlvc2hpaGlybyBTaGltb2RhIHdy
b3RlOg0KPiBIaSBNYXR0aS1zYW4sDQo+IA0KPiA+IEZyb206IFZhaXR0aW5lbiwgTWF0dGksIFNl
bnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIgMTYsIDIwMjAgMzowMCBQTQ0KPiA+IE9uIFdlZCwgMjAy
MC0xMi0xNiBhdCAwMjoxMyArMDAwMCwgWW9zaGloaXJvIFNoaW1vZGEgd3JvdGU6DQo+ID4gPiBI
aSBHZWVydC1zYW4sIE1hdHRpLXNhbiwNCj4gPiA+IA0KPiA+ID4gPiBGcm9tOiBHZWVydCBVeXR0
ZXJob2V2ZW4sIFNlbnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIgMTYsIDIwMjANCj4gPiA+ID4gMTox
Mw0KPiA+ID4gPiBBTQ0KPiA+ID4gPiBPbiBUdWUsIERlYyAxNSwgMjAyMCBhdCA1OjAyIFBNIEdl
ZXJ0IFV5dHRlcmhvZXZlbiA8DQo+ID4gPiA+IGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToN
Cj4gPiA+ID4gPiBPbiBGcmksIERlYyAxMSwgMjAyMCBhdCAzOjAzIFBNIFZhaXR0aW5lbiwgTWF0
dGkNCj4gPiA+ID4gPiA8TWF0dGkuVmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPiB3cm90ZToN
Cj4gPiA+ID4gPiA+IE9uIEZyaSwgMjAyMC0xMi0xMSBhdCAyMDoyNyArMDkwMCwgWW9zaGloaXJv
IFNoaW1vZGEgd3JvdGU6DQo+ID4gPiA8c25pcD4NCj4gPiA+ID4gPiA+ID4gLS0tIGEvZHJpdmVy
cy9yZWd1bGF0b3IvYmQ5NTcxbXd2LXJlZ3VsYXRvci5jDQo+ID4gPiA+ID4gPiA+ICsrKyBiL2Ry
aXZlcnMvcmVndWxhdG9yL2JkOTU3MW13di1yZWd1bGF0b3IuYw0KPiA+ID4gPiA+ID4gPiBAQCAt
MTcsNyArMTcsNyBAQA0KPiA+ID4gPiA+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L21mZC9iZDk1NzFt
d3YuaD4NCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ICBzdHJ1Y3QgYmQ5NTcxbXd2X3Jl
ZyB7DQo+ID4gPiA+ID4gPiA+IC0gICAgIHN0cnVjdCBiZDk1NzFtd3YgKmJkOw0KPiA+ID4gPiA+
ID4gPiArICAgICBzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4g
PiA+IEFzIGEgJ25pdCc6DQo+ID4gPiA+ID4gPiBJIG1pZ2h0IGNvbnNpZGVyIGFkZGluZyB0aGUg
ZGV2IHBvaW50ZXIgaGVyZSB0byBhdm9pZCBleHRyYQ0KPiA+ID4gPiA+ID4gYXJndW1lbnQNCj4g
PiA+ID4gPiA+IHdpdGggYWxsIHRoZSBia3VwX21vZGUgZnVuY3Rpb25zIGJlbG93LiAoanVzdCBw
YXNzIHRoaXMNCj4gPiA+ID4gPiA+IHN0cnVjdA0KPiA+ID4gPiA+ID4gYW5kDQo+ID4gPiA+ID4g
PiBtb2RlKS4gQnV0IHRoYXQncyBvbmx5IG15IHByZWZlcmVuY2UgLSBmZWVsIGZyZWUgdG8gaWdu
b3JlDQo+ID4gPiA+ID4gPiB0aGlzDQo+ID4gPiA+ID4gPiBjb21tZW50DQo+ID4gPiA+ID4gPiBp
ZiBwYXRjaCBpcyBPayB0byBNYXJrLCBNYXJlayAmIE90aGVycyA6KQ0KPiA+ID4gPiA+IA0KPiA+
ID4gPiA+IFN0cnVjdCByZWdtYXAgYWxyZWFkeSBjb250YWlucyBhIHN0cnVjdCBkZXZpY2UgcG9p
bnRlciwgYnV0DQo+ID4gPiA+ID4gdGhhdCdzIGludGVybmFsDQo+ID4gPiA+ID4gdG8gcmVnbWFw
Lg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFBlcmhhcHMgYWRkaW5nIGEgcmVnbWFwX2RldmljZSgp
IGhlbHBlciB0byByZXRyaWV2ZSB0aGUNCj4gPiA+ID4gPiBkZXZpY2UNCj4gPiA+ID4gPiBwb2lu
dGVyDQo+ID4gPiA+ID4gbWlnaHQgYmUgd29ydGh3aGlsZT8NCj4gPiA+ID4gDQo+ID4gPiA+IC1F
RVhJU1RTIDstKQ0KPiA+ID4gPiANCj4gPiA+ID4gc3RydWN0IGRldmljZSAqcmVnbWFwX2dldF9k
ZXZpY2Uoc3RydWN0IHJlZ21hcCAqbWFwKQ0KPiA+ID4gDQo+ID4gPiBUaGFuayB5b3UgZm9yIGZp
bmRpbmcgdGhpcy4gSSdsbCBmaXggdGhpcyBwYXRjaC4NCj4gPiANCj4gPiBKdXN0IGEgc21hbGwg
cmVtaW5kZXIgdGhhdCB0aGlzIGRldmljZSBpcyBwcm9iYWJseSB0aGUgTUZEIGRldmljZSwNCj4g
PiBub3QNCj4gPiB0aGUgZGV2aWNlIGNyZWF0ZWQgZm9yIHJlZ3VsYXRvciBkcml2ZXIuIChSZWdt
YXAgaXMgY3JlYXRlZCBmb3INCj4gPiBNRkQpLg0KPiA+IEZvciBwcmludHMgdGhpcyBvbmx5IG1l
YW5zIHdlJ3JlIGlzc3VpbmcgcHJpbnRzIGFzIGlmIE1GRCBkZXZpY2UNCj4gPiBnZW5lcmF0ZWQg
dGhlbSwgcmlnaHQ/IEknbSBub3Qgc3VyZSBpdCBpcyB0aGUgYmVzdCBhcHByb2FjaCAtIGJ1dA0K
PiA+IEknbGwNCj4gPiBsZWF2ZSB0aGlzIHRvIE1hcmsgJiBvdGhlcnMgdG8ganVkZ2UgOikNCj4g
DQo+IFRoYW5rIHlvdSBmb3IgdGhlIGNvbW1lbnQuIFlvdSdyZSBjb3JyZWN0LiByZWdtYXBfZ2V0
X2RldmljZSgpIGlzDQo+IHRoZSBNRkQgZGV2aWNlLiBBbHNvLCBvcmlnaW5hbCBjb2RlIGhhZCB1
c2VkIHRoZSBNRkQgZGV2aWNlIGFzDQo+ICJkZXZfZXJyKGJkLT5kZXYsIC4uLikiLiBTbywgcHJp
bnRrIGJlaGF2aW9yIGlzIHRoZSBzYW1lIGFzIGJlZm9yZSA6KQ0KDQpSaWdodC4gSSBtdXN0IGFk
bWl0IGRpZG4ndCBjYXRjaCB0aGF0LiBJIGFjdHVhbGx5IHRoaW5rIHVzaW5nIHRoZQ0KJnBkZXYt
PmRldiBmb3IgcHJpbnRzIGlzc3VlZCBieSB0aGUgcmVndWxhdG9yIGRyaXZlciB3b3VsZCBiZSBt
b3JlDQpjb3JyZWN0IGJ1dCBJJ20gbm90IGNvbXBsYWluaW5nIGlmIHVzaW5nIE1GRCBkZXZpY2Ug
aXMgT2sgdG8gTWFyayAmDQpvdGhlcnMgOikgSSBkbyBhcHByZWNpYXRlIHlvdXIgd29yayB3aXRo
IHRoaXMsIHRoYW5rcyENCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBZb3NoaWhpcm8gU2hpbW9k
YQ0KPiANCg0K
