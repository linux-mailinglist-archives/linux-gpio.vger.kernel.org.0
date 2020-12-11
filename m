Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6832D761A
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 13:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406062AbgLKM4F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 07:56:05 -0500
Received: from mail-eopbgr70050.outbound.protection.outlook.com ([40.107.7.50]:40065
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2406060AbgLKMz4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Dec 2020 07:55:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBMdIXXXQRkKC9pRAHaCgFqW5S1F54dPfVPBl2vangH7IJ7lQ3W/jZLCrMC5SXF1g31DrKjHx8rVPag1a8zc7odf8CRW3MajhZxJKF5DsL1WuYUAmAAhhgQ8giUgHW6XMmXn6eVJRaEz01Er8Z5J/x4r+JeDeJsleEvczVgjAqpBP7AlnkaJC5VjPZHBIQMwmjHnK6hWRDaPtoKgdTFf0K5rY9rtLbHlwJbCN3U/omCT/+KBpxIPDcc0JHEOYF6zO2gBSuC3qsfnWzPej9Ob8vae9hKHmRQ7D5dPWMrRlCZ7+VlzOjUjFthDC/F9T/l2Vyxy26PdglnjvWc4M6tP9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00znMXLsTaID4dTYyrPRyOxillJI+zMKWHENL2RR9rA=;
 b=d7F1wKwGFAk3suAob8sVnDmBkWFdsmVsSCfR79q1/LQo0G9bckss7iQ3QAOhYHuO9QDvSf6OYfhg41L6JWCLuwUrNsriG8SpvMxHULAZqDv0RHA9OsUufpSoas03aJUxTHWqrX6kF4dESUPj1iQFdiMCM4Ru5TsN836z4IhpqlOX2wf3LBj4ZanHP/Mv9Swg89Gf75Ji/kTnAPzvzNm2Psd1edvWoZOJNR1cRSrHjzuZ5ktvkUcWXeFyANIzaCp5SIdoJ5ilOKqISsV5PiimpENZKyqx6EUylnUAw6P6ooGESt7xcKnqOhs74Ss98tTsRibGXwScm4FVicgYlBhNLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00znMXLsTaID4dTYyrPRyOxillJI+zMKWHENL2RR9rA=;
 b=byW+Jpd7PLnX+njujL3PMHZX0J+njGqK93Lh8U/0uS4yxXt6460Xhh2pHg6l9MbWQ+Kv2mQ9UzyIcZG4ANgds8wjMN20JeJeqaBowkAM0rIKb2SrJFTSiyQCHrf4t3hfvUk9y20j4gcmJl4Q+7oKo8GfHm0yYQng1ZFqAG2vJvE=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB2987.eurprd03.prod.outlook.com (2603:10a6:7:5b::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.23; Fri, 11 Dec 2020 12:55:06 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87%6]) with mapi id 15.20.3632.023; Fri, 11 Dec 2020
 12:55:05 +0000
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
Subject: Re: [PATCH v2 07/10] gpio: bd9571mwv: Add BD9574MWF support
Thread-Topic: [PATCH v2 07/10] gpio: bd9571mwv: Add BD9574MWF support
Thread-Index: AQHWz7CxyBRCUhElOkygwwjR9O9qrKnx2k+A
Date:   Fri, 11 Dec 2020 12:55:05 +0000
Message-ID: <0d0e0b6e47cdc28f2053d0f2be7e237f2586d46c.camel@fi.rohmeurope.com>
References: <1607686060-17448-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1607686060-17448-8-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1607686060-17448-8-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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
x-ms-office365-filtering-correlation-id: 4c077a19-bc55-44f7-0e30-08d89dd3fbb4
x-ms-traffictypediagnostic: HE1PR03MB2987:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR03MB29870B1010C4A1E5282333F2ADCA0@HE1PR03MB2987.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zym/F860FsvZsqJ1xnx3m5J9ZCVj0i7Bndn++dydmMvJaxg2t4XC1nWF8mykDnoCUDC4OIoo5/BcuVHGP/jnpSeeycLLw2gjs89QlnLhrWAquj+szHkX6xo4RL3oI0k213W70ZiEiyAgN9EQgYt2XM0HbA0nQfYBDDOt5hQ+7hwyXj3Sgqha1OB8YxQvamIXNbaTvZyghS0e+0hwtjbsG+TM+k5np/rdTyWcu7AgruhhPMJMdVtMyiLDgb3kl7ppykUDRh59vVFZzhPjO5n6BzJHogHemchmaXWmEp/UYHjvujzAbJvlda+7Rh40gN6HHxPS40J7mrBHvmFq/j4AVw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39840400004)(478600001)(64756008)(2616005)(8676002)(8936002)(83380400001)(6486002)(54906003)(86362001)(66446008)(110136005)(4326008)(2906002)(26005)(5660300002)(71200400001)(66946007)(6512007)(7416002)(76116006)(6506007)(186003)(66556008)(3450700001)(4001150100001)(316002)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?akdjT1lvOXhoWDd0QWlGMGlSbTNoUWYrNUduS1BMVUtIUUU3T04valBrWlNR?=
 =?utf-8?B?YXdndnljdGhvWWJUZ1ROYjhzOXF3c2pBMG93V1QzMVhVWUx1OU5TeTN1Ymh6?=
 =?utf-8?B?blNqUVU5Z214L1hYVmxFSTRENmJvNHlra0E1MUVNeTJaWFFkajBqQ1NNQXNS?=
 =?utf-8?B?dEd6NXNveDhSM1dITklYajBhVjlSKzhVdjdoc2RiQzBFUzhGZlhMWS9mR25z?=
 =?utf-8?B?T1hRZ3NUQWo0dGdXQ0ducFBML21TTkRoVExNWFBSKytVUlowZlNEbGZiUHp4?=
 =?utf-8?B?VTFWaVVpSVAza1E2K3lRelpsOUFubE9kZWVUd2ZaVDNnZjF3ZFV4K3BZVGdj?=
 =?utf-8?B?N1lFZ00zbDdpNzYvb1dMNDBSYWRhNW9VemNRekNxYnBxakJnakNWUXdpemhC?=
 =?utf-8?B?NmNkZnZFd2FvT0dmRHVSSjc2MmJaWDFnSDhXRHdaZ3dXTStTaVVscGR1bGVo?=
 =?utf-8?B?R0VaNzZPejJiZW5KSksyNDNadmhnclc0Rkh5MmZXRUVJQndFTnRDeXVTMU1t?=
 =?utf-8?B?czhML3JOOS9Wa2NBclNMUGVBYU5FdEJ5a0hKblJ3dXF6RVcvUUIxS0gwM2U0?=
 =?utf-8?B?QlFMSmFCVEJacnE1V3laYS9veWZqTEplRnVzMzEyZUpncCtkOWVjbjU1TmdY?=
 =?utf-8?B?VjZwYngwNk5KQmJ4OWRWaTFKWVMvVUVlNU1MT1ExTEVybHRGVUpORmdZU0xU?=
 =?utf-8?B?Q0xyVWQ5VXU4eG9sbUlaNmlLcjVXcURpMmRib0VIeGhZdVBRSDVUUmZabE0w?=
 =?utf-8?B?clQvdk5LckF5Z1c5VWliZVUramJKSkpXeEhXY0xiNkN4S0JzeW1scittT282?=
 =?utf-8?B?c3MyYkZTdHZaS29zb2M3WWJUUnBheFNZeWZlYnZwcmM4ZkNacTZZTFdqells?=
 =?utf-8?B?aTNhSTc1bjNnaEF1cTcvdFd6QWhWR0lHTHUzYzFnMTM2VFlRYTc5V2lCNmNo?=
 =?utf-8?B?a0c3VTYvRTJFYkU5bzZsSXZRV1dyaXFaR013WE4yeXNmWjhVSDJraEVGc2JI?=
 =?utf-8?B?Wm1yN3BkdDI4UkVmSGkzK1NFck96K2g2djJvcUdYMkJqVGdHYVM5eXB4cVRE?=
 =?utf-8?B?UTZybmZZcEtYc2VjLzl6WHV3MWpGWG1iMWtaVk4rUjY1T0dDK0VJYzJ5M0Nm?=
 =?utf-8?B?NHFGcjFudTNLNzdtNHMvQXFkSzcvMVcrQnRJT0w3bE5kSElxRlpVcDB6aWJV?=
 =?utf-8?B?YVBhWkZyN3grSFRmc054bkJsQ1RSSlhBalRjb2FQSldSTGkwdW5yUXdVR3RY?=
 =?utf-8?B?WXBoMWNGOU5CU0NMTWJOVDVweUdxaTJTV1RHM0FTenlMTXRqMjdUVVpyRTFt?=
 =?utf-8?Q?L8isJA9KEC/bMIabRvmN3egUX5jXMD44mQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA34EA5E56FDE84A8EB57973F2F15B75@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c077a19-bc55-44f7-0e30-08d89dd3fbb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2020 12:55:05.8527
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oevpYsJkUjbEgC53p1H8JynRx+Xl5f3E/iXFHBc8k2KegK+bNBfP4pO9QbgeeckWYSPyLl7Hp4PKl2+3e3eKOXkUyyZPaMvAMsl+wKm4q21KmBTQUHppR1zSbRMJ+ywr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB2987
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBGcmksIDIwMjAtMTItMTEgYXQgMjA6MjcgKzA5MDAsIFlvc2hpaGlybyBTaGltb2RhIHdy
b3RlOg0KPiBBZGQgc3VwcG9ydCBmb3IgQkQ5NTc0TVdGIHdoaWNoIGlzIHNpbGltYXIgY2hpcCB3
aXRoIEJEOTU3MU1XVi4NCj4gTm90ZSB0aGF0IEJEOTU3NE1XRiBoYXMgYW4gYWRkaXRpb25hbCBm
ZWF0dXJlLCBidXQgZG9lc24ndA0KPiBzdXBwb3J0IGl0IGZvciBub3cuDQoNCm5pdDoNClBlcmhh
cHMgbWVudGlvbiB3aGljaCBmZWF0dXJlPyBBbmQgSSB0aGluayB5b3UgbWVhbiB0aGUgZHJpdmVy
IGRvZXMgbm90DQpzdXBwb3J0IGl0IHlldD8NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWW9zaGlo
aXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KDQpGV0lXOg0K
UmV2aWV3ZWQtQnk6IE1hdHRpIFZhaXR0aW5lbiA8bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJv
cGUuY29tPg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncGlvL2dwaW8tYmQ5NTcxbXd2LmMgfCA2ICsr
KystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8vZ3Bpby1iZDk1NzFtd3YuYyBiL2RyaXZl
cnMvZ3Bpby9ncGlvLQ0KPiBiZDk1NzFtd3YuYw0KPiBpbmRleCAwZTUzOTVmLi5kZjYxMDJiIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby1iZDk1NzFtd3YuYw0KPiArKysgYi9kcml2
ZXJzL2dwaW8vZ3Bpby1iZDk1NzFtd3YuYw0KPiBAQCAtMSw2ICsxLDYgQEANCj4gIC8vIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkNCj4gIC8qDQo+IC0gKiBST0hNIEJEOTU3
MU1XVi1NIEdQSU8gZHJpdmVyDQo+ICsgKiBST0hNIEJEOTU3MU1XVi1NIGFuZCBCRDk1NzRNV0Yt
TSBHUElPIGRyaXZlcg0KPiAgICoNCj4gICAqIENvcHlyaWdodCAoQykgMjAxNyBNYXJlayBWYXN1
dCA8bWFyZWsudmFzdXQrcmVuZXNhc0BnbWFpbC5jb20+DQo+ICAgKg0KPiBAQCAtMTAsNiArMTAs
NyBAQA0KPiAgICovDQo+ICANCj4gICNpbmNsdWRlIDxsaW51eC9ncGlvL2RyaXZlci5oPg0KPiAr
I2luY2x1ZGUgPGxpbnV4L21mZC9yb2htLWdlbmVyaWMuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9t
b2R1bGUuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4gIA0KPiBA
QCAtMTE4LDcgKzExOSw4IEBAIHN0YXRpYyBpbnQgYmQ5NTcxbXd2X2dwaW9fcHJvYmUoc3RydWN0
DQo+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIH0NCj4gIA0KPiAgc3RhdGljIGNvbnN0IHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2VfaWQgYmQ5NTcxbXd2X2dwaW9faWRfdGFibGVbXSA9IHsNCj4g
LQl7ICJiZDk1NzFtd3YtZ3BpbyIsIH0sDQo+ICsJeyAiYmQ5NTcxbXd2LWdwaW8iLCBST0hNX0NI
SVBfVFlQRV9CRDk1NzEgfSwNCj4gKwl7ICJiZDk1NzRtd2YtZ3BpbyIsIFJPSE1fQ0hJUF9UWVBF
X0JEOTU3NCB9LA0KDQpJIGd1ZXNzIHRoZXNlIENISVBfVFlQRVMgYXJlIHVzZWQgYnkgc3Vic2Vx
dWVudCBwYXRjaGVzPw0KDQpJIGd1ZXNzIHRoaXMgbWVhbnMgdGhlIGV4aXN0aW5nIGZ1bmN0aW9u
YWxpdHkgaW4gYm90aCBjaGlwcyBpcyBzYW1lLA0KcmlnaHQ/IChHUElPIHJlZ2lzdGVyIGFkZHJl
c3NlcyBldGM/IC0gSSBkb24ndCBoYXZlIEJEOTU3MSBkYXRhLXNoZWV0DQpzbyBJIGNhbid0IGNo
ZWNrKQ0KDQo+ICAJeyAvKiBzZW50aW5lbCAqLyB9DQo+ICB9Ow0KPiAgTU9EVUxFX0RFVklDRV9U
QUJMRShwbGF0Zm9ybSwgYmQ5NTcxbXd2X2dwaW9faWRfdGFibGUpOw0KDQo=
