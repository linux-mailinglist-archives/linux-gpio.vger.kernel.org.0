Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 309CB2D0BEF
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 09:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgLGIol (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 03:44:41 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42849 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbgLGIol (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 03:44:41 -0500
Received: by mail-ot1-f65.google.com with SMTP id 11so11772698oty.9;
        Mon, 07 Dec 2020 00:44:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lDfLeyiGUVNCa3NdIdBr2x/jMgSf/H+Z78nqjlzXWBM=;
        b=J2hN4u6U2gJWQOGdej5Ts8hltZ7/Yed0y5CkrmGWGgZySvpV4zRyutPF+I/BwGLDRi
         3C9Gj+IkYGVgQI4VjI+eSZIe1EpfT7i1lBPVKHjJ1OBq7nfW9WhNfvLq1+6jJLMqdyAc
         NCbYMiiEkAVHbfOMNHebmbJu05RwT7qZGITkTgQiSRd8rSt3GJcaVtDYIraKHqQVtbBG
         pO5teyB5OtPd0jRzHWa9C6CGHBXxdIApR0XL5rQWA4mWNl3IdKSec2p/lq2bT2vJLvni
         JANxYRYLrWiKn3Xe1wIzvtSA+mzokZJVUBB9r+VMjslp6wIDF+CCIWqzjCB7oRWocIYa
         kXEw==
X-Gm-Message-State: AOAM53210mGBeNx8L/R0E85yWFD2fHxqWa61IjXL7XoORJ8ilN2laFl8
        ayPb8IOdHgDZ048NUygE9xE0daIgM5s6+d5OgKY=
X-Google-Smtp-Source: ABdhPJz3F618tGQ+G8xttqsIo3X7QtPrBpfqy0tddGagSvKa3lbHtQAsUEeeyRDDYw11Hf5ZojwaoyzWHaAY0bkCXD0=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr12384022oth.250.1607330640141;
 Mon, 07 Dec 2020 00:44:00 -0800 (PST)
MIME-Version: 1.0
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
 <20201202032500.206346-12-damien.lemoal@wdc.com> <160714919628.1580929.1456162330322523777@swboyd.mtv.corp.google.com>
 <b5eb9c289fe58119185550bff7228501d95b730e.camel@wdc.com>
In-Reply-To: <b5eb9c289fe58119185550bff7228501d95b730e.camel@wdc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Dec 2020 09:43:49 +0100
Message-ID: <CAMuHMdX+grQf=naU76Edvhbjap3BEayjDs_Rhkoy4FFfOZcTZw@mail.gmail.com>
Subject: Re: [PATCH v4 11/21] riscv: Add Canaan Kendryte K210 clock driver
To:     Damien Le Moal <Damien.LeMoal@wdc.com>
Cc:     "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "seanga2@gmail.com" <seanga2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Damien,

On Mon, Dec 7, 2020 at 4:52 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> I prepared a v5 series addressing your comments (and other comments).
> I will post that later today after some more tests.

Thanks, already looking at k210-sysctl-v18...

> On Fri, 2020-12-04 at 22:19 -0800, Stephen Boyd wrote:
> > > --- /dev/null
> > > +++ b/drivers/clk/clk-k210.c

> > > +       in0_clk = of_clk_get(np, 0);
> > > +       if (IS_ERR(in0_clk)) {
> > > +               pr_warn("%pOFP: in0 oscillator not found\n", np);
> > > +               hws[K210_CLK_IN0] =
> > > +                       clk_hw_register_fixed_rate(NULL, "in0", NULL,
> > > +                                                  0, K210_IN0_RATE);
> > > +       } else {
> > > +               hws[K210_CLK_IN0] = __clk_get_hw(in0_clk);
> > > +       }
> > > +       if (IS_ERR(hws[K210_CLK_IN0])) {
> > > +               pr_err("%pOFP: failed to get base oscillator\n", np);
> > > +               goto err;
> > > +       }
> > > +
> > > +       in0 = clk_hw_get_name(hws[K210_CLK_IN0]);
> > > +       aclk_parents[0] = in0;
> > > +       pll_parents[0] = in0;
> > > +       mux_parents[0] = in0;
> >
> > Can we use the new way of specifying clk parents so that we don't have
> > to use __clk_get_hw(), of_clk_get(), and clk_hw_get_name()? Hopefully
> > the core can handl that all instead of this driver.
>
> I removed all this by adding:
>
> clock-output-names = "in0";
>
> to the DT fixed-rate oscillator clock node (and documented that too). Doing so,
> clk_hw_get_name(), __clk_get_hw() and of_clk_get() are not needed anymore and
> the parents clock names arrays do not need run-time update.

"clock-output-names" is deprecated for clocks with a single output:
the clock name will be taken from the node name.
However, relying on a clock name like this is fragile.
Instead, your driver should use the phandle from the clocks property,
using of_clk_get_by_name() or of_clk_get().

Stephen: I'm a bit puzzled, as you suggest _not_ using of_clk_get()?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
