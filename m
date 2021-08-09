Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7756B3E4C69
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Aug 2021 20:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235628AbhHISwX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Aug 2021 14:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235668AbhHISwW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Aug 2021 14:52:22 -0400
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A7B4C06179B
        for <linux-gpio@vger.kernel.org>; Mon,  9 Aug 2021 11:52:01 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id u138so326497vku.7
        for <linux-gpio@vger.kernel.org>; Mon, 09 Aug 2021 11:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d/b2tS7YMRHPjI6VGiV4WlYzcCT+N2pnoJeTL1fGmn8=;
        b=x+VgKgaGdpHjdkRUURCM+NYQxSTBy0MkPCmpbM3VIbSGIOsKT8McvVHvOqpCfPDp7H
         M4W8cRoidhuJJ6xT+Q0fvemdLheGyBHuuf5PbDY/5f/gJVpiXvdbLy8wi5Fwg9b41XRO
         y0nFK2KV9XPrj+MkW1Ph1EeavmWj8Yhtfftbfkr0al6WVOiySz908r+BA0cssptNHJQc
         6Z4Rfg52GaKWJPr5qdvIIg51iZXrOjEC+yV4RslNN/Crz2zsd1wfyKnhglVo780qMky2
         4hfrfphfWh78WUlxasiDzHL7OqWsWdhaRa6FjMADzGi5pnL3DD5vxXq06vA/PITiesQu
         WXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d/b2tS7YMRHPjI6VGiV4WlYzcCT+N2pnoJeTL1fGmn8=;
        b=BpXf4RSKTZa3gT+TbEcA407rtTjrzilw1ICkY9wPuvKWswJ/mQ8WOsDV30AnFmSPRe
         sJO1mG8pK23yhWBu10zI9VBmkAc2DQzgcKar5MWOzU/mDm4W/jRSQfNE+7DhktZQ8CJn
         xz1XqZBtAmXdobzmJNwTk/TEhSdLr51a+TMPPVXYpfP157xAs/cbUdyApjMNBGAvjnGN
         O3A8xyfHzswkE0DjEIRkBNYXj/Ac8CFOwqch7S02E2YmBq6nJv4Ex/VE8flw215t0wWN
         nGTzvZ47xsnddOXOoHrtw+9jLwxAuwEYTwo2kj4+0tF4nKE6eu5u11eJ1ZUSdjsDpAAm
         mcyg==
X-Gm-Message-State: AOAM532sfwMRVMQueJZ5EgCZPl307FJ+nnklSF2QAb9yOJiQPxSZEaLa
        VHnnv9QQJT8Ll7U2rzaAwWanw/48VvJL0Gv/Au5Z7w==
X-Google-Smtp-Source: ABdhPJztTV7fFHE7DAa32TUbP4AmYOxZsrntgIge/gVbMCQBwXCNWE/Kq/pQ1JbUoXC+yXA/gvcXiKD7IlttIEP5jKE=
X-Received: by 2002:a1f:6203:: with SMTP id w3mr15362595vkb.24.1628535120427;
 Mon, 09 Aug 2021 11:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210806152146.16107-1-semen.protsenko@linaro.org>
 <20210806152146.16107-8-semen.protsenko@linaro.org> <7110b1e2-1aee-6ddf-803f-ee392e494f2d@canonical.com>
In-Reply-To: <7110b1e2-1aee-6ddf-803f-ee392e494f2d@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 9 Aug 2021 21:51:48 +0300
Message-ID: <CAPLW+4=yK-dfWjKjLEOKL2o2sG1eyqSNqgVCnQNYvbUHo+Om4w@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] clk: samsung: Add Exynos850 clock driver stub
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
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

On Mon, 9 Aug 2021 at 13:55, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 06/08/2021 17:21, Sam Protsenko wrote:
> > For now it's just a stub driver to make the serial driver work. Later it
> > will be implemented properly. This driver doesn't really change clocks,
> > only registers the UART clock as a fixed-rate clock. Without this clock
> > driver the UART driver won't work, as it's trying to obtain "uart" clock
> > and fails if it's not able to.
>
> You know that as temporary solution you can add necessary clocks
> directly in your DTS as fixed-rate-clocks? Effect would be quite similar
> to the one here for UART driver but instead adding some temporary code
> you would add temporary DTS nodes and references.
>
> I am fine with this approach although the binding (if ever defined...)
> would need to be marked as experimental.
>

Let's keep this driver then. My next step would be implementing the
proper clk driver, so this review would be a good starting point for
me. I will, of course, address your other comments.

> >
> > In order to get a functional serial console we have to implement that
> > minimal clock driver with "uart" clock. It's not necessary to actually
> > configure clocks, as those are already configured in bootloader, so
> > kernel can rely on that for now.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> > Changes in v2:
> >   - Used hard coded clock indexes, as clock bindings were removed; will
> >     add clock bindings back (reimplemented) once proper clock driver is
> >     ready
> >   - Removed .data = 0 for exynos850-oscclk, as it's in BSS section
> >   - Removed comma for terminator {}
> >   - Made exynos850_clk_init() static
> >   - Removed checking np for NULL, as it's already done in of_iomap()
> >
> >  drivers/clk/samsung/Makefile        |  1 +
> >  drivers/clk/samsung/clk-exynos850.c | 64 +++++++++++++++++++++++++++++
> >  2 files changed, 65 insertions(+)
> >  create mode 100644 drivers/clk/samsung/clk-exynos850.c
> >
> > diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> > index 028b2e27a37e..c46cf11e4d0b 100644
> > --- a/drivers/clk/samsung/Makefile
> > +++ b/drivers/clk/samsung/Makefile
> > @@ -17,6 +17,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)       += clk-exynos5433.o
> >  obj-$(CONFIG_EXYNOS_AUDSS_CLK_CON) += clk-exynos-audss.o
> >  obj-$(CONFIG_EXYNOS_CLKOUT)  += clk-exynos-clkout.o
> >  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)        += clk-exynos7.o
> > +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)        += clk-exynos850.o
> >  obj-$(CONFIG_S3C2410_COMMON_CLK)+= clk-s3c2410.o
> >  obj-$(CONFIG_S3C2410_COMMON_DCLK)+= clk-s3c2410-dclk.o
> >  obj-$(CONFIG_S3C2412_COMMON_CLK)+= clk-s3c2412.o
> > diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
> > new file mode 100644
> > index 000000000000..36c7c7fe7cf0
> > --- /dev/null
> > +++ b/drivers/clk/samsung/clk-exynos850.c
> > @@ -0,0 +1,64 @@
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
> > +
> > +#include "clk.h"
> > +
> > +/* Will be extracted to bindings header once proper clk driver is implemented */
> > +#define OSCCLK               1
> > +#define DOUT_UART    2
> > +#define CLK_NR_CLKS  3
> > +
> > +/* Fixed rate clocks generated outside the SoC */
> > +static struct samsung_fixed_rate_clock exynos850_fixed_rate_ext_clks[] __initdata = {
> > +     FRATE(OSCCLK, "fin_pll", NULL, 0, 26000000),
> > +};
> > +
> > +/*
> > + * Model the UART clock as a fixed-rate clock for now, to make serial driver
> > + * work. This clock is already configured in the bootloader.
> > + */
> > +static const struct samsung_fixed_rate_clock exynos850_peri_clks[] __initconst = {
> > +     FRATE(DOUT_UART, "DOUT_UART", NULL, 0, 200000000),
> > +};
> > +
> > +static const struct of_device_id ext_clk_match[] __initconst = {
> > +     { .compatible = "samsung,exynos850-oscclk" },
> > +     {}
> > +};
> > +
> > +static void __init exynos850_clk_init(struct device_node *np)
> > +{
> > +     void __iomem *reg_base;
> > +     struct samsung_clk_provider *ctx;
> > +
> > +     reg_base = of_iomap(np, 0);
> > +     if (!reg_base)
> > +             panic("%s: failed to map registers\n", __func__);
> > +
> > +     ctx = samsung_clk_init(np, reg_base, CLK_NR_CLKS);
> > +     if (!ctx)
> > +             panic("%s: unable to allocate ctx\n", __func__);
>
> Not needed, the samsung_clk_init() panics or returns valid memory.
>

Done. Btw, I noticed that similar check is present in clk-exynos5433.c.

> > +
> > +     samsung_clk_of_register_fixed_ext(ctx,
> > +                     exynos850_fixed_rate_ext_clks,
> > +                     ARRAY_SIZE(exynos850_fixed_rate_ext_clks),
> > +                     ext_clk_match);
> > +
> > +     samsung_clk_register_fixed_rate(ctx, exynos850_peri_clks,
> > +                     ARRAY_SIZE(exynos850_peri_clks));
> > +
> > +     samsung_clk_of_add_provider(np, ctx);
> > +}
> > +
> > +CLK_OF_DECLARE(exynos850_clk, "samsung,exynos850-clock", exynos850_clk_init);
> >
>
> Best regards,
> Krzysztof
