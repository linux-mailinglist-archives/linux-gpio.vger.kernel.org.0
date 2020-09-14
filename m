Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2380268281
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 04:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbgINCT4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Sep 2020 22:19:56 -0400
Received: from mail-eopbgr20073.outbound.protection.outlook.com ([40.107.2.73]:62177
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725965AbgINCTx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 13 Sep 2020 22:19:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dw6HOSp1QrphT8hiuoiqfcB4o40fy24mkMolfQtjiMtfUWL+klSHxAhYLhVvc0mxDmcax9jnrM3Xlmud/qILuSWOFujsURV56YPXCniVcHYBOK7wDEL5C3FemiZdqIlWoL8Dm7Qu/H1htqpr+QmOOMGKhWrwS9h0UzZVkyvi6lPaZUDpmku2EaGrBA30JRSdn222sXdiIIz6tjRXteBZ8W46jV6T1N5OFjOIJI611iYAqKxcmjRJnTT+GK3+ubzmYyhv7Mgj9+wdG6eI7fUaKs/o6piEZJ1CK0uKaWqxAacR4X3c1kd/K2v9Az5p60iGoqlfuMTlXQzq7IwBo8u7Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2GQuQbhVOBDO68B0cqNexO17tYB8BEumBg27GLjbSI=;
 b=nhxmJNymIIF2/AG5GmA1WFpvyM9ixI9mGa5dydvKcQ8/2+pivNs5UAVzE2i2N0I61YlY0p/+/1hq4BNv45j4T/yYB5PonEuSpLmwmPxNalNE17k87bZ4x4n0yDBZ063uQfDBYBpX1CD9iXDJ5tIT06IuHaiBjWewlN0X4t4eGiKjyD3bfoVqSD07uUrCNgQnoRpGtXqYf6eIz/wJs0brGYVebKbzn/1rcNaAVr6c7ALLlhixmy3QJnd/waGBlMCyrC/vW3rumjR7gI7rYRIy2VLA8Me1YMZlvMHX/qhh0JXHoa0SFV8gngGBTHvrX2ZdciqcJTBb4ACKCX2VE8Y/JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2GQuQbhVOBDO68B0cqNexO17tYB8BEumBg27GLjbSI=;
 b=pgbnVplkL0KZwVbOE8gKa3D3SsySIGhBXAVLYJCb0ur51lafIgYZQZY//ZnU2RGZFqfN+qkTaijBVrqrKJ5MgnHw6thUsyas+O8J2m2C+QYarlqs7DlSaR+2Ju5WOyLipS7OGyePmsoVU6iPJECU0M2xv5PJJXYZZAVErci2kQA=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB7PR04MB5466.eurprd04.prod.outlook.com (2603:10a6:10:8a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Mon, 14 Sep
 2020 02:19:49 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::9c75:8bb2:aff6:450d]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::9c75:8bb2:aff6:450d%3]) with mapi id 15.20.3370.019; Mon, 14 Sep 2020
 02:19:49 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Arnd Bergmann <arnd@arndb.de>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
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
Thread-Index: AQHWX8pucFw5LDc3OEu6t4xCVjI40KkTQNIAgAfaWJCAACrxgIAACAjggAAMTQCAAATTIIAAGHmAgDrsWRCADrI/AIACosRQ
Date:   Mon, 14 Sep 2020 02:19:49 +0000
Message-ID: <DB3PR0402MB3916B2F7EDB51F9D51491218F5230@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1595382353-17486-1-git-send-email-Anson.Huang@nxp.com>
 <CAK8P3a13gcF_+dkfxZW0u_YuJ92hY1JukWfzM+e30iM=YUhraQ@mail.gmail.com>
 <DB3PR0402MB3916F080E4912B27B18BEADEF5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAK8P3a2CBYV2xEkedQYmzL4XgHPeu02=vmLffq+RWwvEvuUGKQ@mail.gmail.com>
 <DB3PR0402MB391674F67A1B9F2732883C0BF5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAK8P3a0XpKnbz79dH4i7HofGgpAodtmgdBmVBVQOKfCiJMkpPw@mail.gmail.com>
 <DB3PR0402MB3916634EA84687D6C7535BC1F5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAK8P3a06tu4UgTxT4q9eS4=z5AHiEWQMhk5PfZEz=4t+f26s5Q@mail.gmail.com>
 <DB3PR0402MB391685755C70D85A1E797C0BF52C0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CACRpkdYN4VdNZOC5f5eAxp=6cXq25owiNW0KVKRupbEFRSANKQ@mail.gmail.com>
In-Reply-To: <CACRpkdYN4VdNZOC5f5eAxp=6cXq25owiNW0KVKRupbEFRSANKQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8bdc2e27-b07b-40fc-1642-08d85854a860
x-ms-traffictypediagnostic: DB7PR04MB5466:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB5466BB2766A337044EB8FFDFF5230@DB7PR04MB5466.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LQHuncFeb6qiSFCt1d9mvEGSTSAW5BuHu30zkkrZ01pfng1fkcqQzXkCSCUn5a3+MteIizsrHv6w2LaHSgHoxkA94xhUrLgKYWrmjV9v98JSsRz9qrDPhAaM5lDS83HKHgkuEF2o53H6c1vyjrv8lVxGkz/MBQ3uIltnt+60QJcSb/yfpsj2t+YLeFmPsrY0vIgJzhGbYrHUfIfLkyW0NdYZ/OioeNDSEZAjumLB2Kz0VG918KbUBiXkllNcXAnOJAMmTFzFv07mFrzQLcTCDyxUEIeHXUsE8poRWrmTL5t1r8CRMH/TlgUw5AyiaI8X/U1NNdn7lf1EKRxQx87Jjg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(8936002)(7416002)(2906002)(4326008)(76116006)(64756008)(66476007)(66556008)(6916009)(66946007)(66446008)(86362001)(186003)(478600001)(71200400001)(5660300002)(26005)(9686003)(44832011)(83380400001)(316002)(6506007)(7696005)(52536014)(54906003)(53546011)(33656002)(8676002)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: nTyH87elrYRKVlCsFr17i4JJ1wDKPnJiuQJcJaThbsIL9j82yIrx4ZeCnmcRaauRQTOum0vT3KZ1n4cQ6BAG2B0ovtMtnzR6ZMymHvQGu53f7kJgzWIlxORsrPxJ24A7mQ5+n49B+x2FEZ5udr3oibn45EAtmtfuU62IOzX406ZVVzoMH2NSfwU4E31pU1jYTrPFrblJR3QbZNruJT4lrEeQcgDjmbFszDX9fTnmPhONSjpF0yC8eyqIdYKjc3ntPXXbGDlCvS8wyV+TKJ80XibZRON89DYfRXG76V+tZgjh+N8wOZn1ljZztO3ZXCfmBrlEMuvqV+lHCacDQSG3ZLg1a8aENKOdRd9pRrHDDA7vETyg3660CR42fyTOygA1HFk7U7y/tY8sSPxsob0KVERuFDUrt52UOBOiVFSbp8Q29sZeXKDIV5qmSkNwJLL1F7IbyV2j963hKaIVXsIjWZQwROjXenp7+BFXqMTtkeGCkYXpmfYjPf74Z+UtDdKH8Wz/BAz7vzjBsbn8wSTIzIO03hjkg9GZSPX3BnGGRiPDmkit0yQl9DsgWl2+21jc3xdDxxDn5ZD/Z4nsJDNzl5yZJiO8MViycSoTv3I0y+vQbVPle/Aw8z+bvbhmBKtaUPPbWUdML2zYChE3BFlLhA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bdc2e27-b07b-40fc-1642-08d85854a860
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2020 02:19:49.7052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FMnclyiQFPf9QV7rrusMnXLEcBo1mBqRNch5PdTbS2GEu+BLNzBYBi+Lndy+t9yqXKsOJ6htmQUWr2GevE0mCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5466
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksIExpbnVzDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWMiAxLzRdIGdwaW86IG14YzogU3Vw
cG9ydCBtb2R1bGUgYnVpbGQNCj4gDQo+IE9uIFRodSwgU2VwIDMsIDIwMjAgYXQgMzozMSBBTSBB
bnNvbiBIdWFuZyA8YW5zb24uaHVhbmdAbnhwLmNvbT4NCj4gd3JvdGU6DQo+IA0KPiA+IEhpLCBM
aW51cw0KPiA+ICAgICAgICAgRG8geW91IGhhdmUgY2hhbmNlIHRvIHRha2UgYSBsb29rIGF0IHRo
aXMgcGF0Y2ggc2VyaWVzPw0KPiANCj4gSSd2ZSBzZWVuIHRoZXJlIHdhcyBwbGVudHkgZGlzY3Vz
c2lvbiBhYm91dCB0aGVtLCBsaWtlIHRoaXMgb25lLCBzbyBJIGV4cGVjdGVkIGENCj4gcmVwb3N0
IChkaWRuJ3QgYW55dGhpbmcgY2hhbmdlIGF0IGFsbD8pIGFsc28gYSByZWJhc2Ugb24gdjUuOS1y
YzEgc28gSSBkbyBub3QNCj4gaGF2ZSB0byBkZWFsIHdpdGggYW55IG1lcmdlIGNvbmZsaWN0cy4N
Cg0KSSB3ZW50IHRocm91Z2ggdGhlIGRpc2N1c3Npb24gYWdhaW4sIHRoZSBtYWluIGNvbmNlcm4g
aXMgd2hldGhlciBuZWVkIHRvIHN1cHBvcnQNCnVubG9hZCBpZiB0aGUgZHJpdmVyIHN1cHBvcnRz
IG1vZHVsZSBidWlsZCwgYnV0IGZvciBTb0MgR1BJTyBkcml2ZXIsIGFzIGpvaG4gc2FpZCwgaXQg
aXMNCmNvbW1vbmx5IHVzZWQgYnkgcGVyaXBoZXJhbCBkZXZpY2VzLCBzaW1pbGFyIGFzIGNsb2Nr
LCBwaW5jdHJsIGRyaXZlciwgc29ydGluZyBvdXQgdGhlDQp1bmxvYWRpbmcgaXMgcGFydGljdWxh
cmx5IGNvbXBsaWNhdGVkIG9yIHRoZXJlIGlzIHNvbWUgbWlzc2luZyBpbmZyYXN0cnVjdHVyZSwg
YW5kIGluDQp0aG9zZSBjYXNlcyBiZWluZyBhYmxlIHRvIGxvYWQgYSAicGVybWFuZW50IiBtb2R1
bGUgc2VlbXMgdG8gbWUgbGlrZSBhIGNsZWFyIGJlbmVmaXQuDQoNClNvIEkgdGhpbmsgdGhlIGZp
cnN0IHN0ZXAgaXMgdG8ganVzdCBlbmFibGUgaXQgYXMgInBlcm1hbmVudCIgbW9kdWxlcyBsaWtl
IHBpbmN0cmwvY2xrIGRyaXZlciwNCmFzIGN1cnJlbnRseSwgbW9zdCBvZiB0aGUgU29DIEdQSU8g
dXNlcnMgYXJlIE5PVCBzdXBwb3J0aW5nIG1vZHVsZSBidWlsZCBhdCBhbGwsIHNvIHRoZQ0KdW5s
b2FkIHN1cHBvcnQgZm9yIFNvQyBHUElPIGRyaXZlciBpcyBOT1QgYXZhaWxhYmxlIGN1cnJlbnRs
eS4NCg0KPiANCj4gQ291bGQgeW91IHJlYmFzZSBhbmQgcmVzZW5kPw0KDQpJIHdpbGwgcmViYXNl
IHRvIGxhdGVzdCBsaW51eC1uZXh0IGFuZCByZXNlbmQgdGhlIHBhdGNoIHNlcmllcy4NCg0KVGhh
bmtzLA0KQW5zb24NCg==
