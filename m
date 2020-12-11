Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 605582D75E0
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 13:44:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403934AbgLKMnR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 07:43:17 -0500
Received: from mail-eopbgr60050.outbound.protection.outlook.com ([40.107.6.50]:8610
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2395442AbgLKMmx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Dec 2020 07:42:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSxGvwH25p/l3YWtieUMP/gljRhuk6epXzimitiDyP//HxgpK77pZNYKZpeZqmAwrXFb9l2CAex33tLvaqYtl5Bjm1fj9hlWrQHwI3l/oHW3W/Kift3hhrjyYLlnFnWALz3KDRG+VNDvcxxQ8MxIf9JuknpEKOY/nkmJIniDN92DafnSSiFJsCimoD/BUO065JsVEl04OyYfBq844n3KVZbW/v4vgRSoMBvjg8GKF/qPNhj34sHz08MMFPr69Wzi+t7gz8qLFVaLxsUMyI9Ny7QSfC9MhEtdOnUMnb2e/2ObEG66Bd0ctkzM/5V2rZ8dYxG41PpxScGKrlgDbklE1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8TJE7XNXgG4TTo7o3Ms+Kt5wpyiJIi1sp29LVKLgzw=;
 b=chY40MchlAKzILS0V9+cC6ph+CZG5l+h6pQv7Byu9TCNwswSbU6xIABrXfvSj5m2ebRybXnrh384zmLMBqQIyLazCSW3WTXQN2fzuTSnkGQ/c8wzE9a8Z10A6+qXHvoAGz7GUyyMHYuTYxTPMnbeAWROgFz0Fpruh1xFer+xeAHMxKWierJZ2j+p7ZDVTf4PnoyNrgEhpc7reErRufdDx7BaRqqHKv0Yb9l6w9/n5IBLWHDFtfnTP1bGWXcVTRH7FKC0h2zf7jgE3XzwnUMvtbuHRHfDkNNIg2tV9pvtUqYulxCI4ANC9QprSCgJ6mG/+GvHdF/l890cIN90FBcWSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8TJE7XNXgG4TTo7o3Ms+Kt5wpyiJIi1sp29LVKLgzw=;
 b=rnRFF90bpOiy19r7MKteRBUKNdqlGXm8rPZHYKFANBlUJ/FFY4pdsVNNUaAMrTf49CkG6WlqMwBBPr5Z01Am/y1r2GG8k9qSUnf+1h5oBqtDMWBOGhNq8udg1kyFyxqn9BUJrunHInoRgKj6auNL7izgDzOTfsifd0vG1LZo9qM=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB3066.eurprd03.prod.outlook.com (2603:10a6:7:62::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.14; Fri, 11 Dec 2020 12:42:02 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87%6]) with mapi id 15.20.3632.023; Fri, 11 Dec 2020
 12:42:02 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "khiem.nguyen.xt@renesas.com" <khiem.nguyen.xt@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 06/10] gpio: bd9571mwv: rid of using struct bd9571mwv
Thread-Topic: [PATCH v2 06/10] gpio: bd9571mwv: rid of using struct bd9571mwv
Thread-Index: AQHWz7CxTtPKSzzIR06lL64grv0NGqnx1qmA
Date:   Fri, 11 Dec 2020 12:42:02 +0000
Message-ID: <4f5ecd246c0d9afbd61bf15e48fc160736451fae.camel@fi.rohmeurope.com>
References: <1607686060-17448-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1607686060-17448-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1607686060-17448-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb4ba734-e687-40c2-3a5d-08d89dd228c0
x-ms-traffictypediagnostic: HE1PR03MB3066:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR03MB306657117710F9FFB2B1DBE4ADCA0@HE1PR03MB3066.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YHCAhsSsTjNQbC0Z5krcmlRvLBPvO+bN/Xhx5/2RP/uCiIGYbwqWGnfLEJkrK90P4h385R3pnwny0r0Jyw8NrYPWH3Fpzhjv2ycLqz+2fXQ/TCvqCgbPuki0d3arIyD4jHH9P1HlSPXACI+7KOqbc8A0QhgZfUIY55ifB+4VbhRQyerJ+NsCyXk3Sqjm3PezFxMHHPXuUODdlUsa34lnKCggSrUyc3S4870EO/jCwFz7JaJKK5amph/zhGcgPIHXKq0nhJyHzrAi+CBP0ZC15DQwKNw6NLJUzHSWKRHcIoN3Kojg3Wfb7s6m1IfjVaOZ0IE3JjhKxVbjyH5GAzUtFg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(39830400003)(396003)(76116006)(5660300002)(316002)(54906003)(2616005)(4326008)(6506007)(6486002)(66556008)(66476007)(2906002)(478600001)(8936002)(110136005)(26005)(7416002)(71200400001)(8676002)(3450700001)(186003)(86362001)(6512007)(64756008)(4001150100001)(66446008)(83380400001)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?OUsrWk1CUVJ4NEhJeUZXLzZaUFQrbEphUENzQzRPVFhaZk9TQk5valZHUXVp?=
 =?utf-8?B?TTJvNHBBRXVmZVpZeVEza2VrK2VmRXplN3prK0NHZDZyb3IwdjNJMnJ2elBR?=
 =?utf-8?B?WHFySXNGRmtEQjUxZ0NiVTQvOGFuTDVpUFVhUndteEVheU16T1BSOFdtcHo5?=
 =?utf-8?B?Q05TYXI5TVV4SUNKb092U2FzdEx3bSszWFNkL0gxMFNlbE8zT3BGU1VPL01a?=
 =?utf-8?B?RXBHaEhKMDU4NmlWOE9yZGdHV3ZHSmtlTTh3aHZmcHpRWnY4VUIwUWR5NXpj?=
 =?utf-8?B?dnBiZS9DTnhWdzN2VUVaNXkvMHdZR3dtL3dua1RVMk1RK2hmQkJ4Y1pKRDIv?=
 =?utf-8?B?OUNsNWJVWnFhcnRpSkFZbUNXYm5zVml4WFJ0Y0RZZGk3aEE0WWdDb2NCVi80?=
 =?utf-8?B?ZnZ0MFVoSDhhOFJ3Q2lJWTV5em93NnRtdVA5cXFOaHRMRXpCck1Tc09kZ05h?=
 =?utf-8?B?enBxWVM1ZVhoc1RzY1Q3cnB2ZDZNSDN3NzIzeWxlMXVodUpDT1ptZVh6UkxK?=
 =?utf-8?B?UjJRVmhWQXhiTGJldG9IRTR5RjFpcSt0eHlOL3NjSzBoODR0SUNtZEYvMU5E?=
 =?utf-8?B?dDNGSDF1MmRtdEZIVnBhbjNwem5vMkZmaktzZmRnYVRJWmE2SVcxNTNnb0RD?=
 =?utf-8?B?RE5tOGFkVHFEM0pSU3ZZbFZOOUlBVFplWVE5UGhPNFpsRGFFNnBPQzdueVFT?=
 =?utf-8?B?YTRmK0xWL1FQaGdUUDJ5K2Zzd0xDQU8xcThZcnF2KzVSOG1BSzYxdytGY3p2?=
 =?utf-8?B?cUZkazhXUllzNVdEVTNsWmN0SzdWdjJLVStuSHNGaE53WXR0QkcxRVZvdlpF?=
 =?utf-8?B?aEYwQmt3OEJyN3Zpc203YnhnbXcwV0piWVpISkJWUUxZSGFMSjNJTjRQNmhy?=
 =?utf-8?B?aFJycGMzRDFRR09YQ3pMZXNzVS9wZXIrUHBXMHEwazBqYWsrQy9LTEdMM1hK?=
 =?utf-8?B?ajVMTVFiN2JFbXI4NmNSMW1QckQwRllSZmVHR2VhUUx0eEtyeDlPUityQXVX?=
 =?utf-8?B?VTdadURpV2RzMEtHc0FrT3hiZ1ZoUytYWTRBWGo0SE1xMW5yQjBXa24rQkcr?=
 =?utf-8?B?aUdORHVISk9ISGdXNnhYSTJPb3JTSG5oUXdDWTBHeWNJZk4yUy9zcU9vY0x3?=
 =?utf-8?B?eDc3OWhSWmdJWk14bFRyOCtEVjRhcUlNUVkrUVE4UWl2MXh6c0k5UG9sYmpF?=
 =?utf-8?B?dXZqaXJYN2JXZmxicmhSeno0MG1uOHEwcTIzeGZWdnUxZUs0N0ZNNzhhOTNt?=
 =?utf-8?B?T21DUmwyQ29pQWNHOUpibjBSTjdxQmxnMXVGcFdzMlBEaGRPYThJYURjT1I4?=
 =?utf-8?Q?UbZ99GpZiUQSF5p7GLmsc/iCp29NmPScGx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3DA7CC2F6F69D24894E25009FE0A4599@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4ba734-e687-40c2-3a5d-08d89dd228c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2020 12:42:02.4695
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KE7Q4/dzAU84cqI2mxIwS0j4lSlePAJucv0Te28oqAeGOtIC/Gv5Frq6ME+bydxbAhVlMupSgrnoJpgRbWbSPlJT74PgAYISkwiQ5HPwe8DzLAFm5pmKh/lcAZG/qjhN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB3066
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBGcmksIDIwMjAtMTItMTEgYXQgMjA6MjcgKzA5MDAsIFlvc2hpaGlybyBTaGltb2RhIHdy
b3RlOg0KPiBUbyBzaW1wbGlmeSB0aGlzIGRyaXZlciwgdXNlIGRldl9nZXRfcmVnbWFwKCkgYW5k
DQo+IHJpZCBvZiB1c2luZyBzdHJ1Y3QgYmQ5NTcxbXd2Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
WW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KDQpG
V0lXOg0KUmV2aWV3ZWQtQnk6IE1hdHRpIFZhaXR0aW5lbiA8bWF0dGkudmFpdHRpbmVuQGZpLnJv
aG1ldXJvcGUuY29tPg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncGlvL2dwaW8tYmQ5NTcxbXd2LmMg
fCAxOSArKysrKysrKystLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspLCAxMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8vZ3Bp
by1iZDk1NzFtd3YuYyBiL2RyaXZlcnMvZ3Bpby9ncGlvLQ0KPiBiZDk1NzFtd3YuYw0KPiBpbmRl
eCBhYmI2MjJjLi4wZTUzOTVmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby1iZDk1
NzFtd3YuYw0KPiArKysgYi9kcml2ZXJzL2dwaW8vZ3Bpby1iZDk1NzFtd3YuYw0KPiBAQCAtMTYs
OCArMTYsOCBAQA0KPiAgI2luY2x1ZGUgPGxpbnV4L21mZC9iZDk1NzFtd3YuaD4NCj4gIA0KPiAg
c3RydWN0IGJkOTU3MW13dl9ncGlvIHsNCj4gKwlzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7DQo+ICAJ
c3RydWN0IGdwaW9fY2hpcCBjaGlwOw0KPiAtCXN0cnVjdCBiZDk1NzFtd3YgKmJkOw0KPiAgfTsN
Cj4gIA0KPiAgc3RhdGljIGludCBiZDk1NzFtd3ZfZ3Bpb19nZXRfZGlyZWN0aW9uKHN0cnVjdCBn
cGlvX2NoaXAgKmNoaXAsDQo+IEBAIC0yNiw3ICsyNiw3IEBAIHN0YXRpYyBpbnQgYmQ5NTcxbXd2
X2dwaW9fZ2V0X2RpcmVjdGlvbihzdHJ1Y3QNCj4gZ3Bpb19jaGlwICpjaGlwLA0KPiAgCXN0cnVj
dCBiZDk1NzFtd3ZfZ3BpbyAqZ3BpbyA9IGdwaW9jaGlwX2dldF9kYXRhKGNoaXApOw0KPiAgCWlu
dCByZXQsIHZhbDsNCj4gIA0KPiAtCXJldCA9IHJlZ21hcF9yZWFkKGdwaW8tPmJkLT5yZWdtYXAs
IEJEOTU3MU1XVl9HUElPX0RJUiwgJnZhbCk7DQo+ICsJcmV0ID0gcmVnbWFwX3JlYWQoZ3Bpby0+
cmVnbWFwLCBCRDk1NzFNV1ZfR1BJT19ESVIsICZ2YWwpOw0KPiAgCWlmIChyZXQgPCAwKQ0KPiAg
CQlyZXR1cm4gcmV0Ow0KPiAgCWlmICh2YWwgJiBCSVQob2Zmc2V0KSkNCj4gQEAgLTQwLDggKzQw
LDcgQEAgc3RhdGljIGludCBiZDk1NzFtd3ZfZ3Bpb19kaXJlY3Rpb25faW5wdXQoc3RydWN0DQo+
IGdwaW9fY2hpcCAqY2hpcCwNCj4gIHsNCj4gIAlzdHJ1Y3QgYmQ5NTcxbXd2X2dwaW8gKmdwaW8g
PSBncGlvY2hpcF9nZXRfZGF0YShjaGlwKTsNCj4gIA0KPiAtCXJlZ21hcF91cGRhdGVfYml0cyhn
cGlvLT5iZC0+cmVnbWFwLCBCRDk1NzFNV1ZfR1BJT19ESVIsDQo+IC0JCQkgICBCSVQob2Zmc2V0
KSwgMCk7DQo+ICsJcmVnbWFwX3VwZGF0ZV9iaXRzKGdwaW8tPnJlZ21hcCwgQkQ5NTcxTVdWX0dQ
SU9fRElSLA0KPiBCSVQob2Zmc2V0KSwgMCk7DQo+ICANCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4g
QEAgLTUyLDkgKzUxLDkgQEAgc3RhdGljIGludCBiZDk1NzFtd3ZfZ3Bpb19kaXJlY3Rpb25fb3V0
cHV0KHN0cnVjdA0KPiBncGlvX2NoaXAgKmNoaXAsDQo+ICAJc3RydWN0IGJkOTU3MW13dl9ncGlv
ICpncGlvID0gZ3Bpb2NoaXBfZ2V0X2RhdGEoY2hpcCk7DQo+ICANCj4gIAkvKiBTZXQgdGhlIGlu
aXRpYWwgdmFsdWUgKi8NCj4gLQlyZWdtYXBfdXBkYXRlX2JpdHMoZ3Bpby0+YmQtPnJlZ21hcCwg
QkQ5NTcxTVdWX0dQSU9fT1VULA0KPiArCXJlZ21hcF91cGRhdGVfYml0cyhncGlvLT5yZWdtYXAs
IEJEOTU3MU1XVl9HUElPX09VVCwNCj4gIAkJCSAgIEJJVChvZmZzZXQpLCB2YWx1ZSA/IEJJVChv
ZmZzZXQpIDogMCk7DQo+IC0JcmVnbWFwX3VwZGF0ZV9iaXRzKGdwaW8tPmJkLT5yZWdtYXAsIEJE
OTU3MU1XVl9HUElPX0RJUiwNCj4gKwlyZWdtYXBfdXBkYXRlX2JpdHMoZ3Bpby0+cmVnbWFwLCBC
RDk1NzFNV1ZfR1BJT19ESVIsDQo+ICAJCQkgICBCSVQob2Zmc2V0KSwgQklUKG9mZnNldCkpOw0K
PiAgDQo+ICAJcmV0dXJuIDA7DQo+IEBAIC02NSw3ICs2NCw3IEBAIHN0YXRpYyBpbnQgYmQ5NTcx
bXd2X2dwaW9fZ2V0KHN0cnVjdCBncGlvX2NoaXANCj4gKmNoaXAsIHVuc2lnbmVkIGludCBvZmZz
ZXQpDQo+ICAJc3RydWN0IGJkOTU3MW13dl9ncGlvICpncGlvID0gZ3Bpb2NoaXBfZ2V0X2RhdGEo
Y2hpcCk7DQo+ICAJaW50IHJldCwgdmFsOw0KPiAgDQo+IC0JcmV0ID0gcmVnbWFwX3JlYWQoZ3Bp
by0+YmQtPnJlZ21hcCwgQkQ5NTcxTVdWX0dQSU9fSU4sICZ2YWwpOw0KPiArCXJldCA9IHJlZ21h
cF9yZWFkKGdwaW8tPnJlZ21hcCwgQkQ5NTcxTVdWX0dQSU9fSU4sICZ2YWwpOw0KPiAgCWlmIChy
ZXQgPCAwKQ0KPiAgCQlyZXR1cm4gcmV0Ow0KPiAgDQo+IEBAIC03Nyw3ICs3Niw3IEBAIHN0YXRp
YyB2b2lkIGJkOTU3MW13dl9ncGlvX3NldChzdHJ1Y3QgZ3Bpb19jaGlwDQo+ICpjaGlwLCB1bnNp
Z25lZCBpbnQgb2Zmc2V0LA0KPiAgew0KPiAgCXN0cnVjdCBiZDk1NzFtd3ZfZ3BpbyAqZ3BpbyA9
IGdwaW9jaGlwX2dldF9kYXRhKGNoaXApOw0KPiAgDQo+IC0JcmVnbWFwX3VwZGF0ZV9iaXRzKGdw
aW8tPmJkLT5yZWdtYXAsIEJEOTU3MU1XVl9HUElPX09VVCwNCj4gKwlyZWdtYXBfdXBkYXRlX2Jp
dHMoZ3Bpby0+cmVnbWFwLCBCRDk1NzFNV1ZfR1BJT19PVVQsDQo+ICAJCQkgICBCSVQob2Zmc2V0
KSwgdmFsdWUgPyBCSVQob2Zmc2V0KSA6IDApOw0KPiAgfQ0KPiAgDQo+IEBAIC0xMDUsOSArMTA0
LDkgQEAgc3RhdGljIGludCBiZDk1NzFtd3ZfZ3Bpb19wcm9iZShzdHJ1Y3QNCj4gcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KPiAgDQo+ICAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgZ3Bpbyk7
DQo+ICANCj4gLQlncGlvLT5iZCA9IGRldl9nZXRfZHJ2ZGF0YShwZGV2LT5kZXYucGFyZW50KTsN
Cj4gKwlncGlvLT5yZWdtYXAgPSBkZXZfZ2V0X3JlZ21hcChwZGV2LT5kZXYucGFyZW50LCBOVUxM
KTsNCj4gIAlncGlvLT5jaGlwID0gdGVtcGxhdGVfY2hpcDsNCj4gLQlncGlvLT5jaGlwLnBhcmVu
dCA9IGdwaW8tPmJkLT5kZXY7DQo+ICsJZ3Bpby0+Y2hpcC5wYXJlbnQgPSBwZGV2LT5kZXYucGFy
ZW50Ow0KPiAgDQo+ICAJcmV0ID0gZGV2bV9ncGlvY2hpcF9hZGRfZGF0YSgmcGRldi0+ZGV2LCAm
Z3Bpby0+Y2hpcCwgZ3Bpbyk7DQo+ICAJaWYgKHJldCA8IDApIHsNCg0K
