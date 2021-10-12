Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A90442A8A1
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 17:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237521AbhJLPm7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 11:42:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237529AbhJLPm4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 11:42:56 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 519A2C06174E;
        Tue, 12 Oct 2021 08:40:54 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id r18so1070519edv.12;
        Tue, 12 Oct 2021 08:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5vws6sMTfuIUpw/tvRD3yV733Vt/oKMHzkN1nuZ1vds=;
        b=W3xuWRdAGjqLW7kMpsg6EzCDJGX+u7T8LbQwJnFITwMyQKXIV+thrIH5pReBwQgCq7
         ZH3X6jKa7UFFPcWtOPWMdXDrEIQfxZbduQGtKW/O1ZeJXRM+F0wPKEXurRE8B+iQzPhu
         yG9dxc1aY8Y2KeK8Okq0cbZ1o81PJjEN7HDbJRnKeDcsH196twyl9vgszt3TrTvBMllb
         6sfbgEGN5xJG5zuEGjWoUvBhLhPLnXRI/u/l+xQb4n4my06ipQuykRARukvF814i8gjs
         0xfxNnpUv/thnQA1nh0ufzM6D/6UMWw46n3n/Zl2y6XXLnqA5DE958HXKXJgKufKp87P
         am8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5vws6sMTfuIUpw/tvRD3yV733Vt/oKMHzkN1nuZ1vds=;
        b=b79y5g2IUsI7Oen662XjeD+d/wIjkYtngOFpWEGufZLO9kONwe2V4MuY5URbiPtFFf
         fffV04QOpcWzYLOhdOEjiZH7Ghm3JgDM2FpXTJ5Cw/V451n1wx49vTPo5/jMJX++n5Hj
         db0bt2hWdeyBhX3RnReGQNhc/FG2qY8VWxuX8F3+uRZke04n2T9b3nIWViPEePZiYCfE
         ma0MzZvqwCEPgvex9lAj7jFQwmN7X793Nu1rSB3phZqfvItIxi2qYA0hI2Oc+Ckvm1j2
         5K3DaDioXK0BXId6AEIzYuM2d6LGqkniLflOw4xGqJjkSQhT+VB08ht94zME4AgHKx+/
         Atxg==
X-Gm-Message-State: AOAM531B/eY/53zKnPPIKtBwHeAwp1DBiYJJ771slyQA+9VBcvllQq5V
        LkHmjUJ94LribG/b9bi2gGqCKtntzlMUefsoswM=
X-Google-Smtp-Source: ABdhPJw6b5/cDVnUDUOYGlubY3IK7TXocmkqeO4rQjOPiQyeiygR8kyVW5V7QbJJvYNkBUvVfw6qvUxO0QlwIkcVXcQ=
X-Received: by 2002:a50:e00b:: with SMTP id e11mr651595edl.359.1634053252589;
 Tue, 12 Oct 2021 08:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk> <20211012134027.684712-7-kernel@esmil.dk>
In-Reply-To: <20211012134027.684712-7-kernel@esmil.dk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 12 Oct 2021 21:40:05 +0300
Message-ID: <CAHp75Vetqi=FMoRxfXHL+d1DhAXgLr+5e7ss1M_Rkhqa07H5Jg@mail.gmail.com>
Subject: Re: [PATCH v1 06/16] clk: starfive: Add JH7100 clock generator driver
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
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
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 12, 2021 at 4:42 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> From: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Add a driver for the StarFive JH7100 clock generator.

...

> +config CLK_STARFIVE_JH7100
> +       bool "StarFive JH7100 clock support"
> +       depends on SOC_STARFIVE || COMPILE_TEST

> +       depends on OF

Why? I haven't found a compile dependency, so you reduce the test
scope (when COMPILE_TEST=y).

...

You are using
bits.h
mod_devicetable.h
which are not here

> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/debugfs.h>
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/overflow.h>
> +#include <linux/platform_device.h>

...

> +       value |= readl_relaxed(reg) & ~mask;

value is not masked, is it okay?

Usual pattern for this kind of operations is

value = (current & ~mask) | (value & mask);

> +       writel_relaxed(value, reg);

...

> +       if (div > max)
> +               div = max;
> +
> +       return div;

return min(div, max); ?

...

> +       rate = parent / div;
> +       if (rate < req->min_rate && div > 1) {
> +               div -= 1;
> +               rate = parent / div;
> +       }

Seems like homegrown DIV_ROUND_UP() or so. Who will guarantee that
decreasing div by 1 will satisfy the conditional again?

...

> +#ifdef CONFIG_DEBUG_FS

Perhaps __maybe_unused?

> +#else
> +#define jh7100_clk_debug_init NULL
> +#endif

...

> +       if (idx >= JH7100_CLK_END) {

> +               dev_err(priv->dev, "%s: invalid index %u\n", __func__, idx);

__func__ means that the message has no value on its own. Make it
unique without using __func__, or drop completely.

> +               return ERR_PTR(-EINVAL);
> +       }

...

> +       for (idx = 0; idx < JH7100_CLK_PLL0_OUT; idx++) {
> +               struct clk_init_data init = {
> +                       .name = jh7100_clk_data[idx].name,
> +                       .ops = jh7100_clk_data[idx].ops,

> +                       .num_parents = ((jh7100_clk_data[idx].max & JH7100_CLK_MUX_MASK)
> +                                       >> JH7100_CLK_MUX_SHIFT) + 1,

With temporary variable this can be better written, or consider
something like this

                       .num_parents =
                               ((jh7100_clk_data[idx].max &
JH7100_CLK_MUX_MASK) >> JH7100_CLK_MUX_SHIFT) + 1,

> +                       .flags = jh7100_clk_data[idx].flags,
> +               };
> +               struct jh7100_clk *clk = &priv->reg[idx];

...

> +       while (idx > 0)
> +               clk_hw_unregister(&priv->reg[--idx].hw);

The

       while (idx--)
               clk_hw_unregister(&priv->reg[idx].hw);

is slightly better to read.

> +       return ret;
> +}

...

> +static int __init clk_starfive_jh7100_init(void)
> +{
> +       return platform_driver_probe(&clk_starfive_jh7100_driver,
> +                                    clk_starfive_jh7100_probe);
> +}

> +

No need to have this blank line.
> +subsys_initcall(clk_starfive_jh7100_init);

Any  explanation why subsys_initcall() is in use?

-- 
With Best Regards,
Andy Shevchenko
