Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAFC62DB6DA
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 00:04:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730574AbgLOXDm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Dec 2020 18:03:42 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:47513 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730016AbgLOXDa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2020 18:03:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1608073409; x=1639609409;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=Z2AmIV1bin5PNwuj1s6oP+3wcAbfIpD99zu5z7FQtbU=;
  b=PRYaBNV7yJCwKBh1hU9o34oMPAkDy3h6vBmG5mfXc9L0RYsAyhjNVeN9
   ZQKmhz2rkvjq25S/tBtyadhuLcZ2I0sc2Oy3edjhP4EYUw/MdLapUpUpH
   88v5ythbDpss8Ki6YAcjwe0Q39fbSglNTkrCj2lStijuBrRQfpD7HmVFP
   R3z9lPdw5N44RjAPv3rO0W9hcW184WxriqC0GCAQQVXG7t7Ws9IwHip6r
   RXpnLK+dOIUll//38gvUdDH2OcHobW96ps2jDuAQq57ylVsmKQBLnqdbE
   UZ36PZ/1tLlnGUhWzGWinN+dJGvgpDc8v1Ar4EkpLkvNcxkv9OHDEOkuA
   w==;
IronPort-SDR: GoyxP0wrAic2DILpqPgiHknTXiXtzajlcom1BLTG8ujOYCSfwfUnjR/42RLcr6+I4M8w0o2zcd
 JCiMVaZKzehqC8UOMfclep8HvVOaW9Xpo2m+vrGufxU30LVDWYrern3ZdIVmiBo9MvYMbwZ+R6
 1Fe62mY3pNF3kXUAzLa638qfcWbNrLdei1hyh5NgpQk1ODo0TvvD7iBkniWwl/S2ChNu6MOLPC
 nXOAIq1AFn0w7ycjUq+DqODMzRK1X2cMoHj3Z09Rz57IPi4l/vW1+n0bu4bFF3OVrcp7OaxxFH
 GI4=
X-IronPort-AV: E=Sophos;i="5.78,422,1599494400"; 
   d="scan'208";a="155263542"
Received: from mail-dm6nam10lp2102.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.102])
  by ob1.hgst.iphmx.com with ESMTP; 16 Dec 2020 07:02:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jg1VPvQdKyKfS5hE0DaAnpB2HFzeJRmeLXDNBn0DaSj8STDW2hvLT8+ossuQ/PIR14hZWgDgI76wU6w3ZM60v/0cfM6xhA2W94Bna6n++4X5QbVtav2Qlao4fz1KOaVJvaYFcBetY5EDG0l+Q6jDtj5xXs+hi2SHzyli4KJVGgdhgFMEU8C+L9fp83fwJj8ODKYeFRkn5nSk4MJFKN4koVroJKvZHCMZzfi44HZk/HcbBEgZtM8JU/BVbSMFTm3+P+u2Jr9MemJdeku6PX+6xxtskpvsULXkJFg5dPArUF0b2wV4wlip9AuTneFsR6OH9HaWLFO8kgMn4y7HYKGnmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcqym9b5yMe50qvF4GaplURAgrkNSenYbzrUYb77j+E=;
 b=aeem8iLPV+QNfs/BMUllvuHJybpFZCidpqC1HO2xYhnDPRq4xmxAPCSZD5QATogvOJOlZ9S8AXIzUk/FS4I/HQOeq9KvH3xjX37ez3YuIRdCD81BlK6lcGLfBrfghiK9v5pWumeowlibN89wqbmHpIXoeuNWMunY5H+fhIZ/5GN8AT2nAXNwbSK7SpDFfJtYLHWjNl+oy9YYx1e3ncfgmfKeda+cru96afYGIzKeEcKlcXYgrPrdsxmYKOLIy2CmRVswlJ9g1jYJmK+LTYrIiHMc0nrLp9pijRBoYjnhCwOLP3MvBVVYI8++oyWn5oAGII1CSKolPI1MPCIX6bOoZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcqym9b5yMe50qvF4GaplURAgrkNSenYbzrUYb77j+E=;
 b=NSCn2fj+tEcsqM7u6Mntki+n7qHDWnXivSU8uO+vqYmFO1+VlLnSNXt6dPGP8tCfBwIXnqZt9f3w4X+RIA1jBme9vXDRMGo216TY5BOMvCzHtps0Vcl0wEuFKG+XDkd8Qu6yHrUt4rktjwG/KObuEk+NSOhzqKPA7Gvgem24XVs=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6902.namprd04.prod.outlook.com (2603:10b6:610:a3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Tue, 15 Dec
 2020 23:02:21 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%6]) with mapi id 15.20.3654.026; Tue, 15 Dec 2020
 23:02:21 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH v10 00/23] RISC-V Kendryte K210 support improvements
Thread-Topic: [PATCH v10 00/23] RISC-V Kendryte K210 support improvements
Thread-Index: AQHW0VcBx/1WqOKLiUuqE6/7D5Ba7g==
Date:   Tue, 15 Dec 2020 23:02:20 +0000
Message-ID: <CH2PR04MB65220A2CDD6F186F1DB53D3AE7C60@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:f0b5:b4fe:45e3:5658]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5be3c3b1-e915-4cd9-87a1-08d8a14d7a5e
x-ms-traffictypediagnostic: CH2PR04MB6902:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR04MB69024F2D0D4D0DC2B063A74CE7C60@CH2PR04MB6902.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YIPFrmC/kYmCYkENJUYkQa1U8ufquettU69kp1G/DR17NZk+UIjzaqbcunvc/rQY/qmBPA3AwhLe/zRYaDsfJTfN50tHqP82UFQUjFFFY6/ijN0HYOaDZKWATlLinGkeVU0XNPo352PTDCTer6244N0dZ/x03TTHlaxv0I6rv8V0LQGvW2RDotaD4in4Fb7Eg3Ci8NL0qtEfPZNub5yMmQNu7TSdWbc4WIb8RZPMNoojjpj1uYcUCpLmIC0CsW1RdPFB1zrvkQL29ji71Y8wtdvz4K8xZHzbC00WPLu8NUWCuUofKWj3vyK7tIv5Q8V4iQJcwTDTGWtBHUr8lQSTmmN9LydI6uut0aotVpYeY/cCB+vyIQZcm1WJxUyualqMeCSNXSg6wDvZyv+Zi+H/zw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR04MB6522.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(316002)(66446008)(8676002)(55016002)(83380400001)(2906002)(4326008)(30864003)(5660300002)(86362001)(478600001)(71200400001)(53546011)(8936002)(52536014)(6506007)(7416002)(7696005)(91956017)(9686003)(186003)(66556008)(64756008)(33656002)(66946007)(966005)(110136005)(66476007)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?0CNqvw5BM05PpFmqHxPlOPnXs4K8aw0ivPKiWpJT1qEqxnvmVcYR0tEVCSPv?=
 =?us-ascii?Q?VCVGUixIy5ldK3R+Ev2N2lVXDEe9gyjvorwE2eB7BktQtM8mFHc+0LCmfHNt?=
 =?us-ascii?Q?6umz8fvNDrjEFj84bCuH3QU5hi6wyvzhTlHGtogY15z0wvTfst9TaPaU3kfz?=
 =?us-ascii?Q?mpHb0WHgvgJDelAUnh2MV2xvwGVoRq6V2NC8P44hjNEu3kCdj3ytMoXkANCv?=
 =?us-ascii?Q?8cqdOiRFaIujdQY9C4t2pAzTdMRbjX6XH3k3jk2u8YhSHHStpfI3/hUWL7p+?=
 =?us-ascii?Q?jrjt/5+4KSyGfQu2EaT4BbhDlOk8rWD80Ben5O0E8K82JTnkIn04idAQLxnf?=
 =?us-ascii?Q?W6DLBCn6ABvAMk2jobucqn3MaVNlb4Zq+9ic0R2i2uDRontdvfQBb4GEJf4h?=
 =?us-ascii?Q?FkgxzsKmI8rs0zY8ECbyrkOQc5Ew0HlS5iasBtsYQK9hiULXt2WYO+xF+FMV?=
 =?us-ascii?Q?GG2YKNaTuTdI4JJ0xVzWLp98B5pStgfpj9ABSXIdjqOKL7v6EMIkaICYAcLg?=
 =?us-ascii?Q?WhOXIzLXRWB/FdIvXppbKgYOsjPR0AE6ow7xWpJHim1dl9c+xDxqWZyWfH2V?=
 =?us-ascii?Q?T1Iam6ftLQLewnw9LLvFr8qjl4dPuGnoXnmNOO0LWKN2r9I3vT/ezb1GPk2s?=
 =?us-ascii?Q?9tSrPg9p4HvMggAJEISTTYC+/YZhp2YL2ffB0iu4NY4nAp+yTKUJSY+ATetK?=
 =?us-ascii?Q?hoxVp2jUUnYzb7eNwdjxGvS0uiIMK/mcX9Ij4+/gmbjKDdxW2Cp/7f25g+eF?=
 =?us-ascii?Q?ajcCHATcfdbyzoAk8JhqCBJytnt+RQy/9EryG6vzR8XzEd7AQP7pDQ9Q9m35?=
 =?us-ascii?Q?6kj+bMmxsx7zRV790qTmlQ/h9ZtNAF5ctHJT2iScCoW2nnASlb78Ccy7RdOG?=
 =?us-ascii?Q?hfpRWGDYjiB9hOgTsufXl++Ed1b2WBiXlcL9F7pGrLrLh3rd7wcGp91WWhdm?=
 =?us-ascii?Q?AbVvltGYQtJHSn1U9WMLrW2HYtpCAKfgyfQiCRm30SHSJZwoo+ru1u4OYOLZ?=
 =?us-ascii?Q?OCFdVM3lCxwdXzV3a3nwfL+YaisX1qOzlVjZu8ruiAzo9qaOm3En6AXlMw7Z?=
 =?us-ascii?Q?3fP8Vbad?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be3c3b1-e915-4cd9-87a1-08d8a14d7a5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2020 23:02:20.9498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GUCNsvJ3pDmYZExyRa1IReu29Ix5dr+pH/y/IEFE64AIy+q7jpXpkHXW/bsoXpndoVXz9CuPdQJPFKjvWH7seg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6902
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020/12/13 22:51, Damien Le Moal wrote:=0A=
> This series of patches improves support for boards based on the Canaan=0A=
> Kendryte K210 RISC-V dual core SoC. Minimal support for this SoC is=0A=
> already included in the kernel. These patches complete it, enabling=0A=
> support for most peripherals present on the SoC as well as introducing=0A=
> device trees for the various K210 boards available on the market today=0A=
> from SiPeed and Kendryte.=0A=
=0A=
Palmer,=0A=
=0A=
Ping ?=0A=
What is ypour plan for this series ? Can you queue it for 5.11 ?=0A=
=0A=
=0A=
> =0A=
> Pathes 1 to 4 are various fixes for riscv arch code and riscv=0A=
> dependent devices. Of note here is patch 3 which fix system calls=0A=
> execution in the no MMU case, and patch 4 which simplifies DTB builtin=0A=
> handling.=0A=
> =0A=
> Patch 5 fixes naming of directories and configuration options to use the=
=0A=
> K210 SoC vendor name (Canaan) instead of its branding name (Kendryte).=0A=
> =0A=
> Patch 6 is a preparatory patch cleaning up the K210 system controller=0A=
> driver to facilitate introducing the SoC clock driver.=0A=
> =0A=
> The following patches 7 to 11 document device tree bindings for the SoC=
=0A=
> drivers. The implementation of these drivers is provided in patches 12,=
=0A=
> 13 and 14, respectively implementing the SoC clock driver, reset=0A=
> controller and SOC pin function control.=0A=
> =0A=
> Patches 15 to 20 update the existing K210 device tree and add new=0A=
> device tree files for several K210 based boards: MAIX Bit, MAIXDUINO,=0A=
> MAIX Dock and MAIX Go boards from SiPeed and the KD233 development=0A=
> board from Canaan.=0A=
> =0A=
> Finally the last two patches updates the k210 nommu defconfig to include=
=0A=
> the newly implemented drivers and provide a new default configuration=0A=
> file enabling SD card support.=0A=
> =0A=
> A lot of the work on the device tree and on the K210 drivers come from=0A=
> the work by Sean Anderson for the U-Boot project support of the K210=0A=
> SoC. Sean also helped with debugging many aspects of this series.=0A=
> =0A=
> A tree with all patches applied is available here:=0A=
> https://github.com/damien-lemoal/linux, k210-sysctl-v22 branch.=0A=
> A demonstration of this series used on a SiPeed MAIX Dock=0A=
> board together with an I2C servo controller can be seen here:=0A=
> https://damien-lemoal.github.io/linux-robot-arm/#example=0A=
> =0A=
> This tree was used to build userspace busybox environment image that is=
=0A=
> then copied onto an SD card formatted with ext2:=0A=
> https://github.com/damien-lemoal/buildroot=0A=
> Of note is that running this userspace environment requires a revert of=
=0A=
> commit 2217b982624680d19a80ebb4600d05c8586c4f96 introduced during the=0A=
> 5.9 development cycle. Without this revert, execution of the init=0A=
> process fails. A problem with the riscv port of elf2flt is suspected but=
=0A=
> not confirmed. I am now starting to investigate this problem.=0A=
> =0A=
> Reviews and comments are as always much welcome.=0A=
> =0A=
> Changes from v9:=0A=
> * Added patch 6 to avoid DTS compilation errors after patch 9 is=0A=
>   applied and until patch 16 is applied.=0A=
> =0A=
> Changes from v8:=0A=
> * Addressed Rob's comments on the sysctl driver bindings documentation=0A=
> * Fixed a typo in the fpios driver bindings documentation=0A=
> =0A=
> Changes from v7:=0A=
> * Removed the __init annotation for the drivers reset, pinctrl and=0A=
>   sysctl drivers probe functions as suggested by Geert. Also removed=0A=
>   the __refdata annotation for the struct platform_driver variables of=0A=
>   these drivers.=0A=
> =0A=
> Changes from v6:=0A=
> * Annotate struct platform_driver variables with __refdata to avoid=0A=
>   section mismatch compilation errors=0A=
> * Add empty sentinel entry to of_device_id tables of the sysctl, reset=0A=
>   and pinctrl drivers.=0A=
> =0A=
> Changes from v5:=0A=
> * Addressed Philipp's comment on the reset controller driver=0A=
> * Added patch 6 to reduce the size of the clock driver patch=0A=
>   (now patch 12).=0A=
> =0A=
> Changes from v4:=0A=
> * Simplified reset controller driver using of_xlate callback as=0A=
>   suggested by Philipp=0A=
> * Fixed compilation error when using other configs than one of the=0A=
>   nommu_k210 defconfigs.=0A=
> * Addressed most clock driver comments from Stephen.=0A=
> * Removed CONFIG_GPIO_SYSFS from defconfigs=0A=
> * Rebased on 5.10-rc7=0A=
> =0A=
> Changes from V3:=0A=
> * Add one entry per driver in MAINTAINERS file=0A=
> =0A=
> Changes from V2:=0A=
> * Add MAINTAINERS file entry for the SoC support, listing myself as=0A=
>   maintainer.=0A=
> * Removed use of postcore_initcall() for declaring the drivers, using=0A=
>   the regular builtin_platform_driver() instead.=0A=
> * Fixed fpio pinctrl driver bindings documentation as commented by=0A=
>   Geert: removed input-schmitt and added input-schmitt-disable, fixed=0A=
>   typo and added input-disable and output-disable.=0A=
> * Fixed device tree to have cs-gpios active low, as per the default, as=
=0A=
>   active high necessity was an artifact of the gpio level double=0A=
>   inversion bug fixed recently.=0A=
> * Removed CONFIG_VT from defconfigs to reduce the kernel image size as=0A=
>   suggested by Geert.=0A=
> =0A=
> Changes from v1:=0A=
> * Improved DT bindings documentation=0A=
> * SPI and GPIO patches removed from this series (and being processed=0A=
>   directly through the relevant subsystems directly)=0A=
> * Improved device trees=0A=
> * Various cleanup and improvments of the drivers=0A=
> =0A=
> Damien Le Moal (22):=0A=
>   riscv: Fix kernel time_init()=0A=
>   riscv: Fix sifive serial driver=0A=
>   riscv: Enable interrupts during syscalls with M-Mode=0A=
>   riscv: Fix builtin DTB handling=0A=
>   riscv: Use vendor name for K210 SoC support=0A=
>   riscv: cleanup Canaan Kendryte K210 sysctl driver=0A=
>   dt-bindings: Add Canaan vendor prefix=0A=
>   dt-binding: clock: Document canaan,k210-clk bindings=0A=
>   dt-bindings: reset: Document canaan,k210-rst bindings=0A=
>   dt-bindings: pinctrl: Document canaan,k210-fpioa bindings=0A=
>   dt-binding: mfd: Document canaan,k210-sysctl bindings=0A=
>   riscv: Add Canaan Kendryte K210 clock driver=0A=
>   riscv: Add Canaan Kendryte K210 reset controller=0A=
>   riscv: Add Canaan Kendryte K210 FPIOA driver=0A=
>   riscv: Update Canaan Kendryte K210 device tree=0A=
>   riscv: Add SiPeed MAIX BiT board device tree=0A=
>   riscv: Add SiPeed MAIX DOCK board device tree=0A=
>   riscv: Add SiPeed MAIX GO board device tree=0A=
>   riscv: Add SiPeed MAIXDUINO board device tree=0A=
>   riscv: Add Kendryte KD233 board device tree=0A=
>   riscv: Update Canaan Kendryte K210 defconfig=0A=
>   riscv: Add Canaan Kendryte K210 SD card defconfig=0A=
> =0A=
> Damien Le Moal (23):=0A=
>   riscv: Fix kernel time_init()=0A=
>   riscv: Fix sifive serial driver=0A=
>   riscv: Enable interrupts during syscalls with M-Mode=0A=
>   riscv: Fix builtin DTB handling=0A=
>   riscv: Use vendor name for K210 SoC support=0A=
>   riscv: Fix Canaan Kendryte K210 device tree=0A=
>   riscv: cleanup Canaan Kendryte K210 sysctl driver=0A=
>   dt-bindings: Add Canaan vendor prefix=0A=
>   dt-binding: clock: Document canaan,k210-clk bindings=0A=
>   dt-bindings: reset: Document canaan,k210-rst bindings=0A=
>   dt-bindings: pinctrl: Document canaan,k210-fpioa bindings=0A=
>   dt-binding: mfd: Document canaan,k210-sysctl bindings=0A=
>   riscv: Add Canaan Kendryte K210 clock driver=0A=
>   riscv: Add Canaan Kendryte K210 reset controller=0A=
>   riscv: Add Canaan Kendryte K210 FPIOA driver=0A=
>   riscv: Update Canaan Kendryte K210 device tree=0A=
>   riscv: Add SiPeed MAIX BiT board device tree=0A=
>   riscv: Add SiPeed MAIX DOCK board device tree=0A=
>   riscv: Add SiPeed MAIX GO board device tree=0A=
>   riscv: Add SiPeed MAIXDUINO board device tree=0A=
>   riscv: Add Kendryte KD233 board device tree=0A=
>   riscv: Update Canaan Kendryte K210 defconfig=0A=
>   riscv: Add Canaan Kendryte K210 SD card defconfig=0A=
> =0A=
>  .../bindings/clock/canaan,k210-clk.yaml       |   54 +=0A=
>  .../bindings/mfd/canaan,k210-sysctl.yaml      |  109 ++=0A=
>  .../bindings/pinctrl/canaan,k210-fpioa.yaml   |  171 +++=0A=
>  .../bindings/reset/canaan,k210-rst.yaml       |   40 +=0A=
>  .../devicetree/bindings/vendor-prefixes.yaml  |    2 +=0A=
>  MAINTAINERS                                   |   23 +=0A=
>  arch/riscv/Kconfig.socs                       |   33 +-=0A=
>  arch/riscv/Makefile                           |    2 +-=0A=
>  arch/riscv/boot/dts/Makefile                  |    2 +-=0A=
>  arch/riscv/boot/dts/canaan/Makefile           |    5 +=0A=
>  arch/riscv/boot/dts/canaan/k210.dtsi          |  621 ++++++++++=0A=
>  arch/riscv/boot/dts/canaan/k210_generic.dts   |   46 +=0A=
>  arch/riscv/boot/dts/canaan/k210_kd233.dts     |  178 +++=0A=
>  arch/riscv/boot/dts/canaan/k210_maix_bit.dts  |  227 ++++=0A=
>  arch/riscv/boot/dts/canaan/k210_maix_dock.dts |  229 ++++=0A=
>  arch/riscv/boot/dts/canaan/k210_maix_go.dts   |  237 ++++=0A=
>  arch/riscv/boot/dts/canaan/k210_maixduino.dts |  201 ++++=0A=
>  arch/riscv/boot/dts/kendryte/Makefile         |    4 -=0A=
>  arch/riscv/boot/dts/kendryte/k210.dts         |   23 -=0A=
>  arch/riscv/boot/dts/kendryte/k210.dtsi        |  125 --=0A=
>  arch/riscv/configs/nommu_k210_defconfig       |   39 +-=0A=
>  .../riscv/configs/nommu_k210_sdcard_defconfig |   93 ++=0A=
>  arch/riscv/include/asm/soc.h                  |   38 -=0A=
>  arch/riscv/kernel/entry.S                     |    9 +=0A=
>  arch/riscv/kernel/soc.c                       |   27 -=0A=
>  arch/riscv/kernel/time.c                      |    3 +=0A=
>  arch/riscv/mm/init.c                          |    6 +-=0A=
>  drivers/clk/Kconfig                           |    8 +=0A=
>  drivers/clk/Makefile                          |    1 +=0A=
>  drivers/clk/clk-k210.c                        | 1005 +++++++++++++++++=
=0A=
>  drivers/pinctrl/Kconfig                       |   13 +=0A=
>  drivers/pinctrl/Makefile                      |    1 +=0A=
>  drivers/pinctrl/pinctrl-k210.c                |  985 ++++++++++++++++=0A=
>  drivers/reset/Kconfig                         |   10 +=0A=
>  drivers/reset/Makefile                        |    1 +=0A=
>  drivers/reset/reset-k210.c                    |  131 +++=0A=
>  drivers/soc/Kconfig                           |    2 +-=0A=
>  drivers/soc/Makefile                          |    2 +-=0A=
>  drivers/soc/canaan/Kconfig                    |   12 +=0A=
>  drivers/soc/canaan/Makefile                   |    3 +=0A=
>  drivers/soc/canaan/k210-sysctl.c              |   78 ++=0A=
>  drivers/soc/kendryte/Kconfig                  |   14 -=0A=
>  drivers/soc/kendryte/Makefile                 |    3 -=0A=
>  drivers/soc/kendryte/k210-sysctl.c            |  260 -----=0A=
>  drivers/tty/serial/sifive.c                   |    1 +=0A=
>  include/dt-bindings/clock/k210-clk.h          |   55 +-=0A=
>  include/dt-bindings/pinctrl/k210-fpioa.h      |  276 +++++=0A=
>  include/dt-bindings/reset/k210-rst.h          |   42 +=0A=
>  include/soc/canaan/k210-sysctl.h              |   43 +=0A=
>  49 files changed, 4962 insertions(+), 531 deletions(-)=0A=
>  create mode 100644 Documentation/devicetree/bindings/clock/canaan,k210-c=
lk.yaml=0A=
>  create mode 100644 Documentation/devicetree/bindings/mfd/canaan,k210-sys=
ctl.yaml=0A=
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/canaan,k210=
-fpioa.yaml=0A=
>  create mode 100644 Documentation/devicetree/bindings/reset/canaan,k210-r=
st.yaml=0A=
>  create mode 100644 arch/riscv/boot/dts/canaan/Makefile=0A=
>  create mode 100644 arch/riscv/boot/dts/canaan/k210.dtsi=0A=
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_generic.dts=0A=
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_kd233.dts=0A=
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_maix_bit.dts=0A=
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_maix_dock.dts=0A=
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_maix_go.dts=0A=
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_maixduino.dts=0A=
>  delete mode 100644 arch/riscv/boot/dts/kendryte/Makefile=0A=
>  delete mode 100644 arch/riscv/boot/dts/kendryte/k210.dts=0A=
>  delete mode 100644 arch/riscv/boot/dts/kendryte/k210.dtsi=0A=
>  create mode 100644 arch/riscv/configs/nommu_k210_sdcard_defconfig=0A=
>  create mode 100644 drivers/clk/clk-k210.c=0A=
>  create mode 100644 drivers/pinctrl/pinctrl-k210.c=0A=
>  create mode 100644 drivers/reset/reset-k210.c=0A=
>  create mode 100644 drivers/soc/canaan/Kconfig=0A=
>  create mode 100644 drivers/soc/canaan/Makefile=0A=
>  create mode 100644 drivers/soc/canaan/k210-sysctl.c=0A=
>  delete mode 100644 drivers/soc/kendryte/Kconfig=0A=
>  delete mode 100644 drivers/soc/kendryte/Makefile=0A=
>  delete mode 100644 drivers/soc/kendryte/k210-sysctl.c=0A=
>  create mode 100644 include/dt-bindings/pinctrl/k210-fpioa.h=0A=
>  create mode 100644 include/dt-bindings/reset/k210-rst.h=0A=
>  create mode 100644 include/soc/canaan/k210-sysctl.h=0A=
> =0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
