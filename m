Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85A8A397E5D
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 04:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbhFBCCu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 22:02:50 -0400
Received: from mail-vi1eur05on2078.outbound.protection.outlook.com ([40.107.21.78]:34710
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229586AbhFBCCu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 1 Jun 2021 22:02:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSBhrC1Rdd/jumIk9Sh9SWc5CqcBVBZIe4nATg5/3wbdlQxhD0CR0J0sYJxV++C8l0ef5CEEMOVL3zTnmI6wdCktwGoSCHPRwBNeJP2XYBxmzShZBpWeZO/lbBTSwjA2GA7RoK15RFsFVHAvLsc630o0WuSSGuk6Nw4N9Daub43nI85wj/G9CexE8tPd/3HoAjthmqAWIH8iikoXnCxWPHktUF1BzxwxyP/c+J/OgZebAyNMz+t9Njt784rxysPRVKS7U7HEYt4ABOXtm06FqzcKT6z2VUBCae1ia1+pbRJsUWhz0zsMMLgjSSUFfHc1kMtJMnEvGO+DXpetEx30CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPe4ltKOrcEL5T3pFY/AI5m6SELsGmYf/XROnyaqvms=;
 b=h7/XykwLMkAWihHamHoF047B0Qm0o2DA4KiFIKtvvT6Z8gcrLs/WMCim84YlNr8IO2lbdpJ+OS9rdjrCZrWcuyQ7NLxv34OXZqybA120mXbxXYQbWhAMn03NcwU7fFObkNqFitLTz6E90OCkafrHruPiub99g6bICiaxXxpvMOskqUosYtLsc/JIErJWBboieDym3+BBOXQ75Y9PH26hKhSpA3gjmju01v0PQFdUF0oPeMMtIZkpTmY6oSFn6+4vYXLpBbfiE3jjNnH48Cleiv+gUdpAJCElj2M6/dEA3DpJEfdBK6tdD+6aziOpxFEaP5p3kqRBbO1DVUQXbicEAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPe4ltKOrcEL5T3pFY/AI5m6SELsGmYf/XROnyaqvms=;
 b=szvrXXH+RKzb6yhRCWr44rxvJEWcNj7jirqX+HyuHSPkZxMYnSyPELQNfO9Cyb86rU0N2ynlggFL4Dw5m1TJSuBqiEM2FI13cy7narQxtw2Efep24Co4JPd0Wg8Sj1JcVNpdcedVlJ7eGjvSu2n7e4vr6LWsohvmcm7sOmf7YQQ=
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 by DBAPR04MB7350.eurprd04.prod.outlook.com (2603:10a6:10:1a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Wed, 2 Jun
 2021 02:01:06 +0000
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::3921:acd6:3201:b209]) by DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::3921:acd6:3201:b209%4]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 02:01:05 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Rob Herring <robh+dt@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH 2/2] pinctrl: imx8ulp: Add pinctrl driver support
Thread-Topic: [PATCH 2/2] pinctrl: imx8ulp: Add pinctrl driver support
Thread-Index: AQHXVq1D/V430S/+J0WG+1qN8ERxIar/MaEAgADGEcA=
Date:   Wed, 2 Jun 2021 02:01:05 +0000
Message-ID: <DBBPR04MB79308225EC3E438129A5BFA4873D9@DBBPR04MB7930.eurprd04.prod.outlook.com>
References: <20210601062338.1969040-1-ping.bai@nxp.com>
 <20210601062338.1969040-2-ping.bai@nxp.com>
 <CAOMZO5BhJ734DQy5MOpq20O8Pezwe4FG4hVV6CRnLpH_14PfVQ@mail.gmail.com>
In-Reply-To: <CAOMZO5BhJ734DQy5MOpq20O8Pezwe4FG4hVV6CRnLpH_14PfVQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ebb4b98b-d3af-41ec-8b79-08d9256a4853
x-ms-traffictypediagnostic: DBAPR04MB7350:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBAPR04MB73506116591A90DDDB3642EA873D9@DBAPR04MB7350.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MLLnTNIPdf6yXFgYEXXREsfFvjFXGcMlm4g8TmHLEDJskr64aDNWVr3OCWPsPfCHD8cXR1iz7Wrjt6QKDGkvz8DgML2wsSb0s5C5LgeJFchcRfyNEfjQyvkb9vnm5oH5+4Eme9VBiLY6Ppfk77aXJ6UQSlhHuQDKhQpefH7wGs+H6Ch0JjkArz6yOfPFMJRrC039RUdedWD03Nt/KnEU8wUNAlCMnkivZozyLL5moRw44akF7+0FsiH9zjzOC+KV6aoaGdf7raDA6YWRi0aSuTKxsDnXUEi6IR2rifAAOtR1aFzW+6gFY5PJrB9mZALCngrqdvZv0L2Uj8+0/ozjqoGBuVzUe3LCoz4cp3lRVCVShCNvt4w2lhi3q30NNaBEoiTc8AIp0D4jRyoa2XtI/vPcWyGTqlNiSKTRgi/i0fnxAKawz2sF3ClTbsZkBWJbK6Ir8GkKagnz8mweS7QxYqOLpIGCr2iHpC5uCiGw3Trz7/imdhI+Vebn0nF+YAIFd0kKcALCsBsHujuqo0Lv0eM5Iab/Leg/uCAdfAb2fAl92xwQ176KIjqww0f1kOKf4LVLdjUMOBB1Izq29gGuq3PE4Q1bme9me3NOS7csYoolQtNo+JWC0cAWwOqlqqP2r7lariS97GJBWVo4CGiqrw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7930.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(376002)(39850400004)(366004)(2906002)(55016002)(66476007)(66556008)(64756008)(66446008)(66946007)(7696005)(122000001)(9686003)(38100700002)(186003)(8676002)(86362001)(5660300002)(8936002)(71200400001)(478600001)(6506007)(54906003)(52536014)(4744005)(53546011)(6916009)(316002)(4326008)(76116006)(33656002)(26005)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?a05iTko4OU8yMmlNcVViM2NxWlQ3VFNyTnpZNlMxenEra2IyaTdvWUZscEY3?=
 =?utf-8?B?UHAyZnIzaWV4TjFHalN0bGpkbGMxa0U3TjNVUEpYVWFRYVJEZWtxY094VlVQ?=
 =?utf-8?B?V3gweno4NWx0eWtCRDRvaTREUmpnVmZhcndDaUo2Z011RkszbFluZGRBOHRY?=
 =?utf-8?B?cjZqclQrdldiMkozdDhOZ0FqTlZyaXhpTkdGQUxNUTh0cHBDUWpLeFZPaUtH?=
 =?utf-8?B?enRkRjBQN2VaV3ZsenBKTENtdGdiVjVTZU5mY0kycmpzdEY4eUNhWUVIcUxr?=
 =?utf-8?B?WFUyWUJpWmprWGR3eUVQejU2djJaSGtRdzFESkYxbkxXYVFJQ0lXai9abkhS?=
 =?utf-8?B?dUNPQitvNCtLaTFGRUNMa1lIRFZGVkNxTEg3YVRVelU0QjRNdW1uN0ExUVI5?=
 =?utf-8?B?dE02NloxQVdUL0FVUElZQkd1QmM5QkMzb282eEh1OUk2YXpYY01UYlp0OWJm?=
 =?utf-8?B?bzNNamtMbXE1eWU2SVl2YXVnV1ZKWENGbGE1Y1pyaVVKT1EvUGpObFhEaklm?=
 =?utf-8?B?by85Z1ZQcUZWenhlU3MwMGFRS1p3eUJYdkFmYWdGYkY5UzdlTWh3T1pGaWF0?=
 =?utf-8?B?eG5Pd2c5RmIxd0ZDcHNGV1cwZGFxSzdmYXJpb3htYUlXa2dRcFhEN3NpelpP?=
 =?utf-8?B?R3QzZVh4TDlWYWtseXFnWnYxNjI0d0s3NGs3VEJXVTNmbnBDWTNlZUZxZm1p?=
 =?utf-8?B?RlIzTFd0LytTNGVtQ3FMTm91RjV0RXlNYUkwTmxnbFdyYXNwQU5qVDRucWRi?=
 =?utf-8?B?QjMreFhjbW1idEkvd0Z4Y1MvQ2FhcURwb29vMzhCU1ZiNnViNWdSRkphTjhI?=
 =?utf-8?B?RjJqZjFTTjIyQzVLQXVzOStpNnp0OWY0ZHdITW12MjR0M0xJRWhqSkFHQXAw?=
 =?utf-8?B?RENRcHVvekgzTHU5N21ETWgyd21tM2ZiWExtZ2RNdFlHelhJcDhGRHJxajAz?=
 =?utf-8?B?aWdoS2ZONnl2NXJvYk9WNmFtYXk0NFVYRHBXdTJFNE1hd21YVjQ3czdwNGFo?=
 =?utf-8?B?YS8wNHdadGhSVmRETjJGdG16ZEV2VHR6dkZDcWJMeWwwa1pZMENLV1JUNW9r?=
 =?utf-8?B?cnZaY25URUV3RjExUC9oT2dHYWRuTll1ZmRKb1VwY3hTRHdOYjJEaXliYWU4?=
 =?utf-8?B?TUw2MUV3Y0xtdnhHRkNlNUQ3YTlsdmZpS0gxNnlLbHc4YnREdCs0Ymk5RHd0?=
 =?utf-8?B?dGd3YVNSdlkrNnpOQjJmZTBxenlvbFpPeWt3dXV3Uk5yVWt1S25YNGxXMlox?=
 =?utf-8?B?ZHBJeGFKQjZmNlYrdU02bUZJbVNQTm1Yc1dNdUY5UGMwYkFRejRhMkFyM2l0?=
 =?utf-8?B?WCtVUTlpNUxKQ253NEwzZ3h2L1pxclI2ZFBGNGlDcEl5QXpZYzVqYnE4Nk5q?=
 =?utf-8?B?bThkeHpIQVFPZ042Qks4QVArOWV2Yy9PZENpSHVpZU43Qm9uVU15WjF2OEN5?=
 =?utf-8?B?QzVLUG5OeDRHTDhGeXR3dVRvSUpsSXE5L0JkQXI2SGpJcFlvVllDdk1vUFYr?=
 =?utf-8?B?dUtLZVFSbHdPNGJ1QnlHWi9nK2RQWFNRdjdjNmZvUkczeGp5NDFtKzAzYnEv?=
 =?utf-8?B?Y2tMSnJWeXhnYjFBZmVZOU5pZ3Qwd2RUbEtRNlJJRk9oT3Y1dGlNemtvZG45?=
 =?utf-8?B?a2VRV1lQRjNhSytrencwNjJDZUQvdHlaTHhFNDc4OXlEZFlZTUJxMjlPWDE2?=
 =?utf-8?B?N3JVcmhXZllsTXhUZTg2U01vbjJ6Wk03aGZHUGsyZ3ZDWDlaczArWEQ2MGY3?=
 =?utf-8?Q?oudkW/6PBDtY90gzQmCGrFWQ8QJlorxa1A7bOQH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7930.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb4b98b-d3af-41ec-8b79-08d9256a4853
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2021 02:01:05.8597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JjYQ/it0Ksuzg75ouJ48fW7X/3+1m193z6+LU5zhYeTcudIEBWabF3ixnvN0xq58wysFQPxSGwH4pD4p7FZmRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7350
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gcGluY3RybDogaW14OHVscDogQWRkIHBpbmN0cmwg
ZHJpdmVyIHN1cHBvcnQNCj4gDQo+IEhpIEphY2t5LA0KPiANCj4gT24gVHVlLCBKdW4gMSwgMjAy
MSBhdCAzOjEzIEFNIEphY2t5IEJhaSA8cGluZy5iYWlAbnhwLmNvbT4gd3JvdGU6DQo+IA0KPiA+
ICsgICAgICAgcGluX3JlZyA9ICZpcGN0bC0+cGluX3JlZ3Nbb2Zmc2V0XTsNCj4gPiArICAgICAg
IGlmIChwaW5fcmVnLT5tdXhfcmVnID09IC0xKQ0KPiANCj4gQ2FuIHRoaXMgY29uZGl0aW9uIGhh
cHBlbj8NCg0KU2VlbXMgbm90LCBJIHdpbGwgcmVtb3ZlIGluIFYyLg0KDQo+IA0KPiA+ICsgICAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkIGlteDh1bHBfcGluY3RybF9vZl9tYXRjaFtdID0gew0KPiA+ICsgICAgICAg
eyAuY29tcGF0aWJsZSA9ICJmc2wsaW14OHVscC1pb211eGMxIiwgfSwNCj4gDQo+IEluIHRoZSBi
aW5kaW5ncyBkb2MgcGF0Y2ggaXQgaXMgIGRvY3VtZW50ZWQgImZzbCxpbXg4dWxwLWlvbXV4YyIs
IHNvIHRoZXJlIGlzDQo+IGEgbWlzbWF0Y2ggYmV0d2VlbiB0aGUgZHJpdmVyIGFuZCB0aGUgYmlu
ZGluZyBkb2MuDQoNClNvcnJ5LCBpdCBpcyBhIHR5cG8gaW4gYmluZGluZyBkb2MsIHdpbGwgZml4
IGluIFYyLg0KDQpCUg0KSmFja3kgQmFpDQo=
