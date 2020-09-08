Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50FCA2608BA
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 04:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728295AbgIHCnz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 22:43:55 -0400
Received: from mail-eopbgr130084.outbound.protection.outlook.com ([40.107.13.84]:61604
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728188AbgIHCnv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 7 Sep 2020 22:43:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvEN1dWAX5CGUihMd7DpjZ0XUN4tfKFFw0zcdpsVXf74Q9nirxPspnJ8NdhMOT33W9riwwnOjKaUzsULKG20anWyCRcjcOZmK8X9GBobgqAm3VrWLwFYpWajF/48YfwNQ9y4kYwa3U6SMy4FYWhgKIQRbE0N1OsbV/Uzvdbne7I1Cx4sgDE7FZJkDSAj+QAVANLGDhfPgc1xDQZA3ucDojfr9qtLqvsFcNYEAKIIRpkKO7bApoHs8rOPX25Z120qh5tNN4gk+CKsO0ApzNnkh6YjNnOaOcoVEzY1DKphz+cD8RKgpGvezhphyNgV9BvdKIQ527ctUdD24ro/GT18uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXKZs2pR9s9bxVO/tatzrZ50T4IjwNAWmc/s7+ZJd1A=;
 b=TEsB5pUDNWtB0T8YbNRiLhzmDqW+wSh9TwmshLblZscO12737lbyHyfSnJrJ4ZhxTvoSyHlslnySiokuDzg+AO+C+bqx63TuqLpBwy1LeNCCIsrHduDpcds88kLxNgbC3PTsWyaShwPzicSfwbDTtDKUPCifdz7AQrFRi/6aWmJ6my2xJLHS/Of8tn3JjlsEYJwXZCvgUqBDOj2zRxf6Asaomb0SVI2VI/Q/6wS74TnifmROCFIX0URA4tO9O0IXix+/OXNo+06OVJbTsBvN5aY3S0TJEh8vmpNLjI3aLTz04gMwEqySVinUzUxoCuvUcSKixDVZzlDzdR3JaLFZzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXKZs2pR9s9bxVO/tatzrZ50T4IjwNAWmc/s7+ZJd1A=;
 b=V1R6gFR2vuij/9wN8fLuLZrNTjBhv+4WJ+d28ijZ7G6uzjkWf/FbV5lGS9iDg1+BJQNElhGrCFYN5FhVlmAEuvNgJxsm0a2RtbP3NSwOoJBEVAm6KQIO6oTwRHFKDjL8u7wRki+8KP3XdgZDJ3mjNtnm7V/3vseumhUIqJ8Xf+I=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM7PR04MB6821.eurprd04.prod.outlook.com (2603:10a6:20b:105::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Tue, 8 Sep
 2020 02:43:47 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::99b5:145d:16cc:78ca]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::99b5:145d:16cc:78ca%3]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 02:43:47 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Anson Huang <anson.huang@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V2 2/3] pinctrl: imx: Support building SCU pinctrl core
 driver as module
Thread-Topic: [PATCH V2 2/3] pinctrl: imx: Support building SCU pinctrl core
 driver as module
Thread-Index: AQHWhRQRANo5Q/NVp0mcSaeF3naEKqleCRNA
Date:   Tue, 8 Sep 2020 02:43:47 +0000
Message-ID: <AM6PR04MB49662633660DBC477DD2432D80290@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <1599481953-32704-1-git-send-email-Anson.Huang@nxp.com>
 <1599481953-32704-2-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1599481953-32704-2-git-send-email-Anson.Huang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d7f4636e-6a3a-4730-8a73-08d853a102e2
x-ms-traffictypediagnostic: AM7PR04MB6821:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB68213E5460E955F073D9C99A80290@AM7PR04MB6821.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:356;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SCJhgQLpmRQVrkTimd4GNW07aQn/3FBhDgL4MPh6dOa4Mxbr+UHVAtkjwPq3cYSaA04XP7wxoYLuQi8Adt4n7kbfG8CTXzEgIXBPU0rAXFva//mATALWZjButu1jw+NkBaHfpaok2tmKOFx2PRgaEuWbk7oAcU8Ney4D7Ie5HJtj2WrsIwIAxjZqQBITgL/V2Uyh5zdAajx5+FUCjM0P0JrPcOl2xCx22ivYL5DjwcyXlu4nGULpbRARxEf4Da9LACJPgdT6Hb21/KEEI7Dov7h1Yl5gEVlNGmaM4HnrcDfPE5l+9ovDseqJfy+fuA8yCHUfUfspZexBaxfSIc8SxJoUWV4XCz4gRNoG142Uk40jEtx6GFtP8bRMo5muwW+r
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(55016002)(478600001)(52536014)(76116006)(66946007)(71200400001)(86362001)(83380400001)(6506007)(33656002)(7696005)(8676002)(9686003)(26005)(186003)(44832011)(2906002)(5660300002)(8936002)(110136005)(66446008)(64756008)(66556008)(66476007)(316002)(4326008)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 2Rp3hcUgTzlF+i50TcqEWbleeJ9taTFyFFD/+170MldKRrD4fvIYQXTA1U+Dlvg4I0/iC/cT7aTdKlTAw85a1WcmNU6hFUuQOnDov3jitwoKw2Sgk+HkPjSdlpaIU6/qJ/NdZimrIifBfF2y/gM+P0VbAQampzVNFxxYxH0KGy+Hkv5uKUJ6RYpUyQ4f2LFiJR4BOJcW6u3HWYXPYCJ0yyAam9EawoPjkbU71XTSP7PBukcFjDf4YYPwb8IjX9uBReVdiEa4olQ04+lsRR1iZyK0n9a3tnK7hT6dRGBUVa6OfFdfKDAR/IfmDgh8LvBBD5ZOb/p9eci9YQ+uv/43srFUzA3R5I0N2JkL7fKuA96MWJVjHCtLfP2O1+tDRlKdgdczgAg2xJt1ySTQJLCWqZw0H70sX8mK5JDmSbbW7GF0ZKrlDajHPWd771E0QRbev5ejPVAkVfRrUmQooPJEP3rX/bkjhxNrpPva8QVVI8D561TEnn041Rfv9K+g1az8qigOzHbywQuU9wfml51eoESYE88wkK6nhyoIFK4UpjZtplg+fMmdq6P2OB7nz+QTePw89dIYge++KknNKs0L6dx8OQSeLrJdFpj0wfvgx7TkcgKvXMuK3CjdJ+FgBsXAOJLl6Og9wmgLS4fqZOnG3A==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7f4636e-6a3a-4730-8a73-08d853a102e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2020 02:43:47.5346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zv84UA6r/hb8G48eyynNV20OWmjv7VBSPowVcVdd5APmZgPOBQ9pxsUF3CzzZq9iiCs0Xh6jFkmXsOYBc8yQMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6821
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBGcm9tOiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gU2VudDogTW9uZGF5
LCBTZXB0ZW1iZXIgNywgMjAyMCA4OjMzIFBNDQo+IA0KPiBDaGFuZ2UgUElOQ1RSX0lNWF9TQ1Ug
dG8gdHJpc3RhdGUsIHJlbW92ZSB1bm5lY2Vzc2FyeSAjaWZkZWYgYW5kIGFkZA0KPiBtb2R1bGUg
YXV0aG9yLCBkZXNjcmlwdGlvbiBhbmQgbGljZW5zZSB0byBzdXBwb3J0IGJ1aWxkaW5nIFNDVSBw
aW5jdHJsIGNvcmUNCj4gZHJpdmVyIGFzIG1vZHVsZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFu
c29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBzaW5jZSBW
MToNCj4gCS0gc3BsaXQgVjEgWzEvMl0gcGF0Y2ggdG8gMiBwYXRjaGVzLCB0aGlzIHBhdGNoIHN1
cHBvcnRzIGJ1aWxkaW5nIFNDVSBwaW5jdHJsDQo+IGNvcmUNCj4gCSAgZHJpdmVyIGFzIG1vZHVs
ZTsNCj4gCS0gcmVtb3ZlIHVubmVjZXNzYXJ5ICNpZmRlZiBjaGVjayBhbmQgI2Vsc2UgYmxvY2su
DQo+IC0tLQ0KPiAgZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9LY29uZmlnICAgICAgIHwgIDIg
Ky0NCj4gIGRyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1pbXguaCB8IDIwIC0tLS0t
LS0tLS0tLS0tLS0tLS0tDQo+IGRyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1zY3Uu
YyB8ICA1ICsrKysrDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMjEgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9L
Y29uZmlnIGIvZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9LY29uZmlnDQo+IGluZGV4IDA4ZmNm
NWMuLjQ1MmM0OTkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvS2Nv
bmZpZw0KPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL0tjb25maWcNCj4gQEAgLTcs
NyArNyw3IEBAIGNvbmZpZyBQSU5DVFJMX0lNWA0KPiAgCXNlbGVjdCBSRUdNQVANCj4gDQo+ICBj
b25maWcgUElOQ1RSTF9JTVhfU0NVDQo+IC0JYm9vbA0KPiArCXRyaXN0YXRlICJJTVggU0NVIHBp
bmN0cmwgY29yZSBkcml2ZXIiDQo+ICAJZGVwZW5kcyBvbiBJTVhfU0NVDQo+ICAJc2VsZWN0IFBJ
TkNUUkxfSU1YDQo+IA0KDQpbLi4uXQ0KDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwv
ZnJlZXNjYWxlL3BpbmN0cmwtaW14LmgNCj4gYi9kcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3Bp
bmN0cmwtaW14LmgNCj4gaW5kZXggNDA5MjdjYS4uZmQ4YzRiNiAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9waW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLWlteC5oDQo+ICsrKyBiL2RyaXZlcnMvcGlu
Y3RybC9mcmVlc2NhbGUvcGluY3RybC1pbXguaA0KPiBAQCAtMTQ0LDcgKzE0NCw2IEBAIHN0cnVj
dCBpbXhfcGluY3RybF9zb2NfaW5mbyB7ICBpbnQNCj4gaW14X3BpbmN0cmxfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldiwNCj4gIAkJCWNvbnN0IHN0cnVjdCBpbXhfcGluY3RybF9z
b2NfaW5mbyAqaW5mbyk7DQo+IA0KPiAtI2lmZGVmIENPTkZJR19QSU5DVFJMX0lNWF9TQ1UNCj4g
ICNkZWZpbmUgQk1fUEFEX0NUTF9HUF9FTkFCTEUJCUJJVCgzMCkNCj4gICNkZWZpbmUgQk1fUEFE
X0NUTF9JRk1VWF9FTkFCTEUJCUJJVCgzMSkNCj4gICNkZWZpbmUgQlBfUEFEX0NUTF9JRk1VWAkJ
MjcNCj4gQEAgLTE1NywyMyArMTU2LDQgQEAgaW50IGlteF9waW5jb25mX3NldF9zY3Uoc3RydWN0
IHBpbmN0cmxfZGV2ICpwY3RsZGV2LA0KPiB1bnNpZ25lZCBwaW5faWQsICB2b2lkIGlteF9waW5j
dHJsX3BhcnNlX3Bpbl9zY3Uoc3RydWN0IGlteF9waW5jdHJsICppcGN0bCwNCj4gIAkJCSAgICAg
ICB1bnNpZ25lZCBpbnQgKnBpbl9pZCwgc3RydWN0IGlteF9waW4gKnBpbiwNCj4gIAkJCSAgICAg
ICBjb25zdCBfX2JlMzIgKipsaXN0X3ApOw0KPiAtI2Vsc2UNCj4gLXN0YXRpYyBpbmxpbmUgaW50
IGlteF9waW5jb25mX2dldF9zY3Uoc3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsZGV2LA0KPiAtCQkJ
CSAgICAgIHVuc2lnbmVkIHBpbl9pZCwgdW5zaWduZWQgbG9uZyAqY29uZmlnKQ0KPiAtew0KPiAt
CXJldHVybiAtRUlOVkFMOw0KPiAtfQ0KPiAtc3RhdGljIGlubGluZSBpbnQgaW14X3BpbmNvbmZf
c2V0X3NjdShzdHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYsDQo+IC0JCQkJICAgICAgdW5zaWdu
ZWQgcGluX2lkLCB1bnNpZ25lZCBsb25nICpjb25maWdzLA0KPiAtCQkJCSAgICAgIHVuc2lnbmVk
IG51bV9jb25maWdzKQ0KPiAtew0KPiAtCXJldHVybiAtRUlOVkFMOw0KPiAtfQ0KPiAtc3RhdGlj
IGlubGluZSB2b2lkIGlteF9waW5jdHJsX3BhcnNlX3Bpbl9zY3Uoc3RydWN0IGlteF9waW5jdHJs
ICppcGN0bCwNCj4gLQkJCQkJICAgIHVuc2lnbmVkIGludCAqcGluX2lkLA0KPiAtCQkJCQkgICAg
c3RydWN0IGlteF9waW4gKnBpbiwNCj4gLQkJCQkJICAgIGNvbnN0IF9fYmUzMiAqKmxpc3RfcCkN
Cj4gLXsNCj4gLX0NCj4gLSNlbmRpZg0KPiAgI2VuZGlmIC8qIF9fRFJJVkVSU19QSU5DVFJMX0lN
WF9IICovDQoNClNob3VsZCB0aGlzIHBhcnQgb2YgY2hhbmdlcyBnbyB0byBQYXRjaCAxPw0KDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtc2N1LmMNCj4g
Yi9kcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtc2N1LmMNCj4gaW5kZXggOWRmNDVk
My4uNTliNWY4YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9waW5j
dHJsLXNjdS5jDQo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1zY3Uu
Yw0KPiBAQCAtNyw2ICs3LDcgQEANCj4gDQo+ICAjaW5jbHVkZSA8bGludXgvZXJyLmg+DQo+ICAj
aW5jbHVkZSA8bGludXgvZmlybXdhcmUvaW14L3NjaS5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L21v
ZHVsZS5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L29mX2FkZHJlc3MuaD4NCj4gICNpbmNsdWRlIDxs
aW51eC9waW5jdHJsL3BpbmN0cmwuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZp
Y2UuaD4NCj4gQEAgLTEyMywzICsxMjQsNyBAQCB2b2lkIGlteF9waW5jdHJsX3BhcnNlX3Bpbl9z
Y3Uoc3RydWN0IGlteF9waW5jdHJsDQo+ICppcGN0bCwNCj4gIAkJcGluX3NjdS0+bXV4X21vZGUs
IHBpbl9zY3UtPmNvbmZpZyk7DQo+ICB9DQo+ICBFWFBPUlRfU1lNQk9MX0dQTChpbXhfcGluY3Ry
bF9wYXJzZV9waW5fc2N1KTsNCj4gKw0KPiArTU9EVUxFX0FVVEhPUigiRG9uZyBBaXNoZW5nIDxh
aXNoZW5nLmRvbmdAbnhwLmNvbT4iKTsNCj4gK01PRFVMRV9ERVNDUklQVElPTigiTlhQIGkuTVgg
U0NVIGNvbW1vbiBwaW5jdHJsIGRyaXZlciIpOw0KPiArTU9EVUxFX0xJQ0VOU0UoIkdQTCB2MiIp
Ow0KPiAtLQ0KPiAyLjcuNA0KDQo=
