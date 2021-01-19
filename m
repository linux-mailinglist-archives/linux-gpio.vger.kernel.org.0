Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22E1F2FB989
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 15:36:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405510AbhASOcx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jan 2021 09:32:53 -0500
Received: from mail-eopbgr70088.outbound.protection.outlook.com ([40.107.7.88]:15332
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728716AbhASNC3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 19 Jan 2021 08:02:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgmgvos5xcSZ9sV+SaR0v4CsmmR4p8cvnz7vdPK8e3/8YeVMleXrqmT9f4Hx0NJRLaF/Mb1d+H1HsPnOk+ceCLG5KgXXxZ7GssPRFD36yHQ+pwZYZ9qkPAwJeUsk9Z9/XMTR4kuVLMbU6K3//FV9If8p9+fHhL6yFyz6Iwj7ujqLiC/kyZPxveMIk3nS8gJRn4rTDntEU5c35fQqLzN/2vIkQKQLzCMYkMaPt4uJwRwDDVLrvXWSKOchsBPyBLQwsDTaNDj1Nuvw55Csavdmor8xyCFiCO7aXHQcL9OPXjrluwSgK6WGgWDCSGAZZEH98akk2g3VGaUhBlkEZ5BsUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKqVj/fp4WM3UMFkqjbW8Lbih9Ry8GprkE13tckiM8U=;
 b=VxZXifRawpD5yrRVKMAFim4ZwKnUN3ysQHDJwRIKIBSiWZXQVdmAcDJnWhmLVXuXE6EauGWjLcmADZY121C/ktNuPqZW4UVY+o5H6n722fP+IT0Ev6ottOiRIWmofbYwKTQVDbJLHQD0p3X1mM31q/C/brBiO1cBSuiKSSsUJhu9lITccB//F7QV1FW4L1LcIEsgV0eAy527FOduQseNuKwnkc1Xv+TmpaWuKUQ6m2Yd7Sv+lEtxQ4rP1/SL04E2iQLxQtSICpNQSyimHeh5YQFyVv5pvys6UxjEXt4sYEfDti/nPebqhwBEmrKMkE0Qmp95EqzwkhN04JTxwH3m8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKqVj/fp4WM3UMFkqjbW8Lbih9Ry8GprkE13tckiM8U=;
 b=A7uGSl6E7UHV16hmkoIdN2Lip/gvx3wPOPHEaYXWlxxNpJIPtD5tsvH7ctM6htBk0TNkFWVu0D3NGmUpg41G35rgRfamR2aDkNVFYEbqCQsGHUkuyImjExKgSAPUS5gN9YlwwKOk5ogay7uG8zDTWImC1WlAOBOfWQK7iQETt58=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0302MB2668.eurprd03.prod.outlook.com (2603:10a6:3:f1::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.13; Tue, 19 Jan 2021 13:01:38 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::cd6c:2eae:c885:c9d]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::cd6c:2eae:c885:c9d%6]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 13:01:38 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 10/17] gpio: support ROHM BD71815 GPOs
Thread-Topic: [PATCH v2 10/17] gpio: support ROHM BD71815 GPOs
Thread-Index: AQHW7jP1aCOdIjy6aUiaKgV7fuUEzqouyhYAgAAf8oA=
Date:   Tue, 19 Jan 2021 13:01:37 +0000
Message-ID: <8bd5d95df1daaee0d7b3fee33e5c5cad679759a6.camel@fi.rohmeurope.com>
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
         <50f72f1f7f28e969a1e0353712fcc530bce9dd06.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
         <CAMpxmJVjnAMig16qWkjpaHwQ+4Ld9yEc-gg-CGv28QQYBB6gNg@mail.gmail.com>
In-Reply-To: <CAMpxmJVjnAMig16qWkjpaHwQ+4Ld9yEc-gg-CGv28QQYBB6gNg@mail.gmail.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 546ec45e-95e8-44f3-0a86-08d8bc7a5bb4
x-ms-traffictypediagnostic: HE1PR0302MB2668:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0302MB2668BC326B779F97B9729536ADA30@HE1PR0302MB2668.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nP9aklN01nCJ7c8JXVAFSY9n6JiJWslsVISTvxLCi8QFyHJ0jpWaqVttd7Mrcd1V157zcO29L7xHlXDZqcd46xKa0CXJdmAG2b6/TiqCtV4Im46gWucYcnVqRjsH2e23AULQhIGHHeyiBLJkf73u/vQL1RfGogMKnvKfRyWbqGynJ2/iHEVCfWaibkIDMu9Ds1hycT9fJWiVK9JbBDhf6iMOLU4IKbFMcrPE5a9kUQ1D5dgJxWXasLfbiwR3nprOP9B28pxGuO93uKU/Rwvttlk96QDuybteDoa+uk19o900L9A6wIJGRq8VDZerPUEx0Kw9T2MUCGLEtQ4rv05YRjQq94NTd1kPFeNQMl8WIlj+fTjpXFvNy9jNP9ljdHYCBo6G2znDRDfg8xpZpS3kuQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39850400004)(83380400001)(86362001)(26005)(186003)(6486002)(316002)(4326008)(53546011)(2616005)(6506007)(71200400001)(7416002)(66556008)(3450700001)(64756008)(66476007)(8936002)(66446008)(6512007)(54906003)(66946007)(76116006)(6916009)(478600001)(2906002)(5660300002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?eDFjWWJaSVI5NEdlUU1CbWtqRjBacEN5eVZDRjVYWEpsdUprTW1YVDM3SUls?=
 =?utf-8?B?U3RwbDNueVV2TGd5bHQzZGxKQXpiaUVYS2tZVU45R0lNbUZWMHRUdHdyZEZa?=
 =?utf-8?B?SUw0bG45THlwWVpBNUFUdzMzSTRvNmZDZWlDbTJaMndIY2JkSWgycUgzVU1H?=
 =?utf-8?B?ei9HQThLSlhNak42YjRpdWJ5NkhaNFhmZEthMG5pQ3dOVERySzljcEtROGFQ?=
 =?utf-8?B?UUl1YnQ5R3oydXZIRTFlYzZERE9keGQ3RGkzaldJUGxFRXV0aDNZdmtZckZP?=
 =?utf-8?B?M0xuUXdKSGFvb09hM0ZDTUwvbE5oeHgyVnRzcU15blc3bkJrVExuMWRMVzkv?=
 =?utf-8?B?a2tFVzBvNEUrQThiNU5kUjY4S1VHek1keW1jZUVmaGprOU9HYWFDSmNwdktk?=
 =?utf-8?B?cXV0eFV2TEZvV2hudDE4NzAvdUQrenA4V2p6ZmMycVBzbEhvcEVQSUxDQ0JC?=
 =?utf-8?B?RWhWL1psOVdQbkpSVVp3S1l2YjlYeXZyVnBBQ0R3dE8xeFllWUVJaDZhM2VT?=
 =?utf-8?B?UXB3emtDazFJQWpXUno3SHVGVW1iWWJLM3BGc3lYRVdHSWo5RHRmdTJUL2JW?=
 =?utf-8?B?SXpMZnpkaFVrZUNheUxabVBicERoZGpBbitrVVdBRHIvcmdqRVlzZUpxdGVl?=
 =?utf-8?B?V00rRGxXS29GR1NNbWJvblFLS1JqQUNzZzQ3UFBncjlDdDJTWXFON2hkL1lv?=
 =?utf-8?B?MVR4dXRKRWdvQzh5cFp5WmxnWnh1Z2RxdzVTRis4S3NLRU0zKy95L1VyaE9Q?=
 =?utf-8?B?dHNDZDNCTjI1dG1xUElMZER3cVlIU3FOMjkwMHJRaDhVaUdMMzBRSlp4RDZh?=
 =?utf-8?B?QkZWWG9VQkdrMzdMaEczcXY3NlBIN21hZ29ZUitkWUpvTDFKTlUrMUl0bHlm?=
 =?utf-8?B?THFiM1NXQ1FvcFowNTJkbjNVVzNuOG5mOUd1VklzTUxvU0ZqVldnd0ZCcDFW?=
 =?utf-8?B?d2UrazExZTZBcEE3akV1dXhrOUpESHhUOFdNRzFrRFI3cmJlNDR0MFRIaVF6?=
 =?utf-8?B?NUZEd29CTlFFNHUxSVRHRktpdExibEc4V1FnaTBmL3lVRFM1RGxoNWFabGlx?=
 =?utf-8?B?YWlReW9wM2I1SmUzN2hWOGE2ck9iVm5EUjUxc1hXTUwwSngzSlE1T3BoOUJ0?=
 =?utf-8?B?d3lNUXJOYW82Ymd4Z3BSYUdKOHpTM1JEeERCODdXS3hQcWVSbGpVcEZSQ3pp?=
 =?utf-8?B?SkpuR25xT0VyeWppWDI3cFduRW90YVZoV1E2emhFUnAyZmZGcnJIUE9WUlhT?=
 =?utf-8?B?S3JzQkJMdVNHTzUzN09zSXQ0UG9sVkFFS2poRmFISVdPZ2REaHp5WmFOc1Qz?=
 =?utf-8?B?YnJDRXBxRFdTZm5sTStVcUxkN0N6dkZXRld0bzJwRkdQc3IrbVZTem92MUp4?=
 =?utf-8?B?cGZDUHpIMjB1NFYvaFJ6Q3JFWlNFeW9QZE9NdFBQeDExUU45dlRmL3V2ZU1M?=
 =?utf-8?B?aERiYlRGN0VVcHloK1FKbHF5cC9aaDN1Nmp5Ym1RPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FEB28E79FDFD0648825D54FE989BAFE0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 546ec45e-95e8-44f3-0a86-08d8bc7a5bb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2021 13:01:38.2153
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A3kbTi+TmNaU2SfEWPoLlKzqcnJrBqDBv7hk04kne4sexhj66/joxn7ahlthVPOOIIaPaKHjNCNd1VeEPKChKKoD2Ca89dtrLcTiuEO0T2UoUwVX9W9Sa3DX9pS5QQia
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2668
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgQmFydG9zeiwNCg0KT24gVHVlLCAyMDIxLTAxLTE5IGF0IDEyOjA3ICswMTAwLCBCYXJ0b3N6
IEdvbGFzemV3c2tpIHdyb3RlOg0KPiBPbiBUdWUsIEphbiAxOSwgMjAyMSBhdCA4OjIzIEFNIE1h
dHRpIFZhaXR0aW5lbg0KPiA8bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPiB3cm90
ZToNCj4gPiBTdXBwb3J0IEdQTyhzKSBmb3VuZCBmcm9tIFJPSE0gQkQ3MTgxNSBwb3dlciBtYW5h
Z2VtZW50IElDLiBUaGUgSUMNCj4gPiBoYXMgdHdvDQo+ID4gR1BPIHBpbnMgYnV0IG9ubHkgb25l
IGlzIHByb3Blcmx5IGRvY3VtZW50ZWQgaW4gZGF0YS1zaGVldC4gVGhlDQo+ID4gZHJpdmVyDQo+
ID4gZXhwb3NlcyBieSBkZWZhdWx0IG9ubHkgdGhlIGRvY3VtZW50ZWQgR1BPLiBUaGUgc2Vjb25k
IEdQTyBpcw0KPiA+IGNvbm5lY3RlZCB0bw0KPiA+IEU1IHBpbiBhbmQgaXMgbWFya2VkIGFzIEdO
RCBpbiBkYXRhLXNoZWV0LiBDb250cm9sIGZvciB0aGlzDQo+ID4gdW5kb2N1bWVudGVkDQo+ID4g
cGluIGNhbiBiZSBlbmFibGVkIHVzaW5nIGEgc3BlY2lhbCBEVCBwcm9wZXJ0eS4NCj4gPiANCj4g
PiBUaGlzIGRyaXZlciBpcyBkZXJpdmVkIGZyb20gd29yayBieSBQZXRlciBZYW5nIDwNCj4gPiB5
YW5nbHNoQGVtYmVzdC10ZWNoLmNvbT4NCj4gPiBhbHRob3VnaCBub3Qgc28gbXVjaCBvZiBvcmln
aW5hbCBpcyBsZWZ0Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE1hdHRpIFZhaXR0aW5lbiA8
bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPg0KPiANCj4gSGkgTWF0dGksDQo+IA0K
PiBsb29rcyBncmVhdCwganVzdCBhIGNvdXBsZSBuaXRzLg0KPiANCg0KVGhhbmtzIGZvciB0aGUg
cmV2aWV3ISBJJ2xsIHN0b3JlIHlvdXIgZmluc2luZ3MgYW5kIGZpeCB0aGVtIHdoZW4gSQ0KcmVz
cGluIHRoaXMuIEkgdGhpbmsgYWxsIG9mIHlvdXIgcG9pbnRzIHdlcmUgdmFsaWQuIEFzIEkga25v
dyB0aGlzIGlzDQpsYXJnaXNoIHNlcmllcyAoYW5kIGFzIEkga25vdyBJIGFjY2lkZW50YWxseSBz
ZW50IGZpcnN0IDEwIHYyIHBhdGNoZXMNCnRvIGFsbCByZWNpcGllbnRzIG5vIG1hdHRlciB3aGF0
IHN1YnN5c3RlbSB3YXMgaW1wYWN0ZWQpIEknbGwgd2FpdCBmb3INCmEgd2hpbGUgYmVmb3JlIHJl
c2VuZGluZyAoYXQgbGVhc3QgYSB3ZWVrKS4gQmVzaWRlcyBJIGRvbid0IGV4cGVjdCB0aGUNCmRl
cGVuZGVuY2llcyB0byBiZSBtZXJnZWQgYmVmb3JlIG5leHQga2VybmVsIHJlbGVhc2Ugc28gdGhp
cyBpcyBub3QNCnVyZ2VudCA6KQ0KDQotIGJ1dCB0aGFua3MhDQoNCkJyLA0KCU1hdHRpDQoNCg==
