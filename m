Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05E387C6106
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 01:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233898AbjJKXTs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 19:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376539AbjJKXTs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 19:19:48 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 500AEF5
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 16:19:38 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-27736c2a731so258696a91.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 16:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697066377; x=1697671177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7sXSYGeD1Ulz8sa7/3++MxVxhYAPIleK6QJVBE+xOo=;
        b=s4vAS0BkWD6fVZBkkqrRVBKZO4dcxdhoNjFoe6nXjwUeFmGaxb7R3AYZqX10frU5Bb
         oWZrev3tno7yYlUNTohI2Bb2yvCHVj6PKNVDavIGrYFeFBv3OPTu7VmuAPAAYFVUrhoz
         8c3H4Bp8bTO7pgy+PuzjweU9Dp964oDSNKU3gjclpB6o8jU4dc0fIyt7iwgVfIfEMfsg
         9eRMK99AKpHo1BR5XwxhoartolMst2oo8rtXBnbmL20iwcTNPEOf4MlUdtjEJXXV2Nlr
         0SzIAsoCbqG+EWIiMxGj4XBEz2dx+mOd2wrMUFmZyUDaFYtN6LP90ynFH0FGuN61dTsO
         bYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697066377; x=1697671177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7sXSYGeD1Ulz8sa7/3++MxVxhYAPIleK6QJVBE+xOo=;
        b=s7NvBDECpyuuzCLXcWKftt3HmM4cYjJqfXyRsQgNLK2rcdD56xwK/5/DSk7Qqy/B5y
         fDSpWAkshXIbureSZYlHb7zKlueAohIiSAhK+D6Dm06H4yx6jbHb/RdjBYW+JbUzpz7W
         PTTwOjkaLvpvSGnZwcw5qSaiSHfOXEgUmNlyqGBbJ4kEOqwl06n9oWSjRqbh+LMB8gZ8
         tqyvBgOmiMIssiHwCxKOxmki/z7KTPO3OIyQD99g4VD7Jn1JGYl7PRFYuxhT2Nj8GM5x
         GoqKpLipXH1nFRMJ6WsAX9Sku+5Nm7esPgxrx2PRTeCGfJVXWUzRfu7aAtuoJ95qRNzk
         vs9A==
X-Gm-Message-State: AOJu0Yx4PSprAARgNe4+ayVexjq/Wtq+WmQ9EIpjoPQLBKtzc0gPWk9Z
        J/FZPEh5iPBlVeDduLgD6jy6WeanTZL0pUHN1GB1RA==
X-Google-Smtp-Source: AGHT+IHvL+bbhmKDuK4Xj6D62jFyDDy2/T5qTqff65dUSGMhE1YdBYUcRmNMYPOiaGYDXSzv3kq1lrobPLTj8pwu88I=
X-Received: by 2002:a17:90a:f6d7:b0:27c:edf3:d045 with SMTP id
 er23-20020a17090af6d700b0027cedf3d045mr5447584pjb.40.1697066376694; Wed, 11
 Oct 2023 16:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-10-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-10-peter.griffin@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 11 Oct 2023 18:19:25 -0500
Message-ID: <CAPLW+4nmonxdLCWEZy15attd5ULUfL0VgZf5YQzFBA_0bvUwUw@mail.gmail.com>
Subject: Re: [PATCH v3 09/20] clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> These plls are found in the Tensor gs101 SoC found in the Pixel 6.
>
> pll0516x: Integer PLL with high frequency
> pll0517x: Integer PLL with middle frequency
> pll0518x: Integer PLL with low frequency
>
> PLL0516x
> FOUT =3D (MDIV * 2 * FIN)/PDIV * 2^SDIV)
>
> PLL0517x and PLL0518x
> FOUT =3D (MDIV * FIN)/PDIV*2^SDIV)
>
> The PLLs are similar enough to pll_0822x that the same code can handle
> both. The main difference is the change in the fout formula for the
> high frequency 0516 pll.
>
> Locktime for 516,517 & 518 is 150 the same as the pll_0822x lock factor.
> MDIV, SDIV PDIV masks and bit shifts are also the same as 0822x.
>
> When defining the PLL the "con" parameter should be set to CON3
> register, like this
>
> PLL(pll_0517x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
>     PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0,
>     NULL),
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/clk/samsung/clk-pll.c | 9 ++++++++-
>  drivers/clk/samsung/clk-pll.h | 3 +++
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.=
c
> index 74934c6182ce..4ef9fea2a425 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -442,7 +442,11 @@ static unsigned long samsung_pll0822x_recalc_rate(st=
ruct clk_hw *hw,
>         pdiv =3D (pll_con3 >> PLL0822X_PDIV_SHIFT) & PLL0822X_PDIV_MASK;
>         sdiv =3D (pll_con3 >> PLL0822X_SDIV_SHIFT) & PLL0822X_SDIV_MASK;
>
> -       fvco *=3D mdiv;
> +       if (pll->type =3D=3D pll_0516x)
> +               fvco =3D fvco * 2 * mdiv;
> +       else
> +               fvco *=3D mdiv;
> +

Can be written like this I guess:

       fvco *=3D mdiv;
       if (pll->type =3D=3D pll_0516x)
              fvco *=3D 2;

if you think it's more neat. Other than that:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>         do_div(fvco, (pdiv << sdiv));
>
>         return (unsigned long)fvco;
> @@ -1316,6 +1320,9 @@ static void __init _samsung_clk_register_pll(struct=
 samsung_clk_provider *ctx,
>         case pll_1417x:
>         case pll_0818x:
>         case pll_0822x:
> +       case pll_0516x:
> +       case pll_0517x:
> +       case pll_0518x:
>                 pll->enable_offs =3D PLL0822X_ENABLE_SHIFT;
>                 pll->lock_offs =3D PLL0822X_LOCK_STAT_SHIFT;
>                 if (!pll->rate_table)
> diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.=
h
> index 0725d485c6ee..ffd3d52c0dec 100644
> --- a/drivers/clk/samsung/clk-pll.h
> +++ b/drivers/clk/samsung/clk-pll.h
> @@ -38,6 +38,9 @@ enum samsung_pll_type {
>         pll_0822x,
>         pll_0831x,
>         pll_142xx,
> +       pll_0516x,
> +       pll_0517x,
> +       pll_0518x,
>  };
>
>  #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
> --
> 2.42.0.655.g421f12c284-goog
>
>
