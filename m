Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAC6E2609CE
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 07:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbgIHFHC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 01:07:02 -0400
Received: from mail-eopbgr30046.outbound.protection.outlook.com ([40.107.3.46]:51718
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725938AbgIHFG7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 8 Sep 2020 01:06:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Is38vQhgBzXYBBTvxACy6c562cs41sIAQXQb4yvxgoPkg1liLy74WeGzwo7dBGicdTsTZZ4Yk2VckpMiI9+5QyEMS4KyuQng7bt9eutKz2yxOF+pOUbXrABU0MPOBI155vsCc0M6Xj7a39+xZA18nL4gdzz4yDhgvWQp/l8T1gPwVS71MOK11ODd1WNIMmLjX58y6iyWZgwUGMOqqOsj2Jdi0ggYx6CSDjkhdn/deJ1QCXdv5U2egoIXorqyIs41n5MjoO+DFjdeNVoCTpeD3JQulAkQX5YpyRH6+KIy3SaOVxwPdX5e5gbbGnLFBzNzLF7iW6dXOKSwsuPgK5fpQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnERjT9d7A2ZcCSnA+QoloeKLRmvpowJLfPHuJkPuis=;
 b=hrglWjVG6BPUtMRyrZk9/Yr5gNZX9UQP5hwO/njZVPYWe/NqbsVpObFynDR78ktVfszdFWMGFvlaEBc5AodVcUMr912mY8zBQkkrK6dEnoQmGL0BFEDOgCVC/FYZQjA11xFNgtzqYnlRb8eGHF7mIVjVSolReQe8JlEUZi8Vmos2b74X8pf1+NVnvad0xL5ppCjP3/QgZNn1QEpKLAMTvJsajXXRZhw95nMwXIc+zu2+Q0uAiO5GB2JICbyfUhj1GppcdZrEdQlGCxRjz0a0kJ/Cz7246HRpossJyHTAFNbbE71ukwPd+3yuLUNzm+tdCF7qX7S+EXzmdOgcjAmwYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnERjT9d7A2ZcCSnA+QoloeKLRmvpowJLfPHuJkPuis=;
 b=UCZZJHFKTZ0s2icvznJJkSvil5lTCQIrmIUcrhmYIIwemnEDbAjSna9mMvHd3qLUZCDbZ+ddt0gfnQ7bHU8JlLSAPwYiGMQgmt3lAnomlxadYYFnTt612hWJdF29reXje9mx1PqwkJDrletmEAi+eABuMNOpILkXuvD0igA8DQk=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB7PR04MB4939.eurprd04.prod.outlook.com (2603:10a6:10:20::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.17; Tue, 8 Sep
 2020 05:06:55 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::9c75:8bb2:aff6:450d]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::9c75:8bb2:aff6:450d%3]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 05:06:55 +0000
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
Subject: RE: [PATCH V2 2/3] pinctrl: imx: Support building SCU pinctrl core
 driver as module
Thread-Topic: [PATCH V2 2/3] pinctrl: imx: Support building SCU pinctrl core
 driver as module
Thread-Index: AQHWhRQSjlE+a5IwvU2Ls43NeQUZRaleCZeAgAAnimA=
Date:   Tue, 8 Sep 2020 05:06:55 +0000
Message-ID: <DB3PR0402MB391642197EC47F4797C67A62F5290@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1599481953-32704-1-git-send-email-Anson.Huang@nxp.com>
 <1599481953-32704-2-git-send-email-Anson.Huang@nxp.com>
 <AM6PR04MB49662633660DBC477DD2432D80290@AM6PR04MB4966.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB49662633660DBC477DD2432D80290@AM6PR04MB4966.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f433bc11-6d3a-4400-ab44-08d853b5018b
x-ms-traffictypediagnostic: DB7PR04MB4939:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB49392763EA3E383B41E116A6F5290@DB7PR04MB4939.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:514;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CBR1hNihgitoKyInFKOZHxtKyBD/L6YaxV8oDHty2sAsJqF/oaTnrmtq+skk9MwdPRTYlHnAso7I9dELMXf2Vt41BN+R8Sdw3/lQ/NoPJG/JDJMBl9wxD/eaB60wcxMJZM8kn+Qe99v/laB2R0c/hCW9LqV8dj7DKrra+LpOVLFpOZNRxXJJFQUluP1anCN4fnkZa952Fjzz41uFhd3J2hMXtn5UI5egW6Xq+XxrvENcVl4MT+FrSmgmp1XDadC5I/4XZK6J8earl9fbc7pyBegAGpYaD4q7/iRE4Mx36VuPpgTJPI1ituTXTsR2SbYnN3K1uuchr58avo5VBeNgFYCBg+KMaMcNdhQOvzV6vJw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(33656002)(5660300002)(8936002)(7696005)(186003)(4326008)(66556008)(66476007)(76116006)(52536014)(55016002)(9686003)(66446008)(71200400001)(64756008)(66946007)(83380400001)(86362001)(110136005)(2906002)(8676002)(44832011)(316002)(6506007)(26005)(478600001)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: LcmXQeP/aV7bnMN4S1AdrCeq+JCwmyI11iAg5gj8TMqYxDKsZ3t30CulZWDj66MAtW+g+EN2Om2zgvvJW3i+ffSbfO7y0dN+U5bYRrrhPZb32664DbeIcZHi6gTysrhsQsZEdJTyPlYrwTMQefJwfFObVYn90TVt9PnQmDBM0BDHVtYDd56xiB9F+9kBx+nkaGLpEQfcr0u2Jkuct8X3RnPKPzWyVkFlmDxvy0z0j39TLa/Y3S3jAqil1yhf0/kX+x8vLjUj53QsS1Llbie6phWajiMvPb9JfhDlxsiEDCSBSZAXtv7/sziF5SrmviV3u2j/vDGgJMU+VF0L4xzU4WLjBD9LDxlrOAJAI4cjs26rCWLw8AzOCiC9Jx7LA/F3dt+3BlTpz0NbYMzWxkVR9P7t2Wc6aq5qLE6uf7z6xJhbu34+lnD17zYQIH5NpDSvdtKby4QEarRz3bCuVKIGkT5eHv0CuryswuSuV2ofSi4ewvxPUk0fnonpjN4M9X5Pl8r2exzfmgMxjYuueXHvsTVJ/eQSUUXjyDHGYxx+UoOdwWGK/SYlW5PC8AZdeozZ6Buq/Wv9mrwqDt9U6V/QIX1c+RaVbH5sIukFZy74bSG3gXzl/GYbx/R/5ef1XGHCytM9ICW/vrPOyEG3Xmql1w==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f433bc11-6d3a-4400-ab44-08d853b5018b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2020 05:06:55.2042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oesKeSeIZP2uOTxcuYxjr60+EBW0NQJEdERNc9vCN5cOcT6SasSTYiYIVBdvOpb5xSdDGEooM9qAo9k5xycNFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4939
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCj4gU3ViamVjdDogUkU6IFtQQVRDSCBWMiAyLzNdIHBpbmN0cmw6IGlteDogU3VwcG9ydCBi
dWlsZGluZyBTQ1UgcGluY3RybCBjb3JlDQo+IGRyaXZlciBhcyBtb2R1bGUNCj4gDQo+ID4gRnJv
bTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQo+ID4gU2VudDogTW9uZGF5LCBT
ZXB0ZW1iZXIgNywgMjAyMCA4OjMzIFBNDQo+ID4NCj4gPiBDaGFuZ2UgUElOQ1RSX0lNWF9TQ1Ug
dG8gdHJpc3RhdGUsIHJlbW92ZSB1bm5lY2Vzc2FyeSAjaWZkZWYgYW5kIGFkZA0KPiA+IG1vZHVs
ZSBhdXRob3IsIGRlc2NyaXB0aW9uIGFuZCBsaWNlbnNlIHRvIHN1cHBvcnQgYnVpbGRpbmcgU0NV
IHBpbmN0cmwNCj4gPiBjb3JlIGRyaXZlciBhcyBtb2R1bGUuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiBDaGFu
Z2VzIHNpbmNlIFYxOg0KPiA+IAktIHNwbGl0IFYxIFsxLzJdIHBhdGNoIHRvIDIgcGF0Y2hlcywg
dGhpcyBwYXRjaCBzdXBwb3J0cyBidWlsZGluZyBTQ1UNCj4gPiBwaW5jdHJsIGNvcmUNCj4gPiAJ
ICBkcml2ZXIgYXMgbW9kdWxlOw0KPiA+IAktIHJlbW92ZSB1bm5lY2Vzc2FyeSAjaWZkZWYgY2hl
Y2sgYW5kICNlbHNlIGJsb2NrLg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3BpbmN0cmwvZnJlZXNj
YWxlL0tjb25maWcgICAgICAgfCAgMiArLQ0KPiA+ICBkcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxl
L3BpbmN0cmwtaW14LmggfCAyMCAtLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+IGRyaXZlcnMvcGlu
Y3RybC9mcmVlc2NhbGUvcGluY3RybC1zY3UuYyB8ICA1ICsrKysrDQo+ID4gIDMgZmlsZXMgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL0tjb25maWcNCj4gPiBiL2RyaXZlcnMvcGlu
Y3RybC9mcmVlc2NhbGUvS2NvbmZpZw0KPiA+IGluZGV4IDA4ZmNmNWMuLjQ1MmM0OTkgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9LY29uZmlnDQo+ID4gKysrIGIv
ZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9LY29uZmlnDQo+ID4gQEAgLTcsNyArNyw3IEBAIGNv
bmZpZyBQSU5DVFJMX0lNWA0KPiA+ICAJc2VsZWN0IFJFR01BUA0KPiA+DQo+ID4gIGNvbmZpZyBQ
SU5DVFJMX0lNWF9TQ1UNCj4gPiAtCWJvb2wNCj4gPiArCXRyaXN0YXRlICJJTVggU0NVIHBpbmN0
cmwgY29yZSBkcml2ZXIiDQo+ID4gIAlkZXBlbmRzIG9uIElNWF9TQ1UNCj4gPiAgCXNlbGVjdCBQ
SU5DVFJMX0lNWA0KPiA+DQo+IA0KPiBbLi4uXQ0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9waW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLWlteC5oDQo+ID4gYi9kcml2ZXJzL3BpbmN0cmwv
ZnJlZXNjYWxlL3BpbmN0cmwtaW14LmgNCj4gPiBpbmRleCA0MDkyN2NhLi5mZDhjNGI2IDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1pbXguaA0KPiA+
ICsrKyBiL2RyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1pbXguaA0KPiA+IEBAIC0x
NDQsNyArMTQ0LDYgQEAgc3RydWN0IGlteF9waW5jdHJsX3NvY19pbmZvIHsgIGludA0KPiA+IGlt
eF9waW5jdHJsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsDQo+ID4gIAkJCWNv
bnN0IHN0cnVjdCBpbXhfcGluY3RybF9zb2NfaW5mbyAqaW5mbyk7DQo+ID4NCj4gPiAtI2lmZGVm
IENPTkZJR19QSU5DVFJMX0lNWF9TQ1UNCj4gPiAgI2RlZmluZSBCTV9QQURfQ1RMX0dQX0VOQUJM
RQkJQklUKDMwKQ0KPiA+ICAjZGVmaW5lIEJNX1BBRF9DVExfSUZNVVhfRU5BQkxFCQlCSVQoMzEp
DQo+ID4gICNkZWZpbmUgQlBfUEFEX0NUTF9JRk1VWAkJMjcNCj4gPiBAQCAtMTU3LDIzICsxNTYs
NCBAQCBpbnQgaW14X3BpbmNvbmZfc2V0X3NjdShzdHJ1Y3QgcGluY3RybF9kZXYNCj4gPiAqcGN0
bGRldiwgdW5zaWduZWQgcGluX2lkLCAgdm9pZCBpbXhfcGluY3RybF9wYXJzZV9waW5fc2N1KHN0
cnVjdA0KPiBpbXhfcGluY3RybCAqaXBjdGwsDQo+ID4gIAkJCSAgICAgICB1bnNpZ25lZCBpbnQg
KnBpbl9pZCwgc3RydWN0IGlteF9waW4gKnBpbiwNCj4gPiAgCQkJICAgICAgIGNvbnN0IF9fYmUz
MiAqKmxpc3RfcCk7DQo+ID4gLSNlbHNlDQo+ID4gLXN0YXRpYyBpbmxpbmUgaW50IGlteF9waW5j
b25mX2dldF9zY3Uoc3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsZGV2LA0KPiA+IC0JCQkJICAgICAg
dW5zaWduZWQgcGluX2lkLCB1bnNpZ25lZCBsb25nICpjb25maWcpDQo+ID4gLXsNCj4gPiAtCXJl
dHVybiAtRUlOVkFMOw0KPiA+IC19DQo+ID4gLXN0YXRpYyBpbmxpbmUgaW50IGlteF9waW5jb25m
X3NldF9zY3Uoc3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsZGV2LA0KPiA+IC0JCQkJICAgICAgdW5z
aWduZWQgcGluX2lkLCB1bnNpZ25lZCBsb25nICpjb25maWdzLA0KPiA+IC0JCQkJICAgICAgdW5z
aWduZWQgbnVtX2NvbmZpZ3MpDQo+ID4gLXsNCj4gPiAtCXJldHVybiAtRUlOVkFMOw0KPiA+IC19
DQo+ID4gLXN0YXRpYyBpbmxpbmUgdm9pZCBpbXhfcGluY3RybF9wYXJzZV9waW5fc2N1KHN0cnVj
dCBpbXhfcGluY3RybCAqaXBjdGwsDQo+ID4gLQkJCQkJICAgIHVuc2lnbmVkIGludCAqcGluX2lk
LA0KPiA+IC0JCQkJCSAgICBzdHJ1Y3QgaW14X3BpbiAqcGluLA0KPiA+IC0JCQkJCSAgICBjb25z
dCBfX2JlMzIgKipsaXN0X3ApDQo+ID4gLXsNCj4gPiAtfQ0KPiA+IC0jZW5kaWYNCj4gPiAgI2Vu
ZGlmIC8qIF9fRFJJVkVSU19QSU5DVFJMX0lNWF9IICovDQo+IA0KPiBTaG91bGQgdGhpcyBwYXJ0
IG9mIGNoYW5nZXMgZ28gdG8gUGF0Y2ggMT8NCg0KT0ssIHdpbGwgc2VuZCBWMy4NCg0KQW5zb24N
Cg==
