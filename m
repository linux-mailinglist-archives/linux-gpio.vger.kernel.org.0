Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83EC92D58CF
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 12:03:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388787AbgLJLBv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 06:01:51 -0500
Received: from mail-bn8nam12on2075.outbound.protection.outlook.com ([40.107.237.75]:3264
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732956AbgLJLBl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Dec 2020 06:01:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjLTzREXSpDSoPFneLfgQw8GyVs276WYopYO7Ny+zih6dIwCHBwGxNg3evHlxyyIiuOkESkki6QGMRRKzpXqW95VtgEN/+9Eb0gqB0CvmF5+LnaE/UkWqflU8wne4EhiDXHk4udGN1hobkEyKU70wgWJmST5lMnSxNIE+lO87zrxXlZmuOrVi7rW/9IdclavCrp2Cmbd2CNyLttzIFYAEEEDJjcTUWAbcHqRh4qOvzU/qWg6A3TImX+MzHwt6SgP+s3rVin50ms9CKKBOsxo5Z1OnOs7xb4VgwTQA5+PreXeK3EZa30OX25mkftLx2mKJTlaEiQz/2w8998jPMOEnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBXysoX0y+ecoIOpiZIV5XgauzDQ3DdIvpx5pdRrfyg=;
 b=Eem5QSqjQjX9Xn3x10uPdzxjsK1p4/nlGWYcFj3xM1ucATyQi2tcAjST5MBZ1GkLNjzXWytJPVsiOSJubIUleM9ck1quoH5d/cbTOOBemkxxhnmqPqt6GxN3QVGhTf/z0VULvZ4xflvD+CO5Kq854Pk54FM5YP0Ej4iZJEtgp2VLKdDUuO2JREL1VoUYfXdUFMTOduo/4zGmPSyFgEdP7m4gR2/nyT/JzNVGNxVj0WrkYAcfjEka3g6NfoKSEu+ks06J8pmbuMegxaDL+M2oOU0SibEJ2KgOiNp/EOZV1MydNTXPATGQdno0HPA8jEtPW052qA920gsyElH8A3z7Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBXysoX0y+ecoIOpiZIV5XgauzDQ3DdIvpx5pdRrfyg=;
 b=cYqHlm8v0eo9XuZv6Kx40FkIGEKeThRzSj6bQryseKnxd1Oz9g4s+0/ORy0Mi+O9aJa32MnNbqDSEtaLR8Gt7SpZUN2zQJ2y6be6NThTm1GB29BpHZSDbs1LDFzASNh2CkZYeE/ntkAK2u6Z0XquFLO/qqZpqRG8Q3hPPtZmJGY=
Received: from CY4PR02MB3270.namprd02.prod.outlook.com (2603:10b6:910:78::26)
 by CY4PR02MB3270.namprd02.prod.outlook.com (2603:10b6:910:78::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.23; Thu, 10 Dec
 2020 11:00:42 +0000
Received: from CY4PR02MB3270.namprd02.prod.outlook.com
 ([fe80::89a4:3ddb:9cd0:5086]) by CY4PR02MB3270.namprd02.prod.outlook.com
 ([fe80::89a4:3ddb:9cd0:5086%2]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 11:00:42 +0000
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
Subject: RE: [PATCH 2/3] dt-bindings: pinctrl: Added binding for ZynqMP
 pinctrl driver
Thread-Topic: [PATCH 2/3] dt-bindings: pinctrl: Added binding for ZynqMP
 pinctrl driver
Thread-Index: AQHWzgcaMePZt4bAWUOxyHyHq08MFanu/mCAgAADqTA=
Date:   Thu, 10 Dec 2020 11:00:41 +0000
Message-ID: <CY4PR02MB3270DD2379FC8504AAAA0724BDCB0@CY4PR02MB3270.namprd02.prod.outlook.com>
References: <1607503454-26503-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1607503454-26503-3-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <20201209170329.GB578453@robh.at.kernel.org>
In-Reply-To: <20201209170329.GB578453@robh.at.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [183.83.140.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3cae0f2f-50ee-4d77-fee4-08d89cfad635
x-ms-traffictypediagnostic: CY4PR02MB3270:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR02MB32701F5445459FB5D6BA1867BDCB0@CY4PR02MB3270.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BFgBCMjF/IDjcza33a//Wd1jESD1wm2chto4pp0WBeuD4vK70oMMOqf0U3kqALMQSrOgqAF7icgMI7hYoZ88DlCN1B1t0PQrj7RDrdFDajfXsK9ZchuDWB/PPRjNitP4x6y8xKbzXbBvs5synEkuladiiZy05rsS6q3wgdK9s8JNliKlBt12KP7yJzVF5tzWd6KW2eeHKgVtwy7z/Rq+SJkeaWWDHv6SAISwI+7JjpIFnlWIfq9YU4/UzaYlIYTc54jjI9v/mQhu3MmYTksKq3VS2d+PokTttRM7DVDGR1rQabiY/9ib5ZIn3b+xey/C2sZWEnv7Zax266JNWWMq75iY/8T6VUzkhXZPTRVEpAF2R97rGsYdHyTFe7+CPlCzdmXQ8gXA+Ww8HgTb0eYlQA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR02MB3270.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(366004)(33656002)(7696005)(86362001)(66446008)(52536014)(83380400001)(54906003)(76116006)(6916009)(508600001)(66476007)(66556008)(186003)(2906002)(4326008)(26005)(64756008)(71200400001)(5660300002)(6506007)(8936002)(966005)(55016002)(9686003)(66946007)(8676002)(53546011)(30864003)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ZNylPbwPwLWzUoCEeQS7lDAxT96QRiDXKYLVBqA7NzhhXTtXdri8v6+5p96r?=
 =?us-ascii?Q?8pF4fIUWlc3qDmVtIsIBpwqfrzk/OPWv5rx/RB0c7ki7+pmoSTWlwURZG5FM?=
 =?us-ascii?Q?ab6R3lirNTaRUDnWF/tQWfXa3vrIya0Rk3De1K5s6bAlPEPv+6/XScGtVz+o?=
 =?us-ascii?Q?Kbvi1PfGGQN+DfYiNjMSyV5/cbtqPDCjhLWvdLcxQG60yfSsTa3D+9QNmOSv?=
 =?us-ascii?Q?3x7fQTUw4SbiAt5Wl7OUB/WPPqMdb7WkIrP4XhVW93fMM0iO8iSlf/Ic7KED?=
 =?us-ascii?Q?akRXIIVbXy1Sm9nJbNlXdlt5/H9oYVQc9mill+2tiCj+FwOE7a9Jo3iIHPYD?=
 =?us-ascii?Q?O6F4fw3CdPeWTMmVbWhYcAZ2Rbul9e3pUZHeP2rpoA+bDQRIRbvdQe6pk2PD?=
 =?us-ascii?Q?OnY5cwnEC4ZWVWEdUmWsYd9s48Ar3Q2Fukqo5Q+T9VB+7mAG7Q1fiscSLfAj?=
 =?us-ascii?Q?W18X3PHvKs6b29eb9JaA6s+1yeZZOEKf8bof2h0HjaQiikwcAq19W13QDkFx?=
 =?us-ascii?Q?zViMW8St8nsSZwICrGVuYssvxx09dEjJBfvQTL5fG1NQGrp982ANwjN2UTPe?=
 =?us-ascii?Q?hsjZHO1KjWepWxr0bNtSLpxPHfSHitFKp8hBFuGq6Q2sLxkQfCpNpPfuRBp0?=
 =?us-ascii?Q?zHydl2xDCob0lsduOHjnFdvkfaJl+u718vAg5uLOG00B0WA4KM64UvATVCpC?=
 =?us-ascii?Q?xTrhJpiXj/B0KKJ+XCWNBSTr+qwrpThqHPjJtXJhTAtkXLFPnhpiuSaB5b1D?=
 =?us-ascii?Q?IbStQ0A6yE/qbrxQ8UybhPYid8CrdTyw3pXKHEZWr05IjRrg9H47gDgeD9AB?=
 =?us-ascii?Q?kblyHCEtgP0tEfF8c6tkAaJz0mFAchYCY1m9tUUR9v5xSbBsRwQC5WVXlnNW?=
 =?us-ascii?Q?puS8FV97Q10w+2zcJfm7dfH3GnIDTw9G/Qo4IkZUypQoJHQsTGKMAKO1f76w?=
 =?us-ascii?Q?1K/Hi5cofdo2N31+zoeGZlL1M+yt5TAInA6gNO9TUSk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR02MB3270.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cae0f2f-50ee-4d77-fee4-08d89cfad635
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 11:00:42.0456
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H6t2JTOzH9mFQcwd3wLlo9vYX156mfCkQ8Pojjr12rqDdSgRB7EqheOLUW/K9G+11gfKDz+5G/xpVASRaMfDMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3270
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

Thanks for the review

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Wednesday, December 9, 2020 10:33 PM
> To: Sai Krishna Potthuri <lakshmis@xilinx.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>; Michal Simek
> <michals@xilinx.com>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; linux-gpio@vger.kernel.org; git
> <git@xilinx.com>; saikrishna12468@gmail.com
> Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: Added binding for ZynqMP
> pinctrl driver
>=20
> On Wed, Dec 09, 2020 at 02:14:13PM +0530, Sai Krishna Potthuri wrote:
> > Added documentation and dt-bindings file which contains MIO pin
> > configuration defines for Xilinx ZynqMP pinctrl driver.
> >
> > Signed-off-by: Sai Krishna Potthuri
> > <lakshmi.sai.krishna.potthuri@xilinx.com>
> > ---
> >  .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml | 329
> > ++++++++++++++++++  include/dt-bindings/pinctrl/pinctrl-zynqmp.h  |
> > 29 ++
> >  2 files changed, 358 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> >  create mode 100644 include/dt-bindings/pinctrl/pinctrl-zynqmp.h
> >
> > diff --git
> > a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> > b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..dd0c8c12714f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.ya
> > +++ ml
> > @@ -0,0 +1,329 @@
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
> > +      '^(.*-)?mux$':
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
> > +            enum: [ethernet0_0_grp, ethernet1_0_grp, ethernet2_0_grp,
> > +                   ethernet3_0_grp, gemtsu0_0_grp, gemtsu0_1_grp,
> > +                   gemtsu0_2_grp, mdio0_0_grp, mdio1_0_grp,
> > +                   mdio1_1_grp, mdio2_0_grp, mdio3_0_grp,
> > +                   qspi0_0_grp, qspi_ss_0_grp, qspi_fbclk_0_grp,
> > +                   spi0_0_grp, spi0_ss_0_grp, spi0_ss_1_grp,
> > +                   spi0_ss_2_grp, spi0_1_grp, spi0_ss_3_grp,
> > +                   spi0_ss_4_grp, spi0_ss_5_grp, spi0_2_grp,
> > +                   spi0_ss_6_grp, spi0_ss_7_grp, spi0_ss_8_grp,
> > +                   spi0_3_grp, spi0_ss_9_grp, spi0_ss_10_grp,
> > +                   spi0_ss_11_grp, spi0_4_grp, spi0_ss_12_grp,
> > +                   spi0_ss_13_grp, spi0_ss_14_grp, spi0_5_grp,
> > +                   spi0_ss_15_grp, spi0_ss_16_grp, spi0_ss_17_grp,
> > +                   spi1_0_grp, spi1_ss_0_grp, spi1_ss_1_grp,
> > +                   spi1_ss_2_grp, spi1_1_grp, spi1_ss_3_grp,
> > +                   spi1_ss_4_grp, spi1_ss_5_grp, spi1_2_grp,
> > +                   spi1_ss_6_grp, spi1_ss_7_grp, spi1_ss_8_grp,
> > +                   spi1_3_grp, spi1_ss_9_grp, spi1_ss_10_grp,
> > +                   spi1_ss_11_grp, spi1_4_grp, spi1_ss_12_grp,
> > +                   spi1_ss_13_grp, spi1_ss_14_grp, spi1_5_grp,
> > +                   spi1_ss_15_grp, spi1_ss_16_grp, spi1_ss_17_grp,
> > +                   sdio0_0_grp, sdio0_1_grp, sdio0_2_grp,
> > +                   sdio0_3_grp, sdio0_4_grp, sdio0_5_grp,
> > +                   sdio0_6_grp, sdio0_7_grp, sdio0_8_grp,
> > +                   sdio0_9_grp, sdio0_10_grp, sdio0_11_grp,
> > +                   sdio0_12_grp, sdio0_13_grp, sdio0_14_grp,
> > +                   sdio0_15_grp, sdio0_16_grp, sdio0_17_grp,
> > +                   sdio0_18_grp, sdio0_19_grp, sdio0_20_grp,
> > +                   sdio0_21_grp, sdio0_22_grp, sdio0_23_grp,
> > +                   sdio0_24_grp, sdio0_25_grp, sdio0_26_grp,
> > +                   sdio0_27_grp, sdio0_28_grp, sdio0_29_grp,
> > +                   sdio0_30_grp, sdio0_31_grp, sdio0_32_grp,
> > +                   sdio0_pc_0_grp, sdio0_cd_0_grp, sdio0_wp_0_grp,
> > +                   sdio0_pc_1_grp, sdio0_cd_1_grp, sdio0_wp_1_grp,
> > +                   sdio0_pc_2_grp, sdio0_cd_2_grp, sdio0_wp_2_grp,
> > +                   sdio1_0_grp, sdio1_1_grp, sdio1_2_grp,
> > +                   sdio1_3_grp, sdio1_4_grp, sdio1_5_grp,
> > +                   sdio1_6_grp, sdio1_7_grp, sdio1_8_grp,
> > +                   sdio1_9_grp, sdio1_10_grp, sdio1_11_grp,
> > +                   sdio1_12_grp, sdio1_13_grp, sdio1_14_grp,
> > +                   sdio1_15_grp, sdio1_pc_0_grp, sdio1_cd_0_grp,
> > +                   sdio1_wp_0_grp, sdio1_pc_1_grp, sdio1_cd_1_grp,
> > +                   sdio1_wp_1_grp, nand0_0_grp, nand0_ce_0_grp,
> > +                   nand0_rb_0_grp, nand0_dqs_0_grp, nand0_ce_1_grp,
> > +                   nand0_rb_1_grp, nand0_dqs_1_grp, can0_0_grp,
> > +                   can0_1_grp, can0_2_grp, can0_3_grp,
> > +                   can0_4_grp, can0_5_grp, can0_6_grp,
> > +                   can0_7_grp, can0_8_grp, can0_9_grp,
> > +                   can0_10_grp, can0_11_grp, can0_12_grp,
> > +                   can0_13_grp, can0_14_grp, can0_15_grp,
> > +                   can0_16_grp, can0_17_grp, can0_18_grp,
> > +                   can1_0_grp, can1_1_grp, can1_2_grp,
> > +                   can1_3_grp, can1_4_grp, can1_5_grp,
> > +                   can1_6_grp, can1_7_grp, can1_8_grp,
> > +                   can1_9_grp, can1_10_grp, can1_11_grp,
> > +                   can1_12_grp, can1_13_grp, can1_14_grp,
> > +                   can1_15_grp, can1_16_grp, can1_17_grp,
> > +                   can1_18_grp, can1_19_grp, uart0_0_grp,
> > +                   uart0_1_grp, uart0_2_grp, uart0_3_grp,
> > +                   uart0_4_grp, uart0_5_grp, uart0_6_grp,
> > +                   uart0_7_grp, uart0_8_grp, uart0_9_grp,
> > +                   uart0_10_grp, uart0_11_grp, uart0_12_grp,
> > +                   uart0_13_grp, uart0_14_grp, uart0_15_grp,
> > +                   uart0_16_grp, uart0_17_grp, uart0_18_grp,
> > +                   uart1_0_grp, uart1_1_grp, uart1_2_grp,
> > +                   uart1_3_grp, uart1_4_grp, uart1_5_grp,
> > +                   uart1_6_grp, uart1_7_grp, uart1_8_grp,
> > +                   uart1_9_grp, uart1_10_grp, uart1_11_grp,
> > +                   uart1_12_grp, uart1_13_grp, uart1_14_grp,
> > +                   uart1_15_grp, uart1_16_grp, uart1_17_grp,
> > +                   uart1_18_grp, i2c0_0_grp, i2c0_1_grp,
> > +                   i2c0_2_grp, i2c0_3_grp, i2c0_4_grp,
> > +                   i2c0_5_grp, i2c0_6_grp, i2c0_7_grp,
> > +                   i2c0_8_grp, i2c0_9_grp, i2c0_10_grp,
> > +                   i2c0_11_grp, i2c0_12_grp, i2c0_13_grp,
> > +                   i2c0_14_grp, i2c0_15_grp, i2c0_16_grp,
> > +                   i2c0_17_grp, i2c0_18_grp, i2c1_0_grp,
> > +                   i2c1_1_grp, i2c1_2_grp, i2c1_3_grp,
> > +                   i2c1_4_grp, i2c1_5_grp, i2c1_6_grp,
> > +                   i2c1_7_grp, i2c1_8_grp, i2c1_9_grp,
> > +                   i2c1_10_grp, i2c1_11_grp, i2c1_12_grp,
> > +                   i2c1_13_grp, i2c1_14_grp, i2c1_15_grp,
> > +                   i2c1_16_grp, i2c1_17_grp, i2c1_18_grp,
> > +                   i2c1_19_grp, ttc0_clk_0_grp, ttc0_wav_0_grp,
> > +                   ttc0_clk_1_grp, ttc0_wav_1_grp, ttc0_clk_2_grp,
> > +                   ttc0_wav_2_grp, ttc0_clk_3_grp, ttc0_wav_3_grp,
> > +                   ttc0_clk_4_grp, ttc0_wav_4_grp, ttc0_clk_5_grp,
> > +                   ttc0_wav_5_grp, ttc0_clk_6_grp, ttc0_wav_6_grp,
> > +                   ttc0_clk_7_grp, ttc0_wav_7_grp, ttc0_clk_8_grp,
> > +                   ttc0_wav_8_grp, ttc1_clk_0_grp, ttc1_wav_0_grp,
> > +                   ttc1_clk_1_grp, ttc1_wav_1_grp, ttc1_clk_2_grp,
> > +                   ttc1_wav_2_grp, ttc1_clk_3_grp, ttc1_wav_3_grp,
> > +                   ttc1_clk_4_grp, ttc1_wav_4_grp, ttc1_clk_5_grp,
> > +                   ttc1_wav_5_grp, ttc1_clk_6_grp, ttc1_wav_6_grp,
> > +                   ttc1_clk_7_grp, ttc1_wav_7_grp, ttc1_clk_8_grp,
> > +                   ttc1_wav_8_grp, ttc2_clk_0_grp, ttc2_wav_0_grp,
> > +                   ttc2_clk_1_grp, ttc2_wav_1_grp, ttc2_clk_2_grp,
> > +                   ttc2_wav_2_grp, ttc2_clk_3_grp, ttc2_wav_3_grp,
> > +                   ttc2_clk_4_grp, ttc2_wav_4_grp, ttc2_clk_5_grp,
> > +                   ttc2_wav_5_grp, ttc2_clk_6_grp, ttc2_wav_6_grp,
> > +                   ttc2_clk_7_grp, ttc2_wav_7_grp, ttc2_clk_8_grp,
> > +                   ttc2_wav_8_grp, ttc3_clk_0_grp, ttc3_wav_0_grp,
> > +                   ttc3_clk_1_grp, ttc3_wav_1_grp, ttc3_clk_2_grp,
> > +                   ttc3_wav_2_grp, ttc3_clk_3_grp, ttc3_wav_3_grp,
> > +                   ttc3_clk_4_grp, ttc3_wav_4_grp, ttc3_clk_5_grp,
> > +                   ttc3_wav_5_grp, ttc3_clk_6_grp, ttc3_wav_6_grp,
> > +                   ttc3_clk_7_grp, ttc3_wav_7_grp, ttc3_clk_8_grp,
> > +                   ttc3_wav_8_grp, swdt0_clk_0_grp, swdt0_rst_0_grp,
> > +                   swdt0_clk_1_grp, swdt0_rst_1_grp, swdt0_clk_2_grp,
> > +                   swdt0_rst_2_grp, swdt0_clk_3_grp, swdt0_rst_3_grp,
> > +                   swdt0_clk_4_grp, swdt0_rst_4_grp, swdt0_clk_5_grp,
> > +                   swdt0_rst_5_grp, swdt0_clk_6_grp, swdt0_rst_6_grp,
> > +                   swdt0_clk_7_grp, swdt0_rst_7_grp, swdt0_clk_8_grp,
> > +                   swdt0_rst_8_grp, swdt0_clk_9_grp, swdt0_rst_9_grp,
> > +                   swdt0_clk_10_grp, swdt0_rst_10_grp, swdt0_clk_11_gr=
p,
> > +                   swdt0_rst_11_grp, swdt0_clk_12_grp, swdt0_rst_12_gr=
p,
> > +                   swdt1_clk_0_grp, swdt1_rst_0_grp, swdt1_clk_1_grp,
> > +                   swdt1_rst_1_grp, swdt1_clk_2_grp, swdt1_rst_2_grp,
> > +                   swdt1_clk_3_grp, swdt1_rst_3_grp, swdt1_clk_4_grp,
> > +                   swdt1_rst_4_grp, swdt1_clk_5_grp, swdt1_rst_5_grp,
> > +                   swdt1_clk_6_grp, swdt1_rst_6_grp, swdt1_clk_7_grp,
> > +                   swdt1_rst_7_grp, swdt1_clk_8_grp, swdt1_rst_8_grp,
> > +                   swdt1_clk_9_grp, swdt1_rst_9_grp, swdt1_clk_10_grp,
> > +                   swdt1_rst_10_grp, swdt1_clk_11_grp, swdt1_rst_11_gr=
p,
> > +                   swdt1_clk_12_grp, swdt1_rst_12_grp, gpio0_0_grp,
> > +                   gpio0_1_grp, gpio0_2_grp, gpio0_3_grp,
> > +                   gpio0_4_grp, gpio0_5_grp, gpio0_6_grp,
> > +                   gpio0_7_grp, gpio0_8_grp, gpio0_9_grp,
> > +                   gpio0_10_grp, gpio0_11_grp, gpio0_12_grp,
> > +                   gpio0_13_grp, gpio0_14_grp, gpio0_15_grp,
> > +                   gpio0_16_grp, gpio0_17_grp, gpio0_18_grp,
> > +                   gpio0_19_grp, gpio0_20_grp, gpio0_21_grp,
> > +                   gpio0_22_grp, gpio0_23_grp, gpio0_24_grp,
> > +                   gpio0_25_grp, gpio0_26_grp, gpio0_27_grp,
> > +                   gpio0_28_grp, gpio0_29_grp, gpio0_30_grp,
> > +                   gpio0_31_grp, gpio0_32_grp, gpio0_33_grp,
> > +                   gpio0_34_grp, gpio0_35_grp, gpio0_36_grp,
> > +                   gpio0_37_grp, gpio0_38_grp, gpio0_39_grp,
> > +                   gpio0_40_grp, gpio0_41_grp, gpio0_42_grp,
> > +                   gpio0_43_grp, gpio0_44_grp, gpio0_45_grp,
> > +                   gpio0_46_grp, gpio0_47_grp, gpio0_48_grp,
> > +                   gpio0_49_grp, gpio0_50_grp, gpio0_51_grp,
> > +                   gpio0_52_grp, gpio0_53_grp, gpio0_54_grp,
> > +                   gpio0_55_grp, gpio0_56_grp, gpio0_57_grp,
> > +                   gpio0_58_grp, gpio0_59_grp, gpio0_60_grp,
> > +                   gpio0_61_grp, gpio0_62_grp, gpio0_63_grp,
> > +                   gpio0_64_grp, gpio0_65_grp, gpio0_66_grp,
> > +                   gpio0_67_grp, gpio0_68_grp, gpio0_69_grp,
> > +                   gpio0_70_grp, gpio0_71_grp, gpio0_72_grp,
> > +                   gpio0_73_grp, gpio0_74_grp, gpio0_75_grp,
> > +                   gpio0_76_grp, gpio0_77_grp, usb0_0_grp,
> > +                   usb1_0_grp, pmu0_0_grp, pmu0_1_grp,
> > +                   pmu0_2_grp, pmu0_3_grp, pmu0_4_grp,
> > +                   pmu0_5_grp, pmu0_6_grp, pmu0_7_grp,
> > +                   pmu0_8_grp, pmu0_9_grp, pmu0_10_grp,
> > +                   pmu0_11_grp, pcie0_0_grp, pcie0_1_grp,
> > +                   pcie0_2_grp, pcie0_3_grp, pcie0_4_grp,
> > +                   pcie0_5_grp, pcie0_6_grp, pcie0_7_grp,
> > +                   csu0_0_grp, csu0_1_grp, csu0_2_grp,
> > +                   csu0_3_grp, csu0_4_grp, csu0_5_grp,
> > +                   csu0_6_grp, csu0_7_grp, csu0_8_grp,
> > +                   csu0_9_grp, csu0_10_grp, csu0_11_grp,
> > +                   dpaux0_0_grp, dpaux0_1_grp, dpaux0_2_grp,
> > +                   dpaux0_3_grp, pjtag0_0_grp, pjtag0_1_grp,
> > +                   pjtag0_2_grp, pjtag0_3_grp, pjtag0_4_grp,
> > +                   pjtag0_5_grp, trace0_0_grp, trace0_clk_0_grp,
> > +                   trace0_1_grp, trace0_clk_1_grp, trace0_2_grp,
> > +                   trace0_clk_2_grp, testscan0_0_grp]
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
> > +      '^(.*-)?conf$':
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
> > +            enum: [MIO0, MIO1, .., MIO18, MIO19,.., MIO77]
>=20
> '..' is a pin name? Use 'pattern':
>=20
> pattern: '^MIO([0-9]|[0-7][0-9])$'
Ok, I will update in v2

>=20
> > +
> > +          bias-pull-up: true
> > +
> > +          bias-pull-down: true
> > +
> > +          bias-disable: true
> > +
> > +          slew-rate:
> > +            description:
> > +              Selects the slew rate for the specified pins.
>=20
> Don't need description for common properties.
Ok, I will remove this in v2

>=20
> > +            enum: [0, 1]
> > +
> > +          drive-strength:
> > +            description:
> > +              Selects the drive strength for MIO pins, in mA.
> > +            enum: [2, 4, 8, 12]
> > +
> > +          io-standard:
>=20
> Not a common property, needs a type ref. Should have had a vendor prefix
> too, but I guess this is carried over from Zynq.
Ok, I will add type ref.
Yes, it is there from Zynq. Is it fine to go with the same name or vendor
prefix should be added for ZynqMP? Please suggest.

>=20
> > +            description:
> > +              Selects the IO standard for MIO pins, this is driver spe=
cific.
>=20
> What is io standard?
It is more of selecting between LVCOS 3.3V and LVCMOS 1.8V.
Macros for these two are defined in dt-binding file mentioned below.

>=20
> Looks like the same thing as 'power-source' though.
>=20
> > +            enum: [0, 1]
> > +
> > +          schmitt-cmos:
>=20
> Needs a vendor prefix and type.
Ok, I will add vendor prefix here and type ref.

>=20
> > +              description:
> > +                Selects the schmitt or cmos input for MIO pins, this i=
s driver
> specific.
> > +              enum: [0, 1]
>=20
> Is there a default if not present because you didn't make it required.
> If there a default, then you just need this to be boolean for the non-def=
ault.
>=20
> Or doesn't input-schmitt-disable work for you?
This property can be optional as we have some default value from design.
Based on the requirement this can be changed to CMOS(0) or SCHMITT (1).

>=20
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
> > +                 groups =3D "uart0_4_grp";
> > +                 function =3D "uart0";
> > +             };
> > +
> > +             conf {
> > +                groups =3D "uart0_4_grp";
> > +                slew-rate =3D <SLEW_RATE_SLOW>;
> > +                io-standard =3D <IO_STANDARD_LVCMOS18>;
> > +             };
> > +
> > +             rx-conf {
> > +                pins =3D "MIO18";
> > +                bias-pull-up;
> > +             };
> > +
> > +             tx-conf {
> > +                pins =3D "MIO19";
> > +                bias-disable;
> > +                schmitt-cmos =3D <PIN_INPUT_TYPE_CMOS>;
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
> > index 000000000000..509190aa45f7
> > --- /dev/null
> > +++ b/include/dt-bindings/pinctrl/pinctrl-zynqmp.h
> > @@ -0,0 +1,29 @@
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
> > +
> > +/* Bit values for drive control*/
> > +#define DRIVE_STRENGTH_2MA	2
> > +#define DRIVE_STRENGTH_4MA	4
> > +#define DRIVE_STRENGTH_8MA	8
> > +#define DRIVE_STRENGTH_12MA	12
>=20
> Drop this. Define names with the value of the define in them are kind of
> pointless. Plus this is a common property, so if we wanted defines for it=
 we'd
> already have them.
Ok, I will remove these defines.

Regards,
Sai Krishna
>=20
> > +
> > +#endif /* _DT_BINDINGS_PINCTRL_ZYNQMP_H */
> > --
> > 2.17.1
> >
