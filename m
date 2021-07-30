Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA0F43DBBD1
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 17:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239412AbhG3PMq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 11:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239348AbhG3PMp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 11:12:45 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F154C06175F;
        Fri, 30 Jul 2021 08:12:39 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id mt6so15664954pjb.1;
        Fri, 30 Jul 2021 08:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DiREYRtexA0I7S1KnqFrcLIiv/74eDGMLWe+dU114C0=;
        b=JMMDofxBypjNtHZUFLmtUfIxq6MocEIgnaCq+ez7fM6xZgmpF0wJmMuG7dUNZkwrl+
         Qxpu8JAOs90quA8Lg1Ax+FdKJ4ucO9pQ42IBVmiLNS3wKF6WC5caf5K2Aps7R+1+d4FT
         z5fe7akHfjIUQ0lmzafj/roOEe3mTvbceCeSolkw5+ECl81M19Ulg2Wy+Khvr/gBhbfp
         6d6g2+YO2n67Qn5XIXDS8so8n0euGnnSMAduYc7WBVdvc6PGCXfRJpNTFj/6GCIJQv7k
         LHqWLzbIzudgq2A4o5geF9EwVRk48F9dou7EnrIwYAJS8wfrYuawZESi75hYBSqx7WOn
         sfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DiREYRtexA0I7S1KnqFrcLIiv/74eDGMLWe+dU114C0=;
        b=NL8HmsDQdo8tD199QGkTw/tZiXiqmOssz1yny4YAxG/Z/gV9jFwTd27evBJ1kgRt1g
         iqY3yTwHLjXcfRvj0bLyP31UeRCJotW0wz2AjHzawznCqLTeDrGJQaRQDlurf4COfDrb
         f7JDOKMPF389rprq7st63x8LFB2YSXwN2WWat34aZ7anooovO6lDNiAEXiVbESl0NtIL
         WQmZajpp0K8wX2wyqIJ9kUjfhCColSzTfIgHGy5ZQV8FaaHG9YEZwwWY34Xj40mPGX2S
         UtTcSBhY9RYYcn+/qCgRbVAyl4PQbV112q9AqF9aG7O7ze9uln66SVpzShNq9l4LXaRg
         CJAQ==
X-Gm-Message-State: AOAM530dzR+N7I0qcqOhBJeCvyxBGzPyVq/M+erXai3MWY55aQSd4mnZ
        qKTHoAlV5v7T9xoqWB5x0ljgqObGdyRxc95y/xE=
X-Google-Smtp-Source: ABdhPJzZSDH5uc43hERebvJdjVFz5phkw7dcWmRs7gzFR8fSgvsEMdnv/WC92UEdmil1uI6T6wK/nbJLBIsVQelxwWw=
X-Received: by 2002:a05:6a00:2ba:b029:3b0:9ade:afb1 with SMTP id
 q26-20020a056a0002bab02903b09adeafb1mr1413120pfs.73.1627657958462; Fri, 30
 Jul 2021 08:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210730144922.29111-1-semen.protsenko@linaro.org> <20210730144922.29111-11-semen.protsenko@linaro.org>
In-Reply-To: <20210730144922.29111-11-semen.protsenko@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 30 Jul 2021 18:11:58 +0300
Message-ID: <CAHp75VdzXXM64CoS3P9f=8e3hwOa-vY44+s6sqOhBmNCTFxtYQ@mail.gmail.com>
Subject: Re: [PATCH 10/12] clk: samsung: Add Exynos850 clock driver stub
To:     Sam Protsenko <semen.protsenko@linaro.org>
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

On Fri, Jul 30, 2021 at 5:51 PM Sam Protsenko
<semen.protsenko@linaro.org> wrote:
>
> For now it's just a stub driver to make serial driver work. Later it

make the serial

> will be implemented properly.
>
> This driver doesn't really change clocks, only registers the UART clock
> as a fixed-rate clock. Without this clock driver the UART driver won't
> work, as it's trying to obtain "uart" clock and fails if it's not able
> to.


> From drivers/tty/serial/samsung_tty.c:
>
> 8<------------------------------------------------------------------->8
>     ourport->clk = clk_get(&platdev->dev, "uart");
>     if (IS_ERR(ourport->clk)) {
>         pr_err("%s: Controller clock not found\n",
>                 dev_name(&platdev->dev));
>         ret = PTR_ERR(ourport->clk);
>         goto err;
>     }
> 8<------------------------------------------------------------------->8

This is not needed in the commit message.

> In order to get functional serial console we have to implement that

get a functional

> minimal clock driver with "uart" clock. It's not necessary to actually
> configure clocks, as those are already configured in bootloader, so
> kernel can rely on that for now.

> 80 column limit is broken here to make checkpatch happy, otherwise it
> swears about incorrect __initconst usage.

Again, no need to be in the commit message, use the comment field for
this (after the cutter '---' line below).


> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/clk/samsung/Makefile        |  1 +
>  drivers/clk/samsung/clk-exynos850.c | 63 +++++++++++++++++++++++++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 drivers/clk/samsung/clk-exynos850.c
>
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> index 028b2e27a37e..c46cf11e4d0b 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK) += clk-exynos5433.o
>  obj-$(CONFIG_EXYNOS_AUDSS_CLK_CON) += clk-exynos-audss.o
>  obj-$(CONFIG_EXYNOS_CLKOUT)    += clk-exynos-clkout.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-exynos7.o
> +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-exynos850.o
>  obj-$(CONFIG_S3C2410_COMMON_CLK)+= clk-s3c2410.o
>  obj-$(CONFIG_S3C2410_COMMON_DCLK)+= clk-s3c2410-dclk.o
>  obj-$(CONFIG_S3C2412_COMMON_CLK)+= clk-s3c2412.o
> diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
> new file mode 100644
> index 000000000000..3192ec9bb90b
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-exynos850.c
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2019 Samsung Electronics Co., Ltd.
> + * Copyright (C) 2021 Linaro Ltd.
> + *
> + * Common Clock Framework support for Exynos850 SoC.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clkdev.h>
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>

+ blank line?

> +#include <dt-bindings/clock/exynos850.h>
> +
> +#include "clk.h"
> +
> +/* Fixed rate clocks generated outside the SoC */
> +static struct samsung_fixed_rate_clock exynos850_fixed_rate_ext_clks[] __initdata = {
> +       FRATE(OSCCLK, "fin_pll", NULL, 0, 26000000),
> +};
> +
> +/*
> + * Model the UART clock as a fixed-rate clock for now, to make serial driver
> + * work. This clock is already configured in the bootloader.
> + */
> +static const struct samsung_fixed_rate_clock exynos850_peri_clks[] __initconst = {
> +       FRATE(DOUT_UART, "DOUT_UART", NULL, 0, 200000000),
> +};
> +
> +static const struct of_device_id ext_clk_match[] __initconst = {

> +       { .compatible = "samsung,exynos850-oscclk", .data = (void *)0 },

0 is the default for static variables.

> +       {},

No comma needed for the terminator lines.

> +};
> +
> +void __init exynos850_clk_init(struct device_node *np)
> +{
> +       void __iomem *reg_base;
> +       struct samsung_clk_provider *ctx;

> +       if (!np)
> +               panic("%s: unable to determine soc\n", __func__);

Check for the sake of additional code?

> +       reg_base = of_iomap(np, 0);

This will fail when np == NULL.

> +       if (!reg_base)
> +               panic("%s: failed to map registers\n", __func__);
> +
> +       ctx = samsung_clk_init(np, reg_base, CLK_NR_CLKS);
> +       if (!ctx)
> +               panic("%s: unable to allocate ctx\n", __func__);
> +
> +       samsung_clk_of_register_fixed_ext(ctx,
> +                       exynos850_fixed_rate_ext_clks,
> +                       ARRAY_SIZE(exynos850_fixed_rate_ext_clks),
> +                       ext_clk_match);
> +
> +       samsung_clk_register_fixed_rate(ctx, exynos850_peri_clks,
> +                       ARRAY_SIZE(exynos850_peri_clks));
> +
> +       samsung_clk_of_add_provider(np, ctx);
> +}
> +
> +CLK_OF_DECLARE(exynos850_clk, "samsung,exynos850-clock", exynos850_clk_init);


-- 
With Best Regards,
Andy Shevchenko
