Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5095C295EB1
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Oct 2020 14:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898490AbgJVMjg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Oct 2020 08:39:36 -0400
Received: from mail-eopbgr1410098.outbound.protection.outlook.com ([40.107.141.98]:37045
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2898321AbgJVMh7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 22 Oct 2020 08:37:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAnD9s6fKP5pUNKRHAJgEoH1i4HfTGzjVlIPavbPlNVu+Q2zqgS5CqiqJS9CJb/Nmixao5jy3mZrYR5/ADJEwi0IKe+bAWM+/UzFIW7cKVJ2eVopylnSwv50qqLDzexesYv2ylZWnYLKFAo1t/LeFZmnwdhsRg181dsLFOn0Au5j4CHDKm+S4ULr5ktt4bsuEpZv86hBiWXcMwB334NWNLfk+3MQtbQm6oIuSbUYGE7sG+qWi/loTyr7A4Nqmf4Nm8GO9mm1luo3t6SgJmxZztS/deEYDTFQgrNi2qE1n840Nwz5RAm0RNGbj7//NBIAMbsE+Xki0HZ+yomaX07pTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qj/Yx/tHB1iuQhmy7lR7dsm05UcbfBmEGwl0c0oCQPw=;
 b=AzGFw6wUQqdQnxVEMyh59gChysGVv4TcpAzTek7ChvW9dsnxN9rz9vgRDyEmuBf9wZYS5NgG2bCEGQem5rEyF4saseyXuATO4PxO3zT47DZGLX9j/sx62nG9YgWoIIM8ds3cu4xexb+miuPSJiDmp3At+Nuq+8rOJKUR0ZuKPWlrmx8Z+sB9+gd2ekbnRSCWJ43qu+895JVP8T5ulOeIMKe4hsWF2uLMiLwsAfvXRfzyYTN6QCjDvxOQLFv9dIiFiEDy0JRTLRVRQ7gy9B2lYNAISNEJ2Km+po0YpRAuAgDh+RtVxX/BLMPnsZ8GcKfKd3chg8ijbIzBqMUNjl5KuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qj/Yx/tHB1iuQhmy7lR7dsm05UcbfBmEGwl0c0oCQPw=;
 b=qaN68stiFG75UUXKT7/h5656qDbOEN5L51IE7wCRb23miJLTtPF1WyTW+NQFtb35CjPBfFzuTzYyyEiQxLx5GQUKOq7zQ1zpqpRMqZI8lmKbxOeqLYBKFf1FkdtlS9uY/7Rzz05ydxnQ0DsiMTyQIEDlKFmq556tG2+5EUpjsxU=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TY1PR01MB1513.jpnprd01.prod.outlook.com
 (2603:1096:403:2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Thu, 22 Oct
 2020 12:37:56 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84%4]) with mapi id 15.20.3499.018; Thu, 22 Oct 2020
 12:37:55 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/6] pinctrl: renesas: r8a77951: Optimize pinctrl image
 size for R8A774E1
Thread-Topic: [PATCH 1/6] pinctrl: renesas: r8a77951: Optimize pinctrl image
 size for R8A774E1
Thread-Index: AQHWphVlINIZ63V8T0SERt4DobullKmjibOAgAAKS0A=
Date:   Thu, 22 Oct 2020 12:37:55 +0000
Message-ID: <TYBPR01MB5309EB866792415BB2455F16861D0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20201019124258.4574-1-biju.das.jz@bp.renesas.com>
 <20201019124258.4574-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdUkDYiXDwhy_6SiOetGW43hdFOjzsDVYD2aXU3UsgT8Ag@mail.gmail.com>
In-Reply-To: <CAMuHMdUkDYiXDwhy_6SiOetGW43hdFOjzsDVYD2aXU3UsgT8Ag@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 34ce33ff-ffd5-48e9-823b-08d876874d21
x-ms-traffictypediagnostic: TY1PR01MB1513:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1513D37FC2D7128799B17609861D0@TY1PR01MB1513.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DclcMNXWG6/lcE8cThPpiLhUfi8Ta2w5Uhdrd0wA9ltyBJerOLvAGezoc7kJAbHwvYVGDw4wV3c73Jdea/hsLGvpej2iV0rO4lK9ySdGb30LV0UZezlK4cW5OkJodMEete5ilkdEJ0gTJ8ylZSYngEjzpYN6AOdMKXDkJ98XaB+FpCowl8AKwKWIqFFAQa+lKxQq2Ek+BbTfGDYRX4Rnuy0jhH8qjlXx16cu6zXzoW6WIq4ffR0wHUuyUfFZtWlj9r977BpwyoUJgWhGu2D04saws9ZISQHJKEhf4dcTYjQE7Qmw7pUnqZgeeM0+DyQ/Swz5KuvG6/5dWZR7MupmYg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(52536014)(86362001)(9686003)(26005)(54906003)(478600001)(76116006)(5660300002)(6916009)(7696005)(53546011)(6506007)(316002)(66946007)(71200400001)(33656002)(66476007)(8936002)(186003)(83380400001)(66556008)(64756008)(66446008)(8676002)(2906002)(4326008)(107886003)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Jt2VNCWYYegROEqEOodN/IK1KWX7faO3L99KjAiLshostVhPL2W7Jp7yPgtBX6CG4BfJlu6zMyZeXAICW1l4m58knGvM4rYtrj2EXx2BlVDyEELkW33xHVjux/JLgubOftB+qnvo4MJiai0jdrD8sws7uWWWTDX0LtttbXTN1ZJi8e5ssr/5xjuR/8OsglesFrvssOjIHsjIvKeecXlFfY+hpb8Ef+6/RYJT0ffB6ycezOQUuRmmSe5we2SvU52hyhoZ25vXz0ATYlykpr2Ip55hVRYRoVuVQ1xxOQS/ymWGx/Kr4D6pFEhYcVko78oiNg8CHMFHWaigvnJ2wC63pWMAxp+W7M65cCCtH0kG+RuNY/zrA/bT5nnENQHJ+y34qkHZGJnmyvUIht/rdkUFHS+UU+eQAlHP+TceVt0Wdhsg/eiPavPz2+hbPpoGBhHZnDs4aKt8ulY9UEu6m+lwKjsGousB2DilIQBC5Y8a8mOk4yf1/baX1rzUEwoegsytW7TebwdSD6lAl701DGZEiurlj53N3CMHt1gXy7gTa20/IPtyVzzUwtA8Ajalysnm0ik5vJ4DlznWIAcraOPNB9CadARL9qz7U04PPKXoLlyWK6ERstndnYlEUWel4kUe4Yvwgdb4grq7v17CXuIF4w==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ce33ff-ffd5-48e9-823b-08d876874d21
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2020 12:37:55.9071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WHgfc0C23UhzC/gFGj/fpdvyA3oYh37xJIuXiUPmHJsmqcuG4PstRwZZyI01ROCi5Yy9rTEy0aoWaQgV6TlR6UaVypNtvd71KACXiKI4ph8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1513
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzZdIHBpbmN0cmw6IHJlbmVzYXM6
IHI4YTc3OTUxOiBPcHRpbWl6ZSBwaW5jdHJsIGltYWdlDQo+IHNpemUgZm9yIFI4QTc3NEUxDQo+
IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gTW9uLCBPY3QgMTksIDIwMjAgYXQgMjo0MyBQTSBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IFRoaXMgZHJp
dmVyIHN1cHBvcnRzIGJvdGggUlovRzJIIGFuZCBSLUNhciBIMyhSOEE3Nzk1MSkgU29DJ3MuDQo+
ID4gT3B0aW1pemUgcGluY3RybCBpbWFnZSBzaXplIGZvciBSWi9HMkgsIHdoZW4gUi1DYXIgSDMo
UjhBNzc5NTEpIFNvQyBpcw0KPiA+IGRpc2FibGVkIGluIHRoZSBkZWZjb25maWcuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+
IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvcGluY3Ry
bC9yZW5lc2FzL3BmYy1yOGE3Nzk1MS5jDQo+ID4gKysrIGIvZHJpdmVycy9waW5jdHJsL3JlbmVz
YXMvcGZjLXI4YTc3OTUxLmMNCj4gPiBAQCAtMTgyNyw2ICsxODI3LDcgQEAgc3RhdGljIGNvbnN0
IHVuc2lnbmVkIGludCBjYW5mZDFfZGF0YV9tdXhbXSA9IHsNCj4gPiAgICAgICAgIENBTkZEMV9U
WF9NQVJLLCAgICAgICAgIENBTkZEMV9SWF9NQVJLLA0KPiA+ICB9Ow0KPiA+DQo+ID4gKyNpZmRl
ZiBDT05GSUdfUElOQ1RSTF9QRkNfUjhBNzc5NTENCj4gPiAgLyogLSBEUklGMA0KPiA+IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LSAqLyAgc3RhdGljIGNvbnN0DQo+IHVuc2lnbmVkIGludCBkcmlmMF9jdHJsX2FfcGluc1tdID0g
ew0KPiA+ICAgICAgICAgLyogQ0xLLCBTWU5DICovDQo+ID4gQEAgLTIwNDEsNiArMjA0Miw3IEBA
IHN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgZHJpZjNfZGF0YTFfYl9waW5zW10gPQ0KPiA+IHsg
IHN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgZHJpZjNfZGF0YTFfYl9tdXhbXSA9IHsNCj4gPiAg
ICAgICAgIFJJRjNfRDFfQl9NQVJLLA0KPiA+ICB9Ow0KPiA+ICsjZW5kaWYNCj4gDQo+IEZvciBs
b25nICNpZmRlZiBibG9ja3MsIHdoZXJlIHlvdSBjYW5ub3Qgc2VlIGJvdGggdGhlICNpZmRlZiBh
bmQgI2VuZGlmIGluDQo+IHlvdXIgZWRpdG9yIHdpbmRvdywgaXQgaXMgcmVjb21tZW5kZWQgdG8g
YWRkIGNvbW1lbnRzIHRvIHRoZSAjZW5kaWYuDQo+IE5vIHdvcnJpZXMsIEknbGwgZml4IHRoYXQg
bXlzZWxmIHdoaWxlIGFwcGx5aW5nLg0KDQpUaGFuayB5b3UuDQoNClJlZ2FyZHMsDQpCaWp1DQoN
Cj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIu
YmU+IGkuZS4gd2lsbA0KPiBxdWV1ZSBpbiByZW5lc2FzLXBpbmN0cmwtZm9yLXY1LjExLCB3aXRo
IGNvbW1lbnRzIGFkZGVkIHRvIHRoZSAjZW5kaWZzDQo+IHdoZXJlIGFwcHJvcHJpYXRlLg0KPiAN
Cj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVy
dA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51
eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNv
bmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEg
aGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5
ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
