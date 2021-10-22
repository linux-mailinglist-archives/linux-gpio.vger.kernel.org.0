Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 489CE437794
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 14:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbhJVM6Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 08:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232805AbhJVM6Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Oct 2021 08:58:25 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB45C061764;
        Fri, 22 Oct 2021 05:56:07 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id t16so5048563eds.9;
        Fri, 22 Oct 2021 05:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+qOi8f1v4+rJCxOKM/1lFt8oaZPEX6smhRzqey4rSCg=;
        b=YivvG/JsMBUvbb3Fs9tTmqksEjk8+rN0v5A+vUK4z8jS13RgQj58cSSwV7Hs+IWsGB
         adNRyKbM3yrg9wi18C8DLlOUORLq1BF4FYNWg7JzYi9UuIUeEq4Rn/rDkk/y1zhLxtEc
         aOJwG8ueEq8fZmlCGlZRCr1VCFNZmF0LBwCeNKdP2CPqZ8YkdZryhKGqdvn5XSpjL1oP
         4o6i1XlLhy5Ivwsx0XRyu4wrcaRPgu1kTvO9jQ+GdztgGf9HLtxndmPFXuqPLPJ6Ep1B
         hDkRcHpvS7zlSUe5S45XqZYbcF6yhFGCeBVedFGDj8jrOQeCynGBXo9ZCYD+Q7EnHKgo
         5Pew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+qOi8f1v4+rJCxOKM/1lFt8oaZPEX6smhRzqey4rSCg=;
        b=5+uTAOrr2V0dcaVJzZBFq07KW7zK7NmkyRwdwtaiARaSfz73n3ZxgLedNJdgSCcE33
         xsKyityjBnqQSTB2SAf3jTt3XUjh1D1Q0xdaYWAXKfWPftFNBwilaeQHj7qe1gdxAfoH
         HveW2bflwxYw9eH6MhI+w6Nvtub3vlCjjtwlyzuKcHub7IIng4wHQLh5JYWruMfWnqpw
         kPIHTBH3bdwWhTKtepq6wqfueuiyEVgqYvI3hFTic+u0Oeb7H2EMicbiW6AnyJM47C1Z
         idX1VBSMCDr09/3awkhzPErZG3HVj0hNUbt2Ta23hUKYV90LTEU89hFqmESnw62yeHkW
         97ng==
X-Gm-Message-State: AOAM532Q4yyAHXMJDDEFOxDdejELBl7sReiYReMuxZCtVmG54PNyRhWk
        IHK7LNQsA420HTBS2U1DXi9Qi+WWM0BQtftyME8=
X-Google-Smtp-Source: ABdhPJxjmbZn/mKzz2MeCcWBTlXcYFWWJdlvVwlzqH5Cmn9IpfIf34cJh9HoSyv6xIrG1HUL+9nURIo/Rrh/wNmzfU8=
X-Received: by 2002:a17:906:5a47:: with SMTP id my7mr14665000ejc.128.1634907366155;
 Fri, 22 Oct 2021 05:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-10-kernel@esmil.dk>
In-Reply-To: <20211021174223.43310-10-kernel@esmil.dk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 22 Oct 2021 15:55:10 +0300
Message-ID: <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
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

On Thu, Oct 21, 2021 at 8:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> Add a driver for the StarFive JH7100 reset controller.

...

> +config RESET_STARFIVE_JH7100
> +       bool "StarFive JH7100 Reset Driver"
> +       depends on SOC_STARFIVE || COMPILE_TEST

> +       depends on OF

No evidence of this dependency. Why to limit test coverage?

> +       default SOC_STARFIVE

...

> +/*
> + * Reset driver for the StarFive JH7100 SoC
> + *
> + * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>

> + *

Redundant empty line.

> + */

...

> +#include <linux/of_device.h>

No evidence of any usage of this header. Perhaps you meant mod_devicetable.h?

...

> +static const u32 jh7100_reset_asserted[4] = {

> +       BIT(JH7100_RST_U74 % 32) |
> +       BIT(JH7100_RST_VP6_DRESET % 32) |
> +       BIT(JH7100_RST_VP6_BRESET % 32),

It's hard to notice that this is only one entry. See also below.

> +       BIT(JH7100_RST_HIFI4_DRESET % 32) |
> +       BIT(JH7100_RST_HIFI4_BRESET % 32),
> +
> +       BIT(JH7100_RST_E24 % 32)

+ Comma.

> +};

Why all these ugly % 32 against constants?

...

> +       if (!assert)
> +               done ^= mask;

Can you convert this to simple

  if (assert)
    ret = readl_...
  else
    ret = readl_...

below?

> +       spin_lock_irqsave(&data->lock, flags);
> +
> +       value = readl(reg_assert);
> +       if (assert)
> +               value |= mask;
> +       else
> +               value &= ~mask;
> +       writel(value, reg_assert);

> +       /* if the associated clock is gated, deasserting might otherwise hang forever */
> +       ret = readl_poll_timeout(reg_status, value, (value & mask) == done, 0, 1000);

You run delays under spin lock. You need to use _atomic variant.

> +       spin_unlock_irqrestore(&data->lock, flags);

...

> +       u32 value = (readl(reg_status) ^ jh7100_reset_asserted[offset]) & mask;

> +       dev_dbg(rcdev->dev, "status(%lu) = %d\n", id, !value);
> +       return !value;

Dup of ! operator. Can it be value = !(...); above?

-- 
With Best Regards,
Andy Shevchenko
