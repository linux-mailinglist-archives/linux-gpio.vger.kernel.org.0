Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9271FC441
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 04:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgFQC4Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 22:56:16 -0400
Received: from mail-eopbgr60045.outbound.protection.outlook.com ([40.107.6.45]:23426
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726275AbgFQC4Q (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Jun 2020 22:56:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C47sFHcrOyBKgXzM/ErtM4WrfZliWPDoIUiEtdklPPWiSp/pMsdQ0/Wp3fVe8cazesP82mpTaGIbbuPV7o2kSvwcDUgoDXn+xpbTg26VPxO2QJl3NmUEGhvPji/valtOANj0al9GohBVa2GkvnNgKAkx6W9s22pnCk77gyBIfub2VROXs9xhKVxT2BOJ3IDe+L/C3cmksXK6kCwmwNHaZ7q9d7fZceKb/IUxQir9Q5voZyptcRbD+LQawNThFGOttH/42ExqMqKUcPhwJ2HUTckEeZIGxc1htlK5LLnbc9qK4gFknYgWg5psquGrbTniaa4rKKUitzeOIE+IV+AvWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0AOPhgjuVV7otAhkiHg9eEmxEqBrsKRkUV2QOUvt/I=;
 b=IMS2I/J29jhsiReb6B/KM1UP4f8RQiPyyTGY0xANc2KCmW6yyjnGFQj4iVyjaivmRfhA5UiuyLGpt9cGQmgazouYErG5UpVzyqCVwuaQUQdWut3vTNZofv5A7+UHxmLhkvlBbv+YRjkLr35n3pW3oaBfrLPNe437M3z7RtxkUDcU7EjNYUon3cmoMLhE+9XNt3kgygBb8Fe0O2TYZX1c4NF7cZZ6q2ZGNCch7iz8rTN314PUFJO+zdbMl8BhGebiH0VzJi/slcS7empytoQpy1/yMm0NLVbJaRBHLpsnpCfd8NG323ArI+6ro4PDPiu8Z5G2mGERYyw4oXKDxGvFiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0AOPhgjuVV7otAhkiHg9eEmxEqBrsKRkUV2QOUvt/I=;
 b=oVkRlRIuCj04Yhz+7XVu+w9NuPIJkVhBX6wCSoJRFfGuXKNNAz1JL5l4J3MBbWilN2yel1YzG/b4NZNoEUbIsfw6sR3Jtv8CLPGftWW7gvjhQGFswH/c5J+xsxNl0Kl63Z7W9cBdM9BL6oDFBppKOXS3cHMGydZciszM1ukc7eg=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2744.eurprd04.prod.outlook.com (2603:10a6:4:94::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Wed, 17 Jun
 2020 02:56:11 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701%4]) with mapi id 15.20.3088.028; Wed, 17 Jun 2020
 02:56:11 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     BOUGH CHEN <haibo.chen@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
        "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH v2] Revert "pinctrl: freescale: imx: Use 'devm_of_iomap()'
 to avoid a resource leak in case of error in 'imx_pinctrl_probe()'"
Thread-Topic: [PATCH v2] Revert "pinctrl: freescale: imx: Use
 'devm_of_iomap()' to avoid a resource leak in case of error in
 'imx_pinctrl_probe()'"
Thread-Index: AQHWPg9qVVftOqq4kEyN1vjJd0XZBajaloIAgAEBqoCAAHRXAIAAHECAgAAAipA=
Date:   Wed, 17 Jun 2020 02:56:11 +0000
Message-ID: <DB6PR0402MB27608ECF4C293480BFA15F25889A0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <1591673223-1680-1-git-send-email-haibo.chen@nxp.com>
 <AM6PR04MB4966D0FCE44CC173F95C139A809D0@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <CAHp75VdvV-tBtZKU6WKHJy+yuesaq6c=PbxCFaJuvujeWhmm-Q@mail.gmail.com>
 <DB6PR0402MB2760B7D339C1DECFB7DACAC8889A0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <AM6PR04MB49666437F0A488FE67D66F7B809A0@AM6PR04MB4966.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB49666437F0A488FE67D66F7B809A0@AM6PR04MB4966.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b2e0b68d-0b18-4631-394e-08d81269fe03
x-ms-traffictypediagnostic: DB6PR0402MB2744:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0402MB27449EE45821035E321B1A41889A0@DB6PR0402MB2744.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:751;
x-forefront-prvs: 04371797A5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NAAG0QDCuqs1+VuIxb68hloMM/MlP0WEqGyHG/5aL+omRGtF2N+Ui2T+5dlt9l48I4MEnR+7hRdD+Cc3Wy0NIKPmkYwUv3mJwp8rlS5dmZf8/lr2qm4GEEXO5mq2cNgk+SQvmYSZpHVz50lU/sDSct0bzrwT6Gm3xZNPS9hxnG58kT0EkBVGAHd51mNUOom5rbUcLLHlgCoU50ANWARHuWtXx3rGTTwIsKbOoUOIKYrYpvZAGfzlL9RPGDHq3Zajim7jOV7PKLk1cWumukH5dzJvjeRz/nYA2cxW1pj6k5MjTUVf+pQfSYdy7ef1nre/w4aVIb43eeCgqFiOutUQ5w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(478600001)(5660300002)(2906002)(44832011)(7696005)(66946007)(54906003)(66556008)(4326008)(316002)(83380400001)(110136005)(52536014)(66476007)(66446008)(64756008)(76116006)(7416002)(86362001)(8676002)(26005)(8936002)(71200400001)(6506007)(55016002)(9686003)(53546011)(33656002)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: OCJcEbkpbwLs3uihQ6cgr4gpy1xLZNQ8VnJPu2JkLEhAKspkmrwR2S2v+o3s/QMTy0FwZ6iLZ8t1zGcc1opHHb3EkbbZTntIiQoB1W+wn9OYepKoVazmjSi8RH7pCV5smO4hDh4v/4QZxfmPnK0du/E+VFtiEZTzLKrncvRCOpWP0zpe+pPsdmg+Cu/Xy88rJCwoAiwV3c0iRmZJ2BUDXNUfSmJ0Thc593B5ljy3a1aRA9PAu3thj12J/sbFjBu2tJWDFTA8fBksy2exz9tnHAzh2KotOz3JHizhpEjjiGQIiyVdAGprHg5tyAypuL/XdUVaEEeZVeK0e/iTQqcgv5gtFLyeW/mEuWZK20hWUSLWHaX5GibagvxVRJTMRAaCDNJCaWbojwS9RQc7gaMrptZu7iWwb6jSLdSNHSnc08dDnWZQCMtVDDhvu6YtgBT8L8qLwIPIey7qSKpbD8MN3chUMFIxRRVXIP3M4VC3XtE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e0b68d-0b18-4631-394e-08d81269fe03
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2020 02:56:11.3496
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j5fjFQJZ9u1tDpVcMODfzioufodPJPdoT2ydDbBOkYd1y1Zvln1K9p1swqh32cic8tm7B4Qgc/eepSzzZr14Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2744
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBTdWJqZWN0OiBSRTogW1BBVENIIHYyXSBSZXZlcnQgInBpbmN0cmw6IGZyZWVzY2FsZTogaW14
OiBVc2UNCj4gJ2Rldm1fb2ZfaW9tYXAoKScgdG8gYXZvaWQgYSByZXNvdXJjZSBsZWFrIGluIGNh
c2Ugb2YgZXJyb3IgaW4NCj4gJ2lteF9waW5jdHJsX3Byb2JlKCknIg0KPiANCj4gPiBGcm9tOiBQ
ZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCj4gPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMTcs
IDIwMjAgOToxNSBBTQ0KPiA+DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBSZXZlcnQg
InBpbmN0cmw6IGZyZWVzY2FsZTogaW14OiBVc2UNCj4gJ2Rldm1fb2ZfaW9tYXAoKScNCj4gPiA+
IHRvIGF2b2lkIGEgcmVzb3VyY2UgbGVhayBpbiBjYXNlIG9mIGVycm9yIGluICdpbXhfcGluY3Ry
bF9wcm9iZSgpJyINCj4gPiA+DQo+ID4gPiBPbiBUdWUsIEp1biAxNiwgMjAyMCBhdCA1OjU0IEFN
IEFpc2hlbmcgRG9uZyA8YWlzaGVuZy5kb25nQG54cC5jb20+DQo+ID4gPiB3cm90ZToNCj4gPiA+
DQo+ID4gPiA+IENvdWxkIHlvdSBoZWxwIGFwcGx5IHRoaXMgcGF0Y2ggYXMgaXQgYmxvY2tlZCBN
WDdEIGJvb3RpbmcgZm9yIGEgd2hpbGU/DQo+ID4gPg0KPiA+ID4gPiA+IFRoaXMgcmV2ZXJ0cyBj
b21taXQgYmE0MDMyNDI2MTVjMmM5OWUyN2FmNzk4NGIxNjUwNzcxYTJjYzJjOS4NCj4gPiA+ID4g
Pg0KPiA+ID4gPiA+IEFmdGVyIGNvbW1pdCAyNmQ4Y2RlNTI2MGIgKCJwaW5jdHJsOiBmcmVlc2Nh
bGU6IGlteDogYWRkIHNoYXJlZA0KPiA+ID4gPiA+IGlucHV0IHNlbGVjdCByZWcgc3VwcG9ydCIp
LiBpLk1YN0QgaGFzIHR3byBpb211eCBjb250cm9sbGVycw0KPiA+ID4gPiA+IGlvbXV4YyBhbmQg
aW9tdXhjLWxwc3Igd2hpY2ggc2hhcmUgc2VsZWN0X2lucHV0IHJlZ2lzdGVyIGZvcg0KPiA+ID4g
PiA+IGRhaXN5IGNoYWluDQo+ID4gc2V0dGluZ3MuDQo+ID4gPiA+ID4gSWYgdXNlICdkZXZtX29m
X2lvbWFwKCknLCB3aGVuIHByb2JlIHRoZSBpb211eGMtbHBzciwgd2lsbCBjYWxsDQo+ID4gPiA+
ID4gZGV2bV9yZXF1ZXN0X21lbV9yZWdpb24oKSBmb3IgdGhlIHJlZ2lvbiA8MHgzMDMzMDAwMC0w
eDMwMzNmZmZmPg0KPiA+ID4gPiA+IGZvciB0aGUgZmlyc3QgdGltZS4gVGhlbiwgbmV4dCB0aW1l
IHdoZW4gcHJvYmUgdGhlIGlvbXV4YywgQVBJDQo+ID4gPiA+ID4gZGV2bV9wbGF0Zm9ybV9pb3Jl
bWFwX3Jlc291cmNlKCkgd2lsbCBhbHNvIHVzZSB0aGUgQVBJDQo+ID4gPiA+ID4gZGV2bV9yZXF1
ZXN0X21lbV9yZWdpb24oKSBmb3IgdGhlIHNoYXJlIHJlZ2lvbg0KPiA+ID4gPiA+IDwweDMwMzMw
MDAwLTB4MzAzM2ZmZmY+IGFnYWluLCB0aGVuIGNhdXNlIGlzc3VlLCBsb2cgbGlrZSBiZWxvdzoN
Cj4gPiA+ID4gPg0KPiA+ID4gPiA+IFsgICAgMC4xNzk1NjFdIGlteDdkLXBpbmN0cmwgMzAyYzAw
MDAuaW9tdXhjLWxwc3I6IGluaXRpYWxpemVkIElNWA0KPiA+ID4gcGluY3RybA0KPiA+ID4gPiA+
IGRyaXZlcg0KPiA+ID4gPiA+IFsgICAgMC4xOTE3NDJdIGlteDdkLXBpbmN0cmwgMzAzMzAwMDAu
cGluY3RybDogY2FuJ3QgcmVxdWVzdCByZWdpb24NCj4gZm9yDQo+ID4gPiA+ID4gcmVzb3VyY2Ug
W21lbSAweDMwMzMwMDAwLTB4MzAzM2ZmZmZdDQo+ID4gPiA+ID4gWyAgICAwLjE5MTg0Ml0gaW14
N2QtcGluY3RybDogcHJvYmUgb2YgMzAzMzAwMDAucGluY3RybCBmYWlsZWQgd2l0aA0KPiBlcnJv
cg0KPiA+ID4gLTE2DQo+ID4gPg0KPiA+ID4gSXQgbWVhbnMgdGhhdCBzaGFyZWQgc3VwcG9ydCB0
b29rIGEgd3JvbmcgYXBwcm9hY2guIElmIHNvbWV0aGluZyBoYXMNCj4gPiA+IHNoYXJlZCByZXNv
dXJjZXMsIGFub3RoZXIgc2NoZW1hIHNob3VsZCBiZSB1c2VkLCBzb21ldGhpbmcgbGlrZSBNRkQN
Cj4gPiA+IChwYXJlbnQgZGV2aWNlIHdoaWNoIGtlZXBzIG9ubHkgc2hhcmVkIHJlc291cmNlcyku
IEVhc2llc3Qgd2F5IGlzIHRvDQo+ID4gPiBzd2l0Y2ggdG8gdGhlIHJlZ21hcCBBUEkuDQo+ID4N
Cj4gPiBBY3R1YWxseSBub3QgTUZELCBpdCBpcyB0aGUgZHRzIHVzZSB3cm9uZyBhZGRyZXNzIHJl
Z2lvbi4NCj4gPg0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGlvbXV4Y19scHNyOiBpb211
eGMtbHBzckAzMDJjMDAwMCB7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0NCj4gImZzbCxpbXg3ZC1pb211eGMtbHBzciI7DQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgzMDJjMDAwMCAweDEwMDAwPjsNCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZzbCxpbnB1dC1zZWwgPSA8JmlvbXV4Yz47DQo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICBpb211eGM6IHBpbmN0cmxAMzAzMzAwMDAgew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJmc2wsaW14N2QtaW9tdXhjIjsNCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDMwMzMwMDAwIDB4MTAwMDA+Ow0KPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgIH07DQo+ID4NCj4gPiBUaGVyZSBpcyBvdmVybGFwIGJldHdl
ZW4gdGhlIHR3by4NCj4gPg0KPiA+IFRoZSBpb211eGNfbHBzciB1c2luZyAweDEwMDAwIGFzIHNp
emUgaXMgd3JvbmcuIEl0IG5vdCBoYXZlIHN1Y2ggbGFyZ2UgYXJlYS4NCj4gPg0KPiA+IFdpdGgg
dGhlIHNpemUgZml4LCBkZXZtX29mX2lvcmVtYXAgY291bGQgYmUgdXNlZCBJIHRoaW5rLg0KPiA+
DQo+IA0KPiBSZWFsbHkgb3ZlcmxhcHBlZD8NCg0KT29wcy4NCj4gDQo+IEkgdGhpbmsgdGhlIHJl
YWwgaXNzdWUgaXMgTFBTUiBTZWwgSW5wdXQgcGFydCB1c2luZyB0aGUgc2FtZSBtZW1vcnkgcmVn
aW9uIGFzDQo+IGlvbXV4Lg0KDQpJbmRlZWQuIFRoZW4gbWZkIG1pZ2h0IGJlIGJldHRlciB0byBi
ZSB1c2VkIGhlcmUuDQoNClJlZ2FyZHMsDQpQZW5nLg0KDQo+IA0KPiBSZWdhcmRzDQo+IEFpc2hl
bmcNCj4gDQo+ID4gUmVnYXJkcywNCj4gPiBQZW5nLg0KPiA+DQo+ID4gPg0KPiA+ID4gUC5TLiBU
aGUgcmV2ZXJ0IGlzIG9rYXkgYXMgYSBxdWljayBmaXggYnV0Li4uIHNlZSBhYm92ZS4NCj4gPiA+
DQo+ID4gPiAtLQ0KPiA+ID4gV2l0aCBCZXN0IFJlZ2FyZHMsDQo+ID4gPiBBbmR5IFNoZXZjaGVu
a28NCg==
