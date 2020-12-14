Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C9CB2D941F
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 09:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439071AbgLNIYF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 03:24:05 -0500
Received: from mail-eopbgr1310139.outbound.protection.outlook.com ([40.107.131.139]:11392
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726241AbgLNIYE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Dec 2020 03:24:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6zoFaGVgdY9BXvAAy9TyPUyt3/+NyY6egny1I+DMyWlYECJPXG8CpykZm39gGg14cT6mvDUdD7uI8SGPebStuRlfLA9HZqq3cVP0TTZ4jrAvIZRyvoC6YbAsGd+6BHMiEsrmB/IWy+C9j45QY4hS26SNnI/8uRkbhv+2cPJBxuRnJdUX3htL16lhcxhk3f92b+BtxXLtKrRKLSQ9Rx9XPqZ6Ga4oP+PP9pyMkPixTtj1FF8orq5Yw/MVZ2MiNQB8DbqM3RO8gqJCBRxgdvif8XwAGxwDB8s751iOByv7vJEHd0T4h70Mqo5JIYQ8xP9Tk5wNrxgtIVT9a4PwYBWzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4pKaLCRvrlxp52orZXDYkUdJHNAXjHILhPm9mmp+as=;
 b=oRsflQxwS24pNw9Dkv2F851odaTAbhFTHCiNTpekQ4cHE2g4FLB6pFjWbJOxzppWOtgDmw9XOeAlA+s0MMdM7c1kCR6YFK/919dGY59r6FgYCc5iWV/n7h1/VBSavpIKfSJZ0EqriLCADM1gOjcqi9kVx+ORDrPb1VkBo3PL4wLgowXeZkZXb0AYD1lE0NBpVuoatwppDeyeFvy43yqRzWWyX0kiRlSgIQHxBlSUj1fHfZg/ZKDoqL72+hMgd6zGAffbWu+l5Jhb9iUzpvg52LmtfsHE9gLLcE2aMKG6LxAwicIKMExYRVAu6jtYn4a85Mn7U7eLcV5HrcvtcYAf2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4pKaLCRvrlxp52orZXDYkUdJHNAXjHILhPm9mmp+as=;
 b=eib72xcv46eD5Mrap/3/Z7vGxHOOn4VC1UstmWnbJYbuSWPGmEuvsMcpsGMm9heZqCUg0Y/PcItKWUZrEmf3LiNpnVAHr4tkRXDJ26ww9s2WAMKX+qTk1JEigiIjzsBTZbTXklbE39A02qBRQml95Xmb08Pm31qzGmFUxlwQV3M=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3436.jpnprd01.prod.outlook.com (2603:1096:404:d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.24; Mon, 14 Dec
 2020 08:22:26 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3654.025; Mon, 14 Dec 2020
 08:22:26 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 04/10] regulator: bd9571mwv: Add BD9574MWF support
Thread-Topic: [PATCH v2 04/10] regulator: bd9571mwv: Add BD9574MWF support
Thread-Index: AQHWz7CtMmFbq93S7UCFSGJMUv+GJanx1IyAgAQtVwCAAC/JAIAAD/bg
Date:   Mon, 14 Dec 2020 08:22:26 +0000
Message-ID: <TY2PR01MB369297B5977B36C9286C06CAD8C70@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1607686060-17448-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1607686060-17448-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <ab27db32a8da1486e14722831da947d37bbdcf7d.camel@fi.rohmeurope.com>
         <TY2PR01MB3692F97109A6E409DEA9EAA6D8C70@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <9ca960355762528f3b91f7622aa799e831492f8d.camel@fi.rohmeurope.com>
In-Reply-To: <9ca960355762528f3b91f7622aa799e831492f8d.camel@fi.rohmeurope.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fi.rohmeurope.com; dkim=none (message not signed)
 header.d=none;fi.rohmeurope.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:1453:ff:c191:5a7a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ba3f177e-0a97-481b-17ae-08d8a00963e3
x-ms-traffictypediagnostic: TY2PR01MB3436:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB3436E636BC8552DB70D0867DD8C70@TY2PR01MB3436.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NQE5p3O2D+hJ23qNU6N9NHA4U2pkv04GvxxEuMQCRHNk6w2/B7FeQhw+gn695rxF2T8xK4y3wrR/jgUbsYPcfHflN6pY9V8dMIDc6XF6d9fWkGASFdeBct0fpvejkmAcemwGYg4moqO9xPGRmYhWfwd7395nYETi9Brwp6/dCY8hRP6SKA7OMlYCZQMLtCO8lm5wruo1Vo4lyjLdO4gQNkAG4YJ+hEBmL66tnpC00mcbh/TQ6ohYxtDDbaIfpf1qcK9WaWfX4MaD6HXrv5DvD1PjLcdVofkgKuidEGNQsy7k7UF6Ofv3L5ZAwZuG2g6Bzgzcz9/ixc0Ca1et7EVBHA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(110136005)(4001150100001)(316002)(55016002)(2906002)(86362001)(54906003)(9686003)(83380400001)(4326008)(478600001)(33656002)(71200400001)(8676002)(5660300002)(8936002)(64756008)(66946007)(186003)(52536014)(66446008)(66476007)(7416002)(7696005)(66556008)(6506007)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?UGFvNC9NdHZlR2hpU0RrT1NtYUlibEQ0QTFMVEREMjJiVDFUdmlFVTVYREpi?=
 =?utf-8?B?emlPa013S0pTdVF5QU5Wb211YWloQ1hmcExXQXBVbUdYTkpKMzRaaDQwUXJa?=
 =?utf-8?B?aWpQbTk4R0lDZ1NGa3FDb0RsUWtWMmJXdEJTQ3VBSkxncktGSkZiV3RzbUJm?=
 =?utf-8?B?SWU5V01oWnVBVlA2N3NvNDhnRHJRSy9sc25kUDk2cGxqMy9UcFNCM0VSb3hW?=
 =?utf-8?B?cnR6K3J6UXBERGliRmtWMVZqYWt3dGdDUHR4MXIxenVTQzdITWFGT0N0UFc2?=
 =?utf-8?B?SlY3NXRtM2swdnZjRTFwY2daUGlEKzBxeHl2OXkxTmFCOGhoQXNhVVlsSisz?=
 =?utf-8?B?THlsTjFWRyt2QUozV21acXVJYXNUZWkxZ0lTaTg0TXNYWGlrMm0xU0I2V3VJ?=
 =?utf-8?B?ajJBNVVNTjNDSVZRb3RjNkNQVmtUWlJFRFVNcEhKd3p5RXJZcnl1cWd1UDZv?=
 =?utf-8?B?TEJ0NG1DUnhJNEdiMDVZcDlQSUNuSGw3NTBoVHpiOXpZYkU5R1V0Qk1OYWVI?=
 =?utf-8?B?aUpqTmF5WlNNVnVZRHFwNHFqaXZzQllFQ2dlNE96UXkvcXUzbTFtNWN0cWY2?=
 =?utf-8?B?NlByN0MxSUp6bngzb0dDOFQ3QUhGTVlBU0hJd0paUWx6aGVaa2ZXVC92cDk3?=
 =?utf-8?B?UDYySnNyY0RYU2h4ODhoNXI0N0tkajRTNmFhU2Qxa1Q3WVpmVlFRYlV2Tnk5?=
 =?utf-8?B?STBaWlZjVElIL2VZbmYzK2V2REx6YU5lci9XVlNsLy9KUWZRR1pWbkNQcEdX?=
 =?utf-8?B?RUZCekxyUjhQbXRFWEM1NkUzTEdNTWNUQ0F3emdEODJuMnZIS0VENWhTVHFt?=
 =?utf-8?B?WktENWVnT1MvcjQxQzZZb3h5c2dRSkIyMG5EVDhOU1o0QTd2Qm9TS2kvSm0x?=
 =?utf-8?B?b3QxUUtIMnZaeXE1L1QwMVcrV1RqSUJXR3BMajN5ZFNRNHR4ZGZDQ3RTYUpx?=
 =?utf-8?B?NHRKb0MrdFNSY1VxMVBsaE83akYwVWpCdzVYY25jMnhETWxxc0pkSTZ3bFBG?=
 =?utf-8?B?V1N0bk0xNmhITjZGcFhjcVhCbHpXRFdGMFVTVnNyaHpwWFdVTGxqSk12L00x?=
 =?utf-8?B?L0hNRVhoNU01VUhuVHF5cFVXMnhnMml5ZE1qQWpDVlhRbGpzQjJwc1pEdFNK?=
 =?utf-8?B?bGJsL2ZXUzVjQld6SlBNbEVQZjJNM1FoY0xzdldVZGlQcnFTTzhramdpcmRX?=
 =?utf-8?B?QUMyYVhiOWtvSUlSTlZGQ251MjlNa3VkMTU4OWQ4UGozc1ZTQUJGeW9uUnMx?=
 =?utf-8?B?RDNkNnE0dU1WcURpSnQ4Y2ZDWDM3bjd6bjk5N1p6SEF1UVEvd0JSWWsyZ285?=
 =?utf-8?B?SkhGcEMvQ0dWREVsaXl2QytGVHNNcFZpYmpFdkNhZmloOWMxU09mRFU1MkJo?=
 =?utf-8?Q?X4qtcUdJPMFaQ1rqg4dPMgiJvRqHK9sw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba3f177e-0a97-481b-17ae-08d8a00963e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2020 08:22:26.2982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V/HJhfSFiwJ5jPB01gZByp6NHAJJU4nGd24mHZMLABfmisJy1GH0Upr11wQ7Sh36K/9Jvn2ws5lq/Mq0tiGOPJW87kP4xgftaaJkpMew82dg5wmvr+GYC5/vHf5zHp2l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3436
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTWF0dGktc2FuLA0KDQo+IEZyb206IFZhaXR0aW5lbiwgTWF0dGksIFNlbnQ6IE1vbmRh
eSwgRGVjZW1iZXIgMTQsIDIwMjAgNDoxMyBQTQ0KPiANCj4gSGVsbG8gU2hpbW9kYS1zYW4sDQo+
IA0KPiBPbiBNb24sIDIwMjAtMTItMTQgYXQgMDQ6NTcgKzAwMDAsIFlvc2hpaGlybyBTaGltb2Rh
IHdyb3RlOg0KPiA+IEhlbGxvIE1hdHRpLXNhbiwNCj4gPg0KPiA+ID4gRnJvbTogVmFpdHRpbmVu
LCBNYXR0aSwgU2VudDogRnJpZGF5LCBEZWNlbWJlciAxMSwgMjAyMCA5OjM0IFBNDQo+ID4gPg0K
PiA+ID4gSGVsbG8gYWdhaW4gU2hpbWFkYS1zYW4sDQo+ID4gPg0KPiA+ID4gT24gRnJpLCAyMDIw
LTEyLTExIGF0IDIwOjI3ICswOTAwLCBZb3NoaWhpcm8gU2hpbW9kYSB3cm90ZToNCj4gPiA+ID4g
QWRkIHN1cHBvcnQgZm9yIEJEOTU3NE1XRiB3aGljaCBpcyBzaWxpbWFyIGNoaXAgd2l0aCBCRDk1
NzFNV1YuDQo+ID4gPiA+IE5vdGUgdGhhdCBCRDk1NzRNV0YgZG9lc24ndCBzdXBwb3J0IEFWUyBh
bmQgVklELg0KPiA+ID4NCj4gPiA+IEknZCBsaWtlIHRvIHVuZGVyc3RhbmQgd2hhdCBpcyBWSUQ/
DQo+ID4NCj4gPiBJdCBzZWVtcyByZWFkaW5nIHNvbWUgdm9sdGFnZXMgZnJvbSByZWdpc3RlcnMu
DQo+ID4gRm9yIGV4YW1wbGUsIEJEOTU3MSBoYXMgIlZEMThfVklEIiByZWdpc3RlciB3aGljaA0K
PiA+IGlzIHByb2hpYml0IHRvIHdyaXRlLiBCdXQsIEJEOTU3NCBkb2Vzbid0IGhhdmUgdGhpcw0K
PiA+IHJlZ2lzdGVyLiBBbHNvLCB0aGUgZHJpdmVyIG5hbWVzICJ2aWRfb3BzIiwNCj4gPiBzbyBJ
IGRlc2NyaWJlZCAiVklEIiBoZXJlLiBQZXJoYXBzLCB3ZSBzaG91bGQgcmV2aXNlDQo+ID4gdGhl
IGRlc2NyaXB0aW9uIHRvIGNsZWFyLiAoUGxlYXNlIGxvb2sgIlVwZGF0ZWQgZGVzY3JpcHRpb24i
IGluIHRoaXMNCj4gPiBlbWFpbC4pDQo+IA0KPiBUaGFuayB5b3UgZm9yIGRldGFpbGVkIGV4cGxh
bmF0aW9uLiBTbyBhcyBmYXIgYXMgSSB1bmRlcnN0b29kIC0gVklEIGlzDQo+IGEgcmVnaXN0ZXIg
d2hpY2ggZGlzcGxheXMgdGhlIGN1cnJlbnQgb3V0cHV0IHZvbHRhZ2UsIHJpZ2h0Pw0KDQpZZXMu
DQoNCj4gSWYgSSBhbQ0KPiBub3QgbWlzdGFrZW4sIHRoaXMgaXMgZGlmZmVyZW50IGZyb20gcmVn
aXN0ZXIgd2hlcmUgKGluaXRpYWwpIHZvbHRhZ2UNCj4gaXMgc2V0Pw0KDQpZZXMuIEkgY2hlY2tl
ZCBvbiBteSBlbnZpcm9ubWVudCAoSDMgU2FsdmF0b3ItWFMpLg0KDQo+ID4gPiA+IFNpZ25lZC1v
ZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDwNCj4gPiA+ID4geW9zaGloaXJvLnNoaW1vZGEudWhA
cmVuZXNhcy5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgZHJpdmVycy9yZWd1bGF0b3IvYmQ5
NTcxbXd2LXJlZ3VsYXRvci5jIHwgMTAgKysrKysrKystLQ0KPiA+ID4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiA+ID4NCj4gPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcmVndWxhdG9yL2JkOTU3MW13di1yZWd1bGF0b3IuYw0KPiA+ID4g
PiBiL2RyaXZlcnMvcmVndWxhdG9yL2JkOTU3MW13di1yZWd1bGF0b3IuYw0KPiA+ID4gPiBpbmRl
eCAwMjEyMGIwLi4wNDEzMzliIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3JlZ3VsYXRv
ci9iZDk1NzFtd3YtcmVndWxhdG9yLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9yZWd1bGF0b3Iv
YmQ5NTcxbXd2LXJlZ3VsYXRvci5jDQo+ID4gPiA+IEBAIC0xLDYgKzEsNiBAQA0KPiA+ID4gPiAg
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiA+ID4gIC8qDQo+ID4gPiA+
IC0gKiBST0hNIEJEOTU3MU1XVi1NIHJlZ3VsYXRvciBkcml2ZXINCj4gPiA+ID4gKyAqIFJPSE0g
QkQ5NTcxTVdWLU0gYW5kIEJEOTU3NE1XRi1NIHJlZ3VsYXRvciBkcml2ZXINCj4gPiA+ID4gICAq
DQo+ID4gPiA+ICAgKiBDb3B5cmlnaHQgKEMpIDIwMTcgTWFyZWsgVmFzdXQgPG1hcmVrLnZhc3V0
K3JlbmVzYXNAZ21haWwuY29tDQo+ID4gPiA+ID4NCj4gPiA+ID4gICAqDQo+ID4gPiA+IEBAIC05
LDYgKzksNyBAQA0KPiA+ID4gPiAgICogTk9URTogVkQwOSBpcyBtaXNzaW5nDQo+ID4gPiA+ICAg
Ki8NCj4gPiA+ID4NCj4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9tZmQvcm9obS1nZW5lcmljLmg+
DQo+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ID4gPiA+ICAjaW5jbHVkZSA8
bGludXgvb2YuaD4NCj4gPiA+ID4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4N
Cj4gPiA+ID4gQEAgLTI3Nyw2ICsyNzgsNyBAQCBzdGF0aWMgaW50IGJkOTU3MW13dl9yZWd1bGF0
b3JfcHJvYmUoc3RydWN0DQo+ID4gPiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiA+ID4g
IAlzdHJ1Y3QgcmVndWxhdG9yX2RldiAqcmRldjsNCj4gPiA+ID4gIAl1bnNpZ25lZCBpbnQgdmFs
Ow0KPiA+ID4gPiAgCWludCBpOw0KPiA+ID4gPiArCWVudW0gcm9obV9jaGlwX3R5cGUgY2hpcCA9
IHBsYXRmb3JtX2dldF9kZXZpY2VfaWQocGRldiktDQo+ID4gPiA+ID4gZHJpdmVyX2RhdGE7DQo+
ID4gPiA+DQo+ID4gPiA+ICAJYmRyZWcgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9m
KCpiZHJlZyksIEdGUF9LRVJORUwpOw0KPiA+ID4gPiAgCWlmICghYmRyZWcpDQo+ID4gPiA+IEBA
IC0yOTIsNiArMjk0LDkgQEAgc3RhdGljIGludCBiZDk1NzFtd3ZfcmVndWxhdG9yX3Byb2JlKHN0
cnVjdA0KPiA+ID4gPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gPiA+ICAJY29uZmlnLnJl
Z21hcCA9IGJkcmVnLT5yZWdtYXA7DQo+ID4gPiA+DQo+ID4gPiA+ICAJZm9yIChpID0gMDsgaSA8
IEFSUkFZX1NJWkUocmVndWxhdG9ycyk7IGkrKykgew0KPiA+ID4gPiArCQkvKiBCRDk1NzRNV0Yg
c3VwcG9ydHMgRFZGUyBvbmx5ICovDQo+ID4gPiA+ICsJCWlmIChjaGlwID09IFJPSE1fQ0hJUF9U
WVBFX0JEOTU3NCAmJiByZWd1bGF0b3JzW2ldLmlkDQo+ID4gPiA+ICE9IERWRlMpDQo+ID4gPiA+
ICsJCQljb250aW51ZTsNCj4gPiA+DQo+ID4gPiBEb2VzIHRoaXMgbWVhbiB0aGF0IHJlYWRpbmcg
VkQwOSB2b2x0YWdlIGlzIG5vdCBzdXBwb3J0ZWQgYnkNCj4gPiA+IGRyaXZlcj8NCj4gPg0KPiA+
IFllcy4gQWxzbywgcmVhZGluZyBWRHsxOCwyNSwzM30gdm9sdGFnZSBhcmUgbm90IHN1cHBvcnRl
ZC4NCj4gDQo+IEkgdGhpbmsgdGhhdCB3b3VsZCBiZSBleGNlbGxlbnQgY29tbWVudCBoZXJlLiBN
YXliZSBzb21ldGhpbmcgbGlrZTogIldlDQo+IGRvbid0IHN1cHBvcnQgdm9sdGFnZSByYWlscyBW
RHswOSwxOCwyNSwzM30gYnkgdGhpcyBkcml2ZXIgb24gQkQ5NTc0LiINCg0KVGhhbmsgeW91IGZv
ciB0aGUgc3VnZ2VzdGlvbiEgSSdsbCB1c2UgdGhpcyBjb21tZW50Lg0KDQo+ID4gPiAoSQ0KPiA+
ID4gYXNzdW1lZCBWRDA5IGluaXRpYWwgdm9sdGFnZSBjYW4gYmUgc2V0IGZyb20gZWVwcm9tKD8p
IGFuZCByZWFkIGJ5DQo+ID4gPiBkcml2ZXIgLSBJIG1heSBiZSB3cm9uZyB0aG91Z2gpLiBQZXJo
YXBzIGl0IGlzIHdvcnRoIG1lbnRpb25pbmcgaW4NCj4gPiA+IHRoZQ0KPiA+ID4gY29tbWl0IG1l
c3NhZ2UgYXMgYSBkcml2ZXIgcmVzdHJpY3Rpb24/DQo+ID4NCj4gPiBZZXMsIHRoZXNlIHZvbHRh
Z2UgY2FuIGJlIHNldCBmcm9tIGVlcHJvbSBhbmQgcmVhZCBieSBkcml2ZXIuDQo+ID4gU28sIEkg
dXBkYXRlZCB0aGUgZGVzY3JpcHRpb24gbGlrZSBiZWxvdy4NCj4gPg0KPiA+IC0tIFVwZGF0ZWQg
ZGVzY3JpcHRpb24gLS0NCj4gPiBBZGQgc3VwcG9ydCBmb3IgQkQ5NTc0TVdGIHdoaWNoIGlzIHNp
bWlsYXIgY2hpcCB3aXRoIEJEOTU3MU1XVi4NCj4gPiBOb3RlIHRoYXQgc2luY2UgQkQ5NTc0TVdG
IGRvZXNuJ3QgaGF2ZSBhdnNfb3BzIGFuZCB2aWRfb3BzDQo+ID4gcmVsYXRlZCByZWdpc3RlcnMs
IHRoaXMgZHJpdmVyIGF2b2lkcyB0byB1c2UgdGhlc2UgcmVnaXN0ZXJzDQo+ID4gaWYgQkQ5NTc0
TVdGIGlzIHVzZWQuDQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiBUaGFuayB5
b3UgOikgV2hhdCBJIHdhcyBhZnRlciBpcyB0aGF0IEkgd291bGQgbGlrZSB0byBsZWF2ZSBhIG5v
dGUNCj4gYWJvdXQgJ3doYXQgY291bGQgYmUgaW1wcm92ZWQnIG9yIGFib3V0IHdoYXQgaXMgdGhl
ICdzb2Z0d2FyZQ0KPiBsaW1pdGF0aW9uJyBoZXJlIHNvIHRoYXQgaWYgYW55b25lIGxhdGVyIG5l
ZWRzIHRoZSBvdGhlciB2b2x0YWdlIHJhaWxzDQo+IGhlIHdvdWxkIGhhdmUgYSBoaW50IGFib3V0
IHdoYXQgY291bGQgYmUgZG9uZS4NCj4gDQo+IERvIHlvdSB0aGluayBtZW50aW9uaW5nIHRoYXQg
InRoZSBWRDA5IHZvbHRhZ2UgY291bGQgYmUgcmVhZCBmcm9tIFBNSUMNCj4gYnV0IHRoYXQgaXMg
bm90IHN1cHBvcnRlZCBieSB0aGlzIGNvbW1pdCIgaW4gY29tbWl0IG1lc3NhZ2Ugd291bGQgYmUN
Cj4gT2s/DQoNCkkgdGhpbmsgT0sgYmVjYXVzZSBWRDA5IGNvdWxkIGJlIHJlYWQgZnJvbSAiQkQ5
NTc0TVdGX1ZEMDlfVklOSVQiDQpyZWdpc3RlciwgYnV0IHRoYXQgaXMgbm90IHN1cHBvcnRlZCBi
dXQgdGhpcyBjb21taXQuDQoNCj4gPiA+IEFuZCBqdXN0IGFza2luZyBvdXQgb2YgdGhlIGN1cmlv
c2l0eSAtIGFyZSB0aGUgb3RoZXIgdm9sdGFnZSByYWlscw0KPiA+ID4gbGlzdGVkIGluIGRhdGEt
c2hlZXQgKFZEMTgsIEREUjAsIFZEMzMsIFZEMDkgYW5kIExETzEsLi4uLExETzQpDQo+ID4gPiBz
ZXQtdXANCj4gPiA+IGZyb20gRFQgYXMgZml4ZWQtcmVndWxhdG9ycz8gQW55IHJlYXNvbiB3aHkg
dGhleSBhcmUgbm90IHNldC11cA0KPiA+ID4gaGVyZT8NCj4gPg0KPiA+IFRCSCwgSSBkb24ndCBr
bm93IHdoeS4gUGVyaGFwcywgdGhlIGRyaXZlciBjYW5ub3QgcmVhZCBERFIwLCBMRE9bMS00XQ0K
PiA+IHZhbHVlcz8NCj4gDQo+IEkgYWxzbyB0aGluayB0aGF0IGFsbCB2b2x0YWdlcyBjYW4ndCBi
ZSByZWFkLiBJIHdhcyBqdXN0IHRoaW5raW5nIHRoYXQNCj4gaXQgbWlnaHQgbWFrZSBzZW5zZSB0
byBhbHdheXMgY3JlYXRlIHRoZSBmaXhlZCByZWd1bGF0b3JzIGZyb20gUE1JQw0KPiBkcml2ZXIg
LSBiZWNhdXNlIGlmIFBNSUMgaXMgdXNlZCAtIHRoZW4gdGhlc2Ugdm9sdGFnZSByYWlscyBkbyBl
eGlzdC4NCj4gKFRoaXMgd2FzIGp1c3QgYSBxdWVzdGlvbiBzbyB0aGF0IEkgY291bGQgbGVhcm4g
LSBub3Qgc28gbXVjaCBvZiBhDQo+IHJldmlldyBjb21tZW50LikNCj4gDQo+IElmIHlvdSByZS1z
cGluIHRoZSBzZXJpZXMgZm9yIG90aGVyIGZpeHVwcyAtIHRoZW4gSSB3b3VsZCBhcHByZWNpYXRl
DQo+IHNvbWUgY29tbWVudCBhYm91dCBvbWl0dGluZyB0aGUgcmVzdCBvZiB0aGUgdm9sdGFnZSBv
dXRwdXRzLg0KPiANCj4gT3RoZXIgdGhhbiB0aGF0IC0gZm9yIHdoYXQgaXQgaXMgd29ydGg6DQo+
IA0KPiBSZXZpZXdlZC1ieTogTWF0dGkgVmFpdHRpbmVuIDxtYXR0aS52YWl0dGluZW5AZmkucm9o
bWV1cm9wZS5jb20+DQoNClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgcmV2aWV3IQ0KDQpC
ZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
