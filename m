Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5A1476D21
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 10:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235102AbhLPJNy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Dec 2021 04:13:54 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:59039 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235085AbhLPJNy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Dec 2021 04:13:54 -0500
Received: from mail-ed1-f42.google.com ([209.85.208.42]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N8GdE-1mTFMO1l9E-014CRe; Thu, 16 Dec 2021 10:13:52 +0100
Received: by mail-ed1-f42.google.com with SMTP id x15so85404649edv.1;
        Thu, 16 Dec 2021 01:13:52 -0800 (PST)
X-Gm-Message-State: AOAM533Hn0yGgxJKC7vQNhn3WMbEGJb/Ztc5xNGqOhohsMr+uojVUJuX
        fH5OnEWhVsUB25EY6rlaBQt/ii547xKMntQb3v4=
X-Google-Smtp-Source: ABdhPJyiLKlnSiH9vlPQZqdh0l7qGixC2KbAXZ0E4zRdJ5+BDdSdAxMn6Pdgjctlm5ImC6il7N2keNj/IR12pl1ESbs=
X-Received: by 2002:a05:6000:1aca:: with SMTP id i10mr8136773wry.407.1639643196246;
 Thu, 16 Dec 2021 00:26:36 -0800 (PST)
MIME-Version: 1.0
References: <20211215220538.4180616-1-Mr.Bossman075@gmail.com>
In-Reply-To: <20211215220538.4180616-1-Mr.Bossman075@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 16 Dec 2021 09:26:20 +0100
X-Gmail-Original-Message-ID: <CAK8P3a29tzgd_4WncippZBEJra9n0bQTysBkPBp_WA0sb28gTg@mail.gmail.com>
Message-ID: <CAK8P3a29tzgd_4WncippZBEJra9n0bQTysBkPBp_WA0sb28gTg@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Add initial support for the i.MXRTxxxx SoC family
 starting from i.IMXRT1050 SoC.
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        gregkh <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        SoC Team <soc@kernel.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Abel Vesa <abel.vesa@nxp.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        giulio.benetti@benettiengineering.com,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        linux-clk <linux-clk@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:boYRwNGGtvS6Ogv172avdBzLiox4MOw/C3OExYzNV0pJAzxljbt
 dWDHK2Jwxh4rulkjr4Ru4L4jEub8P8YvZ5AqmccoITdbtavkOosRTO9XLAsq4lOZ3EgxghG
 6jiwbnYPi6pGnOzYs3Bofch1CFBb7SsFoEm+ZaJS61dFK+hay1i4YX0Schwy+m9mJHAu+MA
 26KTclVsPUNtvwXI6UJjw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/LHzhLCMwi4=:nxX2ISmR3ZcS545kCXvj/v
 pRhgYgH3wHetMOc9NekfHh/X6enGLE8oa1iILMv/ZZftppdM9YQam1p3TtxVOcuYoqKwvXGbn
 CLeqzI8WjF4giBf0CiYsOS559YNo9GwvGPZxDPv0Tkppo+24vIIlkUJX3GOq8uU1t4Yy0ThSx
 VKPmzMvoVVQyDa88KWXgIe1dPxS02W/KOgZM/9Ze99Dqn6V8HiJHhMYt0qHW+mh1yylGRg/04
 4wlWHqT4kCa/uKSjVWvSK+Wuw36Uxi5Ex0ywtqYPBZRrqJ8PEuJSOVi0NwnQq4+EYMqQNpnc/
 EGvWojcFGPi9h0+Y8ZynH6JcXQHAYouLCfBfvOwUFmPOKLXkegadqfmY3ff/7GlL5EZhgE+A5
 snjCSLicUvlO8M9m0yhlSiD/x0Obj6FZaRgMbZUlTOpYycNxtRkK28An9BXzCe9J6dwYl18P3
 wT9LPTXykPuCJcxpc+zFquULGhjCLpcQPuciLOdsb1Kdip4UCjwMyncNTHYk8JtadksozBPGh
 RM+PpyLvyJfHRJDwMNcA48ZyOt4AA/QsJYBVe4zAxLxjLi66tLnhnVqFJWcovnQtzTs5gY9/z
 z2Wn7+QWUrIn8cjsoSJTEm9P72O4RHcz+AhQ7xk15/fc/vFSANV2X4YbVZ0T+wHF184Rggcq7
 W5nOZTVWE0Dlr23qygrIBEA27rwrwfDGrnlnfEkJTZtr+gGhz6a7a2te6V6mQnGjsctskKykW
 x1GGSqAmlGQzhKH9HPp1peDHwpecV96Q1vjf4CH+AKThkSi8/ry3Fj8B+I9tmRVCEwDVf5Wsa
 +xqXomH5lH3lsYUYVFADFUSZ9QwmlKhFnjIHeGe9TGvrqS5YFo=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 15, 2021 at 11:05 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
>
> This patchset contains:
> - i.MXRT10xx family infrastructure
> - i.MXRT1050 pinctrl driver adaption
> - i.MXRT1050 clock driver adaption
> - i.MXRT1050 sd-card driver adaption
> - i.MXRT1050 uart driver adaption
> - i.MXRT1050-evk basic support
>
> The i.MXRTxxxx family that could have support by Linux actually spreads
> from i.MXRT1020 to i.MXRT1170 with the first one supporting 1 USB OTG &
> 100M ethernet with a cortex-M7@500Mhz up to the latter with i.MXRT1170
> with cortex-M7@1Ghz and cortex-M4@400Mhz, 2MB of internal SRAM, 2D GPU,
> 2x 1Gb and 1x 100Mb ENET. The i.MXRT family is NXP's answer to
> STM32F7XX, as it uses only simple SDRAM, it gives the chance of a 4 or
> less layer PCBs. Seeing that these chips are comparable to the
> STM32F7XXs which have linux ported to them it seems reasonable to add
> support for them.
>
> Giving Linux support to this family should ease the development process,
> instead of using a RTOS they could use Embedded Linux allowing for more
> portability, ease of design and will broaden the scope of people using
> embedded linux.
>
> The EVK has very little SDRAM, generally 32MB starting from
> i.MXRT1020(the lowest P/N), although the i.MXRT1160/70 provide instead
> 64MB of SDRAM for more functionality.
>
> At the moment we do not support XIP for either u-boot or Linux but it
> should be done in the future. XIP will also save SDRAM.
>
> Another interesting fact is the amount of internal SRAM, as the P/N
> increases the SRAM will reach up to 2MB(some could be for cache and
> some would be for video).
>
> Also, some parts have embed flash of 4MB that can be used for
> u-boot/Linux, if both correctly sized it will leave the SDRAM free.
>
> External flash can be Quad SPI and HyperFlash, so throughput would be
> decent.
>
> The i.MXRT11xx series supports MIPI interface too.
>
> The family in general provide CAN bus, audio I/O, 1 or more
> USB(otg/host), 1 or more 100Mb/1Gb ethernet, camera interface, sd-card.
>
> All this can be used for simple GUIs, web-servers, point-of-sale
> stations, etc.

This looks all good to me now, but the drivers need to be reviewed by the
respective subsystem maintainers before we can merge it into the soc
tree. As with other new SoCs, I'm happy to merge the support as a combined
pull request that includes the drivers provided that the driver subsystem
maintainers have reviewed them.

Ideally the i.MX maintainers would pick up your series into a separate
branch and send that to soc@kernel.org the same way as the other topic
branches that are usually split out between DT, drivers, soc code etc.

With the Christmas break coming up, the timing may not be sufficient
before I'm off next week, so it may end up too late for 5.17 but should
be fine for 5.18.

As a more general comment, it's always nice to see newly added SoC
platforms, especially when they are this well implemented and done
by hobbyists. However, I do think you are being overly optimistic
as to how useful this is going to be to other people: interest in NOMMU
ARM platforms has dropped a lot over the past 5 years, and as far as I
can tell, it is only being kept alive for existing stm32 customers
as the economics do not favor Linux on Cortex-M for new products
compare to Linux on Cortex-A or some RTOS on Cortex-M.

The existing users will inevitably stop updating their kernels at some
point, and then it's most likely just you and Vladimir Murzin that care.

       Arnd
