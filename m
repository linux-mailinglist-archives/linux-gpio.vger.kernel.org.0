Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 942911DCACE
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2020 12:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbgEUKQa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 May 2020 06:16:30 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:36607 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728030AbgEUKQ3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 May 2020 06:16:29 -0400
Received: from mail-qk1-f177.google.com ([209.85.222.177]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MYe6H-1jWzOK1H0t-00VkSJ; Thu, 21 May 2020 12:16:27 +0200
Received: by mail-qk1-f177.google.com with SMTP id i14so6600881qka.10;
        Thu, 21 May 2020 03:16:26 -0700 (PDT)
X-Gm-Message-State: AOAM530DifCmGMR7y9BEpyEIqVzhQugXIb8cf7wNozVDCSJKD03eOxtQ
        hTwja+7TnyKyfRF31GnkdzzkC2BJshtG/9O4FSo=
X-Google-Smtp-Source: ABdhPJzG0yZLoO02lBv/GjHkHvx0xY0LzpxpTesxhUjbNmnX8hm9pN92rchECm8L89+atAf/Z7jq0U8pXKnfGDJcMoo=
X-Received: by 2002:a37:434b:: with SMTP id q72mr9600780qka.352.1590056185859;
 Thu, 21 May 2020 03:16:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200513125532.24585-1-lars.povlsen@microchip.com>
In-Reply-To: <20200513125532.24585-1-lars.povlsen@microchip.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 21 May 2020 12:16:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0wYbVcerL9OEfAs+jJ-9xR7ryZwmsvi4Kt4yXOHaNefw@mail.gmail.com>
Message-ID: <CAK8P3a0wYbVcerL9OEfAs+jJ-9xR7ryZwmsvi4Kt4yXOHaNefw@mail.gmail.com>
Subject: Re: [PATCH 00/14] Adding support for Microchip Sparx5 SoC
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
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:mu+e+kbYTEnKpI2tlcVsOeSxZO5G1rR6VAhSMX0JEEfW+3f9d/I
 UjAUyLgeyHw7AgZuSEDfn5BL2g23N+YkjbFG2fPieOPyPuaoRiuWMYanrBmZjZcTZ6NI52L
 jYDQHGLLLIXBSrXw1Tm0pmP5+LQKJXaNS+BOU4CRmtdCiJy4peqV4UZTGNbTNp07paoERlT
 PoxtjQUUtxmv1GgJsP+qQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KTa0gpbTUK0=:xKT6TgWW7YqukhFqwtI4+h
 AngOvVkzdZFoEEv8uJGKiYdRPWBNZ+HlLeh23V0ldjsORekLJLyGsb1cuIypaB1Pi0QkTbX5a
 yr+c2KsipfGniVhCVIFWq3VbyUpBX1kT5jf7+tzTNZTkEZKXDwoajtAlDMkZN1aq1h4ywIUVz
 6WausWDDBZjVSwWuYPf4hI5PP+qHOm2Qbb5pZBzc0AyIFv6RaxfiEIOf2COVV9D1wDrBF4IHM
 0ULshmunA3BhrfgKam0Q3GCeyDvr40PJA5EI0wiEW9ran+JP0UuiJKe6PcRcdfvvw3PqtWpPv
 hUAh6qChjvsqzPZx0Qpp703X7xe2UbDU2zHP9F10EH8If26ayMNUs0/vV4RHpk/SLqD/m0oHU
 pSJ80QRC8mHCGzPnTtQg/Hej7Ivym+sCuXR23zYnPnJUvzjbwHFq6F6OJ0bqELl37iO/u5eHC
 T5yYr3z3UbtJlcoXw9AD9vuDLNo5sIhWdN1N8VP5v/aQJJT7aZR4w1JRCix0JeDZTC3396a+5
 4MtySEzaru1mYcmowAv59Tk6CPqzK273nD2R1aMJ49X7LpCaiKLKQmi0eP3YYc3wR8DRnk4WE
 MVdy+BkA12Ji+XhLPBmltGm/emcCmafrXu4pg3Ms2fm08I93Zrbjm9feksSIHrCd+wOi2S8du
 O4/459gpWBoW/5Y5rSVWPrY2Jru/q368v0ClrgfEsuSvoPzyNeFgGFCdUDR4yMo80z53xNjIf
 JjIfiG6MazCkZ3h+De66rig97e9yhY5idWfKP9h4ioaYz9htVaoyervOd6W/H30V/suzQva4R
 /5IZ9dTnDaSPQ75WXm3scgBsVLmkhd0VyB5WJrnF2mjDJKeWmQ=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 13, 2020 at 2:55 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>
> This patch series adds support for Microchip Sparx5 SoC, the CPU
> system of a advanced, TSN capable gigabit switch. The CPU is an armv8
> x 2 CPU core (A53).
>
> Although this is an ARM core, it shares some peripherals with the
> Microsemi Ocelot SoC.
>
> This is the first official revision of the series.

I see you sent multiple series to soc@kernel.org for review. This is the
correct address for getting the initial soc support merged, but as the patches
are still being reviewed by subsystem maintainers, please leave it off
for now, until you are confident that they are ready to get merged for the
following merge window and have received the appropriate Acks.

For each subsystem, there is generally the choice between merging
code through the subsystem maintainer tree, or through the soc tree
on an initial submission, as going through multiple trees is particularly
hard to do for the devicetree files.

For the moment, I have marked all sparx5 patches as "Not Applicable"
in patchwork at https://patchwork.kernel.org/project/linux-soc/list/
as it is still unclear who is merging which parts, and they are under
active review, but please do send them again after the review is
complete.

If you have a lot of patches, sending pull requests is sometimes easier,
but it also takes a bit of practice to know how exactly to structure
those. Let me know if you have questions about them. You an also
contact me and most of the other maintainers on IRC using the
#armlinux channel on irc.freenode.net.

Sorry for not having been able to review the patches myself yet, I
hope to get to that soon.

     Arnd
