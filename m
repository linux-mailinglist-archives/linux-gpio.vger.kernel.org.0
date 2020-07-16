Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06EA52225D2
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 16:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728830AbgGPOiF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 10:38:05 -0400
Received: from mail-eopbgr40081.outbound.protection.outlook.com ([40.107.4.81]:30798
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726963AbgGPOiD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Jul 2020 10:38:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8BQAOfnv/OGU/4FC+R9X+Ed2eoS9p796qYQg5wdslCHwJKRqbt4paHa7yxdht5t5G8ETPMWBUe4/FzN6ciFe6tRtv4i2u6Oelm1DDG6aAYZWX0DM6xsPfiu/14b8QzFEVY9m5mpoCccYjeGm6OLZd2juAs7dTMdEZmO168k1//f7GcSTePLTfinaLzYZS6MbdZgUi9BSoFyXoUEqvyOpi9rEn/k5rxckKr08vOvp0MgNf2DKwmTLc0adom/maTWbaSU2/lGeXsESzOTxfBeLDxzw2BKZq7/VDGuS0c1pr8dZ60hyBDitbFqq6zk9Baq4AQU9ZrrL1PxaaywBF+fig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGxpOVs6/426bwNLfUyrglEQ6BY4pY7tw9959vo3yKE=;
 b=aTLtiqS2OO3ZborPUPfKDSCyD4WQCxc7jDsjvYwTKtEDjTllnx+9iEa+xKZTYSApurEyXzrvugDXVIqN/kISdGZ6z1oyuQSuzN1o7MbzBAPPoZAdKQGSjcLK8WXMj05/Cistxb7xmPz9whLJQamgNmRROTTvkUBxJvSHtvgeGvPwvFzOjJvA9EmQC0y6hbg0Qmnx0U1wLC3g2K2DlQRpqY5M4Zc2cFJneHkbNvCkXXTJ4Ka9G4PoqkIoO0Nca9fgD1CPD8rDSoR9qjnQvQrB1xX4RBFNC7irc1RSL9RG1BBMJdXnq2Sowtx/t0iYZNQCbVIWet7MbQNrKYeus86SJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGxpOVs6/426bwNLfUyrglEQ6BY4pY7tw9959vo3yKE=;
 b=cnXmhDmSfNf+WErcesKpiVRycDuWu/dHhrzZuKGP/p97T3PPOE7QBqzCvQf37HF6crAe5N+WDmmyx1OnOWj02WSHri9beE2wsbvU8LWnvwXR2s+mEVdQjo8Q/kmXBiih/wdoBnaRzW+8UkUANUCIYTaE1bqXH/c4XzexpI2G6l8=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB8PR04MB5660.eurprd04.prod.outlook.com (2603:10a6:10:a5::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Thu, 16 Jul
 2020 14:37:57 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3%6]) with mapi id 15.20.3174.026; Thu, 16 Jul 2020
 14:37:57 +0000
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
Thread-Index: AQHWVLZdNtvAex5vSUmx57p8ya+LG6kC6AIAgABGglCABMrXcIACTpaAgAAKSKA=
Date:   Thu, 16 Jul 2020 14:37:57 +0000
Message-ID: <DB3PR0402MB39167A4BB808A0679257DEF9F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1594164323-14920-1-git-send-email-Anson.Huang@nxp.com>
 <CACRpkdYP4J+MZjxWUnkM-XGaMmFFZfMCfY13r7G6r2=v3F6zQw@mail.gmail.com>
 <DB3PR0402MB39168FEA9306CBF90A596E31F5630@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <DB3PR0402MB3916FB27846F462C2210C3BFF57E0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CACRpkda2gdu8FsSM0MC6g8C1mebmVc5dFWJZwNvQUPXNi5bnkQ@mail.gmail.com>
In-Reply-To: <CACRpkda2gdu8FsSM0MC6g8C1mebmVc5dFWJZwNvQUPXNi5bnkQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [183.192.22.28]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ad5800b5-a655-494d-6809-08d82995d51b
x-ms-traffictypediagnostic: DB8PR04MB5660:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB56608E760EC7F42A2FF0D30AF57F0@DB8PR04MB5660.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VtC3eK7P+1RjX714oefvDu9SxqXPzBQ2+31ABS5IGAI5YHRgeJN6wtZkG/hAiZ+Fw+eLbeTWNFtuGF/WQ8vq2eFbs/m5lgp4JK1YKlLZdWliL7Epj89hoP4pOSuQEsS/UKDCcs+YOuvIgW474CaacVyFAQUsj93fAUrS/fCqxlLP1+ARrjmgG04GarQNJ1I9teTqS+ioAuW4rw6G6C47+jZYEAW4tmQeEuyqR0Wyi6gtNizN526IQjqKid5jOIbejfotSegxKJLn7FMw7x/lTHeu7YklJYRNhKs7PusnMzkap8Klc9hTvRsXdPuaonKL+n5eTaO/r2DO9me/J1e0Pg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(136003)(396003)(39860400002)(346002)(5660300002)(186003)(7416002)(52536014)(53546011)(66946007)(86362001)(6506007)(66556008)(2906002)(6916009)(8676002)(478600001)(64756008)(66446008)(7696005)(8936002)(316002)(4326008)(26005)(44832011)(9686003)(71200400001)(33656002)(76116006)(66476007)(54906003)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: dANe9wGxaB2ZOCletPCDF8m21x2zs6X1OlEjormgT8sahFkToFNZEo0+s0g++DpJt87gDoCUj+OEgToaW8VnuJXENE5cGw7Gns2xPXn76IYoVk/6EmHoPolxoB8pTUCvcI0NU9ZhXfZ8NjUR3NrGsWB/MLuKBYRVPkCanarMegmYbqVdtUgzTtzKrOKx2pf1glI0JpcTJy6k648Xo1IUuia/0x4+WOMzlsNcB9gGKAiMytMMDMIdi5s6SVWzwf/QtuZOziisM6Zt6JvDwZxKP/r0rJAgPCMB9mJCAlg5VvZ0TfA/qfwtB/nxiYKgkA5EQpwBZrQM2cdBET/TCJTklJQdG62al+98kX2qRf82bJvvME2vSPiAVlpJ1sf19QLB5kHggTH95CnK9hh57Fbvjn6nxSEn5BizP6i4U2qGfl4ieXL1cYlc/gPenD0yRClhJG15WOlqtlAsSIoVLIiPwq14x5ckGK5vXXnemDEF0fBfpdW6gWj5IfGmePXpB3Jp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad5800b5-a655-494d-6809-08d82995d51b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2020 14:37:57.4384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P57xHv6wLzEXwATDCAV8gIno6FTG8zXIm/egoYeulnnFTKJCU89sAx8HEigm9Nr39wiTUhcgWnojaz2d/GJeuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5660
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksIExpbnVzDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzNdIGdwaW86IG14YzogU3VwcG9y
dCBtb2R1bGUgYnVpbGQNCj4gDQo+IE9uIFdlZCwgSnVsIDE1LCAyMDIwIGF0IDQ6NDQgQU0gQW5z
b24gSHVhbmcgPGFuc29uLmh1YW5nQG54cC5jb20+DQo+IHdyb3RlOg0KPiANCj4gPiA+IFN1Ympl
Y3Q6IFJFOiBbUEFUQ0ggMS8zXSBncGlvOiBteGM6IFN1cHBvcnQgbW9kdWxlIGJ1aWxkDQo+ID4g
Pg0KPiA+ID4gSGksIExpbnVzDQo+ID4gPg0KPiA+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDEv
M10gZ3BpbzogbXhjOiBTdXBwb3J0IG1vZHVsZSBidWlsZA0KPiA+ID4gPg0KPiA+ID4gPiBPbiBX
ZWQsIEp1bCA4LCAyMDIwIGF0IDE6MjggQU0gQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5j
b20+DQo+ID4gPiA+IHdyb3RlOg0KPiA+ID4gPg0KPiA+ID4gPiA+ICBzdWJzeXNfaW5pdGNhbGwo
Z3Bpb19teGNfaW5pdCk7DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICtNT0RVTEVfQVVUSE9SKCJT
aGF3biBHdW8gPHNoYXduLmd1b0BsaW5hcm8ub3JnPiIpOw0KPiA+ID4gPiA+ICtNT0RVTEVfREVT
Q1JJUFRJT04oImkuTVggR1BJTyBEcml2ZXIiKTsNCj4gTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOw0K
PiA+ID4gPg0KPiA+ID4gPiBZb3UgYXJlIG1ha2luZyB0aGlzIG1vZHVhbHJpemFibGUgYnV0IGtl
ZXBpbmcgdGhlDQo+ID4gPiA+IHN1YnN5c19pbml0Y2FsbCgpLCB3aGljaCBkb2Vzbid0IG1ha2Ug
dmVyeSBtdWNoIHNlbnNlLiBJdCBpcw0KPiA+ID4gPiBvYnZpb3VzbHkgbm90IG5lY2Vzc2FyeSB0
byBkbyB0aGlzIHByb2JlIGF0IHN1YnN5c19pbml0Y2FsbCgpIHRpbWUsIHJpZ2h0Pw0KPiA+ID4g
Pg0KPiA+ID4NCj4gPiA+IElmIGJ1aWxkaW5nIGl0IGFzIG1vZHVsZSwgdGhlIHN1YnN5c19pbml0
Y2FsbCgpIHdpbGwgYmUgZXF1YWwgdG8NCj4gPiA+IG1vZHVsZV9pbml0KCksIEkga2VlcCBpdCB1
bmNoYW5nZWQgaXMgYmVjYXVzZSBJIHRyeSB0byBtYWtlIGl0DQo+ID4gPiBpZGVudGljYWwgd2hl
biBidWlsdC1pbiwgc2luY2UgbW9zdCBvZiB0aGUgY29uZmlnIHdpbGwgc3RpbGwgaGF2ZSBpdCBi
dWlsdC1pbiwNCj4gZXhjZXB0IHRoZSBBbmRyb2lkIEdLSSBzdXBwb3J0Lg0KPiA+ID4gRG9lcyBp
dCBtYWtlIHNlbnNlPw0KPiA+ID4NCj4gPiA+ID4gVGFrZSB0aGlzIG9wcG9ydHVuaXR5IHRvIGNv
bnZlcnQgdGhlIGRyaXZlciB0byB1c2UNCj4gPiA+ID4gbW9kdWxlX3BsYXRmb3JtX2RyaXZlcigp
IGFzIHdlbGwuDQo+ID4gPg0KPiA+ID4gSWYgeW91IHRoaW5rIGl0IGhhcyB0byBiZSBvciBpdCBp
cyBiZXR0ZXIgdG8gdXNlDQo+ID4gPiBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKCksIEkgd2lsbCBk
byBpdCBpbiBWMi4NCj4gPg0KPiA+IEkgdHJpZWQgdG8gcmVwbGFjZSB0aGUgc3Vic3lzX2luaXRj
YWxsKCkgd2l0aA0KPiA+IG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoKSwgYnV0IG1ldCBpc3N1ZSBh
Ym91dCAiDQo+ID4gcmVnaXN0ZXJfc3lzY29yZV9vcHMoJm14Y19ncGlvX3N5c2NvcmVfb3BzKTsi
IHdoaWNoIGlzIGNhbGxlZCBpbg0KPiA+IGdwaW9fbXhjX2luaXQoKSBmdW5jdGlvbiwgdGhpcyBm
dW5jdGlvbiBzaG91bGQgYmUgY2FsbGVkIE9OTFkgb25jZSwNCj4gPiBtb3ZpbmcgaXQgdG8gLnBy
b2JlIGZ1bmN0aW9uIGlzIE5PVCB3b3JraW5nLCBzbyB3ZSBtYXkgbmVlZCB0byBrZWVwIHRoZQ0K
PiBncGlvX214Y19pbml0KCksIHRoYXQgaXMgYW5vdGhlciByZWFzb24gdGhhdCB3ZSBtYXkgbmVl
ZCB0byBrZWVwDQo+IHN1YnN5c19pbml0Y2FsbCgpPw0KPiANCj4gVGhpcyBsb29rcyBhIGJpdCBk
YW5nZXJvdXMgdG8ga2VlcCBsaWtlIHRoaXMgd2hpbGUgYWxsb3dpbmcgdGhpcyBjb2RlIHRvIGJl
IHVzZWQNCj4gZnJvbSBhIG1vZHVsZS4NCj4gDQo+IFdoYXQgaGFwcGVucyBpZiB5b3UgaW5zbW9k
IGFuZCBybW1vZCB0aGlzIGEgZmV3IHRpbWVzLCByZWFsbHk/DQo+IEhvdyBpcyB0aGlzIHRlc3Rl
ZD8NCj4gDQo+IFRoaXMgaXMgbm90IHJlYWxseSBtb2R1bGFyaXplZCBpZiB0aGF0IGlzbid0IHdv
cmtpbmcsIGp1c3QgdGhhdCBtb2Rwcm9iaW5nIG9uY2UNCj4gd29ya3MgaXNuJ3QgcmVhbCBtb2R1
bGFyaXphdGlvbiBJTU8sIGl0IHNlZW1zIG1vcmUgbGlrZSBhIHF1aWNrIGFuZCBkaXJ0eSB3YXkN
Cj4gdG8gZ2V0IEFuZHJvaWRzIEdLSSBzb21ld2hhdCB3b3JraW5nIHdpdGggdGhlIG1vZHVsZSB3
aGlsZSBub3QgcHJvcGVybHkNCj4gbWFraW5nIHRoZSBtb2R1bGUgYSBtb2R1bGUuDQo+IA0KPiBZ
b3UgbmVlZCBpbnB1dCBmcm9tIHRoZSBkcml2ZXIgbWFpbnRhaW5lcnMgb24gaG93IHRvIGhhbmRs
ZSB0aGlzLg0KDQpBcyBmYXIgYXMgSSBrbm93LCBzb21lIGdlbmVyYWwvY3JpdGljYWwgbW9kdWxl
cyBhcmUgTk9UIHN1cHBvcnRpbmcgcm1tb2QsIGxpa2UNCmNsaywgcGluY3RybCwgZ3BpbyBldGMu
LCBhbmQgSSBhbSBOT1Qgc3VyZSB3aGV0aGVyIEFuZHJvaWQgR0tJIG5lZWQgdG8gc3VwcG9ydA0K
cm1tb2QgZm9yIHRoZXNlIHN5c3RlbS13aWRlLXVzZWQgbW9kdWxlLCBJIHdpbGwgYXNrIHRoZW0g
Zm9yIG1vcmUgZGV0YWlsIGFib3V0DQp0aGlzLg0KDQpUaGUgcmVxdWlyZW1lbnQgSSByZWNlaXZl
ZCBpcyB0byBzdXBwb3J0IGxvYWRhYmxlIG1vZHVsZSwgYnV0IHNvIGZhciBubyBoYXJkIHJlcXVp
cmVtZW50DQp0byBzdXBwb3J0IG1vZHVsZSByZW1vdmUgZm9yIGdwaW8gZHJpdmVyLCBzbywgaXMg
aXQgT0sgdG8gYWRkIGl0IHN0ZXAgYnkgc3RlcCwgYW5kIHRoaXMgcGF0Y2gNCnNlcmllcyBPTkxZ
IHRvIHN1cHBvcnQgbW9kdWxlIGJ1aWxkIGFuZCBvbmUgdGltZSBtb2Rwcm9iZT8gIA0KDQpUaGFu
a3MsDQpBbnNvbg0K
