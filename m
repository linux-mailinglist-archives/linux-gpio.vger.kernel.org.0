Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C31F421B660
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2020 15:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgGJN3l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jul 2020 09:29:41 -0400
Received: from mail-eopbgr70047.outbound.protection.outlook.com ([40.107.7.47]:18369
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726774AbgGJN3l (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 10 Jul 2020 09:29:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAhrTOy2mWqOy9r/vX+RhtQOnwjWC6COfOWXe5W8l8BIvpP6bZv9+DTsRGIjQw0EBJUlW22n7DxBGlZI0o2a5lNC8jFEDmP9vpOHgrb2gUH+4q1Avutl/zzQWI/ZSx8MpZd2bQl4ArcHb7xiDzhMGXnN5gSyMVa8vM41NtoAVBrKoOlUvYwjyIy/VACVO1QJk1L329z+tFbrTu4p/uJUCOx/xfbQT4e6HRN8HBv8S/3Jlw9ul+n71FGAw0XuDbsjzYrTpEDbdysZICoLHf3PL4XDLWwXgG9/UstFmJIQJVhR9y0TAPwC4qlfmrXoQLw/y0bpgRnzuKOgiSKOSPt2Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkC1NPCG2vM+bzuh3AqM7CH5bh+DnMSPjVTjlUnDEho=;
 b=a1kDQtu8a3v+IoesK17T3KL4IjrJXcYw1Rj6BezoCHflQ9XhFwqG76TY2Pv5Du992nwuvE05wHDy6pwwa/NGO1GDfJEzJKjMldBGs+MHreUCE4qO3D1vNgBlgvWnE3nuE/x3NbtxAgIr850cUcu10DD2K+cBjjFGztQiztYMPtQLImypK1Pir1GSegufqq1c6YtuDUu5urY3T0+NPXOg00YI3X6IQk/7llIJxGHqFcaOFZIs1WcRt4w5kLJjHD+CqO2cCB99EDSoK4//2E0L/9f7Qgc5ut7IBt1YMhxOD9UxIlhSgXURrh3bwhIydb8Jd5jXrgz8sULhM2KNR9/YYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkC1NPCG2vM+bzuh3AqM7CH5bh+DnMSPjVTjlUnDEho=;
 b=oNs76qPjNK2Lw2hu/+ICyMyEjFP+VDvDvkL+Fz2I6NFuSQEQP7ELxQu/FHYIUWzo8SgopBba1wndTfpEMYjsS4ccCpGt7kVw3kDfaP4hMaOmZG5c8qGO6kjkjJtUHvF0aVEc9GNgLomJ2afHkaAtPw6yY60UhEKayrLe/6TApmc=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB8PR04MB7177.eurprd04.prod.outlook.com (2603:10a6:10:127::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Fri, 10 Jul
 2020 13:29:37 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3%6]) with mapi id 15.20.3174.022; Fri, 10 Jul 2020
 13:29:37 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Andreas Kemnade <andreas@kemnade.info>
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
        "aford173@gmail.com" <aford173@gmail.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        Leo Li <leoyang.li@nxp.com>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "olof@lixom.net" <olof@lixom.net>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 3/3] ARM: imx_v6_v7_defconfig: Build in CONFIG_GPIO_MXC by
 default
Thread-Topic: [PATCH 3/3] ARM: imx_v6_v7_defconfig: Build in CONFIG_GPIO_MXC
 by default
Thread-Index: AQHWVLZf1P1D6v4l+EGvf4we2g/NU6kArZAAgAAk0AA=
Date:   Fri, 10 Jul 2020 13:29:37 +0000
Message-ID: <DB3PR0402MB3916C86F35D601A44FB03133F5650@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1594164323-14920-1-git-send-email-Anson.Huang@nxp.com>
        <1594164323-14920-3-git-send-email-Anson.Huang@nxp.com>
 <20200710131435.38f1f8a0@kemnade.info>
In-Reply-To: <20200710131435.38f1f8a0@kemnade.info>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kemnade.info; dkim=none (message not signed)
 header.d=none;kemnade.info; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [183.192.22.69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1fcab664-7a47-490f-6025-08d824d54aae
x-ms-traffictypediagnostic: DB8PR04MB7177:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB7177A23349232960916DA389F5650@DB8PR04MB7177.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 046060344D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jttIRCBAS7pez9XssB+kp/R3oDzLLp6LBAIm1feZv5N6Kkmp26BghEfc+uw1N9yP/JjR8ZoSV1Juh7mhbIroFLWT7GnPvYSWt2LFqnI8EXccVGsjMTlXCfyY46vLBhbUHCVZyOUQXMXMhATR1ZC5poKxdF0yjUq68DJCKVZZDHsY9/Dc1NwEaGzu6JsHczPRYuej8KG3kdnGKaibD8NyHv3KLINpulTuBA/jaDBVsKxUjZeiCj8rA3k0Ebyx0CuPxlZ5PoZ4crT1jMQluOhKdAlFcr5u7rml+zeKGMWJn/ExNr4aEnc69QSYYA+7I4rb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(6916009)(4326008)(86362001)(71200400001)(6506007)(8936002)(478600001)(186003)(7416002)(33656002)(8676002)(316002)(54906003)(26005)(44832011)(7696005)(66946007)(66556008)(55016002)(9686003)(5660300002)(76116006)(66446008)(52536014)(66476007)(64756008)(4744005)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: BoWYTXKBojr9ufX/ekm7/WMipCBYthvsZhH6kA2EQT1D3JuLR+U7dzeWWRD7inYi1nGV9+YUtjeI1wWDQuQPGgdnFBYPdv6DY2Jm8HYKPa9REwOmW5lNqVtSc/3WcnExFT3mskGjIwJ700fPHrOWviIm0wvOAgGZvLzDkbdhAk6knjJIzvpf98fkCvdNLnShr0HaapHhJ3lTE5YbSgLSyJK/iKFQNMkWLM/nV5DtXv2S8zjCsotDdfmeQSv5UvzL+07ij5UDS/1UMf53jm52sKFpgQYcZ2zFoNtfmKEa+SDKvJxyp+rm8XeimV/l8qeKw9t7QlbE+hRncHuZxDlrTSJ21hAsgP+v+iHO4jCz857DL4wn5dAnRlbPVLFMLsTjw6O1QL7GULJDiQZhoi9R1VC3qC9Q6CkOY57qlvSoIZ3upWto07H6/b919r3boCwaMXXcjXd7HgBN4sON4DsMyw8hksT58+qsesIUcLu0Qwc=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fcab664-7a47-490f-6025-08d824d54aae
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2020 13:29:37.1171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ok7Z2DwlzndBLKp/BLtYpzVpipQ+HmKrAWbEgcdxTZgqDoYIuY9zNG8HCU1zCu49wsLndNqm6ZUPZl7Z8HtxOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7177
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi, Andreas


> Subject: Re: [PATCH 3/3] ARM: imx_v6_v7_defconfig: Build in
> CONFIG_GPIO_MXC by default
>=20
> Hi,
>=20
> On Wed,  8 Jul 2020 07:25:23 +0800
> Anson Huang <Anson.Huang@nxp.com> wrote:
>=20
> > i.MX GPIO is NOT default enabled now, so select CONFIG_GPIO_MXC as
> > built-in manually.
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > ---
> >  arch/arm/configs/imx_v6_v7_defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> shouldn't this be done also in the multi_v7_defconfig?

OK, I will add it in V2.

Thanks,
Anson
