Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A383B22EB13
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 13:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbgG0LVk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 07:21:40 -0400
Received: from mail-eopbgr70044.outbound.protection.outlook.com ([40.107.7.44]:21207
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726324AbgG0LVk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 27 Jul 2020 07:21:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLqqgF6RYRO6wSXsHwNyI7zXYPeXVi/uXB8GnXhe84b/bmKUEoE9WB6CknEC7qZo+9/ZmY3QFbbf9ihHPmNNYxmDLEOrht6AXsG3EK5FHU+NGJzOFYvlFrj9j64HtVih4fkNP0rUsQvk/hIzubkC6tbSLcNB2Tg/NNJucoBEiKwp7sAXMn8+V6n2TEvtDH1Lry1bQ2xPdlV9rkUuddPHsyY+2fPlIFXlP+KxbNxzUeNrtRf6rO/0igUFOKHOjQohOA2jNIgi9i2i0jxMPCj/IbNmLFh4Jhe4DopUKXIeLYzNgmKvKQL0ObhY3rtJzZNmCVH+JP92quhXNbDwxLJ1cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SggJvCdX0yXL7h3iRZJwQt0LhXcalAsElh3YZln75kY=;
 b=YElO9yK14GDrMJLgWT579eYQ3izf302aYBP08VfkeeDBn4xJ0djKA2/d2bz0QOJfnQ46p4WdWQHKaOHmiaFdZ3mWk5CkP8515/8e2GBroOySRF4H1h65j0EAEVsqqQZy3Kp4ov6H6NCvm2z1FSngH4aiHTRdEkPrUALzO7lOYYSr6a/t+7UYxDy+CBBNUyZ0ySQm8K0srDCnvXXmk5+yiGScdEOpBFuEr3GlSSYy6noFjhySdO152IU1sKIxl26Xv5WWWldQ+FdlJ2VImCTJ0k1GB2VDYtAVyzGVH/AzIO00fplWPw2fu4dLzq8w8zavYE7hWGtXoGf69rg6S3YjGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SggJvCdX0yXL7h3iRZJwQt0LhXcalAsElh3YZln75kY=;
 b=FpiYDakaxKCsCfrrktvJ5EPRtRsE7POVZSG5kGTPiuTQ9E6Hltd2ZfV+WHeLGb2qpw5PalkRJe5YsmbTI9M3zhnplvkNjCxCQPsouRB6H5n6IKBfNHPPgCtcLgB8Ifp773SoUt5oHY1eCIYzwYPTZj70voMDCgotkk4PXRr5/rk=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB6PR0401MB2534.eurprd04.prod.outlook.com (2603:10a6:4:3c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Mon, 27 Jul
 2020 11:21:34 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::49f8:20ce:cf20:80b3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::49f8:20ce:cf20:80b3%6]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 11:21:34 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Arnd Bergmann <arnd@arndb.de>
CC:     Russell King - ARM Linux <linux@armlinux.org.uk>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Peter Chen <peter.chen@nxp.com>,
        "oleksandr.suvorov@toradex.com" <oleksandr.suvorov@toradex.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Peng Fan <peng.fan@nxp.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Olof Johansson <olof@lixom.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joel Stanley <joel@jms.id.au>, Lubomir Rintel <lkundrak@v3.sk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Leo Li <leoyang.li@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "michael@walle.cc" <michael@walle.cc>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V2 1/4] gpio: mxc: Support module build
Thread-Topic: [PATCH V2 1/4] gpio: mxc: Support module build
Thread-Index: AQHWX8pucFw5LDc3OEu6t4xCVjI40KkTQNIAgAfaWJCAACrxgIAACAjg
Date:   Mon, 27 Jul 2020 11:21:34 +0000
Message-ID: <DB3PR0402MB391674F67A1B9F2732883C0BF5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1595382353-17486-1-git-send-email-Anson.Huang@nxp.com>
 <CAK8P3a13gcF_+dkfxZW0u_YuJ92hY1JukWfzM+e30iM=YUhraQ@mail.gmail.com>
 <DB3PR0402MB3916F080E4912B27B18BEADEF5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAK8P3a2CBYV2xEkedQYmzL4XgHPeu02=vmLffq+RWwvEvuUGKQ@mail.gmail.com>
In-Reply-To: <CAK8P3a2CBYV2xEkedQYmzL4XgHPeu02=vmLffq+RWwvEvuUGKQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [183.192.23.221]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4433ba10-29aa-4bf9-967f-08d8321f385f
x-ms-traffictypediagnostic: DB6PR0401MB2534:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB2534F0D0E171B6910D3F23FDF5720@DB6PR0401MB2534.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QGMN2WVUhNlZptvuy9j2zaI2PYoOgmhJm/I5l2rk53eI7UUEztSx5gPN+W82gZQNNgxjFwsS/wgH0tMvLES8ppnrd4KbwOwy/qobMhWWLojUho0jvv0pgQlrwaun0cZ3MU4btL/crvmEpDTcgFFFJi9EAOk8pri+qBaT09kYlBTvM+RTgdsD00AlHSHO2agTyYPlL4VvsSvWZ0QhOEfjwqzplm1zZkSAEv0NCmQIaS0nDYXCwreTU0U/0nctumejld3rhVJzWfEzeXUdfvqF7ChA7emFQ8SANZgTrw0uPlJsjw8eH5CbvLqK4tt8Bre6Ea5lwGtIWq1dprBlWz2a6g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(136003)(366004)(346002)(396003)(83380400001)(44832011)(33656002)(54906003)(2906002)(316002)(76116006)(4326008)(8676002)(5660300002)(66556008)(66476007)(64756008)(7696005)(186003)(9686003)(66446008)(6916009)(66946007)(26005)(53546011)(55016002)(7416002)(71200400001)(8936002)(6506007)(52536014)(86362001)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Wai6Hs1pIZJoBQtW0gTInNXxocf0fyxQz5bDCaQrj04RLC5IPPBt3+UHH2fg64jzkyCfM1EwZRfJ0WsQWRiSGzMoIZIeeTdSB7Dz+164Lv/Hp1jTd927VhhNU5tqvLb2zgFiU3iyb6LtKUOimDjUKw1Cvkd4jtaF3X0tMEUeW6VIpHjRrTS7V9eNUz9+JzBqjbVcOP4YyLbQEAsbLD0TVR8nGrgp4ckZM6MXZiQzYt6XIWziXh63GQSJmEZFzeIG8MrnitZbZ2hIEDrA0HC0cW4XxcbPzd5cLKF+hDJoNYXe/wYLYG38KlUckLxGXGQYxSGoNsAWceN3zl+02lW+PY36z5UcppymDySug88sx9C8P5fa8JN2X7Yvl61WBhQFw0oUm2B3JimIijikFq9E7Zw9yvCx/bJF7tTSpZpWHfLi/2Ql1/zsO96DyVZBjt8hpDbfei+mqi3A/H7xgGLfKJMPu8g8LIEJgnDGa+YuMpwWF/kGrMsZTzJroaPuPWyM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4433ba10-29aa-4bf9-967f-08d8321f385f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2020 11:21:34.1750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HgnWg74s4y1JjUMR8JUl3V28kp7NivdOxNtOSwgRT73k5O20Ve8qsMV9eW+6JR3nu/lzACvcz0sfTpBLfC7Agg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2534
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksIEFybmQNCg0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjIgMS80XSBncGlvOiBteGM6IFN1
cHBvcnQgbW9kdWxlIGJ1aWxkDQo+IA0KPiBPbiBNb24sIEp1bCAyNywgMjAyMCBhdCAxMDoxOCBB
TSBBbnNvbiBIdWFuZyA8YW5zb24uaHVhbmdAbnhwLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiBTdWJq
ZWN0OiBSZTogW1BBVENIIFYyIDEvNF0gZ3BpbzogbXhjOiBTdXBwb3J0IG1vZHVsZSBidWlsZA0K
PiA+ID4NCj4gPiA+IE9uIFdlZCwgSnVsIDIyLCAyMDIwIGF0IDM6NTAgQU0gQW5zb24gSHVhbmcg
PEFuc29uLkh1YW5nQG54cC5jb20+DQo+ID4gPiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gQ2hh
bmdlIGNvbmZpZyB0byB0cmlzdGF0ZSwgYWRkIG1vZHVsZSBkZXZpY2UgdGFibGUsIG1vZHVsZSBh
dXRob3IsDQo+ID4gPiA+IGRlc2NyaXB0aW9uIGFuZCBsaWNlbnNlIHRvIHN1cHBvcnQgbW9kdWxl
IGJ1aWxkIGZvciBpLk1YIEdQSU8gZHJpdmVyLg0KPiA+ID4gPg0KPiA+ID4gPiBBcyB0aGlzIGlz
IGEgU29DIEdQSU8gbW9kdWxlLCBpdCBwcm92aWRlcyBjb21tb24gZnVuY3Rpb25zIGZvcg0KPiA+
ID4gPiBtb3N0IG9mIHRoZSBwZXJpcGhlcmFsIGRldmljZXMsIHN1Y2ggYXMgR1BJTyBwaW5zIGNv
bnRyb2wsDQo+ID4gPiA+IHNlY29uZGFyeSBpbnRlcnJ1cHQgY29udHJvbGxlciBmb3IgR1BJTyBw
aW5zIElSUSBldGMuLCB3aXRob3V0DQo+ID4gPiA+IEdQSU8gZHJpdmVyLCBtb3N0IG9mIHRoZSBw
ZXJpcGhlcmFsIGRldmljZXMgd2lsbCBOT1Qgd29yaw0KPiA+ID4gPiBwcm9wZXJseSwgc28gR1BJ
TyBtb2R1bGUgaXMgc2ltaWxhciB3aXRoIGNsb2NrLCBwaW5jdHJsIGRyaXZlcg0KPiA+ID4gPiB0
aGF0IHNob3VsZCBiZSBsb2FkZWQgT05DRSBhbmQgbmV2ZXIgdW5sb2FkZWQuDQo+ID4gPiA+DQo+
ID4gPiA+IFNpbmNlIE1YQyBHUElPIGRyaXZlciBuZWVkcyB0byBoYXZlIGluaXQgZnVuY3Rpb24g
dG8gcmVnaXN0ZXINCj4gPiA+ID4gc3lzY29yZSBvcHMgb25jZSwgaGVyZSBzdGlsbCB1c2Ugc3Vi
c3lzX2luaXRjYWxsKCksIE5PVA0KPiBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKCkuDQo+ID4gPg0K
PiA+ID4gSSdtIG5vdCBmb2xsb3dpbmcgdGhpcyBleHBsYW5hdGlvbi4NCj4gPiA+DQo+ID4gPiBX
aHkgaXMgdGhpcyBkcml2ZXIgdXNpbmcgc3lzY29yZV9vcHMgcmF0aGVyIHRoYW4NCj4gPiA+IFNJ
TVBMRV9ERVZfUE1fT1BTKCkgb3Igc2ltaWxhcj8NCj4gPg0KPiA+IEJlbG93IGlzIHRoZSBvcmln
aW5hbCBwYXRjaCBvZiB1c2luZyBzeXNjb3JlX29wcywgaXQgaGFzIGV4cGxhbmF0aW9uOg0KPiA+
DQo+ID4gY29tbWl0IDFhNTI4N2EzZGJjMzRjZDBjMDJjOGY2NGM5MTMxYmQyM2NkZmUyYmINCj4g
PiBBdXRob3I6IEFuc29uIEh1YW5nIDxhbnNvbi5odWFuZ0BueHAuY29tPg0KPiA+IERhdGU6ICAg
RnJpIE5vdiA5IDA0OjU2OjU2IDIwMTggKzAwMDANCj4gPg0KPiA+ICAgICBncGlvOiBteGM6IG1v
dmUgZ3BpbyBub2lycSBzdXNwZW5kL3Jlc3VtZSB0byBzeXNjb3JlIHBoYXNlDQo+ID4NCj4gPiAg
ICAgRHVyaW5nIG5vaXJxIHN1c3BlbmQvcmVzdW1lIHBoYXNlLCBHUElPIGlycSBjb3VsZCBhcnJp
dmUNCj4gPiAgICAgYW5kIGl0cyByZWdpc3RlcnMgbGlrZSBJTVIgd2lsbCBiZSBjaGFuZ2VkIGJ5
IGlycSBoYW5kbGUNCj4gPiAgICAgcHJvY2VzcywgdG8gbWFrZSB0aGUgR1BJTyByZWdpc3RlcnMg
ZXhhY3RseSB3aGVuIGl0IGlzDQo+ID4gICAgIHBvd2VyZWQgT04gYWZ0ZXIgcmVzdW1lLCBtb3Zl
IHRoZSBHUElPIG5vaXJxIHN1c3BlbmQvcmVzdW1lDQo+ID4gICAgIGNhbGxiYWNrIHRvIHN5c2Nv
cmUgc3VzcGVuZC9yZXN1bWUgcGhhc2UsIGxvY2FsIGlycSBpcw0KPiA+ICAgICBkaXNhYmxlZCBh
dCB0aGlzIHBoYXNlIHNvIEdQSU8gcmVnaXN0ZXJzIGFyZSBhdG9taWMuDQo+IA0KPiBUaGUgZGVz
Y3JpcHRpb24gbWFrZXMgc2Vuc2UsIGJ1dCB0aGlzIG11c3QgYmUgYSBwcm9ibGVtIHRoYXQgb3Ro
ZXINCj4gZ3Bpby9waW5jdHJsIGlycWNoaXAgZHJpdmVycyBoYXZlIGFzIHdlbGwuDQo+IA0KPiBM
aW51cywgY291bGQgeW91IGhhdmUgYSBsb29rPyBJIHNlZSB0aGVzZSBvdGhlciBwaW5jdHJsIGRy
aXZlcnMgdXNpbmcNCj4gU0lNUExFX0RFVl9QTV9PUFM6DQo+IA0KPiBkcml2ZXJzL3BpbmN0cmwv
bm9tYWRpay9waW5jdHJsLW5vbWFkaWsuYzpzdGF0aWMNCj4gU0lNUExFX0RFVl9QTV9PUFMobm1r
X3BpbmN0cmxfcG1fb3BzLA0KPiBkcml2ZXJzL3BpbmN0cmwvcGluY3RybC1yb2NrY2hpcC5jOnN0
YXRpYw0KPiBTSU1QTEVfREVWX1BNX09QUyhyb2NrY2hpcF9waW5jdHJsX2Rldl9wbV9vcHMsDQo+
IHJvY2tjaGlwX3BpbmN0cmxfc3VzcGVuZCwNCj4gZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtc3Rt
ZnguYzpzdGF0aWMNCj4gU0lNUExFX0RFVl9QTV9PUFMoc3RtZnhfcGluY3RybF9kZXZfcG1fb3Bz
LA0KPiBkcml2ZXJzL3BpbmN0cmwvcWNvbS9waW5jdHJsLW1zbS5jOlNJTVBMRV9ERVZfUE1fT1BT
KG1zbV9waW5jdHJsX2Rldl8NCj4gcG1fb3BzLA0KPiBtc21fcGluY3RybF9zdXNwZW5kLA0KPiBk
cml2ZXJzL3BpbmN0cmwvc3BlYXIvcGluY3RybC1wbGdwaW8uYzpzdGF0aWMNCj4gU0lNUExFX0RF
Vl9QTV9PUFMocGxncGlvX2Rldl9wbV9vcHMsIHBsZ3Bpb19zdXNwZW5kLCBwbGdwaW9fcmVzdW1l
KTsNCj4gDQo+IExpbnVzLCBjYW4geW91IGhhdmUgYSBsb29rIGFuZCBzZWUgaWYgdGhhdCBzYW1l
IHByb2JsZW0gYXBwbGllcyB0byBhbGwgb2YgdGhlDQo+IGFib3ZlPw0KPiANCj4gSXQgc2VlbXMg
dGhhdCBzb21lIGRyaXZlcnMgdXNlIFNFVF9OT0lSUV9TWVNURU1fU0xFRVBfUE1fT1BTKCkgaW5z
dGVhZCwNCj4gd2hpY2ggbG9va3MgbGlrZSBpdCBpcyBtZWFudCB0byBhZGRyZXNzIHRoZSBzYW1l
IHByb2JsZW0sIGJ1dCBhcyBJIGhhdmUgbm90DQo+IHVzZWQgdGhhdCBteXNlbGYsIEkgbWF5IGJl
IG1pc3VuZGVyc3RhbmRpbmcgdGhlIHByb2JsZW0gb3Igd2hhdCB0aGlzIG9uZQ0KPiBkb2VzLg0K
PiANCj4gPiA+IFdoeSBkbyB5b3UgbmVlZCBzdWJzeXNfaW5pdGNhbGwoKSByYXRoZXIgdGhhbiBh
IGRldmljZV9pbml0Y2FsbCgpPw0KPiA+DQo+ID4gVGhlIHN1YnN5c19pbml0Y2FsKCkgaXMgZG9u
ZSBieSBiZWxvdyBjb21taXQsIHRoZSBjb21taXQgbG9nIGhhcyBkZXRhaWwNCj4gZXhwbGFuYXRp
b24uDQo+ID4NCj4gPg0KPiA+IGNvbW1pdCBlMTg4Y2JmNzU2NGZiYTgwZTgzMzliOTQwNmU4NzQw
ZjNlNDk1YzYzDQo+ID4gQXV0aG9yOiBWbGFkaW1pciBaYXBvbHNraXkgPHZsYWRpbWlyX3phcG9s
c2tpeUBtZW50b3IuY29tPg0KPiA+IERhdGU6ICAgVGh1IFNlcCA4IDA0OjQ4OjE1IDIwMTYgKzAz
MDANCj4gPg0KPiA+ICAgICBncGlvOiBteGM6IHNoaWZ0IGdwaW9fbXhjX2luaXQoKSB0byBzdWJz
eXNfaW5pdGNhbGwgbGV2ZWwNCj4gDQo+IFRoYXQgY29tbWl0IG1hZGUgdGhlIGluaXRpYWxpemF0
aW9uIGxhdGVyIG5vdCBlYXJsaWVyLCBhcyBpdCBvcmlnaW5hbGx5IHdhcyBhDQo+IHBvc3Rjb3Jl
X2luaXRjYWxsKCkuIEluIHRoZSBsb2FkYWJsZSBtb2R1bGUgY2FzZSwgeW91IG1ha2UgaXQgZXZl
biBsYXRlciB0aGFuDQo+IHRoYXQsIHBvc3NpYmx5IGFzIHRoZSBsYXN0IG1vZHVsZSBsb2FkZWQg
d2hlbiBib290aW5nIHVwIHRoZSBzeXN0ZW0gKGZvbGxvd2VkDQo+IGJ5IGEgc3Rvcm0gb2YgZGVm
ZXJyZWQgcHJvYmVzKS4NCj4NCg0KWWVzLCBsb2FkYWJsZSBtb2R1bGUgd2lsbCBtYWtlIGl0IGV2
ZW4gbGF0ZXIsIHRoZSBhc3N1bXB0aW9uIGlzIHVzZXJzcGFjZSBjYW4gbG9hZCBpdA0KYmVmb3Jl
IGFueSB1c2VycyBkZXBlbmQgb24gR1BJTyBkcml2ZXIuIEdpdmVuIHRoYXQgd2UgaGF2ZSB0byBz
dXBwb3J0IGxvYWRhYmxlIG1vZHVsZQ0KZm9yIGFsbCBTb0Mgc3BlY2lmaWMgbW9kdWxlLCBkbyB5
b3UgaGF2ZSBhbnkgb3RoZXIgc3VnZ2VzdGlvbiBvZiBob3cgdG8gcHJvY2VlZCB0aGlzDQpyZXF1
aXJlbWVudCBmb3IgU29DIEdQSU8gZHJpdmVyPw0KDQogDQo+ID4gPiBJZiB0aGUgc3Vic3lzX2lu
aXRjYWxsKCkgaXMgaW5kZWVkIHJlcXVpcmVkIGhlcmUgaW5zdGVhZCBvZg0KPiA+ID4gZGV2aWNl
X2luaXRjYWxsKCksIGhvdyBjYW4gaXQgd29yayBpZiB0aGUgZHJpdmVyIGlzIGEgbG9hZGFibGUg
bW9kdWxlPw0KPiA+DQo+ID4gTXkgdW5kZXJzdGFuZGluZyBpczogdGhlcmUgYXJlIHR3byBzY2Vu
YXJpb3MsIG9uZSBmb3IgYnVpbHQtaW4gY2FzZSwNCj4gPiB0aGUgb3RoZXIgaXMgZm9yIGxvYWRh
YmxlIG1vZHVsZSwgdGhlIHN1YnN5c19pbml0Y2FsbCgpIGlzIGZvcg0KPiA+IGJ1aWx0LWluIGNh
c2UgYWNjb3JkaW5nIHRvIHRoZSB1cHBlciBjb21taXQsIGZvciBsb2FkYWJsZSBtb2R1bGUsIHRo
ZSB1c2VyDQo+IG5lZWRzIHRvIGhhbmRsZSB0aGUgc2VxdWVuY2Ugb2YgbW9kdWxlcyBsb2FkZWQu
DQo+IA0KPiBJIGRvbid0IHRoaW5rIHdlIGNhbiByZWx5IG9uIHVzZXIgc3BhY2UgdG8gY29vcmRp
bmF0ZSBtb2R1bGUgbG9hZCBvcmRlci4NCj4gVGhlIG1vZHVsZXMgYXJlIGdlbmVyYWxseSBsb2Fk
ZWQgaW4gYW4gYXJiaXRyYXJ5IG9yZGVyIGR1cmluZyB0aGUgY29sZHBsdWcNCj4gcGhhc2Ugb2Yg
dGhlIGJvb3Qgd2hlbiB1c2VyIHNwYWNlIGxvb2tzIGF0IHRoZSBhdmFpbGFibGUgZGV2aWNlcyBh
bmQgbG9hZHMgYQ0KPiBtb2R1bGUgZm9yIGVhY2ggb25lIG9mIHRoZW0gaW4gdGhlIG9yZGVyIGl0
IGZpbmRzIHRoZW0gaW4gc3lzZnMuDQo+IA0KPiBUaGlzIG1lYW5zIGFsbCBkcml2ZXJzIHRoYXQg
cmVseSBvbiBncGlvLCBwaW5jdHJsIG9yIGlycWNoaXAgaW50ZXJmYWNlcyBleHBvcnRlZA0KPiBm
cm9tIHRoaXMgZHJpdmVyIGhhdmUgdG8gYmUgYWJsZSB0byBkZWFsIHdpdGggdGhlbSBub3QgYmVp
bmcgdGhlcmUuIFRoaXMgY2FuDQo+IGFsc28gaGFwcGVuIHdoZW4gdGhlIHBpbmN0cmwgZHJpdmVy
IGlzIHRoZSBvbmx5IG9uZSB0aGF0IGlzIGEgbG9hZGFibGUgbW9kdWxlLA0KPiB3aGlsZSBldmVy
eXRoaW5nIGVsc2UgaXMgYnVpbHQtaW4uIFdoaWxlIHRoYXQgaXMgbm90IGEgY29uZmlndXJhdGlv
biB0aGF0IHVzZXJzDQo+IHdvdWxkIGxpa2VseSBjaG9vc2UgaW50ZW50aW9uYWxseSwgSSBkb24n
dCBzZWUgYSByZWFzb24gd2h5IGl0IHNob3VsZG4ndCB3b3JrLg0KPiANCj4gVXNpbmcgbW9kdWxl
X2luaXQoKSBvciBidWlsdGluX3BsYXRmb3JtX2RyaXZlcigpIGhlcmUgd291bGQgbWFrZSBnaXZl
IHNpbWlsYXINCj4gYmVoYXZpb3IgZm9yIHRoZSBidWlsdC1pbiBhbmQgbW9kdWxhciBjYXNlcyBh
bmQgYmUgc29tZXdoYXQgbW9yZSBjb25zaXN0ZW50LA0KPiBzbyB5b3UgZG9uJ3QgcnVuIGludG8g
YnVncyBvbmx5IHdoZW4gdGhlIGRyaXZlciBpcyBhIGxvYWRhYmxlIG1vZHVsZSBidXQgbWFrZQ0K
PiB0aGVtIG9idmlvdXMgZXZlbiB0byBleGlzdGluZyB1c2VycyB3aXRoIGEgYnVpbHRpbiBkcml2
ZXIuDQo+IA0KDQpNeSBvcmlnaW5hbCBpZGVhIG9mIGFkZGluZyBsb2FkYWJsZSBtb2R1bGUgc3Vw
cG9ydCBmb3IgU29DIHNwZWNpZmljIG1vZHVsZSBpcywgdHJ5DQp0byBrZWVwIGl0IGV4YWN0bHkg
c2FtZSB3aGVuIHRoZSBkcml2ZXIgaXMgYnVpbHQtaW4sIGJ1dCBmb3IgR0tJIHN1cHBvcnQsIGZp
cnN0LCB3ZSBuZWVkDQp0byBzdXBwb3J0IEdQSU8gZHJpdmVyIGJ1aWx0IGFzIG1vZHVsZSwgYW5k
IHdlIGRlZmluaXRlbHkgbmVlZCB0byB0aGluayBhYm91dCB0aGUgbW9kdWxlDQpsb2FkIHNlcXVl
bmNlIHRvIGhhbmRsZSB0aGVzZSBkZXBlbmRlbmN5LCBidXQgdGhpbmtpbmcgYWJvdXQgdGhlIGNv
bW1vbiBtb2R1bGUgd2lkZWx5DQp1c2VkIGJ5IGRldmljZXMsIHN1Y2ggYXMgcGluY3RybCwgY2xv
Y2sgYW5kIEdQSU8sIG1heWJlIG90aGVyIG1vZHVsZXMgbmVlZCBzb21lIHBhdGNoZXMNCnRvIGhh
bmRsZSB0aGUgZGVwZW5kZW5jeSwgYnV0IHRoYXQgd2lsbCBiZSBkb25lIGxhdGVyIHdoZW4gd2Ug
YXJlIHdvcmtpbmcgZm9yIHRob3NlIG1vZHVsZXMuDQoNClNvLCBjb3VsZCB5b3UgcGxlYXNlIGhl
bHAgYWR2aXNlIGhvdyB0byBwcm9jZWVkIGl0IGZvciB0aGlzIEdQSU8gZHJpdmVyIHRvIHN1cHBv
cnQgbG9hZGFibGUgbW9kdWxlPw0KDQpUaGFua3MsDQpBbnNvbg0KDQoNCg0K
