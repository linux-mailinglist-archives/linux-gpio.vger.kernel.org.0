Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9EA542585F
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Oct 2021 18:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242790AbhJGQvA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 12:51:00 -0400
Received: from mail-vk1-f172.google.com ([209.85.221.172]:35817 "EHLO
        mail-vk1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242827AbhJGQu5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 12:50:57 -0400
Received: by mail-vk1-f172.google.com with SMTP id x207so3001307vke.2;
        Thu, 07 Oct 2021 09:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Up6UdFwhzposbg4H9ut/JLcTL23D6e7tCieOzpeku/0=;
        b=lCSJ/lM0nz2BFCID/H5ROFAxVsvNr7PyPBK6O6VhfHtWvi90T/FumxaTtEiPLPVyED
         yD4hsYrMhL93eNHhOcBrnIyguZyr3Ap3zHZCmrVaMa8ey77A2vhQqtrT1sp4Ux5Ql8/Y
         LJ8ibHhMubjFKBVCdDUTpkuVNGWZBcj9umhT7XI2ssMYWRf0Ps9Y0Oj2roxhPmt05NqI
         uaHYHnTwAHc6r1f17SZRxBVCV6LfgW1IL25t0mljQdFn2xM3VJjfBc1qx7iBQLxhDlUo
         SA8ACBNu+OOIo1yAO2Vw1hKp57PX0d7Nm361B1Ma6qWvhM5FavXapTVMNRZ62Zad7C7P
         QVwQ==
X-Gm-Message-State: AOAM533yngplMZoGmIPxwfjys2hzCosgrmW0DnlMggigwsPhaWowap8D
        4rFlLZhORiyxPXeDbIs2kRo2317K5+f/mYQ+ugw=
X-Google-Smtp-Source: ABdhPJyA6t3jxfMvRWdCsa+lUwNtwFfF2bxNMabGw6HaZw3e6raVQ2pEBn8DWnU8timiPkG8tLQ4KPzWvwUQzYyX0PE=
X-Received: by 2002:a1f:3a4b:: with SMTP id h72mr4755346vka.19.1633625343334;
 Thu, 07 Oct 2021 09:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210929211350.4226-1-nikita.yoush@cogentembedded.com>
In-Reply-To: <20210929211350.4226-1-nikita.yoush@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 Oct 2021 18:48:52 +0200
Message-ID: <CAMuHMdUvNM8Tu-+Ed0vjB2-_JUQe7ojUPbzJM=Vy1m_j31sNSg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: r8a779[56]x: add MediaLB pins
To:     Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Nikita,

On Wed, Sep 29, 2021 at 11:14 PM Nikita Yushchenko
<nikita.yoush@cogentembedded.com> wrote:
> From: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
>
> This adds pins, groups, and functions for MediaLB device on Renesas
> H3 and M3.
>
> Signed-off-by: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pfc-r8a77950.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a77950.c
> @@ -2369,6 +2369,14 @@ static const unsigned int intc_ex_irq5_mux[] = {
>         IRQ5_MARK,
>  };
>
> +/* - MLB+ ------------------------------------------------------------------- */
> +static const unsigned int mlb_3pin_pins[] = {
> +       RCAR_GP_PIN(5, 23), RCAR_GP_PIN(5, 24), RCAR_GP_PIN(5, 25),
> +};
> +static const unsigned int mlb_3pin_mux[] = {
> +       MLB_CLK_MARK, MLB_SIG_MARK, MLB_DAT_MARK,
> +};
> +
>  /* - MSIOF0 ----------------------------------------------------------------- */
>  static const unsigned int msiof0_clk_pins[] = {
>         /* SCK */
> @@ -3987,6 +3995,7 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
>         SH_PFC_PIN_GROUP(intc_ex_irq3),
>         SH_PFC_PIN_GROUP(intc_ex_irq4),
>         SH_PFC_PIN_GROUP(intc_ex_irq5),
> +       SH_PFC_PIN_GROUP(mlb_3pin),
>         SH_PFC_PIN_GROUP(msiof0_clk),
>         SH_PFC_PIN_GROUP(msiof0_sync),
>         SH_PFC_PIN_GROUP(msiof0_ss1),
> @@ -4380,6 +4389,10 @@ static const char * const intc_ex_groups[] = {
>         "intc_ex_irq5",
>  };
>
> +static const char * const mlb_3pin_groups[] = {
> +       "mlb_3pin",
> +};
> +
>  static const char * const msiof0_groups[] = {
>         "msiof0_clk",
>         "msiof0_sync",
> @@ -4709,6 +4722,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
>         SH_PFC_FUNCTION(i2c5),
>         SH_PFC_FUNCTION(i2c6),
>         SH_PFC_FUNCTION(intc_ex),
> +       SH_PFC_FUNCTION(mlb_3pin),
>         SH_PFC_FUNCTION(msiof0),
>         SH_PFC_FUNCTION(msiof1),
>         SH_PFC_FUNCTION(msiof2),

This part looks fine to me.

> diff --git a/drivers/pinctrl/renesas/pfc-r8a77951.c b/drivers/pinctrl/renesas/pfc-r8a77951.c
> index 84c0ea5d59c1..4e4e39640df4 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a77951.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a77951.c
> @@ -2453,6 +2453,14 @@ static const unsigned int intc_ex_irq5_mux[] = {
>         IRQ5_MARK,
>  };
>
> +/* - MLB+ ------------------------------------------------------------------- */
> +static const unsigned int mlb_3pin_pins[] = {
> +       RCAR_GP_PIN(5, 23), RCAR_GP_PIN(5, 24), RCAR_GP_PIN(5, 25),
> +};
> +static const unsigned int mlb_3pin_mux[] = {
> +       MLB_CLK_MARK, MLB_SIG_MARK, MLB_DAT_MARK,
> +};
> +
>  /* - MSIOF0 ----------------------------------------------------------------- */
>  static const unsigned int msiof0_clk_pins[] = {
>         /* SCK */
> @@ -4233,7 +4241,7 @@ static const unsigned int vin5_clk_mux[] = {
>  };
>
>  static const struct {
> -       struct sh_pfc_pin_group common[328];
> +       struct sh_pfc_pin_group common[329];

As MLB is not available on RZ/G2 SoCs, only on R-Car Gen3 SoCs, it should
be added to the automotive sections instead of the common sections.

This applies to pfc-r8a7796.c and pfc-r8a77965.c, too.

> --- a/drivers/pinctrl/renesas/pfc-r8a7796.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a7796.c
> @@ -2458,6 +2458,14 @@ static const unsigned int intc_ex_irq5_mux[] = {
>         IRQ5_MARK,
>  };
>
> +/* - MLB+ ------------------------------------------------------------------- */
> +static const unsigned int mlb_3pin_pins[] = {
> +       RCAR_GP_PIN(5, 23), RCAR_GP_PIN(5, 24), RCAR_GP_PIN(5, 25),
> +};
> +static const unsigned int mlb_3pin_mux[] = {
> +       MLB_CLK_MARK, MLB_SIG_MARK, MLB_DAT_MARK,
> +};
> +
>  /* - MSIOF0 ----------------------------------------------------------------- */
>  static const unsigned int msiof0_clk_pins[] = {
>         /* SCK */
> @@ -4301,6 +4309,7 @@ static const struct {
>                 SH_PFC_PIN_GROUP(intc_ex_irq3),
>                 SH_PFC_PIN_GROUP(intc_ex_irq4),
>                 SH_PFC_PIN_GROUP(intc_ex_irq5),
> +               SH_PFC_PIN_GROUP(mlb_3pin),

error: excess elements in array initializer [-Werror]

>                 SH_PFC_PIN_GROUP(msiof0_clk),
>                 SH_PFC_PIN_GROUP(msiof0_sync),
>                 SH_PFC_PIN_GROUP(msiof0_ss1),

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
