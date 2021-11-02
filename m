Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27358443690
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 20:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbhKBTp6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 15:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230361AbhKBTp5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 15:45:57 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B38C061714;
        Tue,  2 Nov 2021 12:43:20 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id r4so1374382edi.5;
        Tue, 02 Nov 2021 12:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ceu22Dc39UeKUUHkFo8E6TEFnBT5pBoF+8MRYhui+3g=;
        b=iL9ZdMGpiEq08FDiyAvoxoALZriK6r3TSAAvJPOItnzqnE834kvOqkBw4kyHzjlRgw
         hwojMrQb148XuOqrV7AjcG+H0RoTRQS8uAZ3Azmzz8vXs99IaiQzln+ZbxHTV20Za7K/
         sdLjOXP0y9PbUG2/IBzv6PLoiX418Q9ppI6hPCaBRrf1p7j6y3LeO0m46ulrsleuDhB6
         7KlijIokOrLyjaRYKaBLH7ugQMl+wkWnrqB4M3tEkcGGjyLIoFCa6XYuy2BgVG8X8H+t
         N9/xnLKZUGsHgw/zra7e0WQsxiHTNdryMfLdqcKCoFZDTMijIuI7DL3lreiERhI1VO69
         SqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ceu22Dc39UeKUUHkFo8E6TEFnBT5pBoF+8MRYhui+3g=;
        b=n/v0jYVgwnEorjPOsyilVn589aJncLkGVdzht5MMS1DrTkVEpbYnB4IyfjDmEp3ANH
         OPS8TCpCYBbcY3cYO+rpDKp2lVPKy66Hur1eMyYYlGXEP1cuLvit1xTNlIzCTku+XzHo
         ZJLphkDezb3MzY8tYVZkyuPJvXfAb+anb0K5aRbbIt86ei15pRK8QJkOP3MYzNugePhs
         cQwA3/c3O5vbQeCS5eYBzbMEpLsFB9G1Xeqp0ygeCBgEFELf2h5o3zqLB0/ELVQlGspr
         96tOb0nzAa74eGWumBRF/1euOJdzmzBZetviSftFr9Z9Pc5F7V2gHYIllLfM0jm8fxlA
         UIgQ==
X-Gm-Message-State: AOAM531zTIev5zsdy8sPRPXYkTIrBqGTGsis7SRCG/euPrHvLVi2Vptv
        UN3nRPmmllmMFhdj9IvYy/P+ENkp8NB7LSOPYhA=
X-Google-Smtp-Source: ABdhPJx9QGKRGz3j6D7SSykvvgSu5AJJRydl2DbJOG2BUnaKZeBT7ctk5NcVsU1upIedOx7rpLMKjvjWoEYUwxGTUhY=
X-Received: by 2002:a17:906:a158:: with SMTP id bu24mr44829165ejb.356.1635882199443;
 Tue, 02 Nov 2021 12:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-10-kernel@esmil.dk>
In-Reply-To: <20211102161125.1144023-10-kernel@esmil.dk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Nov 2021 21:42:30 +0200
Message-ID: <CAHp75Ve-P8DR00mtRP_NkrXgB4nsZ+qBkgBen94iTcPqxQYUOg@mail.gmail.com>
Subject: Re: [PATCH v3 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To:     Emil Renner Berthing <kernel@esmil.dk>,
        Yury Norov <yury.norov@gmail.com>
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
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

+Cc: Yury (bitmap expert)

On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> Add a driver for the StarFive JH7100 reset controller.

...

> +#define BIT_MASK32(x) BIT((x) % 32)

Possible namespace collision.

...

> +/*
> + * the registers work like a 32bit bitmap, so writing a 1 to the m'th bit of
> + * the n'th ASSERT register asserts line 32n + m, and writing a 0 deasserts the
> + * same line.
> + * most reset lines have their status inverted so a 0 in the STATUS register
> + * means the line is asserted and a 1 means it's deasserted. a few lines don't
> + * though, so store the expected value of the status registers when all lines
> + * are asserted.
> + */

Besides missing capitalization, if it sounds like bitmap, use bitmap.
I have checked DT definitions and it seems you don't even need the
BIT_MASK() macro,

> +static const u32 jh7100_reset_asserted[4] = {
> +       /* STATUS0 register */
> +       BIT_MASK32(JH7100_RST_U74) |
> +       BIT_MASK32(JH7100_RST_VP6_DRESET) |
> +       BIT_MASK32(JH7100_RST_VP6_BRESET),
> +       /* STATUS1 register */
> +       BIT_MASK32(JH7100_RST_HIFI4_DRESET) |
> +       BIT_MASK32(JH7100_RST_HIFI4_BRESET),
> +       /* STATUS2 register */
> +       BIT_MASK32(JH7100_RST_E24),
> +       /* STATUS3 register */
> +       0,
> +};

Yury, do we have any clever (clean) way to initialize a bitmap with
particular bits so that it will be a constant from the beginning? If
no, any suggestion what we can provide to such users?

...

> +       dev_dbg(rcdev->dev, "reset(%lu)\n", id);

These debug messages are useless since one should use ftrace facility instead,

-- 
With Best Regards,
Andy Shevchenko
