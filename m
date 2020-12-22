Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7C392E0811
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Dec 2020 10:25:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgLVJYP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Dec 2020 04:24:15 -0500
Received: from mail-eopbgr1400133.outbound.protection.outlook.com ([40.107.140.133]:30336
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725947AbgLVJYO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Dec 2020 04:24:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Clch3R/2+VyT0PPev6wm+rFopjzys3f0Kdujc27Hks3dcvZlOAg+yKNV2nMDCsDzl1Jq20+ez56rTtLvUA77JxBA4108UtODleuyQubnkWpjaefb8Xgp86G8YftJ5je6CzM94nFAtphOmsRR5Q4WXE0RZ/klpcdacp+P/nKWzEbJsIymiUsZ2oU3juC+0p5MO/Cv0sQSMpZllk/zCPpXHUYgU1gqfMDlAnB70VvosuPYd+sEmTlZ/UjPFGSZvS9l1aEnXB3al0SUC6FXGKDJW6pYlXsbkuJ1+9v+JLYLS2CoaYD5h2vcWPxqdG3ysEmLfoYDOASjUkAFf/Ux9AGU8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVem1aIZvx7veOt6jZbHwL3xoQ+4EeivDfG2JrEtF+c=;
 b=OhS2AjOtU/cBW12BJq8z+/zWdQyoMgKLKpwGq3S+zvKY6LTXKkY9hFkTk4B/Mk2qEC+/K8w4bAuTnwc1AAXd91W//S6XuuohK8up/1461Udq8hZQD38jLtKbenJCFjbTmoakOAm/kIyd7sk8XE3l1PQ+xVXfBp39xw2+j8H9QQhwkR5E0EdlkTbXVJTRcEYGLcPQaEJtxbb+UrAJuIrRFTLFqUJUpMU9GrKFUNmdWaOfKZ9k2uNLgXpBJcxIfLzVCJWRCNHJufs8rHR3YKuIga8Y8WPVWWHaLx62+veWwW3s7drWW3R6nDtkQlpB6hKn5RilGJZGDBvy36IWjt6thg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVem1aIZvx7veOt6jZbHwL3xoQ+4EeivDfG2JrEtF+c=;
 b=U62HWbO59UTjSCw6/8ZioCyJ8AClIej9ABO6WP0xWrO8EC3botKTEkkf4qbQ891egZmjIWFmSEp8NgR1TGF0FO3PdRKWZq6RIYEfpIokF0m+ZacUsfUv/9HX5rKrLbxCLgD2HBqE3KWqCW2ESO8EJb0Qg852jo0rscFc8Gm5CsY=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB3647.jpnprd01.prod.outlook.com (2603:1096:404:bf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29; Tue, 22 Dec
 2020 09:23:25 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 09:23:25 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 12/12] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Topic: [PATCH v4 12/12] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Index: AQHW10Sk0N1z3uPelU2TClNF0Jib9KoC0R+AgAAHfyA=
Date:   Tue, 22 Dec 2020 09:23:24 +0000
Message-ID: <TY2PR01MB36920B85DFCE969BF8AF229CD8DF0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1608519279-13341-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608519279-13341-13-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXkRUbjQk=1mqn0b7PeGX0ir=s4UwbCHfw_2mWaVEVPTg@mail.gmail.com>
In-Reply-To: <CAMuHMdXkRUbjQk=1mqn0b7PeGX0ir=s4UwbCHfw_2mWaVEVPTg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:21dc:f9ce:ff84:4ded]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fee9e6fa-ab21-4fe5-63c8-08d8a65b3be6
x-ms-traffictypediagnostic: TYAPR01MB3647:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB36475AEBDEFB749D39C8E105D8DF0@TYAPR01MB3647.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qbMz1WNTAoLaTW72lBUlciAMYVWrAXJnkgVOz5kvVL9fWfW4RrYDnHFzInHu39tf6F9y2ivqvZDr9NSGRRXHPQ4PNM+Mm76ulP3VqYbVYdZi2zUCmLsGf+lkLJIazLdNEDnhr3OO4JDS+p3mBh27v0wMS5JgrvFuixGWcJYHCRDcGhAaLQ0LdNPwTZf09kw6mf95525SwZTUsbQAmMcgTP3p2+XY/QCRFKju1fjMfabPYzJjahYMG7dTx6sNVDRkpAYFylGC0UOkRibnzjAcHX3d8JEmF9zBKpazUbib1jYUUoIBCfS2HIh0nfnAk1ZWsDPp33+qOnW9dA0BJYF3pfqSZuuS0OaIZyGWBjwlHlossqyPASQVu+drzunBQemvYeawjWgdgZoACy2pmh2SdQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(33656002)(52536014)(2906002)(8936002)(8676002)(316002)(66446008)(6916009)(55016002)(83380400001)(9686003)(54906003)(6506007)(7416002)(66946007)(64756008)(5660300002)(71200400001)(53546011)(76116006)(7696005)(478600001)(66476007)(66556008)(186003)(86362001)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?N0RNbWVzTTFxU2oxSVpsYlcvUW54MTJZSGxzWnF5d1kzVTMwZTJlV3VJSFBp?=
 =?utf-8?B?SGI2a2pWc0Q3aUk3amdoV1p6d1dtUXVGdFFCNTRBb2c1UUFqR1lrNCtEV2d0?=
 =?utf-8?B?ZUc0Z0JBcXlhZ092N25WUzZUY21vTkNKem9zcDZFYm43U25TbTF6anVGRnZZ?=
 =?utf-8?B?U0ZqekpWV0hiR3hUWnNDeWUyZXZ6SWlrc3AzaTNaMlBXcEVGa3dKVTZWMXdY?=
 =?utf-8?B?blQydGdvblFIaDcwZndwUUN5UEtWSmdtRVM5c0pXTXhWanF4WjFNOWxVZ0hR?=
 =?utf-8?B?NEptdFBEUm5MZUJYaG5rRkZIUnc4QmFBTjN3Q0ZtWEFqOWdKUDNReWE5UVlv?=
 =?utf-8?B?T0xIY3kySUtnNnd5NW8xM2xTc05VTkV5RFo3b3Y2SUtCeDhrVFRFK0poN3d5?=
 =?utf-8?B?TmViUktUVmIxUkFUUHQrZkJEWFNHbHZMNEY5QWQ0WDFMVXM0Y1czTzJvallT?=
 =?utf-8?B?RXF5WkRMV241b0NEdUVjK3hQM3JtVWp1UklJam9KRDJOUWs2c2JoVHh0TnB2?=
 =?utf-8?B?aUkrWjlUcG54dWtxZmlhbytRVGQzK1ZDd21iREdvUURzcHlnU0VWQ3RMTFc4?=
 =?utf-8?B?dXdmbU1CSU1kbWV2aDZJUXEzRzYxQ0tXTXJhOEJlY0pEUWlzdHcwQmlkQzlO?=
 =?utf-8?B?WmpNNnAxdFV6K3RmWTdEQWdJbWJwampMNTVYNVZqUVJpNEdWOEJMZE8rNHlC?=
 =?utf-8?B?UmUvMXpzSDQyd0tYNU9YbktOYTNJdlAzMmFJTkJEVFJGbVhSVHdQYjFDUlFu?=
 =?utf-8?B?WEhSY2JnWC9iaHpoZitxcEIxYndGRTBNRmYxcHMvRE53R3VLeFNLdW5Obk5w?=
 =?utf-8?B?RlBjL3M1SU9iaXdpdWxsV2VvcTg1dmpEMCs5R25VTHBrZzJDaTJMZmFuejZS?=
 =?utf-8?B?L3pGR2xGQ2dBcXoraHIrd2lESEQ1ekgycVRLQTMrWktScEVyTGNPejlZckw3?=
 =?utf-8?B?a1NOY0l2d05Nd0NuZEI2VWx0S0dsMmhuMk83c1MwN0l0VDBLd1hTYmFXdDJj?=
 =?utf-8?B?LytrT1ZUNmp3bWx3VkpsbUx2aDNsdGVhY3hNb3MxWUxESTZSUWJyRGR6OGpE?=
 =?utf-8?B?bGRRbmQyMTA1alBzQnUvbnZMNXgzNXM0WXB4SSsySXFGSWdEY1Y0d1orT3dy?=
 =?utf-8?B?dXhuQmhhMmVVZDdONlJqUFhnMk9pd1R1Y0IwMzVHWU1ZR0p1Z2szS1MxNm0z?=
 =?utf-8?B?YTlVSDlIUWkxR2wxZzE3MnppVXFpanhNejZ6UTNNWWJmTkV0Z2xOeUIxMytt?=
 =?utf-8?B?cjN3emYvajI4YVNuQ1hBTE0wa0dvNlFrdENudEZSclVyREJQL0NmSnNyUStW?=
 =?utf-8?B?ZGRQZjBZUGJIQkJKazNtd1o0aklNZkxBa29lWHlqM1FWeHJZa2psTHMxeS90?=
 =?utf-8?Q?xl/uSeyCBPbEdBqYhkW5jPLEF5JAQpjw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fee9e6fa-ab21-4fe5-63c8-08d8a65b3be6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2020 09:23:24.8495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kb7Sn9E87wCZlSl7hg+UmeqcRuww99Dw9XyUclNMXyEkf3zfoV1vkFEd2mhJeafqgg8lt/m5sDl5Jjl1vzT+hewmLqVo+YUzRQFPy3zxMmKkIQU1T+aMzRDNu3ON2I4k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3647
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2RheSwgRGVjZW1iZXIgMjIsIDIwMjAgNTo1MyBQ
TQ0KPiBPbiBNb24sIERlYyAyMSwgMjAyMCBhdCAzOjU2IEFNIFlvc2hpaGlybyBTaGltb2RhDQo+
IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo8c25pcD4NCj4gPiAt
LS0gYS9kcml2ZXJzL21mZC9iZDk1NzFtd3YuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWZkL2JkOTU3
MW13di5jDQo+IA0KPiA+IEBAIC0yMDAsMTIgKzI3NywxNCBAQCBzdGF0aWMgaW50IGJkOTU3MW13
dl9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LA0KPiA+DQo+ID4gIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGJkOTU3MW13dl9vZl9tYXRjaF90YWJsZVtdID0gew0KPiA+
ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJyb2htLGJkOTU3MW13diIsIH0sDQo+ID4gKyAgICAg
ICB7IC5jb21wYXRpYmxlID0gInJvaG0sYmQ5NTc0bXdmIiwgfSwNCj4gPiAgICAgICAgIHsgLyog
c2VudGluZWwgKi8gfQ0KPiA+ICB9Ow0KPiA+ICBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBiZDk1
NzFtd3Zfb2ZfbWF0Y2hfdGFibGUpOw0KPiA+DQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaTJj
X2RldmljZV9pZCBiZDk1NzFtd3ZfaWRfdGFibGVbXSA9IHsNCj4gPiAtICAgICAgIHsgImJkOTU3
MW13diIsIDAgfSwNCj4gPiArICAgICAgIHsgImJkOTU3MW13diIsIFJPSE1fQ0hJUF9UWVBFX0JE
OTU3MSB9LA0KPiA+ICsgICAgICAgeyAiYmQ5NTc0bXdmIiwgUk9ITV9DSElQX1RZUEVfQkQ5NTc0
IH0sDQo+IA0KPiBXaHkgYWRkIHRoZSBjaGlwIHR5cGVzPyAgVGhlc2UgYXJlIHVudXNlZCwgYW5k
IHRoZSBkcml2ZXIgdXNlcw0KPiBhdXRvZGV0ZWN0aW9uIG9mIHRoZSBjaGlwIHZhcmlhbnQgYW55
d2F5Lg0KDQpJIGp1c3QgYWRkZWQgdGhlIGNoaXAgdHlwZXMgaW4gdGhlIGZ1dHVyZSB1c2UuIEFz
IHlvdSBzYWlkLA0KdGhlc2UgYXJlIHVudXNlZCBhbmQgd2Ugc2hvdWxkIG5vdCBhZGQgYSBmdXR1
cmUgdXNlIGluIGdlbmVyYWwuDQpTbywgSSdsbCByZW1vdmUgdGhpcyBjaGFuZ2UuDQoNCkFsc28s
IEkgdGhpbmsgSSBzaG91bGQgcmVtb3ZlIHRoZSBmb2xsb3dpbmcgcGF0Y2guDQoNCltQQVRDSCB2
NCAwOC8xMl0gZ3BpbzogYmQ5NTcxbXd2OiBBZGQgQkQ5NTc0TVdGIHN1cHBvcnQNCg0KQmVzdCBy
ZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
