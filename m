Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B956F314A1D
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 09:18:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbhBIIR6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 03:17:58 -0500
Received: from mail-dm6nam10on2064.outbound.protection.outlook.com ([40.107.93.64]:9281
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229646AbhBIIR5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Feb 2021 03:17:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hteB6ObG3ClwOQtZ7muiR4bo8rau8cpYUgJsCSXtui9AveSPjX0pXSLRCrxGIxHyOJAdC2gvdnmF1RUmFEBOveCIae0clA41w+gcLZRupdDmawHQt130jT6fpFiZ80weG6TIMDZuJN4rhALyS0PHgDUz+7Vle2BofLU1xE6EhVmBhj1F4NfSkEC36YlDSzTrt0lYPaysJKd3bQwTkf56dSJcpEanjGQwziwwC9KzRGQuuZKL11InLyrVsv/JRTqzM5N/W8tdLYdO4eu6eScRsqrKeyVCQzNyfIzsaKyVusvG2Gc9uS/o24sWvB6RFetWBMrB7Lsr1n0XQJmRjPKFiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzVOuqRTa9MDvOIR1DkEMlcjH4LqjIkEj3zFQNS9VN0=;
 b=C0+QNCjkRUC3f/fsme9rFwQenXcpy8zhRAsm0P/xzoVXa80EVUtO+NRtpv6dWAyEaJK/jYBkTu6DKEHh0KrNJHtWz4CjCbnSpHNx7e4v3gUEmHwQ9FmHt+dIXoezo/pakkOi+prC6DbzpjMnUH9t4jHiqGHCAJBSxznVDs3Y6mJeBhb/HlwB6a0ot8/XDRZF7OLHzcQ+xeOJb4Lt5dtPterkLDpvyO5TjiLLs0K+r/TZuQr32oFKB+ZFjX5Qgp/qCwiKGL87HZZv22k2swLFXR9FGISbz+qVtZFmcX1DbIjrJZOofm0Yvw6FC4yQZPAgq7hOIoNw1Il+BsYE2m3Vjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzVOuqRTa9MDvOIR1DkEMlcjH4LqjIkEj3zFQNS9VN0=;
 b=T8PgqcuulIVkihB9/gvd9YRq+hYVHUllJ/Gnktj8Yk2SotF7FLiL9XIsHXgX3dHKm/1e47JXY2ofoJd7VobTkuANiRB21vtOkbo3jdSuYxTo98sE89yGUC55aSedAQnGNc4PIvW3Kz1MixfB2SvJ9fMNGfurFW6XlQ53FgMS1+g=
Received: from CY4PR02MB3270.namprd02.prod.outlook.com (2603:10b6:910:78::26)
 by CY4PR02MB2853.namprd02.prod.outlook.com (2603:10b6:903:127::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Tue, 9 Feb
 2021 08:17:00 +0000
Received: from CY4PR02MB3270.namprd02.prod.outlook.com
 ([fe80::294d:8067:c344:b14e]) by CY4PR02MB3270.namprd02.prod.outlook.com
 ([fe80::294d:8067:c344:b14e%7]) with mapi id 15.20.3825.028; Tue, 9 Feb 2021
 08:17:00 +0000
From:   Sai Krishna Potthuri <lakshmis@xilinx.com>
To:     Rob Herring <robh@kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michals@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>,
        "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>
Subject: RE: [PATCH v2 2/3] dt-bindings: pinctrl: Added binding for ZynqMP
 pinctrl driver
Thread-Topic: [PATCH v2 2/3] dt-bindings: pinctrl: Added binding for ZynqMP
 pinctrl driver
Thread-Index: AQHW7iPkn7pUhAIWCkGHT8eHIN0GcqpPOAuAgABPGqA=
Date:   Tue, 9 Feb 2021 08:16:59 +0000
Message-ID: <CY4PR02MB327015F3EF5FD8C265EE20E2BD8E9@CY4PR02MB3270.namprd02.prod.outlook.com>
References: <1611034054-63867-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1611034054-63867-3-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <20210209022041.GA2527041@robh.at.kernel.org>
In-Reply-To: <20210209022041.GA2527041@robh.at.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [183.83.142.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 14c69977-a899-4a94-d641-08d8ccd312f2
x-ms-traffictypediagnostic: CY4PR02MB2853:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR02MB28531E495AE5FDF88E23F146BD8E9@CY4PR02MB2853.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5ERfjGAspYMNWl32bu7baaemf7A7cpEqRxm5FH3YyKyTH4qIMhngVOF18zKoxUllCVg+XDxUbo4WgiOyUVnRGbRVb9V4cY05Frddz+pbBtBIzywTsS0XrOccT5gsfxFHw0FiDYiciDY7kMyFOJV8R7/0eCppy5mKDv94ul1SfvdE1p+fJVGe6hDCwHmve/tyfXXr+57tzCD9pF2jusu/RqCVo3p2U8C+KYguam/nHFZX4jFaPUiu+tzvGFOPKpyWXgkNv2H5V3iKsgMn/HTYzXC5maQm+QwvgTAE2PHs9V7EzcDGB6ohN6BnpLoIS4OZn7Xr2G5hl3ZYCoztawqYWShyw4APktJL6ElLzBwvMxfYiE6CNRo2SdH9zUGvaxIyj17WVRX9PZjRhOZO6dOjeT72U+/ctAhWXKL90Ns64StuzEyUDk5BhXZaqP64EnpNd+HgneAXKIWRRD0masrrBQj20IoljMqHcFK6gue84w51cb/Hdvnf0yOHBZXF6RiqeYX9gxb1kmLvnY3lenkRATbGoh+Q2s8mbDAl5UGs86YsF1gVzHD8QgCDO8vVgP/l9LB5UO4PlTkEvFyxctJU2xz0W5v/S3RkFWp1mm9sCuY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR02MB3270.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(7696005)(186003)(6916009)(26005)(4326008)(52536014)(478600001)(55016002)(5660300002)(966005)(2906002)(6506007)(53546011)(9686003)(316002)(76116006)(30864003)(54906003)(66556008)(66476007)(64756008)(66446008)(8676002)(8936002)(66946007)(71200400001)(86362001)(33656002)(83380400001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?t3ntBAuP7BAQwaqWaHEm0p6TupIdqGpx1Qq+y4bejyYHZ9t76UKf4e52cLK2?=
 =?us-ascii?Q?KK7bGmzrA+vAIfy/DTZO20v5t5AQWIUoHJZBTGsAM1a9jSO6k1DfcrX4kJu7?=
 =?us-ascii?Q?ZZtGwGWedwzQo/84/tbjacUh0xaLDQ1bXsVY6mSJoIuTjD3o7uesZ/gGzB7m?=
 =?us-ascii?Q?ZsLo0bzrEzuB9+2exZK5mxbjrAYfnYyr9knfeR3ZghXgub8JVlIVxmNk/gwa?=
 =?us-ascii?Q?MBVIVowjWp/gStdyZCsQ5n0rEybEhuqTMh7C4RdU8tl/D4KJDUPtrMewJ+PN?=
 =?us-ascii?Q?1ZQZ4fQ4xeF4obmMb24JgFpDfktEmlIdNp3RoBuvJ+OehFf39Fv5FDuY0O2A?=
 =?us-ascii?Q?z4HHkFLp9EdakMkVyX9obx68FIcrHonzwSJjYTb8I/ZeW0tDXSzuhZoO44li?=
 =?us-ascii?Q?U6PO6hV2TX4eZuAwCq46NjAxmXBInCtIfmULZvW+8gZ28utoUN90pQIOtwNx?=
 =?us-ascii?Q?G0izz1uOqpJCoavVAM/MhqJrmupSn85eO1pEFLWTJoibM7mIvH8tP5is9pqS?=
 =?us-ascii?Q?9yhrOvMxplAkHMhLBCURaMHHdPmjg5zm1rklMb92/xBu9XQGVNjSDxhIM2Xw?=
 =?us-ascii?Q?MtLKy4STfSv2P3zsUBY7PkYkoc3mdhFUcrpfDN35ZBsTD5sqoI7XRvbY+mRv?=
 =?us-ascii?Q?IdW9Bk1LC7caPqtE2TySOkA//pkqEEdLEfNL0Or764V33xS2aavBkD5AyaNo?=
 =?us-ascii?Q?65UuF1muqQ2+I9GhzrnjsPeYLyotTIe/zswju3NqGdKkSQUZjk1XbIREWq62?=
 =?us-ascii?Q?gl+kT11NwADxlUwM1bH02P5DrMcFA5fZWuRX/4/A9j/Pai4/eqnaz388yxV5?=
 =?us-ascii?Q?G5pvdDWyWMOoAyA1Zb6cRon05ojvwhogE2KMxeog026oNdkSOES9RdTLe4OO?=
 =?us-ascii?Q?7K+9emvM/wOsxBGUnOtYPgobvO6NhEHqa6+oG1f/yfPo8M+6vBYYcF2B9BE+?=
 =?us-ascii?Q?HrFF+/tfN5ricuJdrSgXuvsIKj4dssA9wt3+KvTAdWtThR8sL8C2gp/j5IwQ?=
 =?us-ascii?Q?vdkYLSD3BcQHezTphsz45VGVhpwFh+RD04kK4iRAHarS95au9vtMIaWCaBfX?=
 =?us-ascii?Q?OZKnWpb3ow9dfW4zMf0LHDXW+obbpIGHUbu6x1S4FuIcim6+t3rzUzCzaHgM?=
 =?us-ascii?Q?BcDt9gJtDhH78qrb9TgvNkUaG84fOF0kJD8U967adPFML/UnMhQ02jX6uG2a?=
 =?us-ascii?Q?dtYEIOeZLFxkSexhh9VTZTyEzp/6Dz1ZxdJk7EPB+7oZkN6W91YeJOFLDccM?=
 =?us-ascii?Q?C0eEivHLV6EMsOcvvTZ7WELACTqpBaEP0GI8jTS1Cfh7/4fVd+eP4qgL1Dcm?=
 =?us-ascii?Q?00LE1sBulKPTtEmXD6ZPno/a?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR02MB3270.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c69977-a899-4a94-d641-08d8ccd312f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2021 08:17:00.0085
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Akzt8AtZwj16CNmaW3AHpTG4Cy6RkutbAh9kD9wXcFQPP8QB+byjP5dKvjZu0bcoDEKzVurTYzVwLRxaN5Yghg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2853
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

Thanks for the review.

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Tuesday, February 9, 2021 7:51 AM
> To: Sai Krishna Potthuri <lakshmis@xilinx.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>; Michal Simek
> <michals@xilinx.com>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; linux-gpio@vger.kernel.org; git
> <git@xilinx.com>; saikrishna12468@gmail.com
> Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: Added binding for ZynqM=
P
> pinctrl driver
>=20
> On Tue, Jan 19, 2021 at 10:57:33AM +0530, Sai Krishna Potthuri wrote:
> > Added documentation and dt-bindings file which contains MIO pin
> > configuration defines for Xilinx ZynqMP pinctrl driver.
> >
> > Signed-off-by: Sai Krishna Potthuri
> > <lakshmi.sai.krishna.potthuri@xilinx.com>
> > ---
> >  .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml | 337
> > ++++++++++++++++++  include/dt-bindings/pinctrl/pinctrl-zynqmp.h  |
> > 23 ++
> >  2 files changed, 360 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> >  create mode 100644 include/dt-bindings/pinctrl/pinctrl-zynqmp.h
> >
> > diff --git
> > a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> > b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..9f2efbafcaa4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.ya
> > +++ ml
> > @@ -0,0 +1,337 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause %YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/xlnx,zynqmp-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Xilinx ZynqMP Pinctrl
> > +
> > +maintainers:
> > +  - Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
> > +  - Rajan Vaja <rajan.vaja@xilinx.com>
> > +
> > +description: |
> > +  Please refer to pinctrl-bindings.txt in this directory for details
> > +of the
> > +  common pinctrl bindings used by client devices, including the
> > +meaning of the
> > +  phrase "pin configuration node".
> > +
> > +  ZynqMP's pin configuration nodes act as a container for an
> > + arbitrary number of  subnodes. Each of these subnodes represents
> > + some desired configuration for a  pin, a group, or a list of pins or
> > + groups. This configuration can include the  mux function to select
> > + on those pin(s)/group(s), and various pin configuration  parameters, =
such
> as pull-up, slew rate, etc.
> > +
> > +  Each configuration node can consist of multiple nodes describing
> > + the pinmux and  pinconf options. Those nodes can be pinmux nodes or
> pinconf nodes.
> > +
> > +  The name of each subnode is not important; all subnodes should be
> > + enumerated  and processed purely based on their content.
> > +
> > +properties:
> > +  compatible:
> > +    const: xlnx,zynqmp-pinctrl
> > +
> > +patternProperties:
> > +  '^(.*-)?(default|gpio)$':
> > +    type: object
> > +    patternProperties:
> > +      '^mux(.*)$':
>=20
> '^mux' is equivalent.
I will fix in v3.

>=20
> > +        type: object
> > +        description:
> > +          Pinctrl node's client devices use subnodes for pin muxes,
> > +          which in turn use below standard properties.
> > +        $ref: pinmux-node.yaml#
> > +
> > +        properties:
> > +          groups:
> > +            description:
> > +              List of groups to select (either this or "pins" must be
> > +              specified), available groups for this subnode.
> > +            items:
> > +              oneOf:
> > +                - enum: [ethernet0_0_grp, ethernet1_0_grp,
> > + ethernet2_0_grp,
>=20
> Don't need 'oneOf' for a single item.
Here we have a possibility to have more than one group item as below,
hence used 'oneOf'.
groups =3D "uart0_4_grp", "uart0_5_grp";
Please suggest me if there is a better/another way to represent this.

>=20
> > +                         ethernet3_0_grp, gemtsu0_0_grp, gemtsu0_1_grp=
,
> > +                         gemtsu0_2_grp, mdio0_0_grp, mdio1_0_grp,
> > +                         mdio1_1_grp, mdio2_0_grp, mdio3_0_grp,
> > +                         qspi0_0_grp, qspi_ss_0_grp, qspi_fbclk_0_grp,
> > +                         spi0_0_grp, spi0_ss_0_grp, spi0_ss_1_grp,
> > +                         spi0_ss_2_grp, spi0_1_grp, spi0_ss_3_grp,
> > +                         spi0_ss_4_grp, spi0_ss_5_grp, spi0_2_grp,
> > +                         spi0_ss_6_grp, spi0_ss_7_grp, spi0_ss_8_grp,
> > +                         spi0_3_grp, spi0_ss_9_grp, spi0_ss_10_grp,
> > +                         spi0_ss_11_grp, spi0_4_grp, spi0_ss_12_grp,
> > +                         spi0_ss_13_grp, spi0_ss_14_grp, spi0_5_grp,
> > +                         spi0_ss_15_grp, spi0_ss_16_grp, spi0_ss_17_gr=
p,
> > +                         spi1_0_grp, spi1_ss_0_grp, spi1_ss_1_grp,
> > +                         spi1_ss_2_grp, spi1_1_grp, spi1_ss_3_grp,
> > +                         spi1_ss_4_grp, spi1_ss_5_grp, spi1_2_grp,
> > +                         spi1_ss_6_grp, spi1_ss_7_grp, spi1_ss_8_grp,
> > +                         spi1_3_grp, spi1_ss_9_grp, spi1_ss_10_grp,
> > +                         spi1_ss_11_grp, spi1_4_grp, spi1_ss_12_grp,
> > +                         spi1_ss_13_grp, spi1_ss_14_grp, spi1_5_grp,
> > +                         spi1_ss_15_grp, spi1_ss_16_grp, spi1_ss_17_gr=
p,
> > +                         sdio0_0_grp, sdio0_1_grp, sdio0_2_grp,
> > +                         sdio0_3_grp, sdio0_4_grp, sdio0_5_grp,
> > +                         sdio0_6_grp, sdio0_7_grp, sdio0_8_grp,
> > +                         sdio0_9_grp, sdio0_10_grp, sdio0_11_grp,
> > +                         sdio0_12_grp, sdio0_13_grp, sdio0_14_grp,
> > +                         sdio0_15_grp, sdio0_16_grp, sdio0_17_grp,
> > +                         sdio0_18_grp, sdio0_19_grp, sdio0_20_grp,
> > +                         sdio0_21_grp, sdio0_22_grp, sdio0_23_grp,
> > +                         sdio0_24_grp, sdio0_25_grp, sdio0_26_grp,
> > +                         sdio0_27_grp, sdio0_28_grp, sdio0_29_grp,
> > +                         sdio0_30_grp, sdio0_31_grp, sdio0_32_grp,
> > +                         sdio0_pc_0_grp, sdio0_cd_0_grp, sdio0_wp_0_gr=
p,
> > +                         sdio0_pc_1_grp, sdio0_cd_1_grp, sdio0_wp_1_gr=
p,
> > +                         sdio0_pc_2_grp, sdio0_cd_2_grp, sdio0_wp_2_gr=
p,
> > +                         sdio1_0_grp, sdio1_1_grp, sdio1_2_grp,
> > +                         sdio1_3_grp, sdio1_4_grp, sdio1_5_grp,
> > +                         sdio1_6_grp, sdio1_7_grp, sdio1_8_grp,
> > +                         sdio1_9_grp, sdio1_10_grp, sdio1_11_grp,
> > +                         sdio1_12_grp, sdio1_13_grp, sdio1_14_grp,
> > +                         sdio1_15_grp, sdio1_pc_0_grp, sdio1_cd_0_grp,
> > +                         sdio1_wp_0_grp, sdio1_pc_1_grp, sdio1_cd_1_gr=
p,
> > +                         sdio1_wp_1_grp, nand0_0_grp, nand0_ce_0_grp,
> > +                         nand0_rb_0_grp, nand0_dqs_0_grp, nand0_ce_1_g=
rp,
> > +                         nand0_rb_1_grp, nand0_dqs_1_grp, can0_0_grp,
> > +                         can0_1_grp, can0_2_grp, can0_3_grp,
> > +                         can0_4_grp, can0_5_grp, can0_6_grp,
> > +                         can0_7_grp, can0_8_grp, can0_9_grp,
> > +                         can0_10_grp, can0_11_grp, can0_12_grp,
> > +                         can0_13_grp, can0_14_grp, can0_15_grp,
> > +                         can0_16_grp, can0_17_grp, can0_18_grp,
> > +                         can1_0_grp, can1_1_grp, can1_2_grp,
> > +                         can1_3_grp, can1_4_grp, can1_5_grp,
> > +                         can1_6_grp, can1_7_grp, can1_8_grp,
> > +                         can1_9_grp, can1_10_grp, can1_11_grp,
> > +                         can1_12_grp, can1_13_grp, can1_14_grp,
> > +                         can1_15_grp, can1_16_grp, can1_17_grp,
> > +                         can1_18_grp, can1_19_grp, uart0_0_grp,
> > +                         uart0_1_grp, uart0_2_grp, uart0_3_grp,
> > +                         uart0_4_grp, uart0_5_grp, uart0_6_grp,
> > +                         uart0_7_grp, uart0_8_grp, uart0_9_grp,
> > +                         uart0_10_grp, uart0_11_grp, uart0_12_grp,
> > +                         uart0_13_grp, uart0_14_grp, uart0_15_grp,
> > +                         uart0_16_grp, uart0_17_grp, uart0_18_grp,
> > +                         uart1_0_grp, uart1_1_grp, uart1_2_grp,
> > +                         uart1_3_grp, uart1_4_grp, uart1_5_grp,
> > +                         uart1_6_grp, uart1_7_grp, uart1_8_grp,
> > +                         uart1_9_grp, uart1_10_grp, uart1_11_grp,
> > +                         uart1_12_grp, uart1_13_grp, uart1_14_grp,
> > +                         uart1_15_grp, uart1_16_grp, uart1_17_grp,
> > +                         uart1_18_grp, i2c0_0_grp, i2c0_1_grp,
> > +                         i2c0_2_grp, i2c0_3_grp, i2c0_4_grp,
> > +                         i2c0_5_grp, i2c0_6_grp, i2c0_7_grp,
> > +                         i2c0_8_grp, i2c0_9_grp, i2c0_10_grp,
> > +                         i2c0_11_grp, i2c0_12_grp, i2c0_13_grp,
> > +                         i2c0_14_grp, i2c0_15_grp, i2c0_16_grp,
> > +                         i2c0_17_grp, i2c0_18_grp, i2c1_0_grp,
> > +                         i2c1_1_grp, i2c1_2_grp, i2c1_3_grp,
> > +                         i2c1_4_grp, i2c1_5_grp, i2c1_6_grp,
> > +                         i2c1_7_grp, i2c1_8_grp, i2c1_9_grp,
> > +                         i2c1_10_grp, i2c1_11_grp, i2c1_12_grp,
> > +                         i2c1_13_grp, i2c1_14_grp, i2c1_15_grp,
> > +                         i2c1_16_grp, i2c1_17_grp, i2c1_18_grp,
> > +                         i2c1_19_grp, ttc0_clk_0_grp, ttc0_wav_0_grp,
> > +                         ttc0_clk_1_grp, ttc0_wav_1_grp, ttc0_clk_2_gr=
p,
> > +                         ttc0_wav_2_grp, ttc0_clk_3_grp, ttc0_wav_3_gr=
p,
> > +                         ttc0_clk_4_grp, ttc0_wav_4_grp, ttc0_clk_5_gr=
p,
> > +                         ttc0_wav_5_grp, ttc0_clk_6_grp, ttc0_wav_6_gr=
p,
> > +                         ttc0_clk_7_grp, ttc0_wav_7_grp, ttc0_clk_8_gr=
p,
> > +                         ttc0_wav_8_grp, ttc1_clk_0_grp, ttc1_wav_0_gr=
p,
> > +                         ttc1_clk_1_grp, ttc1_wav_1_grp, ttc1_clk_2_gr=
p,
> > +                         ttc1_wav_2_grp, ttc1_clk_3_grp, ttc1_wav_3_gr=
p,
> > +                         ttc1_clk_4_grp, ttc1_wav_4_grp, ttc1_clk_5_gr=
p,
> > +                         ttc1_wav_5_grp, ttc1_clk_6_grp, ttc1_wav_6_gr=
p,
> > +                         ttc1_clk_7_grp, ttc1_wav_7_grp, ttc1_clk_8_gr=
p,
> > +                         ttc1_wav_8_grp, ttc2_clk_0_grp, ttc2_wav_0_gr=
p,
> > +                         ttc2_clk_1_grp, ttc2_wav_1_grp, ttc2_clk_2_gr=
p,
> > +                         ttc2_wav_2_grp, ttc2_clk_3_grp, ttc2_wav_3_gr=
p,
> > +                         ttc2_clk_4_grp, ttc2_wav_4_grp, ttc2_clk_5_gr=
p,
> > +                         ttc2_wav_5_grp, ttc2_clk_6_grp, ttc2_wav_6_gr=
p,
> > +                         ttc2_clk_7_grp, ttc2_wav_7_grp, ttc2_clk_8_gr=
p,
> > +                         ttc2_wav_8_grp, ttc3_clk_0_grp, ttc3_wav_0_gr=
p,
> > +                         ttc3_clk_1_grp, ttc3_wav_1_grp, ttc3_clk_2_gr=
p,
> > +                         ttc3_wav_2_grp, ttc3_clk_3_grp, ttc3_wav_3_gr=
p,
> > +                         ttc3_clk_4_grp, ttc3_wav_4_grp, ttc3_clk_5_gr=
p,
> > +                         ttc3_wav_5_grp, ttc3_clk_6_grp, ttc3_wav_6_gr=
p,
> > +                         ttc3_clk_7_grp, ttc3_wav_7_grp, ttc3_clk_8_gr=
p,
> > +                         ttc3_wav_8_grp, swdt0_clk_0_grp, swdt0_rst_0_=
grp,
> > +                         swdt0_clk_1_grp, swdt0_rst_1_grp, swdt0_clk_2=
_grp,
> > +                         swdt0_rst_2_grp, swdt0_clk_3_grp, swdt0_rst_3=
_grp,
> > +                         swdt0_clk_4_grp, swdt0_rst_4_grp, swdt0_clk_5=
_grp,
> > +                         swdt0_rst_5_grp, swdt0_clk_6_grp, swdt0_rst_6=
_grp,
> > +                         swdt0_clk_7_grp, swdt0_rst_7_grp, swdt0_clk_8=
_grp,
> > +                         swdt0_rst_8_grp, swdt0_clk_9_grp, swdt0_rst_9=
_grp,
> > +                         swdt0_clk_10_grp, swdt0_rst_10_grp, swdt0_clk=
_11_grp,
> > +                         swdt0_rst_11_grp, swdt0_clk_12_grp, swdt0_rst=
_12_grp,
> > +                         swdt1_clk_0_grp, swdt1_rst_0_grp, swdt1_clk_1=
_grp,
> > +                         swdt1_rst_1_grp, swdt1_clk_2_grp, swdt1_rst_2=
_grp,
> > +                         swdt1_clk_3_grp, swdt1_rst_3_grp, swdt1_clk_4=
_grp,
> > +                         swdt1_rst_4_grp, swdt1_clk_5_grp, swdt1_rst_5=
_grp,
> > +                         swdt1_clk_6_grp, swdt1_rst_6_grp, swdt1_clk_7=
_grp,
> > +                         swdt1_rst_7_grp, swdt1_clk_8_grp, swdt1_rst_8=
_grp,
> > +                         swdt1_clk_9_grp, swdt1_rst_9_grp, swdt1_clk_1=
0_grp,
> > +                         swdt1_rst_10_grp, swdt1_clk_11_grp, swdt1_rst=
_11_grp,
> > +                         swdt1_clk_12_grp, swdt1_rst_12_grp, gpio0_0_g=
rp,
> > +                         gpio0_1_grp, gpio0_2_grp, gpio0_3_grp,
> > +                         gpio0_4_grp, gpio0_5_grp, gpio0_6_grp,
> > +                         gpio0_7_grp, gpio0_8_grp, gpio0_9_grp,
> > +                         gpio0_10_grp, gpio0_11_grp, gpio0_12_grp,
> > +                         gpio0_13_grp, gpio0_14_grp, gpio0_15_grp,
> > +                         gpio0_16_grp, gpio0_17_grp, gpio0_18_grp,
> > +                         gpio0_19_grp, gpio0_20_grp, gpio0_21_grp,
> > +                         gpio0_22_grp, gpio0_23_grp, gpio0_24_grp,
> > +                         gpio0_25_grp, gpio0_26_grp, gpio0_27_grp,
> > +                         gpio0_28_grp, gpio0_29_grp, gpio0_30_grp,
> > +                         gpio0_31_grp, gpio0_32_grp, gpio0_33_grp,
> > +                         gpio0_34_grp, gpio0_35_grp, gpio0_36_grp,
> > +                         gpio0_37_grp, gpio0_38_grp, gpio0_39_grp,
> > +                         gpio0_40_grp, gpio0_41_grp, gpio0_42_grp,
> > +                         gpio0_43_grp, gpio0_44_grp, gpio0_45_grp,
> > +                         gpio0_46_grp, gpio0_47_grp, gpio0_48_grp,
> > +                         gpio0_49_grp, gpio0_50_grp, gpio0_51_grp,
> > +                         gpio0_52_grp, gpio0_53_grp, gpio0_54_grp,
> > +                         gpio0_55_grp, gpio0_56_grp, gpio0_57_grp,
> > +                         gpio0_58_grp, gpio0_59_grp, gpio0_60_grp,
> > +                         gpio0_61_grp, gpio0_62_grp, gpio0_63_grp,
> > +                         gpio0_64_grp, gpio0_65_grp, gpio0_66_grp,
> > +                         gpio0_67_grp, gpio0_68_grp, gpio0_69_grp,
> > +                         gpio0_70_grp, gpio0_71_grp, gpio0_72_grp,
> > +                         gpio0_73_grp, gpio0_74_grp, gpio0_75_grp,
> > +                         gpio0_76_grp, gpio0_77_grp, usb0_0_grp,
> > +                         usb1_0_grp, pmu0_0_grp, pmu0_1_grp,
> > +                         pmu0_2_grp, pmu0_3_grp, pmu0_4_grp,
> > +                         pmu0_5_grp, pmu0_6_grp, pmu0_7_grp,
> > +                         pmu0_8_grp, pmu0_9_grp, pmu0_10_grp,
> > +                         pmu0_11_grp, pcie0_0_grp, pcie0_1_grp,
> > +                         pcie0_2_grp, pcie0_3_grp, pcie0_4_grp,
> > +                         pcie0_5_grp, pcie0_6_grp, pcie0_7_grp,
> > +                         csu0_0_grp, csu0_1_grp, csu0_2_grp,
> > +                         csu0_3_grp, csu0_4_grp, csu0_5_grp,
> > +                         csu0_6_grp, csu0_7_grp, csu0_8_grp,
> > +                         csu0_9_grp, csu0_10_grp, csu0_11_grp,
> > +                         dpaux0_0_grp, dpaux0_1_grp, dpaux0_2_grp,
> > +                         dpaux0_3_grp, pjtag0_0_grp, pjtag0_1_grp,
> > +                         pjtag0_2_grp, pjtag0_3_grp, pjtag0_4_grp,
> > +                         pjtag0_5_grp, trace0_0_grp, trace0_clk_0_grp,
> > +                         trace0_1_grp, trace0_clk_1_grp, trace0_2_grp,
> > +                         trace0_clk_2_grp, testscan0_0_grp]
> > +
> > +          function:
> > +            description:
> > +              Specify the alternative function to be configured for th=
e
> > +              given pin groups.
> > +            enum: [ethernet0, ethernet1, ethernet2, ethernet3, gemtsu0=
, usb0,
> usb1, mdio0,
> > +                   mdio1, mdio2, mdio3, qspi0, qspi_fbclk, qspi_ss, sp=
i0, spi1,
> spi0_ss,
> > +                   spi1_ss, sdio0, sdio0_pc, sdio0_wp, sdio0_cd, sdio1=
, sdio1_pc,
> sdio1_wp,
> > +                   sdio1_cd, nand0, nand0_ce, nand0_rb, nand0_dqs, can=
0, can1,
> uart0, uart1,
> > +                   i2c0, i2c1, ttc0_clk, ttc0_wav, ttc1_clk, ttc1_wav,=
 ttc2_clk,
> ttc2_wav,
> > +                   ttc3_clk, ttc3_wav, swdt0_clk, swdt0_rst, swdt1_clk=
, swdt1_rst,
> gpio0, pmu0,
> > +                   pcie0, csu0, dpaux0, pjtag0, trace0, trace0_clk,
> > + testscan0]
> > +
> > +        required:
> > +          - groups
> > +          - function
> > +
> > +        additionalProperties: false
> > +
> > +      '^conf(.*)$':
>=20
> '^conf':
I will fix in v3.

>=20
> > +        type: object
> > +        description:
> > +          Pinctrl node's client devices use subnodes for pin configura=
tions,
> > +          which in turn use the standard properties below.
> > +        $ref: pincfg-node.yaml#
> > +
> > +        properties:
> > +          groups:
> > +            description:
> > +              List of pin groups as mentioned above (either this or "p=
ins" must
> > +              be specified).
> > +
> > +          pins:
> > +            description:
> > +              List of pin names to select in this subnode (either this=
 or "groups"
> must
> > +              be specified)
>=20
> This can be expressed as:
>=20
> oneOf:
>   - required: [ groups ]
>   - required: [ pins ]
I will use this in v3.

>=20
> > +            items:
> > +              oneOf:
>=20
> Can drop oneOf.
Similar to groups, we can have more than one pin item as below=20
pins =3D "MIO52", "MIO53", "MIO55"
Please suggest me if there is a better/another way to represent this.

>=20
> > +                - pattern: '^MIO([0-9]|[1-6][0-9]|7[0-7])$'
> > +
> > +          bias-pull-up: true
> > +
> > +          bias-pull-down: true
> > +
> > +          bias-disable: true
> > +
> > +          input-schmitt-enable: true
> > +
> > +          input-schmitt-disable: true
> > +
> > +          bias-high-impedance: true
> > +
> > +          low-power-enable: true
> > +
> > +          low-power-disable: true
> > +
> > +          slew-rate:
> > +            enum: [0, 1]
> > +
> > +          drive-strength:
> > +            description:
> > +              Selects the drive strength for MIO pins, in mA.
> > +            enum: [2, 4, 8, 12]
> > +
> > +          io-standard:
> > +            description:
> > +              Selects the IO standard for MIO pins, this is driver spe=
cific.
> > +            $ref: "/schemas/types.yaml#/definitions/uint32"
> > +            enum: [0, 1]
> > +
> > +        additionalProperties: false
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/pinctrl/pinctrl-zynqmp.h>
> > +    zynqmp_firmware: zynqmp-firmware {
> > +        pinctrl0: pinctrl {
> > +          compatible =3D "xlnx,zynqmp-pinctrl";
> > +
> > +          pinctrl_uart1_default: uart1-default {
> > +             mux {
> > +                 groups =3D "uart0_4_grp", "uart0_5_grp";
> > +                 function =3D "uart0";
> > +             };
> > +
> > +             conf {
> > +                groups =3D "uart0_4_grp";
> > +                slew-rate =3D <SLEW_RATE_SLOW>;
> > +                io-standard =3D <IO_STANDARD_LVCMOS18>;
> > +             };
> > +
> > +             conf-rx {
> > +                pins =3D "MIO18";
> > +                bias-pull-up;
> > +             };
> > +
> > +             conf-tx {
> > +                pins =3D "MIO19";
> > +                bias-disable;
> > +                input-schmitt-disable;
> > +             };
> > +          };
> > +        };
> > +    };
> > +
> > +    uart1 {
> > +         pinctrl-names =3D "default";
> > +         pinctrl-0 =3D <&pinctrl_uart1_default>;
> > +    };
> > +
> > +...
> > diff --git a/include/dt-bindings/pinctrl/pinctrl-zynqmp.h
> > b/include/dt-bindings/pinctrl/pinctrl-zynqmp.h
> > new file mode 100644
> > index 000000000000..b73b0ae2f90b
> > --- /dev/null
> > +++ b/include/dt-bindings/pinctrl/pinctrl-zynqmp.h
> > @@ -0,0 +1,23 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * MIO pin configuration defines for Xilinx ZynqMP
> > + *
> > + * Copyright (C) 2020 Xilinx, Inc.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_PINCTRL_ZYNQMP_H #define
> > +_DT_BINDINGS_PINCTRL_ZYNQMP_H
> > +
> > +/* Bit value for IO standards */
> > +#define IO_STANDARD_LVCMOS33	0
> > +#define IO_STANDARD_LVCMOS18	1
> > +
> > +/* Bit values for Slew Rates */
> > +#define SLEW_RATE_FAST		0
> > +#define SLEW_RATE_SLOW		1
> > +
> > +/* Bit values for Pin inputs */
> > +#define PIN_INPUT_TYPE_CMOS	0
> > +#define PIN_INPUT_TYPE_SCHMITT	1
>=20
> Still used?
I will fix in v3.

Regards
Sai Krishna
>=20
> > +
> > +#endif /* _DT_BINDINGS_PINCTRL_ZYNQMP_H */
> > --
> > 2.17.1
> >
