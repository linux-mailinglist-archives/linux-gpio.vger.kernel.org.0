Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74889416E70
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Sep 2021 11:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244807AbhIXJFU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Sep 2021 05:05:20 -0400
Received: from mail-eopbgr1410127.outbound.protection.outlook.com ([40.107.141.127]:6334
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237187AbhIXJFT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 24 Sep 2021 05:05:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xkz/6MNBZssFP2bD0uZg6lwxlkKIzl83occ1wnQpEiVqxNu6b1mol90353liiFLXHeDMBkS/pQeIwc8bLE7vz6i90SpsmdyHH6QLmJ+UQr3bzJV+IKZ+ViDOao2aZWD88aF4nd7qErbJ9k8BJqGzL3CoiGp4Iw4kWBvHcoIL4mErEw+PERrwaaFi4VxMbhfJ45IgDVaShwJ6x9Fzrz50Qeb+6XIidszyMzlIsd8qRAZ+j0tg34juIJJoUi5cuNRtvPjNOJVav6FMs+IoNpS5UvY9KiCIUwC5k7/+dtEdzT6VERGInHjHQAnHiYOT2diaSHNcuaCkdKZPybCqsp7K4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=3UJcGlQcrhNZW9zaNZUCxI51KQBBf4hGX9RvtxjAVzQ=;
 b=mgjDH4UTUH5GDwpa7UT4Uabon8+7128p/UwgaelFZVuzZnOK9IWemfbHLZkbkULlroquvqm6MaxALtZM2Uwt7qXxJXG26NgQL6zKEiJMgT77QJ1wkv+XNZ8aJERMeTiBpPIEbm+OvXUinih7b5f7bpqs5r5PIdnGzm053JZYc5U6AWXYNsqNNwR1vk5hYU+9BPLVB8rY6OZDrOr0rdBcVzXO7KDKgOu/Sh8DDNrFlL4MHJtX9gknv5wnRlIsh3ZVoUiQvJmE39q+QIyEn19z6LFK7J8ysKHUOoL3CeEk4JLHT2PoWiMOqtlcPPsbQ45cvr41fUQOAjM02NAObo7oew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UJcGlQcrhNZW9zaNZUCxI51KQBBf4hGX9RvtxjAVzQ=;
 b=ByRJRrOdHcT2QO4cn/AbKLGRJB2k3UrNjhr4j4glG9qes1RcX1DxcherCfjEZPgK7VhuJ4Q3COliAPzB4W3aJeXfoMKmYbFV5pnpKCWkPrDC1+9o4vXvisaCY6pAG4mHMADupuna0mIMIelH9DZ29FPHOIJrwsgYLoy4tdEMN9Q=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB7061.jpnprd01.prod.outlook.com (2603:1096:604:124::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 09:03:42 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::6532:19dd:dfa1:4097]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::6532:19dd:dfa1:4097%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 09:03:39 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] pinctrl: renesas: rzg2l: Fix missing port register 21h
Thread-Topic: [PATCH] pinctrl: renesas: rzg2l: Fix missing port register 21h
Thread-Index: AQHXr4cBffSL4JDYPkGDXI14MirlXquy4jGAgAADRCA=
Date:   Fri, 24 Sep 2021 09:03:39 +0000
Message-ID: <OS0PR01MB592275447C1FA46DB418B6B686A49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210922074140.22178-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXpELNRXbLTidmSdAqio27WLm8JK=sk0Vhz=wMdN3UX8A@mail.gmail.com>
In-Reply-To: <CAMuHMdXpELNRXbLTidmSdAqio27WLm8JK=sk0Vhz=wMdN3UX8A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4cfb016-c301-44c2-b13e-08d97f3a338a
x-ms-traffictypediagnostic: OS3PR01MB7061:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB7061C6B7A4DF81018729256A86A49@OS3PR01MB7061.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7SMSlKSOtPbqKpVe06UiAebv5UjRElcoellp/qlhmgAykLfFSfN1ONGLg2/zALG/B264ouCYLnQcm1A6QcxTi7St7k8FlOtoyfT2noQfwaYdwmcGN1Npt+SuTIaG0XpK7z8ScEEF4sqCUoMQPiCZ+5HBISl6kkFWZxtI139n/cNCBR7EkO0fAbf5BFFW14+Q39u7QYe2Ixi6vAgwBeoedu9qNm5zf8aBl+arOs9J/Fuzn63lYEW8NT74MFe0siJppDSrGu7il1YbYaCippSAyJ0Lwq8DBJ3iYoaVD8Hn1YkDeIlSWZVfNGMa050J6Ij4bJVLccv50sHCD8+h0WqtPhuQCSb+tHco8wIU2sJAAg3X5eTLswsXldCXpQMtNEeYT1FqXE3640evHG0bCEWMUswkXxalMud4ROGFrcrPP0X1NEEBnFjYSDadbhKdc+9C4edI4eyUEhuaKadQj1zW//bD0fVrtNZB3SCoAzUO0zOegHpqmIvEDOCRHtBvXEJ1bHsoNhi2J8jgcDsB3ZAi/IQ+PgVBK6OIc0OWtrFV6BxESI90U2lM1NwzLikcFTWQ7f0J4vE8+j0rj/jcgqFSpfn8Ite8/FWJamTst49WPTc9dZJH+RR50iiQB+wageGC3ASlfIV1BW/XCUIwG+d9kVItmyP5YLUU8b+3aysWDQapXCMBfxqmxvK6FxVV7ovFTdpwExQKqZniG7A1soXpxg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(52536014)(6916009)(76116006)(38100700002)(2906002)(54906003)(26005)(7696005)(66446008)(122000001)(66556008)(66476007)(5660300002)(66946007)(64756008)(316002)(38070700005)(53546011)(6506007)(83380400001)(55016002)(186003)(71200400001)(4326008)(86362001)(107886003)(8676002)(9686003)(33656002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2k3cEsvT0RQNXByNitUR1g2US9vbW9EOHkycFRod0gvUG1rWTJMV0JnV0I2?=
 =?utf-8?B?eEM0SFNmYnhkV3Rxc2xtWTZuTDJrUGR0aVJVR3JQbFByL3ZjWXVVc25Hc0wx?=
 =?utf-8?B?WFk1WG1MYnh0NjJ2YlhqTktmVlBRNEZSMW1naFhjRnBHb21XWld5WlNjN3BZ?=
 =?utf-8?B?SWh5Z2pRVVgyaWhUTFZId2hTYktOMWtHY0g0djh4aVdIeXBhZGtTSXJnWDQ2?=
 =?utf-8?B?OUdreWx0RGgyeTh3UjJ6MHl5dmFXVDZSbHUxT3RnNVdmSSt1T1QwZnhrS1Bs?=
 =?utf-8?B?Y2w0UnhEQWFKZUc1ZnJUY0x2Vkh4WGhlbXVBc2dRbndKKytLT1BYRUFLYjZl?=
 =?utf-8?B?NUlpbVdjL3hlS2xPWnB1ZzJlRmNkUFJ5WUVFSWtDS2JSdXVSQzZraHZUYUNq?=
 =?utf-8?B?Z2dXZ1QwZGg5RGYxclZxYkU1R1RiM0VBWGlubm8yWEV0aE96aHFDNVBNRk5p?=
 =?utf-8?B?T2Y1L2VGdG53U0ZjbE5IbllwTzVYZjlzNThiQXM1aUl1enJXWFBmTnlmZVNk?=
 =?utf-8?B?bzQxQjViQjVnQkZtK2cxZ0RXQ2tldFlQTU9BcnhOczZOU3hIWUN6S0ZPcTFl?=
 =?utf-8?B?WlJKK25KMTNxWHliNWdPT0xqdzlqZXZSc3Arb0VlcU5xd0JMeGtWZzU3VWN1?=
 =?utf-8?B?Y0NoK0ZjQy9OMzJKQ01ML3BON3NBQ3dvS0pUOG5aQVNwVHdzS2J2RE9XYklv?=
 =?utf-8?B?NmdRRlRyK1lyMVl5bnNMR2c4UEp6c25sNlVOc1dNRGFZMFZTd3BVTisvZXVL?=
 =?utf-8?B?ck9sV1pSMU9SS0xYMmZlQjgxTG4zd3NNOUZLcCsydnJZOEFsR1BUd21ySnhq?=
 =?utf-8?B?Uk9URlFsTFE0K2p0azBpMCtKekt0VFJLNXNTMFU4VmxMUFlqT3NSNlNjS0hR?=
 =?utf-8?B?UFkzVHkzdCtQaU9HU000dWl3eUl5SEM0N1hGQ3lhTW1KZ3JtZU5jaGJiZVpL?=
 =?utf-8?B?WFdXN1ExSVh0Qmtxai9yVTMrWVMvQU9vTlZJMnI2ckkzWE0rL2ZXamF1SVBs?=
 =?utf-8?B?cVhHc0dlOGdiWmRkd3lhTzhNVmJwRkVYQ0hkTjcvSXBYYldEcHYyYy9sT1Yy?=
 =?utf-8?B?M1grUmJUREErS09UeTZlcjJKcGE0SmgxeHVKeXc4SFpDSDBobXo5cy9NMmgx?=
 =?utf-8?B?WmJXS0l4MmhzeXlWeGNGK0llRFU3YklOYXlkNElQT1dPWllmaklUVWNVcFNW?=
 =?utf-8?B?SlM0dFdyQUozNk55NmZOYzI4UmN1eTZ4c3paUFhjNENGSXdsbER3MlpUVk5x?=
 =?utf-8?B?RHFRdW1WRkUyMmZyK2ZUdHFXNlBuemhGYWFXemgrWVpSQisyT3Q1K3FYQm1t?=
 =?utf-8?B?OXpjclRuRWg2LzVrUXZIYWZUYmhJaHRCaWxkd0hKeUUvQWx3QkhEMStxSHZP?=
 =?utf-8?B?WEtKV0xTR3hMS1Y5bStPdjJaWHUzTXJZT2V2NVZiVkhMa2I3dU9FcUFqWTZa?=
 =?utf-8?B?Z3Q0NGRoMzloa2ZrRWsxQlBuTXB2Mk5hUlNnUE5RbDBjclhTUWQyRTJnK0o5?=
 =?utf-8?B?ems1MDJOaVVhQVhDL1F2TzYzLzZvTlRsZnNNQ2pLNTdzYk9zbkFBK3JpeTMx?=
 =?utf-8?B?Y0RXSkdseUI5VlpEQnI5UW1EdkJSRFZZYnl4UXpseEM2Uk5QVENzd1R6QTl1?=
 =?utf-8?B?cXBTaW5GL2l3cTNKVG05bHJYWkJMbjQrc3hiblZIZUN1RGxvL2IxRURMZlZk?=
 =?utf-8?B?WjBFck93eEdxR2tHRVVselJsV3RmdGpiY2dHWUtiQW5WdFBFOGlCb0I3L2lG?=
 =?utf-8?Q?CE+xLCVkNiUbZWLIisqmfg29ezx7h26Dpt82ORi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4cfb016-c301-44c2-b13e-08d97f3a338a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 09:03:39.6057
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OKgyEYp/sWBQCLgIFjfaUhe7sOZd8IKxBHxQIFmG3AzRM0q2GN7nUIbHhtbflpLvEcE2HgBQQeuKra1BptcbRf7XYJA83pDBl2JZeHSoL94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7061
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI0IFNlcHRlbWJlciAyMDIxIDA5OjQ2DQo+IFRvOiBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IENjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53
YWxsZWlqQGxpbmFyby5vcmc+OyBMaW51eC1SZW5lc2FzIDxsaW51eC0NCj4gcmVuZXNhcy1zb2NA
dmdlci5rZXJuZWwub3JnPjsgb3BlbiBsaXN0OkdQSU8gU1VCU1lTVEVNIDxsaW51eC0NCj4gZ3Bp
b0B2Z2VyLmtlcm5lbC5vcmc+OyBDaHJpcyBQYXRlcnNvbiA8Q2hyaXMuUGF0ZXJzb24yQHJlbmVz
YXMuY29tPjsgQmlqdQ0KPiBEYXMgPGJpanUuZGFzQGJwLnJlbmVzYXMuY29tPjsgUHJhYmhha2Fy
IE1haGFkZXYgTGFkIDxwcmFiaGFrYXIubWFoYWRldi0NCj4gbGFkLnJqQGJwLnJlbmVzYXMuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBwaW5jdHJsOiByZW5lc2FzOiByemcybDogRml4IG1p
c3NpbmcgcG9ydCByZWdpc3Rlcg0KPiAyMWgNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBXZWQs
IFNlcCAyMiwgMjAyMSBhdCA5OjU0IEFNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2Fz
LmNvbT4NCj4gd3JvdGU6DQo+ID4gUmVtb3ZlIHRoZSBkdXBsaWNhdGUgcG9ydCByZWdpc3RlciAy
MmggYW5kIHJlcGxhY2UgaXQgd2l0aCBtaXNzaW5nDQo+ID4gcG9ydCByZWdpc3RlciAyMWguDQo+
IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPiBpLmUuIHdpbGwgcXVldWUN
Cj4gYXMgYSBmaXggaW4gcmVuZXNhcy1waW5jdHJsLWZvci12NS4xNSwgYXMgdGhpcyB3aWxsIGJl
Y29tZSBhIGRlcGVuZGVuY3kNCj4gd2hlbiBlbmFibGluZyBTREhJL1NEMCwgcmlnaHQ/DQoNCk9L
IHRoYW5rcy4gcG9ydCByZWdpc3RlciBQMjEgY29ycmVzcG9uZHMgdG8gcDE3XzAsIHAxN18xIGFu
ZCBwMTdfMi4NCg0KUmVnYXJkcywNCkJpanUNCg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+
IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0
dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBs
aW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0
ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20g
dGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhp
bmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExp
bnVzIFRvcnZhbGRzDQo=
