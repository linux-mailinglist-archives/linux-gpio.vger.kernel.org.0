Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FBC72DB8D5
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 03:14:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725768AbgLPCOm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Dec 2020 21:14:42 -0500
Received: from mail-eopbgr1400097.outbound.protection.outlook.com ([40.107.140.97]:7917
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725601AbgLPCOl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 15 Dec 2020 21:14:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuQBH+4UppA6lgge8Rj3xmBkZmazlc6gJa4UR3yB73X3H0B8Eie5R5gjMJ/j2JvWvsHcn9raRpRufbtn84C3rRpyDm/NjpkAnbQmrWEVxhf0FOVsZsL6WVnGhcRAwNX/XQlL7DjpnwnAS8TJWlcyNVc4mkEBQWl3EonqtJxu3Oz20XXjW/AnN+jZtcIwd09af3fwUZ+Fuboh5ckJjRVIehbypfeQZeIIot5MOFeFjrB+EYZTsbDRT3DaJTnrd1RXIUC5/eq+dXr3IwjhKWzJ4dUAGWWFPXQT0bCBLkaae+3cDYih0RLO0UGLN4tAN+TPhh7v7J2r3RpBc/pYoMO9WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgNWWcqqZ3jEpDsJzkaMKLGIpGaR/+KMvMFsZGGEWH0=;
 b=Kim172uohhLzqfuzXcfFnkBKiJLRA5SQmB8OAn9uAncSA/DZnFgkvMZO4k5F4ECMIaXZ7GLsqavLQ9+2WRfTSGoXLiO0fnf+rgT5ILrRuXPmeUS0bAAThNZeqAr9Zcr5GzuD0dnm46Ff45/EIXg7acgSmy+QssuVuIezkz1SUQcZXC/UO2jnC2dsns0bBRTZ6oLJlzalxBOYMxyI5fgdJuan5RGJd55ooKIjsvNt2SpW3IkcevYAoDOrdYbvvKMon5p3Fmz6WJWTFSTxQ6ie+ficqt7Ci96wfdTyZRDcyxJVPd1a3yauD/7ck9lEFiZOolHrbYVkHsgfhCXXPeoynA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgNWWcqqZ3jEpDsJzkaMKLGIpGaR/+KMvMFsZGGEWH0=;
 b=Hg9nH3Lnz/vf4s74CBDirHUn/MEEK9DuuMcKy/cK0sfS86IbVr36fC1pAqe8V8flnvA9/vFP2qxYxyzi/DUeHlyd4S5THLDSLjcd9U7GvwPUM2+Ikmu99KIOHF8rWywHUKpWQPIWs2d7rgKp2AYHkAluf5yufq45QHIaWSoLTbg=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYBPR01MB5391.jpnprd01.prod.outlook.com (2603:1096:404:8021::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.19; Wed, 16 Dec
 2020 02:13:53 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 02:13:53 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
CC:     "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 03/10] regulator: bd9571mwv: rid of using struct
 bd9571mwv
Thread-Topic: [PATCH v2 03/10] regulator: bd9571mwv: rid of using struct
 bd9571mwv
Thread-Index: AQHWz7CtcBQdrCMyek+ipxZCKFImbqnxywEAgAaNBgCAAALugIAAp3Yw
Date:   Wed, 16 Dec 2020 02:13:52 +0000
Message-ID: <TY2PR01MB3692684E65CD04B38BD0B69BD8C50@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1607686060-17448-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1607686060-17448-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <cbb8c9b1884ea5e535bcafda1218b941bd665c21.camel@fi.rohmeurope.com>
 <CAMuHMdVgo1fuY9jPpxUJiCOmN4Ahs7YXddzUfKH+4106i1xiuA@mail.gmail.com>
 <CAMuHMdWuoRMsNMPKgni3HENRT7RnCTyEjs5Zy2r4gw9f2B0Cng@mail.gmail.com>
In-Reply-To: <CAMuHMdWuoRMsNMPKgni3HENRT7RnCTyEjs5Zy2r4gw9f2B0Cng@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:68c8:85be:c13a:922b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bfef45a2-7b4e-4b10-f738-08d8a1683c20
x-ms-traffictypediagnostic: TYBPR01MB5391:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYBPR01MB5391E005003718EE4FB1F928D8C50@TYBPR01MB5391.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9LUVmZtbZhIoBCZy9rf0SshjuXFN/Xwz9fqwSQEpNlt+P08g4VhCLLCTJVElvHQrxOUX+zKwjhRkVFyJIY6kB93MupoUsTA0kXuK/z49RHqv6q87NLbdCt/hvYIrQF15QIprCD/JxzV5JVrOWAj87RL0GYmN87gFTydc8JGfUC1JX+p26aTPI0EgdQQy/pXDjmJJX73vbBc2mLHILsom8KMaKwRrKNjfhMhJskBNGEYHJE/VhLJt8WXc2f8XoTjeWQV+Y/B73vxjqIzzn17Zvm3dMsSvFHQzJ5/498IkSAHtyazcaEoJFGT9Ft8rxRgH22zLA4vccWwksHECP+PpDw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(9686003)(54906003)(186003)(8936002)(55016002)(316002)(6506007)(110136005)(71200400001)(7696005)(4326008)(8676002)(2906002)(64756008)(66556008)(66476007)(66946007)(478600001)(4001150100001)(7416002)(66446008)(33656002)(86362001)(76116006)(52536014)(53546011)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?a2MzUi9wT2E0WXYxNlF2VERFcXcwWTczNmNleTYyeUxKaFJzVXNLaGZmQXk5?=
 =?utf-8?B?UTl4U1JSZllNK3Y2YTZ0TXNFRjc5Nit3dDZHaDVoWVNMazFjWGt5YmhkWEV6?=
 =?utf-8?B?UUhaaHBrVk9uTTBqOW9qWXE4NEtxRzdkNTM4dGRKVlN6WEJsZFhMZTI4MkhR?=
 =?utf-8?B?VWZyQ1B1RkxMaGhwdnRvWnlvRjA0VUFNdUFtaVJoYXR5ajI2R256c0U4RVV1?=
 =?utf-8?B?RHZhYzlCYzFHT3ptMmlnSTFuNmR5NzRFdENsS2d0SUtyMlJTUjQ2SGl6dUdw?=
 =?utf-8?B?Q1RhUDFDYXhrNEIycGJqOEZiUnljd09aMk9BWFdzMTdmVExhZTJVL3MzbGQ1?=
 =?utf-8?B?TXNiQklxNWQxc2plZlU0QTQ4eUZXeDJiSXQ1Qmhia0ozRHJZcUZSaWduMzlB?=
 =?utf-8?B?TjB4VnkwcWFrT0VZbWNBOE5CdnR2SXoyVmVQVCtKcXZTS0xxOHo1eERneVFt?=
 =?utf-8?B?VjhnTkpzR2U3WWtONTZBRG1lTUFTcmh3d0hRNjJXWGFrOUI1dmhhRm44Ly9U?=
 =?utf-8?B?NDdQWXdtZ0ExRU5XbkVLWmM0ajFxQ3BEdVIyWjlCUERlUDZqYVo3K0dpN3Ru?=
 =?utf-8?B?Nk5TNlFkTUJvckx6SUlyWHBSOEl2YXkzcDg1L1ZhZnJSSVdZeUdEY2hFa1B6?=
 =?utf-8?B?dXlTWDFHU2Y3NGVRQmNnc3FtSHRBeElPL2lOMkVHWUIzT2E5VG9JcGU0Znh1?=
 =?utf-8?B?SkUvNldUVkhLVXVseGtySmQrS0JHdlVhYWl3R1RWWnpRN05FeEVLNC9neE9Q?=
 =?utf-8?B?MFRSeXk5SXZXZGFTS0wraXBmWWoxeTFOaGlCbE9saVFVUVVBaksxdWdRK25h?=
 =?utf-8?B?QU81WTRmRHRMdjE4TE1YVk91Nzk1aUFwdzRuNFBOV2YxV3NCMFhTcVdMVm1G?=
 =?utf-8?B?UnpsODYzV2o4MTUrck80UmFVVmxwNmxKRFEvMm93YXZUaTZpN1VJdnJMcFBI?=
 =?utf-8?B?d2M5bmVQalh0VGdyUmcxRWhVVkFBeXEyMnpFbWcxWGJBUDZPcVZGbUtoajdO?=
 =?utf-8?B?TDFoVTVyUVhFSUFKcVZ0MFpxdjlVWStDMlIrWnIxeURYQ1lKbHlmOEdEcXo0?=
 =?utf-8?B?WkNpYnNkSllzV2psWWRlV3R0VkRRU3JNdkJzOUFoVEZMZXY0NEo0Vk1sNE10?=
 =?utf-8?B?SzlaN2lnK2IwTWp6Um5oL3J6RENaUVN0c0tkVTBRaFUvTUIxMkNBOFh1Y0Mv?=
 =?utf-8?B?M0c0aEtHL0VtWTYwSkZRdHRaSHlCSXlMUGo0MFQ0WEVkdGJ0Vm9Od0EvK2tS?=
 =?utf-8?B?dW5WWjUyM2srQWRnYzQ5WGVXR0w0Vkk4L01Qd2VyOENTSFRrOURnNFI4OWVa?=
 =?utf-8?B?QjNDR3pKNDdaMmF4SXdaZFFFUW1NRVBEc0w2Sk1PRE1yZGdCd3RoMFVYQ2pO?=
 =?utf-8?Q?UheP8bnPbfj7jem0xUabqC1UY7IdK9oI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfef45a2-7b4e-4b10-f738-08d8a1683c20
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 02:13:52.9070
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nxyMiu7spyA3vfYXdJs5RkkdcaO9vNshWNjv58x2sC8hOIO/cAJp1CJ/1fNICDHW9ospY1IHPogPmOqxqO5xp6pBYBf7QLuGBdvpRyc/BPDTFqt9NHCgDnvcxhQPu+Bh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5391
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgR2VlcnQtc2FuLCBNYXR0aS1zYW4sDQoNCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuLCBT
ZW50OiBXZWRuZXNkYXksIERlY2VtYmVyIDE2LCAyMDIwIDE6MTMgQU0NCj4gT24gVHVlLCBEZWMg
MTUsIDIwMjAgYXQgNTowMiBQTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsu
b3JnPiB3cm90ZToNCj4gPiBPbiBGcmksIERlYyAxMSwgMjAyMCBhdCAzOjAzIFBNIFZhaXR0aW5l
biwgTWF0dGkNCj4gPiA8TWF0dGkuVmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPiB3cm90ZToN
Cj4gPiA+IE9uIEZyaSwgMjAyMC0xMi0xMSBhdCAyMDoyNyArMDkwMCwgWW9zaGloaXJvIFNoaW1v
ZGEgd3JvdGU6DQo8c25pcD4NCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9yZWd1bGF0b3IvYmQ5NTcx
bXd2LXJlZ3VsYXRvci5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvcmVndWxhdG9yL2JkOTU3MW13
di1yZWd1bGF0b3IuYw0KPiA+ID4gPiBAQCAtMTcsNyArMTcsNyBAQA0KPiA+ID4gPiAgI2luY2x1
ZGUgPGxpbnV4L21mZC9iZDk1NzFtd3YuaD4NCj4gPiA+ID4NCj4gPiA+ID4gIHN0cnVjdCBiZDk1
NzFtd3ZfcmVnIHsNCj4gPiA+ID4gLSAgICAgc3RydWN0IGJkOTU3MW13diAqYmQ7DQo+ID4gPiA+
ICsgICAgIHN0cnVjdCByZWdtYXAgKnJlZ21hcDsNCj4gPiA+DQo+ID4gPiBBcyBhICduaXQnOg0K
PiA+ID4gSSBtaWdodCBjb25zaWRlciBhZGRpbmcgdGhlIGRldiBwb2ludGVyIGhlcmUgdG8gYXZv
aWQgZXh0cmEgYXJndW1lbnQNCj4gPiA+IHdpdGggYWxsIHRoZSBia3VwX21vZGUgZnVuY3Rpb25z
IGJlbG93LiAoanVzdCBwYXNzIHRoaXMgc3RydWN0IGFuZA0KPiA+ID4gbW9kZSkuIEJ1dCB0aGF0
J3Mgb25seSBteSBwcmVmZXJlbmNlIC0gZmVlbCBmcmVlIHRvIGlnbm9yZSB0aGlzIGNvbW1lbnQN
Cj4gPiA+IGlmIHBhdGNoIGlzIE9rIHRvIE1hcmssIE1hcmVrICYgT3RoZXJzIDopDQo+ID4NCj4g
PiBTdHJ1Y3QgcmVnbWFwIGFscmVhZHkgY29udGFpbnMgYSBzdHJ1Y3QgZGV2aWNlIHBvaW50ZXIs
IGJ1dCB0aGF0J3MgaW50ZXJuYWwNCj4gPiB0byByZWdtYXAuDQo+ID4NCj4gPiBQZXJoYXBzIGFk
ZGluZyBhIHJlZ21hcF9kZXZpY2UoKSBoZWxwZXIgdG8gcmV0cmlldmUgdGhlIGRldmljZSBwb2lu
dGVyDQo+ID4gbWlnaHQgYmUgd29ydGh3aGlsZT8NCj4gDQo+IC1FRVhJU1RTIDstKQ0KPiANCj4g
c3RydWN0IGRldmljZSAqcmVnbWFwX2dldF9kZXZpY2Uoc3RydWN0IHJlZ21hcCAqbWFwKQ0KDQpU
aGFuayB5b3UgZm9yIGZpbmRpbmcgdGhpcy4gSSdsbCBmaXggdGhpcyBwYXRjaC4NCg0KQmVzdCBy
ZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
