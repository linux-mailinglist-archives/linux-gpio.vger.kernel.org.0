Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79F0628D027
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Oct 2020 16:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729599AbgJMOXW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Oct 2020 10:23:22 -0400
Received: from mail-eopbgr1310079.outbound.protection.outlook.com ([40.107.131.79]:8896
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726822AbgJMOXV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 13 Oct 2020 10:23:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8oGHNTTOldbYC+DKTE7MrCpALbrWD/QxexwEOJaC5NA/7UVM+o9YG0r2rX7L65pDMjr0KgxgdMRpkQETVNdcfiBuz3IzE/LBy474EUmd8G6lQ0iN5gjsnN31XylmFMa5gTWD3Q8Th2TTJt0r/W0m1ntI0ydZkKqbDxM0Jz4Mm8JmHMq4C+PNOou1Kkjdr4QFtYZDQFI1IZYkSB36cdibk893tdi+KHQ+K1I6eYiEznrK2Xb4owJftapiAdsNWhiNf399hSZlUGwDuhobPwWjXBC+CdMhsJiJGaSVO4y54q0KjDFh1ViHZOKiadwE1mAmuXgtxj/j6SU3ILn1jdhTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTn5WrwDrEDzRVmHxKfkR2/lFejkMzaSwPA81RwEj/M=;
 b=gF5Xxsgaezrz6emp7RL1tO9yQ4DMLJsUnWOslwgxO1V6zyIO+nSPngoKCKjyTvMokNAKaknGcQe0GP6ASIvgRiItmJhwX/HaX1v60PoIT3lREneBqfluZAt5yMlHkKR2epH+xpL8quKjEAAlx9HVCrUNE2qvI4omEVULiDewDEaI9jluiukZYnihz/wnC3675OVOxyustYqo7eIz9FCS+yTpjF4l5RoiIp1SH2cjjdUZcJAt2tgDPg9i3ErP+kvhN8CgqPnTsEVmUGSJlA625qPemjl30TybecLRc5/5OzLGxKAuIxxHZMg++2PNgK0z2fhGQXTX3qhOdX+BgcrSkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTn5WrwDrEDzRVmHxKfkR2/lFejkMzaSwPA81RwEj/M=;
 b=KvmioliBeLnS7oj1DMrbosO4jOfAnP8gRXOLFmjNuGXmbTyUYkM5TX2wy+1khobCdXYnvWOtwlb3ClTG1pqhflYfQTgYG/XExilnTZjw62yD2EVXIae48WBEOYlQhwbtQJGLWhUL0KsGQLQZfAIZee2PcpgdwJeMA9a7EbPS6Gc=
Received: from HK0PR01MB2450.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3c::12) by HK0PR01MB2452.apcprd01.prod.exchangelabs.com
 (2603:1096:203:78::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.26; Tue, 13 Oct
 2020 14:23:15 +0000
Received: from HK0PR01MB2450.apcprd01.prod.exchangelabs.com
 ([fe80::356c:79f8:86b0:6e42]) by HK0PR01MB2450.apcprd01.prod.exchangelabs.com
 ([fe80::356c:79f8:86b0:6e42%7]) with mapi id 15.20.3455.031; Tue, 13 Oct 2020
 14:23:15 +0000
From:   =?utf-8?B?U1ogTGluICjmnpfkuIrmmbop?= <SZ.Lin@moxa.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
CC:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Drew Fustini <drew@pdp7.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [ANNOUNCE] libgpiod v1.6 released
Thread-Topic: [ANNOUNCE] libgpiod v1.6 released
Thread-Index: AQHWmvt2Fg0z1G6AdECnG3rlgeqHs6mSl8WwgAKszYCAAF2R8A==
Date:   Tue, 13 Oct 2020 14:23:15 +0000
Message-ID: <HK0PR01MB24507DBB9DDBC21B529387B5E2040@HK0PR01MB2450.apcprd01.prod.exchangelabs.com>
References: <CAMRc=MdCj8ZohsKiJjqynXPeg81q8_WZvb5VxoPGUDusFUY7Kw@mail.gmail.com>
 <CAHp75Vfy8un3APcYqWyO9b8aFMAyKVSkAbn=6kxpbSthgq4jxA@mail.gmail.com>
 <CAMRc=MfP9EBqUCvcKUmwF4Zd+yFO-yfC6718ZXeM1PbtEqYWNQ@mail.gmail.com>
 <CAHp75VdCfLrTcM5BeEgxyoRR5ptYDqQQQthrUmNoc7Fy9SwTXA@mail.gmail.com>
 <CAMRc=MdavJ6w3S=5F+00oD7AxtUtC6KgvQm7GvJqX04CVrPjcw@mail.gmail.com>
 <HK0PR01MB24504356D7FA20A34AECAABAE2070@HK0PR01MB2450.apcprd01.prod.exchangelabs.com>
 <CAMRc=Mdu=ptWC2-trOsE5npne+coCsHxf6xpz99EhVbSif140g@mail.gmail.com>
In-Reply-To: <CAMRc=Mdu=ptWC2-trOsE5npne+coCsHxf6xpz99EhVbSif140g@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bgdev.pl; dkim=none (message not signed)
 header.d=none;bgdev.pl; dmarc=none action=none header.from=moxa.com;
x-originating-ip: [220.141.66.14]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 839ce4fc-8f04-4ffe-38ac-08d86f83863b
x-ms-traffictypediagnostic: HK0PR01MB2452:
x-microsoft-antispam-prvs: <HK0PR01MB245240344D512D6EC268F0D4E2040@HK0PR01MB2452.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BVCcR06oWI/VFcV7HpGqYlb7pQrTqz0EdGn0gqICTzwcGnykl5b7jkNGGPvM/JQMpO3OjooniWwM2CueLODdpsodqR/pQCbnLBcdvHMR4HuqKxOnVU2Fy7HoQ53MbMDZ0nfRZyKhtxnx9k0IcU1f0FRzUOBmovlhUucU4tYwYoacQOeYaWLqI+pqF2xg0JoeaY29XtW1GPrJTMFfzfaLDDro8yM/IdnHPMEF0Cc+aCDQjoVv27EdxHNr3Pr6+Gh7nF15DF7DnYjeWAe8qW99tNpJ+y+JGJksVBOAXz5QBWUEjkf3J33gCkO/n1HDM6qgEeboC6s1aeOrvJHO/gZ+3hZcS/YXuqOoWvhw2+7opnygjk5vlcU+Y4y+I0Cc1PwnrVdBu4GJSG+g/wms6R/fVg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR01MB2450.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39840400004)(396003)(366004)(136003)(376002)(7696005)(9686003)(6916009)(33656002)(8936002)(86362001)(8676002)(4326008)(83080400001)(6506007)(5660300002)(186003)(64756008)(52536014)(66446008)(66476007)(66556008)(66946007)(76116006)(53546011)(26005)(478600001)(966005)(55016002)(2906002)(83380400001)(85182001)(316002)(71200400001)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: oT9rGkWCUUx8i6iUejgKJRuQDjth7nljyNZojLNy2C9jJGrmXDZHEKF6wWJnxsEUDHssLMDuE0XAdOjnE5K3mQAPquRSmpO398gYBG0iuUYJvsDBgQU6dbzkrmRIORN0jDCFZeNDRlS742DetmLTzaoaRou8yKK2paj/nPAU4wFAvj5DzQ+1bPHgNqIpK22VDfQAgFit+5vIn7NeQ9lIuNKxJaaEg1Gib+f5e+s0EoRZMD8ihd0M/m0hcxtG+RHlyEnfkHsEd6+R7Zr0rDKeHeFosxIG5SL5/AgicJjzfnTV58Knm6Mewkc8ZFu8endqu1y07gh63jJYSV6oocZ3ajglEN5105MWmp9JVd/Cf1Msuy5rf+6K6ihzIuBIga4nzC+JQ9SPTK5dSyevUSSJoP+0PXZnNe1H3Nvm4IRQOMcfgrVbq4e6WxRJ/xrKljcX2jP23dNN6OBM5LuGVm5b6BUOH0/Ak+hMsVVZiJc5aIVrrUEAPw1j3DBxlgXSsLPw/lzMu3YhX2ibicUlq1WadmPRJC82M4Ico6n7UYCK6tU6ekf96aP0Z2gA4XEn8DsdD156dV2NZu/hdeqYX9W11yctKrKPj2zDUHVb+xXdYR3kKVujZvTe2nq0604vXmHYrFVIbgVUW+iMCBcGD+eiiA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR01MB2450.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 839ce4fc-8f04-4ffe-38ac-08d86f83863b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2020 14:23:15.5042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jodfx2ZxRzUgaA3jmPP0qmnZy3m9REJN3EnV0ssVHCtR68XjcdwtUXMYn6drljZU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR01MB2452
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksDQoNCj4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gDQo+
IE9uIE1vbiwgT2N0IDEyLCAyMDIwIGF0IDU6MTggUE0gU1ogTGluICjmnpfkuIrmmbopIDxTWi5M
aW5AbW94YS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGksDQo+ID4NCj4gPiA8c25pcD4NCj4gPg0K
PiA+ID4gSSBwZXJzb25hbGx5IGRvbid0IGNhcmUgbXVjaCBhYm91dCBob3cgZGVza3RvcCBkaXN0
cm9zIGhhbmRsZSB0aGlzIC0NCj4gPiA+IEknbSBtb3N0bHkgaW50ZXJlc3RlZCBpbiBiZXNwb2tl
IGVtYmVkZGVkIGRpc3Ryb3MgYnVpbHQgd2l0aCB5b2N0bw0KPiA+ID4gb3IgYnVpbGRyb290LiBJ
J20gQ2MnaW5nIFNaIExpbiB3aG8gbWFpbnRhaW5zIHRoZSBsaWJncGlvZCBkZWJpYW4gcGFja2Fn
ZS4NCj4gPg0KPiA+IE5vd2FkYXlzLCBtYW55IGVtYmVkZGVkIGRpc3Ryb3MgYXJlIGRlcml2ZWQg
ZnJvbSBEZWJpYW4sIHN1Y2ggYXMNCj4gPiBSYXNwYmVycnkgUGkgT1MgKHByZXZpb3VzbHkgY2Fs
bGVkIFJhc3BiaWFuKS4gTW9yZW92ZXIsIHRoZQ0KPiA+IG1ldGEtZGViaWFuIFsxXSBwcm92aWRl
cyB0aGUgcmVjaXBlcyBmb3IgdGhlIFBva3kgYnVpbGQgc3lzdGVtIHRvIGJ1aWxkIGltYWdlcw0K
PiB1c2luZyBEZWJpYW4gc291cmNlIHBhY2thZ2VzIHdpdGhpbiB0aGUgWW9jdG8gcHJvamVjdCBb
Ml0uDQo+ID4NCj4gPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL21ldGEtZGViaWFuL21ldGEtZGVi
aWFuDQo+ID4gWzJdDQo+ID4gaHR0cHM6Ly93d3cueW9jdG9wcm9qZWN0Lm9yZy9sZWFybi1pdGVt
cy9kZWJ5LXJlcHJvZHVjaWJsZS1hbmQtbWFpbnRhaQ0KPiA+IG5hYmxlLWVtYmVkZGVkLWxpbnV4
LWVudmlyb25tZW50LXdpdGgtcG9reS8NCj4gPg0KPiA+ID4NCj4gPiA+IFNaIExpbjogbGliZ3Bp
b2Qgd2lsbCBnZXQgYSBuZXcgbWFqb3IgcmVsZWFzZSBpbiB0aGUgZm9sbG93aW5nDQo+ID4gPiBt
b250aHMNCj4gPiA+IC0gdGhlIEFQSSB3aWxsIGJlY29tZSB2Mi54IGFuZCBBQkkgdjMueCAtIGRv
IHlvdSB0aGluayBpdCdzDQo+ID4gPiBpbXBvcnRhbnQgdG8gbWFrZSBpdCBwb3NzaWJsZSBmb3Ig
dHdvIG1ham9yIHZlcnNpb25zIG9mIGxpYmdwaW9kIHRvDQo+ID4gPiBsaXZlIHRvZ2V0aGVyIGlu
IGEgc2luZ2xlIHN5c3RlbT8gSQ0KPiA+DQo+ID4gSXQncyBwb3NzaWJsZSwgYnV0IEkgdGhpbmsg
aXQncyAqbm8gc3Ryb25nbHkgbmVlZGVkKiBhbmQgdGhlcmUgYXJlIG5vDQo+ID4gb3RoZXIgRGVi
aWFuIHBhY2thZ2VzIGRlcGVuZCBvbiBsaWJncGlvZCwgYXMgc2hvd24gYmVsb3cuDQo+ID4NCj4g
PiA9PT0NCj4gPiBhcHQgcmRlcGVuZHMgbGliZ3Bpb2QyDQo+ID4gbGliZ3Bpb2QyDQo+ID4gUmV2
ZXJzZSBEZXBlbmRzOg0KPiA+ICAgRGVwZW5kczogbGliZ3Bpb2QtZGV2ICg9IDEuNS4yLTEpDQo+
ID4gICBEZXBlbmRzOiBweXRob24zLWxpYmdwaW9kICg9IDEuNS4yLTEpDQo+ID4gICBEZXBlbmRz
OiBncGlvZCAoPj0gMS41LjEpDQo+ID4gPT09DQo+ID4NCj4gPiBBbGwgb2YgdGhlIGFib3ZlIGJp
bmFyeSBwYWNrYWdlcyBhcmUgYnVpbHQgZnJvbSB0aGUgc2FtZSAobGliZ3Bpb2QpIHNvdXJjZQ0K
PiBwYWNrYWdlLg0KPiA+DQo+ID4gPiB3b3VsZCBsaWtlIHRvIGF2b2lkIGhhdmluZyB0byByZW5h
bWUgZXZlcnl0aGluZyBhbmQgdXNlIGxpYmdwaW9kMi4wDQo+ID4gPiBldmVyeXdoZXJlIC0gdGhp
cyBpbmZvcm1hdGlvbiBpcyBhbHJlYWR5IHN0b3JlZCBpbiB0aGUgQVBJIHZlcnNpb24uDQo+ID4g
PiBEb2VzIGRlYmlhbiBzdXBwb3J0IHNvbWV0aGluZyBsaWtlIHlvY3RvJ3MgdmlydHVhbCBwcm92
aWRlcnMgbWF5YmU/DQo+ID4gPiBIb3cgZG8geW91IHNlZSB0aGlzIGZvciBhIGRlc2t0b3AgZGlz
dHJvLg0KPiA+DQo+ID4gSSdtIG5vdCBmYW1pbGlhciB3aXRoIFlvY3RvJ3MgbWVjaGFuaXNtLCBi
dXQgaW4gdGhpcyBjYXNlLCB0aGUgQUJJDQo+ID4gY2hhbmdlcyBzZWVtIHRoYXQgYXJlIG5vdCBi
YWNrd2FyZC1jb21wYXRpYmxlOyB3ZSBub3JtYWxseSByZXF1aXJlDQo+ID4gY2hhbmdpbmcgdGhl
IFNPTkFNRSBvZiB0aGUgbGlicmFyeSBhbmQgdGhlIHNoYXJlZCBsaWJyYXJ5IHBhY2thZ2UgbmFt
ZS4NCj4gPg0KPiANCj4gRm9yIHRoZSBTT05BTUUgaXQncyBjbGVhcjogY3VycmVudCBsaWJncGlv
ZC5zby4yIHdpbGwgYmVjb21lIGxpYmdwaW9kLnNvLjMuIEZvcg0KPiB0aGUgbGlicmFyeSBwYWNr
YWdlIG5hbWU6IHRoaXMgaXMgYWxyZWFkeSBoYW5kbGVkIGJ5IGRpc3Ryb3MgLSBmb3IgaW5zdGFu
Y2UgdGhlDQo+IHBhY2thZ2UgaW4gZGViaWFuIGlzIGNhbGxlZCBsaWJncGlvZDIuIEkgZ3Vlc3Mg
aXQgd2lsbCBiZWNvbWUgbGliZ3Bpb2QzIHRoZW4uIEkNCj4gdGhpbmsgd2UncmUgZ29vZCBpbiB0
aGF0IHJlZ2FyZCB0aGVuLg0KDQpFeGFjdGx5LCB3ZSdyZSBvbiB0aGUgc2FtZSBwYWdlLg0KDQpT
Wg0KDQo+IA0KPiBCYXJ0b3N6DQo=
