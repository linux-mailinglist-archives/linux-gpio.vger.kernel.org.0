Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBE2A222F4B
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 01:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbgGPXoQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 19:44:16 -0400
Received: from mail-eopbgr00080.outbound.protection.outlook.com ([40.107.0.80]:50308
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726125AbgGPXoP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Jul 2020 19:44:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdAQXRU0D08Ps4FDiE/Yfnh8uDz/LFfW4lJMWKlA4IFzT4X/P+KQpPrZSYEBjzo46HNyBRQFfPmUj8Plo7Ck0eSYHpdkYEfPRFiGAEPiM7qfFWoWALS3PvXDEa/gdoTLxtXSKYi26HLwtOwV5HYMkN4c1Gr0KpTGVtUUGz5ruu0mAn9yk4E5AWH4VP/gW+LI22wODQKwW3FP7p0VvitW3Lb53iS8fBnrpAYAg86HY634c7B5DeXVScRv5XXqbLtAdkmqyYCWbeFaxLGgddZmHPSG+2wor277kwrHxANdA6y9Sdm/HtR3ew6HRNINmFbiXKzvdfu4c9fW0oRcMKPUNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lI1yy9aQskN+vUKHhhI48eLNLu/sEKVKUFpUhOiVQ+0=;
 b=SZXUIp7lQOXfx4MLTOTmhHu/rZJZ5FPMc6U9XVp3r57WsNIH7oayWCqlrrHhARCbd694uxgeWThQqOpCRJzshwILkejznzzK92iGb9VUDbnTYstVCLgFPNrIGj/MAXv+Yp9gYvzzZaAmMmR12bQtG1IFjv1nBjIRVHhw7EI2gbgHCS6aecTVnyE6W9A+d+bhMGoDu2pb7epbjnjss/voNmrWbzwBLQRp4JQcxcQpn7zhI6KNmhcXPRlFu0SwLnje4EJa5pj4Zt1Lck+3wCuFXnQjlII7r8838irbVi8lHLdF1YCOGUilwgRLR6YAZyxCbJD8U8i/B8NNfbPz9/KI2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lI1yy9aQskN+vUKHhhI48eLNLu/sEKVKUFpUhOiVQ+0=;
 b=UbOHCl5awBklUyqzrq+Jdg38BYoaMq8AwLDP2M9OWixki0G/UpwQRKpsEFRdYsaN/Mvdahj38zKaaMKveOn7cjt61etHPyZIQA9UO+7wCacitap8eWq7iQBOHs8phYdr6IVCDLmyU/rzR1vmO9wV4PyM8OJXrog8zYmU2kFkedI=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB6PR0401MB2376.eurprd04.prod.outlook.com (2603:10a6:4:51::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Thu, 16 Jul
 2020 23:44:11 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3%6]) with mapi id 15.20.3174.026; Thu, 16 Jul 2020
 23:44:11 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Daniel Baluta <daniel.baluta@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
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
Subject: RE: [PATCH 1/2] pinctrl: imx: Support building SCU pinctrl driver as
 module
Thread-Topic: [PATCH 1/2] pinctrl: imx: Support building SCU pinctrl driver as
 module
Thread-Index: AQHWW4NHWrU0ATUAm0ydC8gIz0Rl9akKUIoAgAABVNCAAArtgIAAgWsw
Date:   Thu, 16 Jul 2020 23:44:10 +0000
Message-ID: <DB3PR0402MB3916AAEE01257A7F9A25A657F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1594912013-20859-1-git-send-email-Anson.Huang@nxp.com>
 <c00f8fe3-d12a-0f91-c301-c028e5aa3f25@nxp.com>
 <DB3PR0402MB3916C9FE00C0F4FC62ACB711F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <5e2af0c3-c832-3978-017e-0b1649aac61c@nxp.com>
In-Reply-To: <5e2af0c3-c832-3978-017e-0b1649aac61c@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [183.192.22.28]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: af583e62-643d-4134-89d5-08d829e223ac
x-ms-traffictypediagnostic: DB6PR0401MB2376:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB23765058D56E8DE0A74860A4F57F0@DB6PR0401MB2376.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VZZisyR758hmGBfWmPV+yAgQj5+Wb8VXjZYsDYbI68gIUTMYZZhLGgrQZcbzc3OKnBlEjnIdwbkOQLukfvAsAZirej+IcyOS1f4EhuWWEizks/UMzn/PCKyvzQOPAVbCDLVOXNMVJ7jUDkFk1FuxDSaEKaCaNDU3p3u11weFCKb4FVcj08niwIBq9UzWEKT4opIDWGIf+XYaqTqISq4n6MOKP6aMze9mnWmWjn8mvFSSttAXyJgXg2KOXLYYrCxwYbe7I2+YIrFrP4eeMPgx03h7KiJCckrYHn3EstQ+K81Jm8/EG8R2L4iLDg85Qj4jePApvcFF79ISjQIIkNq5NCeRAM2/iKNXlYawQ5y4Q5KVH80GGgIMI7tQfezJwzF+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(52536014)(71200400001)(76116006)(66476007)(53546011)(6506007)(9686003)(2906002)(64756008)(66556008)(66446008)(5660300002)(66946007)(83380400001)(7696005)(33656002)(55016002)(8676002)(186003)(316002)(26005)(44832011)(110136005)(86362001)(8936002)(478600001)(4326008)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: lLzTE1nHBOeWhDhwm1bneK/Tl1yBikR6hnZj66fNNMNTdHpaDBoGppQFOvHKpbJJkr19juBBdVzPMnRXQLJ/WcrmhzUZ+PmegOGchW5zDc8txlmrRGRFClgDFykLNTVHGYW4/jf/7FjIW5bsIHxosyyqNFhEnWi+5cD7YGqwCrDTSRMt6yrjG1R/J8U3lZoIgqYtkl+kC5Qj9nqGXOKvFPc8w0E0nXpe/yeC/112vBhO760+s0i4eX6+vhbuXd/qCh4Kl9+STnANAj0O++CGJRRfyOAbJjhJMzpPHqKXrQpu7OFtj0fJtrctY3tg93oECc3G1ggEtpWt/+XQzp7q6z3958F7wL8Gtcuf9d7Ebava9yCTZlUwGDN0XWAIqzs/q434CRb2QstMK+uRgUsBuNU2QPlybOCwTyW17FTgsBSrWmpUT+80cD/ePlxSCsFJTttPd4dGclcMYf7/uuMOXHaje0+gwt8tEMMLDGBBvgr+A8DixHT7uEZ5EGpeV3dX
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af583e62-643d-4134-89d5-08d829e223ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2020 23:44:10.9753
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UOBUB262TZUHOYoGdg+UJG3OLGLYDVny6LVva7I5uPcls3Fdyogh6cy0m9a7XC1KAvWRkPhLNHlJvTYtxZheFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2376
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksIERhbmllbA0KDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIHBpbmN0cmw6IGlteDog
U3VwcG9ydCBidWlsZGluZyBTQ1UgcGluY3RybCBkcml2ZXIgYXMNCj4gbW9kdWxlDQo+IA0KPiBP
biA3LzE2LzIwIDY6MjEgUE0sIEFuc29uIEh1YW5nIHdyb3RlOg0KPiA+IEhpLCBEYW5pZWwNCj4g
Pg0KPiA+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSBwaW5jdHJsOiBpbXg6IFN1cHBv
cnQgYnVpbGRpbmcgU0NVIHBpbmN0cmwNCj4gPj4gZHJpdmVyIGFzIG1vZHVsZQ0KPiA+Pg0KPiA+
PiBIaSBBbnNvbiwNCj4gPj4NCj4gPj4gRmV3IGNvbW1lbnRzIGlubGluZToNCj4gPj4NCj4gPj4g
T24gNy8xNi8yMCA2OjA2IFBNLCBBbnNvbiBIdWFuZyB3cm90ZToNCj4gPj4+IFRvIHN1cHBvcnQg
YnVpbGRpbmcgaS5NWCBTQ1UgcGluY3RybCBkcml2ZXIgYXMgbW9kdWxlLCBiZWxvdyB0aGluZ3MN
Cj4gPj4+IG5lZWQgdG8NCj4gPj4gYmUgY2hhbmdlZDoNCj4gPj4+ICAgICAgIC0gRXhwb3J0IFND
VSByZWxhdGVkIGZ1bmN0aW9ucyBhbmQgdXNlICJJU19FTkFCTEVEIiBpbnN0ZWFkIG9mDQo+ID4+
PiAgICAgICAgICJpZmRlZiIgdG8gc3VwcG9ydCBTQ1UgcGluY3RybCBkcml2ZXIgdXNlciBhbmQg
aXRzZWxmIHRvIGJlDQo+ID4+PiAgICAgICAgIGJ1aWx0IGFzIG1vZHVsZTsNCj4gPj4+ICAgICAg
IC0gVXNlIGZ1bmN0aW9uIGNhbGxiYWNrcyBmb3IgU0NVIHJlbGF0ZWQgZnVuY3Rpb25zIGluIHBp
bmN0cmwtaW14LmMNCj4gPj4+ICAgICAgICAgaW4gb3JkZXIgdG8gc3VwcG9ydCB0aGUgc2NlbmFy
aW8gb2YgUElOQ1RSTF9JTVggaXMgYnVpbHQgaW4NCj4gPj4+ICAgICAgICAgd2hpbGUgUElOQ1RS
TF9JTVhfU0NVIGlzIGJ1aWx0IGFzIG1vZHVsZTsNCj4gPj4+ICAgICAgIC0gQWxsIGRyaXZlcnMg
dXNpbmcgU0NVIHBpbmN0cmwgZHJpdmVyIG5lZWQgdG8gaW5pdGlhbGl6ZSB0aGUNCj4gPj4+ICAg
ICAgICAgU0NVIHJlbGF0ZWQgZnVuY3Rpb24gY2FsbGJhY2s7DQo+ID4+PiAgICAgICAtIENoYW5n
ZSBQSU5DVFJfSU1YX1NDVSB0byB0cmlzdGF0ZTsNCj4gPj4+ICAgICAgIC0gQWRkIG1vZHVsZSBh
dXRob3IsIGRlc2NyaXB0aW9uIGFuZCBsaWNlbnNlLg0KPiA+Pj4NCj4gPj4+IFdpdGggYWJvdmUg
Y2hhbmdlcywgaS5NWCBTQ1UgcGluY3RybCBkcml2ZXIgY2FuIGJlIGJ1aWx0IGFzIG1vZHVsZS4N
Cj4gPj4NCj4gPj4gVGhlcmUgYXJlIGEgbG90IG9mIGNoYW5nZXMgaGVyZS4gSSB0aGluayBpdCB3
b3VsZCBiZSBiZXR0ZXIgdG8gdHJ5IHRvDQo+ID4+IHNwbGl0IHRoZW0NCj4gPj4NCj4gPj4gcGVy
IGZ1bmN0aW9uYWxpdHkuIE9uZSBmdW5jdGlvbmFsIGNoYW5nZSBwZXIgcGF0Y2guDQo+ID4gQWN0
dWFsbHksIEkgZXZlciB0cmllZCB0byBzcGxpdCB0aGVtLCBidXQgdGhlIGZ1bmN0aW9uIHdpbGwg
YmUgYnJva2VuLg0KPiA+IEFsbCB0aGUgY2hhbmdlcyBhcmUganVzdCB0byBzdXBwb3J0IHRoZSBt
b2R1bGUgYnVpbGQuIElmIHNwbGl0IHRoZW0sDQo+ID4gdGhlIGJpc2VjdCB3aWxsIGhhdmUgcGlu
Y3RybCBidWlsZCBvciBmdW5jdGlvbiBicm9rZW4uDQo+IA0KPiBIaSBBbnNvbiwNCj4gDQo+IA0K
PiBJIHNlZSB5b3VyIHBvaW50IGFuZCBJIGtub3cgdGhhdCB0aGlzIGlzIGEgdmVyeSBoYXJkIHRh
c2sgdG8gZ2V0IGl0IHJpZ2h0IGZyb20NCj4gDQo+IHRoZSBmaXJzdCBwYXRjaGVzLg0KPiANCj4g
QnV0IGxldCBtZSBzdWdnZXN0IGF0IGxlYXN0IHRoYXQ6DQo+IA0KPiAtIGNoYW5nZXMgaW7CoCBk
cml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtaW14LmMgKGluY2x1ZGUgZmlsZSBhbmQN
Cj4gTU9EVUxFXyBtYWNyb3Mgc2hvdWxkIGdvIHRvIGEgc2VwYXJhdGUgcGF0Y2gpLg0KDQpZb3Ug
bWVhbnQgaW4gcGF0Y2ggIzIsIHRoZSBjaGFuZ2VzIGluIEtjb25maWcgYW5kIHRoZSBjaGFuZ2Vz
IGluIC5jIGZpbGUgc2hvdWxkDQpiZSBzcGxpdCB0byAyIHBhdGNoZXM/DQoNClRoYW5rcywNCkFu
c29uIA0KDQo=
