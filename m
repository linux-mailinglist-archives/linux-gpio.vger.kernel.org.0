Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9580438B55
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 20:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbhJXSTv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 14:19:51 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:41731 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbhJXSTv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 14:19:51 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MEFnR-1mUVJN2Smb-00AGJf; Sun, 24 Oct 2021 20:17:28 +0200
Received: by mail-wr1-f46.google.com with SMTP id d3so4293198wrh.8;
        Sun, 24 Oct 2021 11:17:28 -0700 (PDT)
X-Gm-Message-State: AOAM531GPGGgVsvId6o3tNXWVuDMJY/klEFxlCZFFcFV8U30XvOXE2ZK
        9Zs/41seGiJMT0azw68wMxYI5OsjOm65H7itICo=
X-Google-Smtp-Source: ABdhPJwA4yx55xXPjGdoweMWLIzjsgLLmIyhDfO5RJ81PIjOMOGnfiDjEbR4fO6wCEdBYAYuSOM2cYFl2DdATduylko=
X-Received: by 2002:a05:6000:18c7:: with SMTP id w7mr16559015wrq.411.1635099448118;
 Sun, 24 Oct 2021 11:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com> <20211024154027.1479261-13-Mr.Bossman075@gmail.com>
In-Reply-To: <20211024154027.1479261-13-Mr.Bossman075@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sun, 24 Oct 2021 20:17:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1aZ-LMANnvcr4XX=uTbut78yL=48E8iLHr3AFgVqpi+g@mail.gmail.com>
Message-ID: <CAK8P3a1aZ-LMANnvcr4XX=uTbut78yL=48E8iLHr3AFgVqpi+g@mail.gmail.com>
Subject: Re: [PATCH 12/13] ARM: dts: imx: add i.MXRT1050-EVK support
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
        Leonard Crestez <leonard.crestez@nxp.com>,
        b20788@freescale.com, Andy Duan <fugang.duan@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:vp3kZKeUmESK+1XWJrXM8FvK63w1mlDQk+fQX6bD9XAxOeRYYD5
 7qc2Fi0ruvuVrm6uHmgeuroh2/Qaq+JZ77Kn7jXWPw5V/PcOska9ScrRsNHkN8a2q3LsecH
 2wkzvDNiWVutyKkHlw08xCHL1uknETekmU2eRryi3DLgPd3zrkJIJcLy9nxN+V5Gx4ekQik
 wm/3ij7dHNXL1DQRnW4Ew==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bHIj7tZfXGE=:aAKiZe9ob+1NvGxt9Ug04K
 dT11Up/i6Se539tgsw9yTgKzt54eqJfV9mWj14qCsACuL6S6IL7VjYU7O2PFJ57q1uRbDgpkq
 f6DmhyeB3jmq1mq8j2PzVY2d0lc9Q8bIAfIxF8MbngcU63+zDMWXMZdKWRzh51OJ8pCwyal22
 QgbD2Euu/9P+wmYnY60fdxBuYguUg9F+zfcMujmufLjV7pM0rky0elbXV1DsmVcxqYonX3jrz
 Jrf9sgpg2qI9/+nethUg0lkTJ3x1+l6yc+C+glXPUyTFSUuHmLvpCJA9iPIEOyyIdtYBi7npu
 Vp2P8AJwb65ZepdvREPWlGEiqO2L9fNs2Mdo3qrbHXlWJkoYIYyHXPY8NjsW/FcZnGaLOVtC+
 7vdwfeWxjyFbHTk3usqCnNeABpNzvyD8jKwd6dBA/9bKSNhicnvS6tF5DwrHZaWp85fqHIX08
 D0+mw8ZarbXAIyysaXZCjdhqWJtxOV6Q3eHe1nOwpEGlzW36reAee4nBtJ+R0HHVvxDeMshFX
 Tg4E9XwtswH0uPRiU48z/nSBU56HpkXTwF5fkvXnXWuub/2ct7imdCrOdYzdZX8MsDzan8P9B
 s7FiskBIzzSNqARn/rpHdEwGhy9C80jN4DcImwbuCKB5pTFmmupiKgPBnF1GSZO/kWrEg8ag0
 c4vZCviAM15t7Hj1dwy/0i72Q1oxLUXaelqIbfOXdQsM1CvqBC0/na/Il0/JBuyd4zjM7P61x
 J3jxqqg+mwyVIOgEzxI0fLjwJ6Q0O75gWBobuOGS+65ZVKrktRtUYNyMWsoX3vKrqmWTERMRz
 zY7ID/ilJnaqqVh/C/FzWJZyj1R0fWRAu/hz/2VNCFjvJP2arI=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 24, 2021 at 5:40 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> +               pinctrl_semc: semcgrp {
> +                       fsl,pins = <

This node doesn't appear to be referenced from anywhere. Is it actually needed?

> +
> +/ {
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +
> +       aliases {
> +               gpio0 = &gpio1;
> +               gpio1 = &gpio2;
> +               gpio2 = &gpio3;
> +               gpio3 = &gpio4;
> +               gpio4 = &gpio5;
> +               mmc0 = &usdhc1;
> +               serial0 = &lpuart1;
> +       };

The aliases should go into the .dts file.

> +               edma1: dma-controller@400E8000 {
> +                       #dma-cells = <2>;
> +                       compatible = "fsl,imx7ulp-edma";
> +                       reg = <0x400E8000 0x4000>,
> +                               <0x400EC000 0x4000>;

Use lowercase letters in hex numbers here.

        Arnd
