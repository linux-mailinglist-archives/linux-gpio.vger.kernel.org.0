Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD9E2D05D0
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Dec 2020 17:06:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbgLFQE4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Dec 2020 11:04:56 -0500
Received: from relay-us1.mymailcheap.com ([51.81.35.219]:35412 "EHLO
        relay-us1.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726641AbgLFQEz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Dec 2020 11:04:55 -0500
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
        by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 84ED22004D
        for <linux-gpio@vger.kernel.org>; Sun,  6 Dec 2020 16:04:12 +0000 (UTC)
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [149.56.97.132])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id C2B07200FE;
        Sun,  6 Dec 2020 16:03:14 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay1.mymailcheap.com (Postfix) with ESMTPS id CF5C63F157;
        Sun,  6 Dec 2020 16:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id 06BD12A50C;
        Sun,  6 Dec 2020 17:01:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1607270502;
        bh=2KuG93TrLvVcOugYX23M4JRPHJnIOFdcjEsiQ1bxPVc=;
        h=Date:In-Reply-To:References:Subject:To:CC:From:From;
        b=g6Cr0VyeMdFXjIJWNA2DzlwJ1jImp79vyQG9kADbBB3DOlEIldK02svZ4b5OjAXse
         XJttHF5uaRSXSGUoX9uhRqV6bAIZX1i3hfDdEy6ibUiDU9U5S7Uvdj3Lm5itIsZB7/
         XSbTyyAN302uoQO33YMj5udR0YMmkL9XZTEbBLwI=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 2jd9p1n10stz; Sun,  6 Dec 2020 17:01:39 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Sun,  6 Dec 2020 17:01:39 +0100 (CET)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id CE140400D0;
        Sun,  6 Dec 2020 16:01:38 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="vwtpM/o6";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [172.19.0.1] (unknown [64.225.114.122])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id F0F20400D0;
        Sun,  6 Dec 2020 16:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
        t=1607270484; bh=2KuG93TrLvVcOugYX23M4JRPHJnIOFdcjEsiQ1bxPVc=;
        h=Date:In-Reply-To:References:Subject:To:CC:From:From;
        b=vwtpM/o6c6UVNfej18RfYqQ/6zlQNBIeRxoGUB6Dm63fiqFASY33EUQMP7Asek03Z
         GoUYFdOCOxkNotXdR39OqSdGunHiAXuMn3zgRBEo+GP3duzFXKhfk5QdkJAuI9TQle
         cZJIaj0qOIBmNFP/c3g5WNLOPB9QRuLI56VMzhts=
Date:   Mon, 07 Dec 2020 00:01:09 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <3fba5877-a25a-ca4d-a579-08a21f116133@arm.com>
References: <20201202135409.13683-1-andre.przywara@arm.com> <20201202135409.13683-3-andre.przywara@arm.com> <CAJiuCcdkzipiCT1g8=qNgcawqRH6RpFXZEN9jfX+C2i1derREw@mail.gmail.com> <9030268.RpDFqJRP6T@jernej-laptop> <3fba5877-a25a-ca4d-a579-08a21f116133@arm.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-sunxi] [PATCH 2/8] pinctrl: sunxi: Add support for the Allwinner H616 pin controller
To:     andre.przywara@arm.com,
        =?ISO-8859-1?Q?Andr=E9_Przywara?= <andre.przywara@arm.com>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>,
        =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
CC:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Icenowy Zheng <icenowy@aosc.xyz>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Yangtao Li <frank@allwinnertech.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-gpio@vger.kernel.org
From:   Icenowy Zheng <icenowy@aosc.io>
Message-ID: <CA53454B-8FC1-4668-955A-DC02A7F815FC@aosc.io>
X-Rspamd-Queue-Id: CE140400D0
X-Spamd-Result: default: False [1.40 / 20.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[aosc.io:s=default];
         MID_RHS_MATCH_FROM(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TAGGED_RCPT(0.00)[dt];
         MIME_GOOD(-0.10)[text/plain];
         DMARC_NA(0.00)[aosc.io];
         R_SPF_SOFTFAIL(0.00)[~all];
         TO_MATCH_ENVRCPT_SOME(0.00)[];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[aosc.io:+];
         RCPT_COUNT_TWELVE(0.00)[14];
         FREEMAIL_TO(0.00)[arm.com,siol.net,gmail.com];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         SUSPICIOUS_RECIPS(1.50)[];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Server: mail20.mymailcheap.com
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B412=E6=9C=886=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=881=
0:52:17, "Andr=C3=A9 Przywara" <andre=2Eprzywara@arm=2Ecom> =E5=86=99=E5=88=
=B0:
>On 06/12/2020 12:42, Jernej =C5=A0krabec wrote:
>
>Hi,
>
>> Dne nedelja, 06=2E december 2020 ob 13:32:49 CET je Cl=C3=A9ment P=C3=
=A9ron
>napisal(a):
>>> Hi Andre,
>>>
>>> On Wed, 2 Dec 2020 at 14:54, Andre Przywara <andre=2Eprzywara@arm=2Eco=
m>
>wrote:
>>>> Port A is used for an internal connection to some analogue
>circuitry
>>>> which looks like an AC200 IP (as in the H6), though this is not
>>>> mentioned in the manual=2E
>>>>
>>>> Signed-off-by: Andre Przywara <andre=2Eprzywara@arm=2Ecom>
>>>> ---
>>>>
>>>>  drivers/pinctrl/sunxi/Kconfig               |   5 +
>>>>  drivers/pinctrl/sunxi/Makefile              |   1 +
>>>>  drivers/pinctrl/sunxi/pinctrl-sun50i-h616=2Ec | 549
>++++++++++++++++++++
>>>>  3 files changed, 555 insertions(+)
>>>>  create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun50i-h616=2Ec
>>>>
>>>> diff --git a/drivers/pinctrl/sunxi/Kconfig
>b/drivers/pinctrl/sunxi/Kconfig
>>>> index 593293584ecc=2E=2E73e88ce71a48 100644
>>>> --- a/drivers/pinctrl/sunxi/Kconfig
>>>> +++ b/drivers/pinctrl/sunxi/Kconfig
>>>> @@ -119,4 +119,9 @@ config PINCTRL_SUN50I_H6_R
>>>>
>>>>         default ARM64 && ARCH_SUNXI
>>>>         select PINCTRL_SUNXI
>>>>
>>>> +config PINCTRL_SUN50I_H616
>>>> +       bool "Support for the Allwinner H616 PIO"
>>>> +       default ARM64 && ARCH_SUNXI
>>>> +       select PINCTRL_SUNXI
>>>> +
>>>>
>>>>  endif
>>>>
>>>> diff --git a/drivers/pinctrl/sunxi/Makefile
>>>> b/drivers/pinctrl/sunxi/Makefile index 8b7ff0dc3bdf=2E=2E5359327a3c8f
>100644
>>>> --- a/drivers/pinctrl/sunxi/Makefile
>>>> +++ b/drivers/pinctrl/sunxi/Makefile
>>>> @@ -23,5 +23,6 @@ obj-$(CONFIG_PINCTRL_SUN8I_V3S)               +=3D
>>>> pinctrl-sun8i-v3s=2Eo>=20
>>>>  obj-$(CONFIG_PINCTRL_SUN50I_H5)                +=3D
>pinctrl-sun50i-h5=2Eo
>>>>  obj-$(CONFIG_PINCTRL_SUN50I_H6)                +=3D
>pinctrl-sun50i-h6=2Eo
>>>>  obj-$(CONFIG_PINCTRL_SUN50I_H6_R)      +=3D pinctrl-sun50i-h6-r=2Eo
>>>>
>>>> +obj-$(CONFIG_PINCTRL_SUN50I_H616)      +=3D pinctrl-sun50i-h616=2Eo
>>>>
>>>>  obj-$(CONFIG_PINCTRL_SUN9I_A80)                +=3D
>pinctrl-sun9i-a80=2Eo
>>>>  obj-$(CONFIG_PINCTRL_SUN9I_A80_R)      +=3D pinctrl-sun9i-a80-r=2Eo
>>>>
>>>> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-h616=2Ec
>>>> b/drivers/pinctrl/sunxi/pinctrl-sun50i-h616=2Ec new file mode 100644
>>>> index 000000000000=2E=2E734f63eb08dd
>>>> --- /dev/null
>>>> +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-h616=2Ec
>>>> @@ -0,0 +1,549 @@
>>>> +// SPDX-License-Identifier: GPL-2=2E0
>>>> +/*
>>>> + * Allwinner H616 SoC pinctrl driver=2E
>>>> + *
>>>> + * Copyright (C) 2020 Arm Ltd=2E
>>>> + * based on the H6 pinctrl driver
>>>> + *   Copyright (C) 2017 Icenowy Zheng <icenowy@aosc=2Eio>
>>>> + */
>>>> +
>>>> +#include <linux/module=2Eh>
>>>> +#include <linux/platform_device=2Eh>
>>>> +#include <linux/of=2Eh>
>>>> +#include <linux/of_device=2Eh>
>>>> +#include <linux/pinctrl/pinctrl=2Eh>
>>>> +
>>>> +#include "pinctrl-sunxi=2Eh"
>>>> +
>>>> +static const struct sunxi_desc_pin h616_pins[] =3D {
>>>> +       /* Internal connection to the AC200 part */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 0),
>>>> +               SUNXI_FUNCTION(0x2, "emac1")),          /* ERXD1 */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 1),
>>>> +               SUNXI_FUNCTION(0x2, "emac1")),          /* ERXD0 */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 2),
>>>> +               SUNXI_FUNCTION(0x2, "emac1")),          /* ECRS_DV
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 3),
>>>> +               SUNXI_FUNCTION(0x2, "emac1")),          /* ERXERR
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 4),
>>>> +               SUNXI_FUNCTION(0x2, "emac1")),          /* ETXD1 */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 5),
>>>> +               SUNXI_FUNCTION(0x2, "emac1")),          /* ETXD0 */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 6),
>>>> +               SUNXI_FUNCTION(0x2, "emac1")),          /* ETXCK */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 7),
>>>> +               SUNXI_FUNCTION(0x2, "emac1")),          /* ETXEN */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 8),
>>>> +               SUNXI_FUNCTION(0x2, "emac1")),          /* EMDC */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 9),
>>>> +               SUNXI_FUNCTION(0x2, "emac1")),          /* EMDIO */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 10),
>>>> +               SUNXI_FUNCTION(0x2, "i2c3")),           /* SCK */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 11),
>>>> +               SUNXI_FUNCTION(0x2, "i2c3")),           /* SDA */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 12),
>>>> +               SUNXI_FUNCTION(0x2, "pwm5")),
>>>> +       /* Hole */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 0),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* WE */
>>>> +                 SUNXI_FUNCTION(0x3, "mmc2"),          /* DS */
>>>> +                 SUNXI_FUNCTION(0x4, "spi0"),          /* CLK */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)),  /* PC_EINT0
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 1),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* ALE */
>>>> +                 SUNXI_FUNCTION(0x3, "mmc2"),          /* RST */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 1)),  /* PC_EINT1
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 2),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* CLE */
>>>> +                 SUNXI_FUNCTION(0x4, "spi0"),          /* MOSI */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 2)),  /* PC_EINT2
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 3),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* CE1 */
>>>> +                 SUNXI_FUNCTION(0x4, "spi0"),          /* CS0 */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 3)),  /* PC_EINT3
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 4),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* CE0 */
>>>> +                 SUNXI_FUNCTION(0x4, "spi0"),          /* MISO */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 4)),  /* PC_EINT4
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 5),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* RE */
>>>> +                 SUNXI_FUNCTION(0x3, "mmc2"),          /* CLK */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 5)),  /* PC_EINT5
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 6),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* RB0 */
>>>> +                 SUNXI_FUNCTION(0x3, "mmc2"),          /* CMD */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 6)),  /* PC_EINT6
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 7),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* RB1 */
>>>> +                 SUNXI_FUNCTION(0x4, "spi0"),          /* CS1 */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 7)),  /* PC_EINT7
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 8),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* DQ7 */
>>>> +                 SUNXI_FUNCTION(0x3, "mmc2"),          /* D3 */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 8)),  /* PC_EINT8
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 9),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* DQ6 */
>>>> +                 SUNXI_FUNCTION(0x3, "mmc2"),          /* D4 */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 9)),  /* PC_EINT9
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 10),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* DQ5 */
>>>> +                 SUNXI_FUNCTION(0x3, "mmc2"),          /* D0 */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 10)), /*
>PC_EINT10 */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 11),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* DQ4 */
>>>> +                 SUNXI_FUNCTION(0x3, "mmc2"),          /* D5 */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 11)), /*
>PC_EINT11 */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 12),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* DQS */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 12)), /*
>PC_EINT12 */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 13),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* DQ3 */
>>>> +                 SUNXI_FUNCTION(0x3, "mmc2"),          /* D1 */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 13)), /*
>PC_EINT13 */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 14),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* DQ2 */
>>>> +                 SUNXI_FUNCTION(0x3, "mmc2"),          /* D6 */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 14)), /*
>PC_EINT14 */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 15),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* DQ1 */
>>>> +                 SUNXI_FUNCTION(0x3, "mmc2"),          /* D2 */
>>>> +                 SUNXI_FUNCTION(0x4, "spi0"),          /* WP */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 15)), /*
>PC_EINT15 */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 16),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "nand0"),         /* DQ0 */
>>>> +                 SUNXI_FUNCTION(0x3, "mmc2"),          /* D7 */
>>>> +                 SUNXI_FUNCTION(0x4, "spi0"),          /* HOLD */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 16)), /*
>PC_EINT16 */
>>>> +       /* Hole */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 0),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "mmc0"),          /* D1 */
>>>> +                 SUNXI_FUNCTION(0x3, "jtag"),          /* MS */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 0)),  /* PF_EINT0
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 1),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "mmc0"),          /* D0 */
>>>> +                 SUNXI_FUNCTION(0x3, "jtag"),          /* DI */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 1)),  /* PF_EINT1
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 2),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "mmc0"),          /* CLK */
>>>> +                 SUNXI_FUNCTION(0x3, "uart0"),         /* TX */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 2)),  /* PF_EINT2
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 3),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "mmc0"),          /* CMD */
>>>> +                 SUNXI_FUNCTION(0x3, "jtag"),          /* DO */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 3)),  /* PF_EINT3
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 4),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "mmc0"),          /* D3 */
>>>> +                 SUNXI_FUNCTION(0x3, "uart0"),         /* RX */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 4)),  /* PF_EINT4
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 5),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "mmc0"),          /* D2 */
>>>> +                 SUNXI_FUNCTION(0x3, "jtag"),          /* CK */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 5)),  /* PF_EINT5
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 6),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 6)),  /* PF_EINT6
>*/
>>>> +       /* Hole */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 0),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "mmc1"),          /* CLK */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 0)),  /* PG_EINT0
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 1),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "mmc1"),          /* CMD */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 1)),  /* PG_EINT1
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 2),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "mmc1"),          /* D0 */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 2)),  /* PG_EINT2
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 3),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "mmc1"),          /* D1 */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 3)),  /* PG_EINT3
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 4),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "mmc1"),          /* D2 */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 4)),  /* PG_EINT4
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 5),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "mmc1"),          /* D3 */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 5)),  /* PG_EINT5
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 6),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "uart1"),         /* TX */
>>>> +                 SUNXI_FUNCTION(0x4, "jtag"),          /* MS */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 6)),  /* PG_EINT6
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 7),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "uart1"),         /* RX */
>>>> +                 SUNXI_FUNCTION(0x4, "jtag"),          /* CK */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 7)),  /* PG_EINT7
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 8),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "uart1"),         /* RTS */
>>>> +                 SUNXI_FUNCTION(0x3, "clock"),         /*
>PLL_LOCK_DEBUG
>>>> */ +                 SUNXI_FUNCTION(0x4, "jtag"),          /* DO */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 8)),  /* PG_EINT8
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 9),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "uart1"),         /* CTS */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 9)),  /* PG_EINT9
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 10),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "h_i2s2"),        /* MCLK */
>>>> +                 SUNXI_FUNCTION(0x3, "clock"),         /* X32KFOUT
>*/
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 10)), /*
>PG_EINT10 */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 11),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "h_i2s2"),        /* BCLK */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 11)), /*
>PG_EINT11 */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 12),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "h_i2s2"),        /* SYNC */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 12)), /*
>PG_EINT12 */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 13),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "h_i2s2"),        /* DOUT */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 13)), /*
>PG_EINT13 */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 14),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "h_i2s2"),        /* DIN */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 14)), /*
>PG_EINT14 */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 15),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "uart2"),         /* TX */
>>>> +                 SUNXI_FUNCTION(0x5, "i2c4"),          /* SCK */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 15)), /*
>PG_EINT15 */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 16),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "uart2"),         /* TX */
>>>> +                 SUNXI_FUNCTION(0x5, "i2c4"),          /* SDA */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 16)), /*
>PG_EINT16 */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 17),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "uart2"),         /* RTS */
>>>> +                 SUNXI_FUNCTION(0x5, "i2c3"),          /* SCK */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 17)), /*
>PG_EINT17 */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 18),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "uart2"),         /* CTS */
>>>> +                 SUNXI_FUNCTION(0x5, "i2c3"),          /* SDA */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 18)), /*
>PG_EINT18 */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 19),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x4, "pwm1"),
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 19)), /*
>PG_EINT19 */
>>>> +       /* Hole */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 0),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "uart0"),         /* TX */
>>>> +                 SUNXI_FUNCTION(0x4, "pwm3"),
>>>> +                 SUNXI_FUNCTION(0x5, "i2c1"),          /* SCK */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 0)),  /* PH_EINT0
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "uart0"),         /* RX */
>>>> +                 SUNXI_FUNCTION(0x4, "pwm4"),
>>>> +                 SUNXI_FUNCTION(0x5, "i2c1"),          /* SDA */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 1)),  /* PH_EINT1
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "uart5"),         /* TX */
>>>> +                 SUNXI_FUNCTION(0x3, "spdif"),         /* MCLK */
>>>> +                 SUNXI_FUNCTION(0x4, "pwm2"),
>>>> +                 SUNXI_FUNCTION(0x5, "i2c2"),          /* SCK */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 2)),  /* PH_EINT2
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "uart5"),         /* RX */
>>>> +                 SUNXI_FUNCTION(0x4, "pwm1"),
>>>> +                 SUNXI_FUNCTION(0x5, "i2c2"),          /* SDA */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 3)),  /* PH_EINT3
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x3, "spdif"),         /* OUT */
>>>> +                 SUNXI_FUNCTION(0x5, "i2c3"),          /* SCK */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 4)),  /* PH_EINT4
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "uart2"),         /* TX */
>>>> +                 SUNXI_FUNCTION(0x3, "h_i2s3"),        /* MCLK */
>>>> +                 SUNXI_FUNCTION(0x4, "spi1"),          /* CS0 */
>>>> +                 SUNXI_FUNCTION(0x5, "i2c3"),          /* SDA */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 5)),  /* PH_EINT5
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "uart2"),         /* RX */
>>>> +                 SUNXI_FUNCTION(0x3, "h_i2s3"),        /* BCLK */
>>>> +                 SUNXI_FUNCTION(0x4, "spi1"),          /* CLK */
>>>> +                 SUNXI_FUNCTION(0x5, "i2c4"),          /* SCK */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 6)),  /* PH_EINT6
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "uart2"),         /* RTS */
>>>> +                 SUNXI_FUNCTION(0x3, "h_i2s3"),        /* SYNC */
>>>> +                 SUNXI_FUNCTION(0x4, "spi1"),          /* MOSI */
>>>> +                 SUNXI_FUNCTION(0x5, "i2c4"),          /* SDA */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 7)),  /* PH_EINT7
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "uart2"),         /* CTS */
>>>> +                 SUNXI_FUNCTION(0x3, "h_i2s3"),        /* DO0 */
>>>> +                 SUNXI_FUNCTION(0x4, "spi1"),          /* MISO */
>>>> +                 SUNXI_FUNCTION(0x5, "h_i2s3"),        /* DI1 */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 8)),  /* PH_EINT8
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 9),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x3, "h_i2s3"),        /* DI0 */
>>>> +                 SUNXI_FUNCTION(0x4, "spi1"),          /* CS1 */
>>>> +                 SUNXI_FUNCTION(0x3, "h_i2s3"),        /* DO1 */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 9)),  /* PH_EINT9
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x3, "ir_rx"),
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 10)), /*
>PH_EINT10 */
>>>> +       /* Hole */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 0),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ERXD3 */
>>>> +                 SUNXI_FUNCTION(0x3, "dmic"),          /* CLK */
>>>> +                 SUNXI_FUNCTION(0x4, "h_i2s0"),        /* MCLK */
>>>> +                 SUNXI_FUNCTION(0x5, "hdmi"),          /* HSCL */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 0)),  /* PI_EINT0
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 1),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ERXD2 */
>>>> +                 SUNXI_FUNCTION(0x3, "dmic"),          /* DATA0 */
>>>> +                 SUNXI_FUNCTION(0x4, "h_i2s0"),        /* BCLK */
>>>> +                 SUNXI_FUNCTION(0x5, "hdmi"),          /* HSDA */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 1)),  /* PI_EINT1
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 2),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ERXD1 */
>>>> +                 SUNXI_FUNCTION(0x3, "dmic"),          /* DATA1 */
>>>> +                 SUNXI_FUNCTION(0x4, "h_i2s0"),        /* SYNC */
>>>> +                 SUNXI_FUNCTION(0x5, "hdmi"),          /* HCEC */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 2)),  /* PI_EINT2
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 3),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ERXD0 */
>>>> +                 SUNXI_FUNCTION(0x3, "dmic"),          /* DATA2 */
>>>> +                 SUNXI_FUNCTION(0x4, "h_i2s0"),        /* DO0 */
>>>> +                 SUNXI_FUNCTION(0x5, "h_i2s0"),        /* DI1 */
>>>
>>> The same string is used for 2 muxes=2E
>>> I think we should drop one for the moment or introduce a new string=2E
>>>
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 3)),  /* PI_EINT3
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 4),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ERXCK */
>>>> +                 SUNXI_FUNCTION(0x3, "dmic"),          /* DATA3 */
>>>> +                 SUNXI_FUNCTION(0x4, "h_i2s0"),        /* DI0 */
>>>> +                 SUNXI_FUNCTION(0x5, "h_i2s0"),        /* DO1 */
>>>
>>> Same here
>>>
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 4)),  /* PI_EINT4
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 5),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ERXCTL
>*/
>>>> +                 SUNXI_FUNCTION(0x3, "uart2"),         /* TX */
>>>> +                 SUNXI_FUNCTION(0x4, "ts0"),           /* CLK */
>>>> +                 SUNXI_FUNCTION(0x5, "i2c0"),          /* SCK */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 5)),  /* PI_EINT5
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 6),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ENULL */
>>>> +                 SUNXI_FUNCTION(0x3, "uart2"),         /* RX */
>>>> +                 SUNXI_FUNCTION(0x4, "ts0"),           /* ERR */
>>>> +                 SUNXI_FUNCTION(0x5, "i2c0"),          /* SDA */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 6)),  /* PI_EINT6
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 7),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ETXD3 */
>>>> +                 SUNXI_FUNCTION(0x3, "uart2"),         /* RTS */
>>>> +                 SUNXI_FUNCTION(0x4, "ts0"),           /* SYNC */
>>>> +                 SUNXI_FUNCTION(0x5, "i2c1"),          /* SCK */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 7)),  /* PI_EINT7
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 8),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ETXD2 */
>>>> +                 SUNXI_FUNCTION(0x3, "uart2"),         /* CTS */
>>>> +                 SUNXI_FUNCTION(0x4, "ts0"),           /* DVLD */
>>>> +                 SUNXI_FUNCTION(0x5, "i2c1"),          /* SDA */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 8)),  /* PI_EINT8
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 9),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ETXD1 */
>>>> +                 SUNXI_FUNCTION(0x3, "uart3"),         /* TX */
>>>> +                 SUNXI_FUNCTION(0x4, "ts0"),           /* D0 */
>>>> +                 SUNXI_FUNCTION(0x5, "i2c2"),          /* SCK */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 9)),  /* PI_EINT9
>*/
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 10),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ETXD0 */
>>>> +                 SUNXI_FUNCTION(0x3, "uart3"),         /* RX */
>>>> +                 SUNXI_FUNCTION(0x4, "ts0"),           /* D1 */
>>>> +                 SUNXI_FUNCTION(0x5, "i2c2"),          /* SDA */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 10)), /*
>PI_EINT10 */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 11),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ETXCK */
>>>> +                 SUNXI_FUNCTION(0x3, "uart3"),         /* RTS */
>>>> +                 SUNXI_FUNCTION(0x4, "ts0"),           /* D2 */
>>>> +                 SUNXI_FUNCTION(0x5, "pwm1"),
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 11)), /*
>PI_EINT11 */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 12),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ETXCTL
>*/
>>>> +                 SUNXI_FUNCTION(0x3, "uart3"),         /* CTS */
>>>> +                 SUNXI_FUNCTION(0x4, "ts0"),           /* D3 */
>>>> +                 SUNXI_FUNCTION(0x5, "pwm2"),
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 12)), /*
>PI_EINT12 */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 13),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* ECLKIN
>*/
>>>> +                 SUNXI_FUNCTION(0x3, "uart4"),         /* TX */
>>>> +                 SUNXI_FUNCTION(0x4, "ts0"),           /* D4 */
>>>> +                 SUNXI_FUNCTION(0x5, "pwm3"),
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 13)), /*
>PI_EINT13 */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 14),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* MDC */
>>>> +                 SUNXI_FUNCTION(0x3, "uart4"),         /* RX */
>>>> +                 SUNXI_FUNCTION(0x4, "ts0"),           /* D5 */
>>>> +                 SUNXI_FUNCTION(0x5, "pwm4"),
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 14)), /*
>PI_EINT14 */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 15),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* MDIO */
>>>> +                 SUNXI_FUNCTION(0x3, "uart4"),         /* RTS */
>>>> +                 SUNXI_FUNCTION(0x4, "ts0"),           /* D6 */
>>>> +                 SUNXI_FUNCTION(0x5, "clock"),         /*
>CLK_FANOUT0 */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 15)), /*
>PI_EINT15 */
>>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 16),
>>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>>> +                 SUNXI_FUNCTION(0x2, "emac0"),         /* EPHY_CLK
>*/
>>>> +                 SUNXI_FUNCTION(0x3, "uart4"),         /* CTS */
>>>> +                 SUNXI_FUNCTION(0x4, "ts0"),           /* D7 */
>>>> +                 SUNXI_FUNCTION(0x5, "clock"),         /*
>CLK_FANOUT1 */
>>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 16)), /*
>PI_EINT16 */
>>>> +};
>>>> +static const unsigned int h616_irq_bank_map[] =3D { 2, 5, 6, 7, 8 };
>>>
>>> The BSP driver seems to have more than 5 IRQ Banks=2E
>>>
>>> static const unsigned sun50iw9p1_irq_bank_base[] =3D {
>>> SUNXI_PIO_BANK_BASE(PA_BASE, 0),
>>> SUNXI_PIO_BANK_BASE(PC_BASE, 1),
>>> SUNXI_PIO_BANK_BASE(PD_BASE, 2),
>>> SUNXI_PIO_BANK_BASE(PE_BASE, 3),
>>> SUNXI_PIO_BANK_BASE(PF_BASE, 4),
>>> SUNXI_PIO_BANK_BASE(PG_BASE, 5),
>>> SUNXI_PIO_BANK_BASE(PH_BASE, 6),
>>> SUNXI_PIO_BANK_BASE(PI_BASE, 7),
>>> };
>>>
>>> So maybe it should be somethings like this:
>>> static const unsigned int h616_irq_bank_map[] =3D { 0, 2, 3, 4, 5, 6,
>7, 8 };
>>=20
>> While that's true, I don't see a need for IRQ bank on port A - this
>port is=20
>> internal (not exposed on pins) and none of the functionality on that
>port=20
>> needs IRQ=2E
>
>I agree here, since port A isn't even mentioned in the manual (neither

I think if we ignore it we have the risk of DT binding issues
when we need to add it afterwards=2E

>is PortD or PortE), I would refrain from listing it here prematurely=2E
>Plus we actually don't know their interrupt numbers: the manual only
>mentions GPIOE on top of the already listed interrupts=2E
>
>The interrupts work by their index, so skipping ports is not an issue=2E
>I
>just tested the PIO interrupt on PortC, and it works=2E
>
>Cheers,
>Andre
>
>>>
>>>> +
>>>> +static const struct sunxi_pinctrl_desc h616_pinctrl_data =3D {
>>>> +       =2Epins =3D h616_pins,
>>>> +       =2Enpins =3D ARRAY_SIZE(h616_pins),
>>>> +       =2Eirq_banks =3D 5,
>>>
>>>  =2Eirq_banks =3D ARAY_SIZE(h616_irq_bank_map) is better no ?
>>>
>>>> +       =2Eirq_bank_map =3D h616_irq_bank_map,
>>>> +       =2Eirq_read_needs_mux =3D true,
>>>> +       =2Eio_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
>>>> +};
>>>> +
>>>> +static int h616_pinctrl_probe(struct platform_device *pdev)
>>>> +{
>>>> +       return sunxi_pinctrl_init(pdev,
>>>> +                                 &h616_pinctrl_data);
>>>> +}
>>>> +
>>>> +static const struct of_device_id h616_pinctrl_match[] =3D {
>>>> +       { =2Ecompatible =3D "allwinner,sun50i-h616-pinctrl", },
>>>
>>> This is a new compatible and should be documented=2E
>>>
>>> Regards,
>>> Clement
>>>
>>>> +       {}
>>>> +};
>>>> +
>>>> +static struct platform_driver h616_pinctrl_driver =3D {
>>>> +       =2Eprobe  =3D h616_pinctrl_probe,
>>>> +       =2Edriver =3D {
>>>> +               =2Ename           =3D "sun50i-h616-pinctrl",
>>>> +               =2Eof_match_table =3D h616_pinctrl_match,
>>>> +       },
>>>> +};
>>>> +builtin_platform_driver(h616_pinctrl_driver);
>>>> --
>>>> 2=2E17=2E5
>>>>
>>>> --

