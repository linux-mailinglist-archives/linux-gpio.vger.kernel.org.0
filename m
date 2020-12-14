Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F054E2D933F
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 07:23:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438748AbgLNGWI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 01:22:08 -0500
Received: from mail-eopbgr1410119.outbound.protection.outlook.com ([40.107.141.119]:42433
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2438746AbgLNGWH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Dec 2020 01:22:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1Gw9Xk0+Z0tDW5DtuYDA+/nln5Dl8aCwumnuOCp97McondAr1/3q7e71oPDvtzkNQm1cCPWZ64c2MtYifvBU8xfjKXtFpN/xg9RNSBMPnlHtsEdxM+zW3tIbM2xapE/pPLJwFeImSrkth9ErEcU2IqxhOQLvqXgA7OsTHdlqE0hraObefPNKalqBDNbvJC9MMoCX+JoUGLDev9LubOTPgjeorD5ZW8ITKEZRbs3HJB+UlZMe082vw4bFYatO1Wt/Oxgnwym88uZzLqayZqqC4PG357yjFPRvAq1zMxAAIJi4kVOT4upivHv4ZlzDFt3mUqvLLAjK0BB6gcWMG58Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQt2jh/9XPKRMu0vHW3N84dEpe1h3++PAuEQ1GfWIJc=;
 b=A4QspJzRRQI1fd0j2qdcESNwSGwjz+Qvp6fNPA6icA9Fc0koTOzNXTMTVtbNAB42oX7BDo8V3UlEe4X51AahhIoo9W2uBeLbnU6tpnWlHDEikxJUHuc58q2GpUmScmHlNWJlkqIHOuQyd0EGQKJ/+R031FlvGcM8dSVfWQYBLjR2Nflm+YjrlM0Ip/yGRmdPmCl2hB1SFfq5S39si7rPIV/X144vOc1bYeWpcEAIHxIcCfnTWpQCmcNAAjGnYcc8sw2iXJdEZpjb5mbASpiSN5nUgHYY/Tpyxu+DmYtUCAE6ObpkDBNgiMpAPQvXOHVsGQppXRTfj5/kNwXZxrgvZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQt2jh/9XPKRMu0vHW3N84dEpe1h3++PAuEQ1GfWIJc=;
 b=K1UmE3l56m85SdQx10sbrWPWSQ1DLxwfbDDqcndrGEAVp9sqch8kUeOj3k7ZaoDUyOv3LG9GvLgCLSYiierw9SBGYViGDjfQpY4k1F1nmnWk4AcOUYjZV704Ci8YxRgQiLSpPmYeiUjwe0eCjvZcUSimLCPzDN71RhgSpzbWtN8=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB4079.jpnprd01.prod.outlook.com (2603:1096:404:bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Mon, 14 Dec
 2020 06:21:16 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3654.025; Mon, 14 Dec 2020
 06:21:16 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 09/10] mfd: bd9571mwv: Make the driver more generic
Thread-Topic: [PATCH v2 09/10] mfd: bd9571mwv: Make the driver more generic
Thread-Index: AQHWz7Ct3UnUj4gWBEWTnpmRZl+chanx49wAgAQ63cA=
Date:   Mon, 14 Dec 2020 06:21:16 +0000
Message-ID: <TY2PR01MB369258FAD3F340A046A11525D8C70@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1607686060-17448-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1607686060-17448-10-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <bffe84a32c983b5d15fb5e0b3b42dc8b28d6f3bf.camel@fi.rohmeurope.com>
In-Reply-To: <bffe84a32c983b5d15fb5e0b3b42dc8b28d6f3bf.camel@fi.rohmeurope.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fi.rohmeurope.com; dkim=none (message not signed)
 header.d=none;fi.rohmeurope.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:1453:ff:c191:5a7a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4439265f-301f-41e3-c0de-08d89ff876ed
x-ms-traffictypediagnostic: TYAPR01MB4079:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB40799AF9AC5528CE860370E4D8C70@TYAPR01MB4079.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w2KKzk2yH67GTfL+AmW6MK9TAojsFhKlZAf2vPmyItW8Wv67hsPEMrlksmOXf3ibP3NJlS9DwVTB00+oE9OiWJ3NrDIcHkY06nZ07/cpEzM1c3TjxoFCvUIUJ7TmE/5I7tnmMplFG0qksPEl1f6K317bYJXG/WZRjmh/BPDuoi1O5S8BzWFYBD6OiE2oYnHNwh968Zft4EoPUZ2sCAyLmCqECSIsXdG1X0SNF6L5i7CII4vHlJxk93p77yCyGttjzCuFpxg+vdg2dml5wDyTQszLw+2rR2zuFSA5EsNtLYIkBfkcMWLBwY4JLhNObZmszKTFgQo8idamYvnLmpW3NfRxmoG3jx9dDiLHQG7WQN/evxYC83HSiWCG6DZki8KY
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(66476007)(66446008)(186003)(7696005)(2906002)(478600001)(64756008)(8936002)(4001150100001)(52536014)(71200400001)(5660300002)(7416002)(86362001)(8676002)(76116006)(4326008)(66556008)(6506007)(66946007)(316002)(54906003)(110136005)(83380400001)(33656002)(55016002)(9686003)(41533002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?U2lPeU5LNmErK0dua1MvOGFHNUNWeDYwVW5yeVFpN2dJVmVrM0RXN2lEeTRI?=
 =?utf-8?B?MGJzQmREdW1wV0pMcGRBQmc3V2pvMUR0TjFuSlIrZUh5YXRaT0E5YTdpTDV6?=
 =?utf-8?B?K1dvQUhGenBwNGNZWXlVdyt0THpYWVVRUGhzR1Fzcjl1bVJqQkFEMlNDcEF6?=
 =?utf-8?B?ZWFWLzlVc3cwdk9WanRKcGZlRXd3ZS9uL2h4aU1NNk9JamxBLzJpakRFRjJH?=
 =?utf-8?B?dTEzdlhTZjJLdkhZOStXRWY3MG1idzY4UXRZMEtkalJlejFGMmNXVXpQRzBH?=
 =?utf-8?B?dkdpYkx6b2sxQUFsUmhxWU9VTG1BdUdwamZ3Z2xRenNkYURGK01tWUZua1hB?=
 =?utf-8?B?QTY3cWdmeWRGODB2UVpreGk4Z0JGRWV3d1JlZVF3NXJPbDRiRFBKT1pJR2F4?=
 =?utf-8?B?b3l6Q2llall0RitLQW1BWU5aaFNmWGZxU1AyVHVkYUNUUDgxUlJFMm15OVlQ?=
 =?utf-8?B?Skp1UmNsVWMyTzVsWVE1cy9CaUVQRWJ2bTQ0clRHSnNLRG13c0NxbDBwZUJy?=
 =?utf-8?B?dlB6K2pQdEpDVDNLak9mdUd3TlgzNnZTa0h3Yjgydi9Vc3Ztd0RhejRKWVVJ?=
 =?utf-8?B?OG05ckRsT2laekt5WU1ub2F5bGMrNk9reDkrcUgwWXA2Q0pxOUllMHVRTXZy?=
 =?utf-8?B?cVlSbzJJUVpBc3lhUit6cXNROWhGWFNFbUorZnAwM3drVDM0MkFQS3NqVzNN?=
 =?utf-8?B?d0FMSWdhSFB6MytyVkdPamdJSDRNWmkwOUZCODBheEpUclNqOUI2WmJ4Y1NR?=
 =?utf-8?B?aEp0OFJGWnBiSW9tY3U1b2JvdHgySHhPeENhR1pGTDN6OW9lWWt2MDByVDlT?=
 =?utf-8?B?T09RaFkrZTMyN2VMZytReUFzZUNWUmt3UlFHa2twdk5hV3dtbHhtcTB2cTR2?=
 =?utf-8?B?YUhPamhJNU9waU1hbVZISzJaU090ZVJIWUNJckJOQ2g0TFVpTmJWdm01VTI5?=
 =?utf-8?B?VlhpeVYxQ1F4cE8ySFNsY3FweHEzbnBTRDJlVm1WZEwwQVZkckRuc0tmOUE0?=
 =?utf-8?B?azN1VFV5YXVUMW9PNkd0Szh5eW40Y0ZvOVFmN1Vnd2p3UVB3aEp5alJkRzhk?=
 =?utf-8?B?OEdDZnk4eGdWckhNWnMwOUxOa3I4WVQ2UEVaSGNFOUFRQlFMUTNBM3NGeHBT?=
 =?utf-8?B?ZERRR1J5Mld0RGtTUlRNWVlMUDhxS1hxdlhJU0Z0Q00veDdaallQSzhmQkYr?=
 =?utf-8?B?VnpZdXhyUldmN0RZOXlRblJqRHJRNlFJbEVBMFZSWldzazJKYWROWFFOd05J?=
 =?utf-8?B?ck4yUnFCYlBqMlNHVExlYWdUb0hyeVkzNEVyNkdjRGd6cC9Lb1pQeUkrNkhs?=
 =?utf-8?B?SFpxWHhzcFZVZVJMTjFpeTJNSC9TZUo3R2trMjJKVVdGTDFMc3JvMk9XVjdZ?=
 =?utf-8?Q?S4wydfyKUBCRtoT4OASaYHjx11hrxtWM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4439265f-301f-41e3-c0de-08d89ff876ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2020 06:21:16.7844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BXMRpDKm1tl+CVnH1gDvYAdAPCqHG0mTQy9oOIA7TAkJU/ssPSck3VE8G1+a1T0mIJxltO+zvoT+f7QpM9So7ZlBtc7LPFkrDjhKiiJnO3mbqkXvYGJCoyFys8j8U6XL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4079
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTWF0dGktc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IFZh
aXR0aW5lbiwgTWF0dGksIFNlbnQ6IEZyaWRheSwgRGVjZW1iZXIgMTEsIDIwMjAgMTA6MjkgUE0N
Cj4gDQo+IEhpIFlvc2hpaGlyby1zYW4sDQo+IA0KPiBPbiBGcmksIDIwMjAtMTItMTEgYXQgMjA6
MjcgKzA5MDAsIFlvc2hpaGlybyBTaGltb2RhIHdyb3RlOg0KPiA+IEZyb206IEtoaWVtIE5ndXll
biA8a2hpZW0ubmd1eWVuLnh0QHJlbmVzYXMuY29tPg0KPiA+DQo+ID4gU2luY2UgdGhlIGRyaXZl
ciBzdXBwb3J0cyBCRDk1NzFNV1YgUE1JQyBvbmx5LA0KPiA+IHRoaXMgcGF0Y2ggbWFrZXMgdGhl
IGZ1bmN0aW9ucyBhbmQgZGF0YSBzdHJ1Y3R1cmUgYmVjb21lIG1vcmUgZ2VuZXJpYw0KPiA+IHNv
IHRoYXQgaXQgY2FuIHN1cHBvcnQgb3RoZXIgUE1JQyB2YXJpYW50cyBhcyB3ZWxsLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogS2hpZW0gTmd1eWVuIDxraGllbS5uZ3V5ZW4ueHRAcmVuZXNhcy5j
b20+DQo+ID4gW3NoaW1vZGE6IHJlYmFzZSBhbmQgcmVmYWN0b3JdDQo+ID4gU2lnbmVkLW9mZi1i
eTogWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0K
PiA+IC0tLQ0KPiA+ICBkcml2ZXJzL21mZC9iZDk1NzFtd3YuYyAgICAgICB8IDcxDQo+ID4gKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQ0KPiA+ICBpbmNsdWRlL2xp
bnV4L21mZC9iZDk1NzFtd3YuaCB8IDE4ICsrLS0tLS0tLS0tDQo+ID4gIDIgZmlsZXMgY2hhbmdl
ZCwgNjIgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tZmQvYmQ5NTcxbXd2LmMgYi9kcml2ZXJzL21mZC9iZDk1NzFtd3YuYw0KPiA+
IGluZGV4IDgwYzZlZjAuLmFkYjllM2QgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZmQvYmQ5
NTcxbXd2LmMNCj4gPiArKysgYi9kcml2ZXJzL21mZC9iZDk1NzFtd3YuYw0KPHNuaXA+DQo+ID4g
K3N0cnVjdCBiZDk1NzFtd3Ygew0KPiA+ICsJc3RydWN0IGRldmljZSAqZGV2Ow0KPiA+ICsJc3Ry
dWN0IHJlZ21hcCAqcmVnbWFwOw0KPiA+ICsJY29uc3Qgc3RydWN0IGJkOTU3eF9kYXRhICpkYXRh
Ow0KPiA+ICsNCj4gPiArCS8qIElSUSBEYXRhICovDQo+ID4gKwlpbnQgaXJxOw0KPiA+ICsJc3Ry
dWN0IHJlZ21hcF9pcnFfY2hpcF9kYXRhICppcnFfZGF0YTsNCj4gPiArfTsNCj4gPiArDQo+IA0K
PiBJIHN0aWxsIGRvbid0IHNlZSB3aHkgeW91IGFjdHVhbGx5IG5lZWQgdGhpcyBzdHJ1Y3R1cmU/
DQoNCkknbSBzb3JyeS4gSSBjb21wbGV0ZWx5IGZvcmdvdCB0aGF0IHlvdSBzYWlkIHdlIGNhbiBy
ZW1vdmUgdGhpcw0Kc3RydWN0dXJlIGluIHRoZSBwcmV2aW91cyBwYXRjaCdzIHJldmlldy4uLg0K
DQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWZkX2NlbGwgYmQ5NTcxbXd2X2NlbGxzW10gPSB7
DQo+ID4gIAl7IC5uYW1lID0gImJkOTU3MW13di1yZWd1bGF0b3IiLCB9LA0KPiA+ICAJeyAubmFt
ZSA9ICJiZDk1NzFtd3YtZ3BpbyIsIH0sDQo+ID4gQEAgLTEwMiw2ICsxMzEsMTQgQEAgc3RhdGlj
IHN0cnVjdCByZWdtYXBfaXJxX2NoaXAgYmQ5NTcxbXd2X2lycV9jaGlwDQo+ID4gPSB7DQo+ID4g
IAkubnVtX2lycXMJPSBBUlJBWV9TSVpFKGJkOTU3MW13dl9pcnFzKSwNCj4gPiAgfTsNCj4gPg0K
PiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGJkOTU3eF9kYXRhIGJkOTU3MW13dl9kYXRhID0gew0K
PiA+ICsJLnBhcnRfbmFtZSA9IEJEOTU3MU1XVl9QQVJUX05BTUUsDQo+ID4gKwkucmVnbWFwX2Nv
bmZpZyA9ICZiZDk1NzFtd3ZfcmVnbWFwX2NvbmZpZywNCj4gPiArCS5pcnFfY2hpcCA9ICZiZDk1
NzFtd3ZfaXJxX2NoaXAsDQo+ID4gKwkuY2VsbHMgPSBiZDk1NzFtd3ZfY2VsbHMsDQo+ID4gKwku
bnVtX2NlbGxzID0gQVJSQVlfU0laRShiZDk1NzFtd3ZfY2VsbHMpLA0KPiA+ICt9Ow0KPiA+ICsN
Cj4gPiAgc3RhdGljIGludCBiZDk1NzFtd3ZfaWRlbnRpZnkoc3RydWN0IGJkOTU3MW13diAqYmQp
DQo+ID4gIHsNCj4gPiAgCXN0cnVjdCBkZXZpY2UgKmRldiA9IGJkLT5kZXY7DQo+ID4gQEAgLTEy
NywxMyArMTY0LDYgQEAgc3RhdGljIGludCBiZDk1NzFtd3ZfaWRlbnRpZnkoc3RydWN0IGJkOTU3
MW13dg0KPiA+ICpiZCkNCj4gPiAgCQkJcmV0KTsNCj4gPiAgCQlyZXR1cm4gcmV0Ow0KPiA+ICAJ
fQ0KPiA+IC0NCj4gPiAtCWlmICh2YWx1ZSAhPSBCRDk1NzFNV1ZfUFJPRFVDVF9DT0RFX1ZBTCkg
ew0KPiA+IC0JCWRldl9lcnIoZGV2LCAiSW52YWxpZCBwcm9kdWN0IGNvZGUgSUQgJTAyeCAoZXhw
ZWN0ZWQNCj4gPiAlMDJ4KVxuIiwNCj4gPiAtCQkJdmFsdWUsIEJEOTU3MU1XVl9QUk9EVUNUX0NP
REVfVkFMKTsNCj4gPiAtCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiAtCX0NCj4gPiAtDQo+ID4gIAly
ZXQgPSByZWdtYXBfcmVhZChiZC0+cmVnbWFwLCBCRDk1NzFNV1ZfUFJPRFVDVF9SRVZJU0lPTiwN
Cj4gPiAmdmFsdWUpOw0KPiA+ICAJaWYgKHJldCkgew0KPiA+ICAJCWRldl9lcnIoZGV2LCAiRmFp
bGVkIHRvIHJlYWQgcmV2aXNpb24gcmVnaXN0ZXINCj4gPiAocmV0PSVpKVxuIiwNCj4gPiBAQCAt
MTQxLDcgKzE3MSw4IEBAIHN0YXRpYyBpbnQgYmQ5NTcxbXd2X2lkZW50aWZ5KHN0cnVjdCBiZDk1
NzFtd3YNCj4gPiAqYmQpDQo+ID4gIAkJcmV0dXJuIHJldDsNCj4gPiAgCX0NCj4gPg0KPiA+IC0J
ZGV2X2luZm8oZGV2LCAiRGV2aWNlOiBCRDk1NzFNV1YgcmV2LiAlZFxuIiwgdmFsdWUgJiAweGZm
KTsNCj4gPiArCWRldl9pbmZvKGRldiwgIkRldmljZTogJXMgcmV2LiAlZFxuIiwgYmQtPmRhdGEt
PnBhcnRfbmFtZSwNCj4gPiArCQkgdmFsdWUgJiAweGZmKTsNCj4gPg0KPiA+ICAJcmV0dXJuIDA7
DQo+ID4gIH0NCj4gPiBAQCAtMTYwLDcgKzE5MSwyMyBAQCBzdGF0aWMgaW50IGJkOTU3MW13dl9w
cm9iZShzdHJ1Y3QgaTJjX2NsaWVudA0KPiA+ICpjbGllbnQsDQo+ID4gIAliZC0+ZGV2ID0gJmNs
aWVudC0+ZGV2Ow0KPiA+ICAJYmQtPmlycSA9IGNsaWVudC0+aXJxOw0KPiA+DQo+ID4gLQliZC0+
cmVnbWFwID0gZGV2bV9yZWdtYXBfaW5pdF9pMmMoY2xpZW50LA0KPiA+ICZiZDk1NzFtd3ZfcmVn
bWFwX2NvbmZpZyk7DQo+ID4gKwkvKiBSZWFkIHRoZSBQTUlDIHByb2R1Y3QgY29kZSAqLw0KPiA+
ICsJcmV0ID0gaTJjX3NtYnVzX3JlYWRfYnl0ZV9kYXRhKGNsaWVudCwgQkQ5NTcxTVdWX1BST0RV
Q1RfQ09ERSk7DQo+ID4gKwlpZiAocmV0IDwgMCkgew0KPiA+ICsJCWRldl9lcnIoJmNsaWVudC0+
ZGV2LCAiZmFpbGVkIHJlYWRpbmcgYXQgMHglMDJ4XG4iLA0KPiA+ICsJCQlCRDk1NzFNV1ZfUFJP
RFVDVF9DT0RFKTsNCj4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ICsJfQ0KPiA+ICsJc3dpdGNoIChy
ZXQpIHsNCj4gPiArCWNhc2UgQkQ5NTcxTVdWX1BST0RVQ1RfQ09ERV9WQUw6DQo+ID4gKwkJYmQt
PmRhdGEgPSAmYmQ5NTcxbXd2X2RhdGE7DQo+ID4gKwkJYnJlYWs7DQo+ID4gKwlkZWZhdWx0Og0K
PiA+ICsJCWRldl9lcnIoYmQtPmRldiwgIlVuc3VwcG9ydGVkIGRldmljZSAweCV4XG4iLCByZXQp
Ow0KPiA+ICsJCXJldHVybiAtRU5PRU5UOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCWJkLT5yZWdt
YXAgPSBkZXZtX3JlZ21hcF9pbml0X2kyYyhjbGllbnQsIGJkLT5kYXRhLQ0KPiA+ID5yZWdtYXBf
Y29uZmlnKTsNCj4gPiAgCWlmIChJU19FUlIoYmQtPnJlZ21hcCkpIHsNCj4gPiAgCQlkZXZfZXJy
KGJkLT5kZXYsICJGYWlsZWQgdG8gaW5pdGlhbGl6ZSByZWdpc3Rlcg0KPiA+IG1hcFxuIik7DQo+
ID4gIAkJcmV0dXJuIFBUUl9FUlIoYmQtPnJlZ21hcCk7DQo+ID4gQEAgLTE3MSwxNCArMjE4LDE0
IEBAIHN0YXRpYyBpbnQgYmQ5NTcxbXd2X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50DQo+ID4gKmNs
aWVudCwNCj4gPiAgCQlyZXR1cm4gcmV0Ow0KPiA+DQo+ID4gIAlyZXQgPSByZWdtYXBfYWRkX2ly
cV9jaGlwKGJkLT5yZWdtYXAsIGJkLT5pcnEsIElSUUZfT05FU0hPVCwgMCwNCj4gPiAtCQkJCSAg
JmJkOTU3MW13dl9pcnFfY2hpcCwgJmJkLT5pcnFfZGF0YSk7DQo+ID4gKwkJCQkgIGJkLT5kYXRh
LT5pcnFfY2hpcCwgJmJkLT5pcnFfZGF0YSk7DQo+IA0KPiBJIHRoaW5rIHlvdSBhbHJlYWR5IGRp
ZCB0aGUgYmlnIHRhc2sgd2hlbiB5b3UgY2xlYW5lZCB1cCB0aGUgc3ViLQ0KPiBkcml2ZXJzIGZy
b20gdXNpbmcgdGhlIHN0cnVjdCBiZDk1NzFtd3YuIFRodW1icyB1cCBmb3IgdGhhdCENCj4gDQo+
IFNvLCBhcyBJIHNhaWQgaW4gY29tbWVudCB0byBwcmV2aW91cyB2ZXJzaW9uIC0gSSBkb24ndCBz
ZWUgdGhpcyBzdHJ1Y3QNCj4gYmQ5NTcxbXd2IGJlaW5nIHJlYWxseSB1c2VkIGFueXdoZXJlIGVs
c2UgYnV0IGFzIGFuIGFyZ3VtZW50IHRvIElDDQo+IGlkZW50aWZpY2F0aW9uIGZ1bmN0aW9uIGFu
ZCBhcmd1bWVudCBmb3IgdGhlIHJlbW92ZS4gSSB0aGluayB0aGF0IGJ5DQo+IHN3aXRjaGluZyBy
ZWdtYXBfYWRkX2lycV9jaGlwIHRvIGRldm1fcmVnbWFwX2FkZF9pcnFfY2hpcCB5b3UgY291bGQg
Z2V0DQo+IHJpZCBvZiB0aGUgcmVtb3ZlLCBlcnJvciBjbGVhbnVwIHBhdGggYW5kIHRoZSBpMmNf
Y2xpZW50ZGF0YS4gQW5kIGlmDQo+IHlvdSByZXZpc2VkIHRoZSBhcmd1bWVudHMgZm9yIGlkZW50
aWZpY2F0aW9uIGZ1bmN0aW9uIHlvdSBjb3VsZA0KPiBwcm9iYWJseSBmdXJ0aGVyIGNsZWFuIHRo
ZSBzdHJ1Y3QgZGVmaW5pdGlvbnMuDQoNClRoYW5rIHlvdSBmb3IgdGhlIGRldGFpbGVkIGNvbW1l
bnRzLiBJIGFncmVlZCB3ZSBjYW4gc2ltcGxpZnkgdGhlIGNvZGUNCmlmIHdlIHVzZSBkZXZtX3Jl
Z21hcF9hZGRfaXJxX2NoaXAuIEFsc28sIEkgZm91bmQgYSBidWcgaW4gdGhlIGN1cnJlbnQNCmNv
ZGUgd2hpY2ggd2Ugc2hvdWxkIGNhbGwgZGV2bV9tZmRfYWRkX2RldmljZXMoKSBpbnN0ZWFkIG9m
DQptZmRfYWRkX2RldmljZXMoKS4gU28sIEknbGwgbWFrZSBhIGZpeGVkIHBhdGNoIHRvby4NCg0K
PiBCdXQgYXMgSSBwcmV2aW91c2x5IHNhaWQgLSB0aGlzIGlzIG9ubHkgYSAnbml0JyBmcm9tIG1l
LiBJIGFwcHJlY2lhdGUNCj4geW91ciB3b3JrIHdpdGggdGhlc2UgZHJpdmVycyENCg0KVGhhbmsg
eW91IHZlcnkgbXVjaCBmb3IgeW91ciByZXZpZXchDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGly
byBTaGltb2RhDQoNCg==
