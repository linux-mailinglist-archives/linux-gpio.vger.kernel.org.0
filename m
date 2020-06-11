Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA7A1F639E
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2020 10:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbgFKIbk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jun 2020 04:31:40 -0400
Received: from mail-eopbgr140077.outbound.protection.outlook.com ([40.107.14.77]:13537
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726729AbgFKIbk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Jun 2020 04:31:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8gGdeDe+mysEPNYwOoKfKCbledEEk7eufptKusq8L/oV6Y+AdlovJko926yByrQeyCXO9DpA+dTxFx+kDOsT2S19XLIvsCVKFJr8u0nbwhdwJQVSEt3tC3HZzsNFlsmWyxts6wnuOjWRyY7HCy5L6HTsABm7Bdx6HcSWUsWr9uXvmfiY/1IhAfhOknYjcLeyp9M0iwI2d3H7Hh3P3ofq+9Wvgbqyk+R1kdFFGsajoiqB+BnWOdmfBuNkgLQUE1Poj9EvgLYjvJOz+joQDn7lb1TOmtbfhnJdNe8XeVfbTQUiQ+Px5RgF8jSqxsz2JmlrvR6g5gEx4r5NUNDwbuQDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MalPGz/D0wKGW3isLFT1cvddlY2qg3PoLkYYWvWzQRk=;
 b=QoG1ZkJuhGZsXzBkJPybrFU4gW5thkI1rGQgjOH9mXLTbCojShriVjaLuR6D4mgwREKZMdlZCcs5sf2jjBoc8KOoxxeXeGzavEedQF01k9hv24AGJNMHk8PRGHPSjm10tGvd0TQWCkKt0OfJk12aRh2Kdslajz52iV+vH59+7zNjahOop1tc9+N0bitxmQ3l8RPrI6d1GmkBxJNJqIXazw86Vkq47pslm2KzBwOoeVN7pWWtWa3lzwgXR6uQSpZPiUVSwpnZftJQyu+UHX2mD0rFfUGVS59bxZCGC3K6ysSpQrq3323/tpnL2aD95C1SRvChWnad06gyrfBZHFV35g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MalPGz/D0wKGW3isLFT1cvddlY2qg3PoLkYYWvWzQRk=;
 b=r8pRnAtHdcyfPo9f8tZgZm838p9BdvPqj6l8uTT3zRDfx9tQogFiikZp69vHqEHihSQL4qYTGlMjO9kmqWapFbWp5kkD2ln64jZbeIyWGpEI8NO7h7ZqneEzQg6D/69FFiJymNzNV4vcWbBEKUgz5e938+Le3xoqF3V4wFueF6U=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB3PR0402MB3675.eurprd04.prod.outlook.com (2603:10a6:8:b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.20; Thu, 11 Jun
 2020 08:31:35 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3%6]) with mapi id 15.20.3088.018; Thu, 11 Jun 2020
 08:31:34 +0000
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
Subject: RE: [PATCH V3 0/9] Support i.MX8 SoCs pinctrl drivers built as module
Thread-Topic: [PATCH V3 0/9] Support i.MX8 SoCs pinctrl drivers built as
 module
Thread-Index: AQHWPmrEZsqXlE5PG069+wE7LuhWwqjRftOAgAABKNCAAZeosA==
Date:   Thu, 11 Jun 2020 08:31:34 +0000
Message-ID: <DB3PR0402MB39164A67925E322A7B9B1F31F5800@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1591712485-20609-1-git-send-email-Anson.Huang@nxp.com>
 <DB7PR04MB49721DEE875099E086E2486E80830@DB7PR04MB4972.eurprd04.prod.outlook.com>
 <DB3PR0402MB39167A62D9D981C2F82B7ABDF5830@DB3PR0402MB3916.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR0402MB39167A62D9D981C2F82B7ABDF5830@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [183.192.13.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 670ce306-ca4a-47d9-3c9b-08d80de1d9ed
x-ms-traffictypediagnostic: DB3PR0402MB3675:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB36756A4BBE5795262F540B7AF5800@DB3PR0402MB3675.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0431F981D8
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pjXrF8qLg5azZhPgICqRof3W571cjMeOKLDzJkBcGZxl89pwyaMJ3lJguUJyDRMwrwD0j2T5sYUwq6vibecxJnBMYRjtdCmcPC0CvedpPVWsgKj3sGGdusmTHyyhraKQYOYS0N3FGxbLebns+VC1I6h5k20E1+MZu1zJtFhLIhyowBveXAG/LGQI60ObspYs5N2ap4OJHDz8viPkDHILgeM7quCuZpzTXcrqMiXX/RX5aF0zK8xsDZ3POpusmWIZAjEX2slIuj0hRHsevIt5KjoSDJrP18JTub0E9fCriQ1NQHOgai2u/5gB2bmTauHK213gPjA4cKx70jFUv3bRuAGF/Msd4dKVzylEaJat72FrpW67xyU4POGv2L1B5e9u
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(6029001)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(83380400001)(5660300002)(52536014)(9686003)(8676002)(55016002)(8936002)(66556008)(66476007)(44832011)(186003)(64756008)(2906002)(110136005)(66446008)(316002)(76116006)(26005)(66946007)(86362001)(478600001)(33656002)(4326008)(7696005)(6506007)(71200400001)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: x4Y1DL7ye1qMAe3wOQLzY3k1lbR0IxNXpXOWkkP22IPd0W/F3TJehocRZhNolryK7Sy8W+ozxOOBzqbGSK0iE59EkKUFGr3S5X5JJrWLuiFMY1u9Zsx1WquAIpdp46B2b+C8lWEiZ9QJDPVpuLG+PUXfTe3bTuXH2/DHdGKh3bB5fDqJsF/7kPGIplXwpkhH3Z8bfPwYlkPWwR2XR5thI1N8t7Dat/o5SbvjTmQGZ4x4WMWJAbgrdzRWqLGC8c2Wv0dZ7Rbh+v70kzWSfIkPhxv800jW/1Lh+hBZBo8iwY9Hr0I94NEhzJ4lctUGQAEQczZ9yEMHSaSwbb3X77CFWmWqiQd96ImliDTGz9pjcu23NU4EcfBaRZnngBQNORkHatSN3JrxOVs43WVFthGyV7xccXTHhmNKBWAqs47wNHQmo6JOASTiJAUL+D+xTR+RCNhtRwznECoJGH7Sih9QNNIoZwVLhPJt7zmLyjKIle9Ni3/vXDUXfJc6JRRY0Ley
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 670ce306-ca4a-47d9-3c9b-08d80de1d9ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2020 08:31:34.6512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cR/MQUat7Yuz2h/sY7yQMyn7mtPiC6JrnzfcjyKtCnenVlQkEL8NtdR7x9JsTh/wRb+wBUvhnArZSmMlCQw9sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3675
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggVjMgMC85XSBTdXBwb3J0IGkuTVg4IFNvQ3MgcGluY3Ry
bCBkcml2ZXJzIGJ1aWx0IGFzIG1vZHVsZQ0KPiANCj4gDQo+IA0KPiANCj4gPiBTdWJqZWN0OiBS
RTogW1BBVENIIFYzIDAvOV0gU3VwcG9ydCBpLk1YOCBTb0NzIHBpbmN0cmwgZHJpdmVycyBidWls
dA0KPiA+IGFzIG1vZHVsZQ0KPiA+DQo+ID4gPiBGcm9tOiBBbnNvbiBIdWFuZyA8QW5zb24uSHVh
bmdAbnhwLmNvbT4NCj4gPiA+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgOSwgMjAyMCAxMDoyMSBQTQ0K
PiA+ID4NCj4gPiA+IFRoZXJlIGFyZSBtb3JlIGFuZCBtcm9lIHJlcXVpcmVtZW50cyB0aGF0IFNv
QyBzcGVjaWZpYyBtb2R1bGVzDQo+ID4gPiBzaG91bGQgYmUgYnVpbHQgYXMgbW9kdWxlIGluIG9y
ZGVyIHRvIHN1cHBvcnQgZ2VuZXJpYyBrZXJuZWwgaW1hZ2UsDQo+ID4gPiBzdWNoIGFzIEFuZHJv
aWQgR0tJIGNvbmNlcHQuDQo+ID4gPg0KPiA+ID4gVGhpcyBwYXRjaCBzZXJpZXMgc3VwcG9ydHMg
aS5NWDggU29DcyBwaW5jdHJsIGRyaXZlcnMgdG8gYmUgYnVpbHQgYXMNCj4gPiA+IG1vZHVsZSwg
aW5jbHVkaW5nIGkuTVg4TVEvTU0vTU4vTVAvUVhQL1FNL0RYTCBTb0NzLCBhbmQgaXQgYWxzbw0K
PiA+ID4gc3VwcG9ydHMgYnVpbGRpbmcgaS5NWCBjb21tb24gcGluY3RybCBkcml2ZXIgYW5kIGku
TVggU0NVIGNvbW1vbg0KPiA+ID4gcGluY3RybCBkcml2ZXIgYXMgbW9kdWxlLg0KPiA+ID4NCj4g
Pg0KPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGFsc28gY2hhbmdlZCB0aGUgZHJpdmVyIGluaXRjYWxs
IGxldmVsIGZyb20NCj4gPiBhcmNoX2luaXRjYWxsIHRvIG1vZHVsZV9pbml0Lg0KPiA+IE1heWJl
IHlvdSBjb3VsZCBwcm92aWRlIHNvbWUgdGVzdCBpbmZvcm1hdGlvbiB0byBoZWxwIHRoZSByZXZp
ZXdlciB0bw0KPiA+IGJldHRlciB1bmRlcnN0YW5kIHRoZSBjaGFuZ2UgaW1wYWN0Lg0KPiANCj4g
VGhlcmUgYXJlIHN0aWxsIHNvbWUgbW9yZSBjaGFuZ2VzIGluIFY0IEkganVzdCBzZW50IG91dCwg
d2hpY2ggaXMgdG8gY292ZXINCj4gdmFyaW91cyBjb25maWcgY29tYmluYXRpb24sIHdpbGwgYWRk
IHRlc3QgaW5mbyBpbiBuZXh0IHZlcnNpb24uDQoNCkkgd2lsbCBrZWVwIHRoZSBhcmNoX2luaXRj
YWxsKCkgdGhlcmUgaW4gbmV4dCB2ZXJzaW9uIHBhdGNoIHNlcmllcywgaXQgY2FuIG1ha2Ugc3Vy
ZSB0aGUNCmNoYW5nZSBkb2VzIE5PVCBpbXBhY3QgYnVpbHQtaW4gY29uZmlnLiBGb3IgbW9kdWxl
IGJ1aWxkLCB0aGUgYXJjaF9pbml0Y2FsbCgpIHdpbGwNCmJlIHNhbWUgYXMgbW9kdWxlX2luaXQo
KSwgdXNlciBuZWVkcyB0byBpbnNtb2QgdGhlIC5rbyB3aXRoIGNvcnJlY3Qgc2VxdWVuY2UuDQoN
CkFuc29uDQo=
