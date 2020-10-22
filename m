Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 806E5295EAB
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Oct 2020 14:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504949AbgJVMjV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Oct 2020 08:39:21 -0400
Received: from mail-eopbgr1410132.outbound.protection.outlook.com ([40.107.141.132]:33600
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2898411AbgJVMjU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 22 Oct 2020 08:39:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pzst0KM2sMibcAZR8vi9d6wGqMum+40VX1gzH6oyyj0ekRoL0qemhqAq/qp4JJZot+MUvvFJ/XwXncsIokmrtK0qLl1zldf84D3YFWOTV0eQ6gZ2yvIcPUCILOWJoncTON0J4py9m3PSRKXZyHUqs8fjP/61Fw10XfHN9O+akxFbSEnWSIplmPPDcN8oh+fuB06a//B1RlGyYdLQueSJSOYCGVRUcDSuX+K8hQ6ejj8zUMTnwGMMjiIpH6FgyjRKDT3FOFb6FPuUkXHen/YNG+YychV7fzF3Fytv2j9FMs2jlLBjCOGr9r99Ot5nx6XKv5W+ScPCWkzslGj8IVRaoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGgiKmUrBOym1MTgJP3oYcqmcow59IbRec0AFJ5TmPs=;
 b=HG9Gv+d9eCHS106C+HprFOTSxRBlkNW9EwjaEdy/Y2kOmPlRxurBYEbxOJlKtTtd3Wn/c5TJllN9jMhyYxMZIiss0CPqC1ikYsKYNCDKkBjvas81/S2CDjauUTMJGEy5N5OuDd8GlBc8uHkXxTygPkIsn8A51x44J2IfjVYL9F9LSyvzSjKRR5corpGUJeAfY0YqTsDRxksLKOHTipLQxX5xDl42Z9qFK3fnGaAwZQhjysoeh/itOs4bgsiGDY6Qr4j4CKrypQbCARCkH43GVQ7nij287u2njv6JooyJBGDWeFSASv7TI6At3S/MnMiGVZW2jllRONCwttz1Urf0aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGgiKmUrBOym1MTgJP3oYcqmcow59IbRec0AFJ5TmPs=;
 b=RS1CQ9anq3PUFyFffuECnDlE1s8w1CphW4/6UzOlXLyl5jxEi4EL+GI1PmmUygCasBvRUKGE9mQH7p3mzDI79S0jIMdQ8X3mAReounUR+ySCCQrHBwsxBCMF3i0NNS7b5wVLqp+g4QZA7xQ7bg1oCbARGQnChV9NglMYB+UPOH0=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TY1PR01MB1513.jpnprd01.prod.outlook.com
 (2603:1096:403:2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Thu, 22 Oct
 2020 12:39:18 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84%4]) with mapi id 15.20.3499.018; Thu, 22 Oct 2020
 12:39:17 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 4/6] pinctrl: renesas: r8a77990: Optimize pinctrl image
 size for R8A774C0
Thread-Topic: [PATCH 4/6] pinctrl: renesas: r8a77990: Optimize pinctrl image
 size for R8A774C0
Thread-Index: AQHWphVoEZlZ2KgEvkuW1F+Ht/oZV6mjiswAgAAAOoCAAAk88A==
Date:   Thu, 22 Oct 2020 12:39:17 +0000
Message-ID: <TYBPR01MB5309A2C01B901E28D05E1E58861D0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20201019124258.4574-1-biju.das.jz@bp.renesas.com>
 <20201019124258.4574-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdXJ3TxDdge8juLMS7ZmWm9f8Z-dxt-CSAD-GjEvFjNE-w@mail.gmail.com>
 <CAMuHMdW4O4+NTC3KkPhb2uFwPOFhdzgpWRXF8zAAMXZFU_ndjA@mail.gmail.com>
In-Reply-To: <CAMuHMdW4O4+NTC3KkPhb2uFwPOFhdzgpWRXF8zAAMXZFU_ndjA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3e44104d-2d8d-472d-b975-08d876877e05
x-ms-traffictypediagnostic: TY1PR01MB1513:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB151390473371CA4C6743C290861D0@TY1PR01MB1513.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0e46pGyyG+xs1ez9MJWW9bZCvmfUap5I0wGHH5QgBaJFloI/qgj/x6k9vtozsTOBG11t1ezAekTObbyWkV63D8p09lyvDFmaL01Zszkyqv2vMt+XhuT71CPD/psoHhvaK8QPcM1MgSDbXXnF6ssEw871rhem6hy0l801kqSjHMiLsEzmZmVPHLeg6gzVJiPUDFVyUWfZSKnV6fH1FpZGBoNIa2AHKGfpfnpA1H+I5RHJqICfzvZDDHYC3DjeSsshb0Xi2lCYB6G10sYIvmyORYhZ2wBEY9x6QuZ9ncVKumBAjGBRVNfsPEl94x9U+nxGfVkTQ2qg7yXXTCPKsqd0qg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(52536014)(86362001)(9686003)(26005)(54906003)(4744005)(478600001)(76116006)(5660300002)(6916009)(7696005)(53546011)(6506007)(316002)(66946007)(71200400001)(33656002)(66476007)(8936002)(186003)(83380400001)(66556008)(64756008)(66446008)(8676002)(2906002)(4326008)(107886003)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: jDmOrl3nWdWge8KnfYHFxCo0H7SuLb6OwEhlHkwqbagMSpt/V5tT/dgwMhzJQnlOkVkgXWM9ooSLm3iWjIy99gVH5AoRvp/6wIIH33U5DCq22Oc8Kt6LaGbbyfF6Dgrd4gxKRdY25DWRctCTyymLyCRwojmqlS3C3Xe5pl9fA6QsBgfwhXuFHi8aA9wwAzj2CU9IpjSMlZz6PEdeM790zKkFnwpA6coRYItCB7iDf04l5COvPR1iUujSH5/QehFU5En+ZCrRDC2RCeoX/kuCWotZk+CCub2rGw7h88c8Q4TxFahcpBOegK51dGk+3V9aUKEd6rtbM3oitzUNMCsez4FsIjjJ1M1CTuMDOPkHdT0nUTSp4VzwSoweIdEjm94QTsnpWjcf6M+BLb2NoBz/YanCIos7qqwoBupqm6lCTlQlALcEI6faSxuiw/7ZWbtBfjIL+UNUHL+vdwFdujXIr4Xuv6oBViqSuxyeM8dlD0dkvWmGX3au206Btcb2Lj0yF+wLG7nppRvu3eUGfUIZgv+w1Tqu6v3wn9VvlW9Zhq2Xoa2vki6do+9WrjgoG7rH/M2aE00ywytL1lnFLlOQdcAWW1BPIfqDdbbnUOH/JDUbutXJ2WezU7Lt9LK8qUIRJCN8qZvtvzsGmqF64Zr/Kg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e44104d-2d8d-472d-b975-08d876877e05
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2020 12:39:17.9125
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iQS80ERswGPuHehapPRCa6zhzAB7TR1u/1vylJ9Ro7owv1JQRxXP7wqAfdnMMxlYgkEkm1tCJenbGCv8ByzdJ1Jq0G8zKR02GAUmzipQpGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1513
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCA0LzZdIHBpbmN0cmw6IHJlbmVzYXM6
IHI4YTc3OTkwOiBPcHRpbWl6ZSBwaW5jdHJsIGltYWdlDQo+IHNpemUgZm9yIFI4QTc3NEMwDQo+
IA0KPiBPbiBUaHUsIE9jdCAyMiwgMjAyMCBhdCAyOjA0IFBNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnRAbGludXgtDQo+IG02OGsub3JnPiB3cm90ZToNCj4gPiBPbiBNb24sIE9jdCAxOSwgMjAy
MCBhdCAyOjQzIFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3Jv
dGU6DQo+ID4gPiBUaGlzIGRyaXZlciBzdXBwb3J0cyBib3RoIFJaL0cyRSBhbmQgUi1DYXIgRTMo
UjhBNzc0QzApIFNvQydzLg0KPiA+ID4gT3B0aW1pemUgcGluY3RybCBpbWFnZSBzaXplIGZvciBS
Wi9HMkUsIHdoZW4gUi1DYXIgRTMoUjhBNzc0QzApIFNvQw0KPiA+ID4gaXMNCj4gDQo+IE9vb3Bz
LCBSOEE3Nzk5MCwgdHdpY2UuIFdpbGwgZml4IHdoaWxlIGFwcGx5aW5nLg0KDQpUaGFua3MsICBJ
IGRpZG4ndCBzcG90IHRoaXMuDQoNClJlZ2FyZHMsDQpCaWp1DQoNCj4gPiA+IGRpc2FibGVkIGlu
IHRoZSBkZWZjb25maWcuDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0g
VGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhr
Lm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9w
bGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpv
dXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQu
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
