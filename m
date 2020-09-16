Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D79CB26B992
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 03:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbgIPB7t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Sep 2020 21:59:49 -0400
Received: from mail-eopbgr60049.outbound.protection.outlook.com ([40.107.6.49]:60673
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726039AbgIPB7r (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 15 Sep 2020 21:59:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMiKC1/4COAkpDDu8UZjO1bS0IRVwDrJBaX/B6Ft2wofTLRSmrq3WnedcscBlohQz/Uq6cPkhR/pQVr8bJmXasMcmHoB5hBOKH7p/O2KKmrw17MKXp5A4ouEVVIXctRX4eZYtrFn7FYsg0pe5gIxgekO4cpYdVjSj6Fh++qP0QWuqtsi6rOduv05iHRsWTTDIhkL30kkZoloZ00J6+XVbwupLKadAVoCMnlGvzPbq+4rPlhXyfNk3u3x2QZj5la9JecbwjuMVt8Kicmk+rDMCzDysqWIi99ey5LwNqyOrH1wo3xShyB0PCVQKgyF/vNGlMMTk1evoNlbVMYgiVBhmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYd3Nfm0xvH8cLfKe8vLFVLN/VjIja2JNJ2vmc1tuMg=;
 b=ZfesPRNJVFaBAMUrgxA1fEdZe4ZY8S8ne9kscTEBkXDcrcAyZaqLQKsEzCtlxGb81S52Rf+cdNOpW2Idub5/8n2hUYrxHmkBihSv5udwcRv+sxu4SYePZSqreHOBfFgDQ8CLKFx6NgGeuJEN7gRBLWuU4G6Oo2NwbWiSGN4kIJbpZ/1Hpnq2Y54g1MAy3V9ZU0bSlK6Kv0MgsaLwKgfTeAG5VZ2B/LGSfz0Y//bA7u05VC6SGIphtFiSk6mUSxPI2fA78F983ngm/YxxNGIo15Q2HnyUiBTwnI0Ac7oJmMqJ+7YlkRZRQzX4R01FI9CIVpxvMBRe4knp+rNeIBEqZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYd3Nfm0xvH8cLfKe8vLFVLN/VjIja2JNJ2vmc1tuMg=;
 b=ELKiPFavKmD+VlTbGeXNiOyzGaa3lzBi369tnhF8oFMPmfm+x0oS2w6QCu8ml88neetASvAWDgwX5lUlygqLk50htjT/Nrzj9z6QYQw8Ft/KBemLnWPuLQF59e2hJYqPLd40nufdvXqnEBLjFamdlTUw8BDOsi3uE8z63CB9+C4=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DBAPR04MB7285.eurprd04.prod.outlook.com (2603:10a6:10:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 01:59:43 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::9c75:8bb2:aff6:450d]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::9c75:8bb2:aff6:450d%3]) with mapi id 15.20.3370.019; Wed, 16 Sep 2020
 01:59:43 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
CC:     "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will@kernel.org" <will@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "oleksandr.suvorov@toradex.com" <oleksandr.suvorov@toradex.com>,
        Peng Fan <peng.fan@nxp.com>,
        "andreas@kemnade.info" <andreas@kemnade.info>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "olof@lixom.net" <olof@lixom.net>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "prabhakar.mahadev-lad.rj@bp.renesas.com" 
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "lkundrak@v3.sk" <lkundrak@v3.sk>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        Leo Li <leoyang.li@nxp.com>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "michael@walle.cc" <michael@walle.cc>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V2 RESEND 2/4] arm64: defconfig: Build in CONFIG_GPIO_MXC
 by default
Thread-Topic: [PATCH V2 RESEND 2/4] arm64: defconfig: Build in CONFIG_GPIO_MXC
 by default
Thread-Index: AQHWikguwWoA8sP7f0aWUhuot9pwYalp3a6AgACmh7A=
Date:   Wed, 16 Sep 2020 01:59:43 +0000
Message-ID: <DB3PR0402MB39168692AC262B7BFA21D0C0F5210@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1600054147-29997-1-git-send-email-Anson.Huang@nxp.com>
 <1600054147-29997-2-git-send-email-Anson.Huang@nxp.com>
 <CAJKOXPfuz=vf9tCn8ZJ9dz2iAG_p61VvPWc9P=kp7nMy7tb6xw@mail.gmail.com>
In-Reply-To: <CAJKOXPfuz=vf9tCn8ZJ9dz2iAG_p61VvPWc9P=kp7nMy7tb6xw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5bf267eb-15e9-480f-0e34-08d859e42e4e
x-ms-traffictypediagnostic: DBAPR04MB7285:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBAPR04MB72850CA307B27B13288F7FB3F5210@DBAPR04MB7285.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n+XAGDNNwnvkV5DTrUKDo6jvBDktMTNxaCseff9L01abJDYJTlW7RZM/pXHvbw2pu0P2V/JJWbMQ7fE86Ne2RKIE1UPO/COY8d46USIjDfsgWBWw5o0vy4rFgDREbIvD0uYcW/a3DtjtNRA61Lhow0WD2ljsRwxX/avphDCM8714hI7dwvMQWZLU0b4kGf1XeLulLAlm/i61wR+z2T3N9AVvetluJNZnOlyWqN1EhRhZgNizSmPNhsMZ7X7SM0DcVVY5HTc6tFyxgHa1wTkKJcBunquCYzeHi2mojNMyZ/dH2qEMnmL/xa8gTNMawuYDw7sSk8I5BYUtC0SVbpCITxNoIDa/eMl17xchY4BeXKhIHuvcCPHbfkyqbdZi+AXZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(186003)(26005)(4326008)(71200400001)(55016002)(52536014)(316002)(86362001)(8676002)(9686003)(8936002)(44832011)(6506007)(2906002)(54906003)(6916009)(4744005)(33656002)(5660300002)(478600001)(7696005)(7416002)(76116006)(66476007)(66556008)(66446008)(66946007)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: H3Yry0veduSoKFTnwwp4HND7ozafGMHSyP56tw+rf0BCNMYVg2bZbjLgPJM1F/+rQLEMeMIbD0CiaXkZd5CfVPnr7Fz8e8wmcdiZ2RCdY28TqNtteQ1FA37y4+PMLVNMMPK91nBuzMfnacf/285noY1EI+Dvv2IIQx5gReA+PRKC/w/WRgEBrN5d6AjtPWgWqspVVInf7yi/DlmBX839Y7a9+PwlaB4HwfThkVIbVtLzX41yNEhitmOmUbclyGepuybCz3YITevXc1kU7Grhh0HVoia9d7Geib3Z94r/sE6PJRDQvGWRgE5CE19SThCAmmlL1w33DvKdWCMQ4o8K08vIAS7d7ViZgfLVyyNQTXq5wAA4fe5CSefc/A3JgJl5ySXJxX9wjYfXNYN6zH5jDDfFjfI+8iUCQ37vj7qY8JlXy0p6X4swzHx+Avzp3RSTaCywF1tfCfDg4GYpPyh3JAr3KDe0FjIbUOYvr7vskCjPxG2YWiEfklRCQD7xugTYljqNGHUovJsGSR3yVomGtP+c3BKaH91xD/CgkhoiCMWTuqv3t8VHBgNQ85ADqONxWb1bSRxWYnJgkH7r0Xbh3UeWVdlx1rBsqfjF/xSKvF4rxQLW/LVsVH8qgzVkumhLsq2hBJUHjXeWjifb+81jkA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bf267eb-15e9-480f-0e34-08d859e42e4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2020 01:59:43.5659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PYU3hCUVfTBxeV6UH+13vWOeRm4a5Rd2oB8FoLZ1RtrmD4v2Jyt5VtJGQ49xhNmVwb6Riw2tksVieYLHLFiECQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7285
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksIEtyenlzenRvZg0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjIgUkVTRU5EIDIvNF0gYXJt
NjQ6IGRlZmNvbmZpZzogQnVpbGQgaW4NCj4gQ09ORklHX0dQSU9fTVhDIGJ5IGRlZmF1bHQNCj4g
DQo+IE9uIE1vbiwgMTQgU2VwIDIwMjAgYXQgMDU6MzYsIEFuc29uIEh1YW5nIDxBbnNvbi5IdWFu
Z0BueHAuY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+IGkuTVggR1BJTyBpcyBOT1QgZGVmYXVsdCBl
bmFibGVkIG5vdywgc28gc2VsZWN0IENPTkZJR19HUElPX01YQyBhcw0KPiA+IGJ1aWx0LWluIG1h
bnVhbGx5Lg0KPiANCj4gTWF5YmUgaXQgc2hvdWxkIHN0YXkgbm90IGVuYWJsZWQ/IFBsZWFzZSBl
eHBsYWluIGluIGNvbW1pdCBtc2cgd2h5IGl0IHNob3VsZA0KPiBiZSBlbmFibGVkLg0KDQpUaGUg
Q09ORklHX0dQSU9fTVhDIGlzIG5lY2Vzc2FyeSBmb3IgYWxsIHRoZSBpLk1YIFNvQ3MsIGFzIGl0
IHByb3ZpZGVzIHRoZSBiYXNpYw0KZnVuY3Rpb24gb2YgR1BJTyBwaW4gb3BlcmF0aW9ucyBhbmQg
SVJRIG9wZXJhdGlvbnMsIGl0IGlzIGVuYWJsZWQgYnkgZGVmYXVsdCBwcmV2aW91c2x5DQp3aXRo
ICIgZGVmX2Jvb2wgeSAiIGluIEtjb25maWcsIG5vdyBpdCBpcyBjaGFuZ2VkIHRvIHRyaXN0YXRl
LCBzbyBpdCBzaG91bGQgYmUgZXhwbGljaXRseQ0KZW5hYmxlZCBpbiBkZWZjb25maWcgdG8gbWFr
ZSBzdXJlIGl0IGRvZXMgTk9UIGJyZWFrIGFueSBleGlzdGluZyBmdW5jdGlvbnMsIHRoYXQgaXMN
CndoeSBJIGxpc3QgIiBpLk1YIEdQSU8gaXMgTk9UIGRlZmF1bHQgZW5hYmxlZCBub3csIHNvIHNl
bGVjdCBDT05GSUdfR1BJT19NWEMgYXMgDQpidWlsdC1pbiBtYW51YWxseSAiIGluIGNvbW1pdCBt
c2csIGl0IGFpbXMgdG8gTk9UIGNoYW5nZSBhbnkgcHJldmlvdXMgYmVoYXZpb3JzLg0KDQp0aGFu
a3MsDQpBbnNvbg0K
