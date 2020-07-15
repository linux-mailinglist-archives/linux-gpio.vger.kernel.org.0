Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9207B220275
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2020 04:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbgGOCoF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 22:44:05 -0400
Received: from mail-db8eur05on2041.outbound.protection.outlook.com ([40.107.20.41]:2017
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726768AbgGOCoE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Jul 2020 22:44:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8nTgGjUyowPn0dT3E/nsRZMcSlleC/ovyB/7jXPiYUsjazqi7C0sLMv1hWuDX9ItsJV5XYKdwH5t9L3euvAFiQ1LeMmwX9g3TOzk5Vc8Sx4NhxivkNI2xLzhKU8oaBOHwGTYSIpqUlNk1Iws9WUhwNOsshteMNoYUAlTTsIJZscX7vPldj+fXfPN7evM1r0jXrBzSJ33Z5pxNl+9z7xH3Vdehp0PJB5CZ1mrzbo8BF3Q03y2ormFm19tTOXGV1nqnWzNEYcJTcOtb4jueOn61F03wkPt3S8SU2dYmrSF3cMgkLOkBU/wEmoLo2leE5JzLGP8oY9JlE7SZMqj/KwrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQZA7YXtX4C+/1p4zOAFbzgEBQvOfIy6lGNeRv/IN08=;
 b=IzPKrdG6WYP0Xkewdzw2N/ArctWCLgJFUUqbXQLrCnCyGZXYO/3MKHKqMtd/6TBMA/lA7kCjf0KK0oJScO8yaOHHT/7FukJuaK487RQwAoKIbef+Iynd0SgSeW3Mq7ZOrpqqDNOfH2JbTsSTqWrDt/9B9gVY3HzOyIz4YddKvPWRr+v9Kx3JEyNpn7gNY47i4GjechlnSJHeWzbjLeoNkaqcoruQq37Wa8golP3O3zJ62qxybcepWtE/txxLekgUbOOJerr47EG2hKTI5qEorBxaGMKatfGmJ7MxQzHuEz1s048nJSBgGuTeFzhSE8d/TopAzX2g6OlQQuMuLA0Iyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQZA7YXtX4C+/1p4zOAFbzgEBQvOfIy6lGNeRv/IN08=;
 b=W91CWs38ggtA7PZDXtlg6CNgWJU7ujcWPBZ4pXo5Fry6R+zJhFT7ZK2tlhZKmvzTntyO0u74W3f9l2F+nsYEr2BzHbODx16NjcmflWW7Ko6hqVZHiHn7toeuiHQCaH/pt83bx4Z0Flk2Vm4vZLGZE/IOmAGsPsM4Ae0/HTiHG1A=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB8PR04MB5802.eurprd04.prod.outlook.com (2603:10a6:10:a4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Wed, 15 Jul
 2020 02:44:00 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3%6]) with mapi id 15.20.3174.026; Wed, 15 Jul 2020
 02:44:00 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Russell King <linux@armlinux.org.uk>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "oleksandr.suvorov@toradex.com" <oleksandr.suvorov@toradex.com>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Leo Li <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Olof Johansson <olof@lixom.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 1/3] gpio: mxc: Support module build
Thread-Topic: [PATCH 1/3] gpio: mxc: Support module build
Thread-Index: AQHWVLZdNtvAex5vSUmx57p8ya+LG6kC6AIAgABGglCABMrXcA==
Date:   Wed, 15 Jul 2020 02:44:00 +0000
Message-ID: <DB3PR0402MB3916FB27846F462C2210C3BFF57E0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1594164323-14920-1-git-send-email-Anson.Huang@nxp.com>
 <CACRpkdYP4J+MZjxWUnkM-XGaMmFFZfMCfY13r7G6r2=v3F6zQw@mail.gmail.com>
 <DB3PR0402MB39168FEA9306CBF90A596E31F5630@DB3PR0402MB3916.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR0402MB39168FEA9306CBF90A596E31F5630@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f52a518b-3844-494d-c72e-08d82868edac
x-ms-traffictypediagnostic: DB8PR04MB5802:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB5802650E7B0F0A1670AE10C7F57E0@DB8PR04MB5802.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w2JVZqv0ZdXKFl6jIVloYs68LSeE6VeeX+ehegP3lkNwdsghmUn8Ce7Mfna2bE7AOfFkpaATb5jkch3XKGCLwK6ffBXuIOjlc4d/IcZ/NzadV/7/wV5c/T/KAbqavkqx8D+WMETuaFIOmXZ78NPWGbYrLR928x4JzfBcuf0MmUXxPLIpDrNrLPJWSBNaWS622/7UUsDYxejjwbWo8u8mDFLcvQNaIrVfkdyNrn7itp/Fal03njSRJTdqpQSzTKhN2YQvHezaHVr5FWXBlpYXtX2gvIlJMebiezB40Tw5O17kghR96sKLPZW7L9+4V+bGZJyKzRcsc/ElJxGUQeANdQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(2906002)(33656002)(6916009)(478600001)(8936002)(6506007)(66446008)(64756008)(86362001)(66556008)(53546011)(5660300002)(8676002)(4326008)(186003)(52536014)(54906003)(9686003)(55016002)(316002)(7416002)(7696005)(26005)(66476007)(76116006)(44832011)(71200400001)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: wVR8ObfzKiMfi38IOIz7fDJrG2dinNR+zxPVOiRR8C29aCcbc2beWYw7HKNfSggyz+xjcBY0RKiGcovObFsd5kv6U1u3x6GtHRhXsHr+5hxhz+5C0329jSWZ/j2YoGn3dWSQ/6Xf4j5cow92rXUnUR2P9CEkrhJwrTKo2u/jOIne44l4GN4UFKIbMZIinzmgOOzPXETPm0292ECIvQapdNn+wdL7O81MGwNVvbUkz7/C5uTcHTUeiuqwdgBGSnjp2qzsrktNyjvJn7hfni3h6kQBHp8ezRUqbo1JwolcEYwpvWrUDWMp2vsZ4MPyH0jyPy81p8GpMy9nOUeJYyH/Ti01irVgfedHpEpzm9AIr3XaHMq3TbVUxokWRSKw5I6Vy+/v3KzNM6XKHex5J3BYyK67xvgAPqouvlqhBAwWf5iS3zHrbHkLbF2RN6djsI/rfQ4x98B5xRHcx8Zd2J2/WfnYFE3fzWtZX2j7Wj/38VM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f52a518b-3844-494d-c72e-08d82868edac
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2020 02:44:00.0639
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nv/YNw5pakpSeKF//RMaTnsCMm38iFA+gtb/CAEbllZceCNCdvTj2O253/Wgq7RWFEQiFOjj7L8+/iLPsQsmag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5802
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksIExpbnVzDQoNCj4gU3ViamVjdDogUkU6IFtQQVRDSCAxLzNdIGdwaW86IG14YzogU3VwcG9y
dCBtb2R1bGUgYnVpbGQNCj4gDQo+IEhpLCBMaW51cw0KPiANCj4gPiBTdWJqZWN0OiBSZTogW1BB
VENIIDEvM10gZ3BpbzogbXhjOiBTdXBwb3J0IG1vZHVsZSBidWlsZA0KPiA+DQo+ID4gT24gV2Vk
LCBKdWwgOCwgMjAyMCBhdCAxOjI4IEFNIEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29t
Pg0KPiA+IHdyb3RlOg0KPiA+DQo+ID4gPiAgc3Vic3lzX2luaXRjYWxsKGdwaW9fbXhjX2luaXQp
Ow0KPiA+ID4gKw0KPiA+ID4gK01PRFVMRV9BVVRIT1IoIlNoYXduIEd1byA8c2hhd24uZ3VvQGxp
bmFyby5vcmc+Iik7DQo+ID4gPiArTU9EVUxFX0RFU0NSSVBUSU9OKCJpLk1YIEdQSU8gRHJpdmVy
Iik7IE1PRFVMRV9MSUNFTlNFKCJHUEwiKTsNCj4gPg0KPiA+IFlvdSBhcmUgbWFraW5nIHRoaXMg
bW9kdWFscml6YWJsZSBidXQga2VlcGluZyB0aGUgc3Vic3lzX2luaXRjYWxsKCksDQo+ID4gd2hp
Y2ggZG9lc24ndCBtYWtlIHZlcnkgbXVjaCBzZW5zZS4gSXQgaXMgb2J2aW91c2x5IG5vdCBuZWNl
c3NhcnkgdG8NCj4gPiBkbyB0aGlzIHByb2JlIGF0IHN1YnN5c19pbml0Y2FsbCgpIHRpbWUsIHJp
Z2h0Pw0KPiA+DQo+IA0KPiBJZiBidWlsZGluZyBpdCBhcyBtb2R1bGUsIHRoZSBzdWJzeXNfaW5p
dGNhbGwoKSB3aWxsIGJlIGVxdWFsIHRvIG1vZHVsZV9pbml0KCksIEkNCj4ga2VlcCBpdCB1bmNo
YW5nZWQgaXMgYmVjYXVzZSBJIHRyeSB0byBtYWtlIGl0IGlkZW50aWNhbCB3aGVuIGJ1aWx0LWlu
LCBzaW5jZQ0KPiBtb3N0IG9mIHRoZSBjb25maWcgd2lsbCBzdGlsbCBoYXZlIGl0IGJ1aWx0LWlu
LCBleGNlcHQgdGhlIEFuZHJvaWQgR0tJIHN1cHBvcnQuDQo+IERvZXMgaXQgbWFrZSBzZW5zZT8N
Cj4gDQo+ID4gVGFrZSB0aGlzIG9wcG9ydHVuaXR5IHRvIGNvbnZlcnQgdGhlIGRyaXZlciB0byB1
c2UNCj4gPiBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKCkgYXMgd2VsbC4NCj4gDQo+IElmIHlvdSB0
aGluayBpdCBoYXMgdG8gYmUgb3IgaXQgaXMgYmV0dGVyIHRvIHVzZSBtb2R1bGVfcGxhdGZvcm1f
ZHJpdmVyKCksIEkgd2lsbCBkbw0KPiBpdCBpbiBWMi4NCg0KSSB0cmllZCB0byByZXBsYWNlIHRo
ZSBzdWJzeXNfaW5pdGNhbGwoKSB3aXRoIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoKSwgYnV0IG1l
dCBpc3N1ZQ0KYWJvdXQgIiByZWdpc3Rlcl9zeXNjb3JlX29wcygmbXhjX2dwaW9fc3lzY29yZV9v
cHMpOyIgd2hpY2ggaXMgY2FsbGVkIGluIGdwaW9fbXhjX2luaXQoKQ0KZnVuY3Rpb24sIHRoaXMg
ZnVuY3Rpb24gc2hvdWxkIGJlIGNhbGxlZCBPTkxZIG9uY2UsIG1vdmluZyBpdCB0byAucHJvYmUg
ZnVuY3Rpb24gaXMgTk9UDQp3b3JraW5nLCBzbyB3ZSBtYXkgbmVlZCB0byBrZWVwIHRoZSBncGlv
X214Y19pbml0KCksIHRoYXQgaXMgYW5vdGhlciByZWFzb24gdGhhdCB3ZSBtYXkNCm5lZWQgdG8g
a2VlcCBzdWJzeXNfaW5pdGNhbGwoKT8NCg0KVGhhbmtzLA0KQW5zb24NCg==
