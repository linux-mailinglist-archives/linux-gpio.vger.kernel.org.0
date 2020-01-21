Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7774E1438D5
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2020 09:53:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728792AbgAUIxa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jan 2020 03:53:30 -0500
Received: from mail-dm6nam12on2044.outbound.protection.outlook.com ([40.107.243.44]:23104
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727220AbgAUIxa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Jan 2020 03:53:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQH1hJFoz2bxx90/x5ouX/dG09YT1UyDCmrQJOHjSy7OoazCuetWtEPv7cCc2BXpLWdiqHWIR9nN/B2CwcMX1junZwBgQ9uqILVH1OjjTzEV3r40LL2otu71bQZqQo1hdTGleHYre0vje7kWf34qHClqQJfUBA+hanDQtuk4+mQTlCZ2YJWZSluhu3PyjirxtMfMwdWPIlN0hiv/ncDAGV5z8mcBsYOMjFLkSywQ3cUnYCy3FzBIoLyILeALDz29XvPl8u37cQ/UsvryV+c/p0PK6y4xACAoyVxT3D2LZeEPadOr/1wURyxYsxV263Ev1wQqnqxaI8oTIRg5FObdwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gV32NLsqq/wTt3dDDn60JYdntv6g/flZbaGSC2MnbvM=;
 b=BWqXuQYpMD2jvbcZEUW8x4EMGvAgFUL80qqo8YGUd8mSCMU9KS/bbQ1CxgB3HZCjeVpWuMvbfl58bhbNMS/oqnzMdncVoWBVo8NwXwac6AUt/C/BP4qWu68XBtXdd/LutW1JiLxsIGPkXGnQfti10KpEyyXJ/nSx0fy9/ITW3sFvJBMzgBkF45hiahIFDKOoBzsdFZ60l+WfTgcg058FR/P1ZDM+7Ucp/P5JN+7kNjx5rfzfVdYa5eUDd3RdlottEz3/nuXFeru1Dl5wezRlqocg8GsHei7Q4cBFB+j5KKc+YGsvzjXsvMYmc1MdgBrPxNWhAiq/nSf2MhaTbKdFjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gV32NLsqq/wTt3dDDn60JYdntv6g/flZbaGSC2MnbvM=;
 b=ap+jDAeVfkGGy8dqENuOJziWfgcqTPPn58OLDDYEEVBfRLSU4clhYYqW733pu8zMVnlDhPHOzv+Wm2HybGRRM0yHR0LYIpU1631mBRzzz8ymS2WIgYxhalxanZZRPZx9DGKHDHJNla7n8ylQmSE6GOSDPsFaKgOtxrJ2dwjJnVs=
Received: from CH2PR13MB3368.namprd13.prod.outlook.com (52.132.246.90) by
 CH2PR13MB3701.namprd13.prod.outlook.com (20.180.14.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.15; Tue, 21 Jan 2020 08:53:26 +0000
Received: from CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::eccb:16ac:e897:85d5]) by CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::eccb:16ac:e897:85d5%3]) with mapi id 15.20.2665.015; Tue, 21 Jan 2020
 08:53:26 +0000
From:   Yash Shah <yash.shah@sifive.com>
To:     Marc Zyngier <maz@kernel.org>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>
CC:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
        "atish.patra@wdc.com" <atish.patra@wdc.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sachin Ghadi <sachin.ghadi@sifive.com>
Subject: RE: [PATCH v4 0/6] GPIO & Hierarchy IRQ support for HiFive Unleashed
Thread-Topic: [PATCH v4 0/6] GPIO & Hierarchy IRQ support for HiFive Unleashed
Thread-Index: AQHVr0qXIGRQgEWZxkGyu8rRJnxI3qfzhCiAgAGNCQA=
Date:   Tue, 21 Jan 2020 08:53:26 +0000
Message-ID: <CH2PR13MB33684A3DB50725FC496C26F18C0D0@CH2PR13MB3368.namprd13.prod.outlook.com>
References: <1575976274-13487-1-git-send-email-yash.shah@sifive.com>
 <8dcb52c94eb5a585f6cf052c18571805@kernel.org>
In-Reply-To: <8dcb52c94eb5a585f6cf052c18571805@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yash.shah@sifive.com; 
x-originating-ip: [114.143.65.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76388797-e791-4dcb-b766-08d79e4f60f7
x-ms-traffictypediagnostic: CH2PR13MB3701:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR13MB37019CD3E2FD4C3484B2EA2E8C0D0@CH2PR13MB3701.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:608;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(6029001)(366004)(39850400004)(396003)(376002)(346002)(136003)(199004)(189003)(316002)(52536014)(53546011)(7416002)(54906003)(33656002)(966005)(44832011)(5660300002)(6636002)(110136005)(81156014)(81166006)(6506007)(9686003)(4001150100001)(186003)(55016002)(26005)(86362001)(4326008)(19627235002)(8936002)(2906002)(7696005)(8676002)(76116006)(71200400001)(66946007)(66476007)(107886003)(64756008)(66556008)(478600001)(66446008);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR13MB3701;H:CH2PR13MB3368.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tuyo8CveiKXrpdD/Zum+WzSax1Nl38WKEeal5+603TFQ8kOnzVtmo4GtoBvBwro+sVd3xTD8zbSI3mS34I8nCPw7FC14Fr+aOACUJm9/7KWd34uJjQnvGv0q44wYlIHtD889EnsckcmTh9rgNPRNucNMBvQmin3L2jSEFMrfIh2JQmVQdL/VBsC+pmtry/gbMRFku1e/fW7UaMuRJBKaZgXk6vT61v/zI3KjueXneZn2D12xPRlFEn+B9Jl6UOG2NSkdtsZREHY7JpQKhRxZziW3YQLRQKEhWoux6Uq/faBOP0h8lMWtz/oK788d4Qd++Qcv64D8+J976HtxtHTIVO7pNbo6fKC51JE5BEJ6/JzPh6Rpm1Ai6acLbG/W1qREhtHEoAG1h7y8WGe1CQDaYObh/zewWjz1Ntvi7DU6fUNHsy/6LHgJb/z61YfXubsj/Vie4nJtx/fuZVu3wlrWywpkeUiHGhzekmb2xHeeP/v2xzyHeMVGPQY1cVJghwOcdQtxUwPjOSgahw8MJH/xXg==
x-ms-exchange-antispam-messagedata: SnSvbcTOVNSbNiAteJ9/yI8wZFKwrhXiLoE53VsE2Oy5iKuTsKAAgPL0Ri8EjiXQYFwISQ9V7apqLb2qHXpBohbiapMTLIlin8+jiweqwmv12UUh9qa3HkdPoIL12/OEBdpmqD7geMUhuU8W/tR3rQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76388797-e791-4dcb-b766-08d79e4f60f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 08:53:26.0877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dZHy2hoHi326GAmIShuecuAiI92wn9xQ7FWMhspHF40A3VI8Ns/BhbJukDYHOOhKHOL1Xf8lpOEawZ/F6aE5dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3701
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> -----Original Message-----
> From: Marc Zyngier <maz@kernel.org>
> Sent: 20 January 2020 14:40
> To: Yash Shah <yash.shah@sifive.com>
> Cc: linus.walleij@linaro.org; bgolaszewski@baylibre.com;
> robh+dt@kernel.org; mark.rutland@arm.com; palmer@dabbelt.com; Paul
> Walmsley ( Sifive) <paul.walmsley@sifive.com>; aou@eecs.berkeley.edu;
> tglx@linutronix.de; jason@lakedaemon.net; bmeng.cn@gmail.com;
> atish.patra@wdc.com; Sagar Kadam <sagar.kadam@sifive.com>; linux-
> gpio@vger.kernel.org; devicetree@vger.kernel.org; linux-
> riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Sachin Ghadi
> <sachin.ghadi@sifive.com>
> Subject: Re: [PATCH v4 0/6] GPIO & Hierarchy IRQ support for HiFive
> Unleashed
>=20
> On 2019-12-10 12:11, Yash Shah wrote:
> > This patch series adds GPIO drivers, DT documentation and DT nodes for
> > HiFive Unleashed board. The gpio patches are mostly based on Wesley's
> > patch.
> > The patchset also adds hierarchy irq domain support as it is required
> > by this gpio driver. It also includes the irqdomain patch to introduce
> > irq_domain_translate_onecell() and irq-nvic driver patch to use this
> > newly introduced function.
> >
> > This patchset is based on Linux 5.4-rc6 and tested on HiFive Unleashed
> > board
> >
> > Changes:
> > v4 vs v3:
> > - Rename the DT yaml document to more standard naming
> > (sifive,gpio.yaml)
> > - Drop "clock-names" property from yaml document
> > - Add "minItems" to "interrupts" node in yaml
> >
> > v3 vs v2:
> > - Include patch for irq-nvic driver to use
> > irq_domain_translate_onecell
> > - Remove unnecessary inclusion of header files
> > - Use a single prefix for all symbols in this driver
> > - Rename the "enabled" field of struct sifive_gpio to "irq_state"
> > - Remove unused variables and locking from probe()
> > - Other minor changes
> >
> > v2 vs v1:
> > - Add patch to introduce irq_domain_translate_onecell() and use it in
> >   the sifive PLIC driver
> > - Drop the usage of own locks, instead use internal bgpio_locks
> > - Consistently use regmap for register access throughout the gpio code
> > - Convert the GPIO DT documentation into a json schema
> > - Other minor changes based upon feedback received on v1
> >
> > v1 vs RFC:
> > Incorporated below changes as suggested by Linus Walleij on RFC
> > version of this patchset[0]
> > - Dropped PWM patches as they are already merged.
> > - Include "GPIO_GENERIC" and "REGMAP_MMIO" in Kconfig select option
> > - Remove unwanted inclusion of header files
> > - Use regmap MMIO instead of customised sifive_assign_bit()
> > - Use GPIOLIB_GENERIC and bgpio_init() to set up the accessors
> > - Use hierarchical irqdomain
> >
> > [0]
> > https://lore.kernel.org/linux-
> riscv/20181010123519.RVexDppaPFpIWl7QU_h
> > pP8tc5qqWPJgeuLYn0FaGbeQ@z/
> >
> > Yash Shah (6):
> >   genirq: introduce irq_domain_translate_onecell
> >   irqchip: nvic: Use irq_domain_translate_onecell instead of custom
> > func
> >   irqchip: sifive: Support hierarchy irq domain
> >   gpio: sifive: Add DT documentation for SiFive GPIO
> >   gpio: sifive: Add GPIO driver for SiFive SoCs
> >   riscv: dts: Add DT support for SiFive FU540 GPIO driver
>=20
> I've queued the first 5 patches. The last one should go via the correspon=
ding
> platform tree.

Thanks.
@Paul, Are you going to merge the last patch (DT support for GPIO) or you w=
ant me to rebase and send it separately?

- Yash

>=20
> Thanks,
>=20
>          M.
> --
> Jazz is not dead. It just smells funny...
