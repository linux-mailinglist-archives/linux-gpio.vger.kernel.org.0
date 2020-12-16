Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 156122DBC7B
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 09:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725829AbgLPIOQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 03:14:16 -0500
Received: from mail-vi1eur05on2079.outbound.protection.outlook.com ([40.107.21.79]:62689
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725287AbgLPIOP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Dec 2020 03:14:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqIKp8RxEBAeixzdOVWKjgYn3SBSV/7xdbQl5AmSjnQ65EgUlYA82DWz3EYHZVEUWinDSA3ljCI7cAQsJ9YdH/bPKf/IZw+USTnezxQ2bzl7zUrATmFzmP+SWybhMveXZa9OHg8llIdbrvHGX7WSKCeivbgkJBgb0Rlfjh+zO5itVa+xhQyySkwl99SjOcIwzkPRqB4EIoJSUYTvJLTt17HumCnPOfoD9VYyhfzc5oGiUThzvf5xDHvz8rcduWs39DsJ6kXlogoptbpcTcHZYmO92ksXa0s6m2xvCCT0ZgthY9atLb9eat1z9bD+d2T02gNhUXVuXyAB3CayyKwcDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwF17kkf7Poolj9dmZncqygOWydnTI3kOUPm5Acyuog=;
 b=GrdyXlXLxWBs+3zU1GkYZ+hpy8kZeMu9vVbwkK5pVuTi6ows1IY7BjZAhawdixYWlTo8Zh0f25Cp8uPhjNGhb4odBeuRXgO4B65T44KmU0QTbb0PmDhH9r5rwHOZw4d5E6zdgSXnt6pf8/iAg16KNHuIpe7y0gwhVsagNOr7HRJdoCkcWfM8xctYWm3VNa8hkBk8eCpwV2Vr8LfmQd1yG+iOArEPe1wKGvq6jMndGm67fxas4mgzkmErJFSiTM8J6Q5WHKEZx6dFAc0kr1J3DPeZPdzXcS2uJC3k5sD6iKgkQUKTAh3lmYv1Yjlv/8/vlqVh/kPfBxkBY6+mQ80Urw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwF17kkf7Poolj9dmZncqygOWydnTI3kOUPm5Acyuog=;
 b=Yg2S+REk7oPPIa/kizeCeQ2LEVw95XNGXj6iIrl3RO2puQ89/0R1U6hbN/QRr1jRLsxXRIyK226Ida+7BBTPLDW3lqoyvPjF7PRzPVo4ii5gCTfNZEuWFipi/ywQE6w1EpflTKwV9vhNouyO3VqzY0G94VZ2ITPwmP6qM7hTPz0=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2315.eurprd03.prod.outlook.com (2603:10a6:3:23::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.24; Wed, 16 Dec 2020 08:13:20 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87%7]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 08:13:20 +0000
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
Subject: Re: [PATCH v3 10/12] mfd: bd9571mwv: Use devm_regmap_add_irq_chip()
Thread-Topic: [PATCH v3 10/12] mfd: bd9571mwv: Use devm_regmap_add_irq_chip()
Thread-Index: AQHW035xx8LnKv3oeU2cYHcldjYXIqn5X56A
Date:   Wed, 16 Dec 2020 08:13:20 +0000
Message-ID: <be6e3fd4b93865f285ed5470779e5c0f5eb37312.camel@fi.rohmeurope.com>
References: <1608104275-13174-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1608104275-13174-11-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1608104275-13174-11-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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
x-ms-office365-filtering-correlation-id: a541c5a9-7987-48d0-0d57-08d8a19a737a
x-ms-traffictypediagnostic: HE1PR0301MB2315:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB2315DAF92C3C4E012DBFAEC7ADC50@HE1PR0301MB2315.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e7FiPMc1UyXwKXRMkqAH2EPTbc+/e9jkWayOo2qkbahdaoGOwDOgnbd+082nGDh9jf8PUcyTsKTf21hbzWsErtU1nBlLdBgAuehYrKvkye+CdJbzh4JBYM/ZJc1rNFr81aGZ9gHNowuinVBqZZ0CcIV19E54iUBBSOuYHMWSZNm5ENdvMeHg7m9WHNtOWjcPb/izu/oF4J348CHO9lOzEaNF0gxrvikBPIm2VRkLAnjrG+xt7yTOkn38Qd+IjhxbEu3biEdlRyWX5JPkHYDsu2C20N9diPaPIhubfOY6zudVq8QL0GlXaPfN+fkdGyJC5On9Fy0+1W4hWMDdsIVMSw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(39840400004)(346002)(366004)(5660300002)(8676002)(83380400001)(6506007)(8936002)(71200400001)(7416002)(4001150100001)(6512007)(26005)(186003)(66556008)(86362001)(110136005)(6486002)(3450700001)(4326008)(54906003)(478600001)(66446008)(66476007)(64756008)(316002)(2616005)(66946007)(2906002)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?WEtoKzBYdmNBbXFNRHF5dkx2WEx0aUNnRU9Fei9oMy9GTzJVb205QmRHdy9H?=
 =?utf-8?B?UzBBMm1Xa1NXTVFwYjNWcTBJV1FJNlN0VmEzVnRSeXRkd0FCNGZjUVQxL1Vx?=
 =?utf-8?B?YlJWa3NLLzlqWVlyaGdmTW1RNnRCdE9ybVVLOUJXSXRIcWU5dE1IaEdYZDZR?=
 =?utf-8?B?UlJ5SmhLWDZXYU5yaGZQS3ZIMzZOZ3hhS0hxY0lBRnhDTmx3dWZvK052TGJY?=
 =?utf-8?B?UVRtMEJKdTd5TWFzaFJXNDZsbkk4K1N4aXA5QXpWZ3FYNFovZDc4Nm51VlBJ?=
 =?utf-8?B?elJid1BTc2VUUHB4VVZwYUQwZ2JoM25Uek93Vmg3UEEvWm5KbkNaRk1RNWkr?=
 =?utf-8?B?dU1GVCtKdk5SenNOcXZIa0V0dXpydEdTSUtObGpkVnV1MWkxdGo1R1pBM1pE?=
 =?utf-8?B?aVNHQnpQc3lPSVZ6NXpoUzdKaVVlamhzUDl4WGZJaGhNSVh0K3FycUNTWEsr?=
 =?utf-8?B?enFSSTkycTBhQ01tWGwvekNobTZCbzhJM1daZmErN09yQjAwVFI5dWdWczhB?=
 =?utf-8?B?V1BKVFFVN2RyWXBYRlNpMU5SN01ualE1dkZJVVp5Wkd6cjhTOHVEY2NUVWl5?=
 =?utf-8?B?ODlFemNmdmdTN3ZNbEU2Y3IzSlZzQktVRnRHM3hBT0wyVURuNzlVRXdOUGJK?=
 =?utf-8?B?STUyU0FRK3haY2YyK1JwZDhucFNiQ29FZ1FTb3hZWUMyT0dkUjRkeHQ4ZDhI?=
 =?utf-8?B?dmN6T1F2ZStYeWlvdXlPRm1hSUFQLzVXWi9PRkRVOTBoeHBBK2swR1V3Z0Zl?=
 =?utf-8?B?Z0xGV1RzYUFNNldMSHpncWt3ZXByRklrNk1DSFRPeWVzMHlURmwvVWlHbzJB?=
 =?utf-8?B?S3Y0Z2k5UWJmTzk5dVM1VkN0SlpNYnZGRUN2dldNUU1xd3JFcGdxNXFqb2pm?=
 =?utf-8?B?eXFzc1BWaTJId1RZVXFVVmkxRGxzOGhhTkVORXBmOHdOQ2VEWWpwTnFic0w1?=
 =?utf-8?B?a1hLK2paOHpaQkN4QjNPRFVQcHJkc1BzVTdPTTNqVWh1cWx2ZHo1K1g0di9j?=
 =?utf-8?B?YzdRaE13MUhxU1BFN3NTdW0rUUlyMmxGbmQydk52Q3JRUTQwSXY3TVc4Yzh4?=
 =?utf-8?B?aW8wendidzRSa1J5cmh2TUw4Q2hzQlN1dDVSNUNsVGFqMkZDeld6S1FDRmlw?=
 =?utf-8?B?RUNGOWkyRzVBeUdoMjhNbzZjL1VaaFc5OS9ldWljcDhTOUIvOFYxL1ZyUGQz?=
 =?utf-8?B?eHhsV0lmdUZJZXZsNVRiR2lobHFiUjltUWZ1VDkrN3FmVm84M25wRWtaanJp?=
 =?utf-8?B?NUxXcDVUMzNoTW1HQ2VsUWJubEc4cWpJQjE5RFpOK29IZDMzUHBabWE0dXlE?=
 =?utf-8?Q?A/uWg0R8Xtve+32/Wlj7ljcxjQgr95sGEt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B7172A0419868F418BD8E10B56A23B55@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a541c5a9-7987-48d0-0d57-08d8a19a737a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 08:13:20.6499
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I0ySP5tD0hMmK/HVP/cgggMdWPTwIFEhkiQCxiN2ZjeL7r57nMla9O2DqVk4Vvc5+qAdL1/pwAFfw8/fIznDYEBUTX1QfauQJOsQy8j9iuKeiYobIMQOW+HhzMk3p1br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2315
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBXZWQsIDIwMjAtMTItMTYgYXQgMTY6MzcgKzA5MDAsIFlvc2hpaGlybyBTaGltb2RhIHdy
b3RlOg0KPiBVc2UgZGV2X3JlZ21hcF9hZGRfaXJxX2NoaXAoKSB0byBzaW1wbGlmeSB0aGUgY29k
ZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hp
bW9kYS51aEByZW5lc2FzLmNvbT4NClJldmlld2VkLWJ5OiBNYXR0aSBWYWl0dGluZW4gPG1hdHRp
LnZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4NCg0KPiAtLS0NCj4gIGRyaXZlcnMvbWZkL2Jk
OTU3MW13di5jIHwgMjcgKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL21mZC9iZDk1NzFtd3YuYyBiL2RyaXZlcnMvbWZkL2JkOTU3MW13di5jDQo+IGlu
ZGV4IGU2OGMzZmEuLjQ5ZTk2OGUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWZkL2JkOTU3MW13
di5jDQo+ICsrKyBiL2RyaXZlcnMvbWZkL2JkOTU3MW13di5jDQo+IEBAIC0xNzAsMzEgKzE3MCwx
NyBAQCBzdGF0aWMgaW50IGJkOTU3MW13dl9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudA0KPiAqY2xp
ZW50LA0KPiAgCWlmIChyZXQpDQo+ICAJCXJldHVybiByZXQ7DQo+ICANCj4gLQlyZXQgPSByZWdt
YXBfYWRkX2lycV9jaGlwKGJkLT5yZWdtYXAsIGJkLT5pcnEsIElSUUZfT05FU0hPVCwgMCwNCj4g
LQkJCQkgICZiZDk1NzFtd3ZfaXJxX2NoaXAsICZiZC0+aXJxX2RhdGEpOw0KPiArCXJldCA9IGRl
dm1fcmVnbWFwX2FkZF9pcnFfY2hpcChiZC0+ZGV2LCBiZC0+cmVnbWFwLCBiZC0+aXJxLA0KPiAr
CQkJCSAgICAgICBJUlFGX09ORVNIT1QsIDAsDQo+ICZiZDk1NzFtd3ZfaXJxX2NoaXAsDQo+ICsJ
CQkJICAgICAgICZiZC0+aXJxX2RhdGEpOw0KPiAgCWlmIChyZXQpIHsNCj4gIAkJZGV2X2Vycihi
ZC0+ZGV2LCAiRmFpbGVkIHRvIHJlZ2lzdGVyIElSUSBjaGlwXG4iKTsNCj4gIAkJcmV0dXJuIHJl
dDsNCj4gIAl9DQo+ICANCj4gLQlyZXQgPSBkZXZtX21mZF9hZGRfZGV2aWNlcyhiZC0+ZGV2LCBQ
TEFURk9STV9ERVZJRF9BVVRPLA0KPiAtCQkJCSAgIGJkOTU3MW13dl9jZWxscywNCj4gQVJSQVlf
U0laRShiZDk1NzFtd3ZfY2VsbHMpLA0KPiAtCQkJCSAgIE5VTEwsIDAsIHJlZ21hcF9pcnFfZ2V0
X2RvbWFpbihiZC0NCj4gPmlycV9kYXRhKSk7DQoNClRoZSBmdW5ueSBkaWZmIGZvcm1hdHRpbmcg
Z290IG1lIGZvb2xlZC4gSSBzcGVudCBhIHdoaWxlIHdvbmRlcmluZyB3aHkNCnlvdSBkbyByZW1v
dmUgdGhlIGRldm1fbWZkX2FkZF9kZXZpY2VzIC0gdW50aWxsIEkgbm90aWNlZCB0aGF0IGl0IHdh
cw0KanVzdCB0aGUgZGlmZiBwbGF5aW5nIHRyaWNrcyAtIGl0IGlzIGFkZGVkIGJhY2sgaW4gdGhl
IHJlbW92ZS4gSSBzaG91bGQNCnByYWN0aWNlIG15IGRpZmYgcmVhZGluZyBza2lsbHMgOikgQnV0
IHRoZSByZXN1bHQgbG9va3MgZ29vZCBhbmQgY2xlYW4NCnRvIG1lIQ0KDQo+IC0JaWYgKHJldCkg
ew0KPiAtCQlyZWdtYXBfZGVsX2lycV9jaGlwKGJkLT5pcnEsIGJkLT5pcnFfZGF0YSk7DQo+IC0J
CXJldHVybiByZXQ7DQo+IC0JfQ0KPiAtDQo+IC0JcmV0dXJuIDA7DQo+IC19DQo+IC0NCj4gLXN0
YXRpYyBpbnQgYmQ5NTcxbXd2X3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPiAt
ew0KPiAtCXN0cnVjdCBiZDk1NzFtd3YgKmJkID0gaTJjX2dldF9jbGllbnRkYXRhKGNsaWVudCk7
DQo+IC0NCj4gLQlyZWdtYXBfZGVsX2lycV9jaGlwKGJkLT5pcnEsIGJkLT5pcnFfZGF0YSk7DQo+
IC0NCj4gLQlyZXR1cm4gMDsNCj4gKwlyZXR1cm4gZGV2bV9tZmRfYWRkX2RldmljZXMoYmQtPmRl
diwgUExBVEZPUk1fREVWSURfQVVUTywNCj4gKwkJCQkgICAgYmQ5NTcxbXd2X2NlbGxzLA0KPiBB
UlJBWV9TSVpFKGJkOTU3MW13dl9jZWxscyksDQo+ICsJCQkJICAgIE5VTEwsIDAsIHJlZ21hcF9p
cnFfZ2V0X2RvbWFpbihiZC0NCj4gPmlycV9kYXRhKSk7DQo+ICB9DQo+ICANCj4gIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGJkOTU3MW13dl9vZl9tYXRjaF90YWJsZVtdID0gew0K
PiBAQCAtMjE1LDcgKzIwMSw2IEBAIHN0YXRpYyBzdHJ1Y3QgaTJjX2RyaXZlciBiZDk1NzFtd3Zf
ZHJpdmVyID0gew0KPiAgCQkub2ZfbWF0Y2hfdGFibGUgPSBiZDk1NzFtd3Zfb2ZfbWF0Y2hfdGFi
bGUsDQo+ICAJfSwNCj4gIAkucHJvYmUJCT0gYmQ5NTcxbXd2X3Byb2JlLA0KPiAtCS5yZW1vdmUJ
CT0gYmQ5NTcxbXd2X3JlbW92ZSwNCj4gIAkuaWRfdGFibGUgICAgICAgPSBiZDk1NzFtd3ZfaWRf
dGFibGUsDQo+ICB9Ow0KPiAgbW9kdWxlX2kyY19kcml2ZXIoYmQ5NTcxbXd2X2RyaXZlcik7DQoN
Cg==
