Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC67E295BA5
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Oct 2020 11:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2509390AbgJVJXJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Oct 2020 05:23:09 -0400
Received: from mail-vi1eur05on2045.outbound.protection.outlook.com ([40.107.21.45]:15968
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2508296AbgJVJXI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 22 Oct 2020 05:23:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1/3XfJfSYSQiKB/ZoDn3K7Y3OG4J4jZv/CjZwHV2uvfyfpwB6Qpi4WZxPvzdD81+soldW/iD0EGzx8Ld1Aa+xoo+hF0+OotCfL6SbupmFKRDdfQR9VO97YRpfER+r1V37RuPo+tgvNtBLR4p9q7XQrW6+HIksttGx2TiaO/tDS+lc/JNpOpNJm2W0vOf2BP0w04nSXu3JY3SZ9wFUAGzDnE31axC+sV00AGsZjntfFkFvAVHfXoqvQ32n9AWyeucsiEfajocie7UJFirR0VDfrhIhHG4/bvq9+mGu1PJcml2AthrADw/Asse4r1xkUoT7j+SxC2bhpZDhkmLgothA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osoFIupw6XRYEbPb4Zv/KAZ0FaH4eusK+oSWkYhTho0=;
 b=DXCsNQp+r8gbH5AIo2o3rtNIWlwQq81+CffWCtr3igRlSLoGZ3tskIoqUXvFQc3lPGKf+BUlGowRLm/M2OFGgx6g/HHS6RwhGYfiYoiO3LY9sq4+e2AWHLPGcQPgF59R+luA07Q8LzAsNGDbwiygD/GBmp+6M+Cny2SzBVJMZfFtAOoaBYqwOuf1wlFB3Hq2DMnjRlAiewgobN4CBb9iTN93vVhUAbIi3erBPUn2kqVDns+b8SzYNBKDy5Z2Ja2RdbFFM8WsSYMtq496JTzGZTknMiUk4VpTo8ayqygopJ68fdFxnE9+5Iy+nVT7XSiZER4nbi6VIE/EGn8khD2/sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osoFIupw6XRYEbPb4Zv/KAZ0FaH4eusK+oSWkYhTho0=;
 b=XRwzD9JrLEBzLcSnCXqALE1iHDA4YHiQq2CP0tAW1u3tkgGsg9jkLz68z7F78cXjbjJV1oEVoA91KU/Sx2YuGzH7BBQLcVMK5nu8PTOBMhnANZ/coXlr5vPLc12mPiimMCHEza1T6gM03vVBCk68daEtP35POCCVkVyonDcMqnw=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0302MB2761.eurprd03.prod.outlook.com (2603:10a6:3:f0::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21; Thu, 22 Oct 2020 09:23:02 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::b813:5aaa:3d25:f976]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::b813:5aaa:3d25:f976%3]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 09:23:02 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "joe@perches.com" <joe@perches.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "trix@redhat.com" <trix@redhat.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "apw@canonical.com" <apw@canonical.com>
Subject: Re: [PATCH] gpio: bd70528: remove unneeded break
Thread-Topic: [PATCH] gpio: bd70528: remove unneeded break
Thread-Index: AQHWpk7PU2Dv45hS80+h/uWqZCrO16mgRR4AgAAcGwCAAHIBAIAA1tWAgAB5ToCAATnlgA==
Date:   Thu, 22 Oct 2020 09:23:02 +0000
Message-ID: <65956cfbd9ac04f312a13b291985eb1ad03e6038.camel@fi.rohmeurope.com>
References: <20201019193353.13066-1-trix@redhat.com>
         <5b13773306265f89366b86afba71d2b4a4130e2b.camel@fi.rohmeurope.com>
         <0738b0cc482cfd07400cf8b0b0b2092e671cfb34.camel@fi.rohmeurope.com>
         <b435953eed76b9247a4b1dab88f268afe76ff470.camel@perches.com>
         <db6856d5431aac3ff56cd3817312d204c41cf7d0.camel@fi.rohmeurope.com>
         <42c1d07d46655f622c081f45b68ccaffba7361a1.camel@perches.com>
In-Reply-To: <42c1d07d46655f622c081f45b68ccaffba7361a1.camel@perches.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: perches.com; dkim=none (message not signed)
 header.d=none;perches.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [176.93.64.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d5b8667-8001-44ed-71bb-08d8766c135c
x-ms-traffictypediagnostic: HE1PR0302MB2761:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0302MB27610E08C3230611724088B5AD1D0@HE1PR0302MB2761.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ikc8P7DmV5weFMxDBbhKGlGjifEJ2beHySEr+hqZRtfT1TmLy4awDLPrhrGznWOvJrskGQXNXYFroJ/uFmBbUQYLMSvzAP50bz1Tj4aaBpv3a3u2WI4GT3G/pc8Sy5I3kTNgjk8IqCE8gsWsF+MhE/RGXmHx10498kslBYs3fJhstZCWS3Vx1z1zRopLD2JczpwC59saViIxgTVT4mHbI3O2ZkGr9aA1sEunDT5q+07Fu5LeP1+6EO0o/OPBA2wajzq3zo1vf7jS4F4DhsEkLj3DKKKVt0l3e8azrYZy7PbxOMK6zhHCHrEtKyIflXvdVtDZMg8nCCdNDXjwcrSp4RW49X7vKlPajxGGT8lXFTzzQxzXm6PzHnaS3wo8jiPGFvZgZWhpDuwImasdblV9/w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(39850400004)(396003)(4001150100001)(3450700001)(6512007)(86362001)(478600001)(5660300002)(110136005)(54906003)(2906002)(316002)(83380400001)(966005)(26005)(71200400001)(8676002)(66446008)(76116006)(64756008)(66556008)(66946007)(8936002)(6486002)(6506007)(4326008)(186003)(66476007)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: EvQkjT8BVtP6A02Kqeoe84YnQ3H3C2mtH7Vmb2MlfBkB9uQfIhoM/hsfOIEXhNtqUNZtUVrLn4FvPMV2vVTri6SEgNmytUESFuOxRob9+golyEW8KEh91FX2FcYfgchwdgO6hYoD/UGNsCItmdMNiy8x1UJs64G6haMeBM+VhPuyjl7T8aHaU4zXbZ7y22kh7Fdu0zT592aMNFRVJ+xLs6ZxFM8ybY9OCSSAlowF0XXqoEhxTgZYkHrMd1snM+7C6VPHPU3evYOwqu2mGzpQwX4sam1Lfe/y4M+f4ftg3yK6VDbqGGJzrQ+Kr+VTcL+yFSXnGDJVNmMtflnEOGTO68SwXpRjTjuQasGy0iSYNrQTm8aorAfeH++tqEVsd8lRZTbAsnHDgqD4I2GlwqeJ6wGnzNNd7HZ2CtzI1TAsK30VfoVUBUAdy3mPlvV9SZsrAQ+hQhlfV2/x25SaCo4joDmBllGrjGXS7oCDUrSdPjL/EYYRUCLwBvjpI3PKl5XIvQHiFuplzccoD3sJyd4Mk2iQXpaAvNmJ63NkpnZUoU/od8lHHGiOp6qxBf1VEs7BuqtCLgXN1cw51+amLo6Wz/LOWT0RktpVbih71HqRM5QFgi6PViyRs6U9l26QPYm1KI/Gmd+24Y+l5g/Fb22uOQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B1E00A0392A634C97C366CDB2F5DC1B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d5b8667-8001-44ed-71bb-08d8766c135c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2020 09:23:02.5726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LtOdEzj2REkOfOlbfITRih6V1AtN/YXMN/EyNgER8i1szwzoOKZQXaomtNCJRgFR25HCu/xW22yOUVlkwIaiKf0syi2bFRsbqxRuHH4hn1+4Uq8rqtmpvmpPvdd5pauJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2761
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8sDQoNCk9uIFdlZCwgMjAyMC0xMC0yMSBhdCAwNzozOSAtMDcwMCwgSm9lIFBlcmNoZXMg
d3JvdGU6DQo+IE9uIFdlZCwgMjAyMC0xMC0yMSBhdCAwNzoyNSArMDAwMCwgVmFpdHRpbmVuLCBN
YXR0aSB3cm90ZToNCj4gPiBIZWxsbyBKb2UgJiBBbGwsDQo+ID4gT24gVHVlLCAyMDIwLTEwLTIw
IGF0IDExOjM2IC0wNzAwLCBKb2UgUGVyY2hlcyB3cm90ZToNCj4gPiA+IE9uIFR1ZSwgMjAyMC0x
MC0yMCBhdCAxMTo0OCArMDAwMCwgVmFpdHRpbmVuLCBNYXR0aSB3cm90ZToNCj4gW10NCj4gPiA+
ID4gQW5kIGZvciBwZWVwcyB3aG8gaGF2ZSBub3QgYmVlbiBmb2xsb3dpbmcgLSBmb2xsb3dpbmcg
ZnVuY3Rpb24NCj4gPiA+ID4gdHJpZ2dlcnMgdGhlIGNoZWNrcGF0Y2ggZXJyb3IgYWJvdmU6DQo+
ID4gPiANCj4gPiA+IEh1aD8gIHdoYXQgdmVyc2lvbiBvZiBjaGVja3BhdGNoIGFyZSB5b3UgdXNp
bmc/DQo+ID4gPiBTZW5kIGl0IHRvIG1lIHBsZWFzZS4NCj4gW10NCj4gPiBQbGVhc2UgZmluZCBt
eSB2ZXJzaW9uIG9mIGNoZWNrcGF0Y2ggYW5kIHRoZSBwYXRjaCB0byB0cmlnZ2VyIHRoZQ0KPiA+
IHdhcm5pbmcgYXR0YWNoZWQuDQo+IA0KPiBUaGFua3MuICBUaGlzIHRlc3Qgd2Fzbid0IHBhcnRp
Y3VsYXJseSB1c2VmdWwNCj4gKGFuZCBoYWQgc29tZSBmYWxzZSBwb3NpdGl2ZXMpIGFuZCB3YXMg
cmVtb3ZlZCBieQ0KPiANCj4gY29tbWl0IGVmM2MwMDVjMGViMDdhNjA5NDkxOTFiYzZlZTQwN2Q1
ZjQzY2M1MDINCj4gQXV0aG9yOiBKb2UgUGVyY2hlcyA8am9lQHBlcmNoZXMuY29tPg0KPiBEYXRl
OiAgIFR1ZSBBdWcgMTEgMTg6MzU6MTkgMjAyMCAtMDcwMA0KPiANCj4gICAgIGNoZWNrcGF0Y2g6
IHJlbW92ZSBtaXNzaW5nIHN3aXRjaC9jYXNlIGJyZWFrIHRlc3QNCj4gICAgIA0KPiAgICAgVGhp
cyB0ZXN0IGRvZXNuJ3Qgd29yayB3ZWxsIGFuZCBuZXdlciBjb21waWxlcnMgYXJlIG11Y2ggYmV0
dGVyDQo+ICAgICBhdCBlbWl0dGluZyB0aGlzIHdhcm5pbmcuDQo+ICAgICANCj4gICAgIFNpZ25l
ZC1vZmYtYnk6IEpvZSBQZXJjaGVzIDxqb2VAcGVyY2hlcy5jb20+DQo+ICAgICBTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPg0KPiAgICAgQ2M6
IENhbWJkYSBaaHUgPGNhbWJkYUBsaW51eC5hbGliYWJhLmNvbT4NCj4gICAgIExpbms6IA0KPiBo
dHRwOi8vbGttbC5rZXJuZWwub3JnL3IvN2UyNTA5MGM3OWY2YTY5ZDUwMmFiODIxOTg2MzMwMDc5
MDE5MmZlMi5jYW1lbEBwZXJjaGVzLmNvbQ0KPiAgICAgU2lnbmVkLW9mZi1ieTogTGludXMgVG9y
dmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPg0KPiANCg0KVGhhbmtzIGZvciBj
aGVja2luZyB0aGlzIEpvZSENCkFuZCBub3RlIHRvIHNlbGYgLSBhbHdheXMgY2hlY2sgd2l0aCBu
ZXdlc3Qga2VybmVsLi4uIDspDQoNCihTb3JyeSBmb3IgYm90aGVyaW5nKQ0KDQpCciwNCglNYXR0
aSBWYWl0dGluZW4NCg0K
