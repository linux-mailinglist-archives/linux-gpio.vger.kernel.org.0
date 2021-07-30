Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE383DBDA6
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 19:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbhG3RYd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 13:24:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229773AbhG3RYc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 13:24:32 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5FF8C06175F
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 10:24:27 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id n15so4275698uaj.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 10:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3faiOjuxSUtf88Wfr7yQ9xzOu5k/v1bkY2et82KSWbE=;
        b=XNysvuze1jRxWGpD2oNpIxG59TcJSMQeIO02tnyko9KPqKzfZ6eUT+5gUgNHKiJ0KY
         FzR95voEVIHwEgLurq+1WuS8cuCAbW0YkPCKnvcJNxtd27AI6j9R1a8LO1wHQ38nDqix
         8MfFAIqTLSmX+dxe64WknBms+7WNoUJJCvrIH/Jkz8vN2KAnrN62cTHvKvstqA/bXP3e
         h4RvbqBbqefPd7hBu4OzXuThy4cnDBjDSf3ckhISFrYLPawPCw2iaQHKaMxb2QXgkM1H
         CqYOtIKOJtqGarlmLIkS1nir0x8q6SsNbMqo9VccX5mNXF4JaX0VLeKax66Kx1//H7vm
         ARbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3faiOjuxSUtf88Wfr7yQ9xzOu5k/v1bkY2et82KSWbE=;
        b=eaQblrklzHdbY4IS0U/BxNLGWL+SsOuvT3UAfMdJK1TGaemSQux1YA8TbK1GmEi3nU
         VAQkF1c7sKCxNVFKqyP/NDfeqb/RBzviJngqBSJJoUmpz31t66uT9aNq+9kxJ+7qtkru
         XzSLvzgIj4lu0VD3pzcI4tSlwYvgDuq1UrfI3ci5cZd60sOdeDw+MJP5sZ4dgBiNbBDY
         prFkJJzfXBeMDGVqVX6FlkDhs5XWiwhFgbxvjVuxFdR5cnMo2/zVQcYdGGsAWncQwef8
         woEq3EYWKT2g5FDrh0EJVe9ocgGiWM/O10C0uhWybpaZeh8Kf2OHoxXDosND8HRHo0u0
         c92g==
X-Gm-Message-State: AOAM5306IhsWe3wGdgriRiUqGgNlZcbPmqoopf7hqomAhbt1J5LZ1+x9
        XDwpl4RfmtpIL2xLdbZNi/kP50kVHzATzKKvhvl3hg==
X-Google-Smtp-Source: ABdhPJzDAtkg/SOljbLu0z1HdBXSPg1EVFJlPAgQpf6kYOBWaGyp4zl8t9PkOdKTr1hXBM8wvPBOlEzIi/+yRxlUDEE=
X-Received: by 2002:ab0:5e92:: with SMTP id y18mr3203668uag.9.1627665866687;
 Fri, 30 Jul 2021 10:24:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-11-semen.protsenko@linaro.org> <CAHp75VdzXXM64CoS3P9f=8e3hwOa-vY44+s6sqOhBmNCTFxtYQ@mail.gmail.com>
In-Reply-To: <CAHp75VdzXXM64CoS3P9f=8e3hwOa-vY44+s6sqOhBmNCTFxtYQ@mail.gmail.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 30 Jul 2021 20:24:15 +0300
Message-ID: <CAPLW+4mv1EBckbCPJuwHtkXBjRX45KGdTw0aaC+c6fy5V5Ag6A@mail.gmail.com>
Subject: Re: [PATCH 10/12] clk: samsung: Add Exynos850 clock driver stub
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Fri, 30 Jul 2021 at 18:12, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> On Fri, Jul 30, 2021 at 5:51 PM Sam Protsenko
> <semen.protsenko@linaro.org> wrote:
> >
> > For now it's just a stub driver to make serial driver work. Later it
>
> make the serial
>
> > will be implemented properly.
> >
> > This driver doesn't really change clocks, only registers the UART clock
> > as a fixed-rate clock. Without this clock driver the UART driver won't
> > work, as it's trying to obtain "uart" clock and fails if it's not able
> > to.
>
>
> > From drivers/tty/serial/samsung_tty.c:
> >
> > 8<------------------------------------------------------------------->8
> >     ourport->clk = clk_get(&platdev->dev, "uart");
> >     if (IS_ERR(ourport->clk)) {
> >         pr_err("%s: Controller clock not found\n",
> >                 dev_name(&platdev->dev));
> >         ret = PTR_ERR(ourport->clk);
> >         goto err;
> >     }
> > 8<------------------------------------------------------------------->8
>
> This is not needed in the commit message.
>
> > In order to get functional serial console we have to implement that
>
> get a functional
>
> > minimal clock driver with "uart" clock. It's not necessary to actually
> > configure clocks, as those are already configured in bootloader, so
> > kernel can rely on that for now.
>
> > 80 column limit is broken here to make checkpatch happy, otherwise it
> > swears about incorrect __initconst usage.
>
> Again, no need to be in the commit message, use the comment field for
> this (after the cutter '---' line below).
>
>
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  drivers/clk/samsung/Makefile        |  1 +
> >  drivers/clk/samsung/clk-exynos850.c | 63 +++++++++++++++++++++++++++++
> >  2 files changed, 64 insertions(+)
> >  create mode 100644 drivers/clk/samsung/clk-exynos850.c
> >
> > diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> > index 028b2e27a37e..c46cf11e4d0b 100644
> > --- a/drivers/clk/samsung/Makefile
> > +++ b/drivers/clk/samsung/Makefile
> > @@ -17,6 +17,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK) += clk-exynos5433.o
> >  obj-$(CONFIG_EXYNOS_AUDSS_CLK_CON) += clk-exynos-audss.o
> >  obj-$(CONFIG_EXYNOS_CLKOUT)    += clk-exynos-clkout.o
> >  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-exynos7.o
> > +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-exynos850.o
> >  obj-$(CONFIG_S3C2410_COMMON_CLK)+= clk-s3c2410.o
> >  obj-$(CONFIG_S3C2410_COMMON_DCLK)+= clk-s3c2410-dclk.o
> >  obj-$(CONFIG_S3C2412_COMMON_CLK)+= clk-s3c2412.o
> > diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
> > new file mode 100644
> > index 000000000000..3192ec9bb90b
> > --- /dev/null
> > +++ b/drivers/clk/samsung/clk-exynos850.c
> > @@ -0,0 +1,63 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2019 Samsung Electronics Co., Ltd.
> > + * Copyright (C) 2021 Linaro Ltd.
> > + *
> > + * Common Clock Framework support for Exynos850 SoC.
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/clkdev.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
>
> + blank line?
>
> > +#include <dt-bindings/clock/exynos850.h>
> > +
> > +#include "clk.h"
> > +
> > +/* Fixed rate clocks generated outside the SoC */
> > +static struct samsung_fixed_rate_clock exynos850_fixed_rate_ext_clks[] __initdata = {
> > +       FRATE(OSCCLK, "fin_pll", NULL, 0, 26000000),
> > +};
> > +
> > +/*
> > + * Model the UART clock as a fixed-rate clock for now, to make serial driver
> > + * work. This clock is already configured in the bootloader.
> > + */
> > +static const struct samsung_fixed_rate_clock exynos850_peri_clks[] __initconst = {
> > +       FRATE(DOUT_UART, "DOUT_UART", NULL, 0, 200000000),
> > +};
> > +
> > +static const struct of_device_id ext_clk_match[] __initconst = {
>
> > +       { .compatible = "samsung,exynos850-oscclk", .data = (void *)0 },
>
> 0 is the default for static variables.
>
> > +       {},
>
> No comma needed for the terminator lines.
>
> > +};
> > +
> > +void __init exynos850_clk_init(struct device_node *np)
> > +{
> > +       void __iomem *reg_base;
> > +       struct samsung_clk_provider *ctx;
>
> > +       if (!np)
> > +               panic("%s: unable to determine soc\n", __func__);
>
> Check for the sake of additional code?
>
> > +       reg_base = of_iomap(np, 0);
>
> This will fail when np == NULL.
>

Thanks for the review! All your comments will be addressed in v2.

> > +       if (!reg_base)
> > +               panic("%s: failed to map registers\n", __func__);
> > +
> > +       ctx = samsung_clk_init(np, reg_base, CLK_NR_CLKS);
> > +       if (!ctx)
> > +               panic("%s: unable to allocate ctx\n", __func__);
> > +
> > +       samsung_clk_of_register_fixed_ext(ctx,
> > +                       exynos850_fixed_rate_ext_clks,
> > +                       ARRAY_SIZE(exynos850_fixed_rate_ext_clks),
> > +                       ext_clk_match);
> > +
> > +       samsung_clk_register_fixed_rate(ctx, exynos850_peri_clks,
> > +                       ARRAY_SIZE(exynos850_peri_clks));
> > +
> > +       samsung_clk_of_add_provider(np, ctx);
> > +}
> > +
> > +CLK_OF_DECLARE(exynos850_clk, "samsung,exynos850-clock", exynos850_clk_init);
>
>
> --
> With Best Regards,
> Andy Shevchenko
