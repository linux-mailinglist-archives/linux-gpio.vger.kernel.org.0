Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9E6B2D0DC9
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 11:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgLGKG7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 05:06:59 -0500
Received: from mail-oo1-f66.google.com ([209.85.161.66]:35437 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgLGKG6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 05:06:58 -0500
Received: by mail-oo1-f66.google.com with SMTP id y3so3060775ooq.2;
        Mon, 07 Dec 2020 02:06:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3o65lWvKXLx22mP9fGZFAjPDNpAakTg+X2w8WmirPtY=;
        b=VIK7hKveeFNHGUj5PhqyGixXdRO0KRQDqubNv0UW03vRIuphMG8oqN7PredEiN51RI
         OnoS8aE0MvHcu2RqO8pu8ydrzuBBq4QiOGnb04qnAtCtMxBr9EFAHLcrGUUcXz/2taAx
         yK8qsm43dKt0PJsDm2o44EHIzKDIzfN8Lt6l/jOHU4CYUSbaqgpWbE6ywCB1mcVmJLfB
         M64R7J06Jay8SMj2owuewL6j1ebsycu2Krq8iqa+UL2vI25jG0K2/0jZFa0jCubi8rUf
         RNpEtRRfMJkXQwA4IsFLmIwuMoh85FY06hGjBzCpcqod14xy9khhb6GjJ1jK6O+083K6
         Wl0w==
X-Gm-Message-State: AOAM531ZUSa1OBV1Kbv/Kf+lbj73apkWEPaVO82anH1Vd3qQPKfTr9oj
        Y2GXRIW5Ok/CGiymbl+GBg5jZciLPVMqaBpmupQ=
X-Google-Smtp-Source: ABdhPJzTKqcJrThdz/nA6gncybgfM+58Ofe6twXGdz2kRPvH7jqE61lPq8SXKeJwWBaKvSLIyqks6NxqnPlklBKvvH0=
X-Received: by 2002:a4a:abc9:: with SMTP id o9mr12287505oon.1.1607335577695;
 Mon, 07 Dec 2020 02:06:17 -0800 (PST)
MIME-Version: 1.0
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
 <20201202032500.206346-12-damien.lemoal@wdc.com> <160714919628.1580929.1456162330322523777@swboyd.mtv.corp.google.com>
 <b5eb9c289fe58119185550bff7228501d95b730e.camel@wdc.com> <CAMuHMdX+grQf=naU76Edvhbjap3BEayjDs_Rhkoy4FFfOZcTZw@mail.gmail.com>
 <CH2PR04MB652207D253E79755D87F55DAE7CE0@CH2PR04MB6522.namprd04.prod.outlook.com>
In-Reply-To: <CH2PR04MB652207D253E79755D87F55DAE7CE0@CH2PR04MB6522.namprd04.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Dec 2020 11:06:06 +0100
Message-ID: <CAMuHMdUVfaWSY1Ohn-_VtOzG1VeQrDCfhHTtkahXy8HsGOTS1Q@mail.gmail.com>
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

On Mon, Dec 7, 2020 at 10:55 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> On 2020/12/07 17:44, Geert Uytterhoeven wrote:
> > On Mon, Dec 7, 2020 at 4:52 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> >> I prepared a v5 series addressing your comments (and other comments).
> >> I will post that later today after some more tests.
> >
> > Thanks, already looking at k210-sysctl-v18...
> >
> >> On Fri, 2020-12-04 at 22:19 -0800, Stephen Boyd wrote:
> >>>> --- /dev/null
> >>>> +++ b/drivers/clk/clk-k210.c
> >
> >>>> +       in0_clk = of_clk_get(np, 0);
> >>>> +       if (IS_ERR(in0_clk)) {
> >>>> +               pr_warn("%pOFP: in0 oscillator not found\n", np);
> >>>> +               hws[K210_CLK_IN0] =
> >>>> +                       clk_hw_register_fixed_rate(NULL, "in0", NULL,
> >>>> +                                                  0, K210_IN0_RATE);
> >>>> +       } else {
> >>>> +               hws[K210_CLK_IN0] = __clk_get_hw(in0_clk);
> >>>> +       }
> >>>> +       if (IS_ERR(hws[K210_CLK_IN0])) {
> >>>> +               pr_err("%pOFP: failed to get base oscillator\n", np);
> >>>> +               goto err;
> >>>> +       }
> >>>> +
> >>>> +       in0 = clk_hw_get_name(hws[K210_CLK_IN0]);
> >>>> +       aclk_parents[0] = in0;
> >>>> +       pll_parents[0] = in0;
> >>>> +       mux_parents[0] = in0;
> >>>
> >>> Can we use the new way of specifying clk parents so that we don't have
> >>> to use __clk_get_hw(), of_clk_get(), and clk_hw_get_name()? Hopefully
> >>> the core can handl that all instead of this driver.
> >>
> >> I removed all this by adding:
> >>
> >> clock-output-names = "in0";
> >>
> >> to the DT fixed-rate oscillator clock node (and documented that too). Doing so,
> >> clk_hw_get_name(), __clk_get_hw() and of_clk_get() are not needed anymore and
> >> the parents clock names arrays do not need run-time update.
> >
> > "clock-output-names" is deprecated for clocks with a single output:
> > the clock name will be taken from the node name.
>
> Arg. I missed that.
>
> > However, relying on a clock name like this is fragile.
> > Instead, your driver should use the phandle from the clocks property,
> > using of_clk_get_by_name() or of_clk_get().
>
> That is what all versions before V5 used. But Stephen mentioned that the driver
> should not, if possible, use of_clk_get()/__clk_get_name(). Hence the change.
> Easy to revert back.
>
> > Stephen: I'm a bit puzzled, as you suggest _not_ using of_clk_get()?
>
> Another solution to this would be to simply remove the fixed-rate clock node
> from the DT and have the k210 clock driver unconditionally create that clock
> (that is one line !). That actually may be even more simple than the previous
> version, albeit at the cost of having the DT not being a perfect description of
> the hardware. I am fine with that though.
>
> Thoughts ?

If there's an external crystal, DT should describe it.
Does the K210 support different crystal frequencies?

Anyway, I'm very interested in what the (new) proper way of handling this
is...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
