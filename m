Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C79B260DC7
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 10:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730097AbgIHIlE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 04:41:04 -0400
Received: from mail-am6eur05on2042.outbound.protection.outlook.com ([40.107.22.42]:34880
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729993AbgIHIlC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 8 Sep 2020 04:41:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kykrkzNuPh3OvM6LCwK7/Q8upp54n7OKzfbqASflDdL6Iz9hTW4r7aD1WVCR6k48wpGrXqCcYwVFfuq1tKiLLzacQyZe3eqbA3EvCsKoA8ciO+a5L20xyS4U8flLzclfP9fpXQ3QOXej61SxmqkzV5WC+CO2a+9RF2OouQzBfShr2V93O4EhxNDc8Db7ACnRux9cD4a+i4Yi1Bdh4oy6iFBtqZVN/QkyBz04RJbeGLi4q4Oytq3OouFf8sHQI6k7/A2tQl2pY7uXvzH4IYOPon+utX5bGAPUo82qcn3+TSyhOEIPCRZ1/EO7aSR4mcgwa58nEqXur5M19YJ9X8738Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SScHgv4y1hxwsfeO4ydUq2lYYNDtN24FDraJGwO3pwQ=;
 b=BpCxEiTWTXSGbUqLvjzkzPwIzLVQVHXpJ9r3pZVAvJbfN1lPu3KdoXW4ErIovpHaOYuN9HwiMipTvNTWo8layenyyn4Lkki2FDbyKWdzm/nO4VeeafzZGGDSVm+EienfJCHboNRtZVNwCjb6E7h09oZrLNh4rdrrMhHn2s/cj5N75HoiSEI8mlCpeImpd2lm2TVgmCMAJn7RchhFV1wBsmtlTIesYDA70kWlPyF3jQCUfZrGLydz98/T3uaDwrVjzUULIbJUcwKE9yKCeEa5byVT/kevNSddZi8C3mgATdDxOH47j0fpnUW5aDlo5P9mhAIq45a2erCl7lBVcTzYvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SScHgv4y1hxwsfeO4ydUq2lYYNDtN24FDraJGwO3pwQ=;
 b=gDrhesztXgMynpFGFw9fwhqkQ/oHUhFLcZqwHuKI4/uZFW5ZzFImwzo97SCMhPpLmEVAuGK2Su2wU/xsvmP9oaxdzfsKPk/A+Db9J1rBKUB26Jk3D94qL8rldX8YpFIIoTcm1wuMJyt4DCEOdfjpJgo/5eIk4UPlRt1vqhrXmtE=
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15)
 by DB7PR04MB4282.eurprd04.prod.outlook.com (2603:10a6:5:19::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Tue, 8 Sep
 2020 08:40:58 +0000
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68]) by DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68%8]) with mapi id 15.20.3370.016; Tue, 8 Sep 2020
 08:40:58 +0000
From:   Joakim Zhang <qiangqing.zhang@nxp.com>
To:     Sean Young <sean@mess.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Andy Duan <fugang.duan@nxp.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: RE: SONY IR issue
Thread-Topic: SONY IR issue
Thread-Index: AdaB1p1pGnCw2M4KThCyranS73PKeAATSO+AABVEJGAAD5nPAACKfohQAARZXYAAAEERUAAx0uZA
Date:   Tue, 8 Sep 2020 08:40:58 +0000
Message-ID: <DB8PR04MB6795A60FBD4FBB3409C103E4E6290@DB8PR04MB6795.eurprd04.prod.outlook.com>
References: <DB8PR04MB679580C7C8E6888B56C8BDACE62C0@DB8PR04MB6795.eurprd04.prod.outlook.com>
 <20200903185513.GA31286@gofer.mess.org>
 <DB8PR04MB67950837E2355EA81FBAADD1E62D0@DB8PR04MB6795.eurprd04.prod.outlook.com>
 <20200904123050.GA11675@gofer.mess.org>
 <DB8PR04MB6795F1EA8A865A3CDCC79439E6280@DB8PR04MB6795.eurprd04.prod.outlook.com>
 <20200907084053.GA32304@gofer.mess.org>
 <DB8PR04MB679515C3490C5087B29A6DA8E6280@DB8PR04MB6795.eurprd04.prod.outlook.com>
In-Reply-To: <DB8PR04MB679515C3490C5087B29A6DA8E6280@DB8PR04MB6795.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mess.org; dkim=none (message not signed)
 header.d=none;mess.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b67a557d-522d-4567-2c95-08d853d2e8bb
x-ms-traffictypediagnostic: DB7PR04MB4282:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB428252ED9959B893F82566C2E6290@DB7PR04MB4282.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cr9M6ARkGLXBGrml46hsh5KJvoWxcXwFO2QKo269bOj+p3jJEnpD3o3xx7PEXb87GLYBfa8uCqwzQt/u4HDfS4KEeo3Cb/emu6NPiHD864zb0/FpB+AvryFWGev60D2TQNzgl1Yt+DodhdOYWiE+ABsPZWNStRemmrWeXuM9UrKI93iOw+6WLYkwpBArRHngCLDxAb+WrRlSmvlN01HxmHgrPel0f94g3xhPmyxVdVQgimNSvtfNkjw3tdKRzU1dWwn15XUutxRTHC9z4TFcAyZtyygbJA0RpEhMefysNUmgvpNHlnheKrc51ApzICL6
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6795.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39860400002)(346002)(136003)(396003)(53546011)(64756008)(66446008)(8936002)(4326008)(6916009)(66556008)(66946007)(66476007)(76116006)(54906003)(55016002)(83380400001)(8676002)(33656002)(52536014)(86362001)(9686003)(71200400001)(6506007)(26005)(478600001)(7696005)(3480700007)(2906002)(186003)(7116003)(316002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: U7T6C0xKZfDpyirpzGWsu9YxQZglMrtMA6drJV9fnouq8hPkVwm3hJXpQmnOeOBvhuWFKRG7yxPgXdyzn2/IJDU5AIsV+EZt4FXNDQ1UMCv30l8wDE/HXeNyLVXwVk5L4R7BeKb677rvKD0kJU3nJqk/eTxYoSlYSFvb5nsqFj0SMaTDvPkaGj91RTcDqQJCNUqFdFmtQTLT350a4KfV9bcPgcOMsVO0qLef6Xy/UOOF6gXzvj44LEIAqHI488wrnfUmNLTsTGdIC+7lLucfWhdgh1he7Ov1SKUsI8J20gvu5E+WTeW8FiuhL2dgImW0YWVuYDDQasJ9HuSEgebXx0QTmtndJwJ8fDMqccha33LrudO4nJPCiBemUGD2PwA2MdRs5FUPC0/xQUPZVWdqQ3PFVYW07pivsalTBm7IwcA/tn6qq8BfhKXW6UrImsPXfoYoiPuQ8K3gvrqwvJk0q+r3pfUmDxGkQpzRbEdt6lr18uSQHXGutQ/WHYjxX98GsSr8HLFdx9Mlgq1dKwzgcCcsJn5vRWk3xv5OG7G2NJVvzeH0NfI8nrdKAMgU8QrYKW9tWKchY0pCAEKAKxh4iqInJRyD/XeNXO8UkuUM9HhSApC/z+Aq+3FPsul6hzMU1ZB40vAJLzN+G+JiIo9qIg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b67a557d-522d-4567-2c95-08d853d2e8bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2020 08:40:58.4847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FPr/pKKeP6a8/g9IWISoV2tXytinDgIADnhn/OjTG6PrCgYyWBZCQYSg6SDwjJPNGoLjwoTKc3HGwdbPh7JdhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4282
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpIaSBTZWFuLA0KDQpHUElPIElSIFJlY3YgZXh0cmVtZWx5IHJlbHkgb24gdGhlIHJlYWwtdGlt
ZSBwZXJmb3JtYW5jZSBvZiB0aGUgaW50ZXJydXB0IHJlc3BvbnNlLCBhZnRlciB0dXJuIG9mZiBj
cHVpZGxlLCBJUiBjYW4gd29yayBzdGVhZGlseSBub3cuDQoNCk11Y2ggdGhhbmtzIGZvciB5b3Vy
IGtpbmRseSBoZWxwLiDwn5iKDQoNCkJlc3QgUmVnYXJkcywNCkpvYWtpbSBaaGFuZw0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb2FraW0gWmhhbmcNCj4gU2VudDogMjAy
MOW5tDnmnIg35pelIDE2OjUyDQo+IFRvOiBTZWFuIFlvdW5nIDxzZWFuQG1lc3Mub3JnPg0KPiBD
YzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBBbmR5IER1YW4gPGZ1Z2FuZy5kdWFuQG54
cC5jb20+Ow0KPiBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZzsgQmFydG9zeiBHb2xhc3pld3Nr
aSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4NCj4gU3ViamVjdDogUkU6IFNPTlkgSVIgaXNz
dWUNCj4gDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogU2Vh
biBZb3VuZyA8c2VhbkBtZXNzLm9yZz4NCj4gPiBTZW50OiAyMDIw5bm0OeaciDfml6UgMTY6NDEN
Cj4gPiBUbzogSm9ha2ltIFpoYW5nIDxxaWFuZ3FpbmcuemhhbmdAbnhwLmNvbT4NCj4gPiBDYzog
bGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBBbmR5IER1YW4gPGZ1Z2FuZy5kdWFuQG54cC5j
b20+Ow0KPiA+IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBCYXJ0b3N6IEdvbGFzemV3c2tp
DQo+ID4gPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+DQo+ID4gU3ViamVjdDogUmU6IFNPTlkg
SVIgaXNzdWUNCj4gPg0KPiA+IE9uIE1vbiwgU2VwIDA3LCAyMDIwIGF0IDA2OjU4OjQzQU0gKzAw
MDAsIEpvYWtpbSBaaGFuZyB3cm90ZToNCj4gPg0KPiA+IC1zbmlwLQ0KPiA+DQo+ID4gPiA+ID4g
PiBJIHdvdWxkbid0IGJlIHN1cnByaXNlZCBpZiB0aGUgZ3BpbyBkZXZpY2UgZ2VuZXJhdGVzIHR3
bw0KPiA+ID4gPiA+ID4gaW50ZXJydXB0cyBmb3IgdGhlIGJyb2tlbiBwdWxzZSAob25lIGFmdGVy
IDY5MHVzIGFuZCBhbm90aGVyDQo+ID4gPiA+ID4gPiBhdCAxMjAwdXMpLCBhbmQgaWYgZGVjb2Rp
bmcgaGFwcGVucyBiZWZvcmUgdGhlIHNlY29uZCB0aGVuIHRoZQ0KPiA+ID4gPiA+ID4gd3JvbmcN
Cj4gPiBwdWxzZSBsZW5ndGggaXMgdXNlZC4NCj4gPiA+ID4gPiBJIGFsc28gY2hlY2sgdGhlIG51
bWJlciBvZiBpbnRlcnJ1cHQgZ2VuZXJhdGVkIGJ5IGdwaW8uIEFmdGVyIEkNCj4gPiA+ID4gPiBw
cmVzcyB0aGUga2V5LA0KPiA+ID4gPiBSQyB0cmFuc21pdHMgNyBmcmFtZXMsIGl0IHNob3VsZCBj
b250YWluIDE4MiBmYWxsaW5nL3Jpc2luZyBlZGdlcy4NCj4gPiA+ID4gPiBJdCBpbmRlZWQgcmVw
b3J0cyAxODIgaW50ZXJydXB0cyBhbmQgZ28gdGhyb3VnaA0KPiA+ID4gPiA+IGlyX3Jhd19ldmVu
dF9zdG9yZSBmdW5jdGlvbiAxODIgdGltZXMuIFNpbmNlIHRoZSBudW1iZXIgb2YNCj4gPiA+ID4g
PiBpbnRlcnJ1cHQgaXMgYWNjdXJhdGUsIGp1c3QgYSBmZXcNCj4gPiA+ID4gZmFsbGluZy9yaXNp
bmcgaW50ZXJydXB0IGNvbWVzIG11Y2ggcXVpY2tseSB0aGFuIG90aGVycywgYnV0IHRoZQ0KPiA+
ID4gPiBhbmFsb2cgc2lnbmFsIGlzIHBlcmZlY3QuIEl0IGlzIHJlYWxseSBvdXQgb2YgbXkgdW5k
ZXJzdGFuZGluZy4gSXQNCj4gPiA+ID4gc2hvdWxkIG5vdCBhbg0KPiA+IGlzc3VlIGluIElSIGxh
eWVyLg0KPiA+ID4gPg0KPiA+ID4gPiBJIHRoaW5rIHRoZSBuZXh0IHN0ZXAgd291bGQgYmUgdG8g
cHV0IGRldl9kYmcvcHJpbnRrIGluDQo+ID4gPiA+IGdwaW8taXItcmVjdi5jLCBhbmQgc2VlIGlm
IHRoZSByZXN1bHRzIGFyZSB0aGUgc2FtZSB0aGVyZS4gSQ0KPiA+ID4gPiBzdXNwZWN0IHRoZXkg
d2lsbA0KPiA+IGJlLg0KPiA+ID4gWWVzLCBhcyB5b3Ugc3VzcGVjdGVkLCB0aGUgcmVzdWx0IGlz
IHRoZSBzYW1lIHRoZXJlLiBJdCBzZWVtcyB0byBiZQ0KPiA+ID4gYSBzeXN0ZW0NCj4gPiBvciBn
cGlvIGlzc3VlLg0KPiA+ID4NCj4gPiA+DQo+ID4gPiA+ID4gPiA+IEkgYWxzbyBoYXZlIGEgcXVl
c3Rpb24sIGlmIFJDIHRyYW5zbWl0IHJlcGVhdGVkbHkgNiB0aW1lcywNCj4gPiA+ID4gPiA+ID4g
YW5kIFNPTlkgZGVjb2Rlcw0KPiA+ID4gPiA+ID4gZGVjb2RlIGFsbCByYXcgZGF0YSBzdWNjZXNz
ZnVsbHksIGl0IHdpbGwgcmVwb3J0IHRvIGlucHV0DQo+ID4gPiA+ID4gPiBzdWJzeXN0ZW0NCj4g
PiA+ID4gPiA+IDYgdGltZXMsIGRvZXMgaW5wdXQgc3Vic3lzdGVtIHdpbGwgc3RpbGwgcmVwb3J0
IHRvIHVzZXJzcGFjZSA2IHRpbWVzPw0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IElmIHRoZSBz
b255IGRlY29kZXMgdGhlIHNhbWUgdmFsdWVzIDYgdGltZXMsIHRoZW4gc2NhbmNvZGUNCj4gPiA+
ID4gPiA+IHdpbGwgcmVwb3J0ZWQgNiBpbWVzLCBidXQgdGhlcmUgd2lsbCBiZSBvbmx5IG9uZSBr
ZXkgZG93bg0KPiA+ID4gPiA+ID4gZXZlbnQsIGFuZCBhIGtleSB1cCBldmVudCBhYm91dCAxMDBt
cyBhZnRlciB0aGUgdGhlIGxhc3QNCj4gPiA+ID4gPiA+IGRlY29kZSAocGx1cyBhIGZldyBvdGhl
ciBtaWxsaXNlY29uZHMgZm9yIHZhcmlvdXMgdGltZW91dHMpLg0KPiA+ID4gPiA+IFRoYW5rcyBm
b3IgeW91ciBkZXRhaWxzLiBEb2VzIHRoaXMgbWVhbiBpbnB1dCBzdWJzeXN0ZW0gd2lsbA0KPiA+
ID4gPiA+IHN0aWxsIHJlcG9ydA0KPiA+ID4gPiBzY2FuY29kZSA2IHRpbWVzLCBidXQgb25seSBy
ZXBvcnQga2V5Y29kZSBvbmNlIGlmIGl0IGlzIG1hdGNoZWQ/DQo+ID4gPiA+DQo+ID4gPiA+IEV4
YWN0bHkuIFRoZSBrZXljb2RlIGlzIG9ubHkgcmVwb3J0ZWQgb25jZSwgc28gdGhhdCBpZiB0aGUg
dXNlciBwcmVzcyBlLmcuDQo+ID4gPiA+ICIxIiB0aGV5IHdpbGwgZ2V0IGp1c3QgZ2V0IG9uZSAi
MSIuDQo+ID4gPiA+DQo+ID4gPiA+ID4gU2VhbiwgYmFzZWQgb24geW91ciBleHBlcmllbmNlLCB3
aGVyZSBlbHNlIGRvIHlvdSBzdWdnZXN0IG1lIHRvDQo+ID4gPiA+ID4gbG9vayBpbnRvDQo+ID4g
PiA+IHRoaXMgZnVydGhlcj8gSGF2ZSB5b3UgY2FtZSBhY3Jvc3Mgc3VjaCBjYXNlLCBhIGZldyBp
bnRlcnJ1cHQNCj4gPiA+ID4gcmVzcG9uZGVkIHNvIHF1aWNrbHkgc28gdGhhdCBmcm9udCBwdWxz
ZS9zcGFjZSBpcyBtdWNoIHNob3J0ZW4/DQo+ID4gPiA+DQo+ID4gPiA+IFRvIGJlIGhvbmVzdCBJ
J3ZlIG5ldmVyIHNlZW4gdGhpcyBiZWZvcmUuDQo+ID4gPiA+DQo+ID4gPiA+IEknbSBub3Qgc3Vy
ZSB3aGF0IHRoZSBjYXVzZSBjb3VsZCBiZS4gT24gdGhlIHJhc3BiZXJyeSBwaSBpdCBpcw0KPiA+
ID4gPiBrbm93biB0aGF0IGxvdHMgdXNiIHRyYWZmaWMgY2F1c2VzIGRlbGF5cyBpbiB0aGUgZ3Bp
byBpbnRlcnJ1cHQNCj4gPiA+ID4gaGFuZGxlcnMgZHVlIHRvIHNvbWUgaGFyZHdhcmUgaXNzdWUs
IGJ1dCB0aGlzIGNhdXNlcyBzb21lDQo+ID4gPiA+IGludGVycnVwdHMgdG8gYXJyaXZlIGxhdGUu
IFRoaXMgY2F1c2VzIHNvbWUgb2YgdGhlIHB1bHNlL3NwYWNlDQo+ID4gPiA+IHRpbWluZ3MgdG8g
YmUgbG9uZ2VyLCBhbmQgdGhlbiBsYXRlciBvbmVzIGFyZSBzaG9ydGVyIGFnYWluIGFzIGl0IGNh
dGNoZXMNCj4gdXAuDQo+ID4gPiA+DQo+ID4gPiA+IFNpbWlsYXJseSBpZiB0aGUga2VybmVsIGlz
IHJ1bm5pbmcgd2l0aCBpbnRlcnJ1cHRzIG9mZiBmb3IgdG9vDQo+ID4gPiA+IGxvbmcsIHNvbWUg
b2YgdGhlIHRpbWluZ3Mgd2lsbCBiZSBsb25nZXIgYW5kIG90aGVycyBzaG9ydGVyLg0KPiA+ID4g
WWVzLCB3ZSBjYW4gdW5kZXJzdGFuZCB0aGUgaW50ZXJydXB0IGFycml2ZXMgbGF0ZSBhbmQgY2F1
c2UgdGhlDQo+ID4gPiB0aW1pbmdzDQo+ID4gaW5jb3JyZWN0LiBBdCBteSBzaWRlLCBhIGZldyBp
bnRlcnJ1cHQgYXJyaXZlcyB0b28gZmFzdGVyLg0KPiA+DQo+ID4gSSdtIHdvbmRlcmluZyB3aGVy
ZSB5b3UgY2FwdHVyZWQgdGhlIElSIHNpZ25hbC4gSWYgeW91IGNhcHR1cmVkIHRoZSBJUg0KPiA+
IHNpZ25hbCBvbiB0aGUgdHJhbnNtaXR0ZXIgbGVkLCBtYWtlIHN1cmUgdGhlIHJlc29sdXRpb24g
aXMgaGlnaCBlbm91Z2gNCj4gPiBzbyB5b3UgY2FuIHNlZSB0aGUgY2Fycmllci4gVGhlbiB5b3Ug
Y2FuIG1ha2Ugc3VyZSB0aGVyZSBhcmUgbm8gZXJyb3JzIGluDQo+IHRoZXJlLg0KPiA+DQo+ID4g
SXQgbWlnaHQgYmUgYmV0dGVyIHRvIGNhcHR1cmUgdGhlIElSIHNpZ25hbCBvbiB0aGUgZ3BpbyBz
aWduYWwgZ29pbmcgaW50byB0aGUNCj4gU29DLg0KPiANCj4gWWVzLCB0aGUgc2lnbmFsIEkgY2Fw
dHVyZWQgaXMgdGhlIG91dHB1dCBvZiB0aGUgSVIgZGV2aWNlLCBpLmUuIHRoZSBncGlvIHNpZ25h
bA0KPiBnb2luZyBpbnRvIHRoZSBTb0MuDQo+IA0KPiBCZXN0IFJlZ2FyZHMsDQo+IEpvYWtpbSBa
aGFuZw0KPiA+ID4gPiBJcyB0aGVyZSBhbnl0aGluZyB5b3UgY2FuIHRlbGwgdXMgYWJvdXQgdGhl
IGdwaW8gaGFyZHdhcmU/DQo+ID4gPiBHUElPIGlzIGZyb20gb3VyIFNvQywgcG93ZXIgc3VwcGx5
IHdpdGggZXh0ZXJuIDMuM1YsIGFuZCBJDQo+ID4gPiBjb25maWd1cmVkIGl0DQo+ID4gaW50ZXJu
YWwgcHVsbC11cC4NCj4gPg0KPiA+IFRoYW5rcw0KPiA+IFNlYW4NCg==
