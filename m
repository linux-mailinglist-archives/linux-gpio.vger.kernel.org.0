Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2CB62F2545
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jan 2021 02:18:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731454AbhALBIp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 20:08:45 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:32849 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731459AbhALBIp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 20:08:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1610414460; x=1641950460;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=g4DY/f4bAaHbSwR3imj3xvIgHAl4vMLVMk3x/d6Iodo=;
  b=fSbGVPr+KqdUFA2INmZgZd2rqd1Q5ChOUr4vRLJSe9SRXGPLwr+Yc9JG
   LgxWuaSId5qfO1FQvwRKm/qj7eSn5zC1C8penmsWDGRMtm0tUwJT8otNc
   f52tHMc37EdATXm4Y0LQSvgWEWnVPNeegVkn0Oso7iSjX42E2c5cVSqOu
   tnrKR2Pt9Pmt3aHvVGRaj/bmeztyJjHRHBmcjNJJuGlrWidthd5X0f8ws
   eg55uv+oMb6ThHS++S/Xnq6u3wJxx4xqPR41RamqWt5G8nTlkbZKhdYdS
   FPKD/Z+gfcZ5D9sxNiEbyJxN6pm9hURPdd+brqRj5EdPIyGh/tNNprbUE
   A==;
IronPort-SDR: 4ZGsue3tJEKeljAjXIR/FUmiJBwi5HoCHh4NuwUp4XkTD0CHRLUBJIOLqo0Zlmk9MkM4vyxmVu
 yCyg3ZcNj3aDJcUylCF5yzrefYPvxIPsoGaffNkw402Tgc0rmiXrf2q2o8cwUiIhDMwTL1ARXT
 uLOFkBBSguen3fm0gZTFUmNE+MosCG5XPqmEhHyNLsfq7x9a3HWBK77VUNCsr2ZxxZ08byzcgk
 hQr1A2XMo/5rdAzVk8Tmom6GtCOD3Kl4GEofcHfxHsFOAyuFIBY9Lw69s3Ag7PkxkNqjISRDTa
 4mA=
X-IronPort-AV: E=Sophos;i="5.79,340,1602518400"; 
   d="scan'208";a="261085984"
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
  by ob1.hgst.iphmx.com with ESMTP; 12 Jan 2021 09:19:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dj2ThM/K5tksIRazraQMT670b7WQLa3S0kXJgahZY8iYVfOgxswj0zJoipAMNUZfpwJyIk+0WzMA9yI6LCzzzz//q9Y1uWQ61J8Z5SgPv2nYsgC7htjPHQky5+SWXkGlpq2ccQIT9j/yCtCGAm058QfnoEye0y6rrP6WPVI/MyEW22dw9pRNTva8v938P2Hv5KkxjzSkCjBSkKNTE6Rc/ltQMVFw/PP277wY9+xc3vQhYMD/eFfBxRIS/nG9OGPiDBBLfpihDLMXvKYdWdou9/EwipORh6KTjfEN61guUcA7f+YleXy/d1VBo8tHHrsdeLhfQCYO+4Webp+93SR2hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8wTOo/BEO1SmiI3pAUoYCi5B1IHqwgP8WblquMoIhM=;
 b=Yu7/5dP16Cgyz7mHdxMd04otmtzdpQyFOXorLYdzbRSgUNiRkbH2XSUfAPfvq5a6T3/7dNgd9PPT9ACbSGVSwb1dPev7WzLUr/XglAmQZWUXjbxmu1yECcyUTnhYZ7JojzHdbv3M9m2zWL7qz0z1kqc1niDSuGazCTCZGlQflxokXyIVu32IsvixWuGVeYGaJjIfiEORJVuJ3oINRgGcEutCqgkH3MUtRckaEjyHF+W7SFWxthSm2Br8rFm8hUXgmhc1DavSfXzLNBbSXj2wSuFZxKTRTa1QLmyILuK2KyPi/QlvAP3vnytquyOfzzOEK7aH4Il1mUWFeesA+76tcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8wTOo/BEO1SmiI3pAUoYCi5B1IHqwgP8WblquMoIhM=;
 b=jh1x1J+8AXwmad8JLeLB3zL8nQw5KTkjO6ZyESnOU62mk1kpVrQ/Z3Cf8aeL9Ipx25AQM0Hso3E7YGITdp3PTwe3hrdZLMI0PvfCLAAWAUNaXp7he4hTEujxR9HVtgmrM/BI8du9nr4BwtIJAgisZDXQ2YlbdkfcTPuuFllNXE8=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4641.namprd04.prod.outlook.com (2603:10b6:208:26::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.7; Tue, 12 Jan
 2021 01:07:34 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::2dbb:7e01:f076:eca0]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::2dbb:7e01:f076:eca0%9]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 01:07:34 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
CC:     Sean Anderson <seanga2@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v11 00/10] RISC-V Kendryte K210 support improvements
Thread-Topic: [PATCH v11 00/10] RISC-V Kendryte K210 support improvements
Thread-Index: AQHW6H4YA3l8oMWx7kmMNP0/pgzYLQ==
Date:   Tue, 12 Jan 2021 01:07:34 +0000
Message-ID: <BL0PR04MB65148451DF93AB82F79BB320E7AA0@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210112005848.199951-1-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:5cb8:2b48:5f8c:2c03]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 59f2eac0-cbab-48c7-9550-08d8b6967203
x-ms-traffictypediagnostic: BL0PR04MB4641:
x-microsoft-antispam-prvs: <BL0PR04MB46412041155B26B88BE02942E7AA0@BL0PR04MB4641.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gOeod7CJ3VcmvcZYeK7k2y4SuKd5P0+hkSBM7SNCOuGgpAeJ/667wbUexTKjE4g+zlPCYeIkFQ7m3ffMGHyNXZ7ayoJb+rZSGLAmhqtQYsrvJpNm7jQqk5+QyZYy192Ubv57edCsbYY9vUXUV61ZTkrfKJdXjD+58GD6h41XBAcBsByBauUk2GFxlMbkmB0HXm8XCZ95brYSigZxikpFVJEX/Zz8XWZTzgFFc4LeJIRlyKPD+V4CaYdQI2ctFot7a07hSxzWjE/+7TbIcXrkOWq6kNChGcIf8ta5MuyfpuWpc5CtbLWc197p1sDFAviaZQDkYreQF8MadljT8iXYg7+Mi7E0+ZboMNNRJoRXYsgBjNbG470fBKNb3ABW4atycyP3iswUphfeQEJii+Na4wo1V3YGLNkVgfnqQd3NrNKCsEmwvCXQIm+F7qpQtfXQr3VXXPx/MaRs++C1L51Olw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR04MB6514.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(366004)(376002)(346002)(186003)(71200400001)(33656002)(86362001)(83380400001)(6506007)(66556008)(53546011)(76116006)(66446008)(52536014)(4326008)(5660300002)(91956017)(66946007)(55016002)(7696005)(66476007)(8936002)(54906003)(110136005)(316002)(966005)(478600001)(9686003)(2906002)(8676002)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Bh2ZPUKccppBgvG0RblZj5RueX+NNQmbYO2/G7ck6OO8J+vGEn8BxJ7rrFoG?=
 =?us-ascii?Q?GAxwxp/DTxSfTz0iycOKcFHm9n/lcmcEpjYuW9p5qxQ0fita96ppneEANOwT?=
 =?us-ascii?Q?ueBxOm80Yq0/m6p8QAYdaJheK6oXdfKapgoTY0+Bnsz8jdTzAdaPOKteyiqf?=
 =?us-ascii?Q?WH6XfnLqPndbU7m9wq6jGzqi4kMhBHRUr95sIPb94BhCl02MWzkq7H5U//J/?=
 =?us-ascii?Q?A6XLdBPZwDGDopoNxXqjyb0hxtbG7ogcbcACurf8EHRGt2RF/7VLgz3FPj/E?=
 =?us-ascii?Q?3IrGxxMeR5g49Ko+Isnt0duMHTWtjjJu7i8eAUtoShKhpxrsIQa5nzSmAtNe?=
 =?us-ascii?Q?e3bO1/K1IQL21oJqftEK76EztseepMH1Uq/R1CEWQdYYiebD4QuhKTi7avhi?=
 =?us-ascii?Q?nXw+rH6RHvd1epTRfMOcp6rh8ApBQoKDI7vr84U1+AYhxcyuXfu128RPVFEh?=
 =?us-ascii?Q?ZtR6yL18tAf4oZPGtBsmmfDDCF2pkphliddJl/+iXzadhKZMA3ndxTHKisLf?=
 =?us-ascii?Q?eXivkHKI5TDnFB6HvtZ5kyJp1IR+HnJ/G1v5H+BBzRtvFuNgolb0wVBfc+v4?=
 =?us-ascii?Q?cUzG6iXu1H6/gi5qkbyN5hsjsnmAaBVBqNGz+HvSu/zKQjtBGg/U0/zAujr+?=
 =?us-ascii?Q?EQGJELfaCsSsOFEAPlFeqZ+C3H0envXte0eRRNhe2bEoRf/Gh5UJZOkj2t+L?=
 =?us-ascii?Q?qbZNCdKoh6s99cnH2GbNggbv2jqMAycHeSUYhqPWXLHZ/tWE+wCVZNuwVI0N?=
 =?us-ascii?Q?2VZCweXhDW6trEI//ZDi5S+t2LPY9Jqd59XZSaSwFZZbFRc4gU2Z4HIgRKqi?=
 =?us-ascii?Q?vK7F3IKKxMWNu7T5LhDl8pMq65FTJbFcSDFxPG56ZY98CdtXTXtYdCNi2nlB?=
 =?us-ascii?Q?NUB9SRoa1iJA3BFVsgYMn7be+Wh04guExGhTtD7udbB+VMP7AH8E04VGIROU?=
 =?us-ascii?Q?29I9RNNabnr4opUdYbe7u/HnQloOGBzkzfKv/6TT+3tCXxPkVKKZp8/zE3ZM?=
 =?us-ascii?Q?wHZ5ZzhUzxWdKUO1r0MG+H5f5Lk0TeN+caQ0BHOyhEah0gF9En90h1k23vaG?=
 =?us-ascii?Q?LrU7ec+V?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f2eac0-cbab-48c7-9550-08d8b6967203
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 01:07:34.5798
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IPQ4HUgReltF8TODZM1I7sF1H/ZXO0CW3AuqwRGlEsrNyMEbk+830UAXSqcDJosHLVCKmp4i/kxDu+/iS/SX1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4641
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2021/01/12 9:58, Damien Le Moal wrote:=0A=
> This series of patches improves support for boards based on the Canaan=0A=
> Kendryte K210 RISC-V dual core SoC. Minimal support for this SoC is=0A=
> already included in the kernel. These patches complete it, enabling=0A=
> support for most peripherals present on the SoC as well as introducing=0A=
> device trees for the various K210 boards available on the market today=0A=
> from SiPeed and Kendryte.=0A=
> =0A=
> The patches here are the remaining patches of the series not applied=0A=
> yet. Patch 1 adds the SoC clock driver and patch 2 adds the pinctrl=0A=
> driver.=0A=
=0A=
I screwed up with my git-send-email setup and patch 1 and 2 went only to Pa=
lmer=0A=
and the riscv list. I resent these eparately to Stephen/linux-clk and=0A=
Linus/linux-gpio respectively (suppress-cc and other related cc&to control=
=0A=
options interactions are a bit obscure to me...).=0A=
=0A=
My apologies for the mess. Please let me know if I should resend correctly =
the=0A=
entire series.=0A=
=0A=
> =0A=
> Patches 3 to 8 update the existing K210 device tree and add new=0A=
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
> https://github.com/damien-lemoal/linux, k210-sysctl-v24 branch.=0A=
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
> Changes from v10:=0A=
> * Rebased on riscv tree fixes+for-next branches. Patches already applied=
=0A=
>   to these branches were removed from this series.=0A=
> * Fixed the clock driver and pinctrl driver patch titles to indicate the=
=0A=
>   correct target sub-components.=0A=
> * Applied reviewed-by tags from Anup.=0A=
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
> Damien Le Moal (10):=0A=
>   clk: Add RISC-V Canaan Kendryte K210 clock driver=0A=
>   pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver=0A=
>   riscv: Update Canaan Kendryte K210 device tree=0A=
>   riscv: Add SiPeed MAIX BiT board device tree=0A=
>   riscv: Add SiPeed MAIX DOCK board device tree=0A=
>   riscv: Add SiPeed MAIX GO board device tree=0A=
>   riscv: Add SiPeed MAIXDUINO board device tree=0A=
>   riscv: Add Kendryte KD233 board device tree=0A=
>   riscv: Update Canaan Kendryte K210 defconfig=0A=
>   riscv: Add Canaan Kendryte K210 SD card defconfig=0A=
> =0A=
>  MAINTAINERS                                   |    8 +=0A=
>  arch/riscv/Kconfig.socs                       |    3 +-=0A=
>  arch/riscv/boot/dts/canaan/canaan_kd233.dts   |  178 +++=0A=
>  arch/riscv/boot/dts/canaan/k210.dts           |   23 -=0A=
>  arch/riscv/boot/dts/canaan/k210.dtsi          |  551 ++++++++-=0A=
>  arch/riscv/boot/dts/canaan/k210_generic.dts   |   46 +=0A=
>  .../riscv/boot/dts/canaan/sipeed_maix_bit.dts |  227 ++++=0A=
>  .../boot/dts/canaan/sipeed_maix_dock.dts      |  229 ++++=0A=
>  arch/riscv/boot/dts/canaan/sipeed_maix_go.dts |  237 ++++=0A=
>  .../boot/dts/canaan/sipeed_maixduino.dts      |  201 ++++=0A=
>  arch/riscv/configs/nommu_k210_defconfig       |   44 +-=0A=
>  .../riscv/configs/nommu_k210_sdcard_defconfig |   92 ++=0A=
>  drivers/clk/Kconfig                           |    8 +=0A=
>  drivers/clk/Makefile                          |    1 +=0A=
>  drivers/clk/clk-k210.c                        | 1005 +++++++++++++++++=
=0A=
>  drivers/pinctrl/Kconfig                       |   13 +=0A=
>  drivers/pinctrl/Makefile                      |    1 +=0A=
>  drivers/pinctrl/pinctrl-k210.c                |  985 ++++++++++++++++=0A=
>  drivers/soc/canaan/Kconfig                    |   18 +-=0A=
>  drivers/soc/canaan/Makefile                   |    2 +-=0A=
>  drivers/soc/canaan/k210-sysctl.c              |  205 +---=0A=
>  include/dt-bindings/clock/k210-clk.h          |    1 -=0A=
>  include/soc/canaan/k210-sysctl.h              |    2 +=0A=
>  23 files changed, 3844 insertions(+), 236 deletions(-)=0A=
>  create mode 100644 arch/riscv/boot/dts/canaan/canaan_kd233.dts=0A=
>  delete mode 100644 arch/riscv/boot/dts/canaan/k210.dts=0A=
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_generic.dts=0A=
>  create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts=0A=
>  create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts=0A=
>  create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts=0A=
>  create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maixduino.dts=0A=
>  create mode 100644 arch/riscv/configs/nommu_k210_sdcard_defconfig=0A=
>  create mode 100644 drivers/clk/clk-k210.c=0A=
>  create mode 100644 drivers/pinctrl/pinctrl-k210.c=0A=
> =0A=
> Cc: Stephen Boyd <sboyd@kernel.org>=0A=
> Cc: Michael Turquette <mturquette@baylibre.com>=0A=
> Cc: linux-clk@vger.kernel.org=0A=
> Cc: Linus Walleij <linus.walleij@linaro.org>=0A=
> Cc: linux-gpio@vger.kernel.org=0A=
> =0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
