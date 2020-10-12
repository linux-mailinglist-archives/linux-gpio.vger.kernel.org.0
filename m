Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B14C928B3DE
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 13:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388197AbgJLLfu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 07:35:50 -0400
Received: from mail-eopbgr00080.outbound.protection.outlook.com ([40.107.0.80]:53831
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387617AbgJLLft (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Oct 2020 07:35:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaC2VTCA4D1FzbmXkP+tMXqUYURRuLpJonaK1fDJ13MO6Z/gDeI5X1XGtdbUmxyfbuTjNSKNSLoE3zvKO8rV1yl6hrgnA8GyoGXIohVuuudT3EyzC//Q1G/ICFPAILXX/XIq2bsHWvl58PeR/rNkTFLkrPgAT6iFqJ6OZqfeoTDELWJ+widWwR2HhgiZpWYPEeE+tBjiRZvYmC3AZlNOF9Dhb/oPl6vYASLSc2lJau4W5KpqKljvKYqRVpeoLLeLa/SMq9hUafWTYooP6lzNch/cnD/PoBLs2Cr0VqkcsdspmuZKhSzpaMXWZ3hD9zk50sz4YzR/y1eRzwvGgB6paQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ci9NGCvS8f3uWO46o6qqvtQjKKdj/suwfW7gxasxidQ=;
 b=iduqElbwnoWv7ZbloOy0Qgwt8nT/TjYq1/a2DH1WYHKXy01sd8/LTDfVQok7bMnr9mMfp8E+i2WTSfy+qLUa64MY9K1WgsHdft7Yjd/U9+OVuET+k1HaCniriw4Lwz6FmxmxeImBW2xnOmHQtXZ+aVSeK9xWYkeRiBKCKxdMfrGsccFd/nW+vvIOpye7brlJkRkzP3+MGZJ4PWxiMx+8TG/mJGEblE7ibny1ElT30f48HWAxBnGs0tVwoJcfR9ByJYrgoybm6AF6LH+Df7KKxm4KUWOyWlTgcFqasdNCl0ky8J5b6M4BLiihBLbFkeY1PO9wWhbaeutFv3cs3gJc0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ci9NGCvS8f3uWO46o6qqvtQjKKdj/suwfW7gxasxidQ=;
 b=U2cTRjpF0OHXuvRSXiqhI1nRuAa8UTbhigk5XgTXFmjLFGb+8GcN41HBP1yD+zJo63Xw9T6DP0SyPqzSLhIcnhT1XxdP/8DU97KqRS1sVzl2aK/sOuvoUU8l5AjzrmBYtsWyqVzpElO1r8YpRB7jP9teJEsMaIHCYeSkoYagBEM=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB7PR04MB4762.eurprd04.prod.outlook.com (2603:10a6:10:16::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.28; Mon, 12 Oct
 2020 11:35:45 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::b039:ef5c:7b37:9901]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::b039:ef5c:7b37:9901%7]) with mapi id 15.20.3455.030; Mon, 12 Oct 2020
 11:35:45 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     "shawnguo@kernel.org" <shawnguo@kernel.org>
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
        Aisheng Dong <aisheng.dong@nxp.com>,
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
Thread-Index: AQHWjLUdgPbXeVj91Uuo31Pyf4zxnql/qOwAgBRUIQA=
Date:   Mon, 12 Oct 2020 11:35:45 +0000
Message-ID: <DB3PR0402MB3916B06402B0C4D07325F61FF5070@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1600320829-1453-1-git-send-email-Anson.Huang@nxp.com>
 <CACRpkdY-A6i+2SRVn9TJC8C3+rYa1qMcSHSwOaR_jKfxjOK2VQ@mail.gmail.com>
In-Reply-To: <CACRpkdY-A6i+2SRVn9TJC8C3+rYa1qMcSHSwOaR_jKfxjOK2VQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 152787ac-6c81-4394-c016-08d86ea2f563
x-ms-traffictypediagnostic: DB7PR04MB4762:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB476265E5BE62F828DE414434F5070@DB7PR04MB4762.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JAqPrpStJbnj71bSkwpdb4vcuuuJOMdiUaBlMXGA+ctQBrlopYKQlKPFWE8P5200AwIqv+mYmEeMSWQAR6dxQXPKT42LjqRlJkAhJ3pDg3oh7gQSYpPpkUBevetutYepoEMSrDWAK9xe04i+7tLEsSg4UVGAJCujT+65sB3eYIV9kud9zjubjJNZfsSjyROfE/sQDkjTIf2b0NbwOnX6Fq7kM5lW2rOiStsbNaApbQgzYoNtS0IUfFPvW2eKdBrEbqv44Sl18rRfUi/S5aJ1wyhVUX029m2weLcWLPalxJwYQ0t0N4lPOi4luha0Gj0U
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(346002)(39860400002)(396003)(7696005)(44832011)(6506007)(53546011)(66946007)(76116006)(86362001)(83380400001)(9686003)(26005)(64756008)(6916009)(8936002)(66556008)(7416002)(66476007)(66446008)(8676002)(186003)(316002)(2906002)(54906003)(33656002)(52536014)(5660300002)(4326008)(55016002)(478600001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: FenyZKUnY4yJh0W09sbx2T13OZP95HshFEnPlq5+xkrfv1pI/FSNnFG9C7XqWIJyyRn6G+nNFZ2QeSz1Uz5jWDG17LVE1BAXZKSdKZykG6ABAy34EG0GH4JaMwfC2StBExY+J07NkILMVoc/BGvRro52UbsMI7wCA8qagJ9dC+qcHLAyj7ZkWzoEf8bxbIh128FDs5gbZvydI6uP/6fjrPGt4EGcBbSZVoitgsP2NsLbkhCXdErgA0BNhOYIMyJNz0MVLIAIgWH8BBBGEVHWPgEtj/yn1twomHyhnIxX32J6XAEpvpsXX+bjvY+3QEcyCMh4y3kY2GevFG9Z9KCBzDo3zSsI/Bs21Y6133ne33ePJaHrnujEBEOBHEy2znOeOT6sTNwTrvUOtv0Am1cqgTC/wtjwXbUsWinvsq/x9P1W+a4zRGbExw5s7AKRn1Kngs/CE+7jHs/D7CYFJicyKdddhpg4EhmL8jHr+xPWzz3GpyS/1HVfDsKvHweoL8KilOWHAgcrfl0xA3mMrDinY+p9yuCoAS7SFrTaz3hn+IaOcwn7R+mf5r4fxwawZfCqjsQiuWjbmolxcxKplnQTrKQrW4LnE8tOXVEpn3mHHQj12of9e9EWuzyGL0W6u8kgzKWRfR19tKz9yUmhu5jhxQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 152787ac-6c81-4394-c016-08d86ea2f563
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2020 11:35:45.2358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oYhQcEfn2lXqDtIkvRKn7RRvjZMfLsdcF5SqprZdKz/40rpWqzUitaqrQJWYrYjlQvuwZ73L3uhRYLkwdQCVGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4762
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksIFNoYXduDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWMyAxLzRdIGdwaW86IG14YzogU3Vw
cG9ydCBtb2R1bGUgYnVpbGQNCj4gDQo+IE9uIFRodSwgU2VwIDE3LCAyMDIwIGF0IDc6NDAgQU0g
QW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQo+IHdyb3RlOg0KPiANCj4gPiBDaGFu
Z2UgY29uZmlnIHRvIHRyaXN0YXRlLCBhZGQgbW9kdWxlIGRldmljZSB0YWJsZSwgbW9kdWxlIGF1
dGhvciwNCj4gPiBkZXNjcmlwdGlvbiBhbmQgbGljZW5zZSB0byBzdXBwb3J0IG1vZHVsZSBidWls
ZCBmb3IgaS5NWCBHUElPIGRyaXZlci4NCj4gPg0KPiA+IEFzIHRoaXMgaXMgYSBTb0MgR1BJTyBt
b2R1bGUsIGl0IHByb3ZpZGVzIGNvbW1vbiBmdW5jdGlvbnMgZm9yIG1vc3Qgb2YNCj4gPiB0aGUg
cGVyaXBoZXJhbCBkZXZpY2VzLCBzdWNoIGFzIEdQSU8gcGlucyBjb250cm9sLCBzZWNvbmRhcnkg
aW50ZXJydXB0DQo+ID4gY29udHJvbGxlciBmb3IgR1BJTyBwaW5zIElSUSBldGMuLCB3aXRob3V0
IEdQSU8gZHJpdmVyLCBtb3N0IG9mIHRoZQ0KPiA+IHBlcmlwaGVyYWwgZGV2aWNlcyB3aWxsIE5P
VCB3b3JrIHByb3Blcmx5LCBzbyBHUElPIG1vZHVsZSBpcyBzaW1pbGFyDQo+ID4gd2l0aCBjbG9j
aywgcGluY3RybCBkcml2ZXIgdGhhdCBzaG91bGQgYmUgbG9hZGVkIE9OQ0UgYW5kIG5ldmVyDQo+
ID4gdW5sb2FkZWQuDQo+ID4NCj4gPiBTaW5jZSBNWEMgR1BJTyBkcml2ZXIgbmVlZHMgdG8gaGF2
ZSBpbml0IGZ1bmN0aW9uIHRvIHJlZ2lzdGVyIHN5c2NvcmUNCj4gPiBvcHMgb25jZSwgaGVyZSBz
dGlsbCB1c2Ugc3Vic3lzX2luaXRjYWxsKCksIE5PVCBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKCku
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNv
bT4NCj4gDQo+IFRoaXMgcGF0Y2ggKDEpIGFwcGxpZWQgdG8gdGhlIEdQSU8gdHJlZS4NCj4gUGxl
YXNlIGFwcGx5IHRoZSByZXN0IHRocm91Z2ggdGhlIEFSTSBTb0MgdHJlZSENCj4gDQoNCkNvdWxk
IHlvdSBwbGVhc2UgaGVscCBwaWNrIHRoZSByZXN0IHBhdGNoIG9mIHRoaXMgc2VyaWVzPyBPdGhl
cndpc2UsIHRoZSBpLk1YIEdQSU8gZHJpdmVyIHdpbGwgTk9UDQpiZSBlbmFibGVkIGJ5IGRlZmF1
bHQgYW5kIGl0IHdpbGwgYmxvY2sga2VybmVsIGJvb3QuDQoNClRoYW5rcywNCkFuc29uDQoNCg==
