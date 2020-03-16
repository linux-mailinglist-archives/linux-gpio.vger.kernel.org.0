Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA1E3186528
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2020 07:43:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729490AbgCPGnf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Mar 2020 02:43:35 -0400
Received: from mail-eopbgr130073.outbound.protection.outlook.com ([40.107.13.73]:64774
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729319AbgCPGne (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Mar 2020 02:43:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrBGoGYv7AeqbOFMegiZXabALinjADW6K/yrLrzNtyrN0MdiJXF+jFcdSJ/kYtqg6SYmUPDB1FDtV16lAIifN9s5XoE1LdOlKx6my4B79z6mmy3QeU8BKw2c/B/bZRwgU/eTNDgMm3UyO3Pt1PfKE8y4Y5ta6OSWNwQulLcDHkVNOZ8d0kE+/Klqr7jVWxt1MU7rSEKkqkXs4r7DTuNtQtGF/IiPZnmBZuDwnwhKHi6SGqBZZ10zwcnXCA4H8E33LU8lQeGUe+YST3BylhxtfwxrtTuitaaCauMGJTtsxjIW24SeKwyx7rkP42sk6UrdpYjcHlfXJqHhkKkuc2wVLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tUT8u13HhTH9jOxk35JdRIjQ0WXw0R52eqxASu4Ql0=;
 b=bp4Vk+gMMU1rYVSq+vcC/kXEqNxkrGnLyuRc94rt9orjsX/L6Yz8oDThnUbhhH7tMrWlmBI49NMPcRj2NHraQwly5i44QX8JNoV3pNO6IrOLpHDVz8kalOVx7MLKLVouISx7PYThTNH4qFlyW8owKPMUUBaSG9fekmmn7t8DrIOJR1MEC54QJ9I8euwisBgb8m6T4IJ87c9QHJUv8lASF6GUxkMbKfwv+hrraG6o4zWfN4Lfkn5LqC9fI7iyUozjntl+hvcB5YTE2fxU9jbsHte2XKxyuLcLxkDimimex3e8kqzutN4NotfH5eUTKhTTnLpiI3nkPVLsMm7grntoGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tUT8u13HhTH9jOxk35JdRIjQ0WXw0R52eqxASu4Ql0=;
 b=B3oQ2vKTWOs4lNV8tdFkp06ViX+64cm8DFWXWE/oTnpSiYHcFEO3jKONkVVEajHziZ1VvXRUyYzoJI3gS64t7fEL3x8RLvIBtCy99Sa7ah05fRk9VX16e1H4jV/gqs26BT7GSE148R7mKSYgCYzMdc3P6b8OB4LgN7MlAlc/OHE=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB4802.eurprd04.prod.outlook.com (20.176.215.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.22; Mon, 16 Mar 2020 06:43:25 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::ad44:6b0d:205d:f8fc]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::ad44:6b0d:205d:f8fc%7]) with mapi id 15.20.2814.019; Mon, 16 Mar 2020
 06:43:25 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Arnd Bergmann <arnd@arndb.de>
CC:     Aisheng Dong <aisheng.dong@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 3/3] soc: imx: select ARM_GIC_V3 for i.MX8M
Thread-Topic: [PATCH 3/3] soc: imx: select ARM_GIC_V3 for i.MX8M
Thread-Index: AQHV+OhCoWIlKfRHBEqAZhv4+QN6jahGTaKAgAR8rgA=
Date:   Mon, 16 Mar 2020 06:43:25 +0000
Message-ID: <AM0PR04MB4481E7BC1DF01CFC975577A088F90@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <1584070036-26447-1-git-send-email-peng.fan@nxp.com>
 <1584070036-26447-4-git-send-email-peng.fan@nxp.com>
 <CAK8P3a14BU5uHEqkVyWkeFVmxA1hJifQE+GkXFgmn59s_TL+Rw@mail.gmail.com>
In-Reply-To: <CAK8P3a14BU5uHEqkVyWkeFVmxA1hJifQE+GkXFgmn59s_TL+Rw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [121.239.103.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2f66d9a5-719b-4f4f-e045-08d7c97553f7
x-ms-traffictypediagnostic: AM0PR04MB4802:|AM0PR04MB4802:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB4802FEAA1BD5E9CEA372654288F90@AM0PR04MB4802.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 03449D5DD1
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(199004)(478600001)(81166006)(6916009)(45080400002)(81156014)(966005)(8676002)(26005)(186003)(55016002)(8936002)(4326008)(7416002)(7696005)(52536014)(9686003)(44832011)(5660300002)(71200400001)(54906003)(33656002)(86362001)(53546011)(66556008)(66446008)(76116006)(64756008)(6506007)(66476007)(66946007)(316002)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4802;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2gOjBEGztxxhLc7iJTKK6kEJwdWQcYYWZ6oOL8sCtfxrcIZWFjtf2ACMxvyvaz7cRoV7CGnLoaUfXuFW4xJWoH468bwdY+JeiO3Y8Ueb8XDexde0/+9G6LUM8f/ugKMT6PWN9ofBlXv1Ea2ZsJ0eZCZ2SMM4+8ja27Q6OOxXbaM9c1IeBtTa/SCY+M9Q0BxFq19noBU9v2rEMCQ2N3RUg2dG5EYChKq+XXz6WXr0pS5gf4Y82F7xmSY2fRbtVyIY5MQEosNEHue5bceAptJIV583w+Q5HG5JpVv6CFMKNBzV7HU3Jy6SM0tVxmpDTlF0qN9yVs/IW29MIedRle6BXZsls9Ma8bmb1j115amEJUIv5g/e3aibsFqDAU8pBYRnSWqtqtURbRnF097ZRQXG4mabY0mnMrqwTbNHXhU+9mQL6zUX5KHv5HbBJrbHnT3SrQ/Rwx/FmK/z6AF03g+qJYX0mQa2/dnpnRcIos542JJj0i6ChKkGjz4wPv9OBNzSOb2o6jXICuhQb90dXKPLQQ==
x-ms-exchange-antispam-messagedata: q6QSlzDH9UqiMLHtOfMpUf6NWPnRn4euaCQg02LSWkgDSbdk5fQ1t//Y6JeMehuNEQ6rdTvKz1TtL2pTq8HfwelYaq5I7cPH7+/+9/jd8xJiR5j+QrPiXA1YYPRwebd8j00yG1GJqJFLX4aRgHF8vA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f66d9a5-719b-4f4f-e045-08d7c97553f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2020 06:43:25.2705
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L0xxozl3MjT3NFFOm89MGOOosGZXT2PvWRku34WJxp6WE7lYJUTFCE1zlbm88KLHhggm2tZ5xogE/k9UH8AH4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4802
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Arnd,

> Subject: Re: [PATCH 3/3] soc: imx: select ARM_GIC_V3 for i.MX8M
>=20
> On Fri, Mar 13, 2020 at 4:34 AM <peng.fan@nxp.com> wrote:
> >
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Select ARM_GIC_V3, then it is able to use gic v3 driver in aarch32
> > mode linux on aarch64 hardware. For aarch64 mode, it not hurts to
> > select ARM_GIC_V3.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
>=20
> Acked-by: Arnd Bergmann <arnd@arndb.de>
>=20
> > diff --git a/drivers/soc/imx/Kconfig b/drivers/soc/imx/Kconfig index
> > 70019cefa617..0b69024296d5 100644
> > --- a/drivers/soc/imx/Kconfig
> > +++ b/drivers/soc/imx/Kconfig
> > @@ -21,6 +21,7 @@ config SOC_IMX8M
> >         bool "i.MX8M SoC family support"
> >         depends on ARCH_MXC || COMPILE_TEST
> >         default ARCH_MXC && ARM64
> > +       select ARM_GIC_V3
>=20
> It would seem sensible to also drop the dependency on the 'default'

If drop default, we need enable this config option in ARM64 defconfig,
I would leave it as is for now.

Thanks,
Peng.

>=20
>       Arnd
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flists.=
infr
> adead.org%2Fmailman%2Flistinfo%2Flinux-arm-kernel&amp;data=3D02%7C01
> %7Cpeng.fan%40nxp.com%7Ca28680bc024f478a8c4008d7c736ef64%7C686
> ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637196911074143592&a
> mp;sdata=3DjNEcrVlci7UEAhAftKBNSVc4b6%2F0Sm2aOYPIA9ajZl8%3D&amp;re
> served=3D0
