Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D979222A0C8
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 22:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732946AbgGVUdB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 16:33:01 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:33499 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732944AbgGVUdA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 16:33:00 -0400
Received: from mail-qt1-f179.google.com ([209.85.160.179]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MdwRi-1kZ3cK3f42-00b24j; Wed, 22 Jul 2020 22:32:59 +0200
Received: by mail-qt1-f179.google.com with SMTP id s16so2855067qtn.7;
        Wed, 22 Jul 2020 13:32:58 -0700 (PDT)
X-Gm-Message-State: AOAM530Z+bxJV/3VTX0l/CELmsIow/mdXCM0L+mWpelLtVD0z5O0SM4P
        wSHm0MD5FfejRnIP06vE0+B2/5/vBF2S7h5I9So=
X-Google-Smtp-Source: ABdhPJz7qCwl199ceVBeakAKIXlC2KGHzaN4T30wS+r6H8SRwHBhlTecZSvjjgYXYoEJpQAkag6kBfpffToe30BE4FU=
X-Received: by 2002:ac8:7587:: with SMTP id s7mr1188116qtq.304.1595449977474;
 Wed, 22 Jul 2020 13:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200615133242.24911-1-lars.povlsen@microchip.com>
In-Reply-To: <20200615133242.24911-1-lars.povlsen@microchip.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 22 Jul 2020 22:32:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1VGsMFfqaMXA2n49F84MYR5eYWvPT-sMHK1XYGGnNB0A@mail.gmail.com>
Message-ID: <CAK8P3a1VGsMFfqaMXA2n49F84MYR5eYWvPT-sMHK1XYGGnNB0A@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] Adding support for Microchip Sparx5 SoC
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     SoC Team <soc@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        Michael Turquette <mturquette@baylibre.com>,
        DTML <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:dANfnZAZBysQ3Ar2MBWgKmGQ/lPpdgAnCAwDK3+uSV+wr14L3yO
 ME8yR+Z6cbnP/PFBkdLfzBZ+IFWny0R3r8GmnKY8w1qxrS2q0hS8d5mVyAg31TnCJuUKUcS
 S2T3164pY99tDMktdtHUl6P+HJ/jDLTjRZ3iL8Se/pAlhIhzfzHX8hcopd9DrKTlQVGLU8q
 YUL7wo1PzJyCHmL5Vx7Iw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:F0Y9TxNRR84=:y+uhsoMlotktFVRF1glGlq
 fpHGg0WhMjqGtItTeERkAYydjlDvI3n2M0BJLSazTqF0KlS4V+MhqdXTYFTgUzhELCPcVJHLJ
 iYWcJEV6IfsFv0xiVJVO+AFI6naijtEFsyb94W3aRqh70Ycpu63tiLNl+qYSDIskhK49Mzwac
 H6/TX6jQ9uW8tDek0Uw4BwH8Mcj6uA5dXFWe3fNLdVmM0jLQwRKJa10e0p/dVemrN/3mgay+p
 QV35WYTOMz1NDln7ye6YRsDdDhZoHeQ6vULMQMHXMLdMAVeizhd83S09D/2esa2KCJ/zRkFYJ
 /z0+IdhOLUtRUlZ2swYMkYZ6REbK3GopXilkf7IFmeLyzUdHHuz/oUup+wYUt7AFd9zEx3zwv
 MnqMDoy3EE7gOSVDCBtrp3ye9qM6psbtzHMADfrma9Gh0MnyskoTIc1MI2UvzDJb4FFV3y7Qg
 xF2Aghlv4gnWhJ3YMvCsRqIbUgYwwjVCErg5IqM2HtqmT+GPt9CBBunWoPxeglio/zMrmlUog
 LPynMcJqPGOX79Xt4lr5/XXTp8IBzb6+5b1BGV/8z+dkEvN8/Uowm6O2BxMSGxYVoffDi77m3
 WII1xJPw66hN/LHLSSdaQvh/XKECFZowmx9BEPJ0D/lAhMwTeXeVG5ryPeLsQv69vmTSCgpDn
 hJFAteDlmsf4XojPdTm/ol38k94SGkTUK9kQ9mPnlF8+fh6HUAjvkB8G1+s7vFhe2esOsz4Rs
 Kqlop7hxgBOH6uU62ADD1Iar3snlDoULcYtsM+2SNfX79WWJFNcq613jHVxSxSF4poMEt3wUC
 OMvU4U+ykKkRdlh2RPwd6xbdXfhXAKfSqEzXbtgXRIn7f/RzBHWbTHAO33yvEU9RjTC8AUsbR
 dnRnno6q5U2EQxGkSf4npkYrzhqkgFIzC6uLksNK7qD69ncPxwPEOqVp1Tnn5oLC8z2qQX8Nb
 SI4L7iUYB2Ah9s5KF3sIqzVXC4Lm/w7i2l2tRc6ZfVeQ65ieif8Km
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 15, 2020 at 3:33 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>
> This patch series adds support for Microchip Sparx5 SoC, the CPU
> system of a advanced, TSN capable gigabit switch. The CPU is an armv8
> x 2 CPU core (A53).
>
> Although this is an ARM core, it shares some peripherals with the
> Microsemi Ocelot MIPS SoC.

I've picked up this version of the series into an arm/newsoc branch in
the soc tree,
except for the pinctrl patch that Linus Walleij already merged.

I see you still have a few pending patches for other subsystems (spi, mmc)
and I'm not sure what the status is for those and am dropping them for the
moment.

Once the bindings are accepted by the respective subsystem maintainers,
please send any remaining DT patches as a follow-up to what I've already
merged.

      Arnd
