Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBD7A458FE1
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Nov 2021 15:02:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239640AbhKVOFn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Nov 2021 09:05:43 -0500
Received: from mail-pl1-f172.google.com ([209.85.214.172]:46927 "EHLO
        mail-pl1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235758AbhKVOFk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Nov 2021 09:05:40 -0500
Received: by mail-pl1-f172.google.com with SMTP id p18so14133024plf.13;
        Mon, 22 Nov 2021 06:02:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CXsdV198ETc5Z4b8HkqNnBSItnEYeGqb45DkswhRR10=;
        b=WZBO/+4G87fwunZkL6rLQfoGToadsvp6dysubkqOVwe/9wZWZoAGnpzDi8lFJKksJX
         XLw2u9LqQDxOzzoH/SB5TK3BpKMmlAIGhIh0MaNHN7y5jSKUAB2CB9cfMS6dJuOtps9w
         50Nz6S+s+af4Upkyvut3CVr8rxjUKcRDW7hqsPD70FvYbMQ7w3fQHsk2fOIZx6wxnWL5
         xr14Rn1w+KigD5c5K5nyIYqp2n6+wjIHhjMwmBJvz8v9x6CU/1gAX2IBuqf4FO/w25Vk
         VareCbCblrFy7rfQUOulVwPyJxr8ZWhnWlG/HVwWKGw0ldW9xR1vEul97okHAomiZb/h
         nFTA==
X-Gm-Message-State: AOAM533FM+CjF2TAzlSfXcWAo3NqliCY5wXCqGq1Ol2HTrRjE/R9AkxE
        fXb+2HmxxcJNL4UKfkQdYlEvyO6It+CZAjiHMmyPTMtJeWo=
X-Google-Smtp-Source: ABdhPJwgDW7QnFYaRXQx8WMqdI3IoaCx11UiPY/TY96xWHkzvW+86RsBX57z5zjgEHmwt2m4CJlWhRK0P1C2/0hu1wE=
X-Received: by 2002:a17:902:728e:b0:143:a388:868b with SMTP id
 d14-20020a170902728e00b00143a388868bmr108553260pll.33.1637589748634; Mon, 22
 Nov 2021 06:02:28 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-12-kernel@esmil.dk>
 <CACRpkdb0CrJ_uTbtfg-xGq8uu0AKoqfAB03mF2CA_G8ys_8Lzg@mail.gmail.com>
 <CANBLGcwvGptHxP5+JQEQV1Y7G=dNTt86QuVgfUuvQDDBfNrzOA@mail.gmail.com> <CACRpkdbsP1zibFvg2yL67ndQJ1MxBRmH5j+cZ-giZkmrnGROdw@mail.gmail.com>
In-Reply-To: <CACRpkdbsP1zibFvg2yL67ndQJ1MxBRmH5j+cZ-giZkmrnGROdw@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Mon, 22 Nov 2021 15:02:17 +0100
Message-ID: <CANBLGcyWGeYUk_RcL6rhmu4608bP7LQ35o-B5FiNckQUDJ83Wg@mail.gmail.com>
Subject: Re: [PATCH v3 11/16] dt-bindings: pinctrl: Add StarFive JH7100 bindings
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        soc@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 22 Nov 2021 at 00:19, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Nov 12, 2021 at 12:04 AM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Tue, 9 Nov 2021 at 01:46, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > > As it appears to have some cross dependencies I assume
> > > it will be merged through the SoC tree?
> >
> > I don't know. I've never tried this before, so whatever is easiest I
> > guess. Do I do anything special other than cc'ing soc@kernel.org for
> > v4 to make that happen?
>
> You create a pull request with git request-pull and sent it to
> soc@vger.kernel.org and linux-arm-kernel on Cc that should
> work fine and it appears here:
> https://patchwork.kernel.org/project/linux-soc/list/

Thanks. I'm just waiting for Palmer to ack the riscv bits then I'll do that.

/Emil
