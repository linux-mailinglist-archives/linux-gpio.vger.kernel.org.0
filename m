Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2DBC2D75B2
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 13:36:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388809AbgLKMfu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 07:35:50 -0500
Received: from mail-eopbgr140079.outbound.protection.outlook.com ([40.107.14.79]:45059
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388615AbgLKMfR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Dec 2020 07:35:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3nyi5iYu2zMwcYms9sQF2PXm91wkwglrrSsZBPTKlDnTV3XyjgJ7HuISYakuDAl9EHswpYfPx/VIw7C5XWI3x1j+KPpAA5aelQW1dwOXaVQd1q40w3tawzLYyT1cPmiq0NoImVMAFk8z1DkXiXZdy1RBy/vx1h7TJAfJMqQhF9nAo1tkEJ0zoXgZi1rjE3IUfRIa+1KPfvUojt2KDxZlxK1SBNQP2JNmvIJsfms3RLIJufRbAwVcLZniwdKwaAUAG1EE+qwbrZKKnvWoOsiEYOAgfehnuy/UMvrrkqplA8VehwdA2PUHYzP6OdwdNrknozhebVxbrDvR41XSGCVSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwMeqSxtR1ZfxoQ8pVmhqevQTwcCe0BWywghoHqNY7I=;
 b=e1KVxMucZLDb0BLBXt5Eco+IrLyXxZKAsjhQwkaAa2QqVgh1wUMO8Qo5BrRFt+UDNz6vPWAu8PVL2Y83hv6LUO8caw7sBpPqH1T1N6u/djcmIIf92BLfYCP1Fg5JelLr1rYJDa0ewGApYCH4wZbPDTvnVidT/ghxChKUfoiN7WCyK0aJtoovstLx072GkqVp6NtwSw9dV5Ns7MWGgcLs9YKFp1Hkx3ItFOFteqUGip+Cpz8UZPgWgs20I+mwShUXA6HyW+WtWrgd3SP/IKGvKLRuBUQIHSSdnB1vSvFwmE3m4ssUe1eakn8hSQyymXsMS+8rfeF1wLQozDD2giwybA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwMeqSxtR1ZfxoQ8pVmhqevQTwcCe0BWywghoHqNY7I=;
 b=o91gM14ZWTeQPc38SyGqF8jaNror7ijKrvTQXZxYqbxJX07s/Qkezsx93ei37PKRCDINw6fM/m7svmqMaBBdkRudp0Zxmg7o8lbPlXk5VhLsyAlaHHoprlhd8kRjgl1Xb3L9Ql13iEzSwvVO/pAxc2dOWgv8lH9ljApRYltrxiA=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB2987.eurprd03.prod.outlook.com (2603:10a6:7:5b::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.23; Fri, 11 Dec 2020 12:34:27 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87%6]) with mapi id 15.20.3632.023; Fri, 11 Dec 2020
 12:34:27 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "khiem.nguyen.xt@renesas.com" <khiem.nguyen.xt@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 04/10] regulator: bd9571mwv: Add BD9574MWF support
Thread-Topic: [PATCH v2 04/10] regulator: bd9571mwv: Add BD9574MWF support
Thread-Index: AQHWz7CwEl0Fmld+qk2IHLLNWBbVIqnx1IeA
Date:   Fri, 11 Dec 2020 12:34:27 +0000
Message-ID: <ab27db32a8da1486e14722831da947d37bbdcf7d.camel@fi.rohmeurope.com>
References: <1607686060-17448-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1607686060-17448-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1607686060-17448-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d035aff8-20e3-4599-b45f-08d89dd1199f
x-ms-traffictypediagnostic: HE1PR03MB2987:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR03MB29876BA8C1815A925E66B8A2ADCA0@HE1PR03MB2987.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:820;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WswSmLnom7kkcE8B1w5TRMg6fYIyYRnGuo2oNuKmOeIQon1nvQi3Y5nYekSp6IyUcvFKDdnVURs0ChYXnU/aJf4RN41JkfpAtJVT69zjVyNbx1JSY0Wj+8cc6JO6npOiXHoe1MDpdDLC3mklBJv1krXjrdthvKum4HwSjxKuFBT9Zr63XghEoKWM4bfK576x5m1CbrEGXAg87MNFYyBeMiny7drxu1twK7hJ2hHbS5aZY0jvMqErCYC56uYVW5dv9+jXpO2xxZwyDf6w/z+jfJIMUxFuupx+UhhmC3Wd82xa6DZeFYuykwG6Y3iCloisV87z5jefmfOvVnO1RW8Xxg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(396003)(346002)(39830400003)(478600001)(64756008)(8676002)(2616005)(8936002)(83380400001)(6486002)(86362001)(66446008)(54906003)(110136005)(4326008)(2906002)(26005)(5660300002)(71200400001)(66946007)(6512007)(7416002)(76116006)(6506007)(186003)(66556008)(3450700001)(316002)(4001150100001)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TE9VTU9JMkpDSUNCQllRbm1sdzB1YjV5WE5wRWJlNzMrVzhZVWk2cUJZa1E2?=
 =?utf-8?B?SWcycTZSbVI1REt0bElPTHhyVGlHbDlGWWJzL2d0V2x5bHNaNnFkdEUxYm9o?=
 =?utf-8?B?aEZta2QvOTJKakMrN216RnFSSnA3TzNEL2FoZExwSXkyMmg4dHlWU25iZlBS?=
 =?utf-8?B?M3pKUUtrVHVPUkMrTC9kbVZtVEdoTGt4THU2eERQWVM2VWlUc29QN3E1TW9p?=
 =?utf-8?B?ajRTTFNISWRiMUpWejl2Z2JlWlJIUDZwWldxZktNLzVFM3ptVkZUeUpDd3NL?=
 =?utf-8?B?b0laV1QvMk1YdmRhZTkrVlc4RXd4MmJyYlk4Smdmc3gvMzhPaUVRRTNWeE5k?=
 =?utf-8?B?MDErb2FFRjlNN0ZhTkowZmNIdC8xK0cxbUFzUTJFOWxQMis1VW52THpEOXcw?=
 =?utf-8?B?eXpJd0FUR3RaS29GWFlQZ3ZZZXcrMGJoNGVCcGgvTlVuTkxUOWNCUFE5b3g2?=
 =?utf-8?B?dGl4OXVmMHVFb1pGb2Z2MXpPMjBzVCs2RHZwNWxJMld2TDdGcndIOGJ6QVJX?=
 =?utf-8?B?YjVldVhRQ1hsUHlUaGF0UG5PcWtOL0hqQUhmd1ZiWUxhMHljQkF3c3ZsbzdL?=
 =?utf-8?B?azVQcWxmN2hERnJQbW9zZ0RRSDl4SytaYzdsdlBBSlNFNnNsajNtaWxONFZM?=
 =?utf-8?B?bEl2Rm14V04wajhqVzc3WEJNcVRFZ0RIV1gvQzBQMk1hRGkxa29FMWxEU1Bt?=
 =?utf-8?B?SHYrb0kxcHRTemhtUmpDNmtZNUg3aFJ1Um84TzMrbDlEWGFDa2gralA1d0pC?=
 =?utf-8?B?NlhhT0ZXQW0xVmg3Vk15RkJxNGtta3dJTWFib0tnU0tVTnE2NVJ6YkdiWnZk?=
 =?utf-8?B?blprdUg0d1VpNTF6dTBNemtET1ZhTXBtY3pzcWhzSi9PTUJzek9hUXA5TEIz?=
 =?utf-8?B?N0cxY2VRc210RGhoaGRsTHk3ZWJUS0pzNXEzRGUvTUlHcFAydzlvSDl6Rk5F?=
 =?utf-8?B?YlVaN1RKWWMybEd1TWdrclV0TGNVNkZxc0tvVWZEUk1DM1BTK1BUZlRpRW1Y?=
 =?utf-8?B?ZzdoRi9DNm9wYUVYTU1CckpORFpPT0I1SlFJdW5rYWswenZvVnB5VGt4U0dT?=
 =?utf-8?B?QWpkSlFFc2FlZG5TM1M4bGhORW8yc012dWIvbVhKRE5EeTlOWUJLNkpOTEVP?=
 =?utf-8?B?dDZlV0R0c293bm5hY2ZwcTZVT3VJK0NWQTdoendWUlRiVUhTOHgrMFFYRGUy?=
 =?utf-8?B?anE3bE96NFpSUzdLSWdmUk40eXFacXZUTm9iNXo4UW05dVBQZFJ6UUdMWjJu?=
 =?utf-8?B?THVvUVdXWFlIdzJRYnZZNFhhaDMyMWVWSkpsWE9JUG9DblQ2QUJsTmZERFAx?=
 =?utf-8?Q?HSIO4phXZqyv1OKbEOYVVeFwLd3tByYyhP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <06B9B68BF5E1564F82071620991CEBA7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d035aff8-20e3-4599-b45f-08d89dd1199f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2020 12:34:27.5778
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ONGQ6HEjzisGc1bqRnZ1aSnfnQz5iZeN7M1xy6UemWeTg36dXnT1P6Ew3aDtgwg4iHyoj7yrAmTxGE0rjqKfP+959d8A8/4zzOhpqm3eGnWtOJ3mUg4okCeZCTJb0rHU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB2987
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gYWdhaW4gU2hpbWFkYS1zYW4sDQoNCk9uIEZyaSwgMjAyMC0xMi0xMSBhdCAyMDoyNyAr
MDkwMCwgWW9zaGloaXJvIFNoaW1vZGEgd3JvdGU6DQo+IEFkZCBzdXBwb3J0IGZvciBCRDk1NzRN
V0Ygd2hpY2ggaXMgc2lsaW1hciBjaGlwIHdpdGggQkQ5NTcxTVdWLg0KPiBOb3RlIHRoYXQgQkQ5
NTc0TVdGIGRvZXNuJ3Qgc3VwcG9ydCBBVlMgYW5kIFZJRC4NCg0KSSdkIGxpa2UgdG8gdW5kZXJz
dGFuZCB3aGF0IGlzIFZJRD8NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1v
ZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMv
cmVndWxhdG9yL2JkOTU3MW13di1yZWd1bGF0b3IuYyB8IDEwICsrKysrKysrLS0NCj4gIDEgZmls
ZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9yZWd1bGF0b3IvYmQ5NTcxbXd2LXJlZ3VsYXRvci5jDQo+IGIvZHJpdmVy
cy9yZWd1bGF0b3IvYmQ5NTcxbXd2LXJlZ3VsYXRvci5jDQo+IGluZGV4IDAyMTIwYjAuLjA0MTMz
OWIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvcmVndWxhdG9yL2JkOTU3MW13di1yZWd1bGF0b3Iu
Yw0KPiArKysgYi9kcml2ZXJzL3JlZ3VsYXRvci9iZDk1NzFtd3YtcmVndWxhdG9yLmMNCj4gQEAg
LTEsNiArMSw2IEBADQo+ICAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiAg
LyoNCj4gLSAqIFJPSE0gQkQ5NTcxTVdWLU0gcmVndWxhdG9yIGRyaXZlcg0KPiArICogUk9ITSBC
RDk1NzFNV1YtTSBhbmQgQkQ5NTc0TVdGLU0gcmVndWxhdG9yIGRyaXZlcg0KPiAgICoNCj4gICAq
IENvcHlyaWdodCAoQykgMjAxNyBNYXJlayBWYXN1dCA8bWFyZWsudmFzdXQrcmVuZXNhc0BnbWFp
bC5jb20+DQo+ICAgKg0KPiBAQCAtOSw2ICs5LDcgQEANCj4gICAqIE5PVEU6IFZEMDkgaXMgbWlz
c2luZw0KPiAgICovDQo+ICANCj4gKyNpbmNsdWRlIDxsaW51eC9tZmQvcm9obS1nZW5lcmljLmg+
DQo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvb2YuaD4N
Cj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4gQEAgLTI3Nyw2ICsyNzgs
NyBAQCBzdGF0aWMgaW50IGJkOTU3MW13dl9yZWd1bGF0b3JfcHJvYmUoc3RydWN0DQo+IHBsYXRm
b3JtX2RldmljZSAqcGRldikNCj4gIAlzdHJ1Y3QgcmVndWxhdG9yX2RldiAqcmRldjsNCj4gIAl1
bnNpZ25lZCBpbnQgdmFsOw0KPiAgCWludCBpOw0KPiArCWVudW0gcm9obV9jaGlwX3R5cGUgY2hp
cCA9IHBsYXRmb3JtX2dldF9kZXZpY2VfaWQocGRldiktDQo+ID5kcml2ZXJfZGF0YTsNCj4gIA0K
PiAgCWJkcmVnID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqYmRyZWcpLCBHRlBf
S0VSTkVMKTsNCj4gIAlpZiAoIWJkcmVnKQ0KPiBAQCAtMjkyLDYgKzI5NCw5IEBAIHN0YXRpYyBp
bnQgYmQ5NTcxbXd2X3JlZ3VsYXRvcl9wcm9iZShzdHJ1Y3QNCj4gcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQ0KPiAgCWNvbmZpZy5yZWdtYXAgPSBiZHJlZy0+cmVnbWFwOw0KPiAgDQo+ICAJZm9yIChp
ID0gMDsgaSA8IEFSUkFZX1NJWkUocmVndWxhdG9ycyk7IGkrKykgew0KPiArCQkvKiBCRDk1NzRN
V0Ygc3VwcG9ydHMgRFZGUyBvbmx5ICovDQo+ICsJCWlmIChjaGlwID09IFJPSE1fQ0hJUF9UWVBF
X0JEOTU3NCAmJiByZWd1bGF0b3JzW2ldLmlkDQo+ICE9IERWRlMpDQo+ICsJCQljb250aW51ZTsN
Cg0KRG9lcyB0aGlzIG1lYW4gdGhhdCByZWFkaW5nIFZEMDkgdm9sdGFnZSBpcyBub3Qgc3VwcG9y
dGVkIGJ5IGRyaXZlcj8gKEkNCmFzc3VtZWQgVkQwOSBpbml0aWFsIHZvbHRhZ2UgY2FuIGJlIHNl
dCBmcm9tIGVlcHJvbSg/KSBhbmQgcmVhZCBieQ0KZHJpdmVyIC0gSSBtYXkgYmUgd3JvbmcgdGhv
dWdoKS4gUGVyaGFwcyBpdCBpcyB3b3J0aCBtZW50aW9uaW5nIGluIHRoZQ0KY29tbWl0IG1lc3Nh
Z2UgYXMgYSBkcml2ZXIgcmVzdHJpY3Rpb24/DQoNCkFuZCBqdXN0IGFza2luZyBvdXQgb2YgdGhl
IGN1cmlvc2l0eSAtIGFyZSB0aGUgb3RoZXIgdm9sdGFnZSByYWlscw0KbGlzdGVkIGluIGRhdGEt
c2hlZXQgKFZEMTgsIEREUjAsIFZEMzMsIFZEMDkgYW5kIExETzEsLi4uLExETzQpIHNldC11cA0K
ZnJvbSBEVCBhcyBmaXhlZC1yZWd1bGF0b3JzPyBBbnkgcmVhc29uIHdoeSB0aGV5IGFyZSBub3Qg
c2V0LXVwIGhlcmU/DQoNCj4gIAkJcmRldiA9IGRldm1fcmVndWxhdG9yX3JlZ2lzdGVyKCZwZGV2
LT5kZXYsDQo+ICZyZWd1bGF0b3JzW2ldLA0KPiAgCQkJCQkgICAgICAgJmNvbmZpZyk7DQo+ICAJ
CWlmIChJU19FUlIocmRldikpIHsNCj4gQEAgLTMzOSw3ICszNDQsOCBAQCBzdGF0aWMgaW50IGJk
OTU3MW13dl9yZWd1bGF0b3JfcHJvYmUoc3RydWN0DQo+IHBsYXRmb3JtX2RldmljZSAqcGRldikN
Cj4gIH0NCj4gIA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2VfaWQNCj4g
YmQ5NTcxbXd2X3JlZ3VsYXRvcl9pZF90YWJsZVtdID0gew0KPiAtCXsgImJkOTU3MW13di1yZWd1
bGF0b3IiLCB9LA0KPiArCXsgImJkOTU3MW13di1yZWd1bGF0b3IiLCBST0hNX0NISVBfVFlQRV9C
RDk1NzEgfSwNCj4gKwl7ICJiZDk1NzRtd2YtcmVndWxhdG9yIiwgUk9ITV9DSElQX1RZUEVfQkQ5
NTc0IH0sDQo+ICAJeyAvKiBzZW50aW5lbCAqLyB9DQo+ICB9Ow0KPiAgTU9EVUxFX0RFVklDRV9U
QUJMRShwbGF0Zm9ybSwgYmQ5NTcxbXd2X3JlZ3VsYXRvcl9pZF90YWJsZSk7DQoNCg==
