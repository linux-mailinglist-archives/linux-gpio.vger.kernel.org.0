Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B41A0290636
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Oct 2020 15:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405588AbgJPNWu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Oct 2020 09:22:50 -0400
Received: from mail-eopbgr1400122.outbound.protection.outlook.com ([40.107.140.122]:28030
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2405416AbgJPNWu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 16 Oct 2020 09:22:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NoUoBYel81pe8saFxUpRhjt19Snobh8OYjTpdTH36Ejl9FMLxoUEdvXEnnHf8hExD4fzPb5IPrVdhuaJ/1gb4+L86Bicx11PBOwwvDQzSl5aP2Mujc2T1LPCjbK0ki7PKLFRfB3TNBf5pEE8FoWKzBxD9DpvpeJfuIh/FxooK53wzB0LmEgxcPVWE+jzrO764sBZSagYz2fsMwRUASnJxifIXxbatFbA5E9Muoffc5hSKu0A9kk7iUHzJxuaWtpfo7O1RQrRbE8iYTHbn7DqHg4e1V/EKzqG5F4nKqCOxB8/oKBCjV4EJRil0/GZ0mtnn7NTIKYnFptNq8uIAKSODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHc8smy33XzElR65vWsuojJbhD4gJmJH8dHY6E5wptk=;
 b=Ky9Y4/wWsheG30893WoCKFAAk9CWImmtFRldaBBKIOqF3M3u0Fj1TWn/BOpqizyfhHeoameW2SNIDf1cWK4sn9oPhIDdpzQgfjSWsF3KZSrNeINVU13AWfPTnZu1otvo8puKHdTS7L7XpNR0g3R7kR9NZ86Y6nkkkLZ6keLZ7WpvRPDFrEGPvkkl9Yth91RUwfHuMJll5hJ1iebrI38AdYO3r4sOBtgg06pZv96g4+/YGoEE1nN1U/lap2pPGQRuBGMdkYuUXX+LgmUZzdO7nJecsQrioyNXd3/dHakgmgtIswY0DOG3yMC3ihR2q1ASx30ETgRkFfb8LMlNGYwC6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHc8smy33XzElR65vWsuojJbhD4gJmJH8dHY6E5wptk=;
 b=qNR6OHeQdWCVLoolok3KFgphERx5l6N+myU3+a2Fduacc/v+ihi+iIhBB0w57+jc0wvUz5sWhhjnVftpLvyEGUVd2MqV3BxxmwBU7e4FE+364JlK+cL0dF5hytkJ1CkwtO9APdAUNKt+TFbj2s22UHKmE2L9R0hRlT69M8GtFHI=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TYAPR01MB5402.jpnprd01.prod.outlook.com
 (2603:1096:404:8042::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Fri, 16 Oct
 2020 13:22:45 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84%4]) with mapi id 15.20.3477.022; Fri, 16 Oct 2020
 13:22:45 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH RFC] pinctrl: sh-pfc: pfc-r8a77965: Optimize pinctrl image
 size for RZ/G2N
Thread-Topic: [PATCH RFC] pinctrl: sh-pfc: pfc-r8a77965: Optimize pinctrl
 image size for RZ/G2N
Thread-Index: AQHWohmLcibFjT1OxE6VhzhPmjS++KmY4YoAgAFYhqA=
Date:   Fri, 16 Oct 2020 13:22:45 +0000
Message-ID: <TYBPR01MB53095E12035D8FCBC13F699386030@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20201014110238.9600-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWzaPnzs5WBqQz2b2R121TGahx-OzF3v9YjvSm+03SmiA@mail.gmail.com>
In-Reply-To: <CAMuHMdWzaPnzs5WBqQz2b2R121TGahx-OzF3v9YjvSm+03SmiA@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 4f318e62-1998-4f53-14e3-08d871d691a0
x-ms-traffictypediagnostic: TYAPR01MB5402:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB54021FA479A61A56638A9A0C86030@TYAPR01MB5402.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: myvnpgZssfIBB+aRKMrWVSSiuLSCPIDSR5XPSZLQmcKfpd/H4gMGP3O4/KvB7smVhnOT26tqkhxaZfg5NHs4dAgJtt0Mx1LHxW0sK23AnMJDlNGbx0U/a9PBofpHLIJej7N/r1+FP+Lb+a2nAFuOF9gyDcR0ZFIA3rVtV0qd2Qp37GeC6+sKfb7MQbrkXRdMkINBLRx0HRXa6/yjlpCaz7U7ooprybjUGdhFmXbZ1/H36RCX4+YhEojJw2Ru0POdWUOBHhSm8GNKTel+qsEkImRSZuHCnSijYdusW993jxRGncQGwt0FCet/AE5iF+rDgaZrmCkbeh2NlR3KvsUC+1Dv9X+pqH0DYvZFHrVFvC2coP10xRrf9GV6IFEaYLEVPkCKRdxSahAl9bEj4oB9bQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(5660300002)(66946007)(54906003)(9686003)(966005)(55016002)(33656002)(478600001)(6916009)(86362001)(107886003)(316002)(76116006)(26005)(2906002)(186003)(52536014)(71200400001)(66556008)(66476007)(7696005)(8676002)(64756008)(66446008)(4326008)(8936002)(83380400001)(53546011)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: mGTUJkORGYOEL6JxT/ma4v7Hc5F/4CKYe4+Uzwr7vpGG94sACxlNqY6aAiCO2BXUDI5noXG0w4T4gHHUCah7HFrBCIEGAx3YpMdts88CX+Nw/dMfwTqAO2SwjiaQpNJQcbp0fDxdxsDv57+QzMrFPF8q4MERDc77pOj/cuinlqDL0WrdoGc1qft8ZzSdltcKKG8rQaT5gEXbOXRKu24Y4GnmNQ/Os3L5Xo4TbOBdEdNVv9You/V6Fzv2IwHdqg/2N334SJUKs+ag71ttCXDRPSfWbTe/HCCxa5wmCIG5MSF+1lp/miM68ZABvK4ZCO110ARIExPqXqOfqTj6iMEIvHbG52qb7h4FLSehYS0sYJnsszOd28JUlpoIEZEkW76QCvTLykWs3+IdYNtG5wCV4u3zYTTS0q+9xU8Z1nQFvGN9WYKjA+6p2a3OE/pGad7H0ATEMiHTgusWJSJ5Jl3mbsQCPq91PsyDXqBaf4OE3MqHfyxmt0vKQYsJyv7I6fr12suTiLMxeeI+jc2bz4xmoy5qxlxDWyekAaNl/7e4YYd2SN6C1fULUrMOZ4aRsL5ivv1begM1nLbnoMFHeaJkQwYvV+obb/YI7KfmfFZmRq3p1uyocJgLMIdyFNaxcyXEBZRWSc3m58zx7iEDYswufw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f318e62-1998-4f53-14e3-08d871d691a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2020 13:22:45.1350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0OkX8Z0DMo35gXec8c/qK/fdJeyuTs7GtnUGmHmr0m9kT3r47EsEe7u6ViphTcYGjCNq3UyZ3MP52bcmDudSJzAD/u/OGyZvZPTJCUPK/RY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5402
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggUkZDXSBwaW5jdHJsOiBzaC1wZmM6IHBmYy1yOGE3Nzk2NTogT3B0aW1pemUgcGluY3Ry
bCBpbWFnZQ0KPiBzaXplIGZvciBSWi9HMk4NCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBXZWQs
IE9jdCAxNCwgMjAyMCBhdCAxOjAyIFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2Fz
LmNvbT4NCj4gd3JvdGU6DQo+ID4gT3B0aW1pemUgcGluY3RybCBpbWFnZSBzaXplLCB3aGVuIG9u
bHkgUlovRzJOIGlzIGVuYWJsZWQgaW4gdGhlIGRlZmNvbmZpZy4NCj4gPiAoaWUsIGRpc2FibGlu
ZyBDT05GSUdfQVJDSF9SOEE3Nzk2NSBmcm9tIHRoZSBkZWZjb25maWcpDQo+ID4NCj4gPiB3aXRo
IHRoaXMgcGF0Y2ggYW5kIGRpc2FibGluZyBDT05GSUdfQVJDSF9SOEE3Nzk2NToNCj4gPiAkIHNp
emUgZHJpdmVycy9waW5jdHJsL3NoLXBmYy9wZmMtcjhhNzc5NjUubw0KPiA+ICAgIHRleHQgICAg
ZGF0YSAgICAgYnNzICAgICBkZWMgICAgIGhleCBmaWxlbmFtZQ0KPiA+ICAgNDkzODQgICAgICAg
MCAgICAgICAwICAgNDkzODQgICAgYzBlOCBkcml2ZXJzL3BpbmN0cmwvc2gtcGZjL3BmYy1yOGE3
Nzk2NS5vDQo+ID4NCj4gPiB3aXRob3V0IHBhdGNoOg0KPiA+ICQgc2l6ZSBkcml2ZXJzL3BpbmN0
cmwvc2gtcGZjL3BmYy1yOGE3Nzk2NS5vDQo+ID4gICAgdGV4dCAgICBkYXRhICAgICBic3MgICAg
IGRlYyAgICAgaGV4IGZpbGVuYW1lDQo+ID4gICA1MTg0OCAgICAgICAwICAgICAgIDAgICA1MTg0
OCAgICBjYTg4IGRyaXZlcnMvcGluY3RybC9zaC1wZmMvcGZjLXI4YTc3OTY1Lm8NCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
DQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tDQo+ID4gVGhpcyBwYXRjaCB3
aWxsIHNhdmUgfiA2S0I9KDN4IDJLQi9Tb0MpIG9mIG1lbW9yeSBvbiBSWi9HMltITU5dDQo+ID4g
dS1ib290WzFdIHdpdGggbXVsdGkgZHRiIHN1cHBvcnQuIEFzIHBlciBkaXNjdXNzaW9uIFsxXSwg
dS1ib290IGltcG9ydHMgUEZDDQo+IGFuZCBDbG9jayB0YWJsZXMgZnJvbSBMaW51eC4NCj4gPg0K
PiA+IFsxXQ0KPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC91Ym9vdC9w
YXRjaC8yMDIwMTAxMzA4NTIwNS42MDc1LQ0KPiA0DQo+ID4gLWJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tLw0KPiA+DQo+ID4gMSkgQnkgY29tcGlsaW5nIG91dCBBdXRvbWF0aXZlIHBhcnRzDQo+
ID4gJCBzaXplIGRyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BmYy1yOGE3Nzk2NS5vDQo+ID4gICAg
dGV4dCAgICBkYXRhICAgICBic3MgICAgIGRlYyAgICAgaGV4IGZpbGVuYW1lDQo+ID4gICA0NjE0
MSAgICAgICAwICAgICAgIDAgICA0NjE0MSAgICBiNDNkIGRyaXZlcnMvcGluY3RybC9yZW5lc2Fz
L3BmYy1yOGE3Nzk2NS5vDQo+ID4NCj4gPiAyKSB3aXRob3V0IHBhdGNoDQo+ID4gJCBzaXplIGRy
aXZlcnMvcGluY3RybC9yZW5lc2FzL3BmYy1yOGE3Nzk2NS5vDQo+ID4gICAgdGV4dCAgICBkYXRh
ICAgICBic3MgICAgIGRlYyAgICAgaGV4IGZpbGVuYW1lDQo+ID4gICA0ODE5MSAgICAgICAwICAg
ICAgIDAgICA0ODE5MSAgICBiYzNmIGRyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BmYy1yOGE3Nzk2
NS5vDQo+ID4NCj4gPiBQbGVhc2Ugc2hhcmUgeW91ciBjb21tZW50cy4NCj4gDQo+IFRoaXMgbG9v
a3Mgd29ydGh3aGlsZSB0byBtZSwgYWxzbyBmb3Igb3RoZXIgU29Dcy4NCg0KT0suDQoNCj4gPiAt
LS0gYS9kcml2ZXJzL3BpbmN0cmwvc2gtcGZjL3BmYy1yOGE3Nzk2NS5jDQo+ID4gKysrIGIvZHJp
dmVycy9waW5jdHJsL3NoLXBmYy9wZmMtcjhhNzc5NjUuYw0KPiA+IEBAIC0xOCw2ICsxOCwxNCBA
QA0KPiA+ICAjaW5jbHVkZSAiY29yZS5oIg0KPiA+ICAjaW5jbHVkZSAic2hfcGZjLmgiDQo+ID4N
Cj4gPiArI2lmZGVmIENPTkZJR19QSU5DVFJMX1BGQ19SOEE3Nzk2NQ0KPiA+ICsjZGVmaW5lIFBG
Q19SOEE3Nzk2NV9HUk9VUCAgICAgKDMwKQ0KPiA+ICsjZGVmaW5lIFBGQ19SOEE3Nzk2NV9GVU5D
VElPTiAgKDQpDQo+ID4gKyNlbHNlDQo+ID4gKyNkZWZpbmUgUEZDX1I4QTc3OTY1X0dST1VQICAg
ICAoMCkNCj4gPiArI2RlZmluZSBQRkNfUjhBNzc5NjVfRlVOQ1RJT04gICgwKQ0KPiA+ICsjZW5k
aWYNCj4gDQo+IFdoaWxlIGludHJvZHVjaW5nIHRoZSBkZWZpbml0aW9ucyBhYm92ZSByZWR1Y2Vz
IHRoZSBvdmVyYWxsIG51bWJlciBvZg0KPiAjaWZkZWZzIHNsaWdodGx5LCBpdCBpbmNyZWFzZXMg
c2VwYXJhdGlvbiBiZXR3ZWVuIHRoZSBudW1iZXJzICgzMCBhbmQgNCkgYW5kDQo+IHRoZSBkYXRh
IHRoZXkgcmVwcmVzZW50Li4uDQo+IA0KT0suIFdpbGwgdGFrZSB0aGlzIG91dC4NCg0KDQo+ID4g
Kw0KPiA+ICAjZGVmaW5lIENGR19GTEFHUyAoU0hfUEZDX1BJTl9DRkdfRFJJVkVfU1RSRU5HVEgg
fA0KPiA+IFNIX1BGQ19QSU5fQ0ZHX1BVTExfVVBfRE9XTikNCj4gPg0KPiA+ICAjZGVmaW5lIENQ
VV9BTExfR1AoZm4sIHNmeCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwNCj4gPiBAQCAtMTg0Nyw2ICsxODU1LDcgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGlu
dCBjYW5mZDFfZGF0YV9tdXhbXSA9IHsNCj4gPiAgICAgICAgIENBTkZEMV9UWF9NQVJLLCAgICAg
ICAgIENBTkZEMV9SWF9NQVJLLA0KPiA+ICB9Ow0KPiA+DQo+ID4gKyNpZmRlZiBDT05GSUdfUElO
Q1RSTF9QRkNfUjhBNzc5NjUNCj4gPiAgLyogLSBEUklGMA0KPiA+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAqLyAgc3RhdGlj
IGNvbnN0DQo+IHVuc2lnbmVkIGludCBkcmlmMF9jdHJsX2FfcGluc1tdID0gew0KPiA+ICAgICAg
ICAgLyogQ0xLLCBTWU5DICovDQo+ID4gQEAgLTIxMjAsNiArMjEyOSw3IEBAIHN0YXRpYyBjb25z
dCB1bnNpZ25lZCBpbnQgZHJpZjNfZGF0YTFfYl9waW5zW10gPQ0KPiA+IHsgIHN0YXRpYyBjb25z
dCB1bnNpZ25lZCBpbnQgZHJpZjNfZGF0YTFfYl9tdXhbXSA9IHsNCj4gPiAgICAgICAgIFJJRjNf
RDFfQl9NQVJLLA0KPiA+ICB9Ow0KPiA+ICsjZW5kaWYNCj4gPg0KPiA+ICAvKiAtIERVDQo+ID4g
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+ID4gKi8gIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgZHVfcmdiNjY2
X3BpbnNbXSA9IHsgQEAgLTQzODAsNyArNDM5MCw3DQo+ID4gQEAgc3RhdGljIGNvbnN0IHVuc2ln
bmVkIGludCB2aW41X2Nsa19tdXhbXSA9IHsNCj4gPg0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0
IHsNCj4gPiAgICAgICAgIHN0cnVjdCBzaF9wZmNfcGluX2dyb3VwIGNvbW1vblszMThdOw0KPiA+
IC0gICAgICAgc3RydWN0IHNoX3BmY19waW5fZ3JvdXAgYXV0b21vdGl2ZVszMF07DQo+ID4gKyAg
ICAgICBzdHJ1Y3Qgc2hfcGZjX3Bpbl9ncm91cCBhdXRvbW90aXZlW1BGQ19SOEE3Nzk2NV9HUk9V
UF07DQo+IA0KPiBIZW5jZSBJJ20gbW9yZSBpbmNsaW5lZCB0byBqdXN0IGRvOg0KPiANCj4gICAg
ICsjaWZkZWYgQ09ORklHX1BJTkNUUkxfUEZDX1I4QTc3OTY1DQo+ICAgICAgICAgICAgIHN0cnVj
dCBzaF9wZmNfcGluX2dyb3VwIGF1dG9tb3RpdmVbMzBdOw0KPiAgICAgKyNlbmRpZg0KPiANCj4g
aGVyZSwgYW5kIG1vdmUgdGhlICNpZmRlZi8jZW5kaWYgYWNjb3JkaW5nbHkuDQoNCk9LLg0KDQo+
ID4gIH0gcGlubXV4X2dyb3VwcyA9IHsNCj4gPiAgICAgICAgIC5jb21tb24gPSB7DQo+ID4gICAg
ICAgICAgICAgICAgIFNIX1BGQ19QSU5fR1JPVVAoYXVkaW9fY2xrX2FfYSksIEBAIC00NzAzLDYg
KzQ3MTMsNyBAQA0KPiA+IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgew0KPiA+ICAgICAgICAgICAgICAg
ICBTSF9QRkNfUElOX0dST1VQKHZpbjVfY2xrKSwNCj4gPiAgICAgICAgIH0sDQo+ID4gICAgICAg
ICAuYXV0b21vdGl2ZSA9IHsNCj4gPiArI2lmZGVmIENPTkZJR19QSU5DVFJMX1BGQ19SOEE3Nzk2
NQ0KPiA+ICAgICAgICAgICAgICAgICBTSF9QRkNfUElOX0dST1VQKGRyaWYwX2N0cmxfYSksDQo+
ID4gICAgICAgICAgICAgICAgIFNIX1BGQ19QSU5fR1JPVVAoZHJpZjBfZGF0YTBfYSksDQo+ID4g
ICAgICAgICAgICAgICAgIFNIX1BGQ19QSU5fR1JPVVAoZHJpZjBfZGF0YTFfYSksIEBAIC00NzMz
LDYgKzQ3NDQsNyBAQA0KPiA+IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgew0KPiA+ICAgICAgICAgICAg
ICAgICBTSF9QRkNfUElOX0dST1VQKGRyaWYzX2N0cmxfYiksDQo+ID4gICAgICAgICAgICAgICAg
IFNIX1BGQ19QSU5fR1JPVVAoZHJpZjNfZGF0YTBfYiksDQo+ID4gICAgICAgICAgICAgICAgIFNI
X1BGQ19QSU5fR1JPVVAoZHJpZjNfZGF0YTFfYiksDQo+ID4gKyNlbmRpZg0KPiA+ICAgICAgICAg
fQ0KPiA+ICB9Ow0KPiANCj4gU2FtZSBmb3IgdGhlIGZ1bmN0aW9ucy4NCg0KT0suIFdpbGwgc2Vu
ZCBwYXRjaGVzIHdpdGggYWJvdmUgY2hhbmdlcy4NCg0KVGhhbmtzLA0KQmlqdQ0K
