Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7583D25F568
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 10:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgIGIf6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 04:35:58 -0400
Received: from mail-eopbgr70079.outbound.protection.outlook.com ([40.107.7.79]:53529
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728258AbgIGIf5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 7 Sep 2020 04:35:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VsYWl3/jFgoHZO3ntMfYfrSspihs0fL/BxAEzenA5L4bwfb/6BbcQQ9XSzqLDSBQO1kiiL1EkMhT+HjLeMEkLs+H7MpBqyAJgfHfqm/NPsimzVMKJQfGw54haSD+WqHXuiSPBQFXpl0fx+CRJLaKsRgE0xEWPWRE422rGwkZ+WkmJYCPYec3m/XMzD9/cXCan0zsv+IMzo1l3PKfOUUpLJHsbMUoLR2DjhtRwYZGdLjH9UA4DspBTFobC4kNlzDMct/M2PTAuVrcfzYtF0FOtuaBpFHJebkJtsza4QsIukKqQHZxWvOGmE7wvbYaf8oMgn60xOKyXXW7QzgLoDkRvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhYEOpGBbMLn4o9gakmUrk6WnPg52Yuul0LUrEYXf7c=;
 b=ESKJTXo3qVy5G6VVQMFUINSazYWF19JntoT+9+k3d4Dy27JY5KaH36QKXV0YvGAISYvrG8KxHzLGSSmwCXX7MGr8jT9AmgwUGnsf9dKRfGEIIJ0E2AnfhQcGMw+VF5jzOtGF1SS5jGfY1LnjPG3s2jo3+9HR4ERIqB1Mv7319rUo5gF4P4t5evbR0qAIUjh/NpY8zcf2GDWGQ7bmUjNy55Es97ejSC5LLiiSBgMAac3Pu8euCbyP5L4OHqBN9NLJGjYAZznFoKcQ4Uhi/dJJXs2lPEL11nET2XtVFqjVgzOU9HNwSBHyq9IU0/HtI5ZvN2aTBSZkS/OKWjKS+YErQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhYEOpGBbMLn4o9gakmUrk6WnPg52Yuul0LUrEYXf7c=;
 b=WVw/tavMIPePArFXsaKdG19IKztQ2KGinaWKkc57d7XHc7Kl9cTUR1T9klUFwevWVCvWPXyC7dpY+v5M7nhZdiq+Q+OwWcCzKEF6QTXqMRpAg9bNkseza7Ma8o0CNiyvT3O7rFsTUW+PC8sZ5ye1YX0UQwgxs7QMU3508NXufZA=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB7PR04MB4090.eurprd04.prod.outlook.com (2603:10a6:5:28::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Mon, 7 Sep
 2020 08:35:52 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::9c75:8bb2:aff6:450d]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::9c75:8bb2:aff6:450d%3]) with mapi id 15.20.3348.019; Mon, 7 Sep 2020
 08:35:52 +0000
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
Subject: RE: [PATCH 2/2] pinctrl: imx: Support building i.MX pinctrl driver as
 module
Thread-Topic: [PATCH 2/2] pinctrl: imx: Support building i.MX pinctrl driver
 as module
Thread-Index: AQHWW4NEQCO/EvDOGkOjGyJQ9W9G+aldLDkAgAAAZOA=
Date:   Mon, 7 Sep 2020 08:35:52 +0000
Message-ID: <DB3PR0402MB39169CAE5F3868113DF3735CF5280@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1594912013-20859-1-git-send-email-Anson.Huang@nxp.com>
 <1594912013-20859-2-git-send-email-Anson.Huang@nxp.com>
 <AM6PR04MB4966D073690BB9CD8CC434F480280@AM6PR04MB4966.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB4966D073690BB9CD8CC434F480280@AM6PR04MB4966.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [183.192.17.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7795a6ba-3a20-4672-32e1-08d85309081a
x-ms-traffictypediagnostic: DB7PR04MB4090:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB409023630E4F188499EDE07BF5280@DB7PR04MB4090.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:741;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ANJx9mavPp2gwhuaGm9MmsNS97/jbRx8Q7H74bsd8M4594jm3F+Zky6vhOfQ+S4Cmnl+5dH5Pb2nO3MU8nQ5+o2NocesuPQVrlIslxN9g+mcnthR81YZO4Xx9F4ogCZqGYWGE1nHB4w72y89hQZsQKxsUU/YPZbgM4r6hrYh7tPSUgEXtr3an0SOz0twrzOGhuEulG+wVuFcIMXIWXEAwvD7iSex9Y3TZKBuh56E1T6hVCWQLWlHjrVQRY0svOlKMjX/8kPsIfkZs6TGcv/LLMbOMoCdi9H8W5JUPy4/poE6VUQkBKjLJJj8ApT7WHgj++TNKPWe4bDr8aoLhQ7njuw2XhUzRu7SKD9W1tT5iMzB8LXlDCm9q6OqfHXTlRuV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(478600001)(76116006)(66556008)(66446008)(52536014)(66946007)(66476007)(64756008)(5660300002)(110136005)(8676002)(4326008)(55016002)(316002)(44832011)(6506007)(53546011)(26005)(8936002)(86362001)(7696005)(71200400001)(33656002)(2906002)(83380400001)(9686003)(186003)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ygnz6d4id1T6dClawTT+1mc0MjhMsJSBSxeQZ3CJmCGfnh7Pkijh5FxiqhbwEVjBVDWLRB4c2CwzvZgXzrngUQoCuMT7lNBVzOoKMUTzOgMA6ZUr1SZpNKeS+R/qvOidagAdZKW8OPu7NEPZ64nn4jeHeW4yyq/nCy+7PwrCCIw5XC9cLFWIGswHVSNyyuTP5MUcWOxSBXOhNl1hp4iKi1ENrPNb8fdjP1LL2lGAiX+M0Tn6L1sfbo67Alq+JU77DMFzlKNGDgSi5vgzZN1dldS4c9EEKPn8L3K74hrLPWDXSOHNlDqTPzokRFxj7XEnsQYQPUuN90aw8JIUmVzy2nUJngPiez0gvnWEmP8YiEs/khdtDyHa0vhKzJgOSPcGyGSiAXoLKvODpJbgJ2N9Tcrjn0EX8XuYAGEIuH6aoN5ho8wHjJzrfcALedCaQRdcj4Fmbgfg+qrRup3qtKOlshr8TIEW5i3/HsIKZDQU835rB8BKqfPSCqZsG4EfnxcVl8h+/kTpI6OIms1oRNk58QOQTIFPra9ve9H+5yUeSuRpqzlnAeatgQvt8REqrSsttF6YGLplvyBzIoB05syIOD0uf5vSL1QXLLRDvXOkJHlX9CbUhctnQSHSb+iXJergOhNJpEyGWIc/x67RxFbIKQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7795a6ba-3a20-4672-32e1-08d85309081a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2020 08:35:52.6901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QZEH1FV/UIh1se5fdIRBYmb4MSu3hfTHgttDD99vSpOAyi8soQL07EdB5Dkc0am6WzjuCpQn871UQFo3ZhjOrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4090
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCj4gU3ViamVjdDogUkU6IFtQQVRDSCAyLzJdIHBpbmN0cmw6IGlteDogU3VwcG9ydCBidWls
ZGluZyBpLk1YIHBpbmN0cmwgZHJpdmVyIGFzDQo+IG1vZHVsZQ0KPiANCj4gPiBGcm9tOiBBbnNv
biBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPiBTZW50OiBUaHVyc2RheSwgSnVseSAx
NiwgMjAyMCAxMTowNyBQTQ0KPiA+IFN1YmplY3Q6IFtQQVRDSCAyLzJdIHBpbmN0cmw6IGlteDog
U3VwcG9ydCBidWlsZGluZyBpLk1YIHBpbmN0cmwNCj4gPiBkcml2ZXIgYXMgbW9kdWxlDQo+ID4N
Cj4gDQo+IFMvcGluY3RybCBkcml2ZXIvcGluY3RybCBjb3JlIGRyaXZlcg0KPiANCj4gVGhpcyBh
bHNvIGFwcGxpZXMgZm9yIFBhdGNoIDEvMi4NCg0KT0sNCg0KPiANCj4gPiBDaGFuZ2UgUElOQ1RS
TF9JTVggdG8gdHJpc3RhdGUgdG8gc3VwcG9ydCBsb2FkYWJsZSBtb2R1bGUgYnVpbGQuDQo+ID4N
Cj4gPiBBbmQgaS5NWCBjb21tb24gcGluY3RybCBkcml2ZXIgc2hvdWxkIGRlcGVuZCBvbiBDT05G
SUdfT0YgdG8gbWFrZSBzdXJlDQo+ID4gbm8gYnVpbGQgZXJyb3Igd2hlbiBpLk1YIGNvbW1vbiBw
aW5jdHJsIGRyaXZlciBpcyBlbmFibGVkIGZvcg0KPiA+IGRpZmZlcmVudCBhcmNoaXRlY3R1cmVz
IHdpdGhvdXQgQ09ORklHX09GLg0KPiA+DQo+ID4gQWxzbyBhZGQgbW9kdWxlIGF1dGhvciwgZGVz
Y3JpcHRpb24gYW5kIGxpY2Vuc2UuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFu
ZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9waW5jdHJsL2Zy
ZWVzY2FsZS9LY29uZmlnICAgICAgIHwgMyArKy0NCj4gPiAgZHJpdmVycy9waW5jdHJsL2ZyZWVz
Y2FsZS9waW5jdHJsLWlteC5jIHwgNSArKysrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cGluY3RybC9mcmVlc2NhbGUvS2NvbmZpZw0KPiA+IGIvZHJpdmVycy9waW5jdHJsL2ZyZWVzY2Fs
ZS9LY29uZmlnDQo+ID4gaW5kZXggNTcwMzU1Yy4uOTIyYWU0YiAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL0tjb25maWcNCj4gPiArKysgYi9kcml2ZXJzL3BpbmN0
cmwvZnJlZXNjYWxlL0tjb25maWcNCj4gPiBAQCAtMSw2ICsxLDcgQEANCj4gPiAgIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICBjb25maWcgUElOQ1RSTF9JTVgNCj4gPiAt
CWJvb2wNCj4gPiArCXRyaXN0YXRlICJJTVggcGluY3RybCBkcml2ZXIiDQo+IA0KPiBJTVggcGlu
Y3RybCBjb3JlIGRyaXZlcg0KDQpPSw0KDQo+IA0KPiA+ICsJZGVwZW5kcyBvbiBPRg0KPiA+ICAJ
c2VsZWN0IEdFTkVSSUNfUElOQ1RSTF9HUk9VUFMNCj4gPiAgCXNlbGVjdCBHRU5FUklDX1BJTk1V
WF9GVU5DVElPTlMNCj4gPiAgCXNlbGVjdCBHRU5FUklDX1BJTkNPTkYNCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLWlteC5jDQo+ID4gYi9kcml2ZXJz
L3BpbmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtaW14LmMNCj4gPiBpbmRleCBiODBjNDUwLi4zZWFh
ZmI2IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1p
bXguYw0KPiA+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1pbXguYw0K
PiA+IEBAIC0xMSw2ICsxMSw3IEBADQo+ID4gICNpbmNsdWRlIDxsaW51eC9pbml0Lmg+DQo+ID4g
ICNpbmNsdWRlIDxsaW51eC9pby5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvbWZkL3N5c2Nvbi5o
Pg0KPiA+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9v
Zi5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+DQo+ID4gICNpbmNsdWRlIDxs
aW51eC9vZl9hZGRyZXNzLmg+DQo+ID4gQEAgLTg5OCwzICs4OTksNyBAQCBjb25zdCBzdHJ1Y3Qg
ZGV2X3BtX29wcyBpbXhfcGluY3RybF9wbV9vcHMgPSB7DQo+ID4gIAkJCQkJaW14X3BpbmN0cmxf
cmVzdW1lKQ0KPiA+ICB9Ow0KPiA+ICBFWFBPUlRfU1lNQk9MX0dQTChpbXhfcGluY3RybF9wbV9v
cHMpOw0KPiA+ICsNCj4gPiArTU9EVUxFX0FVVEhPUigiTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPiIpOw0KPiANCj4gTU9EVUxFX0FVVEhPUigiRG9uZyBBaXNoZW5nIDxh
aXNoZW5nLmRvbmdAbnhwLmNvbT4iKTsNCj4gDQoNCk9LLg0KDQpBbnNvbg0KDQo=
