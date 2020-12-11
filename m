Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC4C2D753F
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 13:02:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393195AbgLKMBj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 07:01:39 -0500
Received: from mail-eopbgr150072.outbound.protection.outlook.com ([40.107.15.72]:61359
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728085AbgLKMBQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Dec 2020 07:01:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAno1fjn1d64fl4P1GMAi4bIi8oY3Qbu6rOdGr6jJGC3uA+PPCXeUX7IpkS/HqSN+LYY2aCKUSKRWMBs3SBeKSzQgj81OVPEOvF7I8OMs/78aV4X/lr0JyncWF7hBfF1ZAkp50iCgiXAz0cWHE3NhsO0NT7JKE1xNz1Lm5R+VpyjibR9mVAKG3NkgslreRgRKARmcOCncy9kG+tABJ2EKS3JXowxkl0VhuuUPNvXlgjLxMauGgr9ivWjIb73A+I70iYXXPkl0awBVb3xb64IhSckUWN9S0dhE8lM0q9ZiL66LjMWXauxvPlvyERVktnEjhQ/NNagHbrJYnTH29Rwxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23gxeWmwBpXkZQaemJWPr1bDd8l87BNtzzMYO/OWOzk=;
 b=kriHKzsEK5sqX7fJY9MBC55b0+2ymu5959s2Z91ABNF0+bO/bcSvDAvw2bZZeCcskhyYV0XyWgsVpSmOkYPD7cB+fBN/mk4WTaDdygGsoIzwgTUezgAVWiUM6CcYPFbqOKE/dC1iH3kqzCQVKQFND9CGHzrLtFRlJ7GlNyVvoiTlbgWwuP4o6AOP+sMeDpBBQBQD3bLTzdIeK6eky0s1L8I0TeV9DzkN49mob2Y2PhZe3GQkOlc3nLL/HnKUDW9KvW8/It06iXfiFtTeozktyqv02eITYfOENq+IZaMxYIjRHvQdNrt0iARQyGjr4RYk4oWWEZIwepb1RafY/618wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23gxeWmwBpXkZQaemJWPr1bDd8l87BNtzzMYO/OWOzk=;
 b=j88FCT5fXlnABtUepRPiLEP1GAWSghpuUmUCbUi1j62Xcd/82Q2o/NOcNz/TJDSO60vC2J+SQjZ0obDPf+gJlp5GVdlKFUloQRGxAtmKpqNWKu1yBxc1RXhbpzz9fBlqrAPTtPe583AvxmH/2BPz0md4qt2CLfangQKXKgISfjI=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB2889.eurprd03.prod.outlook.com (2603:10a6:7:5f::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.13; Fri, 11 Dec 2020 12:00:18 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87%6]) with mapi id 15.20.3632.023; Fri, 11 Dec 2020
 12:00:18 +0000
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
Subject: Re: [PATCH v2 03/10] regulator: bd9571mwv: rid of using struct
 bd9571mwv
Thread-Topic: [PATCH v2 03/10] regulator: bd9571mwv: rid of using struct
 bd9571mwv
Thread-Index: AQHWz7CxfZ5oTbAwpEyuKA+JrO+HVKnxyvwA
Date:   Fri, 11 Dec 2020 12:00:18 +0000
Message-ID: <cbb8c9b1884ea5e535bcafda1218b941bd665c21.camel@fi.rohmeurope.com>
References: <1607686060-17448-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1607686060-17448-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1607686060-17448-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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
x-ms-office365-filtering-correlation-id: aac26946-48c5-4723-05db-08d89dcc5457
x-ms-traffictypediagnostic: HE1PR03MB2889:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR03MB2889CD64D06B9029CCBE1333ADCA0@HE1PR03MB2889.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:549;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /56LP+TPq7lsOk4k0O2k1TAU/iBnptSEh7Tpxe8y6UNVWoBxNod0OurEayY58gRrIb0PNnMUpw0JUNC5bdlEl3zF9MumjaiYjNS46KiOSRjPk3If5m8Tquibo00wEmbXg1ONwEVg/vPyLJUoZeJtVMlUeBhCm3ldIc6T9RMFW1AH47AXhaUJr+QdEx9rz2beFLvSVnv6pQLAZ2BX/KquRT85XCpG7B/2EhDM14NOZ96imGruaG/IxRRtaNAgLFXOGIeH8E0d7CQTQFMEDDq48xD+/3nrzoY43FSHI2O2ovkyItXh8Jelpt60f5MB0eC/Xs1MIPso1BAJ4fB3zClDeg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39850400004)(396003)(376002)(366004)(3450700001)(6512007)(8676002)(7416002)(6506007)(83380400001)(478600001)(66476007)(110136005)(66446008)(66556008)(86362001)(4001150100001)(64756008)(66946007)(26005)(8936002)(54906003)(4326008)(5660300002)(316002)(6486002)(71200400001)(2616005)(186003)(76116006)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?MkR3VTVjeVF2cTk2WjdlS1pUVjMwNCt3bVg1cml1Sk4vZDZTeFhMVUMwaHZv?=
 =?utf-8?B?U3JQYWZWR3VVc0d3c3ZXRFdhK1ZISDhGREN1V1FFWmNHWDdZNWN5OHYvNG5w?=
 =?utf-8?B?K0g5SnRlTjZqVldSMzV3b3psbnJkNW1SMXdKZ1JSUUdaYmEzU1M0STFpZjZ1?=
 =?utf-8?B?UDV3Ymw4OGZSSmIzSFZUeVR6b21mRGM2c2Jxd1NPbzRNaXZzb3FObThGUHRL?=
 =?utf-8?B?R2ZzS2owNlF1akhJcmUwazJsajN1QzVlZFFMcHoxYThhMUtGZ3FlNVJCTEgz?=
 =?utf-8?B?TjRTWDF6UjFUL09UYys4c3JRRmVaTFhYMzFsSk1EZlZLVkhmeWNDeThtblB6?=
 =?utf-8?B?NnBRWW4rT25BR1ptUTI1OTlyMkZSY2ZXVHR4emd1MHFxQklsTHNtZHBFL0VJ?=
 =?utf-8?B?b0lhNVpYQnp6b1NxZUlqSWlJT2syVjBwVU5NOHVNZFFDKzlWbWVzWUVVemQz?=
 =?utf-8?B?SlNKWDdYMXdXb0xJeEY1ZlVaaW0vRzlSZHZHcmplL0ZLTjFqZ3RmdFNSQ3Uv?=
 =?utf-8?B?bXgrU2MzS1dkRy9na29qeHM0VzJYNHorRmt5OVBWbFBpUmIzaERuSXY1OFh2?=
 =?utf-8?B?aTNMNkJjQzNTV1FnOWNOL0FqZHJYRXhTZ2diTDRWZkJHVjBaNHV0cVEyLzRB?=
 =?utf-8?B?amM3RU1NcUdYeTVmR2U0MTk1cXQwMmduV2FMVGJuVWVra1B2Z3ZiRHZhSmd2?=
 =?utf-8?B?TWE1UlYxcEs5VkNobEl2KzJhRUJtakRTSnVDYVdMdzhQTkR0WXgxNzFaSGk5?=
 =?utf-8?B?V2hwbHhvcWdrd2hCZ3Jra005NC81dGFSRzBrSXlOb09veE1Nc2Q0bEs0OXlP?=
 =?utf-8?B?R3hrV0dscmxFeUtHMVk1bUdXWGhyZmRxaWJIUVRBRjY3TFlpclBLWm81OEZ4?=
 =?utf-8?B?a2lCNTRndU9FeWVOVWFEbTJNSUoxRWFPZjVwMGFxTTR1Yk5CTVpidVlOck5P?=
 =?utf-8?B?Z2FwSlZyS1JJemdmMzVxSml2TkNqOFl5SzVYYk1zM0VuWm02MnJVb1lFcWVz?=
 =?utf-8?B?bERhNFc4RzVsbUtqTDAzRVM3S2xiRUtYL3ZDaVNLcXlRZmUxYkp3MGRHL3Vo?=
 =?utf-8?B?QUlBci9VNG1CaFZDTHByRGhqVHNFYjI0RnFGRlFYRWk3SW1oNzFaV1hid0Y3?=
 =?utf-8?B?Sk9uaVliV3VvTUFnMWRsTm5Vd0tRM3ZoT1F0eWhSazJNWmIzQkU2MlVGMDZM?=
 =?utf-8?B?TmtIb3BERGk3amp4OTdsUEFoL3VRRHBENThFQ3NQQms4YWNSM3RPVm1PaHN6?=
 =?utf-8?B?YkF5bVFGMytEVVNxZHU2Q0svbElzR0s2NE9EMkxoZzBna2o5eUZvSHVrYlho?=
 =?utf-8?Q?Fzj7e+2NQXSKOiB5/Z3briahp9IV5R66h5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FAB1F2883F26442AB064CFFC3008264@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aac26946-48c5-4723-05db-08d89dcc5457
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2020 12:00:18.5674
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pqu03BUw48/+GOfLkiE3WdyKS/1/gwXCxJbc0GaZKX/PoIyNRdacp6vkvif3SoA4sndi5N9fy8TZHHXOeVheNKSBdfW0MeqgieKEAOSSqj3S0rq82I6mckTNqclCdUtm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB2889
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBGcmksIDIwMjAtMTItMTEgYXQgMjA6MjcgKzA5MDAsIFlvc2hpaGlybyBTaGltb2RhIHdy
b3RlOg0KPiBUbyBzaW1wbGlmeSB0aGlzIGRyaXZlciwgdXNlIGRldl9nZXRfcmVnbWFwKCkgYW5k
DQo+IHJpZCBvZiB1c2luZyBzdHJ1Y3QgYmQ5NTcxbXd2Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
WW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiAt
LS0NCj4gIGRyaXZlcnMvcmVndWxhdG9yL2JkOTU3MW13di1yZWd1bGF0b3IuYyB8IDQ5ICsrKysr
KysrKysrKysrKysrLS0tLQ0KPiAtLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNiBp
bnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3JlZ3VsYXRvci9iZDk1NzFtd3YtcmVndWxhdG9yLmMNCj4gYi9kcml2ZXJzL3JlZ3VsYXRvci9i
ZDk1NzFtd3YtcmVndWxhdG9yLmMNCj4gaW5kZXggZTY5MGMyYy4uMDIxMjBiMCAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9yZWd1bGF0b3IvYmQ5NTcxbXd2LXJlZ3VsYXRvci5jDQo+ICsrKyBiL2Ry
aXZlcnMvcmVndWxhdG9yL2JkOTU3MW13di1yZWd1bGF0b3IuYw0KPiBAQCAtMTcsNyArMTcsNyBA
QA0KPiAgI2luY2x1ZGUgPGxpbnV4L21mZC9iZDk1NzFtd3YuaD4NCj4gIA0KPiAgc3RydWN0IGJk
OTU3MW13dl9yZWcgew0KPiAtCXN0cnVjdCBiZDk1NzFtd3YgKmJkOw0KPiArCXN0cnVjdCByZWdt
YXAgKnJlZ21hcDsNCg0KQXMgYSAnbml0JzoNCkkgbWlnaHQgY29uc2lkZXIgYWRkaW5nIHRoZSBk
ZXYgcG9pbnRlciBoZXJlIHRvIGF2b2lkIGV4dHJhIGFyZ3VtZW50DQp3aXRoIGFsbCB0aGUgYmt1
cF9tb2RlIGZ1bmN0aW9ucyBiZWxvdy4gKGp1c3QgcGFzcyB0aGlzIHN0cnVjdCBhbmQNCm1vZGUp
LiBCdXQgdGhhdCdzIG9ubHkgbXkgcHJlZmVyZW5jZSAtIGZlZWwgZnJlZSB0byBpZ25vcmUgdGhp
cyBjb21tZW50DQppZiBwYXRjaCBpcyBPayB0byBNYXJrLCBNYXJlayAmIE90aGVycyA6KQ0KDQpP
dmVyYWxsLCBsb29rcyBnb29kIHRvIG1lIDopDQpSZXZpZXdlZC1CeTogTWF0dGkgVmFpdHRpbmVu
IDxtYXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+DQoNCj4gIA0KPiAgCS8qIEREUiBC
YWNrdXAgUG93ZXIgKi8NCj4gIAl1OCBia3VwX21vZGVfY250X2tlZXBvbjsJLyogZnJvbSAicm9o
bSxkZHItYmFja3VwLXBvd2VyIiAqLw0KPiBAQCAtMTM3LDI2ICsxMzcsMzAgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCByZWd1bGF0b3JfZGVzYyByZWd1bGF0b3JzW10NCj4gPSB7DQo+ICB9Ow0KPiAg
DQo+ICAjaWZkZWYgQ09ORklHX1BNX1NMRUVQDQo+IC1zdGF0aWMgaW50IGJkOTU3MW13dl9ia3Vw
X21vZGVfcmVhZChzdHJ1Y3QgYmQ5NTcxbXd2ICpiZCwgdW5zaWduZWQNCj4gaW50ICptb2RlKQ0K
PiArc3RhdGljIGludCBiZDk1NzFtd3ZfYmt1cF9tb2RlX3JlYWQoc3RydWN0IGRldmljZSAqIGRl
diwNCj4gKwkJCQkgICAgc3RydWN0IGJkOTU3MW13dl9yZWcgKmJkcmVnLA0KPiArCQkJCSAgICB1
bnNpZ25lZCBpbnQgKm1vZGUpDQo+ICB7DQo+ICAJaW50IHJldDsNCj4gIA0KPiAtCXJldCA9IHJl
Z21hcF9yZWFkKGJkLT5yZWdtYXAsIEJEOTU3MU1XVl9CS1VQX01PREVfQ05ULCBtb2RlKTsNCj4g
KwlyZXQgPSByZWdtYXBfcmVhZChiZHJlZy0+cmVnbWFwLCBCRDk1NzFNV1ZfQktVUF9NT0RFX0NO
VCwNCj4gbW9kZSk7DQo+ICAJaWYgKHJldCkgew0KPiAtCQlkZXZfZXJyKGJkLT5kZXYsICJmYWls
ZWQgdG8gcmVhZCBiYWNrdXAgbW9kZSAoJWQpXG4iLA0KPiByZXQpOw0KPiArCQlkZXZfZXJyKGRl
diwgImZhaWxlZCB0byByZWFkIGJhY2t1cCBtb2RlICglZClcbiIsIHJldCk7DQo+ICAJCXJldHVy
biByZXQ7DQo+ICAJfQ0KPiAgDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+ICANCj4gLXN0YXRpYyBp
bnQgYmQ5NTcxbXd2X2JrdXBfbW9kZV93cml0ZShzdHJ1Y3QgYmQ5NTcxbXd2ICpiZCwgdW5zaWdu
ZWQNCj4gaW50IG1vZGUpDQo+ICtzdGF0aWMgaW50IGJkOTU3MW13dl9ia3VwX21vZGVfd3JpdGUo
c3RydWN0IGRldmljZSAqZGV2LA0KPiArCQkJCSAgICAgc3RydWN0IGJkOTU3MW13dl9yZWcgKmJk
cmVnLA0KPiArCQkJCSAgICAgdW5zaWduZWQgaW50IG1vZGUpDQo+ICB7DQo+ICAJaW50IHJldDsN
Cj4gIA0KPiAtCXJldCA9IHJlZ21hcF93cml0ZShiZC0+cmVnbWFwLCBCRDk1NzFNV1ZfQktVUF9N
T0RFX0NOVCwgbW9kZSk7DQo+ICsJcmV0ID0gcmVnbWFwX3dyaXRlKGJkcmVnLT5yZWdtYXAsIEJE
OTU3MU1XVl9CS1VQX01PREVfQ05ULA0KPiBtb2RlKTsNCj4gIAlpZiAocmV0KSB7DQo+IC0JCWRl
dl9lcnIoYmQtPmRldiwgImZhaWxlZCB0byBjb25maWd1cmUgYmFja3VwIG1vZGUgMHgleA0KPiAo
JWQpXG4iLA0KPiArCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBjb25maWd1cmUgYmFja3VwIG1v
ZGUgMHgleA0KPiAoJWQpXG4iLA0KPiAgCQkJbW9kZSwgcmV0KTsNCj4gIAkJcmV0dXJuIHJldDsN
Cj4gIAl9DQo+IEBAIC0xOTQsNyArMTk4LDcgQEAgc3RhdGljIHNzaXplX3QgYmFja3VwX21vZGVf
c3RvcmUoc3RydWN0IGRldmljZQ0KPiAqZGV2LA0KPiAgCSAqIENvbmZpZ3VyZSBERFIgQmFja3Vw
IE1vZGUsIHRvIGNoYW5nZSB0aGUgcm9sZSBvZiB0aGUNCj4gYWNjZXNzb3J5IHBvd2VyDQo+ICAJ
ICogc3dpdGNoIGZyb20gYSBwb3dlciBzd2l0Y2ggdG8gYSB3YWtlLXVwIHN3aXRjaCwgb3Igdmlj
ZQ0KPiB2ZXJzYQ0KPiAgCSAqLw0KPiAtCXJldCA9IGJkOTU3MW13dl9ia3VwX21vZGVfcmVhZChi
ZHJlZy0+YmQsICZtb2RlKTsNCj4gKwlyZXQgPSBiZDk1NzFtd3ZfYmt1cF9tb2RlX3JlYWQoZGV2
LCBiZHJlZywgJm1vZGUpOw0KPiAgCWlmIChyZXQpDQo+ICAJCXJldHVybiByZXQ7DQo+ICANCj4g
QEAgLTIwMiw3ICsyMDYsNyBAQCBzdGF0aWMgc3NpemVfdCBiYWNrdXBfbW9kZV9zdG9yZShzdHJ1
Y3QgZGV2aWNlDQo+ICpkZXYsDQo+ICAJaWYgKGJkcmVnLT5ia3VwX21vZGVfZW5hYmxlZCkNCj4g
IAkJbW9kZSB8PSBiZHJlZy0+Ymt1cF9tb2RlX2NudF9rZWVwb247DQo+ICANCj4gLQlyZXQgPSBi
ZDk1NzFtd3ZfYmt1cF9tb2RlX3dyaXRlKGJkcmVnLT5iZCwgbW9kZSk7DQo+ICsJcmV0ID0gYmQ5
NTcxbXd2X2JrdXBfbW9kZV93cml0ZShkZXYsIGJkcmVnLCBtb2RlKTsNCj4gIAlpZiAocmV0KQ0K
PiAgCQlyZXR1cm4gcmV0Ow0KPiAgDQo+IEBAIC0yMjEsNyArMjI1LDcgQEAgc3RhdGljIGludCBi
ZDk1NzFtd3Zfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICAJCXJldHVybiAwOw0KPiAg
DQo+ICAJLyogU2F2ZSBERFIgQmFja3VwIE1vZGUgKi8NCj4gLQlyZXQgPSBiZDk1NzFtd3ZfYmt1
cF9tb2RlX3JlYWQoYmRyZWctPmJkLCAmbW9kZSk7DQo+ICsJcmV0ID0gYmQ5NTcxbXd2X2JrdXBf
bW9kZV9yZWFkKGRldiwgYmRyZWcsICZtb2RlKTsNCj4gIAlpZiAocmV0KQ0KPiAgCQlyZXR1cm4g
cmV0Ow0KPiAgDQo+IEBAIC0yMzUsNyArMjM5LDcgQEAgc3RhdGljIGludCBiZDk1NzFtd3Zfc3Vz
cGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICAJbW9kZSB8PSBiZHJlZy0+Ymt1cF9tb2RlX2Nu
dF9rZWVwb247DQo+ICANCj4gIAlpZiAobW9kZSAhPSBiZHJlZy0+Ymt1cF9tb2RlX2NudF9zYXZl
ZCkNCj4gLQkJcmV0dXJuIGJkOTU3MW13dl9ia3VwX21vZGVfd3JpdGUoYmRyZWctPmJkLCBtb2Rl
KTsNCj4gKwkJcmV0dXJuIGJkOTU3MW13dl9ia3VwX21vZGVfd3JpdGUoZGV2LCBiZHJlZywgbW9k
ZSk7DQo+ICANCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gQEAgLTI0OCw3ICsyNTIsNyBAQCBzdGF0
aWMgaW50IGJkOTU3MW13dl9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgCQlyZXR1cm4g
MDsNCj4gIA0KPiAgCS8qIFJlc3RvcmUgRERSIEJhY2t1cCBNb2RlICovDQo+IC0JcmV0dXJuIGJk
OTU3MW13dl9ia3VwX21vZGVfd3JpdGUoYmRyZWctPmJkLCBiZHJlZy0NCj4gPmJrdXBfbW9kZV9j
bnRfc2F2ZWQpOw0KPiArCXJldHVybiBiZDk1NzFtd3ZfYmt1cF9tb2RlX3dyaXRlKGRldiwgYmRy
ZWcsIGJkcmVnLQ0KPiA+Ymt1cF9tb2RlX2NudF9zYXZlZCk7DQo+ICB9DQo+ICANCj4gIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBiZDk1NzFtd3ZfcG0gID0gew0KPiBAQCAtMjY4LDcg
KzI3Miw2IEBAIHN0YXRpYyBpbnQgYmQ5NTcxbXd2X3JlZ3VsYXRvcl9yZW1vdmUoc3RydWN0DQo+
IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIA0KPiAgc3RhdGljIGludCBiZDk1NzFtd3ZfcmVn
dWxhdG9yX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICB7DQo+IC0Jc3Ry
dWN0IGJkOTU3MW13diAqYmQgPSBkZXZfZ2V0X2RydmRhdGEocGRldi0+ZGV2LnBhcmVudCk7DQo+
ICAJc3RydWN0IHJlZ3VsYXRvcl9jb25maWcgY29uZmlnID0geyB9Ow0KPiAgCXN0cnVjdCBiZDk1
NzFtd3ZfcmVnICpiZHJlZzsNCj4gIAlzdHJ1Y3QgcmVndWxhdG9yX2RldiAqcmRldjsNCj4gQEAg
LTI3OSw0MCArMjgyLDQwIEBAIHN0YXRpYyBpbnQgYmQ5NTcxbXd2X3JlZ3VsYXRvcl9wcm9iZShz
dHJ1Y3QNCj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCWlmICghYmRyZWcpDQo+ICAJCXJl
dHVybiAtRU5PTUVNOw0KPiAgDQo+IC0JYmRyZWctPmJkID0gYmQ7DQo+ICsJYmRyZWctPnJlZ21h
cCA9IGRldl9nZXRfcmVnbWFwKHBkZXYtPmRldi5wYXJlbnQsIE5VTEwpOw0KPiAgDQo+ICAJcGxh
dGZvcm1fc2V0X2RydmRhdGEocGRldiwgYmRyZWcpOw0KPiAgDQo+ICAJY29uZmlnLmRldiA9ICZw
ZGV2LT5kZXY7DQo+IC0JY29uZmlnLmRldi0+b2Zfbm9kZSA9IGJkLT5kZXYtPm9mX25vZGU7DQo+
IC0JY29uZmlnLmRyaXZlcl9kYXRhID0gYmQ7DQo+IC0JY29uZmlnLnJlZ21hcCA9IGJkLT5yZWdt
YXA7DQo+ICsJY29uZmlnLmRldi0+b2Zfbm9kZSA9IHBkZXYtPmRldi5wYXJlbnQtPm9mX25vZGU7
DQo+ICsJY29uZmlnLmRyaXZlcl9kYXRhID0gYmRyZWc7DQo+ICsJY29uZmlnLnJlZ21hcCA9IGJk
cmVnLT5yZWdtYXA7DQo+ICANCj4gIAlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShyZWd1bGF0
b3JzKTsgaSsrKSB7DQo+ICAJCXJkZXYgPSBkZXZtX3JlZ3VsYXRvcl9yZWdpc3RlcigmcGRldi0+
ZGV2LA0KPiAmcmVndWxhdG9yc1tpXSwNCj4gIAkJCQkJICAgICAgICZjb25maWcpOw0KPiAgCQlp
ZiAoSVNfRVJSKHJkZXYpKSB7DQo+IC0JCQlkZXZfZXJyKGJkLT5kZXYsICJmYWlsZWQgdG8gcmVn
aXN0ZXIgJXMNCj4gcmVndWxhdG9yXG4iLA0KPiArCQkJZGV2X2VycigmcGRldi0+ZGV2LCAiZmFp
bGVkIHRvIHJlZ2lzdGVyICVzDQo+IHJlZ3VsYXRvclxuIiwNCj4gIAkJCQlwZGV2LT5uYW1lKTsN
Cj4gIAkJCXJldHVybiBQVFJfRVJSKHJkZXYpOw0KPiAgCQl9DQo+ICAJfQ0KPiAgDQo+ICAJdmFs
ID0gMDsNCj4gLQlvZl9wcm9wZXJ0eV9yZWFkX3UzMihiZC0+ZGV2LT5vZl9ub2RlLCAicm9obSxk
ZHItYmFja3VwLXBvd2VyIiwgDQo+ICZ2YWwpOw0KPiArCW9mX3Byb3BlcnR5X3JlYWRfdTMyKGNv
bmZpZy5kZXYtPm9mX25vZGUsICJyb2htLGRkci1iYWNrdXAtDQo+IHBvd2VyIiwgJnZhbCk7DQo+
ICAJaWYgKHZhbCAmIH5CRDk1NzFNV1ZfQktVUF9NT0RFX0NOVF9LRUVQT05fTUFTSykgew0KPiAt
CQlkZXZfZXJyKGJkLT5kZXYsICJpbnZhbGlkICVzIG1vZGUgJXVcbiIsDQo+ICsJCWRldl9lcnIo
JnBkZXYtPmRldiwgImludmFsaWQgJXMgbW9kZSAldVxuIiwNCj4gIAkJCSJyb2htLGRkci1iYWNr
dXAtcG93ZXIiLCB2YWwpOw0KPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gIAl9DQo+ICAJYmRyZWct
PmJrdXBfbW9kZV9jbnRfa2VlcG9uID0gdmFsOw0KPiAgDQo+IC0JYmRyZWctPnJzdGJtb2RlX2xl
dmVsID0gb2ZfcHJvcGVydHlfcmVhZF9ib29sKGJkLT5kZXYtPm9mX25vZGUsDQo+ICsJYmRyZWct
PnJzdGJtb2RlX2xldmVsID0gb2ZfcHJvcGVydHlfcmVhZF9ib29sKGNvbmZpZy5kZXYtDQo+ID5v
Zl9ub2RlLA0KPiAgCQkJCQkJICAgICAgInJvaG0scnN0Ym1vZGUtDQo+IGxldmVsIik7DQo+IC0J
YmRyZWctPnJzdGJtb2RlX3B1bHNlID0gb2ZfcHJvcGVydHlfcmVhZF9ib29sKGJkLT5kZXYtPm9m
X25vZGUsDQo+ICsJYmRyZWctPnJzdGJtb2RlX3B1bHNlID0gb2ZfcHJvcGVydHlfcmVhZF9ib29s
KGNvbmZpZy5kZXYtDQo+ID5vZl9ub2RlLA0KPiAgCQkJCQkJICAgICAgInJvaG0scnN0Ym1vZGUt
DQo+IHB1bHNlIik7DQo+ICAJaWYgKGJkcmVnLT5yc3RibW9kZV9sZXZlbCAmJiBiZHJlZy0+cnN0
Ym1vZGVfcHVsc2UpIHsNCj4gLQkJZGV2X2VycihiZC0+ZGV2LCAib25seSBvbmUgcm9obSxyc3Ri
bW9kZS0qIG1heSBiZQ0KPiBzcGVjaWZpZWQiKTsNCj4gKwkJZGV2X2VycigmcGRldi0+ZGV2LCAi
b25seSBvbmUgcm9obSxyc3RibW9kZS0qIG1heSBiZQ0KPiBzcGVjaWZpZWQiKTsNCj4gIAkJcmV0
dXJuIC1FSU5WQUw7DQo+ICAJfQ0KPiAgDQoNCg==
