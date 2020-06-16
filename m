Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27E291FAE51
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 12:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728231AbgFPKof (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 06:44:35 -0400
Received: from mail-eopbgr60054.outbound.protection.outlook.com ([40.107.6.54]:37469
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728154AbgFPKoe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Jun 2020 06:44:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsw+Ys/0SvFdaRn3E7AS5vW4fi/W72i2XpH3d8bzU4nwp1CWZh212/GPIrXwhTPX/yV3wkkKRI38E5hzlJe9gf1MdrkoGPSHZBi5BZQgH+xBiNrkRK0T0i8vr1SU+KV7dlygpmujT1o1c9nW863SaDz/+byToRoVG5vty0XxKDStFaKd4yiEXgMH1g/VfG5nB6FVLC41J/hwsyHV3yOgTLUAcxGRw3X59/bRCVOY+SzzTeREOHxNBQYMi/G2/dQvr+J/rlCs+TrAB42CGfXQQuvvYct9xZZCrTAkXZyCyQ7OLRtOkaNTN+LUC03o5Q0OMGd9jBkP0Guam6SQAPjmhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJjp/72SpbIUFREm/ugJjSIbkdd/gRMx2bRcNc0vPtk=;
 b=Ip5DTmEp9F8nJiiVoRDvBb+m5nhqd6ghRanS4+iWP9MewbPLY2tC84VMLw2OOEPGSmLlpE5ioXn4U2h5gdQDxjlhaCOrI/YoxkeSngmUgjW0eDqJmORFEroK96l5SaF52apjKLX1bRGegjgvgLg2LaohbdVGL3UNuFq4fmmTYopl67JWq6SpXQHEAH33ydVov6ZobXEVBnbV/ypJfgH78wVvI9FI7htY8u6MSKL3IygeU+qMrEIurpa/VEbEWMx24YSSq3djV+PCixOsn5ZdsaKnQIqVunn/2tnf8GlGOByWWR4FZ+6Bv6jAc2Z6GGvk7gQcXYQDfXXm70X0dU4d6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJjp/72SpbIUFREm/ugJjSIbkdd/gRMx2bRcNc0vPtk=;
 b=lHZWkXoH6+IfgYRsc8McMMckBE63hA5g4QchEC9iSKiLSQeMRw+6Wb0hnbJKUHDQA+hadLSnJRWSh8GF8EroTX/c3zjS4AUJnavrY00QTLMPx6gJNnz7sd0+GRKUYR1/Qq7QX0U+7xxFwOx2uzXeJcBLEZJIYJJjhrKbXzvDjPE=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB3PR0402MB3946.eurprd04.prod.outlook.com (2603:10a6:8:10::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Tue, 16 Jun
 2020 10:44:27 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3%6]) with mapi id 15.20.3088.029; Tue, 16 Jun 2020
 10:44:27 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
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
Subject: RE: [PATCH V5 1/9] pinctrl: imx: Support building SCU pinctrl driver
 as module
Thread-Topic: [PATCH V5 1/9] pinctrl: imx: Support building SCU pinctrl driver
 as module
Thread-Index: AQHWP+XeJP9OTzRQzUu8oLCGsNFyaKja/seAgAAQIUA=
Date:   Tue, 16 Jun 2020 10:44:27 +0000
Message-ID: <DB3PR0402MB3916610502199D90B4BFC5E3F59D0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1591875295-19427-1-git-send-email-Anson.Huang@nxp.com>
 <1591875295-19427-2-git-send-email-Anson.Huang@nxp.com>
 <AM6PR04MB4966C661D52B43E6938FCBF4809D0@AM6PR04MB4966.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB4966C661D52B43E6938FCBF4809D0@AM6PR04MB4966.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [183.192.13.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 05bc5bee-0848-425c-0215-08d811e23e50
x-ms-traffictypediagnostic: DB3PR0402MB3946:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB3946400E7B165844C35A146AF59D0@DB3PR0402MB3946.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 04362AC73B
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i1DYpMf4RvA8I5i3fFtRffvlXglIwPcZhgwXq7dU+kY/z43G+4Zr77GgLpbNkiAPwQDZiXDhX3lHpBbijOgCf7F0TM1xWy5orr8uJWWLtSW0PjhPxDgqZswyYurXf2ZsPp/zcq74SruhTxDAWY4RARbYPIY7RdQTgzeKy6JuMffDnLh/Kg7UgOvM10JfioQIIi53tuM48Ov4nJOB/TzMTaZo4gdM06U7s0iQ6/zvSx59RS4bGV5dWRlwTrLNCfWgsh8p9YF60FU7jzepGVrGNiX793TaEzWHRsRuYjNupF2j/oxouw5MtrYqAVW4ubWcBwam7nhSlR/ppEffwqmBZERxqOHRgWqOcqY8sgFVpPwynfw6iBqOfVfQXsaM/1DL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(4326008)(71200400001)(44832011)(83380400001)(26005)(5660300002)(186003)(66476007)(64756008)(55016002)(9686003)(66946007)(8936002)(316002)(7696005)(6506007)(66556008)(110136005)(2906002)(8676002)(52536014)(86362001)(33656002)(478600001)(76116006)(66446008)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ZboKMRXEA2y/uU8RnCfl7w3xZvCp1vQqD7cKiDxn9cY4+jhqJUk4jMD9cqNAoDOY6CZ2FZXwA4h4L/SnzhSnh0tdiKlUlprNipeR4aSbkE8tVM5sgjxKBStBMTYsjYhMgQi6ay9nnIqoOcMhE7EvqHc2Jp+e0qZ4p3iGE0/IocJu+5l6OSiz3TgkQdJTcHukPkQ7knnb9gEyR/q+V8EZCU4ErstYVG6sKoQbHWLAxoeyYfGyYIndCgABY/VCLNLZPagjXchvdQJ4tfDu8EbUSMus1N2dsmtqBCgIhdILGvezPFIbONJUUvnVVlvZiMrczv9Q23ubjwC6pfSd/dLIEiNrMX9Q3PXSjCQpKeNrMIv+zOUxKvOHjDoCNYeEknL+eF9vTFW1bxdAPJezuSjXCbr54gytVYVI+nnIULHCbXbNJLc8JEfJ4PxS9/BR/JvLaqnvgO5nPEv0I40iB0nVo7MF4mldDg59qGXxxTYrsCCgqmNQgu+e8kZvfovWnyJ6
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05bc5bee-0848-425c-0215-08d811e23e50
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2020 10:44:27.7137
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eLtVbjQ/M+ac+AqCLb1KgI91jNncO4It/nWvMFbkZYiEKNF5a1hBu81hI4JDNLN/mZHq4BA2Ee3DII8r1t0LRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3946
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCj4gU3ViamVjdDogUkU6IFtQQVRDSCBWNSAxLzldIHBpbmN0cmw6IGlteDogU3VwcG9ydCBi
dWlsZGluZyBTQ1UgcGluY3RybCBkcml2ZXIgYXMNCj4gbW9kdWxlDQo+IA0KPiA+IEZyb206IEFu
c29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiA+IFNlbnQ6IFRodXJzZGF5LCBKdW5l
IDExLCAyMDIwIDc6MzUgUE0NCj4gPg0KPiA+IFRvIHN1cHBvcnQgYnVpbGRpbmcgaS5NWCBTQ1Ug
cGluY3RybCBkcml2ZXIgYXMgbW9kdWxlLCBiZWxvdyB0aGluZ3MNCj4gPiBuZWVkIHRvIGJlDQo+
ID4gY2hhbmdlZDoNCj4gPg0KPiA+ICAgICAtIEV4cG9ydCBTQ1UgcmVsYXRlZCBmdW5jdGlvbnMg
YW5kIHVzZSAiSVNfRU5BQkxFRCIgaW5zdGVhZCBvZg0KPiA+ICAgICAgICJpZmRlZiIgdG8gc3Vw
cG9ydCBTQ1UgcGluY3RybCBkcml2ZXIgdXNlciBhbmQgaXRzZWxmIHRvIGJlDQo+ID4gICAgICAg
YnVpbHQgYXMgbW9kdWxlOw0KPiA+ICAgICAtIFVzZSBmdW5jdGlvbiBjYWxsYmFja3MgZm9yIFND
VSByZWxhdGVkIGZ1bmN0aW9ucyBpbiBwaW5jdHJsLWlteC5jDQo+ID4gICAgICAgaW4gb3JkZXIg
dG8gc3VwcG9ydCB0aGUgc2NlbmFyaW8gb2YgUElOQ1RSTF9JTVggaXMgYnVpbHQgaW4NCj4gPiAg
ICAgICB3aGlsZSBQSU5DVFJMX0lNWF9TQ1UgaXMgYnVpbHQgYXMgbW9kdWxlOw0KPiA+ICAgICAt
IEFsbCBkcml2ZXJzIHVzaW5nIFNDVSBwaW5jdHJsIGRyaXZlciBuZWVkIHRvIGluaXRpYWxpemUg
dGhlDQo+ID4gICAgICAgU0NVIHJlbGF0ZWQgZnVuY3Rpb24gY2FsbGJhY2s7DQo+ID4gICAgIC0g
Q2hhbmdlIFBJTkNUUl9JTVhfU0NVIHRvIHRyaXN0YXRlOw0KPiA+ICAgICAtIEFkZCBtb2R1bGUg
YXV0aG9yLCBkZXNjcmlwdGlvbiBhbmQgbGljZW5zZS4NCj4gPg0KPiA+IFdpdGggYWJvdmUgY2hh
bmdlcywgaS5NWCBTQ1UgcGluY3RybCBkcml2ZXIgY2FuIGJlIGJ1aWx0IGFzIG1vZHVsZS4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0K
PiA+IC0tLQ0KPiA+IENoYW5nZXMgc2luY2UgVjQ6DQo+ID4gCS0gYWRkIG1vZHVsZSBhdXRob3Ig
YW5kIGRlc2NyaXB0aW9uLg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxl
L0tjb25maWcgICAgICAgICAgIHwgIDIgKy0NCj4gPiAgZHJpdmVycy9waW5jdHJsL2ZyZWVzY2Fs
ZS9waW5jdHJsLWlteC5jICAgICB8IDE4ICsrKystLS0tLQ0KPiA+ICBkcml2ZXJzL3BpbmN0cmwv
ZnJlZXNjYWxlL3BpbmN0cmwtaW14LmggICAgIHwgNTcgKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0NCj4gPiAgZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLWlteDhkeGwuYyB8
ICAzICsrDQo+ID4gZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLWlteDhxbS5jICB8
ICAzICsrDQo+ID4gZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLWlteDhxeHAuYyB8
ICAzICsrDQo+ID4gIGRyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1zY3UuYyAgICAg
fCAgOSArKysrKw0KPiA+ICA3IGZpbGVzIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKyksIDQ0IGRl
bGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9mcmVlc2Nh
bGUvS2NvbmZpZw0KPiA+IGIvZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9LY29uZmlnDQo+ID4g
aW5kZXggNGNhNDRkZC4uYTNhMzBmMWQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9waW5jdHJs
L2ZyZWVzY2FsZS9LY29uZmlnDQo+ID4gKysrIGIvZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9L
Y29uZmlnDQo+ID4gQEAgLTcsNyArNyw3IEBAIGNvbmZpZyBQSU5DVFJMX0lNWA0KPiA+ICAJc2Vs
ZWN0IFJFR01BUA0KPiA+DQo+ID4gIGNvbmZpZyBQSU5DVFJMX0lNWF9TQ1UNCj4gPiAtCWJvb2wN
Cj4gPiArCXRyaXN0YXRlICJJTVggU0NVIHBpbmN0cmwgZHJpdmVyIg0KPiA+ICAJZGVwZW5kcyBv
biBJTVhfU0NVDQo+ID4gIAlzZWxlY3QgUElOQ1RSTF9JTVgNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtaW14LmMNCj4gPiBiL2RyaXZlcnMv
cGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1pbXguYw0KPiA+IGluZGV4IGNiN2UwZjAuLmMxZmFh
ZTEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLWlt
eC5jDQo+ID4gKysrIGIvZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLWlteC5jDQo+
ID4gQEAgLTM3Miw4ICszNzIsOCBAQCBzdGF0aWMgaW50IGlteF9waW5jb25mX2dldChzdHJ1Y3Qg
cGluY3RybF9kZXYNCj4gKnBjdGxkZXYsDQo+ID4gIAlzdHJ1Y3QgaW14X3BpbmN0cmwgKmlwY3Rs
ID0gcGluY3RybF9kZXZfZ2V0X2RydmRhdGEocGN0bGRldik7DQo+ID4gIAljb25zdCBzdHJ1Y3Qg
aW14X3BpbmN0cmxfc29jX2luZm8gKmluZm8gPSBpcGN0bC0+aW5mbzsNCj4gPg0KPiA+IC0JaWYg
KGluZm8tPmZsYWdzICYgSU1YX1VTRV9TQ1UpDQo+ID4gLQkJcmV0dXJuIGlteF9waW5jb25mX2dl
dF9zY3UocGN0bGRldiwgcGluX2lkLCBjb25maWcpOw0KPiA+ICsJaWYgKChpbmZvLT5mbGFncyAm
IElNWF9VU0VfU0NVKSAmJiBpbmZvLT5pbXhfcGluY29uZl9nZXQpDQo+ID4gKwkJcmV0dXJuIGlu
Zm8tPmlteF9waW5jb25mX2dldChwY3RsZGV2LCBwaW5faWQsIGNvbmZpZyk7DQo+IA0KPiBQb2lu
dGVyIGNoZWNrIGhlcmUgc2VlbXMgbm90IGJlIG5lY2Vzc2FyeQ0KDQpJIHRoaW5rIGl0IGlzIE5P
VCBoYXJtZnVsIGFuZCBpdCBpcyBqdXN0IGluIGNhc2UgdGhlIGRyaXZlcnMgdXNpbmcgc2N1IHBp
bmN0cmwNCmRvIE5PVCBpbml0aWFsaXplIHRoZXNlIGZ1bmN0aW9ucyBjYWxsYmFjayBhbmQgbGVh
ZCB0byBOVUxMIHBvaW50ZXIgZHVtcC4NCg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
aW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLWlteC5oDQo+ID4gYi9kcml2ZXJzL3BpbmN0cmwvZnJl
ZXNjYWxlL3BpbmN0cmwtaW14LmgNCj4gPiBpbmRleCAzMzNkMzJiLi5iZGI4NmMyIDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1pbXguaA0KPiA+ICsr
KyBiL2RyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1pbXguaA0KPiA+IEBAIC03NSw2
ICs3NSwyMSBAQCBzdHJ1Y3QgaW14X2NmZ19wYXJhbXNfZGVjb2RlIHsNCj4gPiAgCWJvb2wgaW52
ZXJ0Ow0KPiA+ICB9Ow0KPiA+DQo+ID4gKy8qKg0KPiA+ICsgKiBAZGV2OiBhIHBvaW50ZXIgYmFj
ayB0byBjb250YWluaW5nIGRldmljZQ0KPiA+ICsgKiBAYmFzZTogdGhlIG9mZnNldCB0byB0aGUg
Y29udHJvbGxlciBpbiB2aXJ0dWFsIG1lbW9yeSAgKi8gc3RydWN0DQo+ID4gK2lteF9waW5jdHJs
IHsNCj4gPiArCXN0cnVjdCBkZXZpY2UgKmRldjsNCj4gPiArCXN0cnVjdCBwaW5jdHJsX2RldiAq
cGN0bDsNCj4gPiArCXZvaWQgX19pb21lbSAqYmFzZTsNCj4gPiArCXZvaWQgX19pb21lbSAqaW5w
dXRfc2VsX2Jhc2U7DQo+ID4gKwljb25zdCBzdHJ1Y3QgaW14X3BpbmN0cmxfc29jX2luZm8gKmlu
Zm87DQo+ID4gKwlzdHJ1Y3QgaW14X3Bpbl9yZWcgKnBpbl9yZWdzOw0KPiA+ICsJdW5zaWduZWQg
aW50IGdyb3VwX2luZGV4Ow0KPiA+ICsJc3RydWN0IG11dGV4IG11dGV4Ow0KPiA+ICt9Ow0KPiA+
ICsNCj4gPiAgc3RydWN0IGlteF9waW5jdHJsX3NvY19pbmZvIHsNCj4gPiAgCWNvbnN0IHN0cnVj
dCBwaW5jdHJsX3Bpbl9kZXNjICpwaW5zOw0KPiA+ICAJdW5zaWduZWQgaW50IG5waW5zOw0KPiA+
IEBAIC05OCwyMSArMTEzLDEzIEBAIHN0cnVjdCBpbXhfcGluY3RybF9zb2NfaW5mbyB7DQo+ID4g
IAkJCQkgIHN0cnVjdCBwaW5jdHJsX2dwaW9fcmFuZ2UgKnJhbmdlLA0KPiA+ICAJCQkJICB1bnNp
Z25lZCBvZmZzZXQsDQo+ID4gIAkJCQkgIGJvb2wgaW5wdXQpOw0KPiA+IC19Ow0KPiA+IC0NCj4g
PiAtLyoqDQo+ID4gLSAqIEBkZXY6IGEgcG9pbnRlciBiYWNrIHRvIGNvbnRhaW5pbmcgZGV2aWNl
DQo+ID4gLSAqIEBiYXNlOiB0aGUgb2Zmc2V0IHRvIHRoZSBjb250cm9sbGVyIGluIHZpcnR1YWwg
bWVtb3J5DQo+ID4gLSAqLw0KPiA+IC1zdHJ1Y3QgaW14X3BpbmN0cmwgew0KPiA+IC0Jc3RydWN0
IGRldmljZSAqZGV2Ow0KPiA+IC0Jc3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsOw0KPiA+IC0Jdm9p
ZCBfX2lvbWVtICpiYXNlOw0KPiA+IC0Jdm9pZCBfX2lvbWVtICppbnB1dF9zZWxfYmFzZTsNCj4g
PiAtCWNvbnN0IHN0cnVjdCBpbXhfcGluY3RybF9zb2NfaW5mbyAqaW5mbzsNCj4gPiAtCXN0cnVj
dCBpbXhfcGluX3JlZyAqcGluX3JlZ3M7DQo+ID4gLQl1bnNpZ25lZCBpbnQgZ3JvdXBfaW5kZXg7
DQo+ID4gLQlzdHJ1Y3QgbXV0ZXggbXV0ZXg7DQo+ID4gKwlpbnQgKCppbXhfcGluY29uZl9nZXQp
KHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRldiwgdW5zaWduZWQgaW50IHBpbl9pZCwNCj4gPiAr
CQkJICAgICAgIHVuc2lnbmVkIGxvbmcgKmNvbmZpZyk7DQo+ID4gKwlpbnQgKCppbXhfcGluY29u
Zl9zZXQpKHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRldiwgdW5zaWduZWQgaW50IHBpbl9pZCwN
Cj4gPiArCQkJICAgICAgIHVuc2lnbmVkIGxvbmcgKmNvbmZpZ3MsIHVuc2lnbmVkIGludCBudW1f
Y29uZmlncyk7DQo+ID4gKwl2b2lkICgqaW14X3BpbmN0cmxfcGFyc2VfcGluKShzdHJ1Y3QgaW14
X3BpbmN0cmwgKmlwY3RsLA0KPiA+ICsJCQkJICAgICAgdW5zaWduZWQgaW50ICpwaW5faWQsIHN0
cnVjdCBpbXhfcGluICpwaW4sDQo+ID4gKwkJCQkgICAgICBjb25zdCBfX2JlMzIgKipsaXN0X3Ap
Ow0KPiANCj4gQ29tcGFyZWQgd2l0aCBWNCwgdGhpcyBuZXcgaW1wbGVtZW50YXRpb24gc2VlbXMg
YSBiaXQgY29tcGxpY2F0ZWQuDQo+IEkgZ3Vlc3Mgd2UgZG9uJ3QgaGF2ZSB0byBzdXBwb3J0IFBJ
TkNUUkxfSU1YPXkgJiYgUElOQ1RSTF9JTVhfU0NVPW0NCj4gY2FzZS4NCj4gV2lsbCB0aGF0IG1h
a2UgdGhlIHN1cHBvcnQgYSBiaXQgZWFzaWVyPw0KDQpJIGFtIE5PVCBzdXJlIGlmIHN1Y2ggc2Nl
bmFyaW8gbWVldHMgcmVxdWlyZW1lbnQsIHRoZSBmYWN0IGlzIG90aGVyIG5vbi1pLk1YIFNvQw0K
YWxzbyBzZWxlY3RzIHRoZSBQSU5DVFJMX0lNWCB3aGljaCB3aWxsIG1ha2UgUElOQ1RSTF9JTVg9
eSwgc28gaW4gdGhhdCBjYXNlLCBldmVuDQphbGwgaS5NWCBQSU5DVFJMIGRyaXZlcnMgYXJlIHNl
dCB0byBtb2R1bGUsIGl0IHdpbGwgc3RpbGwgaGF2ZSBQSU5DVFJMX0lNWD15IGFuZCBQSU5DVFJM
X0lNWF9TQ1U9bSwNCnRoZW4gYnVpbGQgd2lsbCBmYWlsLiBBbmQgSSBiZWxpZXZlIHRoZSBhdXRv
IGJ1aWxkIHRlc3QgbWF5IGFsc28gY292ZXIgc3VjaCBjYXNlIGFuZCBidWlsZA0KZXJyb3Igd2ls
bCBiZSByZXBvcnRlZCwgdGhhdCBpcyB3aHkgdGhpcyBjaGFuZ2UgaXMgbmVlZGVkIGFuZCB3aXRo
IHRoaXMgY2hhbmdlLCBmdW5jdGlvbg0KaXMgTk9UIGltcGFjdGVkLA0KDQpBbnNvbi4NCg==
