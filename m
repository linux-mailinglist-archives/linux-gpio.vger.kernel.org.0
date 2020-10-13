Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB9D228CEDC
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Oct 2020 15:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727810AbgJMNEx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Oct 2020 09:04:53 -0400
Received: from mail-eopbgr80075.outbound.protection.outlook.com ([40.107.8.75]:40833
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727151AbgJMNEx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 13 Oct 2020 09:04:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDM8uPqjwE+do0bsQxq/eByJj+eBR1UFjp+AGHednPtpv1mC1Ej7Lui89ecZgsgdXKqA5/kABHQF8CP6xL9t9J4XvACbVbqW83jl67K+G7N0AHhXaZM4e2jH+jQFLfiRrnqmw8M+DqQYX6lnO4BK3dqXWN1V1XNdiGfAnKNg5BLKHy6xXXcLdrwUWuvKUvSt6pLemzQSXZNG8OqbHDksx2H4ImwLMFvP9XwuIz4sDrcpmKg/YtrlbGgbSJcIsCMOpor/cRKdddqvcoqGxne9MIG790+LJsOHSygd7ChTEjjqCpo0YJtTVbHn+/66SOKqqkS0kFagLJ0THHAE4YcgPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oyt/ZLLf/v7pWrDUKSqxSd6Pd/hCJ9wtnG0YMUCyx+Q=;
 b=LaKy1oAvr9D6FDeBM/HDThJ2mK2PRcfoOEH+Xf+JOkzAg5FzPMw6aFGiJNZuvA7pWdC+mt82tU7PkOXcESglPhNkzwvgq+8nSNFjSFe+MpXly5GGoQl9VqzpoD0kpchqCWtpoAILBvDTzvyNNvzG3We5c1ePfHOuAsrpznRgsqYKNiT8nuq9NAWj1UCigS6e8/RCY3K2obK2V5BK1reLxxuVKEsHjLQ3gbe8MnItlqQLSMSpOS7JIOHIl/jmeicTMTyi4mzaQRO28qflN/y0x4A9Zia5N0NpRqIPjSQttvvMAXqGDmPC3CkE+x1iE7AHQpgL8kSt1wvNed/xOohDjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oyt/ZLLf/v7pWrDUKSqxSd6Pd/hCJ9wtnG0YMUCyx+Q=;
 b=A5VAa6+Fbs6buCWWrjK+ns4XQBgffapkiTFObkGds84maKpKDzMd4Qgk9tvM/f/EYeHDpeFrJ3MmTpohASMQetlPX1HagSF03tOeTdGI8+CeGdAKeQcrN/mW3GLrMJOa3W6asHLYInraDGkCHKCzLUN1yn7W2yMKyJUJh+pOMcA=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB3975.eurprd04.prod.outlook.com (2603:10a6:209:40::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Tue, 13 Oct
 2020 13:04:49 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::546f:92f0:f3c5:a148]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::546f:92f0:f3c5:a148%7]) with mapi id 15.20.3455.029; Tue, 13 Oct 2020
 13:04:49 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Anson Huang <anson.huang@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>
CC:     Russell King <linux@armlinux.org.uk>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "oleksandr.suvorov@toradex.com" <oleksandr.suvorov@toradex.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Peng Fan <peng.fan@nxp.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Olof Johansson <olof@lixom.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "prabhakar.mahadev-lad.rj@bp.renesas.com" 
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Lubomir Rintel <lkundrak@v3.sk>, Joel Stanley <joel@jms.id.au>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Leo Li <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V3 1/4] gpio: mxc: Support module build
Thread-Topic: [PATCH V3 1/4] gpio: mxc: Support module build
Thread-Index: AQHWjLUcSolWzL5GLkyvsHmD9a65ial/qOwAgBRVT4CAAarGsA==
Date:   Tue, 13 Oct 2020 13:04:49 +0000
Message-ID: <AM6PR04MB49664C2695E5C428F04CE92180040@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <1600320829-1453-1-git-send-email-Anson.Huang@nxp.com>
 <CACRpkdY-A6i+2SRVn9TJC8C3+rYa1qMcSHSwOaR_jKfxjOK2VQ@mail.gmail.com>
 <DB3PR0402MB3916B06402B0C4D07325F61FF5070@DB3PR0402MB3916.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR0402MB3916B06402B0C4D07325F61FF5070@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f5c73cac-e61e-4e00-b08c-08d86f78915c
x-ms-traffictypediagnostic: AM6PR04MB3975:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB39759DC5508C37DAA116AED480040@AM6PR04MB3975.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p/DAliPY31UEwJMNtD2oD9uA6ZQeqihReJZEEe64SnOOmS7tqjdRM/sJd6AecD8NIZ/ZATlSPxgBh6RSQJvPV6sO7Y9muiG6MJwQiHqY+YuLusO6aD2q+GEzBVoE5EoSFZLymGHhqQyfhfuHWhHVl9NNXfSb/BJ7A079I6UbiPZ51wxK3jr+wnX77xhpFrn7oXdY1cL9Rrv1J9whbfgJNG8KZGIrVsAguxvRg8FAEV6NuzaVUWlK0mujBmk//mgBs9MEw0pR0t2xjP/5yqakjo+AJSWH14JtkWqFBJY8n9puTj22qhmBHg14fROmRWXMfcj6vkgeBcEskOTOQu06sw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(366004)(39850400004)(396003)(5660300002)(186003)(6506007)(53546011)(478600001)(76116006)(2906002)(7416002)(66446008)(64756008)(66556008)(66946007)(66476007)(26005)(4326008)(55016002)(7696005)(8936002)(8676002)(316002)(71200400001)(86362001)(83380400001)(110136005)(54906003)(9686003)(44832011)(52536014)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: voA9L6i6PjDtHLGA+7NwK1iYxllxHFi7Po8cOi8jVPY3ZoJ4aBSeDLWN1ngDGdj7bm4DZA1hGiyroEusLgzaCBP7X9hvvyfDsQxg2SdjfrXu9ek2u0euBRhRC75eHPeIpmoIYIywwTpJT83k7NVLlJ9U+22Z4IFdKy6O+Fx/OrmWamDm0A4iE2oT32uYw49tMrx1XGKcxuUixUTbVHlAKdoUlKnGyEf52MziO6jJ/Fj1v033RWd73dEvRsFbI9VYzz72G9PSnjqIvblTWJYZwSgYpPv3qIq6x5e5Y3f3NIYz/hMhmrqdB2ajD+MTNPHBCNhE29smOqFR1lfaIR/38Z1B36CVtL9QBl5hojWFJ4PrG3iRe+NkOpzeZo0J/yoL5CCxkpz1gF3+MsG8wtWVUcgD4cjyuQ8fW5mm7pZEx1jbTRhe43E1h5JGrjMpVoiL4OsWIQPWsUwxw7/mSnd1csqOd1kAef1QDWQvP/sfAb+6Ypf0gmrhGguJiXHnkI6hMmnf0kAjqi36amzq490QEMMQJ1M8LyCpVbpBKJJSoSiussc3nNKWVFzLQMC2OSCRT46exGfNDiIsHL02WgX5zX71J8CeitLjtYvDnDGnnwAUkjzj+PoARSb9rgdWq1cycswM/NX/fpcK6IL+8XWPaA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c73cac-e61e-4e00-b08c-08d86f78915c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2020 13:04:49.5806
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ewfpoKeRVJSiqk3icVVYq8LcT0r6HX9CPW0dOPA+WOEFu09jYviHf5D0Z+PelTbWVKKkClOy4b3KKeFkqUjs0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB3975
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgU2hhd24sDQoNCj4gRnJvbTogQW5zb24gSHVhbmcgPGFuc29uLmh1YW5nQG54cC5jb20+DQo+
IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAxMiwgMjAyMCA3OjM2IFBNDQo+IA0KPiBIaSwgU2hhd24N
Cj4gDQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCBWMyAxLzRdIGdwaW86IG14YzogU3VwcG9ydCBt
b2R1bGUgYnVpbGQNCj4gPg0KPiA+IE9uIFRodSwgU2VwIDE3LCAyMDIwIGF0IDc6NDAgQU0gQW5z
b24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQo+ID4gd3JvdGU6DQo+ID4NCj4gPiA+IENo
YW5nZSBjb25maWcgdG8gdHJpc3RhdGUsIGFkZCBtb2R1bGUgZGV2aWNlIHRhYmxlLCBtb2R1bGUg
YXV0aG9yLA0KPiA+ID4gZGVzY3JpcHRpb24gYW5kIGxpY2Vuc2UgdG8gc3VwcG9ydCBtb2R1bGUg
YnVpbGQgZm9yIGkuTVggR1BJTyBkcml2ZXIuDQo+ID4gPg0KPiA+ID4gQXMgdGhpcyBpcyBhIFNv
QyBHUElPIG1vZHVsZSwgaXQgcHJvdmlkZXMgY29tbW9uIGZ1bmN0aW9ucyBmb3IgbW9zdA0KPiA+
ID4gb2YgdGhlIHBlcmlwaGVyYWwgZGV2aWNlcywgc3VjaCBhcyBHUElPIHBpbnMgY29udHJvbCwg
c2Vjb25kYXJ5DQo+ID4gPiBpbnRlcnJ1cHQgY29udHJvbGxlciBmb3IgR1BJTyBwaW5zIElSUSBl
dGMuLCB3aXRob3V0IEdQSU8gZHJpdmVyLA0KPiA+ID4gbW9zdCBvZiB0aGUgcGVyaXBoZXJhbCBk
ZXZpY2VzIHdpbGwgTk9UIHdvcmsgcHJvcGVybHksIHNvIEdQSU8NCj4gPiA+IG1vZHVsZSBpcyBz
aW1pbGFyIHdpdGggY2xvY2ssIHBpbmN0cmwgZHJpdmVyIHRoYXQgc2hvdWxkIGJlIGxvYWRlZA0K
PiA+ID4gT05DRSBhbmQgbmV2ZXIgdW5sb2FkZWQuDQo+ID4gPg0KPiA+ID4gU2luY2UgTVhDIEdQ
SU8gZHJpdmVyIG5lZWRzIHRvIGhhdmUgaW5pdCBmdW5jdGlvbiB0byByZWdpc3Rlcg0KPiA+ID4g
c3lzY29yZSBvcHMgb25jZSwgaGVyZSBzdGlsbCB1c2Ugc3Vic3lzX2luaXRjYWxsKCksIE5PVA0K
PiBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKCkuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTog
QW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQo+ID4NCj4gPiBUaGlzIHBhdGNoICgx
KSBhcHBsaWVkIHRvIHRoZSBHUElPIHRyZWUuDQo+ID4gUGxlYXNlIGFwcGx5IHRoZSByZXN0IHRo
cm91Z2ggdGhlIEFSTSBTb0MgdHJlZSENCj4gPg0KPiANCj4gQ291bGQgeW91IHBsZWFzZSBoZWxw
IHBpY2sgdGhlIHJlc3QgcGF0Y2ggb2YgdGhpcyBzZXJpZXM/IE90aGVyd2lzZSwgdGhlIGkuTVgN
Cj4gR1BJTyBkcml2ZXIgd2lsbCBOT1QgYmUgZW5hYmxlZCBieSBkZWZhdWx0IGFuZCBpdCB3aWxs
IGJsb2NrIGtlcm5lbCBib290Lg0KDQpUaGlzIGJsb2NrZWQgYSBodWdlIG51bWJlciBvZiBpLk1Y
IGJvYXJkcyBib290aW5nIHdpdGggbGF0ZXN0IGxpbnV4LW5leHQga2VybmVsLg0KV291bGQgeW91
IGhlbHAgcGljayBpdCBBU0FQPw0KDQpSZWdhcmRzDQpBaXNoZW5nDQoNCj4gDQo+IFRoYW5rcywN
Cj4gQW5zb24NCg0K
