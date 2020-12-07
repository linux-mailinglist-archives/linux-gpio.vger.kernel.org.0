Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DAB62D08B3
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 02:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgLGBIX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Dec 2020 20:08:23 -0500
Received: from foss.arm.com ([217.140.110.172]:37698 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726484AbgLGBIW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 6 Dec 2020 20:08:22 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D92811D4;
        Sun,  6 Dec 2020 17:07:35 -0800 (PST)
Received: from [192.168.2.22] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C76B3F66B;
        Sun,  6 Dec 2020 17:07:32 -0800 (PST)
Subject: Re: [linux-sunxi] [PATCH 2/8] pinctrl: sunxi: Add support for the
 Allwinner H616 pin controller
To:     Icenowy Zheng <icenowy@aosc.io>,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>,
        =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Icenowy Zheng <icenowy@aosc.xyz>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Yangtao Li <frank@allwinnertech.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-gpio@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>
References: <20201202135409.13683-1-andre.przywara@arm.com>
 <20201202135409.13683-3-andre.przywara@arm.com>
 <CAJiuCcdkzipiCT1g8=qNgcawqRH6RpFXZEN9jfX+C2i1derREw@mail.gmail.com>
 <9030268.RpDFqJRP6T@jernej-laptop>
 <3fba5877-a25a-ca4d-a579-08a21f116133@arm.com>
 <CA53454B-8FC1-4668-955A-DC02A7F815FC@aosc.io>
From:   =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Autocrypt: addr=andre.przywara@arm.com; prefer-encrypt=mutual; keydata=
 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
 i4aIXCH3Wv6K
Organization: ARM Ltd.
Message-ID: <b0dfeffe-14f3-0461-d536-c21c1340104d@arm.com>
Date:   Mon, 7 Dec 2020 01:07:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CA53454B-8FC1-4668-955A-DC02A7F815FC@aosc.io>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06/12/2020 16:01, Icenowy Zheng wrote:

Hi,

> 于 2020年12月6日 GMT+08:00 下午10:52:17, "André Przywara" <andre.przywara@arm.com> 写到:
>> On 06/12/2020 12:42, Jernej Škrabec wrote:
>>
>> Hi,
>>
>>> Dne nedelja, 06. december 2020 ob 13:32:49 CET je Clément Péron
>> napisal(a):
>>>> Hi Andre,
>>>>
>>>> On Wed, 2 Dec 2020 at 14:54, Andre Przywara <andre.przywara@arm.com>
>> wrote:
>>>>> Port A is used for an internal connection to some analogue
>> circuitry
>>>>> which looks like an AC200 IP (as in the H6), though this is not
>>>>> mentioned in the manual.
>>>>>
>>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>>>> ---
>>>>>
>>>>>  drivers/pinctrl/sunxi/Kconfig               |   5 +
>>>>>  drivers/pinctrl/sunxi/Makefile              |   1 +
>>>>>  drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c | 549
>> ++++++++++++++++++++
>>>>>  3 files changed, 555 insertions(+)
>>>>>  create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c
>>>>>
>>>>> diff --git a/drivers/pinctrl/sunxi/Kconfig
>> b/drivers/pinctrl/sunxi/Kconfig
>>>>> index 593293584ecc..73e88ce71a48 100644
>>>>> --- a/drivers/pinctrl/sunxi/Kconfig
>>>>> +++ b/drivers/pinctrl/sunxi/Kconfig
>>>>> @@ -119,4 +119,9 @@ config PINCTRL_SUN50I_H6_R
>>>>>
>>>>>         default ARM64 && ARCH_SUNXI
>>>>>         select PINCTRL_SUNXI
>>>>>
>>>>> +config PINCTRL_SUN50I_H616
>>>>> +       bool "Support for the Allwinner H616 PIO"
>>>>> +       default ARM64 && ARCH_SUNXI
>>>>> +       select PINCTRL_SUNXI
>>>>> +
>>>>>
>>>>>  endif
>>>>>
>>>>> diff --git a/drivers/pinctrl/sunxi/Makefile
>>>>> b/drivers/pinctrl/sunxi/Makefile index 8b7ff0dc3bdf..5359327a3c8f
>> 100644
>>>>> --- a/drivers/pinctrl/sunxi/Makefile
>>>>> +++ b/drivers/pinctrl/sunxi/Makefile
>>>>> @@ -23,5 +23,6 @@ obj-$(CONFIG_PINCTRL_SUN8I_V3S)               +=
>>>>> pinctrl-sun8i-v3s.o> 
>>>>>  obj-$(CONFIG_PINCTRL_SUN50I_H5)                +=
>> pinctrl-sun50i-h5.o
>>>>>  obj-$(CONFIG_PINCTRL_SUN50I_H6)                +=
>> pinctrl-sun50i-h6.o
>>>>>  obj-$(CONFIG_PINCTRL_SUN50I_H6_R)      += pinctrl-sun50i-h6-r.o
>>>>>
>>>>> +obj-$(CONFIG_PINCTRL_SUN50I_H616)      += pinctrl-sun50i-h616.o
>>>>>
>>>>>  obj-$(CONFIG_PINCTRL_SUN9I_A80)                +=
>> pinctrl-sun9i-a80.o
>>>>>  obj-$(CONFIG_PINCTRL_SUN9I_A80_R)      += pinctrl-sun9i-a80-r.o
>>>>>
>>>>> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c
>>>>> b/drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c new file mode 100644
>>>>> index 000000000000..734f63eb08dd
>>>>> --- /dev/null
>>>>> +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c
>>>>> @@ -0,0 +1,549 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>> +/*
>>>>> + * Allwinner H616 SoC pinctrl driver.
>>>>> + *
>>>>> + * Copyright (C) 2020 Arm Ltd.
>>>>> + * based on the H6 pinctrl driver
>>>>> + *   Copyright (C) 2017 Icenowy Zheng <icenowy@aosc.io>
>>>>> + */
>>>>> +
>>>>> +#include <linux/module.h>
>>>>> +#include <linux/platform_device.h>
>>>>> +#include <linux/of.h>
>>>>> +#include <linux/of_device.h>
>>>>> +#include <linux/pinctrl/pinctrl.h>
>>>>> +
>>>>> +#include "pinctrl-sunxi.h"
>>>>> +
>>>>> +static const struct sunxi_desc_pin h616_pins[] = {
>>>>> +       /* Internal connection to the AC200 part */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 0),
>>>>> +               SUNXI_FUNCTION(0x2, "emac1")),          /* ERXD1 */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 1),
>>>>> +               SUNXI_FUNCTION(0x2, "emac1")),          /* ERXD0 */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 2),
>>>>> +               SUNXI_FUNCTION(0x2, "emac1")),          /* ECRS_DV
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 3),
>>>>> +               SUNXI_FUNCTION(0x2, "emac1")),          /* ERXERR
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 4),
>>>>> +               SUNXI_FUNCTION(0x2, "emac1")),          /* ETXD1 */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 5),
>>>>> +               SUNXI_FUNCTION(0x2, "emac1")),          /* ETXD0 */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 6),
>>>>> +               SUNXI_FUNCTION(0x2, "emac1")),          /* ETXCK */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 7),
>>>>> +               SUNXI_FUNCTION(0x2, "emac1")),          /* ETXEN */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 8),
>>>>> +               SUNXI_FUNCTION(0x2, "emac1")),          /* EMDC */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 9),
>>>>> +               SUNXI_FUNCTION(0x2, "emac1")),          /* EMDIO */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 10),
>>>>> +               SUNXI_FUNCTION(0x2, "i2c3")),           /* SCK */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 11),
>>>>> +               SUNXI_FUNCTION(0x2, "i2c3")),           /* SDA */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 12),
>>>>> +               SUNXI_FUNCTION(0x2, "pwm5")),
>>>>> +       /* Hole */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 0),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* WE */
>>>>> +                 SUNXI_FUNCTION(0x3, "mmc2"),          /* DS */
>>>>> +                 SUNXI_FUNCTION(0x4, "spi0"),          /* CLK */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)),  /* PC_EINT0
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 1),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* ALE */
>>>>> +                 SUNXI_FUNCTION(0x3, "mmc2"),          /* RST */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 1)),  /* PC_EINT1
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 2),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* CLE */
>>>>> +                 SUNXI_FUNCTION(0x4, "spi0"),          /* MOSI */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 2)),  /* PC_EINT2
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 3),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* CE1 */
>>>>> +                 SUNXI_FUNCTION(0x4, "spi0"),          /* CS0 */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 3)),  /* PC_EINT3
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 4),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* CE0 */
>>>>> +                 SUNXI_FUNCTION(0x4, "spi0"),          /* MISO */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 4)),  /* PC_EINT4
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 5),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* RE */
>>>>> +                 SUNXI_FUNCTION(0x3, "mmc2"),          /* CLK */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 5)),  /* PC_EINT5
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 6),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* RB0 */
>>>>> +                 SUNXI_FUNCTION(0x3, "mmc2"),          /* CMD */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 6)),  /* PC_EINT6
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 7),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* RB1 */
>>>>> +                 SUNXI_FUNCTION(0x4, "spi0"),          /* CS1 */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 7)),  /* PC_EINT7
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 8),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* DQ7 */
>>>>> +                 SUNXI_FUNCTION(0x3, "mmc2"),          /* D3 */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 8)),  /* PC_EINT8
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 9),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* DQ6 */
>>>>> +                 SUNXI_FUNCTION(0x3, "mmc2"),          /* D4 */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 9)),  /* PC_EINT9
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 10),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* DQ5 */
>>>>> +                 SUNXI_FUNCTION(0x3, "mmc2"),          /* D0 */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 10)), /*
>> PC_EINT10 */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 11),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* DQ4 */
>>>>> +                 SUNXI_FUNCTION(0x3, "mmc2"),          /* D5 */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 11)), /*
>> PC_EINT11 */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 12),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* DQS */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 12)), /*
>> PC_EINT12 */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 13),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* DQ3 */
>>>>> +                 SUNXI_FUNCTION(0x3, "mmc2"),          /* D1 */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 13)), /*
>> PC_EINT13 */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 14),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* DQ2 */
>>>>> +                 SUNXI_FUNCTION(0x3, "mmc2"),          /* D6 */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 14)), /*
>> PC_EINT14 */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 15),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* DQ1 */
>>>>> +                 SUNXI_FUNCTION(0x3, "mmc2"),          /* D2 */
>>>>> +                 SUNXI_FUNCTION(0x4, "spi0"),          /* WP */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 15)), /*
>> PC_EINT15 */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 16),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* DQ0 */
>>>>> +                 SUNXI_FUNCTION(0x3, "mmc2"),          /* D7 */
>>>>> +                 SUNXI_FUNCTION(0x4, "spi0"),          /* HOLD */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 16)), /*
>> PC_EINT16 */
>>>>> +       /* Hole */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 0),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "mmc0"),          /* D1 */
>>>>> +                 SUNXI_FUNCTION(0x3, "jtag"),          /* MS */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 0)),  /* PF_EINT0
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 1),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "mmc0"),          /* D0 */
>>>>> +                 SUNXI_FUNCTION(0x3, "jtag"),          /* DI */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 1)),  /* PF_EINT1
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 2),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "mmc0"),          /* CLK */
>>>>> +                 SUNXI_FUNCTION(0x3, "uart0"),         /* TX */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 2)),  /* PF_EINT2
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 3),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "mmc0"),          /* CMD */
>>>>> +                 SUNXI_FUNCTION(0x3, "jtag"),          /* DO */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 3)),  /* PF_EINT3
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 4),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "mmc0"),          /* D3 */
>>>>> +                 SUNXI_FUNCTION(0x3, "uart0"),         /* RX */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 4)),  /* PF_EINT4
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 5),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "mmc0"),          /* D2 */
>>>>> +                 SUNXI_FUNCTION(0x3, "jtag"),          /* CK */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 5)),  /* PF_EINT5
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 6),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 6)),  /* PF_EINT6
>> */
>>>>> +       /* Hole */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 0),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "mmc1"),          /* CLK */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 0)),  /* PG_EINT0
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 1),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "mmc1"),          /* CMD */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 1)),  /* PG_EINT1
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 2),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "mmc1"),          /* D0 */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 2)),  /* PG_EINT2
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 3),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "mmc1"),          /* D1 */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 3)),  /* PG_EINT3
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 4),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "mmc1"),          /* D2 */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 4)),  /* PG_EINT4
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 5),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "mmc1"),          /* D3 */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 5)),  /* PG_EINT5
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 6),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "uart1"),         /* TX */
>>>>> +                 SUNXI_FUNCTION(0x4, "jtag"),          /* MS */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 6)),  /* PG_EINT6
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 7),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "uart1"),         /* RX */
>>>>> +                 SUNXI_FUNCTION(0x4, "jtag"),          /* CK */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 7)),  /* PG_EINT7
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 8),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "uart1"),         /* RTS */
>>>>> +                 SUNXI_FUNCTION(0x3, "clock"),         /*
>> PLL_LOCK_DEBUG
>>>>> */ +                 SUNXI_FUNCTION(0x4, "jtag"),          /* DO */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 8)),  /* PG_EINT8
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 9),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "uart1"),         /* CTS */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 9)),  /* PG_EINT9
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 10),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "h_i2s2"),        /* MCLK */
>>>>> +                 SUNXI_FUNCTION(0x3, "clock"),         /* X32KFOUT
>> */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 10)), /*
>> PG_EINT10 */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 11),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "h_i2s2"),        /* BCLK */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 11)), /*
>> PG_EINT11 */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 12),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "h_i2s2"),        /* SYNC */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 12)), /*
>> PG_EINT12 */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 13),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "h_i2s2"),        /* DOUT */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 13)), /*
>> PG_EINT13 */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 14),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "h_i2s2"),        /* DIN */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 14)), /*
>> PG_EINT14 */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 15),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "uart2"),         /* TX */
>>>>> +                 SUNXI_FUNCTION(0x5, "i2c4"),          /* SCK */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 15)), /*
>> PG_EINT15 */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 16),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "uart2"),         /* TX */
>>>>> +                 SUNXI_FUNCTION(0x5, "i2c4"),          /* SDA */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 16)), /*
>> PG_EINT16 */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 17),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "uart2"),         /* RTS */
>>>>> +                 SUNXI_FUNCTION(0x5, "i2c3"),          /* SCK */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 17)), /*
>> PG_EINT17 */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 18),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "uart2"),         /* CTS */
>>>>> +                 SUNXI_FUNCTION(0x5, "i2c3"),          /* SDA */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 18)), /*
>> PG_EINT18 */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 19),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x4, "pwm1"),
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 19)), /*
>> PG_EINT19 */
>>>>> +       /* Hole */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 0),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "uart0"),         /* TX */
>>>>> +                 SUNXI_FUNCTION(0x4, "pwm3"),
>>>>> +                 SUNXI_FUNCTION(0x5, "i2c1"),          /* SCK */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 0)),  /* PH_EINT0
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "uart0"),         /* RX */
>>>>> +                 SUNXI_FUNCTION(0x4, "pwm4"),
>>>>> +                 SUNXI_FUNCTION(0x5, "i2c1"),          /* SDA */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 1)),  /* PH_EINT1
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "uart5"),         /* TX */
>>>>> +                 SUNXI_FUNCTION(0x3, "spdif"),         /* MCLK */
>>>>> +                 SUNXI_FUNCTION(0x4, "pwm2"),
>>>>> +                 SUNXI_FUNCTION(0x5, "i2c2"),          /* SCK */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 2)),  /* PH_EINT2
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "uart5"),         /* RX */
>>>>> +                 SUNXI_FUNCTION(0x4, "pwm1"),
>>>>> +                 SUNXI_FUNCTION(0x5, "i2c2"),          /* SDA */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 3)),  /* PH_EINT3
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x3, "spdif"),         /* OUT */
>>>>> +                 SUNXI_FUNCTION(0x5, "i2c3"),          /* SCK */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 4)),  /* PH_EINT4
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "uart2"),         /* TX */
>>>>> +                 SUNXI_FUNCTION(0x3, "h_i2s3"),        /* MCLK */
>>>>> +                 SUNXI_FUNCTION(0x4, "spi1"),          /* CS0 */
>>>>> +                 SUNXI_FUNCTION(0x5, "i2c3"),          /* SDA */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 5)),  /* PH_EINT5
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "uart2"),         /* RX */
>>>>> +                 SUNXI_FUNCTION(0x3, "h_i2s3"),        /* BCLK */
>>>>> +                 SUNXI_FUNCTION(0x4, "spi1"),          /* CLK */
>>>>> +                 SUNXI_FUNCTION(0x5, "i2c4"),          /* SCK */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 6)),  /* PH_EINT6
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "uart2"),         /* RTS */
>>>>> +                 SUNXI_FUNCTION(0x3, "h_i2s3"),        /* SYNC */
>>>>> +                 SUNXI_FUNCTION(0x4, "spi1"),          /* MOSI */
>>>>> +                 SUNXI_FUNCTION(0x5, "i2c4"),          /* SDA */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 7)),  /* PH_EINT7
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "uart2"),         /* CTS */
>>>>> +                 SUNXI_FUNCTION(0x3, "h_i2s3"),        /* DO0 */
>>>>> +                 SUNXI_FUNCTION(0x4, "spi1"),          /* MISO */
>>>>> +                 SUNXI_FUNCTION(0x5, "h_i2s3"),        /* DI1 */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 8)),  /* PH_EINT8
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 9),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x3, "h_i2s3"),        /* DI0 */
>>>>> +                 SUNXI_FUNCTION(0x4, "spi1"),          /* CS1 */
>>>>> +                 SUNXI_FUNCTION(0x3, "h_i2s3"),        /* DO1 */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 9)),  /* PH_EINT9
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x3, "ir_rx"),
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 10)), /*
>> PH_EINT10 */
>>>>> +       /* Hole */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 0),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ERXD3 */
>>>>> +                 SUNXI_FUNCTION(0x3, "dmic"),          /* CLK */
>>>>> +                 SUNXI_FUNCTION(0x4, "h_i2s0"),        /* MCLK */
>>>>> +                 SUNXI_FUNCTION(0x5, "hdmi"),          /* HSCL */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 0)),  /* PI_EINT0
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 1),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ERXD2 */
>>>>> +                 SUNXI_FUNCTION(0x3, "dmic"),          /* DATA0 */
>>>>> +                 SUNXI_FUNCTION(0x4, "h_i2s0"),        /* BCLK */
>>>>> +                 SUNXI_FUNCTION(0x5, "hdmi"),          /* HSDA */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 1)),  /* PI_EINT1
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 2),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ERXD1 */
>>>>> +                 SUNXI_FUNCTION(0x3, "dmic"),          /* DATA1 */
>>>>> +                 SUNXI_FUNCTION(0x4, "h_i2s0"),        /* SYNC */
>>>>> +                 SUNXI_FUNCTION(0x5, "hdmi"),          /* HCEC */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 2)),  /* PI_EINT2
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 3),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ERXD0 */
>>>>> +                 SUNXI_FUNCTION(0x3, "dmic"),          /* DATA2 */
>>>>> +                 SUNXI_FUNCTION(0x4, "h_i2s0"),        /* DO0 */
>>>>> +                 SUNXI_FUNCTION(0x5, "h_i2s0"),        /* DI1 */
>>>>
>>>> The same string is used for 2 muxes.
>>>> I think we should drop one for the moment or introduce a new string.
>>>>
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 3)),  /* PI_EINT3
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 4),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ERXCK */
>>>>> +                 SUNXI_FUNCTION(0x3, "dmic"),          /* DATA3 */
>>>>> +                 SUNXI_FUNCTION(0x4, "h_i2s0"),        /* DI0 */
>>>>> +                 SUNXI_FUNCTION(0x5, "h_i2s0"),        /* DO1 */
>>>>
>>>> Same here
>>>>
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 4)),  /* PI_EINT4
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 5),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ERXCTL
>> */
>>>>> +                 SUNXI_FUNCTION(0x3, "uart2"),         /* TX */
>>>>> +                 SUNXI_FUNCTION(0x4, "ts0"),           /* CLK */
>>>>> +                 SUNXI_FUNCTION(0x5, "i2c0"),          /* SCK */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 5)),  /* PI_EINT5
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 6),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ENULL */
>>>>> +                 SUNXI_FUNCTION(0x3, "uart2"),         /* RX */
>>>>> +                 SUNXI_FUNCTION(0x4, "ts0"),           /* ERR */
>>>>> +                 SUNXI_FUNCTION(0x5, "i2c0"),          /* SDA */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 6)),  /* PI_EINT6
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 7),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ETXD3 */
>>>>> +                 SUNXI_FUNCTION(0x3, "uart2"),         /* RTS */
>>>>> +                 SUNXI_FUNCTION(0x4, "ts0"),           /* SYNC */
>>>>> +                 SUNXI_FUNCTION(0x5, "i2c1"),          /* SCK */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 7)),  /* PI_EINT7
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 8),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ETXD2 */
>>>>> +                 SUNXI_FUNCTION(0x3, "uart2"),         /* CTS */
>>>>> +                 SUNXI_FUNCTION(0x4, "ts0"),           /* DVLD */
>>>>> +                 SUNXI_FUNCTION(0x5, "i2c1"),          /* SDA */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 8)),  /* PI_EINT8
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 9),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ETXD1 */
>>>>> +                 SUNXI_FUNCTION(0x3, "uart3"),         /* TX */
>>>>> +                 SUNXI_FUNCTION(0x4, "ts0"),           /* D0 */
>>>>> +                 SUNXI_FUNCTION(0x5, "i2c2"),          /* SCK */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 9)),  /* PI_EINT9
>> */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 10),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ETXD0 */
>>>>> +                 SUNXI_FUNCTION(0x3, "uart3"),         /* RX */
>>>>> +                 SUNXI_FUNCTION(0x4, "ts0"),           /* D1 */
>>>>> +                 SUNXI_FUNCTION(0x5, "i2c2"),          /* SDA */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 10)), /*
>> PI_EINT10 */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 11),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ETXCK */
>>>>> +                 SUNXI_FUNCTION(0x3, "uart3"),         /* RTS */
>>>>> +                 SUNXI_FUNCTION(0x4, "ts0"),           /* D2 */
>>>>> +                 SUNXI_FUNCTION(0x5, "pwm1"),
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 11)), /*
>> PI_EINT11 */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 12),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ETXCTL
>> */
>>>>> +                 SUNXI_FUNCTION(0x3, "uart3"),         /* CTS */
>>>>> +                 SUNXI_FUNCTION(0x4, "ts0"),           /* D3 */
>>>>> +                 SUNXI_FUNCTION(0x5, "pwm2"),
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 12)), /*
>> PI_EINT12 */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 13),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ECLKIN
>> */
>>>>> +                 SUNXI_FUNCTION(0x3, "uart4"),         /* TX */
>>>>> +                 SUNXI_FUNCTION(0x4, "ts0"),           /* D4 */
>>>>> +                 SUNXI_FUNCTION(0x5, "pwm3"),
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 13)), /*
>> PI_EINT13 */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 14),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* MDC */
>>>>> +                 SUNXI_FUNCTION(0x3, "uart4"),         /* RX */
>>>>> +                 SUNXI_FUNCTION(0x4, "ts0"),           /* D5 */
>>>>> +                 SUNXI_FUNCTION(0x5, "pwm4"),
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 14)), /*
>> PI_EINT14 */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 15),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* MDIO */
>>>>> +                 SUNXI_FUNCTION(0x3, "uart4"),         /* RTS */
>>>>> +                 SUNXI_FUNCTION(0x4, "ts0"),           /* D6 */
>>>>> +                 SUNXI_FUNCTION(0x5, "clock"),         /*
>> CLK_FANOUT0 */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 15)), /*
>> PI_EINT15 */
>>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 16),
>>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* EPHY_CLK
>> */
>>>>> +                 SUNXI_FUNCTION(0x3, "uart4"),         /* CTS */
>>>>> +                 SUNXI_FUNCTION(0x4, "ts0"),           /* D7 */
>>>>> +                 SUNXI_FUNCTION(0x5, "clock"),         /*
>> CLK_FANOUT1 */
>>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 16)), /*
>> PI_EINT16 */
>>>>> +};
>>>>> +static const unsigned int h616_irq_bank_map[] = { 2, 5, 6, 7, 8 };
>>>>
>>>> The BSP driver seems to have more than 5 IRQ Banks.
>>>>
>>>> static const unsigned sun50iw9p1_irq_bank_base[] = {
>>>> SUNXI_PIO_BANK_BASE(PA_BASE, 0),
>>>> SUNXI_PIO_BANK_BASE(PC_BASE, 1),
>>>> SUNXI_PIO_BANK_BASE(PD_BASE, 2),
>>>> SUNXI_PIO_BANK_BASE(PE_BASE, 3),
>>>> SUNXI_PIO_BANK_BASE(PF_BASE, 4),
>>>> SUNXI_PIO_BANK_BASE(PG_BASE, 5),
>>>> SUNXI_PIO_BANK_BASE(PH_BASE, 6),
>>>> SUNXI_PIO_BANK_BASE(PI_BASE, 7),
>>>> };
>>>>
>>>> So maybe it should be somethings like this:
>>>> static const unsigned int h616_irq_bank_map[] = { 0, 2, 3, 4, 5, 6,
>> 7, 8 };
>>>
>>> While that's true, I don't see a need for IRQ bank on port A - this
>> port is 
>>> internal (not exposed on pins) and none of the functionality on that
>> port 
>>> needs IRQ.
>>
>> I agree here, since port A isn't even mentioned in the manual (neither
> 
> I think if we ignore it we have the risk of DT binding issues
> when we need to add it afterwards.

You have a point, but which interrupt shall I assign in the .dtsi?

And as Jernej mentioned, there is little sense in having those pins as
interrupt sources, since we cannot use them as GPIOs in a useful way. We
could bitbang I2C, but I don't see much sense in doing this.

And to be honest: that issue is a shortcoming of our binding. By moving
this simple array into the DT we could avoid this problem entirely.

>> is PortD or PortE),

I had a look at PortD and PortE in the BSP: they describe LCD, LVDS and
CSI, mostly, all interfaces which the chip does not support anymore.
Even if the peripherals are still in, there is no use for having those
signals internally. And there are surely no pads connected to them
(there are simply no balls left on the package, according to the datasheet).

So my theory is that those peripherals are just left in because it was
too much trouble to remove them (and it doesn't hurt having them in), or
there is another package variant which exposes those pins.

So I would lean to not expose those ports (PD, PE) and their interrupts
(for PA, PD, PE).

Opinions?

Cheers,
Andre

> I would refrain from listing it here prematurely.
>> Plus we actually don't know their interrupt numbers: the manual only
>> mentions GPIOE on top of the already listed interrupts.
>>
>> The interrupts work by their index, so skipping ports is not an issue.
>> I
>> just tested the PIO interrupt on PortC, and it works.
>>
>> Cheers,
>> Andre
>>
>>>>
>>>>> +
>>>>> +static const struct sunxi_pinctrl_desc h616_pinctrl_data = {
>>>>> +       .pins = h616_pins,
>>>>> +       .npins = ARRAY_SIZE(h616_pins),
>>>>> +       .irq_banks = 5,
>>>>
>>>>  .irq_banks = ARAY_SIZE(h616_irq_bank_map) is better no ?
>>>>
>>>>> +       .irq_bank_map = h616_irq_bank_map,
>>>>> +       .irq_read_needs_mux = true,
>>>>> +       .io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
>>>>> +};
>>>>> +
>>>>> +static int h616_pinctrl_probe(struct platform_device *pdev)
>>>>> +{
>>>>> +       return sunxi_pinctrl_init(pdev,
>>>>> +                                 &h616_pinctrl_data);
>>>>> +}
>>>>> +
>>>>> +static const struct of_device_id h616_pinctrl_match[] = {
>>>>> +       { .compatible = "allwinner,sun50i-h616-pinctrl", },
>>>>
>>>> This is a new compatible and should be documented.
>>>>
>>>> Regards,
>>>> Clement
>>>>
>>>>> +       {}
>>>>> +};
>>>>> +
>>>>> +static struct platform_driver h616_pinctrl_driver = {
>>>>> +       .probe  = h616_pinctrl_probe,
>>>>> +       .driver = {
>>>>> +               .name           = "sun50i-h616-pinctrl",
>>>>> +               .of_match_table = h616_pinctrl_match,
>>>>> +       },
>>>>> +};
>>>>> +builtin_platform_driver(h616_pinctrl_driver);
>>>>> --
>>>>> 2.17.5
>>>>>
>>>>> --
> 

