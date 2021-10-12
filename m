Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB89142AA4F
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 19:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbhJLRLM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 13:11:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbhJLRLK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 13:11:10 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8CE9C061570;
        Tue, 12 Oct 2021 10:09:08 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id t16so2101326eds.9;
        Tue, 12 Oct 2021 10:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ETBlO0R7ftFoQf331hVqlj1UmmT4m6MaJEZrp8aaMUI=;
        b=H4bbH1wue/tDYUXhbNmTeFVFOJ5I+RECXE8zhADA7HY8NzNeFa0rDHOGK5cchjHHfq
         V/ZNyvecT/VlCowZNtV50RrwYjmRf81vKCp1PxzuPdiuc0rovzuBZvXHl/DzLUaCwuS+
         95gEAH9q7qRIr0YYtRUhC564Lg1eytaIiQMMABos1Rt40ZHzUkgEQfUTydXKKo5txFHn
         9z93Hc/KZw7qzNo9AXlkvsrWePJQ9kvwfoPWDOuQ78iam9vHx2q3ccRpJvSNebFTHWGA
         xnrI52v+jWUSzlaxMMwHJxb6Sp3tDWrK907OcVbBJ4bukvkCiX+vl3QqnzktT+3XwT0b
         9oAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ETBlO0R7ftFoQf331hVqlj1UmmT4m6MaJEZrp8aaMUI=;
        b=JRIUXkMv9zEwU+S5haWWITJnH6etcCyZ/KDUPwI8vnT73uxpopPRoPzeKQE/Yrc2CN
         ZrcwcwfB5Go03yvS7yI+tjtufItwW7YVHYAn9b/IbwYgyZx/fjjuyuCkNW+MO9waCY6o
         kKRa6z/sPw4ftk15/JXkHfKBm6o1s0Qy559Dg9qR7bzLaVXKQKLwNVHzRSF+GEHzMQaT
         ELFk7Asro6zdP3uLN3S1UQPtZJQXJD2zucGFzpr+OODjdheLBkcqIrW7KIunc55e7vju
         1Aa713SkaVBS7Vpq0yPi9uQzdysdY12ki7C/V33OAf0SddwXpKoZVfcvgaRSmvHBwlag
         F6EA==
X-Gm-Message-State: AOAM53041+R8BfzYMER9iieNSem24vBWFc2guSQ88XGSHRscl6Ojz3YU
        KJ8L/BtDofr09zgL222lJNZLSOolN64cK8USHHs=
X-Google-Smtp-Source: ABdhPJxvT7gKhdGGRY0SC1Yseo5/vsnz0N9pv27Y7/5CAWbNCOg+5Po82HIaAqdBMiFuLXb1gHVqtXFBYtIE9pPXE5c=
X-Received: by 2002:a17:906:a158:: with SMTP id bu24mr5301651ejb.356.1634058546919;
 Tue, 12 Oct 2021 10:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk> <20211012134027.684712-15-kernel@esmil.dk>
In-Reply-To: <20211012134027.684712-15-kernel@esmil.dk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 12 Oct 2021 23:08:19 +0300
Message-ID: <CAHp75Vfw+G5TC+gcS1aBEd9dTjzbQG6rYdXPFg0ua3dMtWP4Uw@mail.gmail.com>
Subject: Re: [PATCH v1 14/16] serial: 8250_dw: Add skip_clk_set_rate quirk
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
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
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 12, 2021 at 4:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> On the StarFive JH7100 SoC the uart core clocks can't be set to exactly
> 16 * 115200Hz and many other common bitrates. Trying this will only
> result in a higher input clock, but low enough that the uart's internal
> divisor can't come close enough to the baud rate target. So rather than
> try to set the input clock it's better to rely solely on the uart's
> internal divisor.

s/uart/UART/g

...

>         unsigned int            skip_autocfg:1;
>         unsigned int            uart_16550_compatible:1;
> +       unsigned int            skip_clk_set_rate:1;

Keep skip_* bitfields grouped.

...

> +       if (!d->skip_clk_set_rate) {

I believe you have to rebase this patch on top of tty/tty-next.
Besides that, please, avoid indentation changes, i.e. refactor your
patch accordgingly.

>         }

-- 
With Best Regards,
Andy Shevchenko
