Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9DEC22E795
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 10:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgG0ITB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 04:19:01 -0400
Received: from mail-eopbgr40074.outbound.protection.outlook.com ([40.107.4.74]:13220
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726270AbgG0ITA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 27 Jul 2020 04:19:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VPZ4P/j524k5VoygCOFCGqRIpYO60QTIJlKRKnT5tP2nCDRLJK2RciQkEcPZt8FKSwVdhC7wMUTsBgyDFTF2wAfaLjAxF/lOrL/xOtxe8dLgI8iS1uWnuVWv+lfHyFY6WWoC7PydvSNotyx/5m1dHz96aLUh0rL/1x9TOaneEt4T9tK27e9R9gC7/USvFn8V1eHvfff0WQVjyVB7xXZdxtP0sTIZ9gNjsnhSi83aP3rLUZI0U8rfJ1ruEil4svUdsnPp2S09wH/cnu8plRfQt+9Bggo+04gn3E7A9U4ShpBzuWK84SMd0x6O9cA1ZEioOTNpsX3YIvAjtxEXm1+vKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+0y4QWc9LvZErEgqNiul+zANI8V6Ds9WcRzDsxrprk=;
 b=TO7ua8sciW38FTTiESkF79m6cqYQglIiKn1FN3NcT/ohvo3FCPd+WMA4sQzBPdZNkbBhwmK3bDdOAEwHFkFDk4xW5Gkpj5MdvrIi4HqQ4l5e6Ql4Tn2NlE/T80GrVdlfTftQQamwtUn+4x3rmA6+/5N55gJ2ZdL2bhe/oblQ4uhPiCGWMG5t6HBy4oYeSrDTLGMebzkhvv2EzTUELm4RP1XQazsSgyWGLWsQasbxjGJBbfR8V6mnyJtiRKTlqmI0ux8Vf6HonM5RsR3dfsO78gWlWHHyTX+MLn/m6hUhcnTfpUQuC5HItO6ouOq2utSgQssqwBXR35h22SLC95yKAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+0y4QWc9LvZErEgqNiul+zANI8V6Ds9WcRzDsxrprk=;
 b=jWcqcyq8v6hl8ojai5BM+6cUBYlxIYe4Om2JkXuxayORcQHfZWxMoX7ofDi54/OT/BG065IS/3I0brfcoLgvBBnjJtGs/HPJkQ03qKS8uVrvQPBA8Qx6DdUWJGckFXwH+B3NYcU6UP0zEyQ4bKi//F946GEPMOb6DbHBH57J2fU=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB6PR0402MB2757.eurprd04.prod.outlook.com (2603:10a6:4:94::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Mon, 27 Jul
 2020 08:18:56 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::49f8:20ce:cf20:80b3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::49f8:20ce:cf20:80b3%6]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 08:18:56 +0000
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
Thread-Index: AQHWX8pucFw5LDc3OEu6t4xCVjI40KkTQNIAgAfaWJA=
Date:   Mon, 27 Jul 2020 08:18:56 +0000
Message-ID: <DB3PR0402MB3916F080E4912B27B18BEADEF5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1595382353-17486-1-git-send-email-Anson.Huang@nxp.com>
 <CAK8P3a13gcF_+dkfxZW0u_YuJ92hY1JukWfzM+e30iM=YUhraQ@mail.gmail.com>
In-Reply-To: <CAK8P3a13gcF_+dkfxZW0u_YuJ92hY1JukWfzM+e30iM=YUhraQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [183.192.23.221]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3d25b094-52e3-4421-6154-08d83205b4f8
x-ms-traffictypediagnostic: DB6PR0402MB2757:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0402MB2757A4F17166652A365948B4F5720@DB6PR0402MB2757.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sWo/emntOo1dKamTTvcL+/48QqlFqFyzxVWhkZu5GDz2apI9KwKJVOGz0lBn7BNiOcrK3yxbZg76oNcVmaE80aTiN5mrrHXb4gzBORj6gPFAtb7PHgZXYsMUIe8pte7RXrQyd0M3GUMajOTHmXPErQell1ndSD8Z+itW1mbcSsdfkgE4q0KLSOcDhbjQDgaliEbalWWBInQyCUL8Qk/EJsGp5+YXEQ1PPzfaHRnJpRkQd+jaBi3Wk94IJABAo5/ojPEZR9aCDbqmrvWVb0CsgasTl8J9Bf8KdfCc6qxLex9X4zee0AXDWWWI536XULtmLf4OVmMq7Prw4k+qP/pn2A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(136003)(39860400002)(366004)(376002)(6916009)(66946007)(66476007)(66556008)(26005)(66446008)(186003)(9686003)(64756008)(7696005)(6506007)(478600001)(52536014)(86362001)(8676002)(5660300002)(53546011)(55016002)(7416002)(8936002)(71200400001)(33656002)(44832011)(83380400001)(4326008)(54906003)(76116006)(2906002)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: uYbtY46L15vE5MRFZ7qO1ZvWT8//1JBFhZXhH/Tbc5e2gECybIMYBGU5+GqN1U6Q6sKioie1neC/K1yB+YTE0PmrXEWAdRUhPLeZhvkOhpb0O8h4KJ1V+T/mdND6HiGv9axKLcWBHpr2hoA7kXR6SFMmhcpxQUpGQloFiC9bqdtEDRoIcoABxYNxo2dcZ+Af7635smy1iS04Wwljlg9P6ON5MHpRBHDs5U94F4pEOv4a/ZKFn9738lPAGH/umbUH4PBlRMZuHuBNTSEAcEEqsB4nILUoVANfR1BeyrOFwrabf7O/FL7HYYG8AiNmp+UR1AvX3fWVwkJ8Pm8/GJXLdQ/45m4fcXrEzYdQEEUdiPUm88wxlqs7z8eA9xSECrOTDTuzI/43WtBpgOXjwOf2wo7Es/nncLwc+uSk31meQg8KpjzBezc19mBuAaObIdmk9VcewYpcx+MR8N92n8J/Z9hYlqYGuJqj/iISvVRRJHQ7OSaUnBynjfNX/eQimYgA
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d25b094-52e3-4421-6154-08d83205b4f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2020 08:18:56.4557
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xdOGd8c6gcebiA5L2JHp3UTpWBAd2etxqQ/P5dhsY5lCm788GjiBL+aiawCmp7facW/X3794MTGmk55MNOmYdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2757
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksIEFybmQNCg0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjIgMS80XSBncGlvOiBteGM6IFN1
cHBvcnQgbW9kdWxlIGJ1aWxkDQo+IA0KPiBPbiBXZWQsIEp1bCAyMiwgMjAyMCBhdCAzOjUwIEFN
IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+IENo
YW5nZSBjb25maWcgdG8gdHJpc3RhdGUsIGFkZCBtb2R1bGUgZGV2aWNlIHRhYmxlLCBtb2R1bGUg
YXV0aG9yLA0KPiA+IGRlc2NyaXB0aW9uIGFuZCBsaWNlbnNlIHRvIHN1cHBvcnQgbW9kdWxlIGJ1
aWxkIGZvciBpLk1YIEdQSU8gZHJpdmVyLg0KPiA+DQo+ID4gQXMgdGhpcyBpcyBhIFNvQyBHUElP
IG1vZHVsZSwgaXQgcHJvdmlkZXMgY29tbW9uIGZ1bmN0aW9ucyBmb3IgbW9zdCBvZg0KPiA+IHRo
ZSBwZXJpcGhlcmFsIGRldmljZXMsIHN1Y2ggYXMgR1BJTyBwaW5zIGNvbnRyb2wsIHNlY29uZGFy
eSBpbnRlcnJ1cHQNCj4gPiBjb250cm9sbGVyIGZvciBHUElPIHBpbnMgSVJRIGV0Yy4sIHdpdGhv
dXQgR1BJTyBkcml2ZXIsIG1vc3Qgb2YgdGhlDQo+ID4gcGVyaXBoZXJhbCBkZXZpY2VzIHdpbGwg
Tk9UIHdvcmsgcHJvcGVybHksIHNvIEdQSU8gbW9kdWxlIGlzIHNpbWlsYXINCj4gPiB3aXRoIGNs
b2NrLCBwaW5jdHJsIGRyaXZlciB0aGF0IHNob3VsZCBiZSBsb2FkZWQgT05DRSBhbmQgbmV2ZXIN
Cj4gPiB1bmxvYWRlZC4NCj4gPg0KPiA+IFNpbmNlIE1YQyBHUElPIGRyaXZlciBuZWVkcyB0byBo
YXZlIGluaXQgZnVuY3Rpb24gdG8gcmVnaXN0ZXIgc3lzY29yZQ0KPiA+IG9wcyBvbmNlLCBoZXJl
IHN0aWxsIHVzZSBzdWJzeXNfaW5pdGNhbGwoKSwgTk9UIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIo
KS4NCj4gDQo+IEknbSBub3QgZm9sbG93aW5nIHRoaXMgZXhwbGFuYXRpb24uDQo+IA0KPiBXaHkg
aXMgdGhpcyBkcml2ZXIgdXNpbmcgc3lzY29yZV9vcHMgcmF0aGVyIHRoYW4NCj4gU0lNUExFX0RF
Vl9QTV9PUFMoKSBvciBzaW1pbGFyPw0KDQpCZWxvdyBpcyB0aGUgb3JpZ2luYWwgcGF0Y2ggb2Yg
dXNpbmcgc3lzY29yZV9vcHMsIGl0IGhhcyBleHBsYW5hdGlvbjoNCg0KY29tbWl0IDFhNTI4N2Ez
ZGJjMzRjZDBjMDJjOGY2NGM5MTMxYmQyM2NkZmUyYmINCkF1dGhvcjogQW5zb24gSHVhbmcgPGFu
c29uLmh1YW5nQG54cC5jb20+DQpEYXRlOiAgIEZyaSBOb3YgOSAwNDo1Njo1NiAyMDE4ICswMDAw
DQoNCiAgICBncGlvOiBteGM6IG1vdmUgZ3BpbyBub2lycSBzdXNwZW5kL3Jlc3VtZSB0byBzeXNj
b3JlIHBoYXNlDQoNCiAgICBEdXJpbmcgbm9pcnEgc3VzcGVuZC9yZXN1bWUgcGhhc2UsIEdQSU8g
aXJxIGNvdWxkIGFycml2ZQ0KICAgIGFuZCBpdHMgcmVnaXN0ZXJzIGxpa2UgSU1SIHdpbGwgYmUg
Y2hhbmdlZCBieSBpcnEgaGFuZGxlDQogICAgcHJvY2VzcywgdG8gbWFrZSB0aGUgR1BJTyByZWdp
c3RlcnMgZXhhY3RseSB3aGVuIGl0IGlzDQogICAgcG93ZXJlZCBPTiBhZnRlciByZXN1bWUsIG1v
dmUgdGhlIEdQSU8gbm9pcnEgc3VzcGVuZC9yZXN1bWUNCiAgICBjYWxsYmFjayB0byBzeXNjb3Jl
IHN1c3BlbmQvcmVzdW1lIHBoYXNlLCBsb2NhbCBpcnEgaXMNCiAgICBkaXNhYmxlZCBhdCB0aGlz
IHBoYXNlIHNvIEdQSU8gcmVnaXN0ZXJzIGFyZSBhdG9taWMuDQoNCj4gDQo+IFdoeSBjYW4gdGhl
IGRyaXZlciBub3QgdW5yZWdpc3RlciB0aGUgc3lzY29yZV9vcHMgdGhlIHdheSBpdCByZWdpc3Rl
cnMgdGhlbQ0KPiB3aGVuIHVubG9hZGluZyB0aGUgbW9kdWxlPw0KDQpBcyBwZXIgcHJldmlvdXMg
ZGlzY3Vzc2lvbiwgZm9yIFNvQyBsZXZlbCBHUElPLCBzaW5jZSBpdCBhY3RzIGFzIGludGVycnVw
dCBjb250cm9sbGVyIGFuZA0KbW9zdCBvZiBwZXJpcGhlcmFsIGRldmljZXMgbm93IGRlcGVuZHMg
b24gR1BJTyBkcml2ZXIgZm9yIHByb3BlciBmdW5jdGlvbiwgc28gaXQgbWFrZXMNCnNlbnNlIHRv
IGtlZXAgU29DIGxldmVsIEdQSU8gb25jZSBsb2FkZWQgYW5kIG5ldmVyIHVubG9hZC4NCg0KDQo+
IA0KPiBXaHkgZG8geW91IG5lZWQgc3Vic3lzX2luaXRjYWxsKCkgcmF0aGVyIHRoYW4gYSBkZXZp
Y2VfaW5pdGNhbGwoKT8NCg0KVGhlIHN1YnN5c19pbml0Y2FsKCkgaXMgZG9uZSBieSBiZWxvdyBj
b21taXQsIHRoZSBjb21taXQgbG9nIGhhcyBkZXRhaWwgZXhwbGFuYXRpb24uDQoNCg0KY29tbWl0
IGUxODhjYmY3NTY0ZmJhODBlODMzOWI5NDA2ZTg3NDBmM2U0OTVjNjMNCkF1dGhvcjogVmxhZGlt
aXIgWmFwb2xza2l5IDx2bGFkaW1pcl96YXBvbHNraXlAbWVudG9yLmNvbT4NCkRhdGU6ICAgVGh1
IFNlcCA4IDA0OjQ4OjE1IDIwMTYgKzAzMDANCg0KICAgIGdwaW86IG14Yzogc2hpZnQgZ3Bpb19t
eGNfaW5pdCgpIHRvIHN1YnN5c19pbml0Y2FsbCBsZXZlbA0KDQoNCj4gDQo+IElmIHRoZSBzdWJz
eXNfaW5pdGNhbGwoKSBpcyBpbmRlZWQgcmVxdWlyZWQgaGVyZSBpbnN0ZWFkIG9mIGRldmljZV9p
bml0Y2FsbCgpLCBob3cNCj4gY2FuIGl0IHdvcmsgaWYgdGhlIGRyaXZlciBpcyBhIGxvYWRhYmxl
IG1vZHVsZT8NCg0KTXkgdW5kZXJzdGFuZGluZyBpczogdGhlcmUgYXJlIHR3byBzY2VuYXJpb3Ms
IG9uZSBmb3IgYnVpbHQtaW4gY2FzZSwgdGhlIG90aGVyIGlzIGZvciBsb2FkYWJsZSBtb2R1bGUs
DQp0aGUgc3Vic3lzX2luaXRjYWxsKCkgaXMgZm9yIGJ1aWx0LWluIGNhc2UgYWNjb3JkaW5nIHRv
IHRoZSB1cHBlciBjb21taXQsIGZvciBsb2FkYWJsZQ0KbW9kdWxlLCB0aGUgdXNlciBuZWVkcyB0
byBoYW5kbGUgdGhlIHNlcXVlbmNlIG9mIG1vZHVsZXMgbG9hZGVkLg0KDQpUaGFua3MsDQpBbnNv
bg0KDQo=
