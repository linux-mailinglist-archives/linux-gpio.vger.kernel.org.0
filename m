Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21B627AEEB5
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Sep 2023 16:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234969AbjIZOoY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 26 Sep 2023 10:44:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234950AbjIZOoX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Sep 2023 10:44:23 -0400
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E886F101;
        Tue, 26 Sep 2023 07:44:16 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-59e77e4f707so108567687b3.0;
        Tue, 26 Sep 2023 07:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695739456; x=1696344256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivyZHRBgAcyVi68nE2bpnhz+CC5mnJuOpqgFaju5LfE=;
        b=Z6Mb42gQhMV63Z42pDaqMqd6CYwKaEM8Tbg/GS9rKy9DJpkP/7XBiB0bP8vPdJOHrT
         pWLUxzqmLY+jKEbN7duAXMKAFXWI7FPLwRHt3RexZm0DgLGq7MB5oJK48s6UB4KEFM9A
         dCHWZmyPhc/mkx1xB2lWn0mF8y0YNvfuwmIWk+8KEXs7dFmuUHrUH0fbfCqOd2jX8ldc
         0JUynAPTZNafb8jZl4o0mOeSJHR8FZ3Auw0G6z+/aUFnbw7FZGmLuTVrImRLTT4b4Gg6
         1vq7O3szugR887tmzxF0UFtCXXftnvGZ6aXccJKddEL441/R5bxHLwJtQgQYPr48OWw/
         IgoQ==
X-Gm-Message-State: AOJu0Yxy8YmV3+lnl9MxPbNJm222mIdq6lZSkjtpxIofPisOA/8k8oqV
        07olPEuD4JQ4vYp4srtWWZe3UgNmvJ0s9Q==
X-Google-Smtp-Source: AGHT+IGa5Jo9kJDHGXIFdHHPnQGaIArnecMrPDAH9XvmvJxbK+ZhjCjymTogMAHfIDKCN4JZ8V85EQ==
X-Received: by 2002:a0d:d1c3:0:b0:58a:83cd:115d with SMTP id t186-20020a0dd1c3000000b0058a83cd115dmr7781934ywd.50.1695739455915;
        Tue, 26 Sep 2023 07:44:15 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id d133-20020a814f8b000000b0058fb9863fe7sm3008430ywb.103.2023.09.26.07.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 07:44:14 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-59e77e4f707so108566047b3.0;
        Tue, 26 Sep 2023 07:44:13 -0700 (PDT)
X-Received: by 2002:a0d:e603:0:b0:570:28a9:fe40 with SMTP id
 p3-20020a0de603000000b0057028a9fe40mr9000567ywe.5.1695739453342; Tue, 26 Sep
 2023 07:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230912045157.177966-1-claudiu.beznea.uj@bp.renesas.com>
 <20230912045157.177966-10-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVNzgHqURohOgpFEaGn+6+rQTqsDomoS1u_-jn=GgmHXw@mail.gmail.com> <dfe64c7c-2f90-65a2-05fc-e96ec5113a60@tuxon.dev>
In-Reply-To: <dfe64c7c-2f90-65a2-05fc-e96ec5113a60@tuxon.dev>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Sep 2023 16:44:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJ_gp5cdGpcK-kGk16YGDX8d9MEjQQkSobOGLphbJ5dQ@mail.gmail.com>
Message-ID: <CAMuHMdXJ_gp5cdGpcK-kGk16YGDX8d9MEjQQkSobOGLphbJ5dQ@mail.gmail.com>
Subject: Re: [PATCH 09/37] clk: renesas: rzg2l: fix computation formula
To:     claudiu beznea <claudiu.beznea@tuxon.dev>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        ulf.hansson@linaro.org, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        magnus.damm@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        biju.das.jz@bp.renesas.com, quic_bjorande@quicinc.com,
        arnd@arndb.de, konrad.dybcio@linaro.org, neil.armstrong@linaro.org,
        nfraprado@collabora.com, rafal@milecki.pl,
        wsa+renesas@sang-engineering.com,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Claudiu,

On Tue, Sep 26, 2023 at 1:47 PM claudiu beznea <claudiu.beznea@tuxon.dev> wrote:
> On 14.09.2023 15:55, Geert Uytterhoeven wrote:
> > On Tue, Sep 12, 2023 at 6:52 AM Claudiu <claudiu.beznea@tuxon.dev> wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> According to hardware manual of RZ/G2L (r01uh0914ej0130-rzg2l-rzg2lc.pdf)
> >> the computation formula for PLL rate is as follows:
> >>
> >> Fout = ((m + k/65536) * Fin) / (p * 2^s)
> >>
> >> and k has values in range [-32768, 32767]. Dividing k by 65536 with
> >> integer variables leads all the time to zero. Thus we may have slight
> >> differences b/w what has been set vs. what is displayed. Thus,
> >> get rid of this and decompose the formula before dividing k by 65536.
> >>
> >> Fixes: ef3c613ccd68a ("clk: renesas: Add CPG core wrapper for RZ/G2L SoC")
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> >> --- a/drivers/clk/renesas/rzg2l-cpg.c
> >> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> >> @@ -696,18 +696,22 @@ static unsigned long rzg2l_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
> >>         struct pll_clk *pll_clk = to_pll(hw);
> >>         struct rzg2l_cpg_priv *priv = pll_clk->priv;
> >>         unsigned int val1, val2;
> >> -       unsigned int mult = 1;
> >> -       unsigned int div = 1;
> >> +       unsigned int div;
> >> +       u64 rate;
> >> +       s16 kdiv;
> >>
> >>         if (pll_clk->type != CLK_TYPE_SAM_PLL)
> >>                 return parent_rate;
> >>
> >>         val1 = readl(priv->base + GET_REG_SAMPLL_CLK1(pll_clk->conf));
> >>         val2 = readl(priv->base + GET_REG_SAMPLL_CLK2(pll_clk->conf));
> >> -       mult = MDIV(val1) + KDIV(val1) / 65536;
> >> +       kdiv = KDIV(val1);
> >>         div = PDIV(val1) << SDIV(val2);
> >>
> >> -       return DIV_ROUND_CLOSEST_ULL((u64)parent_rate * mult, div);
> >> +       rate = (u64)MDIV(val1) * parent_rate;
> >> +       rate += ((long long)parent_rate * kdiv) / 65536;
> >
> > As the division is a binary shift, you can use the mul_u64_u32_shr() helper,
> > and incorporate the sdiv shift at the same time:
> >
> >     rate += mul_u64_u32_shr(parent_rate, KDIV(val1), 16 + SDIV(val2));

 [1]^

> >
> > You can save a multiplication by premultiplying mdiv by 65536:
> >
> >     rate = mul_u64_u32_shr(parent_rate, (MDIV(val1) << 16)) + KDIV(val1),
> >                            16 + SDIV(val2));

[2]^

>
> Looking again at this: KDIV (aka DIV_K) could have negative values thus
> mul_u64_u32_shr() cannot be used here.

That means you can indeed not use [1].

But you can still use [2], as MDIV() must be in the range 64..533[3],
so "(MDIV(val1) << 16)) + (s16)KDIV(val1)" is always positive.
Note that you do need the cast to s16 (which I had missed before), or
the intermediate variable kdiv of type s16 (like in your patch).

[3] As the current PLL driver is read-only, there is no calculation or
    validation of the PLL parameters.

> >> +
> >> +       return DIV_ROUND_CLOSEST_ULL(rate, div);
> >
> > return DIV_ROUND_CLOSEST_ULL(rate, PDIV(val1));

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
