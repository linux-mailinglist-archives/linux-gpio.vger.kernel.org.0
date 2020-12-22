Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3FBE2E096A
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Dec 2020 12:16:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgLVLQL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Dec 2020 06:16:11 -0500
Received: from mail-eopbgr1410103.outbound.protection.outlook.com ([40.107.141.103]:4803
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726179AbgLVLQK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Dec 2020 06:16:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFG5t3ynELXB2bnPmhqU1VTr2fa/D7FHWvBDtPS+Dxm6/fmiXYEMY7TXOvVf5xkVyy1LT9/NkJ4dKnXzakr/UGHfDKQ7YOgasAkfftnwTgsvevluc14nYk9SBL9l6NPbSuatYV9NEcYNzOMqp5pDrQmFrFF50PurLpIZ5ctuxcHnuVZ50Y+yDVT6m9sTMAk85H26D2Mm1YWtqhTW7ljjGSaqmAqpwlR8wflN2Ki/dhTrGmkX2K7+zdPzsNG5cJSTznFX20Q/59o9w3EM2ffFo2QAqB5EqZD3IfK1HQhgL5kENMskwemCLW+Z4R8R20Wql2iCCiHOdGlIYYCT+nI0Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncBKqYNWlLphsIAR18HCHXLG2VlgdmPY664DUztgv0E=;
 b=oQcq3CjsuRYhuCi7/pxwahNBAwdJ1Jd5qmlsD5LGNunqDTXQWXGNVcdTdx9+GBgm4bpok2stZu8BX/D+QipOQ24Gk9wy8DChTfvKuJiAhcGOXkqPZ0YN+6TvMc9O6n2NZbPnt5GADkaLXVkq4PMw2BHqt9bGb/9ArOtjY/fjVDf9XWlugqFw807wBgZjnUhQNG/53qnxY3XT3rQSUlwHtV/Vod6/XEId5Epo36xsdQ+PgWJoquxP9OiGyu6qTwNGF5oZB/okuPSvWzVjMSNzPz1ZfWwWFo9EFknLJpj9ThXEzl+6kv9wqx6hF1nRirV2Bl5q5juV7dgOLYBqKfN9TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncBKqYNWlLphsIAR18HCHXLG2VlgdmPY664DUztgv0E=;
 b=Ow9mxxwGQnOUKKorFSr1CeteYMJQradB04zEz7H9Lli00WIzgVLsxQK2eyEQl4vJp9oZqCAbMsx0LSIlsziAjAnXF4pUpMCbmcHrJXtiJtve3FgTJRrM1hmH7KNKWDeP+lGg75eVdcxvbUdn5Ftqx6giy+KZFRou73gAfi1Fp70=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB6011.jpnprd01.prod.outlook.com (2603:1096:402:35::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.33; Tue, 22 Dec
 2020 11:15:22 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 11:15:21 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>
CC:     Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>
Subject: RE: [PATCH v4 10/12] mfd: bd9571mwv: Use devm_regmap_add_irq_chip()
Thread-Topic: [PATCH v4 10/12] mfd: bd9571mwv: Use devm_regmap_add_irq_chip()
Thread-Index: AQHW10SlPV/4ngF3JE6rHPoSH4m/D6oC0DsAgAAHJQCAAAJQAIAABGcAgAAalIA=
Date:   Tue, 22 Dec 2020 11:15:21 +0000
Message-ID: <TY2PR01MB3692A4DA84A1DE1B3F81CFF6D8DF0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1608519279-13341-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1608519279-13341-11-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <CAMuHMdVw_+dj78oygsVFnc4j9sTj97h1Q0GBp7oGWzakxCPfQA@mail.gmail.com>
         <c15b40d02d75a613194a454b4d8a2586639bda93.camel@fi.rohmeurope.com>
         <TY2PR01MB3692B09ECBAD4FFDB885E530D8DF0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <c36aa3f2569a977e56c845322a21f61c33c312bb.camel@fi.rohmeurope.com>
In-Reply-To: <c36aa3f2569a977e56c845322a21f61c33c312bb.camel@fi.rohmeurope.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fi.rohmeurope.com; dkim=none (message not signed)
 header.d=none;fi.rohmeurope.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:21dc:f9ce:ff84:4ded]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6637fdb4-28b4-4c07-57c2-08d8a66adf87
x-ms-traffictypediagnostic: TYAPR01MB6011:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB6011CB058F73222BD4B874EBD8DF0@TYAPR01MB6011.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 20MtnBmfvDhj2+OCvEpx/5kYHLzXSQOeMNE+HLHJDQ/rBpCYebViHq+iTBWeh3VywqH3oaU3J/Ry6fpjIXzU34lLcaQBHAUtd5DTxAFBNbR0zvvKta/weB2xLKb/VunlYG/6770otPVDNZXNOd+IRr/Bh4yFajz/kJUxofjAXhcP41bgrNqB7Ql1dIufPNY4S/9RAslnWjC67JYtt94Yc/vj+qIK5pGlGhoNQuxfMnx3btSyQLyoQtqghZWiXBSYLaIUvYIaKb6VqUZ65PoOrLgS+qon4YlMCBQ9xFb5tg/Ktjlj2kLrx3Ivndj9/acBr88g3aSLUYsdgX9MmXJ18ZESN0FQR7CkDJ+sS5Zw8JVNqyBq5IuXKEpIh7Mx2BZ3JEmi/DCiKg6az0nMQIiJdA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(186003)(71200400001)(33656002)(4001150100001)(4326008)(4744005)(66946007)(498600001)(66476007)(64756008)(66556008)(66446008)(76116006)(5660300002)(52536014)(2906002)(86362001)(55016002)(8676002)(7696005)(53546011)(7416002)(9686003)(110136005)(54906003)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?U09CVmtneURHUXpVVFZwODU1VzRCOUd5SXVUMWxha2NwOC90dlUwazVVYzNU?=
 =?utf-8?B?UkdsUlZleWQyRmo2QWJLRy9BZjVLVm9Rb2xPV0xrWDBiZ0tFM0tIRTc2eUJI?=
 =?utf-8?B?cVJMbVYwUkVoQ3pxZWdla3krSzFrbFZSY0M0d3VaTmNuOGJyYXZhMGVrRExY?=
 =?utf-8?B?ZWJzYTFUQnlJbFdsTXJVRFJqSElsYzVYVWdaTDl1emJBaFYzcmpCVnZUaXQy?=
 =?utf-8?B?OWpxY2VrZU9WSHBxNWxyMGdHenVlOXkwQUNkd2tEWEVUSzRxcXpoQklzY1RY?=
 =?utf-8?B?TFJOVnBNMUkyaFgwTCtIRE9LY3VScXhaa3dTZ1hkRHhOd0N5V00ya1hoTTNY?=
 =?utf-8?B?dXd6SW1tR2pGTisvMWhMUXpwczB6YVgvNkZYTTNVcmtKeGk3RGpxaGd6N0Vm?=
 =?utf-8?B?L3Z0eko1MnF0RlRlS3E0SlAxYUJzWVlkdzV0NXZBeDZFdlpKWkUrOHZWUHp5?=
 =?utf-8?B?T1JPSzFwdmhIa2c1WEVmK3NQSGFJTWlBYjE3Tm5wU0RoRk5leWVJNkRiQitJ?=
 =?utf-8?B?T1c2dGtYVUNGbjFsNHErYU5aSDY3OHBCbVdDWDN1ejJtSUNnMjM2WDZHcW52?=
 =?utf-8?B?MG45bE0zcXY0R1dHZzFmZ3pwR3U4UjVRSTVqc3NPb2pGeGY1K0tVTkhSM2tU?=
 =?utf-8?B?OFpCTUVEWVNwVmZXT0tOTVA0UWZIR3pYVEZiUWsvMlhmT3RQLzBzTFRiTWxL?=
 =?utf-8?B?cGhYYU92aTkwMkJPazgwZm5DNVREZG81U1R4V0dQTFhyOTJqRzNlWVpqYkFn?=
 =?utf-8?B?emg1SkZzc1hIbnRpNUFIcDAyZ2pRdXdFMTNhbWNKVXd6bHZCTlQwWXQvYmxW?=
 =?utf-8?B?NW8vbkFhWFFmRzJLZml4U3owZ0U0YS8xR1BBN1B3a2syQ0dQWmdGN0JlM0JC?=
 =?utf-8?B?aXNUY05ia1A2QzRDSTVQR1hjdWQ4Y0lMUlFSdWdrQzJSSjZiUi81R0FsVXl6?=
 =?utf-8?B?eGtLclc2VzFHaitEa3V6ZDlYRjhLaWZ5YXkyNHRoVUx1RHhFeDRIMlJNK3JC?=
 =?utf-8?B?bC9kOEFpZmd6dXROMzBjZEFsbWpWdUhnaFlnWUkycGRMUGkxOS9FRjZmc1hH?=
 =?utf-8?B?SEpqN0hWSTBCemk2NEpUaHRYWU56MWFCSGFmQThMNHE4QVFKMmg1OEx1cHNK?=
 =?utf-8?B?L0NkQis2OFpsa3AzMWlVTDhVSzFxQ0tCM3dmazJic3VrUVJYM3I0ZEtKVEd5?=
 =?utf-8?B?REw3bEFWNDZ2cXJaVjVLTWpvWUp0Y0krU083ZlJzR1ZTbzBUZ2lsbTBnanV3?=
 =?utf-8?B?ZnJuc3VTOEhYZmZvTXFhNnFVd0puQlJBKzdIcU9sOUkrZXF3RThJdnpqemd1?=
 =?utf-8?B?STBvbUZIY3JpMkdxeTV1VDI3dVpDeEs5VlVCSDFyVC9LVTRNeUxMY2dleUlV?=
 =?utf-8?Q?4Ebmc2Y74tQ8pCicIdv2u5+LO8jgw8Yg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6637fdb4-28b4-4c07-57c2-08d8a66adf87
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2020 11:15:21.8848
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N9cs3b8Gv/3Rsq9R6F4uKw7NFJ4H619yTRyt5bpJtfdVnLZ8qSqWodSzhinJXgzZj7deeB1eRgdJtsv/k/Yij+mfJ33lillnrby0BxVh9Y5XsoVmENuD9T9EZbrZt7U2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6011
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTWF0dGktc2FuLA0KDQo+IEZyb206IFZhaXR0aW5lbiwgTWF0dGksIFNlbnQ6IFR1ZXNkYXks
IERlY2VtYmVyIDIyLCAyMDIwIDY6MzkgUE0NCj4gDQo+IE9uIFR1ZSwgMjAyMC0xMi0yMiBhdCAw
OToyNSArMDAwMCwgWW9zaGloaXJvIFNoaW1vZGEgd3JvdGU6DQo+ID4gSGkgTWF0dGktc2FuLA0K
PiA+DQo+ID4gPiBGcm9tOiBWYWl0dGluZW4sIE1hdHRpLCBTZW50OiBUdWVzZGF5LCBEZWNlbWJl
ciAyMiwgMjAyMCA2OjE1IFBNDQo+ID4gPg0KPiA+ID4gT24gVHVlLCAyMDIwLTEyLTIyIGF0IDA5
OjQ5ICswMTAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6DQo+ID4gPiA+IE9uIE1vbiwgRGVj
IDIxLCAyMDIwIGF0IDM6NTcgQU0gWW9zaGloaXJvIFNoaW1vZGENCj4gPiA+ID4gPHlvc2hpaGly
by5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCjxzbmlwPg0KPiA+ID4gSSB0aG91Z2h0
IEkgZGlkIHJldmlldyB0aGlzIGVhcmxpZXIuLi4NCj4gPg0KPiA+IFlvdSdyZSBjb3JyZWN0LiBJ
J20gc29ycnksIEkgY29tcGxldGVseSBvdmVybG9va2VkIHlvdXIgUmV2aWV3ZWQtYnkNCj4gPiB0
YWcgaW4gcHJldmlvdXMuDQo+IA0KPiBJdCBoYXBwZW5zIDopIEJ1dCBvZiB5b3UgcmUtc3BpbiB0
aGUgc2VyaWVzLCBwbGVhc2UgcmV2aXNlIHRoZSB0YWdzIGZvcg0KPiBwYXRjaGVzLiBJIHRoaW5r
IEkgZGlkIHJldmlldyBhbG1vc3QgYWxsIG9mIHRoZW0gKGV4Y2VwdCB0aGUgU1BEWC0NCj4gcGF0
Y2hlcyBhcyBJIGFtIG5vdCBjb21wZXRlbnQgb24gbGljZW5zZXMuLi4pDQoNCkkgZ290IGl0LiBJ
J2xsIGFkZCB5b3VyIFJldmlld2VkLWJ5IHRhZ3MuDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGly
byBTaGltb2RhDQoNCg==
