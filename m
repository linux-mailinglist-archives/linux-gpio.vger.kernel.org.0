Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAFE57CCE4E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 22:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235016AbjJQUjm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 16:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234143AbjJQUjm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 16:39:42 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8017292
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 13:39:39 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-65b162328edso35699896d6.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 13:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697575178; x=1698179978; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XA1skjAgHjdCnqisORMj4wpVmNxlLSwRWz+H3/RjpJo=;
        b=kxEuL/2GwvpkzB7xAIT6KFwv6Omi5zuwHYy8Z8vu/aryxvxaiDa+3af6p4i/tIOzE3
         gQHw79+RwVooLEUbODzSqRrUpUiehxVeLGvA4UxHAuQwggMlEcc63avcgQrlrCrbSCNl
         rbuRX0N7gkbgC9T98TxcjJ9IsqRipR1b0CubyZn7TBI6RsX0Wuy0axSrSBD3PYyo/CW1
         JxilSmFmgX4yCgOaqZ3j0TUiFULtOjOzoh6Pu6JlW91v+kTH7nEPdRiI5lcZT59n4R0p
         wmVKTiPB7+cifR98lPjZxi7Lv3KX2qv/yns5hI0CJx2xGloth38jwIKLXbE/YuMRWLDj
         dWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697575178; x=1698179978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XA1skjAgHjdCnqisORMj4wpVmNxlLSwRWz+H3/RjpJo=;
        b=TYbKENvYpu9AeKLX4zlooD+FVxQ7PBGFCfKfQQJA8FyfLGaOSzIwSsTQAQO+EBedaJ
         UYRzMKG4fIq4MH9LXjv123jQNWsY5BIePNBymqzLxnYb8mtiQfjMeeVusdLY9IoQpvug
         MsfC8S7dGqffkNKaQShcmE39NJuemXIZktjm4qRvN2gy30qwQ1cpEooBS7xrvje7g6kF
         QCEGmgfmzhH4UasIuefSeAq2hzGMxO7UbpGgqGTOoTSKd8UIR+McRVLbE1QYT/bdhAQ+
         pVpiw6xjODTlUgAG5ygxlPS7pwUe74vl+t3e5xA02uUVJCej5RWPKgFp3R4o6Nb8H0tW
         MUWQ==
X-Gm-Message-State: AOJu0Yw28HcXgjt3d37VcxDim9srWS6gq2n+MCIRmRcTTTjNUuniWZ+2
        jsQ5cqLOv0mvoYdxsUS+jaep8P1+JYWjyDt/i7OYMQ==
X-Google-Smtp-Source: AGHT+IG0jZyX5mwItbRNqua2+caVQuoRBxev+i2K+Vc8lTvA4KemQ/ckZaqEBKGa2oMjPe/6P4JpungwpD5qkdU5/AQ=
X-Received: by 2002:ad4:5ae8:0:b0:64f:49d1:3fe7 with SMTP id
 c8-20020ad45ae8000000b0064f49d13fe7mr4054747qvh.23.1697575178600; Tue, 17 Oct
 2023 13:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-10-peter.griffin@linaro.org> <ef25ed87-f065-4a75-9e57-1f1073d9c805@kernel.org>
In-Reply-To: <ef25ed87-f065-4a75-9e57-1f1073d9c805@kernel.org>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Tue, 17 Oct 2023 21:39:27 +0100
Message-ID: <CADrjBPqHKG84k0YDMzKcxdLJL-Vcp2HqTPm9vMWYnmZBYNX2Pw@mail.gmail.com>
Subject: Re: [PATCH v3 09/20] clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
To:     Chanwoo Choi <chanwoo@kernel.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 17 Oct 2023 at 09:52, Chanwoo Choi <chanwoo@kernel.org> wrote:
>
> On 23. 10. 12. 03:48, Peter Griffin wrote:
> > These plls are found in the Tensor gs101 SoC found in the Pixel 6.
> >
> > pll0516x: Integer PLL with high frequency
> > pll0517x: Integer PLL with middle frequency
> > pll0518x: Integer PLL with low frequency
> >
> > PLL0516x
> > FOUT = (MDIV * 2 * FIN)/PDIV * 2^SDIV)
> >
> > PLL0517x and PLL0518x
> > FOUT = (MDIV * FIN)/PDIV*2^SDIV)
> >
> > The PLLs are similar enough to pll_0822x that the same code can handle
> > both. The main difference is the change in the fout formula for the
> > high frequency 0516 pll.
> >
> > Locktime for 516,517 & 518 is 150 the same as the pll_0822x lock factor.
> > MDIV, SDIV PDIV masks and bit shifts are also the same as 0822x.
> >
> > When defining the PLL the "con" parameter should be set to CON3
> > register, like this
> >
> > PLL(pll_0517x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
> >     PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0,
> >     NULL),
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/clk/samsung/clk-pll.c | 9 ++++++++-
> >  drivers/clk/samsung/clk-pll.h | 3 +++
> >  2 files changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> > index 74934c6182ce..4ef9fea2a425 100644
> > --- a/drivers/clk/samsung/clk-pll.c
> > +++ b/drivers/clk/samsung/clk-pll.c
> > @@ -442,7 +442,11 @@ static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
> >       pdiv = (pll_con3 >> PLL0822X_PDIV_SHIFT) & PLL0822X_PDIV_MASK;
> >       sdiv = (pll_con3 >> PLL0822X_SDIV_SHIFT) & PLL0822X_SDIV_MASK;
> >
> > -     fvco *= mdiv;
> > +     if (pll->type == pll_0516x)
> > +             fvco = fvco * 2 * mdiv;
> > +     else
> > +             fvco *= mdiv;
> > +
> >       do_div(fvco, (pdiv << sdiv));
> >
> >       return (unsigned long)fvco;
> > @@ -1316,6 +1320,9 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
> >       case pll_1417x:
> >       case pll_0818x:
> >       case pll_0822x:
> > +     case pll_0516x:
> > +     case pll_0517x:
> > +     case pll_0518x:
> >               pll->enable_offs = PLL0822X_ENABLE_SHIFT;
> >               pll->lock_offs = PLL0822X_LOCK_STAT_SHIFT;
> >               if (!pll->rate_table)
> > diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
> > index 0725d485c6ee..ffd3d52c0dec 100644
> > --- a/drivers/clk/samsung/clk-pll.h
> > +++ b/drivers/clk/samsung/clk-pll.h
> > @@ -38,6 +38,9 @@ enum samsung_pll_type {
> >       pll_0822x,
> >       pll_0831x,
> >       pll_142xx,
> > +     pll_0516x,
> > +     pll_0517x,
> > +     pll_0518x,
> >  };
> >
> >  #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
>
> I replied it with ack before. Again, reply it with ack.
>
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks Chanwoo. I will add that in v4
