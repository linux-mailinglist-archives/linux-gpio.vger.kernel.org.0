Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 261802609C1
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 07:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726639AbgIHFEK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 01:04:10 -0400
Received: from mail-db8eur05on2079.outbound.protection.outlook.com ([40.107.20.79]:22242
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726387AbgIHFEG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 8 Sep 2020 01:04:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDKoss66rO0yEhrRuJZpZ81dJy3AXhB+Kd/jN8Qy9kcQbtWVGeXj6k4fVdcnugnGD4/7Xif/5CiQXAY1AJlZ2KwLzx7HMdjR6Jpm7RlgddSFGf9bLyNFHR02WrHWYBfjMRahkevJCmLoofBctRnb+dHTDgqetuQ74V5MTQge95gm3CjlRdY/Vo5gblK/r9LeCIk7L7jXM9AIH1bvysNgZE9QCgjdYyt4NQ2oR6UputJMtjpDlWcMYlYppWVx6M2rcDu4i9KISRbG4lbqbb28SmBVkUCGvhBwqTsiUE+2fkd1qkq2mWoOj4NgNt+Ia20h38YBZVQW76CpR1FJZ8vivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3h6u/DYRScTYnee194aMYBFaP65GEPY1GZzFFc/Zhw=;
 b=Fw5udf9C7fyfikTVRzWVQulue8Bt68mj6yDnK5stLfenk1b8nyUjsUdcwBNdpqCVh5wMxZVZW9dWPyGQWso9A2frGR6rsa5u2Clu4LNCu6I77OVVndwTuQpOvJ6hW8Woq/GG5VLhnekusJcAptBxO8hKYxfoMYbbQERE9ymOw64mr9S2TuQ9yVH9a4QnoYRMHIqhuyTbkjXvNhJBvn7dvMWlF/KMq40zJ8vN96vtsmrpO3+1QlnXR14TL9m9TWZuyKs3DTckWTqsLUIkN8WINmUSPRsbTzC1ouUgk4siuw6Bz8jDJ4k5cbzgfxaJh6DLMQIOzOUBAOjtgnuF0laA3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3h6u/DYRScTYnee194aMYBFaP65GEPY1GZzFFc/Zhw=;
 b=kklowb5yQR7jITZJND/Z521hAPbAVYfqMZqYq82zDtb/wndoAXqH2Gwbc1gMaave2xhHo4uNXyT7CWdvBphOn2SKzX+m7e891HPhXS9GBtUBfX2QEMj0DR6+K54tOeZ1g6Aj1gcxmbyA46ngqHb11t+1ZvbRxWzjYfBBo10Z6Ts=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB7PR04MB4939.eurprd04.prod.outlook.com (2603:10a6:10:20::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.17; Tue, 8 Sep
 2020 05:04:00 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::9c75:8bb2:aff6:450d]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::9c75:8bb2:aff6:450d%3]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 05:04:00 +0000
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
Subject: RE: [PATCH V2 1/3] pinctrl: imx: Use function callbacks for SCU
 related functions
Thread-Topic: [PATCH V2 1/3] pinctrl: imx: Use function callbacks for SCU
 related functions
Thread-Index: AQHWhRQReJdEMnBDx0WbInC1/ivVK6leCCAAgAAoOzA=
Date:   Tue, 8 Sep 2020 05:04:00 +0000
Message-ID: <DB3PR0402MB3916914F181ED4FBA71B61C8F5290@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1599481953-32704-1-git-send-email-Anson.Huang@nxp.com>
 <AM6PR04MB496698D5B7A98B24D381252D80290@AM6PR04MB4966.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB496698D5B7A98B24D381252D80290@AM6PR04MB4966.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9fc050cc-0e2f-434e-b03a-08d853b49975
x-ms-traffictypediagnostic: DB7PR04MB4939:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4939A80A6C484496C761D38AF5290@DB7PR04MB4939.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2XhSvgSX0u73SbmrkI2INbX5RSxmSbvwzGnHrGqEzBx7cQui2NnerJ4sb057WKqCo2JXKlEEJ4zHxv1lmXxKpncvHkvw7hiohenVLOtMLbzxztPjey9wb3MhL7GIC85KlIS6G7Wd3V+8adAcnxu/C2GvpGvts6F0+WL2QoCzrmmlOUc1ieB7llhqgVYtLQ2qZfdGbPPddRB0txEcNQRIh+mhZhydENmdrnhgWlSRC1JiGumxeBt9N/R6Oa1J39ULBAs6lvnLRxzwHiJPepCFrkWy1dFF0jq67CFKiy9SW+O6eVVlJJDf5kQA7yKUQxEl8/W/wh7l+JODRkUFQudjQoETuokIz/+G2Kb+hjgrlNDYeNILZqKSLgyzUPLSxOdN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(33656002)(5660300002)(8936002)(7696005)(186003)(4326008)(66556008)(66476007)(76116006)(52536014)(55016002)(9686003)(66446008)(71200400001)(64756008)(66946007)(83380400001)(86362001)(110136005)(2906002)(8676002)(44832011)(316002)(6506007)(26005)(478600001)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: uNvdbZir+z5ZO9iKTHY9EnZehvr4k4POhm/fvRYIO7QXmK+QzrFlvruDM5H5R8NJIOEgjjOr4155BBYDiixGxxQ01vc+fRd2nAw0F6xbkjKOOGQjTj0lJZSqLGLtNH88DGIwdR1Vflz6rTTGpiPlTqEbbxo9MJZpz6Ei0J+Xi8iJczpaI0ofQwzsmF79RZNAhKxEcVJBoPXqFaeQN/XxkliLnRMJG4/kr1jhsourzZKhrvOzlir/gOMYZYaFZu5QFt1ACyfA6frRScLa2YILndS7H0bOVsho4QH1F773upAxjHghXX00Mhmx9eAiRwhWpxfgZdftsE5j/I+KIDFedMGVWxrrBLl3Jy7RZJxy5muPT8s+zZCCAu9mMmfd+Vs6ia6PE8kNasCyAxaBk1HU+de2o8hKTa11rPFE+hCBi8IB0AP5xOYh1OTubGb/PYyLH7slzTY+QORUJy5T0R4jn/EOR67WjOKbZztipu7I/D2E9p/RhWfDbG8PuBCSN5ZEv42Qg7nbbhIDx7c1tf4UYk99R213LwletMjdI/WtD925tyL07twTRqeYdluSCN/r+gaC4rr4XxgHxo9M8FL6wvEVTlS3OAOwcEJMZfJn0r8ccYrofN23NavkP3b3uuaQ3fjVzroFvYxkYR+2A8Z7UA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc050cc-0e2f-434e-b03a-08d853b49975
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2020 05:04:00.5841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jEF8FlqEiEr+fM9VCuiTil+yhHua2Z6W7HDsTnCUlUhKKSaMPdtVnrY3nr2rOhpUEiuN+5AzDiwLvy5VgGPx1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4939
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggVjIgMS8zXSBwaW5jdHJsOiBpbXg6IFVzZSBmdW5jdGlv
biBjYWxsYmFja3MgZm9yIFNDVQ0KPiByZWxhdGVkIGZ1bmN0aW9ucw0KPiANCj4gPiBGcm9tOiBB
bnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPiBTZW50OiBNb25kYXksIFNlcHRl
bWJlciA3LCAyMDIwIDg6MzMgUE0NCj4gPg0KPiA+IFVzZSBmdW5jdGlvbiBjYWxsYmFja3MgZm9y
IFNDVSByZWxhdGVkIGZ1bmN0aW9ucyBpbiBwaW5jdHJsLWlteC5jIGluDQo+ID4gb3JkZXIgdG8g
c3VwcG9ydCB0aGUgc2NlbmFyaW8gb2YgUElOQ1RSTF9JTVggaXMgYnVpbHQgaW4gd2hpbGUNCj4g
PiBQSU5DVFJMX0lNWF9TQ1UgaXMgYnVpbHQgYXMgbW9kdWxlLCBhbGwgZHJpdmVycyB1c2luZyBT
Q1UgcGluY3RybA0KPiA+IGRyaXZlciBuZWVkIHRvIGluaXRpYWxpemUgdGhlIFNDVSByZWxhdGVk
IGZ1bmN0aW9uIGNhbGxiYWNrLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQW5zb24gSHVhbmcg
PEFuc29uLkh1YW5nQG54cC5jb20+DQo+ID4gLS0tDQo+ID4gQ2hhbmdlcyBzaW5jZSBWMToNCj4g
PiAJLSBzcGxpdCBWMSBbMS8yXSBwYXRjaCB0byAyIHBhdGNoZXMsIHRoaXMgcGF0Y2ggZG9lcyB0
aGUgY2hhbmdlIG9mDQo+ID4gdXNpbmcgZnVuY3Rpb24NCj4gPiAJICBjYWxsYmFja3MgZm9yIFND
VSByZWxhdGVkIGZ1bmN0aW9ucy4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9waW5jdHJsL2ZyZWVz
Y2FsZS9waW5jdHJsLWlteC5jICAgICB8ICA4ICsrKy0tLS0NCj4gPiAgZHJpdmVycy9waW5jdHJs
L2ZyZWVzY2FsZS9waW5jdHJsLWlteC5oICAgICB8IDM3DQo+ID4gKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0NCj4gPiAgZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLWlteDhk
eGwuYyB8ICAzICsrKw0KPiA+IGRyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1pbXg4
cW0uYyAgfCAgMyArKysNCj4gPiBkcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtaW14
OHF4cC5jIHwgIDMgKysrDQo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwg
MTkgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL2Zy
ZWVzY2FsZS9waW5jdHJsLWlteC5jDQo+ID4gYi9kcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3Bp
bmN0cmwtaW14LmMNCj4gPiBpbmRleCA1MDdlNGFmLi5iODBjNDUwIDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1pbXguYw0KPiA+ICsrKyBiL2RyaXZl
cnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1pbXguYw0KPiA+IEBAIC0zNzMsNyArMzczLDcg
QEAgc3RhdGljIGludCBpbXhfcGluY29uZl9nZXQoc3RydWN0IHBpbmN0cmxfZGV2DQo+ICpwY3Rs
ZGV2LA0KPiA+ICAJY29uc3Qgc3RydWN0IGlteF9waW5jdHJsX3NvY19pbmZvICppbmZvID0gaXBj
dGwtPmluZm87DQo+ID4NCj4gPiAgCWlmIChpbmZvLT5mbGFncyAmIElNWF9VU0VfU0NVKQ0KPiA+
IC0JCXJldHVybiBpbXhfcGluY29uZl9nZXRfc2N1KHBjdGxkZXYsIHBpbl9pZCwgY29uZmlnKTsN
Cj4gPiArCQlyZXR1cm4gaW5mby0+aW14X3BpbmNvbmZfZ2V0KHBjdGxkZXYsIHBpbl9pZCwgY29u
ZmlnKTsNCj4gPiAgCWVsc2UNCj4gPiAgCQlyZXR1cm4gaW14X3BpbmNvbmZfZ2V0X21taW8ocGN0
bGRldiwgcGluX2lkLCBjb25maWcpOyAgfSBAQA0KPiAtNDIzLDcNCj4gPiArNDIzLDcgQEAgc3Rh
dGljIGludCBpbXhfcGluY29uZl9zZXQoc3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsZGV2LA0KPiA+
ICAJY29uc3Qgc3RydWN0IGlteF9waW5jdHJsX3NvY19pbmZvICppbmZvID0gaXBjdGwtPmluZm87
DQo+ID4NCj4gPiAgCWlmIChpbmZvLT5mbGFncyAmIElNWF9VU0VfU0NVKQ0KPiA+IC0JCXJldHVy
biBpbXhfcGluY29uZl9zZXRfc2N1KHBjdGxkZXYsIHBpbl9pZCwNCj4gPiArCQlyZXR1cm4gaW5m
by0+aW14X3BpbmNvbmZfc2V0KHBjdGxkZXYsIHBpbl9pZCwNCj4gPiAgCQkJCQkgICBjb25maWdz
LCBudW1fY29uZmlncyk7DQo+ID4gIAllbHNlDQo+ID4gIAkJcmV0dXJuIGlteF9waW5jb25mX3Nl
dF9tbWlvKHBjdGxkZXYsIHBpbl9pZCwgQEAgLTQ0MCw3ICs0NDAsNw0KPiBAQA0KPiA+IHN0YXRp
YyB2b2lkIGlteF9waW5jb25mX2RiZ19zaG93KHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRldiwN
Cj4gPiAgCWludCByZXQ7DQo+ID4NCj4gPiAgCWlmIChpbmZvLT5mbGFncyAmIElNWF9VU0VfU0NV
KSB7DQo+ID4gLQkJcmV0ID0gaW14X3BpbmNvbmZfZ2V0X3NjdShwY3RsZGV2LCBwaW5faWQsICZj
b25maWcpOw0KPiA+ICsJCXJldCA9IGluZm8tPmlteF9waW5jb25mX2dldChwY3RsZGV2LCBwaW5f
aWQsICZjb25maWcpOw0KPiA+ICAJCWlmIChyZXQpIHsNCj4gPiAgCQkJZGV2X2VycihpcGN0bC0+
ZGV2LCAiZmFpbGVkIHRvIGdldCAlcyBwaW5jb25mXG4iLA0KPiA+ICAJCQkJcGluX2dldF9uYW1l
KHBjdGxkZXYsIHBpbl9pZCkpOw0KPiA+IEBAIC02MjksNyArNjI5LDcgQEAgc3RhdGljIGludCBp
bXhfcGluY3RybF9wYXJzZV9ncm91cHMoc3RydWN0DQo+ID4gZGV2aWNlX25vZGUgKm5wLA0KPiA+
ICAJZm9yIChpID0gMDsgaSA8IGdycC0+bnVtX3BpbnM7IGkrKykgew0KPiA+ICAJCXBpbiA9ICYo
KHN0cnVjdCBpbXhfcGluICopKGdycC0+ZGF0YSkpW2ldOw0KPiA+ICAJCWlmIChpbmZvLT5mbGFn
cyAmIElNWF9VU0VfU0NVKQ0KPiA+IC0JCQlpbXhfcGluY3RybF9wYXJzZV9waW5fc2N1KGlwY3Rs
LCAmZ3JwLT5waW5zW2ldLA0KPiA+ICsJCQlpbmZvLT5pbXhfcGluY3RybF9wYXJzZV9waW4oaXBj
dGwsICZncnAtPnBpbnNbaV0sDQo+ID4gIAkJCQkJCSAgcGluLCAmbGlzdCk7DQo+ID4gIAkJZWxz
ZQ0KPiA+ICAJCQlpbXhfcGluY3RybF9wYXJzZV9waW5fbW1pbyhpcGN0bCwgJmdycC0+cGluc1tp
XSwgZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLWlt
eC5oDQo+ID4gYi9kcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtaW14LmgNCj4gPiBp
bmRleCAzMzNkMzJiLi40MDkyN2NhIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9m
cmVlc2NhbGUvcGluY3RybC1pbXguaA0KPiA+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9mcmVlc2Nh
bGUvcGluY3RybC1pbXguaA0KPiA+IEBAIC03NSw2ICs3NSwyMSBAQCBzdHJ1Y3QgaW14X2NmZ19w
YXJhbXNfZGVjb2RlIHsNCj4gPiAgCWJvb2wgaW52ZXJ0Ow0KPiA+ICB9Ow0KPiA+DQo+ID4gKy8q
Kg0KPiA+ICsgKiBAZGV2OiBhIHBvaW50ZXIgYmFjayB0byBjb250YWluaW5nIGRldmljZQ0KPiA+
ICsgKiBAYmFzZTogdGhlIG9mZnNldCB0byB0aGUgY29udHJvbGxlciBpbiB2aXJ0dWFsIG1lbW9y
eSAgKi8gc3RydWN0DQo+ID4gK2lteF9waW5jdHJsIHsNCj4gPiArCXN0cnVjdCBkZXZpY2UgKmRl
djsNCj4gPiArCXN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bDsNCj4gPiArCXZvaWQgX19pb21lbSAq
YmFzZTsNCj4gPiArCXZvaWQgX19pb21lbSAqaW5wdXRfc2VsX2Jhc2U7DQo+ID4gKwljb25zdCBz
dHJ1Y3QgaW14X3BpbmN0cmxfc29jX2luZm8gKmluZm87DQo+ID4gKwlzdHJ1Y3QgaW14X3Bpbl9y
ZWcgKnBpbl9yZWdzOw0KPiA+ICsJdW5zaWduZWQgaW50IGdyb3VwX2luZGV4Ow0KPiA+ICsJc3Ry
dWN0IG11dGV4IG11dGV4Ow0KPiA+ICt9Ow0KPiA+ICsNCj4gDQo+IFlvdSBzZWVtcyBtaXNzZWQg
bXkgcXVlc3Rpb24gaW4gdGhlIGZvcm1lciBwYXRjaCByZXZpZXcuDQo+IENvdWxkIHlvdSBjbGFy
aWZ5IGEgYml0IHdoeSBuZWVkIG1vdmUgdGhpcyBwYXJ0IGNvZGU/DQoNClBsZWFzZSBjaGVjayB0
aGUgbWFpbCwgSSBoYXZlIHJlcGxpZWQgaXQgeWVzdG9kYXkgYXMgYmVsb3csIHRoZSBmdW5jdGlv
biBuZWVkcyB0byB1c2UgaW14X3BpbmN0cmwgc3RydWN0dXJlLA0Kc28gaXQgbmVlZHMgdG8gYmUg
bW92ZWQsIG90aGVyd2lzZSwgYnVpbGQgd2lsbCBmYWlsLg0KDQo+IEFueSByZWFzb24gdG8gbW92
ZSB0aGlzIHBhcnQgb2YgY29kZT8NCg0KDQpJdCBpcyBiZWNhdXNlIGJlbG93IGZ1bmN0aW9uIGNh
bGxiYWNrIGFkZGVkIGluIGlteF9waW5jdHJsX3NvY19pbmZvIHN0cnVjdHVyZSBuZWVkIHRvIHVz
ZSBpbXhfcGluY3RybCwgb3RoZXJ3aXNlLCBidWlsZCB3aWxsIGZhaWwuDQoNCisgICAgICAgdm9p
ZCAoKmlteF9waW5jdHJsX3BhcnNlX3Bpbikoc3RydWN0IGlteF9waW5jdHJsICppcGN0bCwNCg0K
QW5zb24NCg==
